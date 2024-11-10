return {
	Play104061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104061001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play104061002(arg_1_1)
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

			local var_4_8 = "B06a"

			if arg_1_1.bgs_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_8)
				var_4_9.name = var_4_8
				var_4_9.transform.parent = arg_1_1.stage_.transform
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_8] = var_4_9
			end

			local var_4_10 = arg_1_1.bgs_.B06a
			local var_4_11 = 0

			if var_4_11 < arg_1_1.time_ and arg_1_1.time_ <= var_4_11 + arg_4_0 then
				local var_4_12 = var_4_10:GetComponent("SpriteRenderer")

				if var_4_12 then
					var_4_12.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_13 = var_4_12.material
					local var_4_14 = var_4_13:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB06a = var_4_14.a
					arg_1_1.var_.alphaMatValueB06a = var_4_13
				end

				arg_1_1.var_.alphaOldValueB06a = 0
			end

			local var_4_15 = 1.5

			if var_4_11 <= arg_1_1.time_ and arg_1_1.time_ < var_4_11 + var_4_15 then
				local var_4_16 = (arg_1_1.time_ - var_4_11) / var_4_15
				local var_4_17 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB06a, 1, var_4_16)

				if arg_1_1.var_.alphaMatValueB06a then
					local var_4_18 = arg_1_1.var_.alphaMatValueB06a
					local var_4_19 = var_4_18:GetColor("_Color")

					var_4_19.a = var_4_17

					var_4_18:SetColor("_Color", var_4_19)
				end
			end

			if arg_1_1.time_ >= var_4_11 + var_4_15 and arg_1_1.time_ < var_4_11 + var_4_15 + arg_4_0 and arg_1_1.var_.alphaMatValueB06a then
				local var_4_20 = arg_1_1.var_.alphaMatValueB06a
				local var_4_21 = var_4_20:GetColor("_Color")

				var_4_21.a = 1

				var_4_20:SetColor("_Color", var_4_21)
			end

			local var_4_22 = 0

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_23 = manager.ui.mainCamera.transform.localPosition
				local var_4_24 = Vector3.New(0, 0, 10) + Vector3.New(var_4_23.x, var_4_23.y, 0)
				local var_4_25 = arg_1_1.bgs_.B06a

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
					if iter_4_0 ~= "B06a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_36 = 0

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_37 = 2

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 0.25

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(104061001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 10
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104061002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104061002
		arg_7_1.duration_ = 9.566

		local var_7_0 = {
			ja = 7.3,
			ko = 5.466,
			zh = 5.633,
			en = 9.566
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
				arg_7_0:Play104061003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1035ui_story"

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

			local var_10_4 = arg_7_1.actors_["1035ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1035ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.05, -5.6)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1035ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1035ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1035ui_story == nil then
				arg_7_1.var_.characterEffect1035ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.2

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1035ui_story then
					arg_7_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1035ui_story then
				arg_7_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action6_1")
			end

			local var_10_18 = 0
			local var_10_19 = 0.675

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_20 = arg_7_1:FormatText(StoryNameCfg[21].name)

				arg_7_1.leftNameTxt_.text = var_10_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_21 = arg_7_1:GetWordFromCfg(104061002)
				local var_10_22 = arg_7_1:FormatText(var_10_21.content)

				arg_7_1.text_.text = var_10_22

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_23 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061002", "story_v_out_104061.awb") ~= 0 then
					local var_10_26 = manager.audio:GetVoiceLength("story_v_out_104061", "104061002", "story_v_out_104061.awb") / 1000

					if var_10_26 + var_10_18 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_18
					end

					if var_10_21.prefab_name ~= "" and arg_7_1.actors_[var_10_21.prefab_name] ~= nil then
						local var_10_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_21.prefab_name].transform, "story_v_out_104061", "104061002", "story_v_out_104061.awb")

						arg_7_1:RecordAudio("104061002", var_10_27)
						arg_7_1:RecordAudio("104061002", var_10_27)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104061", "104061002", "story_v_out_104061.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104061", "104061002", "story_v_out_104061.awb")
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
	Play104061003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104061003
		arg_11_1.duration_ = 8.9

		local var_11_0 = {
			ja = 8.9,
			ko = 5.533,
			zh = 5.066,
			en = 7.2
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
				arg_11_0:Play104061004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1148ui_story"

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

			local var_14_4 = arg_11_1.actors_["1148ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect1148ui_story == nil then
				arg_11_1.var_.characterEffect1148ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect1148ui_story then
					arg_11_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect1148ui_story then
				arg_11_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["1148ui_story"].transform
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 then
				arg_11_1.var_.moveOldPos1148ui_story = var_14_8.localPosition
			end

			local var_14_10 = 0.001

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10
				local var_14_12 = Vector3.New(-0.7, -0.8, -6.2)

				var_14_8.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1148ui_story, var_14_12, var_14_11)

				local var_14_13 = manager.ui.mainCamera.transform.position - var_14_8.position

				var_14_8.forward = Vector3.New(var_14_13.x, var_14_13.y, var_14_13.z)

				local var_14_14 = var_14_8.localEulerAngles

				var_14_14.z = 0
				var_14_14.x = 0
				var_14_8.localEulerAngles = var_14_14
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 then
				var_14_8.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_14_15 = manager.ui.mainCamera.transform.position - var_14_8.position

				var_14_8.forward = Vector3.New(var_14_15.x, var_14_15.y, var_14_15.z)

				local var_14_16 = var_14_8.localEulerAngles

				var_14_16.z = 0
				var_14_16.x = 0
				var_14_8.localEulerAngles = var_14_16
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_14_18 = arg_11_1.actors_["1035ui_story"].transform
			local var_14_19 = 0

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.var_.moveOldPos1035ui_story = var_14_18.localPosition
			end

			local var_14_20 = 0.001

			if var_14_19 <= arg_11_1.time_ and arg_11_1.time_ < var_14_19 + var_14_20 then
				local var_14_21 = (arg_11_1.time_ - var_14_19) / var_14_20
				local var_14_22 = Vector3.New(0, 100, 0)

				var_14_18.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1035ui_story, var_14_22, var_14_21)

				local var_14_23 = manager.ui.mainCamera.transform.position - var_14_18.position

				var_14_18.forward = Vector3.New(var_14_23.x, var_14_23.y, var_14_23.z)

				local var_14_24 = var_14_18.localEulerAngles

				var_14_24.z = 0
				var_14_24.x = 0
				var_14_18.localEulerAngles = var_14_24
			end

			if arg_11_1.time_ >= var_14_19 + var_14_20 and arg_11_1.time_ < var_14_19 + var_14_20 + arg_14_0 then
				var_14_18.localPosition = Vector3.New(0, 100, 0)

				local var_14_25 = manager.ui.mainCamera.transform.position - var_14_18.position

				var_14_18.forward = Vector3.New(var_14_25.x, var_14_25.y, var_14_25.z)

				local var_14_26 = var_14_18.localEulerAngles

				var_14_26.z = 0
				var_14_26.x = 0
				var_14_18.localEulerAngles = var_14_26
			end

			local var_14_27 = 0

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_14_28 = 0
			local var_14_29 = 0.6

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_30 = arg_11_1:FormatText(StoryNameCfg[8].name)

				arg_11_1.leftNameTxt_.text = var_14_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_31 = arg_11_1:GetWordFromCfg(104061003)
				local var_14_32 = arg_11_1:FormatText(var_14_31.content)

				arg_11_1.text_.text = var_14_32

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_33 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061003", "story_v_out_104061.awb") ~= 0 then
					local var_14_36 = manager.audio:GetVoiceLength("story_v_out_104061", "104061003", "story_v_out_104061.awb") / 1000

					if var_14_36 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_36 + var_14_28
					end

					if var_14_31.prefab_name ~= "" and arg_11_1.actors_[var_14_31.prefab_name] ~= nil then
						local var_14_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_31.prefab_name].transform, "story_v_out_104061", "104061003", "story_v_out_104061.awb")

						arg_11_1:RecordAudio("104061003", var_14_37)
						arg_11_1:RecordAudio("104061003", var_14_37)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104061", "104061003", "story_v_out_104061.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104061", "104061003", "story_v_out_104061.awb")
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
	Play104061004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104061004
		arg_15_1.duration_ = 4.1

		local var_15_0 = {
			ja = 3.766,
			ko = 2.466,
			zh = 4.1,
			en = 2.933
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
				arg_15_0:Play104061005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1148ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1148ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1148ui_story, var_18_4, var_18_3)

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

			local var_18_9 = arg_15_1.actors_["1035ui_story"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos1035ui_story = var_18_9.localPosition
			end

			local var_18_11 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11
				local var_18_13 = Vector3.New(0, -1.05, -5.6)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1035ui_story, var_18_13, var_18_12)

				local var_18_14 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_14.x, var_18_14.y, var_18_14.z)

				local var_18_15 = var_18_9.localEulerAngles

				var_18_15.z = 0
				var_18_15.x = 0
				var_18_9.localEulerAngles = var_18_15
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(0, -1.05, -5.6)

				local var_18_16 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_16.x, var_18_16.y, var_18_16.z)

				local var_18_17 = var_18_9.localEulerAngles

				var_18_17.z = 0
				var_18_17.x = 0
				var_18_9.localEulerAngles = var_18_17
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action7_1")
			end

			local var_18_19 = arg_15_1.actors_["1035ui_story"]
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 and arg_15_1.var_.characterEffect1035ui_story == nil then
				arg_15_1.var_.characterEffect1035ui_story = var_18_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_21 = 0.2

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21

				if arg_15_1.var_.characterEffect1035ui_story then
					arg_15_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 and arg_15_1.var_.characterEffect1035ui_story then
				arg_15_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_18_23 = 0
			local var_18_24 = 0.175

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_25 = arg_15_1:FormatText(StoryNameCfg[21].name)

				arg_15_1.leftNameTxt_.text = var_18_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_26 = arg_15_1:GetWordFromCfg(104061004)
				local var_18_27 = arg_15_1:FormatText(var_18_26.content)

				arg_15_1.text_.text = var_18_27

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_28 = 7
				local var_18_29 = utf8.len(var_18_27)
				local var_18_30 = var_18_28 <= 0 and var_18_24 or var_18_24 * (var_18_29 / var_18_28)

				if var_18_30 > 0 and var_18_24 < var_18_30 then
					arg_15_1.talkMaxDuration = var_18_30

					if var_18_30 + var_18_23 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_30 + var_18_23
					end
				end

				arg_15_1.text_.text = var_18_27
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061004", "story_v_out_104061.awb") ~= 0 then
					local var_18_31 = manager.audio:GetVoiceLength("story_v_out_104061", "104061004", "story_v_out_104061.awb") / 1000

					if var_18_31 + var_18_23 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_31 + var_18_23
					end

					if var_18_26.prefab_name ~= "" and arg_15_1.actors_[var_18_26.prefab_name] ~= nil then
						local var_18_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_26.prefab_name].transform, "story_v_out_104061", "104061004", "story_v_out_104061.awb")

						arg_15_1:RecordAudio("104061004", var_18_32)
						arg_15_1:RecordAudio("104061004", var_18_32)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104061", "104061004", "story_v_out_104061.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104061", "104061004", "story_v_out_104061.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_33 = math.max(var_18_24, arg_15_1.talkMaxDuration)

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_33 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_23) / var_18_33

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_23 + var_18_33 and arg_15_1.time_ < var_18_23 + var_18_33 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104061005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104061005
		arg_19_1.duration_ = 8.2

		local var_19_0 = {
			ja = 7.533,
			ko = 6.1,
			zh = 8.2,
			en = 5.7
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
				arg_19_0:Play104061006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1059ui_story"

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

			local var_22_4 = arg_19_1.actors_["1059ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1059ui_story == nil then
				arg_19_1.var_.characterEffect1059ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1059ui_story then
					arg_19_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1059ui_story then
				arg_19_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_22_8 = arg_19_1.actors_["1148ui_story"].transform
			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1.var_.moveOldPos1148ui_story = var_22_8.localPosition
			end

			local var_22_10 = 0.001

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_10 then
				local var_22_11 = (arg_19_1.time_ - var_22_9) / var_22_10
				local var_22_12 = Vector3.New(0, 100, 0)

				var_22_8.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1148ui_story, var_22_12, var_22_11)

				local var_22_13 = manager.ui.mainCamera.transform.position - var_22_8.position

				var_22_8.forward = Vector3.New(var_22_13.x, var_22_13.y, var_22_13.z)

				local var_22_14 = var_22_8.localEulerAngles

				var_22_14.z = 0
				var_22_14.x = 0
				var_22_8.localEulerAngles = var_22_14
			end

			if arg_19_1.time_ >= var_22_9 + var_22_10 and arg_19_1.time_ < var_22_9 + var_22_10 + arg_22_0 then
				var_22_8.localPosition = Vector3.New(0, 100, 0)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_8.position

				var_22_8.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_8.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_8.localEulerAngles = var_22_16
			end

			local var_22_17 = arg_19_1.actors_["1059ui_story"].transform
			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1.var_.moveOldPos1059ui_story = var_22_17.localPosition
			end

			local var_22_19 = 0.001

			if var_22_18 <= arg_19_1.time_ and arg_19_1.time_ < var_22_18 + var_22_19 then
				local var_22_20 = (arg_19_1.time_ - var_22_18) / var_22_19
				local var_22_21 = Vector3.New(0, -1.05, -6)

				var_22_17.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1059ui_story, var_22_21, var_22_20)

				local var_22_22 = manager.ui.mainCamera.transform.position - var_22_17.position

				var_22_17.forward = Vector3.New(var_22_22.x, var_22_22.y, var_22_22.z)

				local var_22_23 = var_22_17.localEulerAngles

				var_22_23.z = 0
				var_22_23.x = 0
				var_22_17.localEulerAngles = var_22_23
			end

			if arg_19_1.time_ >= var_22_18 + var_22_19 and arg_19_1.time_ < var_22_18 + var_22_19 + arg_22_0 then
				var_22_17.localPosition = Vector3.New(0, -1.05, -6)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_17.position

				var_22_17.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_17.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_17.localEulerAngles = var_22_25
			end

			local var_22_26 = 0

			if var_22_26 < arg_19_1.time_ and arg_19_1.time_ <= var_22_26 + arg_22_0 then
				arg_19_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action4_1")
			end

			local var_22_27 = arg_19_1.actors_["1035ui_story"].transform
			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1.var_.moveOldPos1035ui_story = var_22_27.localPosition
			end

			local var_22_29 = 0.001

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_29 then
				local var_22_30 = (arg_19_1.time_ - var_22_28) / var_22_29
				local var_22_31 = Vector3.New(0, 100, 0)

				var_22_27.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1035ui_story, var_22_31, var_22_30)

				local var_22_32 = manager.ui.mainCamera.transform.position - var_22_27.position

				var_22_27.forward = Vector3.New(var_22_32.x, var_22_32.y, var_22_32.z)

				local var_22_33 = var_22_27.localEulerAngles

				var_22_33.z = 0
				var_22_33.x = 0
				var_22_27.localEulerAngles = var_22_33
			end

			if arg_19_1.time_ >= var_22_28 + var_22_29 and arg_19_1.time_ < var_22_28 + var_22_29 + arg_22_0 then
				var_22_27.localPosition = Vector3.New(0, 100, 0)

				local var_22_34 = manager.ui.mainCamera.transform.position - var_22_27.position

				var_22_27.forward = Vector3.New(var_22_34.x, var_22_34.y, var_22_34.z)

				local var_22_35 = var_22_27.localEulerAngles

				var_22_35.z = 0
				var_22_35.x = 0
				var_22_27.localEulerAngles = var_22_35
			end

			local var_22_36 = 0

			if var_22_36 < arg_19_1.time_ and arg_19_1.time_ <= var_22_36 + arg_22_0 then
				arg_19_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_22_37 = 0
			local var_22_38 = 0.825

			if var_22_37 < arg_19_1.time_ and arg_19_1.time_ <= var_22_37 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_39 = arg_19_1:FormatText(StoryNameCfg[28].name)

				arg_19_1.leftNameTxt_.text = var_22_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_40 = arg_19_1:GetWordFromCfg(104061005)
				local var_22_41 = arg_19_1:FormatText(var_22_40.content)

				arg_19_1.text_.text = var_22_41

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_42 = 33
				local var_22_43 = utf8.len(var_22_41)
				local var_22_44 = var_22_42 <= 0 and var_22_38 or var_22_38 * (var_22_43 / var_22_42)

				if var_22_44 > 0 and var_22_38 < var_22_44 then
					arg_19_1.talkMaxDuration = var_22_44

					if var_22_44 + var_22_37 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_44 + var_22_37
					end
				end

				arg_19_1.text_.text = var_22_41
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061005", "story_v_out_104061.awb") ~= 0 then
					local var_22_45 = manager.audio:GetVoiceLength("story_v_out_104061", "104061005", "story_v_out_104061.awb") / 1000

					if var_22_45 + var_22_37 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_45 + var_22_37
					end

					if var_22_40.prefab_name ~= "" and arg_19_1.actors_[var_22_40.prefab_name] ~= nil then
						local var_22_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_40.prefab_name].transform, "story_v_out_104061", "104061005", "story_v_out_104061.awb")

						arg_19_1:RecordAudio("104061005", var_22_46)
						arg_19_1:RecordAudio("104061005", var_22_46)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104061", "104061005", "story_v_out_104061.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104061", "104061005", "story_v_out_104061.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_47 = math.max(var_22_38, arg_19_1.talkMaxDuration)

			if var_22_37 <= arg_19_1.time_ and arg_19_1.time_ < var_22_37 + var_22_47 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_37) / var_22_47

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_37 + var_22_47 and arg_19_1.time_ < var_22_37 + var_22_47 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104061006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104061006
		arg_23_1.duration_ = 3.633

		local var_23_0 = {
			ja = 3.633,
			ko = 3.6,
			zh = 2.666,
			en = 3.166
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
				arg_23_0:Play104061007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "2020_tpose"

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

			local var_26_4 = arg_23_1.actors_["2020_tpose"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose == nil then
				arg_23_1.var_.characterEffect2020_tpose = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect2020_tpose then
					arg_23_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect2020_tpose then
				arg_23_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["1059ui_story"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect1059ui_story == nil then
				arg_23_1.var_.characterEffect1059ui_story = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect1059ui_story then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1059ui_story.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1059ui_story then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1059ui_story.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["1059ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos1059ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0, 100, 0)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1059ui_story, var_26_18, var_26_17)

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

			local var_26_23 = arg_23_1.actors_["2020_tpose"].transform
			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.var_.moveOldPos2020_tpose = var_26_23.localPosition
			end

			local var_26_25 = 0.001

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_25 then
				local var_26_26 = (arg_23_1.time_ - var_26_24) / var_26_25
				local var_26_27 = Vector3.New(-0.7, -1.2, -4.1)

				var_26_23.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2020_tpose, var_26_27, var_26_26)

				local var_26_28 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_28.x, var_26_28.y, var_26_28.z)

				local var_26_29 = var_26_23.localEulerAngles

				var_26_29.z = 0
				var_26_29.x = 0
				var_26_23.localEulerAngles = var_26_29
			end

			if arg_23_1.time_ >= var_26_24 + var_26_25 and arg_23_1.time_ < var_26_24 + var_26_25 + arg_26_0 then
				var_26_23.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_26_30 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_30.x, var_26_30.y, var_26_30.z)

				local var_26_31 = var_26_23.localEulerAngles

				var_26_31.z = 0
				var_26_31.x = 0
				var_26_23.localEulerAngles = var_26_31
			end

			local var_26_32 = 0

			if var_26_32 < arg_23_1.time_ and arg_23_1.time_ <= var_26_32 + arg_26_0 then
				arg_23_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_26_33 = 0
			local var_26_34 = 0.375

			if var_26_33 < arg_23_1.time_ and arg_23_1.time_ <= var_26_33 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_35 = arg_23_1:FormatText(StoryNameCfg[34].name)

				arg_23_1.leftNameTxt_.text = var_26_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_36 = arg_23_1:GetWordFromCfg(104061006)
				local var_26_37 = arg_23_1:FormatText(var_26_36.content)

				arg_23_1.text_.text = var_26_37

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_38 = 15
				local var_26_39 = utf8.len(var_26_37)
				local var_26_40 = var_26_38 <= 0 and var_26_34 or var_26_34 * (var_26_39 / var_26_38)

				if var_26_40 > 0 and var_26_34 < var_26_40 then
					arg_23_1.talkMaxDuration = var_26_40

					if var_26_40 + var_26_33 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_40 + var_26_33
					end
				end

				arg_23_1.text_.text = var_26_37
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061006", "story_v_out_104061.awb") ~= 0 then
					local var_26_41 = manager.audio:GetVoiceLength("story_v_out_104061", "104061006", "story_v_out_104061.awb") / 1000

					if var_26_41 + var_26_33 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_41 + var_26_33
					end

					if var_26_36.prefab_name ~= "" and arg_23_1.actors_[var_26_36.prefab_name] ~= nil then
						local var_26_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_36.prefab_name].transform, "story_v_out_104061", "104061006", "story_v_out_104061.awb")

						arg_23_1:RecordAudio("104061006", var_26_42)
						arg_23_1:RecordAudio("104061006", var_26_42)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104061", "104061006", "story_v_out_104061.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104061", "104061006", "story_v_out_104061.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_43 = math.max(var_26_34, arg_23_1.talkMaxDuration)

			if var_26_33 <= arg_23_1.time_ and arg_23_1.time_ < var_26_33 + var_26_43 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_33) / var_26_43

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_33 + var_26_43 and arg_23_1.time_ < var_26_33 + var_26_43 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104061007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104061007
		arg_27_1.duration_ = 9

		local var_27_0 = {
			ja = 4.8,
			ko = 6.666,
			zh = 9,
			en = 6.733
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
				arg_27_0:Play104061008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1035ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1035ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0.7, -1.05, -5.6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1035ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0.7, -1.05, -5.6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1:PlayTimeline("1035ui_story", "StoryTimeline/CharAction/1035/1035action/1035action1_1")
			end

			local var_30_10 = arg_27_1.actors_["2020_tpose"]
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose == nil then
				arg_27_1.var_.characterEffect2020_tpose = var_30_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_12 = 0.2

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / var_30_12

				if arg_27_1.var_.characterEffect2020_tpose then
					local var_30_14 = Mathf.Lerp(0, 0.5, var_30_13)

					arg_27_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_27_1.var_.characterEffect2020_tpose.fillRatio = var_30_14
				end
			end

			if arg_27_1.time_ >= var_30_11 + var_30_12 and arg_27_1.time_ < var_30_11 + var_30_12 + arg_30_0 and arg_27_1.var_.characterEffect2020_tpose then
				local var_30_15 = 0.5

				arg_27_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_27_1.var_.characterEffect2020_tpose.fillRatio = var_30_15
			end

			local var_30_16 = arg_27_1.actors_["1035ui_story"]
			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 and arg_27_1.var_.characterEffect1035ui_story == nil then
				arg_27_1.var_.characterEffect1035ui_story = var_30_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_18 = 0.2

			if var_30_17 <= arg_27_1.time_ and arg_27_1.time_ < var_30_17 + var_30_18 then
				local var_30_19 = (arg_27_1.time_ - var_30_17) / var_30_18

				if arg_27_1.var_.characterEffect1035ui_story then
					arg_27_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_17 + var_30_18 and arg_27_1.time_ < var_30_17 + var_30_18 + arg_30_0 and arg_27_1.var_.characterEffect1035ui_story then
				arg_27_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_30_20 = 0
			local var_30_21 = 0.775

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_22 = arg_27_1:FormatText(StoryNameCfg[21].name)

				arg_27_1.leftNameTxt_.text = var_30_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_23 = arg_27_1:GetWordFromCfg(104061007)
				local var_30_24 = arg_27_1:FormatText(var_30_23.content)

				arg_27_1.text_.text = var_30_24

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_25 = 30
				local var_30_26 = utf8.len(var_30_24)
				local var_30_27 = var_30_25 <= 0 and var_30_21 or var_30_21 * (var_30_26 / var_30_25)

				if var_30_27 > 0 and var_30_21 < var_30_27 then
					arg_27_1.talkMaxDuration = var_30_27

					if var_30_27 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_20
					end
				end

				arg_27_1.text_.text = var_30_24
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061007", "story_v_out_104061.awb") ~= 0 then
					local var_30_28 = manager.audio:GetVoiceLength("story_v_out_104061", "104061007", "story_v_out_104061.awb") / 1000

					if var_30_28 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_28 + var_30_20
					end

					if var_30_23.prefab_name ~= "" and arg_27_1.actors_[var_30_23.prefab_name] ~= nil then
						local var_30_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_23.prefab_name].transform, "story_v_out_104061", "104061007", "story_v_out_104061.awb")

						arg_27_1:RecordAudio("104061007", var_30_29)
						arg_27_1:RecordAudio("104061007", var_30_29)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_104061", "104061007", "story_v_out_104061.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_104061", "104061007", "story_v_out_104061.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_30 = math.max(var_30_21, arg_27_1.talkMaxDuration)

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_30 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_20) / var_30_30

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_20 + var_30_30 and arg_27_1.time_ < var_30_20 + var_30_30 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play104061008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104061008
		arg_31_1.duration_ = 6.733

		local var_31_0 = {
			ja = 6.733,
			ko = 4.8,
			zh = 4,
			en = 5.766
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
				arg_31_0:Play104061009(arg_31_1)
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

			local var_34_4 = arg_31_1.actors_["2020_tpose"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose == nil then
				arg_31_1.var_.characterEffect2020_tpose = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.2

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect2020_tpose then
					arg_31_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect2020_tpose then
				arg_31_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_34_8 = arg_31_1.actors_["1035ui_story"]
			local var_34_9 = 0

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 and arg_31_1.var_.characterEffect1035ui_story == nil then
				arg_31_1.var_.characterEffect1035ui_story = var_34_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_10 = 0.2

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_10 then
				local var_34_11 = (arg_31_1.time_ - var_34_9) / var_34_10

				if arg_31_1.var_.characterEffect1035ui_story then
					local var_34_12 = Mathf.Lerp(0, 0.5, var_34_11)

					arg_31_1.var_.characterEffect1035ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1035ui_story.fillRatio = var_34_12
				end
			end

			if arg_31_1.time_ >= var_34_9 + var_34_10 and arg_31_1.time_ < var_34_9 + var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1035ui_story then
				local var_34_13 = 0.5

				arg_31_1.var_.characterEffect1035ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1035ui_story.fillRatio = var_34_13
			end

			local var_34_14 = 0
			local var_34_15 = 0.55

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_16 = arg_31_1:FormatText(StoryNameCfg[34].name)

				arg_31_1.leftNameTxt_.text = var_34_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_17 = arg_31_1:GetWordFromCfg(104061008)
				local var_34_18 = arg_31_1:FormatText(var_34_17.content)

				arg_31_1.text_.text = var_34_18

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_19 = 22
				local var_34_20 = utf8.len(var_34_18)
				local var_34_21 = var_34_19 <= 0 and var_34_15 or var_34_15 * (var_34_20 / var_34_19)

				if var_34_21 > 0 and var_34_15 < var_34_21 then
					arg_31_1.talkMaxDuration = var_34_21

					if var_34_21 + var_34_14 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_14
					end
				end

				arg_31_1.text_.text = var_34_18
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061008", "story_v_out_104061.awb") ~= 0 then
					local var_34_22 = manager.audio:GetVoiceLength("story_v_out_104061", "104061008", "story_v_out_104061.awb") / 1000

					if var_34_22 + var_34_14 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_14
					end

					if var_34_17.prefab_name ~= "" and arg_31_1.actors_[var_34_17.prefab_name] ~= nil then
						local var_34_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_17.prefab_name].transform, "story_v_out_104061", "104061008", "story_v_out_104061.awb")

						arg_31_1:RecordAudio("104061008", var_34_23)
						arg_31_1:RecordAudio("104061008", var_34_23)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104061", "104061008", "story_v_out_104061.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104061", "104061008", "story_v_out_104061.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_24 = math.max(var_34_15, arg_31_1.talkMaxDuration)

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_24 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_14) / var_34_24

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_14 + var_34_24 and arg_31_1.time_ < var_34_14 + var_34_24 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play104061009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104061009
		arg_35_1.duration_ = 4.6

		local var_35_0 = {
			ja = 3.066,
			ko = 2.666,
			zh = 3.6,
			en = 4.6
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
				arg_35_0:Play104061010(arg_35_1)
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
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_35_1.var_.characterEffect2020_tpose.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_35_1.var_.characterEffect2020_tpose.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["1035ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect1035ui_story == nil then
				arg_35_1.var_.characterEffect1035ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.1

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect1035ui_story then
					arg_35_1.var_.characterEffect1035ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect1035ui_story then
				arg_35_1.var_.characterEffect1035ui_story.fillFlat = false
			end

			local var_38_10 = 0
			local var_38_11 = 0.275

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[21].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(104061009)
				local var_38_14 = arg_35_1:FormatText(var_38_13.content)

				arg_35_1.text_.text = var_38_14

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_15 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061009", "story_v_out_104061.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_104061", "104061009", "story_v_out_104061.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_104061", "104061009", "story_v_out_104061.awb")

						arg_35_1:RecordAudio("104061009", var_38_19)
						arg_35_1:RecordAudio("104061009", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104061", "104061009", "story_v_out_104061.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104061", "104061009", "story_v_out_104061.awb")
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
	Play104061010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104061010
		arg_39_1.duration_ = 6.933

		local var_39_0 = {
			ja = 6.933,
			ko = 4.366,
			zh = 3.9,
			en = 4.433
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
				arg_39_0:Play104061011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1148ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1148ui_story == nil then
				arg_39_1.var_.characterEffect1148ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1148ui_story then
					arg_39_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1148ui_story then
				arg_39_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["2020_tpose"].transform
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1.var_.moveOldPos2020_tpose = var_42_4.localPosition
			end

			local var_42_6 = 0.001

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6
				local var_42_8 = Vector3.New(0, 100, 0)

				var_42_4.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos2020_tpose, var_42_8, var_42_7)

				local var_42_9 = manager.ui.mainCamera.transform.position - var_42_4.position

				var_42_4.forward = Vector3.New(var_42_9.x, var_42_9.y, var_42_9.z)

				local var_42_10 = var_42_4.localEulerAngles

				var_42_10.z = 0
				var_42_10.x = 0
				var_42_4.localEulerAngles = var_42_10
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 then
				var_42_4.localPosition = Vector3.New(0, 100, 0)

				local var_42_11 = manager.ui.mainCamera.transform.position - var_42_4.position

				var_42_4.forward = Vector3.New(var_42_11.x, var_42_11.y, var_42_11.z)

				local var_42_12 = var_42_4.localEulerAngles

				var_42_12.z = 0
				var_42_12.x = 0
				var_42_4.localEulerAngles = var_42_12
			end

			local var_42_13 = arg_39_1.actors_["1148ui_story"].transform
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1.var_.moveOldPos1148ui_story = var_42_13.localPosition
			end

			local var_42_15 = 0.001

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_15 then
				local var_42_16 = (arg_39_1.time_ - var_42_14) / var_42_15
				local var_42_17 = Vector3.New(0, -0.8, -6.2)

				var_42_13.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1148ui_story, var_42_17, var_42_16)

				local var_42_18 = manager.ui.mainCamera.transform.position - var_42_13.position

				var_42_13.forward = Vector3.New(var_42_18.x, var_42_18.y, var_42_18.z)

				local var_42_19 = var_42_13.localEulerAngles

				var_42_19.z = 0
				var_42_19.x = 0
				var_42_13.localEulerAngles = var_42_19
			end

			if arg_39_1.time_ >= var_42_14 + var_42_15 and arg_39_1.time_ < var_42_14 + var_42_15 + arg_42_0 then
				var_42_13.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_42_20 = manager.ui.mainCamera.transform.position - var_42_13.position

				var_42_13.forward = Vector3.New(var_42_20.x, var_42_20.y, var_42_20.z)

				local var_42_21 = var_42_13.localEulerAngles

				var_42_21.z = 0
				var_42_21.x = 0
				var_42_13.localEulerAngles = var_42_21
			end

			local var_42_22 = 0

			if var_42_22 < arg_39_1.time_ and arg_39_1.time_ <= var_42_22 + arg_42_0 then
				arg_39_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_42_23 = arg_39_1.actors_["1035ui_story"].transform
			local var_42_24 = 0

			if var_42_24 < arg_39_1.time_ and arg_39_1.time_ <= var_42_24 + arg_42_0 then
				arg_39_1.var_.moveOldPos1035ui_story = var_42_23.localPosition
			end

			local var_42_25 = 0.001

			if var_42_24 <= arg_39_1.time_ and arg_39_1.time_ < var_42_24 + var_42_25 then
				local var_42_26 = (arg_39_1.time_ - var_42_24) / var_42_25
				local var_42_27 = Vector3.New(0, 100, 0)

				var_42_23.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1035ui_story, var_42_27, var_42_26)

				local var_42_28 = manager.ui.mainCamera.transform.position - var_42_23.position

				var_42_23.forward = Vector3.New(var_42_28.x, var_42_28.y, var_42_28.z)

				local var_42_29 = var_42_23.localEulerAngles

				var_42_29.z = 0
				var_42_29.x = 0
				var_42_23.localEulerAngles = var_42_29
			end

			if arg_39_1.time_ >= var_42_24 + var_42_25 and arg_39_1.time_ < var_42_24 + var_42_25 + arg_42_0 then
				var_42_23.localPosition = Vector3.New(0, 100, 0)

				local var_42_30 = manager.ui.mainCamera.transform.position - var_42_23.position

				var_42_23.forward = Vector3.New(var_42_30.x, var_42_30.y, var_42_30.z)

				local var_42_31 = var_42_23.localEulerAngles

				var_42_31.z = 0
				var_42_31.x = 0
				var_42_23.localEulerAngles = var_42_31
			end

			local var_42_32 = 0

			if var_42_32 < arg_39_1.time_ and arg_39_1.time_ <= var_42_32 + arg_42_0 then
				arg_39_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_42_33 = 0
			local var_42_34 = 0.3

			if var_42_33 < arg_39_1.time_ and arg_39_1.time_ <= var_42_33 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_35 = arg_39_1:FormatText(StoryNameCfg[8].name)

				arg_39_1.leftNameTxt_.text = var_42_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_36 = arg_39_1:GetWordFromCfg(104061010)
				local var_42_37 = arg_39_1:FormatText(var_42_36.content)

				arg_39_1.text_.text = var_42_37

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_38 = 12
				local var_42_39 = utf8.len(var_42_37)
				local var_42_40 = var_42_38 <= 0 and var_42_34 or var_42_34 * (var_42_39 / var_42_38)

				if var_42_40 > 0 and var_42_34 < var_42_40 then
					arg_39_1.talkMaxDuration = var_42_40

					if var_42_40 + var_42_33 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_40 + var_42_33
					end
				end

				arg_39_1.text_.text = var_42_37
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061010", "story_v_out_104061.awb") ~= 0 then
					local var_42_41 = manager.audio:GetVoiceLength("story_v_out_104061", "104061010", "story_v_out_104061.awb") / 1000

					if var_42_41 + var_42_33 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_41 + var_42_33
					end

					if var_42_36.prefab_name ~= "" and arg_39_1.actors_[var_42_36.prefab_name] ~= nil then
						local var_42_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_36.prefab_name].transform, "story_v_out_104061", "104061010", "story_v_out_104061.awb")

						arg_39_1:RecordAudio("104061010", var_42_42)
						arg_39_1:RecordAudio("104061010", var_42_42)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104061", "104061010", "story_v_out_104061.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104061", "104061010", "story_v_out_104061.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_43 = math.max(var_42_34, arg_39_1.talkMaxDuration)

			if var_42_33 <= arg_39_1.time_ and arg_39_1.time_ < var_42_33 + var_42_43 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_33) / var_42_43

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_33 + var_42_43 and arg_39_1.time_ < var_42_33 + var_42_43 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play104061011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104061011
		arg_43_1.duration_ = 7.333

		local var_43_0 = {
			ja = 7.333,
			ko = 4.466,
			zh = 4.1,
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
				arg_43_0:Play104061012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1148ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1148ui_story == nil then
				arg_43_1.var_.characterEffect1148ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1148ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1148ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1148ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1148ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.5

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[21].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1035")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(104061011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 20
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061011", "story_v_out_104061.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_104061", "104061011", "story_v_out_104061.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_104061", "104061011", "story_v_out_104061.awb")

						arg_43_1:RecordAudio("104061011", var_46_15)
						arg_43_1:RecordAudio("104061011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_104061", "104061011", "story_v_out_104061.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_104061", "104061011", "story_v_out_104061.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_16 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_16 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_16

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_16 and arg_43_1.time_ < var_46_6 + var_46_16 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play104061012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 104061012
		arg_47_1.duration_ = 4.1

		local var_47_0 = {
			ja = 2.833,
			ko = 4.1,
			zh = 2.9,
			en = 3.033
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
				arg_47_0:Play104061013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1059ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1059ui_story == nil then
				arg_47_1.var_.characterEffect1059ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1059ui_story then
					arg_47_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1059ui_story then
				arg_47_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1148ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1148ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0, 100, 0)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1148ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, 100, 0)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = arg_47_1.actors_["1059ui_story"].transform
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1.var_.moveOldPos1059ui_story = var_50_13.localPosition
			end

			local var_50_15 = 0.001

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15
				local var_50_17 = Vector3.New(0, -1.05, -6)

				var_50_13.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1059ui_story, var_50_17, var_50_16)

				local var_50_18 = manager.ui.mainCamera.transform.position - var_50_13.position

				var_50_13.forward = Vector3.New(var_50_18.x, var_50_18.y, var_50_18.z)

				local var_50_19 = var_50_13.localEulerAngles

				var_50_19.z = 0
				var_50_19.x = 0
				var_50_13.localEulerAngles = var_50_19
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 then
				var_50_13.localPosition = Vector3.New(0, -1.05, -6)

				local var_50_20 = manager.ui.mainCamera.transform.position - var_50_13.position

				var_50_13.forward = Vector3.New(var_50_20.x, var_50_20.y, var_50_20.z)

				local var_50_21 = var_50_13.localEulerAngles

				var_50_21.z = 0
				var_50_21.x = 0
				var_50_13.localEulerAngles = var_50_21
			end

			local var_50_22 = 0

			if var_50_22 < arg_47_1.time_ and arg_47_1.time_ <= var_50_22 + arg_50_0 then
				arg_47_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_50_23 = 0

			if var_50_23 < arg_47_1.time_ and arg_47_1.time_ <= var_50_23 + arg_50_0 then
				arg_47_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_24 = 0
			local var_50_25 = 0.375

			if var_50_24 < arg_47_1.time_ and arg_47_1.time_ <= var_50_24 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_26 = arg_47_1:FormatText(StoryNameCfg[28].name)

				arg_47_1.leftNameTxt_.text = var_50_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_27 = arg_47_1:GetWordFromCfg(104061012)
				local var_50_28 = arg_47_1:FormatText(var_50_27.content)

				arg_47_1.text_.text = var_50_28

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_29 = 15
				local var_50_30 = utf8.len(var_50_28)
				local var_50_31 = var_50_29 <= 0 and var_50_25 or var_50_25 * (var_50_30 / var_50_29)

				if var_50_31 > 0 and var_50_25 < var_50_31 then
					arg_47_1.talkMaxDuration = var_50_31

					if var_50_31 + var_50_24 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_31 + var_50_24
					end
				end

				arg_47_1.text_.text = var_50_28
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061012", "story_v_out_104061.awb") ~= 0 then
					local var_50_32 = manager.audio:GetVoiceLength("story_v_out_104061", "104061012", "story_v_out_104061.awb") / 1000

					if var_50_32 + var_50_24 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_32 + var_50_24
					end

					if var_50_27.prefab_name ~= "" and arg_47_1.actors_[var_50_27.prefab_name] ~= nil then
						local var_50_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_27.prefab_name].transform, "story_v_out_104061", "104061012", "story_v_out_104061.awb")

						arg_47_1:RecordAudio("104061012", var_50_33)
						arg_47_1:RecordAudio("104061012", var_50_33)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_104061", "104061012", "story_v_out_104061.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_104061", "104061012", "story_v_out_104061.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_34 = math.max(var_50_25, arg_47_1.talkMaxDuration)

			if var_50_24 <= arg_47_1.time_ and arg_47_1.time_ < var_50_24 + var_50_34 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_24) / var_50_34

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_24 + var_50_34 and arg_47_1.time_ < var_50_24 + var_50_34 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play104061013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 104061013
		arg_51_1.duration_ = 6.766

		local var_51_0 = {
			ja = 6.766,
			ko = 6.1,
			zh = 3.166,
			en = 3.7
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
				arg_51_0:Play104061015(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1148ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1148ui_story == nil then
				arg_51_1.var_.characterEffect1148ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1148ui_story then
					arg_51_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1148ui_story then
				arg_51_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1059ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect1059ui_story == nil then
				arg_51_1.var_.characterEffect1059ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1059ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1059ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect1059ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1059ui_story.fillRatio = var_54_9
			end

			local var_54_10 = arg_51_1.actors_["1059ui_story"].transform
			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.var_.moveOldPos1059ui_story = var_54_10.localPosition
			end

			local var_54_12 = 0.001

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_12 then
				local var_54_13 = (arg_51_1.time_ - var_54_11) / var_54_12
				local var_54_14 = Vector3.New(0, 100, 0)

				var_54_10.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1059ui_story, var_54_14, var_54_13)

				local var_54_15 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_15.x, var_54_15.y, var_54_15.z)

				local var_54_16 = var_54_10.localEulerAngles

				var_54_16.z = 0
				var_54_16.x = 0
				var_54_10.localEulerAngles = var_54_16
			end

			if arg_51_1.time_ >= var_54_11 + var_54_12 and arg_51_1.time_ < var_54_11 + var_54_12 + arg_54_0 then
				var_54_10.localPosition = Vector3.New(0, 100, 0)

				local var_54_17 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_17.x, var_54_17.y, var_54_17.z)

				local var_54_18 = var_54_10.localEulerAngles

				var_54_18.z = 0
				var_54_18.x = 0
				var_54_10.localEulerAngles = var_54_18
			end

			local var_54_19 = arg_51_1.actors_["1148ui_story"].transform
			local var_54_20 = 0

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.var_.moveOldPos1148ui_story = var_54_19.localPosition
			end

			local var_54_21 = 0.001

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_21 then
				local var_54_22 = (arg_51_1.time_ - var_54_20) / var_54_21
				local var_54_23 = Vector3.New(0, -0.8, -6.2)

				var_54_19.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1148ui_story, var_54_23, var_54_22)

				local var_54_24 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_24.x, var_54_24.y, var_54_24.z)

				local var_54_25 = var_54_19.localEulerAngles

				var_54_25.z = 0
				var_54_25.x = 0
				var_54_19.localEulerAngles = var_54_25
			end

			if arg_51_1.time_ >= var_54_20 + var_54_21 and arg_51_1.time_ < var_54_20 + var_54_21 + arg_54_0 then
				var_54_19.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_54_26 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_26.x, var_54_26.y, var_54_26.z)

				local var_54_27 = var_54_19.localEulerAngles

				var_54_27.z = 0
				var_54_27.x = 0
				var_54_19.localEulerAngles = var_54_27
			end

			local var_54_28 = 0

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action6_1")
			end

			local var_54_29 = 0

			if var_54_29 < arg_51_1.time_ and arg_51_1.time_ <= var_54_29 + arg_54_0 then
				arg_51_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_54_30 = 0
			local var_54_31 = 0.375

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_32 = arg_51_1:FormatText(StoryNameCfg[8].name)

				arg_51_1.leftNameTxt_.text = var_54_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_33 = arg_51_1:GetWordFromCfg(104061013)
				local var_54_34 = arg_51_1:FormatText(var_54_33.content)

				arg_51_1.text_.text = var_54_34

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_35 = 15
				local var_54_36 = utf8.len(var_54_34)
				local var_54_37 = var_54_35 <= 0 and var_54_31 or var_54_31 * (var_54_36 / var_54_35)

				if var_54_37 > 0 and var_54_31 < var_54_37 then
					arg_51_1.talkMaxDuration = var_54_37

					if var_54_37 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_37 + var_54_30
					end
				end

				arg_51_1.text_.text = var_54_34
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061013", "story_v_out_104061.awb") ~= 0 then
					local var_54_38 = manager.audio:GetVoiceLength("story_v_out_104061", "104061013", "story_v_out_104061.awb") / 1000

					if var_54_38 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_38 + var_54_30
					end

					if var_54_33.prefab_name ~= "" and arg_51_1.actors_[var_54_33.prefab_name] ~= nil then
						local var_54_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_33.prefab_name].transform, "story_v_out_104061", "104061013", "story_v_out_104061.awb")

						arg_51_1:RecordAudio("104061013", var_54_39)
						arg_51_1:RecordAudio("104061013", var_54_39)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_104061", "104061013", "story_v_out_104061.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_104061", "104061013", "story_v_out_104061.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_40 = math.max(var_54_31, arg_51_1.talkMaxDuration)

			if var_54_30 <= arg_51_1.time_ and arg_51_1.time_ < var_54_30 + var_54_40 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_30) / var_54_40

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_30 + var_54_40 and arg_51_1.time_ < var_54_30 + var_54_40 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play104061015 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 104061015
		arg_55_1.duration_ = 6.266

		local var_55_0 = {
			ja = 6.266,
			ko = 4.733,
			zh = 4.366,
			en = 5.5
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
				arg_55_0:Play104061016(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_2 = "play"
				local var_58_3 = "effect"

				arg_55_1:AudioAction(var_58_2, var_58_3, "se_story", "se_story_robot_long", "")
			end

			local var_58_4 = "3005_tpose"

			if arg_55_1.actors_[var_58_4] == nil then
				local var_58_5 = Object.Instantiate(Asset.Load("Char/" .. var_58_4), arg_55_1.stage_.transform)

				var_58_5.name = var_58_4
				var_58_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.actors_[var_58_4] = var_58_5

				local var_58_6 = var_58_5:GetComponentInChildren(typeof(CharacterEffect))

				var_58_6.enabled = true

				local var_58_7 = GameObjectTools.GetOrAddComponent(var_58_5, typeof(DynamicBoneHelper))

				if var_58_7 then
					var_58_7:EnableDynamicBone(false)
				end

				arg_55_1:ShowWeapon(var_58_6.transform, false)

				arg_55_1.var_[var_58_4 .. "Animator"] = var_58_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_55_1.var_[var_58_4 .. "Animator"].applyRootMotion = true
				arg_55_1.var_[var_58_4 .. "LipSync"] = var_58_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_58_8 = arg_55_1.actors_["3005_tpose"]
			local var_58_9 = 0

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 and arg_55_1.var_.characterEffect3005_tpose == nil then
				arg_55_1.var_.characterEffect3005_tpose = var_58_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_10 = 0.1

			if var_58_9 <= arg_55_1.time_ and arg_55_1.time_ < var_58_9 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_9) / var_58_10

				if arg_55_1.var_.characterEffect3005_tpose then
					arg_55_1.var_.characterEffect3005_tpose.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_9 + var_58_10 and arg_55_1.time_ < var_58_9 + var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect3005_tpose then
				arg_55_1.var_.characterEffect3005_tpose.fillFlat = false
			end

			local var_58_12 = arg_55_1.actors_["1148ui_story"]
			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 and arg_55_1.var_.characterEffect1148ui_story == nil then
				arg_55_1.var_.characterEffect1148ui_story = var_58_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_14 = 0.1

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_14 then
				local var_58_15 = (arg_55_1.time_ - var_58_13) / var_58_14

				if arg_55_1.var_.characterEffect1148ui_story then
					local var_58_16 = Mathf.Lerp(0, 0.5, var_58_15)

					arg_55_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1148ui_story.fillRatio = var_58_16
				end
			end

			if arg_55_1.time_ >= var_58_13 + var_58_14 and arg_55_1.time_ < var_58_13 + var_58_14 + arg_58_0 and arg_55_1.var_.characterEffect1148ui_story then
				local var_58_17 = 0.5

				arg_55_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1148ui_story.fillRatio = var_58_17
			end

			local var_58_18 = arg_55_1.actors_["1148ui_story"].transform
			local var_58_19 = 0

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.var_.moveOldPos1148ui_story = var_58_18.localPosition
			end

			local var_58_20 = 0.001

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_20 then
				local var_58_21 = (arg_55_1.time_ - var_58_19) / var_58_20
				local var_58_22 = Vector3.New(0, 100, 0)

				var_58_18.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1148ui_story, var_58_22, var_58_21)

				local var_58_23 = manager.ui.mainCamera.transform.position - var_58_18.position

				var_58_18.forward = Vector3.New(var_58_23.x, var_58_23.y, var_58_23.z)

				local var_58_24 = var_58_18.localEulerAngles

				var_58_24.z = 0
				var_58_24.x = 0
				var_58_18.localEulerAngles = var_58_24
			end

			if arg_55_1.time_ >= var_58_19 + var_58_20 and arg_55_1.time_ < var_58_19 + var_58_20 + arg_58_0 then
				var_58_18.localPosition = Vector3.New(0, 100, 0)

				local var_58_25 = manager.ui.mainCamera.transform.position - var_58_18.position

				var_58_18.forward = Vector3.New(var_58_25.x, var_58_25.y, var_58_25.z)

				local var_58_26 = var_58_18.localEulerAngles

				var_58_26.z = 0
				var_58_26.x = 0
				var_58_18.localEulerAngles = var_58_26
			end

			local var_58_27 = arg_55_1.actors_["3005_tpose"].transform
			local var_58_28 = 0

			if var_58_28 < arg_55_1.time_ and arg_55_1.time_ <= var_58_28 + arg_58_0 then
				arg_55_1.var_.moveOldPos3005_tpose = var_58_27.localPosition
			end

			local var_58_29 = 0.001

			if var_58_28 <= arg_55_1.time_ and arg_55_1.time_ < var_58_28 + var_58_29 then
				local var_58_30 = (arg_55_1.time_ - var_58_28) / var_58_29
				local var_58_31 = Vector3.New(0, -1.95, -2.63)

				var_58_27.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos3005_tpose, var_58_31, var_58_30)

				local var_58_32 = manager.ui.mainCamera.transform.position - var_58_27.position

				var_58_27.forward = Vector3.New(var_58_32.x, var_58_32.y, var_58_32.z)

				local var_58_33 = var_58_27.localEulerAngles

				var_58_33.z = 0
				var_58_33.x = 0
				var_58_27.localEulerAngles = var_58_33
			end

			if arg_55_1.time_ >= var_58_28 + var_58_29 and arg_55_1.time_ < var_58_28 + var_58_29 + arg_58_0 then
				var_58_27.localPosition = Vector3.New(0, -1.95, -2.63)

				local var_58_34 = manager.ui.mainCamera.transform.position - var_58_27.position

				var_58_27.forward = Vector3.New(var_58_34.x, var_58_34.y, var_58_34.z)

				local var_58_35 = var_58_27.localEulerAngles

				var_58_35.z = 0
				var_58_35.x = 0
				var_58_27.localEulerAngles = var_58_35
			end

			local var_58_36 = 0

			if var_58_36 < arg_55_1.time_ and arg_55_1.time_ <= var_58_36 + arg_58_0 then
				arg_55_1:PlayTimeline("3005_tpose", "StoryTimeline/CharAction/story3005/story3005action/3005action1_1")
			end

			local var_58_37 = 0
			local var_58_38 = 0.6

			if var_58_37 < arg_55_1.time_ and arg_55_1.time_ <= var_58_37 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_39 = arg_55_1:FormatText(StoryNameCfg[58].name)

				arg_55_1.leftNameTxt_.text = var_58_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_40 = arg_55_1:GetWordFromCfg(104061015)
				local var_58_41 = arg_55_1:FormatText(var_58_40.content)

				arg_55_1.text_.text = var_58_41

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_42 = 23
				local var_58_43 = utf8.len(var_58_41)
				local var_58_44 = var_58_42 <= 0 and var_58_38 or var_58_38 * (var_58_43 / var_58_42)

				if var_58_44 > 0 and var_58_38 < var_58_44 then
					arg_55_1.talkMaxDuration = var_58_44

					if var_58_44 + var_58_37 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_44 + var_58_37
					end
				end

				arg_55_1.text_.text = var_58_41
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061015", "story_v_out_104061.awb") ~= 0 then
					local var_58_45 = manager.audio:GetVoiceLength("story_v_out_104061", "104061015", "story_v_out_104061.awb") / 1000

					if var_58_45 + var_58_37 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_45 + var_58_37
					end

					if var_58_40.prefab_name ~= "" and arg_55_1.actors_[var_58_40.prefab_name] ~= nil then
						local var_58_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_40.prefab_name].transform, "story_v_out_104061", "104061015", "story_v_out_104061.awb")

						arg_55_1:RecordAudio("104061015", var_58_46)
						arg_55_1:RecordAudio("104061015", var_58_46)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_104061", "104061015", "story_v_out_104061.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_104061", "104061015", "story_v_out_104061.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_47 = math.max(var_58_38, arg_55_1.talkMaxDuration)

			if var_58_37 <= arg_55_1.time_ and arg_55_1.time_ < var_58_37 + var_58_47 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_37) / var_58_47

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_37 + var_58_47 and arg_55_1.time_ < var_58_37 + var_58_47 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play104061016 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 104061016
		arg_59_1.duration_ = 2.533

		local var_59_0 = {
			ja = 2.533,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.2
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
				arg_59_0:Play104061017(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1148ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1148ui_story == nil then
				arg_59_1.var_.characterEffect1148ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1148ui_story then
					arg_59_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1148ui_story then
				arg_59_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["3005_tpose"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect3005_tpose == nil then
				arg_59_1.var_.characterEffect3005_tpose = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect3005_tpose then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect3005_tpose.fillFlat = true
					arg_59_1.var_.characterEffect3005_tpose.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect3005_tpose then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect3005_tpose.fillFlat = true
				arg_59_1.var_.characterEffect3005_tpose.fillRatio = var_62_9
			end

			local var_62_10 = arg_59_1.actors_["3005_tpose"].transform
			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1.var_.moveOldPos3005_tpose = var_62_10.localPosition
			end

			local var_62_12 = 0.001

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				local var_62_13 = (arg_59_1.time_ - var_62_11) / var_62_12
				local var_62_14 = Vector3.New(0, 100, 0)

				var_62_10.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos3005_tpose, var_62_14, var_62_13)

				local var_62_15 = manager.ui.mainCamera.transform.position - var_62_10.position

				var_62_10.forward = Vector3.New(var_62_15.x, var_62_15.y, var_62_15.z)

				local var_62_16 = var_62_10.localEulerAngles

				var_62_16.z = 0
				var_62_16.x = 0
				var_62_10.localEulerAngles = var_62_16
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 then
				var_62_10.localPosition = Vector3.New(0, 100, 0)

				local var_62_17 = manager.ui.mainCamera.transform.position - var_62_10.position

				var_62_10.forward = Vector3.New(var_62_17.x, var_62_17.y, var_62_17.z)

				local var_62_18 = var_62_10.localEulerAngles

				var_62_18.z = 0
				var_62_18.x = 0
				var_62_10.localEulerAngles = var_62_18
			end

			local var_62_19 = arg_59_1.actors_["1148ui_story"].transform
			local var_62_20 = 0

			if var_62_20 < arg_59_1.time_ and arg_59_1.time_ <= var_62_20 + arg_62_0 then
				arg_59_1.var_.moveOldPos1148ui_story = var_62_19.localPosition
			end

			local var_62_21 = 0.001

			if var_62_20 <= arg_59_1.time_ and arg_59_1.time_ < var_62_20 + var_62_21 then
				local var_62_22 = (arg_59_1.time_ - var_62_20) / var_62_21
				local var_62_23 = Vector3.New(0, -0.8, -6.2)

				var_62_19.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1148ui_story, var_62_23, var_62_22)

				local var_62_24 = manager.ui.mainCamera.transform.position - var_62_19.position

				var_62_19.forward = Vector3.New(var_62_24.x, var_62_24.y, var_62_24.z)

				local var_62_25 = var_62_19.localEulerAngles

				var_62_25.z = 0
				var_62_25.x = 0
				var_62_19.localEulerAngles = var_62_25
			end

			if arg_59_1.time_ >= var_62_20 + var_62_21 and arg_59_1.time_ < var_62_20 + var_62_21 + arg_62_0 then
				var_62_19.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_62_26 = manager.ui.mainCamera.transform.position - var_62_19.position

				var_62_19.forward = Vector3.New(var_62_26.x, var_62_26.y, var_62_26.z)

				local var_62_27 = var_62_19.localEulerAngles

				var_62_27.z = 0
				var_62_27.x = 0
				var_62_19.localEulerAngles = var_62_27
			end

			local var_62_28 = 0

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_62_29 = 0

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				arg_59_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_62_30 = 0
			local var_62_31 = 0.225

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_32 = arg_59_1:FormatText(StoryNameCfg[8].name)

				arg_59_1.leftNameTxt_.text = var_62_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_33 = arg_59_1:GetWordFromCfg(104061016)
				local var_62_34 = arg_59_1:FormatText(var_62_33.content)

				arg_59_1.text_.text = var_62_34

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_35 = 9
				local var_62_36 = utf8.len(var_62_34)
				local var_62_37 = var_62_35 <= 0 and var_62_31 or var_62_31 * (var_62_36 / var_62_35)

				if var_62_37 > 0 and var_62_31 < var_62_37 then
					arg_59_1.talkMaxDuration = var_62_37

					if var_62_37 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_37 + var_62_30
					end
				end

				arg_59_1.text_.text = var_62_34
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061016", "story_v_out_104061.awb") ~= 0 then
					local var_62_38 = manager.audio:GetVoiceLength("story_v_out_104061", "104061016", "story_v_out_104061.awb") / 1000

					if var_62_38 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_38 + var_62_30
					end

					if var_62_33.prefab_name ~= "" and arg_59_1.actors_[var_62_33.prefab_name] ~= nil then
						local var_62_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_33.prefab_name].transform, "story_v_out_104061", "104061016", "story_v_out_104061.awb")

						arg_59_1:RecordAudio("104061016", var_62_39)
						arg_59_1:RecordAudio("104061016", var_62_39)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_104061", "104061016", "story_v_out_104061.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_104061", "104061016", "story_v_out_104061.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_40 = math.max(var_62_31, arg_59_1.talkMaxDuration)

			if var_62_30 <= arg_59_1.time_ and arg_59_1.time_ < var_62_30 + var_62_40 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_30) / var_62_40

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_30 + var_62_40 and arg_59_1.time_ < var_62_30 + var_62_40 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play104061017 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 104061017
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play104061018(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_2 = "play"
				local var_66_3 = "effect"

				arg_63_1:AudioAction(var_66_2, var_66_3, "se_story_4", "se_story_4_arm_1", "")
			end

			local var_66_4 = arg_63_1.actors_["1148ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1148ui_story == nil then
				arg_63_1.var_.characterEffect1148ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1148ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1148ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1148ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1148ui_story.fillRatio = var_66_9
			end

			local var_66_10 = manager.ui.mainCamera.transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.shakeOldPosMainCamera = var_66_10.localPosition
			end

			local var_66_12 = 0.600000023841858

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / 0.066
				local var_66_14, var_66_15 = math.modf(var_66_13)

				var_66_10.localPosition = Vector3.New(var_66_15 * 0.13, var_66_15 * 0.13, var_66_15 * 0.13) + arg_63_1.var_.shakeOldPosMainCamera
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = arg_63_1.var_.shakeOldPosMainCamera
			end

			local var_66_16 = arg_63_1.actors_["1148ui_story"].transform
			local var_66_17 = 0

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				arg_63_1.var_.moveOldPos1148ui_story = var_66_16.localPosition
			end

			local var_66_18 = 0.001

			if var_66_17 <= arg_63_1.time_ and arg_63_1.time_ < var_66_17 + var_66_18 then
				local var_66_19 = (arg_63_1.time_ - var_66_17) / var_66_18
				local var_66_20 = Vector3.New(0, 100, 0)

				var_66_16.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1148ui_story, var_66_20, var_66_19)

				local var_66_21 = manager.ui.mainCamera.transform.position - var_66_16.position

				var_66_16.forward = Vector3.New(var_66_21.x, var_66_21.y, var_66_21.z)

				local var_66_22 = var_66_16.localEulerAngles

				var_66_22.z = 0
				var_66_22.x = 0
				var_66_16.localEulerAngles = var_66_22
			end

			if arg_63_1.time_ >= var_66_17 + var_66_18 and arg_63_1.time_ < var_66_17 + var_66_18 + arg_66_0 then
				var_66_16.localPosition = Vector3.New(0, 100, 0)

				local var_66_23 = manager.ui.mainCamera.transform.position - var_66_16.position

				var_66_16.forward = Vector3.New(var_66_23.x, var_66_23.y, var_66_23.z)

				local var_66_24 = var_66_16.localEulerAngles

				var_66_24.z = 0
				var_66_24.x = 0
				var_66_16.localEulerAngles = var_66_24
			end

			local var_66_25 = 0
			local var_66_26 = 1.05

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_27 = arg_63_1:GetWordFromCfg(104061017)
				local var_66_28 = arg_63_1:FormatText(var_66_27.content)

				arg_63_1.text_.text = var_66_28

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_29 = 42
				local var_66_30 = utf8.len(var_66_28)
				local var_66_31 = var_66_29 <= 0 and var_66_26 or var_66_26 * (var_66_30 / var_66_29)

				if var_66_31 > 0 and var_66_26 < var_66_31 then
					arg_63_1.talkMaxDuration = var_66_31

					if var_66_31 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_31 + var_66_25
					end
				end

				arg_63_1.text_.text = var_66_28
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_32 = math.max(var_66_26, arg_63_1.talkMaxDuration)

			if var_66_25 <= arg_63_1.time_ and arg_63_1.time_ < var_66_25 + var_66_32 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_25) / var_66_32

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_25 + var_66_32 and arg_63_1.time_ < var_66_25 + var_66_32 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play104061018 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 104061018
		arg_67_1.duration_ = 3.266

		local var_67_0 = {
			ja = 2.5,
			ko = 2.833,
			zh = 2.7,
			en = 3.266
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
				arg_67_0:Play104061019(arg_67_1)
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

			local var_70_4 = arg_67_1.actors_["1059ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos1059ui_story = var_70_4.localPosition
			end

			local var_70_6 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6
				local var_70_8 = Vector3.New(0, -1.05, -6)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1059ui_story, var_70_8, var_70_7)

				local var_70_9 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_9.x, var_70_9.y, var_70_9.z)

				local var_70_10 = var_70_4.localEulerAngles

				var_70_10.z = 0
				var_70_10.x = 0
				var_70_4.localEulerAngles = var_70_10
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_4.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_4.localEulerAngles = var_70_12
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_70_15 = 0
			local var_70_16 = 0.225

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_17 = arg_67_1:FormatText(StoryNameCfg[28].name)

				arg_67_1.leftNameTxt_.text = var_70_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_18 = arg_67_1:GetWordFromCfg(104061018)
				local var_70_19 = arg_67_1:FormatText(var_70_18.content)

				arg_67_1.text_.text = var_70_19

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_20 = 9
				local var_70_21 = utf8.len(var_70_19)
				local var_70_22 = var_70_20 <= 0 and var_70_16 or var_70_16 * (var_70_21 / var_70_20)

				if var_70_22 > 0 and var_70_16 < var_70_22 then
					arg_67_1.talkMaxDuration = var_70_22

					if var_70_22 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_22 + var_70_15
					end
				end

				arg_67_1.text_.text = var_70_19
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061018", "story_v_out_104061.awb") ~= 0 then
					local var_70_23 = manager.audio:GetVoiceLength("story_v_out_104061", "104061018", "story_v_out_104061.awb") / 1000

					if var_70_23 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_23 + var_70_15
					end

					if var_70_18.prefab_name ~= "" and arg_67_1.actors_[var_70_18.prefab_name] ~= nil then
						local var_70_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_18.prefab_name].transform, "story_v_out_104061", "104061018", "story_v_out_104061.awb")

						arg_67_1:RecordAudio("104061018", var_70_24)
						arg_67_1:RecordAudio("104061018", var_70_24)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_104061", "104061018", "story_v_out_104061.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_104061", "104061018", "story_v_out_104061.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_25 = math.max(var_70_16, arg_67_1.talkMaxDuration)

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_25 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_15) / var_70_25

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_15 + var_70_25 and arg_67_1.time_ < var_70_15 + var_70_25 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play104061019 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 104061019
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play104061020(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1059ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1059ui_story == nil then
				arg_71_1.var_.characterEffect1059ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.1

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1059ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1059ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1059ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1059ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.325

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[7].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(104061019)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 13
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
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_14 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_14 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_14

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_14 and arg_71_1.time_ < var_74_6 + var_74_14 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play104061020 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 104061020
		arg_75_1.duration_ = 1.833

		local var_75_0 = {
			ja = 1.833,
			ko = 1.499999999999,
			zh = 1.733,
			en = 1.633
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
				arg_75_0:Play104061021(arg_75_1)
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
					arg_75_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1059ui_story then
				arg_75_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_78_4 = 0

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action426")
			end

			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_6 = 0
			local var_78_7 = 0.2

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_8 = arg_75_1:FormatText(StoryNameCfg[28].name)

				arg_75_1.leftNameTxt_.text = var_78_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_9 = arg_75_1:GetWordFromCfg(104061020)
				local var_78_10 = arg_75_1:FormatText(var_78_9.content)

				arg_75_1.text_.text = var_78_10

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_11 = 8
				local var_78_12 = utf8.len(var_78_10)
				local var_78_13 = var_78_11 <= 0 and var_78_7 or var_78_7 * (var_78_12 / var_78_11)

				if var_78_13 > 0 and var_78_7 < var_78_13 then
					arg_75_1.talkMaxDuration = var_78_13

					if var_78_13 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_13 + var_78_6
					end
				end

				arg_75_1.text_.text = var_78_10
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061020", "story_v_out_104061.awb") ~= 0 then
					local var_78_14 = manager.audio:GetVoiceLength("story_v_out_104061", "104061020", "story_v_out_104061.awb") / 1000

					if var_78_14 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_14 + var_78_6
					end

					if var_78_9.prefab_name ~= "" and arg_75_1.actors_[var_78_9.prefab_name] ~= nil then
						local var_78_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_9.prefab_name].transform, "story_v_out_104061", "104061020", "story_v_out_104061.awb")

						arg_75_1:RecordAudio("104061020", var_78_15)
						arg_75_1:RecordAudio("104061020", var_78_15)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_104061", "104061020", "story_v_out_104061.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_104061", "104061020", "story_v_out_104061.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_16 = math.max(var_78_7, arg_75_1.talkMaxDuration)

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_16 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_6) / var_78_16

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_6 + var_78_16 and arg_75_1.time_ < var_78_6 + var_78_16 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play104061021 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 104061021
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play104061022(arg_79_1)
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
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1059ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1059ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1059ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.775

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[7].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(104061021)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 31
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_7 or var_82_7 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_7 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_14 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_14 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_14

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_14 and arg_79_1.time_ < var_82_6 + var_82_14 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play104061022 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 104061022
		arg_83_1.duration_ = 2.7

		local var_83_0 = {
			ja = 2.533,
			ko = 1.466,
			zh = 1.7,
			en = 2.7
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
				arg_83_0:Play104061023(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1059ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story == nil then
				arg_83_1.var_.characterEffect1059ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.1

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1059ui_story then
					arg_83_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story then
				arg_83_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_86_4 = 0

			if var_86_4 < arg_83_1.time_ and arg_83_1.time_ <= var_86_4 + arg_86_0 then
				arg_83_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_86_5 = 0
			local var_86_6 = 0.125

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_7 = arg_83_1:FormatText(StoryNameCfg[28].name)

				arg_83_1.leftNameTxt_.text = var_86_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_8 = arg_83_1:GetWordFromCfg(104061022)
				local var_86_9 = arg_83_1:FormatText(var_86_8.content)

				arg_83_1.text_.text = var_86_9

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_10 = 5
				local var_86_11 = utf8.len(var_86_9)
				local var_86_12 = var_86_10 <= 0 and var_86_6 or var_86_6 * (var_86_11 / var_86_10)

				if var_86_12 > 0 and var_86_6 < var_86_12 then
					arg_83_1.talkMaxDuration = var_86_12

					if var_86_12 + var_86_5 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_12 + var_86_5
					end
				end

				arg_83_1.text_.text = var_86_9
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061022", "story_v_out_104061.awb") ~= 0 then
					local var_86_13 = manager.audio:GetVoiceLength("story_v_out_104061", "104061022", "story_v_out_104061.awb") / 1000

					if var_86_13 + var_86_5 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_5
					end

					if var_86_8.prefab_name ~= "" and arg_83_1.actors_[var_86_8.prefab_name] ~= nil then
						local var_86_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_8.prefab_name].transform, "story_v_out_104061", "104061022", "story_v_out_104061.awb")

						arg_83_1:RecordAudio("104061022", var_86_14)
						arg_83_1:RecordAudio("104061022", var_86_14)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_104061", "104061022", "story_v_out_104061.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_104061", "104061022", "story_v_out_104061.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_15 = math.max(var_86_6, arg_83_1.talkMaxDuration)

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_15 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_5) / var_86_15

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_5 + var_86_15 and arg_83_1.time_ < var_86_5 + var_86_15 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play104061023 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 104061023
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play104061024(arg_87_1)
			end
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
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1059ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1059ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1059ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.275

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[7].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(104061023)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 11
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
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_14 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_14 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_14

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_14 and arg_87_1.time_ < var_90_6 + var_90_14 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play104061024 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 104061024
		arg_91_1.duration_ = 7.566

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play104061025(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				local var_94_2 = "play"
				local var_94_3 = "effect"

				arg_91_1:AudioAction(var_94_2, var_94_3, "se_story", "se_story_robot_short", "")
			end

			local var_94_4 = "2043_tpose"

			if arg_91_1.actors_[var_94_4] == nil then
				local var_94_5 = Object.Instantiate(Asset.Load("Char/" .. var_94_4), arg_91_1.stage_.transform)

				var_94_5.name = var_94_4
				var_94_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.actors_[var_94_4] = var_94_5

				local var_94_6 = var_94_5:GetComponentInChildren(typeof(CharacterEffect))

				var_94_6.enabled = true

				local var_94_7 = GameObjectTools.GetOrAddComponent(var_94_5, typeof(DynamicBoneHelper))

				if var_94_7 then
					var_94_7:EnableDynamicBone(false)
				end

				arg_91_1:ShowWeapon(var_94_6.transform, false)

				arg_91_1.var_[var_94_4 .. "Animator"] = var_94_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_91_1.var_[var_94_4 .. "Animator"].applyRootMotion = true
				arg_91_1.var_[var_94_4 .. "LipSync"] = var_94_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_94_8 = arg_91_1.actors_["2043_tpose"]
			local var_94_9 = 0

			if var_94_9 < arg_91_1.time_ and arg_91_1.time_ <= var_94_9 + arg_94_0 and arg_91_1.var_.characterEffect2043_tpose == nil then
				arg_91_1.var_.characterEffect2043_tpose = var_94_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_10 = 0.1

			if var_94_9 <= arg_91_1.time_ and arg_91_1.time_ < var_94_9 + var_94_10 then
				local var_94_11 = (arg_91_1.time_ - var_94_9) / var_94_10

				if arg_91_1.var_.characterEffect2043_tpose then
					arg_91_1.var_.characterEffect2043_tpose.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_9 + var_94_10 and arg_91_1.time_ < var_94_9 + var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect2043_tpose then
				arg_91_1.var_.characterEffect2043_tpose.fillFlat = false
			end

			local var_94_12 = arg_91_1.actors_["3005_tpose"]
			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 and arg_91_1.var_.characterEffect3005_tpose == nil then
				arg_91_1.var_.characterEffect3005_tpose = var_94_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_14 = 0.1

			if var_94_13 <= arg_91_1.time_ and arg_91_1.time_ < var_94_13 + var_94_14 then
				local var_94_15 = (arg_91_1.time_ - var_94_13) / var_94_14

				if arg_91_1.var_.characterEffect3005_tpose then
					arg_91_1.var_.characterEffect3005_tpose.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_13 + var_94_14 and arg_91_1.time_ < var_94_13 + var_94_14 + arg_94_0 and arg_91_1.var_.characterEffect3005_tpose then
				arg_91_1.var_.characterEffect3005_tpose.fillFlat = false
			end

			local var_94_16 = arg_91_1.actors_["1059ui_story"].transform
			local var_94_17 = 0

			if var_94_17 < arg_91_1.time_ and arg_91_1.time_ <= var_94_17 + arg_94_0 then
				arg_91_1.var_.moveOldPos1059ui_story = var_94_16.localPosition
			end

			local var_94_18 = 0.001

			if var_94_17 <= arg_91_1.time_ and arg_91_1.time_ < var_94_17 + var_94_18 then
				local var_94_19 = (arg_91_1.time_ - var_94_17) / var_94_18
				local var_94_20 = Vector3.New(0, 100, 0)

				var_94_16.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1059ui_story, var_94_20, var_94_19)

				local var_94_21 = manager.ui.mainCamera.transform.position - var_94_16.position

				var_94_16.forward = Vector3.New(var_94_21.x, var_94_21.y, var_94_21.z)

				local var_94_22 = var_94_16.localEulerAngles

				var_94_22.z = 0
				var_94_22.x = 0
				var_94_16.localEulerAngles = var_94_22
			end

			if arg_91_1.time_ >= var_94_17 + var_94_18 and arg_91_1.time_ < var_94_17 + var_94_18 + arg_94_0 then
				var_94_16.localPosition = Vector3.New(0, 100, 0)

				local var_94_23 = manager.ui.mainCamera.transform.position - var_94_16.position

				var_94_16.forward = Vector3.New(var_94_23.x, var_94_23.y, var_94_23.z)

				local var_94_24 = var_94_16.localEulerAngles

				var_94_24.z = 0
				var_94_24.x = 0
				var_94_16.localEulerAngles = var_94_24
			end

			local var_94_25 = arg_91_1.actors_["2043_tpose"].transform
			local var_94_26 = 0

			if var_94_26 < arg_91_1.time_ and arg_91_1.time_ <= var_94_26 + arg_94_0 then
				arg_91_1.var_.moveOldPos2043_tpose = var_94_25.localPosition
			end

			local var_94_27 = 0.001

			if var_94_26 <= arg_91_1.time_ and arg_91_1.time_ < var_94_26 + var_94_27 then
				local var_94_28 = (arg_91_1.time_ - var_94_26) / var_94_27
				local var_94_29 = Vector3.New(-0.7, -0.95, -3.2)

				var_94_25.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos2043_tpose, var_94_29, var_94_28)

				local var_94_30 = manager.ui.mainCamera.transform.position - var_94_25.position

				var_94_25.forward = Vector3.New(var_94_30.x, var_94_30.y, var_94_30.z)

				local var_94_31 = var_94_25.localEulerAngles

				var_94_31.z = 0
				var_94_31.x = 0
				var_94_25.localEulerAngles = var_94_31
			end

			if arg_91_1.time_ >= var_94_26 + var_94_27 and arg_91_1.time_ < var_94_26 + var_94_27 + arg_94_0 then
				var_94_25.localPosition = Vector3.New(-0.7, -0.95, -3.2)

				local var_94_32 = manager.ui.mainCamera.transform.position - var_94_25.position

				var_94_25.forward = Vector3.New(var_94_32.x, var_94_32.y, var_94_32.z)

				local var_94_33 = var_94_25.localEulerAngles

				var_94_33.z = 0
				var_94_33.x = 0
				var_94_25.localEulerAngles = var_94_33
			end

			local var_94_34 = 0

			if var_94_34 < arg_91_1.time_ and arg_91_1.time_ <= var_94_34 + arg_94_0 then
				arg_91_1:PlayTimeline("2043_tpose", "StoryTimeline/CharAction/story2043/story2043action/2043action1_1")
			end

			local var_94_35 = arg_91_1.actors_["3005_tpose"].transform
			local var_94_36 = 0

			if var_94_36 < arg_91_1.time_ and arg_91_1.time_ <= var_94_36 + arg_94_0 then
				arg_91_1.var_.moveOldPos3005_tpose = var_94_35.localPosition
			end

			local var_94_37 = 0.001

			if var_94_36 <= arg_91_1.time_ and arg_91_1.time_ < var_94_36 + var_94_37 then
				local var_94_38 = (arg_91_1.time_ - var_94_36) / var_94_37
				local var_94_39 = Vector3.New(0.7, -1.95, -2.35)

				var_94_35.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos3005_tpose, var_94_39, var_94_38)

				local var_94_40 = manager.ui.mainCamera.transform.position - var_94_35.position

				var_94_35.forward = Vector3.New(var_94_40.x, var_94_40.y, var_94_40.z)

				local var_94_41 = var_94_35.localEulerAngles

				var_94_41.z = 0
				var_94_41.x = 0
				var_94_35.localEulerAngles = var_94_41
			end

			if arg_91_1.time_ >= var_94_36 + var_94_37 and arg_91_1.time_ < var_94_36 + var_94_37 + arg_94_0 then
				var_94_35.localPosition = Vector3.New(0.7, -1.95, -2.35)

				local var_94_42 = manager.ui.mainCamera.transform.position - var_94_35.position

				var_94_35.forward = Vector3.New(var_94_42.x, var_94_42.y, var_94_42.z)

				local var_94_43 = var_94_35.localEulerAngles

				var_94_43.z = 0
				var_94_43.x = 0
				var_94_35.localEulerAngles = var_94_43
			end

			local var_94_44 = 0

			if var_94_44 < arg_91_1.time_ and arg_91_1.time_ <= var_94_44 + arg_94_0 then
				arg_91_1:PlayTimeline("3005_tpose", "StoryTimeline/CharAction/story3005/story3005action/3005action1_1")
			end

			local var_94_45 = 0
			local var_94_46 = 0.225

			if var_94_45 < arg_91_1.time_ and arg_91_1.time_ <= var_94_45 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_47 = arg_91_1:FormatText(StoryNameCfg[58].name)

				arg_91_1.leftNameTxt_.text = var_94_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_48 = arg_91_1:GetWordFromCfg(104061024)
				local var_94_49 = arg_91_1:FormatText(var_94_48.content)

				arg_91_1.text_.text = var_94_49

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_50 = 9
				local var_94_51 = utf8.len(var_94_49)
				local var_94_52 = var_94_50 <= 0 and var_94_46 or var_94_46 * (var_94_51 / var_94_50)

				if var_94_52 > 0 and var_94_46 < var_94_52 then
					arg_91_1.talkMaxDuration = var_94_52

					if var_94_52 + var_94_45 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_52 + var_94_45
					end
				end

				arg_91_1.text_.text = var_94_49
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061024", "story_v_out_104061.awb") ~= 0 then
					local var_94_53 = manager.audio:GetVoiceLength("story_v_out_104061", "104061024", "story_v_out_104061.awb") / 1000

					if var_94_53 + var_94_45 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_53 + var_94_45
					end

					if var_94_48.prefab_name ~= "" and arg_91_1.actors_[var_94_48.prefab_name] ~= nil then
						local var_94_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_48.prefab_name].transform, "story_v_out_104061", "104061024", "story_v_out_104061.awb")

						arg_91_1:RecordAudio("104061024", var_94_54)
						arg_91_1:RecordAudio("104061024", var_94_54)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_104061", "104061024", "story_v_out_104061.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_104061", "104061024", "story_v_out_104061.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_55 = math.max(var_94_46, arg_91_1.talkMaxDuration)

			if var_94_45 <= arg_91_1.time_ and arg_91_1.time_ < var_94_45 + var_94_55 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_45) / var_94_55

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_45 + var_94_55 and arg_91_1.time_ < var_94_45 + var_94_55 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play104061025 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 104061025
		arg_95_1.duration_ = 4.566

		local var_95_0 = {
			ja = 4.566,
			ko = 4.5,
			zh = 4.1,
			en = 4.5
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
				arg_95_0:Play104061026(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1148ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1148ui_story == nil then
				arg_95_1.var_.characterEffect1148ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1148ui_story then
					arg_95_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1148ui_story then
				arg_95_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_98_4 = arg_95_1.actors_["2043_tpose"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect2043_tpose == nil then
				arg_95_1.var_.characterEffect2043_tpose = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.1

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect2043_tpose then
					local var_98_8 = Mathf.Lerp(0, 0.5, var_98_7)

					arg_95_1.var_.characterEffect2043_tpose.fillFlat = true
					arg_95_1.var_.characterEffect2043_tpose.fillRatio = var_98_8
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect2043_tpose then
				local var_98_9 = 0.5

				arg_95_1.var_.characterEffect2043_tpose.fillFlat = true
				arg_95_1.var_.characterEffect2043_tpose.fillRatio = var_98_9
			end

			local var_98_10 = arg_95_1.actors_["3005_tpose"]
			local var_98_11 = 0

			if var_98_11 < arg_95_1.time_ and arg_95_1.time_ <= var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect3005_tpose == nil then
				arg_95_1.var_.characterEffect3005_tpose = var_98_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_12 = 0.1

			if var_98_11 <= arg_95_1.time_ and arg_95_1.time_ < var_98_11 + var_98_12 then
				local var_98_13 = (arg_95_1.time_ - var_98_11) / var_98_12

				if arg_95_1.var_.characterEffect3005_tpose then
					local var_98_14 = Mathf.Lerp(0, 0.5, var_98_13)

					arg_95_1.var_.characterEffect3005_tpose.fillFlat = true
					arg_95_1.var_.characterEffect3005_tpose.fillRatio = var_98_14
				end
			end

			if arg_95_1.time_ >= var_98_11 + var_98_12 and arg_95_1.time_ < var_98_11 + var_98_12 + arg_98_0 and arg_95_1.var_.characterEffect3005_tpose then
				local var_98_15 = 0.5

				arg_95_1.var_.characterEffect3005_tpose.fillFlat = true
				arg_95_1.var_.characterEffect3005_tpose.fillRatio = var_98_15
			end

			local var_98_16 = arg_95_1.actors_["2043_tpose"].transform
			local var_98_17 = 0

			if var_98_17 < arg_95_1.time_ and arg_95_1.time_ <= var_98_17 + arg_98_0 then
				arg_95_1.var_.moveOldPos2043_tpose = var_98_16.localPosition
			end

			local var_98_18 = 0.001

			if var_98_17 <= arg_95_1.time_ and arg_95_1.time_ < var_98_17 + var_98_18 then
				local var_98_19 = (arg_95_1.time_ - var_98_17) / var_98_18
				local var_98_20 = Vector3.New(0, 100, 0)

				var_98_16.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos2043_tpose, var_98_20, var_98_19)

				local var_98_21 = manager.ui.mainCamera.transform.position - var_98_16.position

				var_98_16.forward = Vector3.New(var_98_21.x, var_98_21.y, var_98_21.z)

				local var_98_22 = var_98_16.localEulerAngles

				var_98_22.z = 0
				var_98_22.x = 0
				var_98_16.localEulerAngles = var_98_22
			end

			if arg_95_1.time_ >= var_98_17 + var_98_18 and arg_95_1.time_ < var_98_17 + var_98_18 + arg_98_0 then
				var_98_16.localPosition = Vector3.New(0, 100, 0)

				local var_98_23 = manager.ui.mainCamera.transform.position - var_98_16.position

				var_98_16.forward = Vector3.New(var_98_23.x, var_98_23.y, var_98_23.z)

				local var_98_24 = var_98_16.localEulerAngles

				var_98_24.z = 0
				var_98_24.x = 0
				var_98_16.localEulerAngles = var_98_24
			end

			local var_98_25 = arg_95_1.actors_["3005_tpose"].transform
			local var_98_26 = 0

			if var_98_26 < arg_95_1.time_ and arg_95_1.time_ <= var_98_26 + arg_98_0 then
				arg_95_1.var_.moveOldPos3005_tpose = var_98_25.localPosition
			end

			local var_98_27 = 0.001

			if var_98_26 <= arg_95_1.time_ and arg_95_1.time_ < var_98_26 + var_98_27 then
				local var_98_28 = (arg_95_1.time_ - var_98_26) / var_98_27
				local var_98_29 = Vector3.New(0, 100, 0)

				var_98_25.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos3005_tpose, var_98_29, var_98_28)

				local var_98_30 = manager.ui.mainCamera.transform.position - var_98_25.position

				var_98_25.forward = Vector3.New(var_98_30.x, var_98_30.y, var_98_30.z)

				local var_98_31 = var_98_25.localEulerAngles

				var_98_31.z = 0
				var_98_31.x = 0
				var_98_25.localEulerAngles = var_98_31
			end

			if arg_95_1.time_ >= var_98_26 + var_98_27 and arg_95_1.time_ < var_98_26 + var_98_27 + arg_98_0 then
				var_98_25.localPosition = Vector3.New(0, 100, 0)

				local var_98_32 = manager.ui.mainCamera.transform.position - var_98_25.position

				var_98_25.forward = Vector3.New(var_98_32.x, var_98_32.y, var_98_32.z)

				local var_98_33 = var_98_25.localEulerAngles

				var_98_33.z = 0
				var_98_33.x = 0
				var_98_25.localEulerAngles = var_98_33
			end

			local var_98_34 = arg_95_1.actors_["1148ui_story"].transform
			local var_98_35 = 0

			if var_98_35 < arg_95_1.time_ and arg_95_1.time_ <= var_98_35 + arg_98_0 then
				arg_95_1.var_.moveOldPos1148ui_story = var_98_34.localPosition
			end

			local var_98_36 = 0.001

			if var_98_35 <= arg_95_1.time_ and arg_95_1.time_ < var_98_35 + var_98_36 then
				local var_98_37 = (arg_95_1.time_ - var_98_35) / var_98_36
				local var_98_38 = Vector3.New(0, -0.8, -6.2)

				var_98_34.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1148ui_story, var_98_38, var_98_37)

				local var_98_39 = manager.ui.mainCamera.transform.position - var_98_34.position

				var_98_34.forward = Vector3.New(var_98_39.x, var_98_39.y, var_98_39.z)

				local var_98_40 = var_98_34.localEulerAngles

				var_98_40.z = 0
				var_98_40.x = 0
				var_98_34.localEulerAngles = var_98_40
			end

			if arg_95_1.time_ >= var_98_35 + var_98_36 and arg_95_1.time_ < var_98_35 + var_98_36 + arg_98_0 then
				var_98_34.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_98_41 = manager.ui.mainCamera.transform.position - var_98_34.position

				var_98_34.forward = Vector3.New(var_98_41.x, var_98_41.y, var_98_41.z)

				local var_98_42 = var_98_34.localEulerAngles

				var_98_42.z = 0
				var_98_42.x = 0
				var_98_34.localEulerAngles = var_98_42
			end

			local var_98_43 = 0

			if var_98_43 < arg_95_1.time_ and arg_95_1.time_ <= var_98_43 + arg_98_0 then
				arg_95_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action5_1")
			end

			local var_98_44 = 0

			if var_98_44 < arg_95_1.time_ and arg_95_1.time_ <= var_98_44 + arg_98_0 then
				arg_95_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_98_45 = 0
			local var_98_46 = 0.4

			if var_98_45 < arg_95_1.time_ and arg_95_1.time_ <= var_98_45 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_47 = arg_95_1:FormatText(StoryNameCfg[8].name)

				arg_95_1.leftNameTxt_.text = var_98_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_48 = arg_95_1:GetWordFromCfg(104061025)
				local var_98_49 = arg_95_1:FormatText(var_98_48.content)

				arg_95_1.text_.text = var_98_49

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_50 = 16
				local var_98_51 = utf8.len(var_98_49)
				local var_98_52 = var_98_50 <= 0 and var_98_46 or var_98_46 * (var_98_51 / var_98_50)

				if var_98_52 > 0 and var_98_46 < var_98_52 then
					arg_95_1.talkMaxDuration = var_98_52

					if var_98_52 + var_98_45 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_52 + var_98_45
					end
				end

				arg_95_1.text_.text = var_98_49
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061025", "story_v_out_104061.awb") ~= 0 then
					local var_98_53 = manager.audio:GetVoiceLength("story_v_out_104061", "104061025", "story_v_out_104061.awb") / 1000

					if var_98_53 + var_98_45 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_53 + var_98_45
					end

					if var_98_48.prefab_name ~= "" and arg_95_1.actors_[var_98_48.prefab_name] ~= nil then
						local var_98_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_48.prefab_name].transform, "story_v_out_104061", "104061025", "story_v_out_104061.awb")

						arg_95_1:RecordAudio("104061025", var_98_54)
						arg_95_1:RecordAudio("104061025", var_98_54)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_104061", "104061025", "story_v_out_104061.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_104061", "104061025", "story_v_out_104061.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_55 = math.max(var_98_46, arg_95_1.talkMaxDuration)

			if var_98_45 <= arg_95_1.time_ and arg_95_1.time_ < var_98_45 + var_98_55 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_45) / var_98_55

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_45 + var_98_55 and arg_95_1.time_ < var_98_45 + var_98_55 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play104061026 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 104061026
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play104061027(arg_99_1)
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
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1148ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1148ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1148ui_story.fillRatio = var_102_5
			end

			local var_102_6 = arg_99_1.actors_["1148ui_story"].transform
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 then
				arg_99_1.var_.moveOldPos1148ui_story = var_102_6.localPosition
			end

			local var_102_8 = 0.001

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8
				local var_102_10 = Vector3.New(0, 100, 0)

				var_102_6.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1148ui_story, var_102_10, var_102_9)

				local var_102_11 = manager.ui.mainCamera.transform.position - var_102_6.position

				var_102_6.forward = Vector3.New(var_102_11.x, var_102_11.y, var_102_11.z)

				local var_102_12 = var_102_6.localEulerAngles

				var_102_12.z = 0
				var_102_12.x = 0
				var_102_6.localEulerAngles = var_102_12
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 then
				var_102_6.localPosition = Vector3.New(0, 100, 0)

				local var_102_13 = manager.ui.mainCamera.transform.position - var_102_6.position

				var_102_6.forward = Vector3.New(var_102_13.x, var_102_13.y, var_102_13.z)

				local var_102_14 = var_102_6.localEulerAngles

				var_102_14.z = 0
				var_102_14.x = 0
				var_102_6.localEulerAngles = var_102_14
			end

			local var_102_15 = 0

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_102_16 = 0
			local var_102_17 = 1.275

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(104061026)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 51
				local var_102_21 = utf8.len(var_102_19)
				local var_102_22 = var_102_20 <= 0 and var_102_17 or var_102_17 * (var_102_21 / var_102_20)

				if var_102_22 > 0 and var_102_17 < var_102_22 then
					arg_99_1.talkMaxDuration = var_102_22

					if var_102_22 + var_102_16 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_16
					end
				end

				arg_99_1.text_.text = var_102_19
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_23 = math.max(var_102_17, arg_99_1.talkMaxDuration)

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_23 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_16) / var_102_23

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_16 + var_102_23 and arg_99_1.time_ < var_102_16 + var_102_23 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play104061027 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 104061027
		arg_103_1.duration_ = 4.3

		local var_103_0 = {
			ja = 4.3,
			ko = 3.033,
			zh = 3.766,
			en = 3.2
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
				arg_103_0:Play104061028(arg_103_1)
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

			local var_106_4 = arg_103_1.actors_["1059ui_story"].transform
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1.var_.moveOldPos1059ui_story = var_106_4.localPosition
			end

			local var_106_6 = 0.001

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6
				local var_106_8 = Vector3.New(0, -1.05, -6)

				var_106_4.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1059ui_story, var_106_8, var_106_7)

				local var_106_9 = manager.ui.mainCamera.transform.position - var_106_4.position

				var_106_4.forward = Vector3.New(var_106_9.x, var_106_9.y, var_106_9.z)

				local var_106_10 = var_106_4.localEulerAngles

				var_106_10.z = 0
				var_106_10.x = 0
				var_106_4.localEulerAngles = var_106_10
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 then
				var_106_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_106_11 = manager.ui.mainCamera.transform.position - var_106_4.position

				var_106_4.forward = Vector3.New(var_106_11.x, var_106_11.y, var_106_11.z)

				local var_106_12 = var_106_4.localEulerAngles

				var_106_12.z = 0
				var_106_12.x = 0
				var_106_4.localEulerAngles = var_106_12
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_106_14 = 0
			local var_106_15 = 0.4

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_16 = arg_103_1:FormatText(StoryNameCfg[28].name)

				arg_103_1.leftNameTxt_.text = var_106_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_17 = arg_103_1:GetWordFromCfg(104061027)
				local var_106_18 = arg_103_1:FormatText(var_106_17.content)

				arg_103_1.text_.text = var_106_18

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_19 = 16
				local var_106_20 = utf8.len(var_106_18)
				local var_106_21 = var_106_19 <= 0 and var_106_15 or var_106_15 * (var_106_20 / var_106_19)

				if var_106_21 > 0 and var_106_15 < var_106_21 then
					arg_103_1.talkMaxDuration = var_106_21

					if var_106_21 + var_106_14 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_21 + var_106_14
					end
				end

				arg_103_1.text_.text = var_106_18
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061027", "story_v_out_104061.awb") ~= 0 then
					local var_106_22 = manager.audio:GetVoiceLength("story_v_out_104061", "104061027", "story_v_out_104061.awb") / 1000

					if var_106_22 + var_106_14 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_22 + var_106_14
					end

					if var_106_17.prefab_name ~= "" and arg_103_1.actors_[var_106_17.prefab_name] ~= nil then
						local var_106_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_17.prefab_name].transform, "story_v_out_104061", "104061027", "story_v_out_104061.awb")

						arg_103_1:RecordAudio("104061027", var_106_23)
						arg_103_1:RecordAudio("104061027", var_106_23)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_104061", "104061027", "story_v_out_104061.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_104061", "104061027", "story_v_out_104061.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_24 = math.max(var_106_15, arg_103_1.talkMaxDuration)

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_24 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_14) / var_106_24

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_14 + var_106_24 and arg_103_1.time_ < var_106_14 + var_106_24 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play104061028 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 104061028
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play104061029(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				local var_110_2 = "play"
				local var_110_3 = "effect"

				arg_107_1:AudioAction(var_110_2, var_110_3, "se_story_4", "se_story_4_arm_2", "")
			end

			local var_110_4 = arg_107_1.actors_["3005_tpose"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect3005_tpose == nil then
				arg_107_1.var_.characterEffect3005_tpose = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.1

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect3005_tpose then
					arg_107_1.var_.characterEffect3005_tpose.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect3005_tpose then
				arg_107_1.var_.characterEffect3005_tpose.fillFlat = false
			end

			local var_110_8 = arg_107_1.actors_["1059ui_story"]
			local var_110_9 = 0

			if var_110_9 < arg_107_1.time_ and arg_107_1.time_ <= var_110_9 + arg_110_0 and arg_107_1.var_.characterEffect1059ui_story == nil then
				arg_107_1.var_.characterEffect1059ui_story = var_110_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_10 = 0.1

			if var_110_9 <= arg_107_1.time_ and arg_107_1.time_ < var_110_9 + var_110_10 then
				local var_110_11 = (arg_107_1.time_ - var_110_9) / var_110_10

				if arg_107_1.var_.characterEffect1059ui_story then
					local var_110_12 = Mathf.Lerp(0, 0.5, var_110_11)

					arg_107_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1059ui_story.fillRatio = var_110_12
				end
			end

			if arg_107_1.time_ >= var_110_9 + var_110_10 and arg_107_1.time_ < var_110_9 + var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1059ui_story then
				local var_110_13 = 0.5

				arg_107_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1059ui_story.fillRatio = var_110_13
			end

			local var_110_14 = arg_107_1.actors_["1059ui_story"].transform
			local var_110_15 = 0

			if var_110_15 < arg_107_1.time_ and arg_107_1.time_ <= var_110_15 + arg_110_0 then
				arg_107_1.var_.moveOldPos1059ui_story = var_110_14.localPosition
			end

			local var_110_16 = 0.001

			if var_110_15 <= arg_107_1.time_ and arg_107_1.time_ < var_110_15 + var_110_16 then
				local var_110_17 = (arg_107_1.time_ - var_110_15) / var_110_16
				local var_110_18 = Vector3.New(0, 100, 0)

				var_110_14.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1059ui_story, var_110_18, var_110_17)

				local var_110_19 = manager.ui.mainCamera.transform.position - var_110_14.position

				var_110_14.forward = Vector3.New(var_110_19.x, var_110_19.y, var_110_19.z)

				local var_110_20 = var_110_14.localEulerAngles

				var_110_20.z = 0
				var_110_20.x = 0
				var_110_14.localEulerAngles = var_110_20
			end

			if arg_107_1.time_ >= var_110_15 + var_110_16 and arg_107_1.time_ < var_110_15 + var_110_16 + arg_110_0 then
				var_110_14.localPosition = Vector3.New(0, 100, 0)

				local var_110_21 = manager.ui.mainCamera.transform.position - var_110_14.position

				var_110_14.forward = Vector3.New(var_110_21.x, var_110_21.y, var_110_21.z)

				local var_110_22 = var_110_14.localEulerAngles

				var_110_22.z = 0
				var_110_22.x = 0
				var_110_14.localEulerAngles = var_110_22
			end

			local var_110_23 = arg_107_1.actors_["3005_tpose"].transform
			local var_110_24 = 0

			if var_110_24 < arg_107_1.time_ and arg_107_1.time_ <= var_110_24 + arg_110_0 then
				arg_107_1.var_.moveOldPos3005_tpose = var_110_23.localPosition
			end

			local var_110_25 = 0.001

			if var_110_24 <= arg_107_1.time_ and arg_107_1.time_ < var_110_24 + var_110_25 then
				local var_110_26 = (arg_107_1.time_ - var_110_24) / var_110_25
				local var_110_27 = Vector3.New(0, -1.95, -2.63)

				var_110_23.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos3005_tpose, var_110_27, var_110_26)

				local var_110_28 = manager.ui.mainCamera.transform.position - var_110_23.position

				var_110_23.forward = Vector3.New(var_110_28.x, var_110_28.y, var_110_28.z)

				local var_110_29 = var_110_23.localEulerAngles

				var_110_29.z = 0
				var_110_29.x = 0
				var_110_23.localEulerAngles = var_110_29
			end

			if arg_107_1.time_ >= var_110_24 + var_110_25 and arg_107_1.time_ < var_110_24 + var_110_25 + arg_110_0 then
				var_110_23.localPosition = Vector3.New(0, -1.95, -2.63)

				local var_110_30 = manager.ui.mainCamera.transform.position - var_110_23.position

				var_110_23.forward = Vector3.New(var_110_30.x, var_110_30.y, var_110_30.z)

				local var_110_31 = var_110_23.localEulerAngles

				var_110_31.z = 0
				var_110_31.x = 0
				var_110_23.localEulerAngles = var_110_31
			end

			local var_110_32 = 0

			if var_110_32 < arg_107_1.time_ and arg_107_1.time_ <= var_110_32 + arg_110_0 then
				arg_107_1:PlayTimeline("3005_tpose", "StoryTimeline/CharAction/story3005/story3005action/3005action1_1")
			end

			local var_110_33 = 0
			local var_110_34 = 0.525

			if var_110_33 < arg_107_1.time_ and arg_107_1.time_ <= var_110_33 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_35 = arg_107_1:GetWordFromCfg(104061028)
				local var_110_36 = arg_107_1:FormatText(var_110_35.content)

				arg_107_1.text_.text = var_110_36

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_37 = 21
				local var_110_38 = utf8.len(var_110_36)
				local var_110_39 = var_110_37 <= 0 and var_110_34 or var_110_34 * (var_110_38 / var_110_37)

				if var_110_39 > 0 and var_110_34 < var_110_39 then
					arg_107_1.talkMaxDuration = var_110_39

					if var_110_39 + var_110_33 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_39 + var_110_33
					end
				end

				arg_107_1.text_.text = var_110_36
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_40 = math.max(var_110_34, arg_107_1.talkMaxDuration)

			if var_110_33 <= arg_107_1.time_ and arg_107_1.time_ < var_110_33 + var_110_40 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_33) / var_110_40

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_33 + var_110_40 and arg_107_1.time_ < var_110_33 + var_110_40 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play104061029 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 104061029
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play104061030(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["3005_tpose"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect3005_tpose == nil then
				arg_111_1.var_.characterEffect3005_tpose = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.1

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect3005_tpose then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect3005_tpose.fillFlat = true
					arg_111_1.var_.characterEffect3005_tpose.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect3005_tpose then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect3005_tpose.fillFlat = true
				arg_111_1.var_.characterEffect3005_tpose.fillRatio = var_114_5
			end

			local var_114_6 = arg_111_1.actors_["3005_tpose"].transform
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 then
				arg_111_1.var_.moveOldPos3005_tpose = var_114_6.localPosition
			end

			local var_114_8 = 0.001

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8
				local var_114_10 = Vector3.New(0, 100, 0)

				var_114_6.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos3005_tpose, var_114_10, var_114_9)

				local var_114_11 = manager.ui.mainCamera.transform.position - var_114_6.position

				var_114_6.forward = Vector3.New(var_114_11.x, var_114_11.y, var_114_11.z)

				local var_114_12 = var_114_6.localEulerAngles

				var_114_12.z = 0
				var_114_12.x = 0
				var_114_6.localEulerAngles = var_114_12
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 then
				var_114_6.localPosition = Vector3.New(0, 100, 0)

				local var_114_13 = manager.ui.mainCamera.transform.position - var_114_6.position

				var_114_6.forward = Vector3.New(var_114_13.x, var_114_13.y, var_114_13.z)

				local var_114_14 = var_114_6.localEulerAngles

				var_114_14.z = 0
				var_114_14.x = 0
				var_114_6.localEulerAngles = var_114_14
			end

			local var_114_15 = 0
			local var_114_16 = 0.725

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_17 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_18 = arg_111_1:GetWordFromCfg(104061029)
				local var_114_19 = arg_111_1:FormatText(var_114_18.content)

				arg_111_1.text_.text = var_114_19

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_20 = 29
				local var_114_21 = utf8.len(var_114_19)
				local var_114_22 = var_114_20 <= 0 and var_114_16 or var_114_16 * (var_114_21 / var_114_20)

				if var_114_22 > 0 and var_114_16 < var_114_22 then
					arg_111_1.talkMaxDuration = var_114_22

					if var_114_22 + var_114_15 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_22 + var_114_15
					end
				end

				arg_111_1.text_.text = var_114_19
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_23 = math.max(var_114_16, arg_111_1.talkMaxDuration)

			if var_114_15 <= arg_111_1.time_ and arg_111_1.time_ < var_114_15 + var_114_23 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_15) / var_114_23

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_15 + var_114_23 and arg_111_1.time_ < var_114_15 + var_114_23 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play104061030 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 104061030
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play104061031(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1.2

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

				local var_118_3 = arg_115_1:GetWordFromCfg(104061030)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 48
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
	Play104061031 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 104061031
		arg_119_1.duration_ = 8.833

		local var_119_0 = {
			ja = 8.833,
			ko = 5.033,
			zh = 7.3,
			en = 6.333
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
				arg_119_0:Play104061032(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1059ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1059ui_story == nil then
				arg_119_1.var_.characterEffect1059ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.1

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1059ui_story then
					arg_119_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1059ui_story then
				arg_119_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["1059ui_story"].transform
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 then
				arg_119_1.var_.moveOldPos1059ui_story = var_122_4.localPosition
			end

			local var_122_6 = 0.001

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6
				local var_122_8 = Vector3.New(0, -1.05, -6)

				var_122_4.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1059ui_story, var_122_8, var_122_7)

				local var_122_9 = manager.ui.mainCamera.transform.position - var_122_4.position

				var_122_4.forward = Vector3.New(var_122_9.x, var_122_9.y, var_122_9.z)

				local var_122_10 = var_122_4.localEulerAngles

				var_122_10.z = 0
				var_122_10.x = 0
				var_122_4.localEulerAngles = var_122_10
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 then
				var_122_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_122_11 = manager.ui.mainCamera.transform.position - var_122_4.position

				var_122_4.forward = Vector3.New(var_122_11.x, var_122_11.y, var_122_11.z)

				local var_122_12 = var_122_4.localEulerAngles

				var_122_12.z = 0
				var_122_12.x = 0
				var_122_4.localEulerAngles = var_122_12
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_122_15 = 0
			local var_122_16 = 0.725

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[28].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(104061031)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061031", "story_v_out_104061.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_out_104061", "104061031", "story_v_out_104061.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_out_104061", "104061031", "story_v_out_104061.awb")

						arg_119_1:RecordAudio("104061031", var_122_24)
						arg_119_1:RecordAudio("104061031", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_104061", "104061031", "story_v_out_104061.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_104061", "104061031", "story_v_out_104061.awb")
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
	Play104061032 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 104061032
		arg_123_1.duration_ = 0.100000001489

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"

			SetActive(arg_123_1.choicesGo_, true)

			for iter_124_0, iter_124_1 in ipairs(arg_123_1.choices_) do
				local var_124_0 = iter_124_0 <= 2

				SetActive(iter_124_1.go, var_124_0)
			end

			arg_123_1.choices_[1].txt.text = arg_123_1:FormatText(StoryChoiceCfg[25].name)
			arg_123_1.choices_[2].txt.text = arg_123_1:FormatText(StoryChoiceCfg[26].name)
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play104061033(arg_123_1)
			end

			if arg_125_0 == 2 then
				arg_123_0:Play104061033(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1059ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1059ui_story == nil then
				arg_123_1.var_.characterEffect1059ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1059ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1059ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1059ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1059ui_story.fillRatio = var_126_5
			end
		end
	end,
	Play104061033 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 104061033
		arg_127_1.duration_ = 3.166

		local var_127_0 = {
			ja = 2.466,
			ko = 2.9,
			zh = 3.166,
			en = 2.366
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
				arg_127_0:Play104061034(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1148ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1148ui_story == nil then
				arg_127_1.var_.characterEffect1148ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.1

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1148ui_story then
					arg_127_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1148ui_story then
				arg_127_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["1059ui_story"].transform
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 then
				arg_127_1.var_.moveOldPos1059ui_story = var_130_4.localPosition
			end

			local var_130_6 = 0.001

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6
				local var_130_8 = Vector3.New(0, 100, 0)

				var_130_4.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1059ui_story, var_130_8, var_130_7)

				local var_130_9 = manager.ui.mainCamera.transform.position - var_130_4.position

				var_130_4.forward = Vector3.New(var_130_9.x, var_130_9.y, var_130_9.z)

				local var_130_10 = var_130_4.localEulerAngles

				var_130_10.z = 0
				var_130_10.x = 0
				var_130_4.localEulerAngles = var_130_10
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 then
				var_130_4.localPosition = Vector3.New(0, 100, 0)

				local var_130_11 = manager.ui.mainCamera.transform.position - var_130_4.position

				var_130_4.forward = Vector3.New(var_130_11.x, var_130_11.y, var_130_11.z)

				local var_130_12 = var_130_4.localEulerAngles

				var_130_12.z = 0
				var_130_12.x = 0
				var_130_4.localEulerAngles = var_130_12
			end

			local var_130_13 = arg_127_1.actors_["1148ui_story"].transform
			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1.var_.moveOldPos1148ui_story = var_130_13.localPosition
			end

			local var_130_15 = 0.001

			if var_130_14 <= arg_127_1.time_ and arg_127_1.time_ < var_130_14 + var_130_15 then
				local var_130_16 = (arg_127_1.time_ - var_130_14) / var_130_15
				local var_130_17 = Vector3.New(0, -0.8, -6.2)

				var_130_13.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1148ui_story, var_130_17, var_130_16)

				local var_130_18 = manager.ui.mainCamera.transform.position - var_130_13.position

				var_130_13.forward = Vector3.New(var_130_18.x, var_130_18.y, var_130_18.z)

				local var_130_19 = var_130_13.localEulerAngles

				var_130_19.z = 0
				var_130_19.x = 0
				var_130_13.localEulerAngles = var_130_19
			end

			if arg_127_1.time_ >= var_130_14 + var_130_15 and arg_127_1.time_ < var_130_14 + var_130_15 + arg_130_0 then
				var_130_13.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_130_20 = manager.ui.mainCamera.transform.position - var_130_13.position

				var_130_13.forward = Vector3.New(var_130_20.x, var_130_20.y, var_130_20.z)

				local var_130_21 = var_130_13.localEulerAngles

				var_130_21.z = 0
				var_130_21.x = 0
				var_130_13.localEulerAngles = var_130_21
			end

			local var_130_22 = 0

			if var_130_22 < arg_127_1.time_ and arg_127_1.time_ <= var_130_22 + arg_130_0 then
				arg_127_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action3_1")
			end

			local var_130_23 = 0

			if var_130_23 < arg_127_1.time_ and arg_127_1.time_ <= var_130_23 + arg_130_0 then
				arg_127_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_130_24 = 0
			local var_130_25 = 0.25

			if var_130_24 < arg_127_1.time_ and arg_127_1.time_ <= var_130_24 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_26 = arg_127_1:FormatText(StoryNameCfg[8].name)

				arg_127_1.leftNameTxt_.text = var_130_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_27 = arg_127_1:GetWordFromCfg(104061033)
				local var_130_28 = arg_127_1:FormatText(var_130_27.content)

				arg_127_1.text_.text = var_130_28

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_29 = 10
				local var_130_30 = utf8.len(var_130_28)
				local var_130_31 = var_130_29 <= 0 and var_130_25 or var_130_25 * (var_130_30 / var_130_29)

				if var_130_31 > 0 and var_130_25 < var_130_31 then
					arg_127_1.talkMaxDuration = var_130_31

					if var_130_31 + var_130_24 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_31 + var_130_24
					end
				end

				arg_127_1.text_.text = var_130_28
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061033", "story_v_out_104061.awb") ~= 0 then
					local var_130_32 = manager.audio:GetVoiceLength("story_v_out_104061", "104061033", "story_v_out_104061.awb") / 1000

					if var_130_32 + var_130_24 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_32 + var_130_24
					end

					if var_130_27.prefab_name ~= "" and arg_127_1.actors_[var_130_27.prefab_name] ~= nil then
						local var_130_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_27.prefab_name].transform, "story_v_out_104061", "104061033", "story_v_out_104061.awb")

						arg_127_1:RecordAudio("104061033", var_130_33)
						arg_127_1:RecordAudio("104061033", var_130_33)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_104061", "104061033", "story_v_out_104061.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_104061", "104061033", "story_v_out_104061.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_34 = math.max(var_130_25, arg_127_1.talkMaxDuration)

			if var_130_24 <= arg_127_1.time_ and arg_127_1.time_ < var_130_24 + var_130_34 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_24) / var_130_34

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_24 + var_130_34 and arg_127_1.time_ < var_130_24 + var_130_34 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play104061034 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 104061034
		arg_131_1.duration_ = 6.366

		local var_131_0 = {
			ja = 6.366,
			ko = 4.266,
			zh = 4.2,
			en = 4.266
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
				arg_131_0:Play104061035(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				local var_134_2 = "play"
				local var_134_3 = "effect"

				arg_131_1:AudioAction(var_134_2, var_134_3, "se_story_4", "se_story_4_arm_3", "")
			end

			local var_134_4 = 0

			if var_134_4 < arg_131_1.time_ and arg_131_1.time_ <= var_134_4 + arg_134_0 then
				arg_131_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action432")
			end

			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_134_6 = 0
			local var_134_7 = 0.45

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[8].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(104061034)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 18
				local var_134_12 = utf8.len(var_134_10)
				local var_134_13 = var_134_11 <= 0 and var_134_7 or var_134_7 * (var_134_12 / var_134_11)

				if var_134_13 > 0 and var_134_7 < var_134_13 then
					arg_131_1.talkMaxDuration = var_134_13

					if var_134_13 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_13 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_10
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061034", "story_v_out_104061.awb") ~= 0 then
					local var_134_14 = manager.audio:GetVoiceLength("story_v_out_104061", "104061034", "story_v_out_104061.awb") / 1000

					if var_134_14 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_14 + var_134_6
					end

					if var_134_9.prefab_name ~= "" and arg_131_1.actors_[var_134_9.prefab_name] ~= nil then
						local var_134_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_9.prefab_name].transform, "story_v_out_104061", "104061034", "story_v_out_104061.awb")

						arg_131_1:RecordAudio("104061034", var_134_15)
						arg_131_1:RecordAudio("104061034", var_134_15)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_104061", "104061034", "story_v_out_104061.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_104061", "104061034", "story_v_out_104061.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_16 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_16 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_16

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_16 and arg_131_1.time_ < var_134_6 + var_134_16 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play104061035 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 104061035
		arg_135_1.duration_ = 6.4

		local var_135_0 = {
			ja = 6.4,
			ko = 6.033,
			zh = 5.566,
			en = 4.266
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
			arg_135_1.auto_ = false
		end

		function arg_135_1.playNext_(arg_137_0)
			arg_135_1.onStoryFinished_()
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
			local var_138_11 = 0.033

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.var_.moveOldPos1148ui_story = var_138_10.localPosition
			end

			local var_138_12 = 0.5

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_12 then
				local var_138_13 = (arg_135_1.time_ - var_138_11) / var_138_12
				local var_138_14 = Vector3.New(-0.7, -0.8, -6.2)

				var_138_10.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1148ui_story, var_138_14, var_138_13)

				local var_138_15 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_15.x, var_138_15.y, var_138_15.z)

				local var_138_16 = var_138_10.localEulerAngles

				var_138_16.z = 0
				var_138_16.x = 0
				var_138_10.localEulerAngles = var_138_16
			end

			if arg_135_1.time_ >= var_138_11 + var_138_12 and arg_135_1.time_ < var_138_11 + var_138_12 + arg_138_0 then
				var_138_10.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_138_17 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_17.x, var_138_17.y, var_138_17.z)

				local var_138_18 = var_138_10.localEulerAngles

				var_138_18.z = 0
				var_138_18.x = 0
				var_138_10.localEulerAngles = var_138_18
			end

			local var_138_19 = arg_135_1.actors_["1148ui_story"].transform
			local var_138_20 = 0

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				arg_135_1.var_.moveOldPos1148ui_story = var_138_19.localPosition
			end

			local var_138_21 = 0.001

			if var_138_20 <= arg_135_1.time_ and arg_135_1.time_ < var_138_20 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_20) / var_138_21
				local var_138_23 = Vector3.New(0, -0.8, -6.2)

				var_138_19.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1148ui_story, var_138_23, var_138_22)

				local var_138_24 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_24.x, var_138_24.y, var_138_24.z)

				local var_138_25 = var_138_19.localEulerAngles

				var_138_25.z = 0
				var_138_25.x = 0
				var_138_19.localEulerAngles = var_138_25
			end

			if arg_135_1.time_ >= var_138_20 + var_138_21 and arg_135_1.time_ < var_138_20 + var_138_21 + arg_138_0 then
				var_138_19.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_138_26 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_26.x, var_138_26.y, var_138_26.z)

				local var_138_27 = var_138_19.localEulerAngles

				var_138_27.z = 0
				var_138_27.x = 0
				var_138_19.localEulerAngles = var_138_27
			end

			local var_138_28 = arg_135_1.actors_["1059ui_story"].transform
			local var_138_29 = 0

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 then
				arg_135_1.var_.moveOldPos1059ui_story = var_138_28.localPosition
			end

			local var_138_30 = 0.001

			if var_138_29 <= arg_135_1.time_ and arg_135_1.time_ < var_138_29 + var_138_30 then
				local var_138_31 = (arg_135_1.time_ - var_138_29) / var_138_30
				local var_138_32 = Vector3.New(0.7, -1.05, -6)

				var_138_28.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1059ui_story, var_138_32, var_138_31)

				local var_138_33 = manager.ui.mainCamera.transform.position - var_138_28.position

				var_138_28.forward = Vector3.New(var_138_33.x, var_138_33.y, var_138_33.z)

				local var_138_34 = var_138_28.localEulerAngles

				var_138_34.z = 0
				var_138_34.x = 0
				var_138_28.localEulerAngles = var_138_34
			end

			if arg_135_1.time_ >= var_138_29 + var_138_30 and arg_135_1.time_ < var_138_29 + var_138_30 + arg_138_0 then
				var_138_28.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_138_35 = manager.ui.mainCamera.transform.position - var_138_28.position

				var_138_28.forward = Vector3.New(var_138_35.x, var_138_35.y, var_138_35.z)

				local var_138_36 = var_138_28.localEulerAngles

				var_138_36.z = 0
				var_138_36.x = 0
				var_138_28.localEulerAngles = var_138_36
			end

			local var_138_37 = 0

			if var_138_37 < arg_135_1.time_ and arg_135_1.time_ <= var_138_37 + arg_138_0 then
				arg_135_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_138_38 = 0

			if var_138_38 < arg_135_1.time_ and arg_135_1.time_ <= var_138_38 + arg_138_0 then
				arg_135_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_138_39 = 0
			local var_138_40 = 0.7

			if var_138_39 < arg_135_1.time_ and arg_135_1.time_ <= var_138_39 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_41 = arg_135_1:FormatText(StoryNameCfg[28].name)

				arg_135_1.leftNameTxt_.text = var_138_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_42 = arg_135_1:GetWordFromCfg(104061035)
				local var_138_43 = arg_135_1:FormatText(var_138_42.content)

				arg_135_1.text_.text = var_138_43

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_44 = 28
				local var_138_45 = utf8.len(var_138_43)
				local var_138_46 = var_138_44 <= 0 and var_138_40 or var_138_40 * (var_138_45 / var_138_44)

				if var_138_46 > 0 and var_138_40 < var_138_46 then
					arg_135_1.talkMaxDuration = var_138_46

					if var_138_46 + var_138_39 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_46 + var_138_39
					end
				end

				arg_135_1.text_.text = var_138_43
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104061", "104061035", "story_v_out_104061.awb") ~= 0 then
					local var_138_47 = manager.audio:GetVoiceLength("story_v_out_104061", "104061035", "story_v_out_104061.awb") / 1000

					if var_138_47 + var_138_39 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_47 + var_138_39
					end

					if var_138_42.prefab_name ~= "" and arg_135_1.actors_[var_138_42.prefab_name] ~= nil then
						local var_138_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_42.prefab_name].transform, "story_v_out_104061", "104061035", "story_v_out_104061.awb")

						arg_135_1:RecordAudio("104061035", var_138_48)
						arg_135_1:RecordAudio("104061035", var_138_48)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_104061", "104061035", "story_v_out_104061.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_104061", "104061035", "story_v_out_104061.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_49 = math.max(var_138_40, arg_135_1.talkMaxDuration)

			if var_138_39 <= arg_135_1.time_ and arg_135_1.time_ < var_138_39 + var_138_49 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_39) / var_138_49

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_39 + var_138_49 and arg_135_1.time_ < var_138_39 + var_138_49 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B06a"
	},
	voices = {
		"story_v_out_104061.awb"
	}
}
