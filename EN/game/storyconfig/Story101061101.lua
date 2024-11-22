return {
	Play106111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 106111001
		arg_1_1.duration_ = 6.56666666666667

		local var_1_0 = {
			ja = 4.49966666666667,
			ko = 6.56666666666667,
			zh = 5.63266666666667,
			en = 4.99966666666667
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
				arg_1_0:Play106111002(arg_1_1)
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

			local var_4_2 = 0

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.C02b

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
					if iter_4_0 ~= "C02b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.C02b
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC02b = var_4_20.a
					arg_1_1.var_.alphaMatValueC02b = var_4_19
				end

				arg_1_1.var_.alphaOldValueC02b = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC02b, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueC02b then
					local var_4_24 = arg_1_1.var_.alphaMatValueC02b
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueC02b then
				local var_4_26 = arg_1_1.var_.alphaMatValueC02b
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
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

			local var_4_33 = 1.76666666666667

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 1.76666666666667
			local var_4_35 = 0.225

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[79].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2033")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(106111001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 9
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_35 or var_4_35 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_35 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42
					var_4_34 = var_4_34 + 0.3

					if var_4_42 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111001", "story_v_out_106111.awb") ~= 0 then
					local var_4_43 = manager.audio:GetVoiceLength("story_v_out_106111", "106111001", "story_v_out_106111.awb") / 1000

					if var_4_43 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_34
					end

					if var_4_38.prefab_name ~= "" and arg_1_1.actors_[var_4_38.prefab_name] ~= nil then
						local var_4_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_38.prefab_name].transform, "story_v_out_106111", "106111001", "story_v_out_106111.awb")

						arg_1_1:RecordAudio("106111001", var_4_44)
						arg_1_1:RecordAudio("106111001", var_4_44)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_106111", "106111001", "story_v_out_106111.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_106111", "106111001", "story_v_out_106111.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_45 = var_4_34 + 0.3
			local var_4_46 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_45) / var_4_46

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play106111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 106111002
		arg_7_1.duration_ = 6.933

		local var_7_0 = {
			ja = 4.033,
			ko = 6.933,
			zh = 6,
			en = 6.466
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
				arg_7_0:Play106111003(arg_7_1)
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

			local var_10_8 = "2033_tpose"

			if arg_7_1.actors_[var_10_8] == nil then
				local var_10_9 = Object.Instantiate(Asset.Load("Char/" .. var_10_8), arg_7_1.stage_.transform)

				var_10_9.name = var_10_8
				var_10_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_8] = var_10_9

				local var_10_10 = var_10_9:GetComponentInChildren(typeof(CharacterEffect))

				var_10_10.enabled = true

				local var_10_11 = GameObjectTools.GetOrAddComponent(var_10_9, typeof(DynamicBoneHelper))

				if var_10_11 then
					var_10_11:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_10.transform, false)

				arg_7_1.var_[var_10_8 .. "Animator"] = var_10_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_8 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_8 .. "LipSync"] = var_10_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_12 = arg_7_1.actors_["2033_tpose"].transform
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1.var_.moveOldPos2033_tpose = var_10_12.localPosition
			end

			local var_10_14 = 0.001

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14
				local var_10_16 = Vector3.New(0, 100, 0)

				var_10_12.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2033_tpose, var_10_16, var_10_15)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_12.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_12.localEulerAngles = var_10_18
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 then
				var_10_12.localPosition = Vector3.New(0, 100, 0)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_12.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_12.localEulerAngles = var_10_20
			end

			local var_10_21 = arg_7_1.actors_["1093ui_story"].transform
			local var_10_22 = 0

			if var_10_22 < arg_7_1.time_ and arg_7_1.time_ <= var_10_22 + arg_10_0 then
				arg_7_1.var_.moveOldPos1093ui_story = var_10_21.localPosition

				local var_10_23 = "1093ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_23 .. "Animator"].transform, true)
			end

			local var_10_24 = 0.001

			if var_10_22 <= arg_7_1.time_ and arg_7_1.time_ < var_10_22 + var_10_24 then
				local var_10_25 = (arg_7_1.time_ - var_10_22) / var_10_24
				local var_10_26 = Vector3.New(0, -1.11, -5.88)

				var_10_21.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1093ui_story, var_10_26, var_10_25)

				local var_10_27 = manager.ui.mainCamera.transform.position - var_10_21.position

				var_10_21.forward = Vector3.New(var_10_27.x, var_10_27.y, var_10_27.z)

				local var_10_28 = var_10_21.localEulerAngles

				var_10_28.z = 0
				var_10_28.x = 0
				var_10_21.localEulerAngles = var_10_28
			end

			if arg_7_1.time_ >= var_10_22 + var_10_24 and arg_7_1.time_ < var_10_22 + var_10_24 + arg_10_0 then
				var_10_21.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_10_29 = manager.ui.mainCamera.transform.position - var_10_21.position

				var_10_21.forward = Vector3.New(var_10_29.x, var_10_29.y, var_10_29.z)

				local var_10_30 = var_10_21.localEulerAngles

				var_10_30.z = 0
				var_10_30.x = 0
				var_10_21.localEulerAngles = var_10_30
			end

			local var_10_31 = 0

			if var_10_31 < arg_7_1.time_ and arg_7_1.time_ <= var_10_31 + arg_10_0 then
				arg_7_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_1")
			end

			local var_10_32 = 0

			if var_10_32 < arg_7_1.time_ and arg_7_1.time_ <= var_10_32 + arg_10_0 then
				arg_7_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_10_33 = 0
			local var_10_34 = 0.65

			if var_10_33 < arg_7_1.time_ and arg_7_1.time_ <= var_10_33 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_35 = arg_7_1:FormatText(StoryNameCfg[73].name)

				arg_7_1.leftNameTxt_.text = var_10_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_36 = arg_7_1:GetWordFromCfg(106111002)
				local var_10_37 = arg_7_1:FormatText(var_10_36.content)

				arg_7_1.text_.text = var_10_37

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_38 = 26
				local var_10_39 = utf8.len(var_10_37)
				local var_10_40 = var_10_38 <= 0 and var_10_34 or var_10_34 * (var_10_39 / var_10_38)

				if var_10_40 > 0 and var_10_34 < var_10_40 then
					arg_7_1.talkMaxDuration = var_10_40

					if var_10_40 + var_10_33 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_40 + var_10_33
					end
				end

				arg_7_1.text_.text = var_10_37
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111002", "story_v_out_106111.awb") ~= 0 then
					local var_10_41 = manager.audio:GetVoiceLength("story_v_out_106111", "106111002", "story_v_out_106111.awb") / 1000

					if var_10_41 + var_10_33 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_41 + var_10_33
					end

					if var_10_36.prefab_name ~= "" and arg_7_1.actors_[var_10_36.prefab_name] ~= nil then
						local var_10_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_36.prefab_name].transform, "story_v_out_106111", "106111002", "story_v_out_106111.awb")

						arg_7_1:RecordAudio("106111002", var_10_42)
						arg_7_1:RecordAudio("106111002", var_10_42)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_106111", "106111002", "story_v_out_106111.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_106111", "106111002", "story_v_out_106111.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_43 = math.max(var_10_34, arg_7_1.talkMaxDuration)

			if var_10_33 <= arg_7_1.time_ and arg_7_1.time_ < var_10_33 + var_10_43 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_33) / var_10_43

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_33 + var_10_43 and arg_7_1.time_ < var_10_33 + var_10_43 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play106111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 106111003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play106111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1093ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story == nil then
				arg_11_1.var_.characterEffect1093ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1093ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1093ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1093ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 1

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				local var_14_8 = "play"
				local var_14_9 = "effect"

				arg_11_1:AudioAction(var_14_8, var_14_9, "se_story_6", "se_story_6_draw_sword", "")
			end

			local var_14_10 = 0
			local var_14_11 = 0.625

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_12 = arg_11_1:GetWordFromCfg(106111003)
				local var_14_13 = arg_11_1:FormatText(var_14_12.content)

				arg_11_1.text_.text = var_14_13

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_14 = 25
				local var_14_15 = utf8.len(var_14_13)
				local var_14_16 = var_14_14 <= 0 and var_14_11 or var_14_11 * (var_14_15 / var_14_14)

				if var_14_16 > 0 and var_14_11 < var_14_16 then
					arg_11_1.talkMaxDuration = var_14_16

					if var_14_16 + var_14_10 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_16 + var_14_10
					end
				end

				arg_11_1.text_.text = var_14_13
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_17 = math.max(var_14_11, arg_11_1.talkMaxDuration)

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_17 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_10) / var_14_17

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_10 + var_14_17 and arg_11_1.time_ < var_14_10 + var_14_17 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play106111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 106111004
		arg_15_1.duration_ = 8.1

		local var_15_0 = {
			ja = 5.233,
			ko = 6.233,
			zh = 7.6,
			en = 8.1
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
				arg_15_0:Play106111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1093ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1093ui_story then
					arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action494")
			end

			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_18_6 = 0
			local var_18_7 = 0.775

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

				local var_18_9 = arg_15_1:GetWordFromCfg(106111004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111004", "story_v_out_106111.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_106111", "106111004", "story_v_out_106111.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_106111", "106111004", "story_v_out_106111.awb")

						arg_15_1:RecordAudio("106111004", var_18_15)
						arg_15_1:RecordAudio("106111004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_106111", "106111004", "story_v_out_106111.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_106111", "106111004", "story_v_out_106111.awb")
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
	Play106111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 106111005
		arg_19_1.duration_ = 12.366

		local var_19_0 = {
			ja = 12.366,
			ko = 8.3,
			zh = 7.6,
			en = 7.5
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
				arg_19_0:Play106111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.975

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[73].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(106111005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 39
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111005", "story_v_out_106111.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_106111", "106111005", "story_v_out_106111.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_106111", "106111005", "story_v_out_106111.awb")

						arg_19_1:RecordAudio("106111005", var_22_9)
						arg_19_1:RecordAudio("106111005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_106111", "106111005", "story_v_out_106111.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_106111", "106111005", "story_v_out_106111.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play106111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 106111006
		arg_23_1.duration_ = 6.633

		local var_23_0 = {
			ja = 6.633,
			ko = 4.433,
			zh = 5.6,
			en = 5.833
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
				arg_23_0:Play106111007(arg_23_1)
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
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1093ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1093ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.55

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[36].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(106111006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 19
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111006", "story_v_out_106111.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_106111", "106111006", "story_v_out_106111.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_106111", "106111006", "story_v_out_106111.awb")

						arg_23_1:RecordAudio("106111006", var_26_15)
						arg_23_1:RecordAudio("106111006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_106111", "106111006", "story_v_out_106111.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_106111", "106111006", "story_v_out_106111.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play106111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 106111007
		arg_27_1.duration_ = 1.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play106111008(arg_27_1)
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
					arg_27_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1093ui_story then
				arg_27_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action442")
			end

			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_30_6 = 0
			local var_30_7 = 0.075

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[73].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(106111007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 3
				local var_30_12 = utf8.len(var_30_10)
				local var_30_13 = var_30_11 <= 0 and var_30_7 or var_30_7 * (var_30_12 / var_30_11)

				if var_30_13 > 0 and var_30_7 < var_30_13 then
					arg_27_1.talkMaxDuration = var_30_13

					if var_30_13 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_13 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_10
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111007", "story_v_out_106111.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_106111", "106111007", "story_v_out_106111.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_106111", "106111007", "story_v_out_106111.awb")

						arg_27_1:RecordAudio("106111007", var_30_15)
						arg_27_1:RecordAudio("106111007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_106111", "106111007", "story_v_out_106111.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_106111", "106111007", "story_v_out_106111.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_16 and arg_27_1.time_ < var_30_6 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play106111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 106111008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play106111009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1093ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1093ui_story == nil then
				arg_31_1.var_.characterEffect1093ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1093ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1093ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1093ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1093ui_story.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["1093ui_story"].transform
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 then
				arg_31_1.var_.moveOldPos1093ui_story = var_34_6.localPosition

				local var_34_8 = "1093ui_story"

				arg_31_1:ShowWeapon(arg_31_1.var_[var_34_8 .. "Animator"].transform, true)
			end

			local var_34_9 = 0.001

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_7) / var_34_9
				local var_34_11 = Vector3.New(0, 100, 0)

				var_34_6.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1093ui_story, var_34_11, var_34_10)

				local var_34_12 = manager.ui.mainCamera.transform.position - var_34_6.position

				var_34_6.forward = Vector3.New(var_34_12.x, var_34_12.y, var_34_12.z)

				local var_34_13 = var_34_6.localEulerAngles

				var_34_13.z = 0
				var_34_13.x = 0
				var_34_6.localEulerAngles = var_34_13
			end

			if arg_31_1.time_ >= var_34_7 + var_34_9 and arg_31_1.time_ < var_34_7 + var_34_9 + arg_34_0 then
				var_34_6.localPosition = Vector3.New(0, 100, 0)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_6.position

				var_34_6.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_6.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_6.localEulerAngles = var_34_15
			end

			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				arg_31_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action2_1")
			end

			local var_34_17 = 0
			local var_34_18 = 1

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 then
				local var_34_19 = "play"
				local var_34_20 = "effect"

				arg_31_1:AudioAction(var_34_19, var_34_20, "se_story_6", "se_story_6_darts", "")
			end

			local var_34_21 = 0
			local var_34_22 = 0.925

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_23 = arg_31_1:GetWordFromCfg(106111008)
				local var_34_24 = arg_31_1:FormatText(var_34_23.content)

				arg_31_1.text_.text = var_34_24

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_25 = 37
				local var_34_26 = utf8.len(var_34_24)
				local var_34_27 = var_34_25 <= 0 and var_34_22 or var_34_22 * (var_34_26 / var_34_25)

				if var_34_27 > 0 and var_34_22 < var_34_27 then
					arg_31_1.talkMaxDuration = var_34_27

					if var_34_27 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_27 + var_34_21
					end
				end

				arg_31_1.text_.text = var_34_24
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_28 = math.max(var_34_22, arg_31_1.talkMaxDuration)

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_28 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_21) / var_34_28

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_21 + var_34_28 and arg_31_1.time_ < var_34_21 + var_34_28 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play106111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 106111009
		arg_35_1.duration_ = 5

		local var_35_0 = {
			ja = 5,
			ko = 4.3,
			zh = 3.833,
			en = 3.533
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
				arg_35_0:Play106111010(arg_35_1)
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

			local var_38_4 = arg_35_1.actors_["1093ui_story"].transform
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.var_.moveOldPos1093ui_story = var_38_4.localPosition

				local var_38_6 = "1093ui_story"

				arg_35_1:ShowWeapon(arg_35_1.var_[var_38_6 .. "Animator"].transform, true)
			end

			local var_38_7 = 0.001

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_7 then
				local var_38_8 = (arg_35_1.time_ - var_38_5) / var_38_7
				local var_38_9 = Vector3.New(0, -1.11, -5.88)

				var_38_4.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1093ui_story, var_38_9, var_38_8)

				local var_38_10 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_10.x, var_38_10.y, var_38_10.z)

				local var_38_11 = var_38_4.localEulerAngles

				var_38_11.z = 0
				var_38_11.x = 0
				var_38_4.localEulerAngles = var_38_11
			end

			if arg_35_1.time_ >= var_38_5 + var_38_7 and arg_35_1.time_ < var_38_5 + var_38_7 + arg_38_0 then
				var_38_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_38_12 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_12.x, var_38_12.y, var_38_12.z)

				local var_38_13 = var_38_4.localEulerAngles

				var_38_13.z = 0
				var_38_13.x = 0
				var_38_4.localEulerAngles = var_38_13
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_38_15 = 0
			local var_38_16 = 0.475

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[73].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(106111009)
				local var_38_19 = arg_35_1:FormatText(var_38_18.content)

				arg_35_1.text_.text = var_38_19

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_20 = 19
				local var_38_21 = utf8.len(var_38_19)
				local var_38_22 = var_38_20 <= 0 and var_38_16 or var_38_16 * (var_38_21 / var_38_20)

				if var_38_22 > 0 and var_38_16 < var_38_22 then
					arg_35_1.talkMaxDuration = var_38_22

					if var_38_22 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_19
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111009", "story_v_out_106111.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_out_106111", "106111009", "story_v_out_106111.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_out_106111", "106111009", "story_v_out_106111.awb")

						arg_35_1:RecordAudio("106111009", var_38_24)
						arg_35_1:RecordAudio("106111009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_106111", "106111009", "story_v_out_106111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_106111", "106111009", "story_v_out_106111.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_25 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_25 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_25

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_25 and arg_35_1.time_ < var_38_15 + var_38_25 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play106111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 106111010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play106111011(arg_39_1)
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

			local var_42_6 = arg_39_1.actors_["1093ui_story"].transform
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 then
				arg_39_1.var_.moveOldPos1093ui_story = var_42_6.localPosition

				local var_42_8 = "1093ui_story"

				arg_39_1:ShowWeapon(arg_39_1.var_[var_42_8 .. "Animator"].transform, true)
			end

			local var_42_9 = 0.001

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_7) / var_42_9
				local var_42_11 = Vector3.New(0, 100, 0)

				var_42_6.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1093ui_story, var_42_11, var_42_10)

				local var_42_12 = manager.ui.mainCamera.transform.position - var_42_6.position

				var_42_6.forward = Vector3.New(var_42_12.x, var_42_12.y, var_42_12.z)

				local var_42_13 = var_42_6.localEulerAngles

				var_42_13.z = 0
				var_42_13.x = 0
				var_42_6.localEulerAngles = var_42_13
			end

			if arg_39_1.time_ >= var_42_7 + var_42_9 and arg_39_1.time_ < var_42_7 + var_42_9 + arg_42_0 then
				var_42_6.localPosition = Vector3.New(0, 100, 0)

				local var_42_14 = manager.ui.mainCamera.transform.position - var_42_6.position

				var_42_6.forward = Vector3.New(var_42_14.x, var_42_14.y, var_42_14.z)

				local var_42_15 = var_42_6.localEulerAngles

				var_42_15.z = 0
				var_42_15.x = 0
				var_42_6.localEulerAngles = var_42_15
			end

			local var_42_16 = 0
			local var_42_17 = 0.85

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_18 = arg_39_1:GetWordFromCfg(106111010)
				local var_42_19 = arg_39_1:FormatText(var_42_18.content)

				arg_39_1.text_.text = var_42_19

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_20 = 34
				local var_42_21 = utf8.len(var_42_19)
				local var_42_22 = var_42_20 <= 0 and var_42_17 or var_42_17 * (var_42_21 / var_42_20)

				if var_42_22 > 0 and var_42_17 < var_42_22 then
					arg_39_1.talkMaxDuration = var_42_22

					if var_42_22 + var_42_16 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_22 + var_42_16
					end
				end

				arg_39_1.text_.text = var_42_19
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_23 = math.max(var_42_17, arg_39_1.talkMaxDuration)

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_23 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_16) / var_42_23

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_16 + var_42_23 and arg_39_1.time_ < var_42_16 + var_42_23 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play106111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 106111011
		arg_43_1.duration_ = 10.9

		local var_43_0 = {
			ja = 9.866,
			ko = 9.933,
			zh = 10.9,
			en = 9.966
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
				arg_43_0:Play106111012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.bgs_.C02b.transform
			local var_46_1 = 1.466

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPosC02b = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, -100, 10)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPosC02b, var_46_4, var_46_3)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_46_5 = "S0608"

			if arg_43_1.bgs_[var_46_5] == nil then
				local var_46_6 = Object.Instantiate(arg_43_1.paintGo_)

				var_46_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_46_5)
				var_46_6.name = var_46_5
				var_46_6.transform.parent = arg_43_1.stage_.transform
				var_46_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.bgs_[var_46_5] = var_46_6
			end

			local var_46_7 = 1.5

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 then
				local var_46_8 = manager.ui.mainCamera.transform.localPosition
				local var_46_9 = Vector3.New(0, 0, 10) + Vector3.New(var_46_8.x, var_46_8.y, 0)
				local var_46_10 = arg_43_1.bgs_.S0608

				var_46_10.transform.localPosition = var_46_9
				var_46_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_11 = var_46_10:GetComponent("SpriteRenderer")

				if var_46_11 and var_46_11.sprite then
					local var_46_12 = (var_46_10.transform.localPosition - var_46_8).z
					local var_46_13 = manager.ui.mainCameraCom_
					local var_46_14 = 2 * var_46_12 * Mathf.Tan(var_46_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_15 = var_46_14 * var_46_13.aspect
					local var_46_16 = var_46_11.sprite.bounds.size.x
					local var_46_17 = var_46_11.sprite.bounds.size.y
					local var_46_18 = var_46_15 / var_46_16
					local var_46_19 = var_46_14 / var_46_17
					local var_46_20 = var_46_19 < var_46_18 and var_46_18 or var_46_19

					var_46_10.transform.localScale = Vector3.New(var_46_20, var_46_20, 0)
				end

				for iter_46_0, iter_46_1 in pairs(arg_43_1.bgs_) do
					if iter_46_0 ~= "S0608" then
						iter_46_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_46_21 = arg_43_1.bgs_.S0608
			local var_46_22 = 1.5

			if var_46_22 < arg_43_1.time_ and arg_43_1.time_ <= var_46_22 + arg_46_0 then
				local var_46_23 = var_46_21:GetComponent("SpriteRenderer")

				if var_46_23 then
					var_46_23.material = arg_43_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_46_24 = var_46_23.material
					local var_46_25 = var_46_24:GetColor("_Color")

					arg_43_1.var_.alphaOldValueS0608 = var_46_25.a
					arg_43_1.var_.alphaMatValueS0608 = var_46_24
				end

				arg_43_1.var_.alphaOldValueS0608 = 0
			end

			local var_46_26 = 1.5

			if var_46_22 <= arg_43_1.time_ and arg_43_1.time_ < var_46_22 + var_46_26 then
				local var_46_27 = (arg_43_1.time_ - var_46_22) / var_46_26
				local var_46_28 = Mathf.Lerp(arg_43_1.var_.alphaOldValueS0608, 1, var_46_27)

				if arg_43_1.var_.alphaMatValueS0608 then
					local var_46_29 = arg_43_1.var_.alphaMatValueS0608
					local var_46_30 = var_46_29:GetColor("_Color")

					var_46_30.a = var_46_28

					var_46_29:SetColor("_Color", var_46_30)
				end
			end

			if arg_43_1.time_ >= var_46_22 + var_46_26 and arg_43_1.time_ < var_46_22 + var_46_26 + arg_46_0 and arg_43_1.var_.alphaMatValueS0608 then
				local var_46_31 = arg_43_1.var_.alphaMatValueS0608
				local var_46_32 = var_46_31:GetColor("_Color")

				var_46_32.a = 1

				var_46_31:SetColor("_Color", var_46_32)
			end

			local var_46_33 = arg_43_1.bgs_.C02b
			local var_46_34 = 0

			if var_46_34 < arg_43_1.time_ and arg_43_1.time_ <= var_46_34 + arg_46_0 then
				local var_46_35 = var_46_33:GetComponent("SpriteRenderer")

				if var_46_35 then
					var_46_35.material = arg_43_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_46_36 = var_46_35.material
					local var_46_37 = var_46_36:GetColor("_Color")

					arg_43_1.var_.alphaOldValueC02b = var_46_37.a
					arg_43_1.var_.alphaMatValueC02b = var_46_36
				end

				arg_43_1.var_.alphaOldValueC02b = 1
			end

			local var_46_38 = 1.5

			if var_46_34 <= arg_43_1.time_ and arg_43_1.time_ < var_46_34 + var_46_38 then
				local var_46_39 = (arg_43_1.time_ - var_46_34) / var_46_38
				local var_46_40 = Mathf.Lerp(arg_43_1.var_.alphaOldValueC02b, 0, var_46_39)

				if arg_43_1.var_.alphaMatValueC02b then
					local var_46_41 = arg_43_1.var_.alphaMatValueC02b
					local var_46_42 = var_46_41:GetColor("_Color")

					var_46_42.a = var_46_40

					var_46_41:SetColor("_Color", var_46_42)
				end
			end

			if arg_43_1.time_ >= var_46_34 + var_46_38 and arg_43_1.time_ < var_46_34 + var_46_38 + arg_46_0 and arg_43_1.var_.alphaMatValueC02b then
				local var_46_43 = arg_43_1.var_.alphaMatValueC02b
				local var_46_44 = var_46_43:GetColor("_Color")

				var_46_44.a = 0

				var_46_43:SetColor("_Color", var_46_44)
			end

			local var_46_45 = 0

			if var_46_45 < arg_43_1.time_ and arg_43_1.time_ <= var_46_45 + arg_46_0 then
				arg_43_1.allBtn_.enabled = false
			end

			local var_46_46 = 3

			if arg_43_1.time_ >= var_46_45 + var_46_46 and arg_43_1.time_ < var_46_45 + var_46_46 + arg_46_0 then
				arg_43_1.allBtn_.enabled = true
			end

			if arg_43_1.frameCnt_ <= 1 then
				arg_43_1.dialog_:SetActive(false)
			end

			local var_46_47 = 3
			local var_46_48 = 0.575

			if var_46_47 < arg_43_1.time_ and arg_43_1.time_ <= var_46_47 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				arg_43_1.dialog_:SetActive(true)

				local var_46_49 = LeanTween.value(arg_43_1.dialog_, 0, 1, 0.3)

				var_46_49:setOnUpdate(LuaHelper.FloatAction(function(arg_47_0)
					arg_43_1.dialogCg_.alpha = arg_47_0
				end))
				var_46_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_43_1.dialog_)
					var_46_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_43_1.duration_ = arg_43_1.duration_ + 0.3

				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_50 = arg_43_1:FormatText(StoryNameCfg[87].name)

				arg_43_1.leftNameTxt_.text = var_46_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_51 = arg_43_1:GetWordFromCfg(106111011)
				local var_46_52 = arg_43_1:FormatText(var_46_51.content)

				arg_43_1.text_.text = var_46_52

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_53 = 22
				local var_46_54 = utf8.len(var_46_52)
				local var_46_55 = var_46_53 <= 0 and var_46_48 or var_46_48 * (var_46_54 / var_46_53)

				if var_46_55 > 0 and var_46_48 < var_46_55 then
					arg_43_1.talkMaxDuration = var_46_55
					var_46_47 = var_46_47 + 0.3

					if var_46_55 + var_46_47 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_55 + var_46_47
					end
				end

				arg_43_1.text_.text = var_46_52
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111011", "story_v_out_106111.awb") ~= 0 then
					local var_46_56 = manager.audio:GetVoiceLength("story_v_out_106111", "106111011", "story_v_out_106111.awb") / 1000

					if var_46_56 + var_46_47 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_56 + var_46_47
					end

					if var_46_51.prefab_name ~= "" and arg_43_1.actors_[var_46_51.prefab_name] ~= nil then
						local var_46_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_51.prefab_name].transform, "story_v_out_106111", "106111011", "story_v_out_106111.awb")

						arg_43_1:RecordAudio("106111011", var_46_57)
						arg_43_1:RecordAudio("106111011", var_46_57)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_106111", "106111011", "story_v_out_106111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_106111", "106111011", "story_v_out_106111.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_58 = var_46_47 + 0.3
			local var_46_59 = math.max(var_46_48, arg_43_1.talkMaxDuration)

			if var_46_58 <= arg_43_1.time_ and arg_43_1.time_ < var_46_58 + var_46_59 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_58) / var_46_59

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_58 + var_46_59 and arg_43_1.time_ < var_46_58 + var_46_59 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play106111012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 106111012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play106111013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 1

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				local var_52_2 = "play"
				local var_52_3 = "effect"

				arg_49_1:AudioAction(var_52_2, var_52_3, "se_story_6", "se_story_6_black_fog", "")
			end

			local var_52_4 = 0
			local var_52_5 = 1.025

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_6 = arg_49_1:GetWordFromCfg(106111012)
				local var_52_7 = arg_49_1:FormatText(var_52_6.content)

				arg_49_1.text_.text = var_52_7

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_8 = 41
				local var_52_9 = utf8.len(var_52_7)
				local var_52_10 = var_52_8 <= 0 and var_52_5 or var_52_5 * (var_52_9 / var_52_8)

				if var_52_10 > 0 and var_52_5 < var_52_10 then
					arg_49_1.talkMaxDuration = var_52_10

					if var_52_10 + var_52_4 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_10 + var_52_4
					end
				end

				arg_49_1.text_.text = var_52_7
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_11 = math.max(var_52_5, arg_49_1.talkMaxDuration)

			if var_52_4 <= arg_49_1.time_ and arg_49_1.time_ < var_52_4 + var_52_11 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_4) / var_52_11

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_4 + var_52_11 and arg_49_1.time_ < var_52_4 + var_52_11 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play106111013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 106111013
		arg_53_1.duration_ = 6.6

		local var_53_0 = {
			ja = 6.6,
			ko = 3.5,
			zh = 3.766,
			en = 5.9
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
				arg_53_0:Play106111014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.475

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[73].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, true)
				arg_53_1.iconController_:SetSelectedState("hero")

				arg_53_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(106111013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 19
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111013", "story_v_out_106111.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_106111", "106111013", "story_v_out_106111.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_106111", "106111013", "story_v_out_106111.awb")

						arg_53_1:RecordAudio("106111013", var_56_9)
						arg_53_1:RecordAudio("106111013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_106111", "106111013", "story_v_out_106111.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_106111", "106111013", "story_v_out_106111.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play106111014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 106111014
		arg_57_1.duration_ = 8.633

		local var_57_0 = {
			ja = 8.633,
			ko = 6.866,
			zh = 6.2,
			en = 5.4
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
				arg_57_0:Play106111015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.65

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[87].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(106111014)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 24
				local var_60_6 = utf8.len(var_60_4)
				local var_60_7 = var_60_5 <= 0 and var_60_1 or var_60_1 * (var_60_6 / var_60_5)

				if var_60_7 > 0 and var_60_1 < var_60_7 then
					arg_57_1.talkMaxDuration = var_60_7

					if var_60_7 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_7 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_4
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111014", "story_v_out_106111.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_106111", "106111014", "story_v_out_106111.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_106111", "106111014", "story_v_out_106111.awb")

						arg_57_1:RecordAudio("106111014", var_60_9)
						arg_57_1:RecordAudio("106111014", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_106111", "106111014", "story_v_out_106111.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_106111", "106111014", "story_v_out_106111.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_10 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_10 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_10

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_10 and arg_57_1.time_ < var_60_0 + var_60_10 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play106111015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 106111015
		arg_61_1.duration_ = 4.7

		local var_61_0 = {
			ja = 2.966,
			ko = 3.233,
			zh = 4.7,
			en = 3.233
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
				arg_61_0:Play106111016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.35

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[73].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(106111015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 14
				local var_64_6 = utf8.len(var_64_4)
				local var_64_7 = var_64_5 <= 0 and var_64_1 or var_64_1 * (var_64_6 / var_64_5)

				if var_64_7 > 0 and var_64_1 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_4
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111015", "story_v_out_106111.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_106111", "106111015", "story_v_out_106111.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_106111", "106111015", "story_v_out_106111.awb")

						arg_61_1:RecordAudio("106111015", var_64_9)
						arg_61_1:RecordAudio("106111015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_106111", "106111015", "story_v_out_106111.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_106111", "106111015", "story_v_out_106111.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_10 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_10 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_10

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_10 and arg_61_1.time_ < var_64_0 + var_64_10 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play106111016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 106111016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play106111017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.6

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_2 = arg_65_1:GetWordFromCfg(106111016)
				local var_68_3 = arg_65_1:FormatText(var_68_2.content)

				arg_65_1.text_.text = var_68_3

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_4 = 24
				local var_68_5 = utf8.len(var_68_3)
				local var_68_6 = var_68_4 <= 0 and var_68_1 or var_68_1 * (var_68_5 / var_68_4)

				if var_68_6 > 0 and var_68_1 < var_68_6 then
					arg_65_1.talkMaxDuration = var_68_6

					if var_68_6 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_6 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_3
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_7 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_7 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_7

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_7 and arg_65_1.time_ < var_68_0 + var_68_7 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play106111017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 106111017
		arg_69_1.duration_ = 12.2

		local var_69_0 = {
			ja = 12.2,
			ko = 9.9,
			zh = 10,
			en = 7.766
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
				arg_69_0:Play106111018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "4014_tpose"

			if arg_69_1.actors_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(Asset.Load("Char/" .. var_72_0), arg_69_1.stage_.transform)

				var_72_1.name = var_72_0
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.actors_[var_72_0] = var_72_1

				local var_72_2 = var_72_1:GetComponentInChildren(typeof(CharacterEffect))

				var_72_2.enabled = true

				local var_72_3 = GameObjectTools.GetOrAddComponent(var_72_1, typeof(DynamicBoneHelper))

				if var_72_3 then
					var_72_3:EnableDynamicBone(false)
				end

				arg_69_1:ShowWeapon(var_72_2.transform, false)

				arg_69_1.var_[var_72_0 .. "Animator"] = var_72_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_69_1.var_[var_72_0 .. "Animator"].applyRootMotion = true
				arg_69_1.var_[var_72_0 .. "LipSync"] = var_72_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_72_4 = arg_69_1.actors_["4014_tpose"]
			local var_72_5 = 2

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect4014_tpose == nil then
				arg_69_1.var_.characterEffect4014_tpose = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect4014_tpose then
					arg_69_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect4014_tpose then
				arg_69_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_72_8 = arg_69_1.bgs_.S0608.transform
			local var_72_9 = 1.5

			if var_72_9 < arg_69_1.time_ and arg_69_1.time_ <= var_72_9 + arg_72_0 then
				arg_69_1.var_.moveOldPosS0608 = var_72_8.localPosition
			end

			local var_72_10 = 0.001

			if var_72_9 <= arg_69_1.time_ and arg_69_1.time_ < var_72_9 + var_72_10 then
				local var_72_11 = (arg_69_1.time_ - var_72_9) / var_72_10
				local var_72_12 = Vector3.New(0, -100, 10)

				var_72_8.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPosS0608, var_72_12, var_72_11)
			end

			if arg_69_1.time_ >= var_72_9 + var_72_10 and arg_69_1.time_ < var_72_9 + var_72_10 + arg_72_0 then
				var_72_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_72_13 = 1.5

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				local var_72_14 = manager.ui.mainCamera.transform.localPosition
				local var_72_15 = Vector3.New(0, 0, 10) + Vector3.New(var_72_14.x, var_72_14.y, 0)
				local var_72_16 = arg_69_1.bgs_.C02b

				var_72_16.transform.localPosition = var_72_15
				var_72_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_17 = var_72_16:GetComponent("SpriteRenderer")

				if var_72_17 and var_72_17.sprite then
					local var_72_18 = (var_72_16.transform.localPosition - var_72_14).z
					local var_72_19 = manager.ui.mainCameraCom_
					local var_72_20 = 2 * var_72_18 * Mathf.Tan(var_72_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_21 = var_72_20 * var_72_19.aspect
					local var_72_22 = var_72_17.sprite.bounds.size.x
					local var_72_23 = var_72_17.sprite.bounds.size.y
					local var_72_24 = var_72_21 / var_72_22
					local var_72_25 = var_72_20 / var_72_23
					local var_72_26 = var_72_25 < var_72_24 and var_72_24 or var_72_25

					var_72_16.transform.localScale = Vector3.New(var_72_26, var_72_26, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "C02b" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_27 = arg_69_1.actors_["4014_tpose"].transform
			local var_72_28 = 2

			if var_72_28 < arg_69_1.time_ and arg_69_1.time_ <= var_72_28 + arg_72_0 then
				arg_69_1.var_.moveOldPos4014_tpose = var_72_27.localPosition
			end

			local var_72_29 = 0.001

			if var_72_28 <= arg_69_1.time_ and arg_69_1.time_ < var_72_28 + var_72_29 then
				local var_72_30 = (arg_69_1.time_ - var_72_28) / var_72_29
				local var_72_31 = Vector3.New(0, -1.95, -4.2)

				var_72_27.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos4014_tpose, var_72_31, var_72_30)

				local var_72_32 = manager.ui.mainCamera.transform.position - var_72_27.position

				var_72_27.forward = Vector3.New(var_72_32.x, var_72_32.y, var_72_32.z)

				local var_72_33 = var_72_27.localEulerAngles

				var_72_33.z = 0
				var_72_33.x = 0
				var_72_27.localEulerAngles = var_72_33
			end

			if arg_69_1.time_ >= var_72_28 + var_72_29 and arg_69_1.time_ < var_72_28 + var_72_29 + arg_72_0 then
				var_72_27.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_72_34 = manager.ui.mainCamera.transform.position - var_72_27.position

				var_72_27.forward = Vector3.New(var_72_34.x, var_72_34.y, var_72_34.z)

				local var_72_35 = var_72_27.localEulerAngles

				var_72_35.z = 0
				var_72_35.x = 0
				var_72_27.localEulerAngles = var_72_35
			end

			local var_72_36 = 2

			if var_72_36 < arg_69_1.time_ and arg_69_1.time_ <= var_72_36 + arg_72_0 then
				arg_69_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_72_37 = arg_69_1.bgs_.C02b
			local var_72_38 = 1.5

			if var_72_38 < arg_69_1.time_ and arg_69_1.time_ <= var_72_38 + arg_72_0 then
				local var_72_39 = var_72_37:GetComponent("SpriteRenderer")

				if var_72_39 then
					var_72_39.material = arg_69_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_72_40 = var_72_39.material
					local var_72_41 = var_72_40:GetColor("_Color")

					arg_69_1.var_.alphaOldValueC02b = var_72_41.a
					arg_69_1.var_.alphaMatValueC02b = var_72_40
				end

				arg_69_1.var_.alphaOldValueC02b = 0
			end

			local var_72_42 = 1.5

			if var_72_38 <= arg_69_1.time_ and arg_69_1.time_ < var_72_38 + var_72_42 then
				local var_72_43 = (arg_69_1.time_ - var_72_38) / var_72_42
				local var_72_44 = Mathf.Lerp(arg_69_1.var_.alphaOldValueC02b, 1, var_72_43)

				if arg_69_1.var_.alphaMatValueC02b then
					local var_72_45 = arg_69_1.var_.alphaMatValueC02b
					local var_72_46 = var_72_45:GetColor("_Color")

					var_72_46.a = var_72_44

					var_72_45:SetColor("_Color", var_72_46)
				end
			end

			if arg_69_1.time_ >= var_72_38 + var_72_42 and arg_69_1.time_ < var_72_38 + var_72_42 + arg_72_0 and arg_69_1.var_.alphaMatValueC02b then
				local var_72_47 = arg_69_1.var_.alphaMatValueC02b
				local var_72_48 = var_72_47:GetColor("_Color")

				var_72_48.a = 1

				var_72_47:SetColor("_Color", var_72_48)
			end

			local var_72_49 = arg_69_1.bgs_.S0608
			local var_72_50 = 0

			if var_72_50 < arg_69_1.time_ and arg_69_1.time_ <= var_72_50 + arg_72_0 then
				local var_72_51 = var_72_49:GetComponent("SpriteRenderer")

				if var_72_51 then
					var_72_51.material = arg_69_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_72_52 = var_72_51.material
					local var_72_53 = var_72_52:GetColor("_Color")

					arg_69_1.var_.alphaOldValueS0608 = var_72_53.a
					arg_69_1.var_.alphaMatValueS0608 = var_72_52
				end

				arg_69_1.var_.alphaOldValueS0608 = 1
			end

			local var_72_54 = 1.5

			if var_72_50 <= arg_69_1.time_ and arg_69_1.time_ < var_72_50 + var_72_54 then
				local var_72_55 = (arg_69_1.time_ - var_72_50) / var_72_54
				local var_72_56 = Mathf.Lerp(arg_69_1.var_.alphaOldValueS0608, 0, var_72_55)

				if arg_69_1.var_.alphaMatValueS0608 then
					local var_72_57 = arg_69_1.var_.alphaMatValueS0608
					local var_72_58 = var_72_57:GetColor("_Color")

					var_72_58.a = var_72_56

					var_72_57:SetColor("_Color", var_72_58)
				end
			end

			if arg_69_1.time_ >= var_72_50 + var_72_54 and arg_69_1.time_ < var_72_50 + var_72_54 + arg_72_0 and arg_69_1.var_.alphaMatValueS0608 then
				local var_72_59 = arg_69_1.var_.alphaMatValueS0608
				local var_72_60 = var_72_59:GetColor("_Color")

				var_72_60.a = 0

				var_72_59:SetColor("_Color", var_72_60)
			end

			local var_72_61 = 0

			if var_72_61 < arg_69_1.time_ and arg_69_1.time_ <= var_72_61 + arg_72_0 then
				arg_69_1.allBtn_.enabled = false
			end

			local var_72_62 = 2

			if arg_69_1.time_ >= var_72_61 + var_72_62 and arg_69_1.time_ < var_72_61 + var_72_62 + arg_72_0 then
				arg_69_1.allBtn_.enabled = true
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_63 = 2
			local var_72_64 = 0.675

			if var_72_63 < arg_69_1.time_ and arg_69_1.time_ <= var_72_63 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_65 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_65:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_65:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_65:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_66 = arg_69_1:FormatText(StoryNameCfg[87].name)

				arg_69_1.leftNameTxt_.text = var_72_66

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_67 = arg_69_1:GetWordFromCfg(106111017)
				local var_72_68 = arg_69_1:FormatText(var_72_67.content)

				arg_69_1.text_.text = var_72_68

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_69 = 27
				local var_72_70 = utf8.len(var_72_68)
				local var_72_71 = var_72_69 <= 0 and var_72_64 or var_72_64 * (var_72_70 / var_72_69)

				if var_72_71 > 0 and var_72_64 < var_72_71 then
					arg_69_1.talkMaxDuration = var_72_71
					var_72_63 = var_72_63 + 0.3

					if var_72_71 + var_72_63 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_71 + var_72_63
					end
				end

				arg_69_1.text_.text = var_72_68
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111017", "story_v_out_106111.awb") ~= 0 then
					local var_72_72 = manager.audio:GetVoiceLength("story_v_out_106111", "106111017", "story_v_out_106111.awb") / 1000

					if var_72_72 + var_72_63 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_72 + var_72_63
					end

					if var_72_67.prefab_name ~= "" and arg_69_1.actors_[var_72_67.prefab_name] ~= nil then
						local var_72_73 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_67.prefab_name].transform, "story_v_out_106111", "106111017", "story_v_out_106111.awb")

						arg_69_1:RecordAudio("106111017", var_72_73)
						arg_69_1:RecordAudio("106111017", var_72_73)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_106111", "106111017", "story_v_out_106111.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_106111", "106111017", "story_v_out_106111.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_74 = var_72_63 + 0.3
			local var_72_75 = math.max(var_72_64, arg_69_1.talkMaxDuration)

			if var_72_74 <= arg_69_1.time_ and arg_69_1.time_ < var_72_74 + var_72_75 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_74) / var_72_75

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_74 + var_72_75 and arg_69_1.time_ < var_72_74 + var_72_75 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play106111018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 106111018
		arg_75_1.duration_ = 9.233

		local var_75_0 = {
			ja = 9.233,
			ko = 6.1,
			zh = 7.666,
			en = 6.5
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
				arg_75_0:Play106111019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.725

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[87].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(106111018)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 29
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106111", "106111018", "story_v_out_106111.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_106111", "106111018", "story_v_out_106111.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_106111", "106111018", "story_v_out_106111.awb")

						arg_75_1:RecordAudio("106111018", var_78_9)
						arg_75_1:RecordAudio("106111018", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_106111", "106111018", "story_v_out_106111.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_106111", "106111018", "story_v_out_106111.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play106111019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 106111019
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
			arg_79_1.auto_ = false
		end

		function arg_79_1.playNext_(arg_81_0)
			arg_79_1.onStoryFinished_()
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["4014_tpose"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect4014_tpose == nil then
				arg_79_1.var_.characterEffect4014_tpose = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect4014_tpose then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_79_1.var_.characterEffect4014_tpose.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect4014_tpose then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_79_1.var_.characterEffect4014_tpose.fillRatio = var_82_5
			end

			local var_82_6 = arg_79_1.actors_["4014_tpose"].transform
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 then
				arg_79_1.var_.moveOldPos4014_tpose = var_82_6.localPosition
			end

			local var_82_8 = 0.001

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8
				local var_82_10 = Vector3.New(0, 100, 0)

				var_82_6.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos4014_tpose, var_82_10, var_82_9)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_6.position

				var_82_6.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_6.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_6.localEulerAngles = var_82_12
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 then
				var_82_6.localPosition = Vector3.New(0, 100, 0)

				local var_82_13 = manager.ui.mainCamera.transform.position - var_82_6.position

				var_82_6.forward = Vector3.New(var_82_13.x, var_82_13.y, var_82_13.z)

				local var_82_14 = var_82_6.localEulerAngles

				var_82_14.z = 0
				var_82_14.x = 0
				var_82_6.localEulerAngles = var_82_14
			end

			local var_82_15 = 0
			local var_82_16 = 1.425

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				local var_82_17 = "play"
				local var_82_18 = "effect"

				arg_79_1:AudioAction(var_82_17, var_82_18, "se_story_6", "se_story_6_summon_monster", "")
			end

			local var_82_19 = 0
			local var_82_20 = 1.425

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_21 = arg_79_1:GetWordFromCfg(106111019)
				local var_82_22 = arg_79_1:FormatText(var_82_21.content)

				arg_79_1.text_.text = var_82_22

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_23 = 57
				local var_82_24 = utf8.len(var_82_22)
				local var_82_25 = var_82_23 <= 0 and var_82_20 or var_82_20 * (var_82_24 / var_82_23)

				if var_82_25 > 0 and var_82_20 < var_82_25 then
					arg_79_1.talkMaxDuration = var_82_25

					if var_82_25 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_25 + var_82_19
					end
				end

				arg_79_1.text_.text = var_82_22
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_26 = math.max(var_82_20, arg_79_1.talkMaxDuration)

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_26 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_19) / var_82_26

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_19 + var_82_26 and arg_79_1.time_ < var_82_19 + var_82_26 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C02b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0608"
	},
	voices = {
		"story_v_out_106111.awb"
	}
}
