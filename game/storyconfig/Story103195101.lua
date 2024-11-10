return {
	Play319511001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319511001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319511002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST72"

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
				local var_4_5 = arg_1_1.bgs_.ST72

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
					if iter_4_0 ~= "ST72" then
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
			local var_4_23 = 0.0666666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.1
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_3_0_story_hospital", "bgm_activity_3_0_story_hospital", "bgm_activity_3_0_story_hospital.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.125

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

				local var_4_33 = arg_1_1:GetWordFromCfg(319511001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 45
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
	Play319511002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319511002
		arg_7_1.duration_ = 6.233

		local var_7_0 = {
			zh = 2.5,
			ja = 6.233
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
				arg_7_0:Play319511003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10069ui_story"

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

			local var_10_4 = arg_7_1.actors_["10069ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos10069ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.08, -6.33)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10069ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.08, -6.33)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["10069ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect10069ui_story == nil then
				arg_7_1.var_.characterEffect10069ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect10069ui_story then
					arg_7_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect10069ui_story then
				arg_7_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10069/story10069action/10069action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.325

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[693].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(319511002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 13
				local var_10_25 = utf8.len(var_10_23)
				local var_10_26 = var_10_24 <= 0 and var_10_20 or var_10_20 * (var_10_25 / var_10_24)

				if var_10_26 > 0 and var_10_20 < var_10_26 then
					arg_7_1.talkMaxDuration = var_10_26

					if var_10_26 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_23
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511002", "story_v_out_319511.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_319511", "319511002", "story_v_out_319511.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_319511", "319511002", "story_v_out_319511.awb")

						arg_7_1:RecordAudio("319511002", var_10_28)
						arg_7_1:RecordAudio("319511002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319511", "319511002", "story_v_out_319511.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319511", "319511002", "story_v_out_319511.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_29 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_29 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_29

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_29 and arg_7_1.time_ < var_10_19 + var_10_29 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319511003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319511003
		arg_11_1.duration_ = 6.3

		local var_11_0 = {
			zh = 4.533,
			ja = 6.3
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
				arg_11_0:Play319511004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1084ui_story"

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

			local var_14_4 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0.7, -0.97, -6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1084ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1084ui_story then
					arg_11_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				arg_11_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_14_19 = arg_11_1.actors_["10069ui_story"].transform
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.var_.moveOldPos10069ui_story = var_14_19.localPosition
			end

			local var_14_21 = 0.001

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21
				local var_14_23 = Vector3.New(-0.7, -1.08, -6.33)

				var_14_19.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10069ui_story, var_14_23, var_14_22)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_19.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_19.localEulerAngles = var_14_25
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 then
				var_14_19.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_14_26 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_26.x, var_14_26.y, var_14_26.z)

				local var_14_27 = var_14_19.localEulerAngles

				var_14_27.z = 0
				var_14_27.x = 0
				var_14_19.localEulerAngles = var_14_27
			end

			local var_14_28 = arg_11_1.actors_["10069ui_story"]
			local var_14_29 = 0

			if var_14_29 < arg_11_1.time_ and arg_11_1.time_ <= var_14_29 + arg_14_0 and arg_11_1.var_.characterEffect10069ui_story == nil then
				arg_11_1.var_.characterEffect10069ui_story = var_14_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_30 = 0.200000002980232

			if var_14_29 <= arg_11_1.time_ and arg_11_1.time_ < var_14_29 + var_14_30 then
				local var_14_31 = (arg_11_1.time_ - var_14_29) / var_14_30

				if arg_11_1.var_.characterEffect10069ui_story then
					local var_14_32 = Mathf.Lerp(0, 0.5, var_14_31)

					arg_11_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10069ui_story.fillRatio = var_14_32
				end
			end

			if arg_11_1.time_ >= var_14_29 + var_14_30 and arg_11_1.time_ < var_14_29 + var_14_30 + arg_14_0 and arg_11_1.var_.characterEffect10069ui_story then
				local var_14_33 = 0.5

				arg_11_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10069ui_story.fillRatio = var_14_33
			end

			local var_14_34 = 0
			local var_14_35 = 0.55

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_36 = arg_11_1:FormatText(StoryNameCfg[6].name)

				arg_11_1.leftNameTxt_.text = var_14_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_37 = arg_11_1:GetWordFromCfg(319511003)
				local var_14_38 = arg_11_1:FormatText(var_14_37.content)

				arg_11_1.text_.text = var_14_38

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_39 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511003", "story_v_out_319511.awb") ~= 0 then
					local var_14_42 = manager.audio:GetVoiceLength("story_v_out_319511", "319511003", "story_v_out_319511.awb") / 1000

					if var_14_42 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_42 + var_14_34
					end

					if var_14_37.prefab_name ~= "" and arg_11_1.actors_[var_14_37.prefab_name] ~= nil then
						local var_14_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_37.prefab_name].transform, "story_v_out_319511", "319511003", "story_v_out_319511.awb")

						arg_11_1:RecordAudio("319511003", var_14_43)
						arg_11_1:RecordAudio("319511003", var_14_43)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319511", "319511003", "story_v_out_319511.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319511", "319511003", "story_v_out_319511.awb")
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
	Play319511004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319511004
		arg_15_1.duration_ = 10.133

		local var_15_0 = {
			zh = 4.833,
			ja = 10.133
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
				arg_15_0:Play319511005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1084ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1084ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["10069ui_story"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.characterEffect10069ui_story == nil then
				arg_15_1.var_.characterEffect10069ui_story = var_18_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_8 = 0.200000002980232

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.characterEffect10069ui_story then
					arg_15_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.characterEffect10069ui_story then
				arg_15_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_18_10 = 0
			local var_18_11 = 0.6

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_12 = arg_15_1:FormatText(StoryNameCfg[693].name)

				arg_15_1.leftNameTxt_.text = var_18_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_13 = arg_15_1:GetWordFromCfg(319511004)
				local var_18_14 = arg_15_1:FormatText(var_18_13.content)

				arg_15_1.text_.text = var_18_14

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_15 = 24
				local var_18_16 = utf8.len(var_18_14)
				local var_18_17 = var_18_15 <= 0 and var_18_11 or var_18_11 * (var_18_16 / var_18_15)

				if var_18_17 > 0 and var_18_11 < var_18_17 then
					arg_15_1.talkMaxDuration = var_18_17

					if var_18_17 + var_18_10 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_17 + var_18_10
					end
				end

				arg_15_1.text_.text = var_18_14
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511004", "story_v_out_319511.awb") ~= 0 then
					local var_18_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511004", "story_v_out_319511.awb") / 1000

					if var_18_18 + var_18_10 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_18 + var_18_10
					end

					if var_18_13.prefab_name ~= "" and arg_15_1.actors_[var_18_13.prefab_name] ~= nil then
						local var_18_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_13.prefab_name].transform, "story_v_out_319511", "319511004", "story_v_out_319511.awb")

						arg_15_1:RecordAudio("319511004", var_18_19)
						arg_15_1:RecordAudio("319511004", var_18_19)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319511", "319511004", "story_v_out_319511.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319511", "319511004", "story_v_out_319511.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_20 = math.max(var_18_11, arg_15_1.talkMaxDuration)

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_20 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_10) / var_18_20

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_10 + var_18_20 and arg_15_1.time_ < var_18_10 + var_18_20 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319511005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319511005
		arg_19_1.duration_ = 15.933

		local var_19_0 = {
			zh = 5.333,
			ja = 15.933
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
				arg_19_0:Play319511006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.6

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[693].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(319511005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511005", "story_v_out_319511.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511005", "story_v_out_319511.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_319511", "319511005", "story_v_out_319511.awb")

						arg_19_1:RecordAudio("319511005", var_22_9)
						arg_19_1:RecordAudio("319511005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319511", "319511005", "story_v_out_319511.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319511", "319511005", "story_v_out_319511.awb")
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
	Play319511006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319511006
		arg_23_1.duration_ = 8.033

		local var_23_0 = {
			zh = 3.533,
			ja = 8.033
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
				arg_23_0:Play319511007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0.7, -0.97, -6)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1084ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1084ui_story then
					arg_23_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				arg_23_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4712")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = arg_23_1.actors_["10069ui_story"]
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect10069ui_story == nil then
				arg_23_1.var_.characterEffect10069ui_story = var_26_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_17 = 0.200000002980232

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17

				if arg_23_1.var_.characterEffect10069ui_story then
					local var_26_19 = Mathf.Lerp(0, 0.5, var_26_18)

					arg_23_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10069ui_story.fillRatio = var_26_19
				end
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 and arg_23_1.var_.characterEffect10069ui_story then
				local var_26_20 = 0.5

				arg_23_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10069ui_story.fillRatio = var_26_20
			end

			local var_26_21 = 0
			local var_26_22 = 0.45

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_23 = arg_23_1:FormatText(StoryNameCfg[6].name)

				arg_23_1.leftNameTxt_.text = var_26_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_24 = arg_23_1:GetWordFromCfg(319511006)
				local var_26_25 = arg_23_1:FormatText(var_26_24.content)

				arg_23_1.text_.text = var_26_25

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_26 = 18
				local var_26_27 = utf8.len(var_26_25)
				local var_26_28 = var_26_26 <= 0 and var_26_22 or var_26_22 * (var_26_27 / var_26_26)

				if var_26_28 > 0 and var_26_22 < var_26_28 then
					arg_23_1.talkMaxDuration = var_26_28

					if var_26_28 + var_26_21 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_28 + var_26_21
					end
				end

				arg_23_1.text_.text = var_26_25
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511006", "story_v_out_319511.awb") ~= 0 then
					local var_26_29 = manager.audio:GetVoiceLength("story_v_out_319511", "319511006", "story_v_out_319511.awb") / 1000

					if var_26_29 + var_26_21 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_29 + var_26_21
					end

					if var_26_24.prefab_name ~= "" and arg_23_1.actors_[var_26_24.prefab_name] ~= nil then
						local var_26_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_24.prefab_name].transform, "story_v_out_319511", "319511006", "story_v_out_319511.awb")

						arg_23_1:RecordAudio("319511006", var_26_30)
						arg_23_1:RecordAudio("319511006", var_26_30)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319511", "319511006", "story_v_out_319511.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319511", "319511006", "story_v_out_319511.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_31 = math.max(var_26_22, arg_23_1.talkMaxDuration)

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_31 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_21) / var_26_31

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_21 + var_26_31 and arg_23_1.time_ < var_26_21 + var_26_31 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319511007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319511007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319511008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1084ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1084ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1084ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1084ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.825

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(319511007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 33
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319511008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319511008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play319511009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.025

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_2 = arg_31_1:GetWordFromCfg(319511008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 41
				local var_34_5 = utf8.len(var_34_3)
				local var_34_6 = var_34_4 <= 0 and var_34_1 or var_34_1 * (var_34_5 / var_34_4)

				if var_34_6 > 0 and var_34_1 < var_34_6 then
					arg_31_1.talkMaxDuration = var_34_6

					if var_34_6 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_6 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_3
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_7 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_7 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_7

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_7 and arg_31_1.time_ < var_34_0 + var_34_7 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319511009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319511009
		arg_35_1.duration_ = 5.2

		local var_35_0 = {
			zh = 5.2,
			ja = 4.6
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
				arg_35_0:Play319511010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1084ui_story then
					arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				arg_35_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_38_4 = 0
			local var_38_5 = 0.5

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_6 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_7 = arg_35_1:GetWordFromCfg(319511009)
				local var_38_8 = arg_35_1:FormatText(var_38_7.content)

				arg_35_1.text_.text = var_38_8

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_9 = 20
				local var_38_10 = utf8.len(var_38_8)
				local var_38_11 = var_38_9 <= 0 and var_38_5 or var_38_5 * (var_38_10 / var_38_9)

				if var_38_11 > 0 and var_38_5 < var_38_11 then
					arg_35_1.talkMaxDuration = var_38_11

					if var_38_11 + var_38_4 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_11 + var_38_4
					end
				end

				arg_35_1.text_.text = var_38_8
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511009", "story_v_out_319511.awb") ~= 0 then
					local var_38_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511009", "story_v_out_319511.awb") / 1000

					if var_38_12 + var_38_4 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_4
					end

					if var_38_7.prefab_name ~= "" and arg_35_1.actors_[var_38_7.prefab_name] ~= nil then
						local var_38_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_7.prefab_name].transform, "story_v_out_319511", "319511009", "story_v_out_319511.awb")

						arg_35_1:RecordAudio("319511009", var_38_13)
						arg_35_1:RecordAudio("319511009", var_38_13)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319511", "319511009", "story_v_out_319511.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319511", "319511009", "story_v_out_319511.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_5, arg_35_1.talkMaxDuration)

			if var_38_4 <= arg_35_1.time_ and arg_35_1.time_ < var_38_4 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_4) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_4 + var_38_14 and arg_35_1.time_ < var_38_4 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319511010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319511010
		arg_39_1.duration_ = 6.5

		local var_39_0 = {
			zh = 3.5,
			ja = 6.5
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
				arg_39_0:Play319511011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10069ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10069ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-0.7, -1.08, -6.33)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10069ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["10069ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect10069ui_story == nil then
				arg_39_1.var_.characterEffect10069ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect10069ui_story then
					arg_39_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect10069ui_story then
				arg_39_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action1_1")
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_15 = arg_39_1.actors_["1084ui_story"]
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_17 = 0.200000002980232

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17

				if arg_39_1.var_.characterEffect1084ui_story then
					local var_42_19 = Mathf.Lerp(0, 0.5, var_42_18)

					arg_39_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1084ui_story.fillRatio = var_42_19
				end
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				local var_42_20 = 0.5

				arg_39_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1084ui_story.fillRatio = var_42_20
			end

			local var_42_21 = 0
			local var_42_22 = 0.375

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_23 = arg_39_1:FormatText(StoryNameCfg[693].name)

				arg_39_1.leftNameTxt_.text = var_42_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_24 = arg_39_1:GetWordFromCfg(319511010)
				local var_42_25 = arg_39_1:FormatText(var_42_24.content)

				arg_39_1.text_.text = var_42_25

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_26 = 15
				local var_42_27 = utf8.len(var_42_25)
				local var_42_28 = var_42_26 <= 0 and var_42_22 or var_42_22 * (var_42_27 / var_42_26)

				if var_42_28 > 0 and var_42_22 < var_42_28 then
					arg_39_1.talkMaxDuration = var_42_28

					if var_42_28 + var_42_21 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_28 + var_42_21
					end
				end

				arg_39_1.text_.text = var_42_25
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511010", "story_v_out_319511.awb") ~= 0 then
					local var_42_29 = manager.audio:GetVoiceLength("story_v_out_319511", "319511010", "story_v_out_319511.awb") / 1000

					if var_42_29 + var_42_21 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_29 + var_42_21
					end

					if var_42_24.prefab_name ~= "" and arg_39_1.actors_[var_42_24.prefab_name] ~= nil then
						local var_42_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_24.prefab_name].transform, "story_v_out_319511", "319511010", "story_v_out_319511.awb")

						arg_39_1:RecordAudio("319511010", var_42_30)
						arg_39_1:RecordAudio("319511010", var_42_30)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319511", "319511010", "story_v_out_319511.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319511", "319511010", "story_v_out_319511.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_31 = math.max(var_42_22, arg_39_1.talkMaxDuration)

			if var_42_21 <= arg_39_1.time_ and arg_39_1.time_ < var_42_21 + var_42_31 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_21) / var_42_31

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_21 + var_42_31 and arg_39_1.time_ < var_42_21 + var_42_31 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319511011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319511011
		arg_43_1.duration_ = 4.5

		local var_43_0 = {
			zh = 1.5,
			ja = 4.5
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
				arg_43_0:Play319511012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10069ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect10069ui_story == nil then
				arg_43_1.var_.characterEffect10069ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect10069ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_43_1.var_.characterEffect10069ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect10069ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_43_1.var_.characterEffect10069ui_story.fillRatio = var_46_5
			end

			local var_46_6 = arg_43_1.actors_["1084ui_story"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_8 = 0.200000002980232

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.characterEffect1084ui_story then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_10 = 0
			local var_46_11 = 0.1

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_12 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_13 = arg_43_1:GetWordFromCfg(319511011)
				local var_46_14 = arg_43_1:FormatText(var_46_13.content)

				arg_43_1.text_.text = var_46_14

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_15 = 4
				local var_46_16 = utf8.len(var_46_14)
				local var_46_17 = var_46_15 <= 0 and var_46_11 or var_46_11 * (var_46_16 / var_46_15)

				if var_46_17 > 0 and var_46_11 < var_46_17 then
					arg_43_1.talkMaxDuration = var_46_17

					if var_46_17 + var_46_10 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_17 + var_46_10
					end
				end

				arg_43_1.text_.text = var_46_14
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511011", "story_v_out_319511.awb") ~= 0 then
					local var_46_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511011", "story_v_out_319511.awb") / 1000

					if var_46_18 + var_46_10 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_18 + var_46_10
					end

					if var_46_13.prefab_name ~= "" and arg_43_1.actors_[var_46_13.prefab_name] ~= nil then
						local var_46_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_13.prefab_name].transform, "story_v_out_319511", "319511011", "story_v_out_319511.awb")

						arg_43_1:RecordAudio("319511011", var_46_19)
						arg_43_1:RecordAudio("319511011", var_46_19)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319511", "319511011", "story_v_out_319511.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319511", "319511011", "story_v_out_319511.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_20 = math.max(var_46_11, arg_43_1.talkMaxDuration)

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_20 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_10) / var_46_20

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_10 + var_46_20 and arg_43_1.time_ < var_46_10 + var_46_20 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319511012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319511012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play319511013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1084ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1084ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.275

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[698].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(319511012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 11
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
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_14 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_14 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_14

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_14 and arg_47_1.time_ < var_50_6 + var_50_14 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319511013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319511013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play319511014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.8

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_2 = arg_51_1:GetWordFromCfg(319511013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 32
				local var_54_5 = utf8.len(var_54_3)
				local var_54_6 = var_54_4 <= 0 and var_54_1 or var_54_1 * (var_54_5 / var_54_4)

				if var_54_6 > 0 and var_54_1 < var_54_6 then
					arg_51_1.talkMaxDuration = var_54_6

					if var_54_6 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_6 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_3
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_7 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_7 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_7

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_7 and arg_51_1.time_ < var_54_0 + var_54_7 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319511014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319511014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play319511015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.85

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[698].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(319511014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 34
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_8 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_8 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_8

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_8 and arg_55_1.time_ < var_58_0 + var_58_8 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319511015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319511015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play319511016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.725

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[698].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(319511015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 29
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319511016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319511016
		arg_63_1.duration_ = 7.566

		local var_63_0 = {
			zh = 2.3,
			ja = 7.566
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
				arg_63_0:Play319511017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0.7, -0.97, -6)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1084ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1084ui_story then
					arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_66_15 = 0
			local var_66_16 = 0.15

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_17 = arg_63_1:FormatText(StoryNameCfg[6].name)

				arg_63_1.leftNameTxt_.text = var_66_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_18 = arg_63_1:GetWordFromCfg(319511016)
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

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511016", "story_v_out_319511.awb") ~= 0 then
					local var_66_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511016", "story_v_out_319511.awb") / 1000

					if var_66_23 + var_66_15 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_23 + var_66_15
					end

					if var_66_18.prefab_name ~= "" and arg_63_1.actors_[var_66_18.prefab_name] ~= nil then
						local var_66_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_18.prefab_name].transform, "story_v_out_319511", "319511016", "story_v_out_319511.awb")

						arg_63_1:RecordAudio("319511016", var_66_24)
						arg_63_1:RecordAudio("319511016", var_66_24)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319511", "319511016", "story_v_out_319511.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319511", "319511016", "story_v_out_319511.awb")
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
	Play319511017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319511017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play319511018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1084ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1084ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.725

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[698].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(319511017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 29
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13

					if var_70_13 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_10
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_14 and arg_67_1.time_ < var_70_6 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319511018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319511018
		arg_71_1.duration_ = 8.966

		local var_71_0 = {
			zh = 7.2,
			ja = 8.966
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
				arg_71_0:Play319511019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1084ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story == nil then
				arg_71_1.var_.characterEffect1084ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1084ui_story then
					arg_71_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story then
				arg_71_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_74_4 = 0
			local var_74_5 = 0.85

			if var_74_4 < arg_71_1.time_ and arg_71_1.time_ <= var_74_4 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_6 = arg_71_1:FormatText(StoryNameCfg[6].name)

				arg_71_1.leftNameTxt_.text = var_74_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_7 = arg_71_1:GetWordFromCfg(319511018)
				local var_74_8 = arg_71_1:FormatText(var_74_7.content)

				arg_71_1.text_.text = var_74_8

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_9 = 34
				local var_74_10 = utf8.len(var_74_8)
				local var_74_11 = var_74_9 <= 0 and var_74_5 or var_74_5 * (var_74_10 / var_74_9)

				if var_74_11 > 0 and var_74_5 < var_74_11 then
					arg_71_1.talkMaxDuration = var_74_11

					if var_74_11 + var_74_4 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_11 + var_74_4
					end
				end

				arg_71_1.text_.text = var_74_8
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511018", "story_v_out_319511.awb") ~= 0 then
					local var_74_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511018", "story_v_out_319511.awb") / 1000

					if var_74_12 + var_74_4 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_4
					end

					if var_74_7.prefab_name ~= "" and arg_71_1.actors_[var_74_7.prefab_name] ~= nil then
						local var_74_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_7.prefab_name].transform, "story_v_out_319511", "319511018", "story_v_out_319511.awb")

						arg_71_1:RecordAudio("319511018", var_74_13)
						arg_71_1:RecordAudio("319511018", var_74_13)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_319511", "319511018", "story_v_out_319511.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_319511", "319511018", "story_v_out_319511.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_14 = math.max(var_74_5, arg_71_1.talkMaxDuration)

			if var_74_4 <= arg_71_1.time_ and arg_71_1.time_ < var_74_4 + var_74_14 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_4) / var_74_14

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_4 + var_74_14 and arg_71_1.time_ < var_74_4 + var_74_14 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319511019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319511019
		arg_75_1.duration_ = 7

		local var_75_0 = {
			zh = 7,
			ja = 5.866
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
				arg_75_0:Play319511020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.85

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[6].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(319511019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511019", "story_v_out_319511.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511019", "story_v_out_319511.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_319511", "319511019", "story_v_out_319511.awb")

						arg_75_1:RecordAudio("319511019", var_78_9)
						arg_75_1:RecordAudio("319511019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319511", "319511019", "story_v_out_319511.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319511", "319511019", "story_v_out_319511.awb")
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
	Play319511020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319511020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play319511021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1084ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1084ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1084ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.425

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[698].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(319511020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 17
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
	Play319511021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319511021
		arg_83_1.duration_ = 11

		local var_83_0 = {
			zh = 5.533,
			ja = 11
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
				arg_83_0:Play319511022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0.7, -0.97, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1084ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1084ui_story then
					arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.425

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(319511021)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511021", "story_v_out_319511.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511021", "story_v_out_319511.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_319511", "319511021", "story_v_out_319511.awb")

						arg_83_1:RecordAudio("319511021", var_86_24)
						arg_83_1:RecordAudio("319511021", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319511", "319511021", "story_v_out_319511.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319511", "319511021", "story_v_out_319511.awb")
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
	Play319511022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319511022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play319511023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1084ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1084ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.875

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[698].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(319511022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 35
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
	Play319511023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319511023
		arg_91_1.duration_ = 1.999999999999

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play319511024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1084ui_story then
					arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_94_4 = 0

			if var_94_4 < arg_91_1.time_ and arg_91_1.time_ <= var_94_4 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_6 = 0
			local var_94_7 = 0.075

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[6].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(319511023)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 3
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511023", "story_v_out_319511.awb") ~= 0 then
					local var_94_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511023", "story_v_out_319511.awb") / 1000

					if var_94_14 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_14 + var_94_6
					end

					if var_94_9.prefab_name ~= "" and arg_91_1.actors_[var_94_9.prefab_name] ~= nil then
						local var_94_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_9.prefab_name].transform, "story_v_out_319511", "319511023", "story_v_out_319511.awb")

						arg_91_1:RecordAudio("319511023", var_94_15)
						arg_91_1:RecordAudio("319511023", var_94_15)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319511", "319511023", "story_v_out_319511.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319511", "319511023", "story_v_out_319511.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_16 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_16 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_16

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_16 and arg_91_1.time_ < var_94_6 + var_94_16 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319511024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319511024
		arg_95_1.duration_ = 2.599999999999

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319511025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "STblack"

			if arg_95_1.bgs_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(arg_95_1.paintGo_)

				var_98_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_98_0)
				var_98_1.name = var_98_0
				var_98_1.transform.parent = arg_95_1.stage_.transform
				var_98_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_95_1.bgs_[var_98_0] = var_98_1
			end

			local var_98_2 = 4.44089209850063e-16

			if var_98_2 < arg_95_1.time_ and arg_95_1.time_ <= var_98_2 + arg_98_0 then
				local var_98_3 = manager.ui.mainCamera.transform.localPosition
				local var_98_4 = Vector3.New(0, 0, 10) + Vector3.New(var_98_3.x, var_98_3.y, 0)
				local var_98_5 = arg_95_1.bgs_.STblack

				var_98_5.transform.localPosition = var_98_4
				var_98_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_98_6 = var_98_5:GetComponent("SpriteRenderer")

				if var_98_6 and var_98_6.sprite then
					local var_98_7 = (var_98_5.transform.localPosition - var_98_3).z
					local var_98_8 = manager.ui.mainCameraCom_
					local var_98_9 = 2 * var_98_7 * Mathf.Tan(var_98_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_98_10 = var_98_9 * var_98_8.aspect
					local var_98_11 = var_98_6.sprite.bounds.size.x
					local var_98_12 = var_98_6.sprite.bounds.size.y
					local var_98_13 = var_98_10 / var_98_11
					local var_98_14 = var_98_9 / var_98_12
					local var_98_15 = var_98_14 < var_98_13 and var_98_13 or var_98_14

					var_98_5.transform.localScale = Vector3.New(var_98_15, var_98_15, 0)
				end

				for iter_98_0, iter_98_1 in pairs(arg_95_1.bgs_) do
					if iter_98_0 ~= "STblack" then
						iter_98_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				local var_98_17 = arg_95_1.fswbg_.transform:Find("textbox/adapt/content") or arg_95_1.fswbg_.transform:Find("textbox/content")
				local var_98_18 = var_98_17:GetComponent("Text")
				local var_98_19 = var_98_17:GetComponent("RectTransform")

				var_98_18.alignment = UnityEngine.TextAnchor.LowerCenter
				var_98_19.offsetMin = Vector2.New(0, 0)
				var_98_19.offsetMax = Vector2.New(0, 0)
			end

			local var_98_20 = 4.44089209850063e-16

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1.fswbg_:SetActive(true)
				arg_95_1.dialog_:SetActive(false)

				arg_95_1.fswtw_.percent = 0

				local var_98_21 = arg_95_1:GetWordFromCfg(319511024)
				local var_98_22 = arg_95_1:FormatText(var_98_21.content)

				arg_95_1.fswt_.text = var_98_22

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.fswt_)

				arg_95_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_95_1.fswtw_:SetDirty()

				arg_95_1.typewritterCharCountI18N = 0

				SetActive(arg_95_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_95_1:ShowNextGo(false)
			end

			local var_98_23 = 0.4

			if var_98_23 < arg_95_1.time_ and arg_95_1.time_ <= var_98_23 + arg_98_0 then
				arg_95_1.var_.oldValueTypewriter = arg_95_1.fswtw_.percent

				arg_95_1:ShowNextGo(false)
			end

			local var_98_24 = 21
			local var_98_25 = 1.4
			local var_98_26 = arg_95_1:GetWordFromCfg(319511024)
			local var_98_27 = arg_95_1:FormatText(var_98_26.content)
			local var_98_28, var_98_29 = arg_95_1:GetPercentByPara(var_98_27, 1)

			if var_98_23 < arg_95_1.time_ and arg_95_1.time_ <= var_98_23 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0

				local var_98_30 = var_98_24 <= 0 and var_98_25 or var_98_25 * ((var_98_29 - arg_95_1.typewritterCharCountI18N) / var_98_24)

				if var_98_30 > 0 and var_98_25 < var_98_30 then
					arg_95_1.talkMaxDuration = var_98_30

					if var_98_30 + var_98_23 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_30 + var_98_23
					end
				end
			end

			local var_98_31 = 1.4
			local var_98_32 = math.max(var_98_31, arg_95_1.talkMaxDuration)

			if var_98_23 <= arg_95_1.time_ and arg_95_1.time_ < var_98_23 + var_98_32 then
				local var_98_33 = (arg_95_1.time_ - var_98_23) / var_98_32

				arg_95_1.fswtw_.percent = Mathf.Lerp(arg_95_1.var_.oldValueTypewriter, var_98_28, var_98_33)
				arg_95_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_95_1.fswtw_:SetDirty()
			end

			if arg_95_1.time_ >= var_98_23 + var_98_32 and arg_95_1.time_ < var_98_23 + var_98_32 + arg_98_0 then
				arg_95_1.fswtw_.percent = var_98_28

				arg_95_1.fswtw_:SetDirty()
				arg_95_1:ShowNextGo(true)

				arg_95_1.typewritterCharCountI18N = var_98_29
			end

			local var_98_34 = 4.44089209850063e-16

			if var_98_34 < arg_95_1.time_ and arg_95_1.time_ <= var_98_34 + arg_98_0 then
				arg_95_1.cswbg_:SetActive(true)

				local var_98_35 = arg_95_1.cswt_:GetComponent("RectTransform")

				arg_95_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_98_35.offsetMin = Vector2.New(410, 330)
				var_98_35.offsetMax = Vector2.New(-400, -180)

				local var_98_36 = arg_95_1:GetWordFromCfg(419026)
				local var_98_37 = arg_95_1:FormatText(var_98_36.content)

				arg_95_1.cswt_.text = var_98_37

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.cswt_)

				arg_95_1.cswt_.fontSize = 175
				arg_95_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_95_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_98_38 = arg_95_1.actors_["10069ui_story"].transform
			local var_98_39 = 4.44089209850063e-16

			if var_98_39 < arg_95_1.time_ and arg_95_1.time_ <= var_98_39 + arg_98_0 then
				arg_95_1.var_.moveOldPos10069ui_story = var_98_38.localPosition
			end

			local var_98_40 = 0.001

			if var_98_39 <= arg_95_1.time_ and arg_95_1.time_ < var_98_39 + var_98_40 then
				local var_98_41 = (arg_95_1.time_ - var_98_39) / var_98_40
				local var_98_42 = Vector3.New(0, 100, 0)

				var_98_38.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10069ui_story, var_98_42, var_98_41)

				local var_98_43 = manager.ui.mainCamera.transform.position - var_98_38.position

				var_98_38.forward = Vector3.New(var_98_43.x, var_98_43.y, var_98_43.z)

				local var_98_44 = var_98_38.localEulerAngles

				var_98_44.z = 0
				var_98_44.x = 0
				var_98_38.localEulerAngles = var_98_44
			end

			if arg_95_1.time_ >= var_98_39 + var_98_40 and arg_95_1.time_ < var_98_39 + var_98_40 + arg_98_0 then
				var_98_38.localPosition = Vector3.New(0, 100, 0)

				local var_98_45 = manager.ui.mainCamera.transform.position - var_98_38.position

				var_98_38.forward = Vector3.New(var_98_45.x, var_98_45.y, var_98_45.z)

				local var_98_46 = var_98_38.localEulerAngles

				var_98_46.z = 0
				var_98_46.x = 0
				var_98_38.localEulerAngles = var_98_46
			end

			local var_98_47 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_48 = 4.44089209850063e-16

			if var_98_48 < arg_95_1.time_ and arg_95_1.time_ <= var_98_48 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_47.localPosition
			end

			local var_98_49 = 0.001

			if var_98_48 <= arg_95_1.time_ and arg_95_1.time_ < var_98_48 + var_98_49 then
				local var_98_50 = (arg_95_1.time_ - var_98_48) / var_98_49
				local var_98_51 = Vector3.New(0, 100, 0)

				var_98_47.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_51, var_98_50)

				local var_98_52 = manager.ui.mainCamera.transform.position - var_98_47.position

				var_98_47.forward = Vector3.New(var_98_52.x, var_98_52.y, var_98_52.z)

				local var_98_53 = var_98_47.localEulerAngles

				var_98_53.z = 0
				var_98_53.x = 0
				var_98_47.localEulerAngles = var_98_53
			end

			if arg_95_1.time_ >= var_98_48 + var_98_49 and arg_95_1.time_ < var_98_48 + var_98_49 + arg_98_0 then
				var_98_47.localPosition = Vector3.New(0, 100, 0)

				local var_98_54 = manager.ui.mainCamera.transform.position - var_98_47.position

				var_98_47.forward = Vector3.New(var_98_54.x, var_98_54.y, var_98_54.z)

				local var_98_55 = var_98_47.localEulerAngles

				var_98_55.z = 0
				var_98_55.x = 0
				var_98_47.localEulerAngles = var_98_55
			end
		end
	end,
	Play319511025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319511025
		arg_99_1.duration_ = 6.175

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play319511026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				local var_102_1 = manager.ui.mainCamera.transform.localPosition
				local var_102_2 = Vector3.New(0, 0, 10) + Vector3.New(var_102_1.x, var_102_1.y, 0)
				local var_102_3 = arg_99_1.bgs_.ST72

				var_102_3.transform.localPosition = var_102_2
				var_102_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_102_4 = var_102_3:GetComponent("SpriteRenderer")

				if var_102_4 and var_102_4.sprite then
					local var_102_5 = (var_102_3.transform.localPosition - var_102_1).z
					local var_102_6 = manager.ui.mainCameraCom_
					local var_102_7 = 2 * var_102_5 * Mathf.Tan(var_102_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_102_8 = var_102_7 * var_102_6.aspect
					local var_102_9 = var_102_4.sprite.bounds.size.x
					local var_102_10 = var_102_4.sprite.bounds.size.y
					local var_102_11 = var_102_8 / var_102_9
					local var_102_12 = var_102_7 / var_102_10
					local var_102_13 = var_102_12 < var_102_11 and var_102_11 or var_102_12

					var_102_3.transform.localScale = Vector3.New(var_102_13, var_102_13, 0)
				end

				for iter_102_0, iter_102_1 in pairs(arg_99_1.bgs_) do
					if iter_102_0 ~= "ST72" then
						iter_102_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_102_14 = 1.175

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1.allBtn_.enabled = false
			end

			local var_102_15 = 0.3

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 then
				arg_99_1.allBtn_.enabled = true
			end

			local var_102_16 = arg_99_1.actors_["1084ui_story"].transform
			local var_102_17 = 1.175

			if var_102_17 < arg_99_1.time_ and arg_99_1.time_ <= var_102_17 + arg_102_0 then
				arg_99_1.var_.moveOldPos1084ui_story = var_102_16.localPosition
			end

			local var_102_18 = 0.001

			if var_102_17 <= arg_99_1.time_ and arg_99_1.time_ < var_102_17 + var_102_18 then
				local var_102_19 = (arg_99_1.time_ - var_102_17) / var_102_18
				local var_102_20 = Vector3.New(0, 100, 0)

				var_102_16.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1084ui_story, var_102_20, var_102_19)

				local var_102_21 = manager.ui.mainCamera.transform.position - var_102_16.position

				var_102_16.forward = Vector3.New(var_102_21.x, var_102_21.y, var_102_21.z)

				local var_102_22 = var_102_16.localEulerAngles

				var_102_22.z = 0
				var_102_22.x = 0
				var_102_16.localEulerAngles = var_102_22
			end

			if arg_99_1.time_ >= var_102_17 + var_102_18 and arg_99_1.time_ < var_102_17 + var_102_18 + arg_102_0 then
				var_102_16.localPosition = Vector3.New(0, 100, 0)

				local var_102_23 = manager.ui.mainCamera.transform.position - var_102_16.position

				var_102_16.forward = Vector3.New(var_102_23.x, var_102_23.y, var_102_23.z)

				local var_102_24 = var_102_16.localEulerAngles

				var_102_24.z = 0
				var_102_24.x = 0
				var_102_16.localEulerAngles = var_102_24
			end

			local var_102_25 = arg_99_1.actors_["1084ui_story"]
			local var_102_26 = 1.175

			if var_102_26 < arg_99_1.time_ and arg_99_1.time_ <= var_102_26 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_27 = 0.200000002980232

			if var_102_26 <= arg_99_1.time_ and arg_99_1.time_ < var_102_26 + var_102_27 then
				local var_102_28 = (arg_99_1.time_ - var_102_26) / var_102_27

				if arg_99_1.var_.characterEffect1084ui_story then
					local var_102_29 = Mathf.Lerp(0, 0.5, var_102_28)

					arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_29
				end
			end

			if arg_99_1.time_ >= var_102_26 + var_102_27 and arg_99_1.time_ < var_102_26 + var_102_27 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				local var_102_30 = 0.5

				arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_30
			end

			local var_102_31 = arg_99_1.actors_["10069ui_story"].transform
			local var_102_32 = 1.175

			if var_102_32 < arg_99_1.time_ and arg_99_1.time_ <= var_102_32 + arg_102_0 then
				arg_99_1.var_.moveOldPos10069ui_story = var_102_31.localPosition
			end

			local var_102_33 = 0.001

			if var_102_32 <= arg_99_1.time_ and arg_99_1.time_ < var_102_32 + var_102_33 then
				local var_102_34 = (arg_99_1.time_ - var_102_32) / var_102_33
				local var_102_35 = Vector3.New(0, 100, 0)

				var_102_31.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10069ui_story, var_102_35, var_102_34)

				local var_102_36 = manager.ui.mainCamera.transform.position - var_102_31.position

				var_102_31.forward = Vector3.New(var_102_36.x, var_102_36.y, var_102_36.z)

				local var_102_37 = var_102_31.localEulerAngles

				var_102_37.z = 0
				var_102_37.x = 0
				var_102_31.localEulerAngles = var_102_37
			end

			if arg_99_1.time_ >= var_102_32 + var_102_33 and arg_99_1.time_ < var_102_32 + var_102_33 + arg_102_0 then
				var_102_31.localPosition = Vector3.New(0, 100, 0)

				local var_102_38 = manager.ui.mainCamera.transform.position - var_102_31.position

				var_102_31.forward = Vector3.New(var_102_38.x, var_102_38.y, var_102_38.z)

				local var_102_39 = var_102_31.localEulerAngles

				var_102_39.z = 0
				var_102_39.x = 0
				var_102_31.localEulerAngles = var_102_39
			end

			local var_102_40 = arg_99_1.actors_["10069ui_story"]
			local var_102_41 = 1.175

			if var_102_41 < arg_99_1.time_ and arg_99_1.time_ <= var_102_41 + arg_102_0 and arg_99_1.var_.characterEffect10069ui_story == nil then
				arg_99_1.var_.characterEffect10069ui_story = var_102_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_42 = 0.200000002980232

			if var_102_41 <= arg_99_1.time_ and arg_99_1.time_ < var_102_41 + var_102_42 then
				local var_102_43 = (arg_99_1.time_ - var_102_41) / var_102_42

				if arg_99_1.var_.characterEffect10069ui_story then
					local var_102_44 = Mathf.Lerp(0, 0.5, var_102_43)

					arg_99_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_99_1.var_.characterEffect10069ui_story.fillRatio = var_102_44
				end
			end

			if arg_99_1.time_ >= var_102_41 + var_102_42 and arg_99_1.time_ < var_102_41 + var_102_42 + arg_102_0 and arg_99_1.var_.characterEffect10069ui_story then
				local var_102_45 = 0.5

				arg_99_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_99_1.var_.characterEffect10069ui_story.fillRatio = var_102_45
			end

			local var_102_46 = 0

			if var_102_46 < arg_99_1.time_ and arg_99_1.time_ <= var_102_46 + arg_102_0 then
				arg_99_1.fswbg_:SetActive(false)
				arg_99_1.dialog_:SetActive(false)
				arg_99_1:ShowNextGo(false)
			end

			local var_102_47 = 0

			if var_102_47 < arg_99_1.time_ and arg_99_1.time_ <= var_102_47 + arg_102_0 then
				arg_99_1.cswbg_:SetActive(false)
			end

			if arg_99_1.frameCnt_ <= 1 then
				arg_99_1.dialog_:SetActive(false)
			end

			local var_102_48 = 1.175
			local var_102_49 = 1.125

			if var_102_48 < arg_99_1.time_ and arg_99_1.time_ <= var_102_48 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				arg_99_1.dialog_:SetActive(true)

				local var_102_50 = LeanTween.value(arg_99_1.dialog_, 0, 1, 0.3)

				var_102_50:setOnUpdate(LuaHelper.FloatAction(function(arg_103_0)
					arg_99_1.dialogCg_.alpha = arg_103_0
				end))
				var_102_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_99_1.dialog_)
					var_102_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_99_1.duration_ = arg_99_1.duration_ + 0.3

				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_51 = arg_99_1:GetWordFromCfg(319511025)
				local var_102_52 = arg_99_1:FormatText(var_102_51.content)

				arg_99_1.text_.text = var_102_52

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_53 = 45
				local var_102_54 = utf8.len(var_102_52)
				local var_102_55 = var_102_53 <= 0 and var_102_49 or var_102_49 * (var_102_54 / var_102_53)

				if var_102_55 > 0 and var_102_49 < var_102_55 then
					arg_99_1.talkMaxDuration = var_102_55
					var_102_48 = var_102_48 + 0.3

					if var_102_55 + var_102_48 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_55 + var_102_48
					end
				end

				arg_99_1.text_.text = var_102_52
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_56 = var_102_48 + 0.3
			local var_102_57 = math.max(var_102_49, arg_99_1.talkMaxDuration)

			if var_102_56 <= arg_99_1.time_ and arg_99_1.time_ < var_102_56 + var_102_57 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_56) / var_102_57

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_56 + var_102_57 and arg_99_1.time_ < var_102_56 + var_102_57 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319511026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319511026
		arg_105_1.duration_ = 5.233

		local var_105_0 = {
			zh = 3.2,
			ja = 5.233
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play319511027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1084ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1084ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, -0.97, -6)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1084ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1084ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story == nil then
				arg_105_1.var_.characterEffect1084ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1084ui_story then
					arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story then
				arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_108_15 = 0
			local var_108_16 = 0.35

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_17 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(319511026)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 14
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_16 or var_108_16 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_16 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511026", "story_v_out_319511.awb") ~= 0 then
					local var_108_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511026", "story_v_out_319511.awb") / 1000

					if var_108_23 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_23 + var_108_15
					end

					if var_108_18.prefab_name ~= "" and arg_105_1.actors_[var_108_18.prefab_name] ~= nil then
						local var_108_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_18.prefab_name].transform, "story_v_out_319511", "319511026", "story_v_out_319511.awb")

						arg_105_1:RecordAudio("319511026", var_108_24)
						arg_105_1:RecordAudio("319511026", var_108_24)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319511", "319511026", "story_v_out_319511.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319511", "319511026", "story_v_out_319511.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_25 and arg_105_1.time_ < var_108_15 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319511027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319511027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play319511028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1084ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story == nil then
				arg_109_1.var_.characterEffect1084ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1084ui_story then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 0.45

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_8 = arg_109_1:FormatText(StoryNameCfg[698].name)

				arg_109_1.leftNameTxt_.text = var_112_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_9 = arg_109_1:GetWordFromCfg(319511027)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 18
				local var_112_12 = utf8.len(var_112_10)
				local var_112_13 = var_112_11 <= 0 and var_112_7 or var_112_7 * (var_112_12 / var_112_11)

				if var_112_13 > 0 and var_112_7 < var_112_13 then
					arg_109_1.talkMaxDuration = var_112_13

					if var_112_13 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_13 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_10
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_14 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_14 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_14

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_14 and arg_109_1.time_ < var_112_6 + var_112_14 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319511028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319511028
		arg_113_1.duration_ = 7.533

		local var_113_0 = {
			zh = 5,
			ja = 7.533
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
				arg_113_0:Play319511029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1084ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1084ui_story == nil then
				arg_113_1.var_.characterEffect1084ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1084ui_story then
					arg_113_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1084ui_story then
				arg_113_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_116_6 = 0
			local var_116_7 = 0.625

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[6].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(319511028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 25
				local var_116_12 = utf8.len(var_116_10)
				local var_116_13 = var_116_11 <= 0 and var_116_7 or var_116_7 * (var_116_12 / var_116_11)

				if var_116_13 > 0 and var_116_7 < var_116_13 then
					arg_113_1.talkMaxDuration = var_116_13

					if var_116_13 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_13 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_10
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511028", "story_v_out_319511.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511028", "story_v_out_319511.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_out_319511", "319511028", "story_v_out_319511.awb")

						arg_113_1:RecordAudio("319511028", var_116_15)
						arg_113_1:RecordAudio("319511028", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_319511", "319511028", "story_v_out_319511.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_319511", "319511028", "story_v_out_319511.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_16 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_16 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_16

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_16 and arg_113_1.time_ < var_116_6 + var_116_16 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319511029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319511029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play319511030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1084ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story == nil then
				arg_117_1.var_.characterEffect1084ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1084ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1084ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1084ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.85

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_8 = arg_117_1:GetWordFromCfg(319511029)
				local var_120_9 = arg_117_1:FormatText(var_120_8.content)

				arg_117_1.text_.text = var_120_9

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_10 = 34
				local var_120_11 = utf8.len(var_120_9)
				local var_120_12 = var_120_10 <= 0 and var_120_7 or var_120_7 * (var_120_11 / var_120_10)

				if var_120_12 > 0 and var_120_7 < var_120_12 then
					arg_117_1.talkMaxDuration = var_120_12

					if var_120_12 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_12 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_9
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_13 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_13 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_13

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_13 and arg_117_1.time_ < var_120_6 + var_120_13 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319511030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319511030
		arg_121_1.duration_ = 4.866

		local var_121_0 = {
			zh = 1.999999999999,
			ja = 4.866
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
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play319511031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10069ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos10069ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0.7, -1.08, -6.33)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10069ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0.7, -1.08, -6.33)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["10069ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect10069ui_story == nil then
				arg_121_1.var_.characterEffect10069ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect10069ui_story then
					arg_121_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect10069ui_story then
				arg_121_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action1_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = arg_121_1.actors_["1084ui_story"].transform
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.var_.moveOldPos1084ui_story = var_124_15.localPosition
			end

			local var_124_17 = 0.001

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Vector3.New(-0.7, -0.97, -6)

				var_124_15.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1084ui_story, var_124_19, var_124_18)

				local var_124_20 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_20.x, var_124_20.y, var_124_20.z)

				local var_124_21 = var_124_15.localEulerAngles

				var_124_21.z = 0
				var_124_21.x = 0
				var_124_15.localEulerAngles = var_124_21
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 then
				var_124_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_124_22 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_22.x, var_124_22.y, var_124_22.z)

				local var_124_23 = var_124_15.localEulerAngles

				var_124_23.z = 0
				var_124_23.x = 0
				var_124_15.localEulerAngles = var_124_23
			end

			local var_124_24 = arg_121_1.actors_["1084ui_story"]
			local var_124_25 = 0

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story == nil then
				arg_121_1.var_.characterEffect1084ui_story = var_124_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_26 = 0.200000002980232

			if var_124_25 <= arg_121_1.time_ and arg_121_1.time_ < var_124_25 + var_124_26 then
				local var_124_27 = (arg_121_1.time_ - var_124_25) / var_124_26

				if arg_121_1.var_.characterEffect1084ui_story then
					local var_124_28 = Mathf.Lerp(0, 0.5, var_124_27)

					arg_121_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1084ui_story.fillRatio = var_124_28
				end
			end

			if arg_121_1.time_ >= var_124_25 + var_124_26 and arg_121_1.time_ < var_124_25 + var_124_26 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story then
				local var_124_29 = 0.5

				arg_121_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1084ui_story.fillRatio = var_124_29
			end

			local var_124_30 = 0

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_124_31 = 0

			if var_124_31 < arg_121_1.time_ and arg_121_1.time_ <= var_124_31 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_124_32 = 0
			local var_124_33 = 0.2

			if var_124_32 < arg_121_1.time_ and arg_121_1.time_ <= var_124_32 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_34 = arg_121_1:FormatText(StoryNameCfg[693].name)

				arg_121_1.leftNameTxt_.text = var_124_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_35 = arg_121_1:GetWordFromCfg(319511030)
				local var_124_36 = arg_121_1:FormatText(var_124_35.content)

				arg_121_1.text_.text = var_124_36

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_37 = 8
				local var_124_38 = utf8.len(var_124_36)
				local var_124_39 = var_124_37 <= 0 and var_124_33 or var_124_33 * (var_124_38 / var_124_37)

				if var_124_39 > 0 and var_124_33 < var_124_39 then
					arg_121_1.talkMaxDuration = var_124_39

					if var_124_39 + var_124_32 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_39 + var_124_32
					end
				end

				arg_121_1.text_.text = var_124_36
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511030", "story_v_out_319511.awb") ~= 0 then
					local var_124_40 = manager.audio:GetVoiceLength("story_v_out_319511", "319511030", "story_v_out_319511.awb") / 1000

					if var_124_40 + var_124_32 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_40 + var_124_32
					end

					if var_124_35.prefab_name ~= "" and arg_121_1.actors_[var_124_35.prefab_name] ~= nil then
						local var_124_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_35.prefab_name].transform, "story_v_out_319511", "319511030", "story_v_out_319511.awb")

						arg_121_1:RecordAudio("319511030", var_124_41)
						arg_121_1:RecordAudio("319511030", var_124_41)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319511", "319511030", "story_v_out_319511.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319511", "319511030", "story_v_out_319511.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_42 = math.max(var_124_33, arg_121_1.talkMaxDuration)

			if var_124_32 <= arg_121_1.time_ and arg_121_1.time_ < var_124_32 + var_124_42 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_32) / var_124_42

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_32 + var_124_42 and arg_121_1.time_ < var_124_32 + var_124_42 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319511031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319511031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play319511032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10069ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect10069ui_story == nil then
				arg_125_1.var_.characterEffect10069ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect10069ui_story then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_125_1.var_.characterEffect10069ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10069ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_125_1.var_.characterEffect10069ui_story.fillRatio = var_128_5
			end

			local var_128_6 = 0
			local var_128_7 = 0.675

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[698].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, true)
				arg_125_1.iconController_:SetSelectedState("hero")

				arg_125_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(319511031)
				local var_128_10 = arg_125_1:FormatText(var_128_9.content)

				arg_125_1.text_.text = var_128_10

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_11 = 27
				local var_128_12 = utf8.len(var_128_10)
				local var_128_13 = var_128_11 <= 0 and var_128_7 or var_128_7 * (var_128_12 / var_128_11)

				if var_128_13 > 0 and var_128_7 < var_128_13 then
					arg_125_1.talkMaxDuration = var_128_13

					if var_128_13 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_10
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_14 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_14 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_14

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_14 and arg_125_1.time_ < var_128_6 + var_128_14 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319511032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319511032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play319511033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.575

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[698].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, true)
				arg_129_1.iconController_:SetSelectedState("hero")

				arg_129_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(319511032)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 23
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_8 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_8 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_8

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_8 and arg_129_1.time_ < var_132_0 + var_132_8 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319511033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319511033
		arg_133_1.duration_ = 2.7

		local var_133_0 = {
			zh = 1.999999999999,
			ja = 2.7
		}
		local var_133_1 = manager.audio:GetLocalizationFlag()

		if var_133_0[var_133_1] ~= nil then
			arg_133_1.duration_ = var_133_0[var_133_1]
		end

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play319511034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1084ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story == nil then
				arg_133_1.var_.characterEffect1084ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1084ui_story then
					arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story then
				arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_136_5 = 0
			local var_136_6 = 0.075

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_7 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_8 = arg_133_1:GetWordFromCfg(319511033)
				local var_136_9 = arg_133_1:FormatText(var_136_8.content)

				arg_133_1.text_.text = var_136_9

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_10 = 3
				local var_136_11 = utf8.len(var_136_9)
				local var_136_12 = var_136_10 <= 0 and var_136_6 or var_136_6 * (var_136_11 / var_136_10)

				if var_136_12 > 0 and var_136_6 < var_136_12 then
					arg_133_1.talkMaxDuration = var_136_12

					if var_136_12 + var_136_5 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_12 + var_136_5
					end
				end

				arg_133_1.text_.text = var_136_9
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511033", "story_v_out_319511.awb") ~= 0 then
					local var_136_13 = manager.audio:GetVoiceLength("story_v_out_319511", "319511033", "story_v_out_319511.awb") / 1000

					if var_136_13 + var_136_5 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_5
					end

					if var_136_8.prefab_name ~= "" and arg_133_1.actors_[var_136_8.prefab_name] ~= nil then
						local var_136_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_8.prefab_name].transform, "story_v_out_319511", "319511033", "story_v_out_319511.awb")

						arg_133_1:RecordAudio("319511033", var_136_14)
						arg_133_1:RecordAudio("319511033", var_136_14)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319511", "319511033", "story_v_out_319511.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319511", "319511033", "story_v_out_319511.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_15 = math.max(var_136_6, arg_133_1.talkMaxDuration)

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_15 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_5) / var_136_15

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_5 + var_136_15 and arg_133_1.time_ < var_136_5 + var_136_15 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319511034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319511034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play319511035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1084ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1084ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, 100, 0)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1084ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, 100, 0)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1084ui_story"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_11 = 0.200000002980232

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.characterEffect1084ui_story then
					local var_140_13 = Mathf.Lerp(0, 0.5, var_140_12)

					arg_137_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1084ui_story.fillRatio = var_140_13
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				local var_140_14 = 0.5

				arg_137_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1084ui_story.fillRatio = var_140_14
			end

			local var_140_15 = arg_137_1.actors_["10069ui_story"].transform
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 then
				arg_137_1.var_.moveOldPos10069ui_story = var_140_15.localPosition
			end

			local var_140_17 = 0.001

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17
				local var_140_19 = Vector3.New(0, 100, 0)

				var_140_15.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10069ui_story, var_140_19, var_140_18)

				local var_140_20 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_20.x, var_140_20.y, var_140_20.z)

				local var_140_21 = var_140_15.localEulerAngles

				var_140_21.z = 0
				var_140_21.x = 0
				var_140_15.localEulerAngles = var_140_21
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 then
				var_140_15.localPosition = Vector3.New(0, 100, 0)

				local var_140_22 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_22.x, var_140_22.y, var_140_22.z)

				local var_140_23 = var_140_15.localEulerAngles

				var_140_23.z = 0
				var_140_23.x = 0
				var_140_15.localEulerAngles = var_140_23
			end

			local var_140_24 = arg_137_1.actors_["10069ui_story"]
			local var_140_25 = 0

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 and arg_137_1.var_.characterEffect10069ui_story == nil then
				arg_137_1.var_.characterEffect10069ui_story = var_140_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_26 = 0.200000002980232

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26

				if arg_137_1.var_.characterEffect10069ui_story then
					local var_140_28 = Mathf.Lerp(0, 0.5, var_140_27)

					arg_137_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_137_1.var_.characterEffect10069ui_story.fillRatio = var_140_28
				end
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 and arg_137_1.var_.characterEffect10069ui_story then
				local var_140_29 = 0.5

				arg_137_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_137_1.var_.characterEffect10069ui_story.fillRatio = var_140_29
			end

			local var_140_30 = 0
			local var_140_31 = 1.3

			if var_140_30 < arg_137_1.time_ and arg_137_1.time_ <= var_140_30 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_32 = arg_137_1:GetWordFromCfg(319511034)
				local var_140_33 = arg_137_1:FormatText(var_140_32.content)

				arg_137_1.text_.text = var_140_33

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_34 = 52
				local var_140_35 = utf8.len(var_140_33)
				local var_140_36 = var_140_34 <= 0 and var_140_31 or var_140_31 * (var_140_35 / var_140_34)

				if var_140_36 > 0 and var_140_31 < var_140_36 then
					arg_137_1.talkMaxDuration = var_140_36

					if var_140_36 + var_140_30 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_36 + var_140_30
					end
				end

				arg_137_1.text_.text = var_140_33
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_37 = math.max(var_140_31, arg_137_1.talkMaxDuration)

			if var_140_30 <= arg_137_1.time_ and arg_137_1.time_ < var_140_30 + var_140_37 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_30) / var_140_37

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_30 + var_140_37 and arg_137_1.time_ < var_140_30 + var_140_37 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319511035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319511035
		arg_141_1.duration_ = 5.8

		local var_141_0 = {
			zh = 3.233,
			ja = 5.8
		}
		local var_141_1 = manager.audio:GetLocalizationFlag()

		if var_141_0[var_141_1] ~= nil then
			arg_141_1.duration_ = var_141_0[var_141_1]
		end

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play319511036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = "10068ui_story"

			if arg_141_1.actors_[var_144_0] == nil then
				local var_144_1 = Object.Instantiate(Asset.Load("Char/" .. var_144_0), arg_141_1.stage_.transform)

				var_144_1.name = var_144_0
				var_144_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_141_1.actors_[var_144_0] = var_144_1

				local var_144_2 = var_144_1:GetComponentInChildren(typeof(CharacterEffect))

				var_144_2.enabled = true

				local var_144_3 = GameObjectTools.GetOrAddComponent(var_144_1, typeof(DynamicBoneHelper))

				if var_144_3 then
					var_144_3:EnableDynamicBone(false)
				end

				arg_141_1:ShowWeapon(var_144_2.transform, false)

				arg_141_1.var_[var_144_0 .. "Animator"] = var_144_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_141_1.var_[var_144_0 .. "Animator"].applyRootMotion = true
				arg_141_1.var_[var_144_0 .. "LipSync"] = var_144_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_144_4 = arg_141_1.actors_["10068ui_story"].transform
			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1.var_.moveOldPos10068ui_story = var_144_4.localPosition
			end

			local var_144_6 = 0.001

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_6 then
				local var_144_7 = (arg_141_1.time_ - var_144_5) / var_144_6
				local var_144_8 = Vector3.New(0, -0.75, -6.18)

				var_144_4.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10068ui_story, var_144_8, var_144_7)

				local var_144_9 = manager.ui.mainCamera.transform.position - var_144_4.position

				var_144_4.forward = Vector3.New(var_144_9.x, var_144_9.y, var_144_9.z)

				local var_144_10 = var_144_4.localEulerAngles

				var_144_10.z = 0
				var_144_10.x = 0
				var_144_4.localEulerAngles = var_144_10
			end

			if arg_141_1.time_ >= var_144_5 + var_144_6 and arg_141_1.time_ < var_144_5 + var_144_6 + arg_144_0 then
				var_144_4.localPosition = Vector3.New(0, -0.75, -6.18)

				local var_144_11 = manager.ui.mainCamera.transform.position - var_144_4.position

				var_144_4.forward = Vector3.New(var_144_11.x, var_144_11.y, var_144_11.z)

				local var_144_12 = var_144_4.localEulerAngles

				var_144_12.z = 0
				var_144_12.x = 0
				var_144_4.localEulerAngles = var_144_12
			end

			local var_144_13 = arg_141_1.actors_["10068ui_story"]
			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 and arg_141_1.var_.characterEffect10068ui_story == nil then
				arg_141_1.var_.characterEffect10068ui_story = var_144_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_15 = 0.200000002980232

			if var_144_14 <= arg_141_1.time_ and arg_141_1.time_ < var_144_14 + var_144_15 then
				local var_144_16 = (arg_141_1.time_ - var_144_14) / var_144_15

				if arg_141_1.var_.characterEffect10068ui_story then
					arg_141_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_14 + var_144_15 and arg_141_1.time_ < var_144_14 + var_144_15 + arg_144_0 and arg_141_1.var_.characterEffect10068ui_story then
				arg_141_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_144_17 = 0

			if var_144_17 < arg_141_1.time_ and arg_141_1.time_ <= var_144_17 + arg_144_0 then
				arg_141_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action1_1")
			end

			local var_144_18 = 0

			if var_144_18 < arg_141_1.time_ and arg_141_1.time_ <= var_144_18 + arg_144_0 then
				arg_141_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_144_19 = 0
			local var_144_20 = 0.35

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_21 = arg_141_1:FormatText(StoryNameCfg[697].name)

				arg_141_1.leftNameTxt_.text = var_144_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_22 = arg_141_1:GetWordFromCfg(319511035)
				local var_144_23 = arg_141_1:FormatText(var_144_22.content)

				arg_141_1.text_.text = var_144_23

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_24 = 14
				local var_144_25 = utf8.len(var_144_23)
				local var_144_26 = var_144_24 <= 0 and var_144_20 or var_144_20 * (var_144_25 / var_144_24)

				if var_144_26 > 0 and var_144_20 < var_144_26 then
					arg_141_1.talkMaxDuration = var_144_26

					if var_144_26 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_26 + var_144_19
					end
				end

				arg_141_1.text_.text = var_144_23
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511035", "story_v_out_319511.awb") ~= 0 then
					local var_144_27 = manager.audio:GetVoiceLength("story_v_out_319511", "319511035", "story_v_out_319511.awb") / 1000

					if var_144_27 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_27 + var_144_19
					end

					if var_144_22.prefab_name ~= "" and arg_141_1.actors_[var_144_22.prefab_name] ~= nil then
						local var_144_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_22.prefab_name].transform, "story_v_out_319511", "319511035", "story_v_out_319511.awb")

						arg_141_1:RecordAudio("319511035", var_144_28)
						arg_141_1:RecordAudio("319511035", var_144_28)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319511", "319511035", "story_v_out_319511.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319511", "319511035", "story_v_out_319511.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_29 = math.max(var_144_20, arg_141_1.talkMaxDuration)

			if var_144_19 <= arg_141_1.time_ and arg_141_1.time_ < var_144_19 + var_144_29 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_19) / var_144_29

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_19 + var_144_29 and arg_141_1.time_ < var_144_19 + var_144_29 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319511036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319511036
		arg_145_1.duration_ = 4.233

		local var_145_0 = {
			zh = 2.366,
			ja = 4.233
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319511037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_148_1 = 0
			local var_148_2 = 0.575

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_3 = arg_145_1:FormatText(StoryNameCfg[697].name)

				arg_145_1.leftNameTxt_.text = var_148_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_4 = arg_145_1:GetWordFromCfg(319511036)
				local var_148_5 = arg_145_1:FormatText(var_148_4.content)

				arg_145_1.text_.text = var_148_5

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_6 = 23
				local var_148_7 = utf8.len(var_148_5)
				local var_148_8 = var_148_6 <= 0 and var_148_2 or var_148_2 * (var_148_7 / var_148_6)

				if var_148_8 > 0 and var_148_2 < var_148_8 then
					arg_145_1.talkMaxDuration = var_148_8

					if var_148_8 + var_148_1 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_1
					end
				end

				arg_145_1.text_.text = var_148_5
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511036", "story_v_out_319511.awb") ~= 0 then
					local var_148_9 = manager.audio:GetVoiceLength("story_v_out_319511", "319511036", "story_v_out_319511.awb") / 1000

					if var_148_9 + var_148_1 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_9 + var_148_1
					end

					if var_148_4.prefab_name ~= "" and arg_145_1.actors_[var_148_4.prefab_name] ~= nil then
						local var_148_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_4.prefab_name].transform, "story_v_out_319511", "319511036", "story_v_out_319511.awb")

						arg_145_1:RecordAudio("319511036", var_148_10)
						arg_145_1:RecordAudio("319511036", var_148_10)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319511", "319511036", "story_v_out_319511.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319511", "319511036", "story_v_out_319511.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_11 = math.max(var_148_2, arg_145_1.talkMaxDuration)

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_11 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_1) / var_148_11

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_1 + var_148_11 and arg_145_1.time_ < var_148_1 + var_148_11 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319511037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319511037
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play319511038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10068ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect10068ui_story == nil then
				arg_149_1.var_.characterEffect10068ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect10068ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_149_1.var_.characterEffect10068ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect10068ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_149_1.var_.characterEffect10068ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 0.7

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_8 = arg_149_1:FormatText(StoryNameCfg[698].name)

				arg_149_1.leftNameTxt_.text = var_152_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_9 = arg_149_1:GetWordFromCfg(319511037)
				local var_152_10 = arg_149_1:FormatText(var_152_9.content)

				arg_149_1.text_.text = var_152_10

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_11 = 28
				local var_152_12 = utf8.len(var_152_10)
				local var_152_13 = var_152_11 <= 0 and var_152_7 or var_152_7 * (var_152_12 / var_152_11)

				if var_152_13 > 0 and var_152_7 < var_152_13 then
					arg_149_1.talkMaxDuration = var_152_13

					if var_152_13 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_13 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_10
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_14 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_14 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_14

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_14 and arg_149_1.time_ < var_152_6 + var_152_14 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319511038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319511038
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play319511039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1.45

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_2 = arg_153_1:GetWordFromCfg(319511038)
				local var_156_3 = arg_153_1:FormatText(var_156_2.content)

				arg_153_1.text_.text = var_156_3

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_4 = 58
				local var_156_5 = utf8.len(var_156_3)
				local var_156_6 = var_156_4 <= 0 and var_156_1 or var_156_1 * (var_156_5 / var_156_4)

				if var_156_6 > 0 and var_156_1 < var_156_6 then
					arg_153_1.talkMaxDuration = var_156_6

					if var_156_6 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_6 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_3
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_7 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_7 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_7

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_7 and arg_153_1.time_ < var_156_0 + var_156_7 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319511039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319511039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319511040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.8

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[698].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(319511039)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 32
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_8 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_8 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_8

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_8 and arg_157_1.time_ < var_160_0 + var_160_8 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319511040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319511040
		arg_161_1.duration_ = 8.266

		local var_161_0 = {
			zh = 5.3,
			ja = 8.266
		}
		local var_161_1 = manager.audio:GetLocalizationFlag()

		if var_161_0[var_161_1] ~= nil then
			arg_161_1.duration_ = var_161_0[var_161_1]
		end

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319511041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10068ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos10068ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, -0.75, -6.18)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10068ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -0.75, -6.18)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["10068ui_story"]
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect10068ui_story == nil then
				arg_161_1.var_.characterEffect10068ui_story = var_164_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_11 = 0.200000002980232

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11

				if arg_161_1.var_.characterEffect10068ui_story then
					arg_161_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 and arg_161_1.var_.characterEffect10068ui_story then
				arg_161_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_164_13 = 0

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action1_1")
			end

			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_164_15 = 0
			local var_164_16 = 0.8

			if var_164_15 < arg_161_1.time_ and arg_161_1.time_ <= var_164_15 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_17 = arg_161_1:FormatText(StoryNameCfg[697].name)

				arg_161_1.leftNameTxt_.text = var_164_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_18 = arg_161_1:GetWordFromCfg(319511040)
				local var_164_19 = arg_161_1:FormatText(var_164_18.content)

				arg_161_1.text_.text = var_164_19

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_20 = 32
				local var_164_21 = utf8.len(var_164_19)
				local var_164_22 = var_164_20 <= 0 and var_164_16 or var_164_16 * (var_164_21 / var_164_20)

				if var_164_22 > 0 and var_164_16 < var_164_22 then
					arg_161_1.talkMaxDuration = var_164_22

					if var_164_22 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_22 + var_164_15
					end
				end

				arg_161_1.text_.text = var_164_19
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511040", "story_v_out_319511.awb") ~= 0 then
					local var_164_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511040", "story_v_out_319511.awb") / 1000

					if var_164_23 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_23 + var_164_15
					end

					if var_164_18.prefab_name ~= "" and arg_161_1.actors_[var_164_18.prefab_name] ~= nil then
						local var_164_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_18.prefab_name].transform, "story_v_out_319511", "319511040", "story_v_out_319511.awb")

						arg_161_1:RecordAudio("319511040", var_164_24)
						arg_161_1:RecordAudio("319511040", var_164_24)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_319511", "319511040", "story_v_out_319511.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_319511", "319511040", "story_v_out_319511.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_25 = math.max(var_164_16, arg_161_1.talkMaxDuration)

			if var_164_15 <= arg_161_1.time_ and arg_161_1.time_ < var_164_15 + var_164_25 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_15) / var_164_25

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_15 + var_164_25 and arg_161_1.time_ < var_164_15 + var_164_25 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319511041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319511041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play319511042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10068ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect10068ui_story == nil then
				arg_165_1.var_.characterEffect10068ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect10068ui_story then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_165_1.var_.characterEffect10068ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect10068ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_165_1.var_.characterEffect10068ui_story.fillRatio = var_168_5
			end

			local var_168_6 = 0
			local var_168_7 = 0.1

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_8 = arg_165_1:FormatText(StoryNameCfg[698].name)

				arg_165_1.leftNameTxt_.text = var_168_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_9 = arg_165_1:GetWordFromCfg(319511041)
				local var_168_10 = arg_165_1:FormatText(var_168_9.content)

				arg_165_1.text_.text = var_168_10

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_11 = 4
				local var_168_12 = utf8.len(var_168_10)
				local var_168_13 = var_168_11 <= 0 and var_168_7 or var_168_7 * (var_168_12 / var_168_11)

				if var_168_13 > 0 and var_168_7 < var_168_13 then
					arg_165_1.talkMaxDuration = var_168_13

					if var_168_13 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_10
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_14 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_14 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_14

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_14 and arg_165_1.time_ < var_168_6 + var_168_14 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319511042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319511042
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play319511043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 1.125

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_2 = arg_169_1:GetWordFromCfg(319511042)
				local var_172_3 = arg_169_1:FormatText(var_172_2.content)

				arg_169_1.text_.text = var_172_3

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_4 = 45
				local var_172_5 = utf8.len(var_172_3)
				local var_172_6 = var_172_4 <= 0 and var_172_1 or var_172_1 * (var_172_5 / var_172_4)

				if var_172_6 > 0 and var_172_1 < var_172_6 then
					arg_169_1.talkMaxDuration = var_172_6

					if var_172_6 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_6 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_3
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_7 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_7 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_7

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_7 and arg_169_1.time_ < var_172_0 + var_172_7 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319511043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319511043
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play319511044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.275

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[698].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(319511043)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 11
				local var_176_6 = utf8.len(var_176_4)
				local var_176_7 = var_176_5 <= 0 and var_176_1 or var_176_1 * (var_176_6 / var_176_5)

				if var_176_7 > 0 and var_176_1 < var_176_7 then
					arg_173_1.talkMaxDuration = var_176_7

					if var_176_7 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_7 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_4
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_8 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_8 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_8

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_8 and arg_173_1.time_ < var_176_0 + var_176_8 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319511044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319511044
		arg_177_1.duration_ = 6.333

		local var_177_0 = {
			zh = 4.533,
			ja = 6.333
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play319511045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10068ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect10068ui_story == nil then
				arg_177_1.var_.characterEffect10068ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect10068ui_story then
					arg_177_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect10068ui_story then
				arg_177_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_180_4 = 0

			if var_180_4 < arg_177_1.time_ and arg_177_1.time_ <= var_180_4 + arg_180_0 then
				arg_177_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_180_5 = 0
			local var_180_6 = 0.425

			if var_180_5 < arg_177_1.time_ and arg_177_1.time_ <= var_180_5 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_7 = arg_177_1:FormatText(StoryNameCfg[697].name)

				arg_177_1.leftNameTxt_.text = var_180_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_8 = arg_177_1:GetWordFromCfg(319511044)
				local var_180_9 = arg_177_1:FormatText(var_180_8.content)

				arg_177_1.text_.text = var_180_9

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_10 = 17
				local var_180_11 = utf8.len(var_180_9)
				local var_180_12 = var_180_10 <= 0 and var_180_6 or var_180_6 * (var_180_11 / var_180_10)

				if var_180_12 > 0 and var_180_6 < var_180_12 then
					arg_177_1.talkMaxDuration = var_180_12

					if var_180_12 + var_180_5 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_12 + var_180_5
					end
				end

				arg_177_1.text_.text = var_180_9
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511044", "story_v_out_319511.awb") ~= 0 then
					local var_180_13 = manager.audio:GetVoiceLength("story_v_out_319511", "319511044", "story_v_out_319511.awb") / 1000

					if var_180_13 + var_180_5 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_13 + var_180_5
					end

					if var_180_8.prefab_name ~= "" and arg_177_1.actors_[var_180_8.prefab_name] ~= nil then
						local var_180_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_8.prefab_name].transform, "story_v_out_319511", "319511044", "story_v_out_319511.awb")

						arg_177_1:RecordAudio("319511044", var_180_14)
						arg_177_1:RecordAudio("319511044", var_180_14)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319511", "319511044", "story_v_out_319511.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319511", "319511044", "story_v_out_319511.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_15 = math.max(var_180_6, arg_177_1.talkMaxDuration)

			if var_180_5 <= arg_177_1.time_ and arg_177_1.time_ < var_180_5 + var_180_15 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_5) / var_180_15

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_5 + var_180_15 and arg_177_1.time_ < var_180_5 + var_180_15 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319511045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319511045
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319511046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10068ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect10068ui_story == nil then
				arg_181_1.var_.characterEffect10068ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect10068ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_181_1.var_.characterEffect10068ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect10068ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_181_1.var_.characterEffect10068ui_story.fillRatio = var_184_5
			end

			local var_184_6 = 0
			local var_184_7 = 1.225

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_8 = arg_181_1:GetWordFromCfg(319511045)
				local var_184_9 = arg_181_1:FormatText(var_184_8.content)

				arg_181_1.text_.text = var_184_9

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_10 = 49
				local var_184_11 = utf8.len(var_184_9)
				local var_184_12 = var_184_10 <= 0 and var_184_7 or var_184_7 * (var_184_11 / var_184_10)

				if var_184_12 > 0 and var_184_7 < var_184_12 then
					arg_181_1.talkMaxDuration = var_184_12

					if var_184_12 + var_184_6 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_12 + var_184_6
					end
				end

				arg_181_1.text_.text = var_184_9
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_13 = math.max(var_184_7, arg_181_1.talkMaxDuration)

			if var_184_6 <= arg_181_1.time_ and arg_181_1.time_ < var_184_6 + var_184_13 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_6) / var_184_13

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_6 + var_184_13 and arg_181_1.time_ < var_184_6 + var_184_13 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319511046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319511046
		arg_185_1.duration_ = 8.633

		local var_185_0 = {
			zh = 8.633,
			ja = 8.3
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play319511047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10068ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos10068ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0, -0.75, -6.18)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos10068ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -0.75, -6.18)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["10068ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect10068ui_story == nil then
				arg_185_1.var_.characterEffect10068ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect10068ui_story then
					arg_185_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect10068ui_story then
				arg_185_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action1_1")
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_188_15 = 0
			local var_188_16 = 0.75

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_17 = arg_185_1:FormatText(StoryNameCfg[697].name)

				arg_185_1.leftNameTxt_.text = var_188_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_18 = arg_185_1:GetWordFromCfg(319511046)
				local var_188_19 = arg_185_1:FormatText(var_188_18.content)

				arg_185_1.text_.text = var_188_19

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_20 = 30
				local var_188_21 = utf8.len(var_188_19)
				local var_188_22 = var_188_20 <= 0 and var_188_16 or var_188_16 * (var_188_21 / var_188_20)

				if var_188_22 > 0 and var_188_16 < var_188_22 then
					arg_185_1.talkMaxDuration = var_188_22

					if var_188_22 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_22 + var_188_15
					end
				end

				arg_185_1.text_.text = var_188_19
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511046", "story_v_out_319511.awb") ~= 0 then
					local var_188_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511046", "story_v_out_319511.awb") / 1000

					if var_188_23 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_23 + var_188_15
					end

					if var_188_18.prefab_name ~= "" and arg_185_1.actors_[var_188_18.prefab_name] ~= nil then
						local var_188_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_18.prefab_name].transform, "story_v_out_319511", "319511046", "story_v_out_319511.awb")

						arg_185_1:RecordAudio("319511046", var_188_24)
						arg_185_1:RecordAudio("319511046", var_188_24)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319511", "319511046", "story_v_out_319511.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319511", "319511046", "story_v_out_319511.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_25 = math.max(var_188_16, arg_185_1.talkMaxDuration)

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_25 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_15) / var_188_25

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_15 + var_188_25 and arg_185_1.time_ < var_188_15 + var_188_25 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319511047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319511047
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play319511048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10068ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect10068ui_story == nil then
				arg_189_1.var_.characterEffect10068ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect10068ui_story then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_189_1.var_.characterEffect10068ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect10068ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_189_1.var_.characterEffect10068ui_story.fillRatio = var_192_5
			end

			local var_192_6 = 0
			local var_192_7 = 0.5

			if var_192_6 < arg_189_1.time_ and arg_189_1.time_ <= var_192_6 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_8 = arg_189_1:FormatText(StoryNameCfg[698].name)

				arg_189_1.leftNameTxt_.text = var_192_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_9 = arg_189_1:GetWordFromCfg(319511047)
				local var_192_10 = arg_189_1:FormatText(var_192_9.content)

				arg_189_1.text_.text = var_192_10

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_11 = 20
				local var_192_12 = utf8.len(var_192_10)
				local var_192_13 = var_192_11 <= 0 and var_192_7 or var_192_7 * (var_192_12 / var_192_11)

				if var_192_13 > 0 and var_192_7 < var_192_13 then
					arg_189_1.talkMaxDuration = var_192_13

					if var_192_13 + var_192_6 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_13 + var_192_6
					end
				end

				arg_189_1.text_.text = var_192_10
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_14 = math.max(var_192_7, arg_189_1.talkMaxDuration)

			if var_192_6 <= arg_189_1.time_ and arg_189_1.time_ < var_192_6 + var_192_14 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_6) / var_192_14

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_6 + var_192_14 and arg_189_1.time_ < var_192_6 + var_192_14 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319511048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319511048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play319511049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10068ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos10068ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, 100, 0)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos10068ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, 100, 0)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["10068ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect10068ui_story == nil then
				arg_193_1.var_.characterEffect10068ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect10068ui_story then
					local var_196_13 = Mathf.Lerp(0, 0.5, var_196_12)

					arg_193_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_193_1.var_.characterEffect10068ui_story.fillRatio = var_196_13
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect10068ui_story then
				local var_196_14 = 0.5

				arg_193_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_193_1.var_.characterEffect10068ui_story.fillRatio = var_196_14
			end

			local var_196_15 = 0
			local var_196_16 = 0.825

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_17 = arg_193_1:GetWordFromCfg(319511048)
				local var_196_18 = arg_193_1:FormatText(var_196_17.content)

				arg_193_1.text_.text = var_196_18

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_19 = 33
				local var_196_20 = utf8.len(var_196_18)
				local var_196_21 = var_196_19 <= 0 and var_196_16 or var_196_16 * (var_196_20 / var_196_19)

				if var_196_21 > 0 and var_196_16 < var_196_21 then
					arg_193_1.talkMaxDuration = var_196_21

					if var_196_21 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_21 + var_196_15
					end
				end

				arg_193_1.text_.text = var_196_18
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_22 = math.max(var_196_16, arg_193_1.talkMaxDuration)

			if var_196_15 <= arg_193_1.time_ and arg_193_1.time_ < var_196_15 + var_196_22 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_15) / var_196_22

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_15 + var_196_22 and arg_193_1.time_ < var_196_15 + var_196_22 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319511049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319511049
		arg_197_1.duration_ = 6.666

		local var_197_0 = {
			zh = 3.6,
			ja = 6.666
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play319511050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10069ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos10069ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, -1.08, -6.33)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos10069ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, -1.08, -6.33)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["10069ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect10069ui_story == nil then
				arg_197_1.var_.characterEffect10069ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect10069ui_story then
					arg_197_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect10069ui_story then
				arg_197_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_200_13 = 0

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action1_1")
			end

			local var_200_14 = 0

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 then
				arg_197_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_200_15 = 0
			local var_200_16 = 0.375

			if var_200_15 < arg_197_1.time_ and arg_197_1.time_ <= var_200_15 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_17 = arg_197_1:FormatText(StoryNameCfg[693].name)

				arg_197_1.leftNameTxt_.text = var_200_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_18 = arg_197_1:GetWordFromCfg(319511049)
				local var_200_19 = arg_197_1:FormatText(var_200_18.content)

				arg_197_1.text_.text = var_200_19

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_20 = 15
				local var_200_21 = utf8.len(var_200_19)
				local var_200_22 = var_200_20 <= 0 and var_200_16 or var_200_16 * (var_200_21 / var_200_20)

				if var_200_22 > 0 and var_200_16 < var_200_22 then
					arg_197_1.talkMaxDuration = var_200_22

					if var_200_22 + var_200_15 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_22 + var_200_15
					end
				end

				arg_197_1.text_.text = var_200_19
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511049", "story_v_out_319511.awb") ~= 0 then
					local var_200_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511049", "story_v_out_319511.awb") / 1000

					if var_200_23 + var_200_15 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_23 + var_200_15
					end

					if var_200_18.prefab_name ~= "" and arg_197_1.actors_[var_200_18.prefab_name] ~= nil then
						local var_200_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_18.prefab_name].transform, "story_v_out_319511", "319511049", "story_v_out_319511.awb")

						arg_197_1:RecordAudio("319511049", var_200_24)
						arg_197_1:RecordAudio("319511049", var_200_24)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319511", "319511049", "story_v_out_319511.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319511", "319511049", "story_v_out_319511.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_25 = math.max(var_200_16, arg_197_1.talkMaxDuration)

			if var_200_15 <= arg_197_1.time_ and arg_197_1.time_ < var_200_15 + var_200_25 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_15) / var_200_25

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_15 + var_200_25 and arg_197_1.time_ < var_200_15 + var_200_25 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319511050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319511050
		arg_201_1.duration_ = 2.866

		local var_201_0 = {
			zh = 2.866,
			ja = 2.6
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play319511051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10069ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect10069ui_story == nil then
				arg_201_1.var_.characterEffect10069ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect10069ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_201_1.var_.characterEffect10069ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect10069ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_201_1.var_.characterEffect10069ui_story.fillRatio = var_204_5
			end

			local var_204_6 = 0
			local var_204_7 = 0.15

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_8 = arg_201_1:FormatText(StoryNameCfg[692].name)

				arg_201_1.leftNameTxt_.text = var_204_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_9 = arg_201_1:GetWordFromCfg(319511050)
				local var_204_10 = arg_201_1:FormatText(var_204_9.content)

				arg_201_1.text_.text = var_204_10

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_11 = 6
				local var_204_12 = utf8.len(var_204_10)
				local var_204_13 = var_204_11 <= 0 and var_204_7 or var_204_7 * (var_204_12 / var_204_11)

				if var_204_13 > 0 and var_204_7 < var_204_13 then
					arg_201_1.talkMaxDuration = var_204_13

					if var_204_13 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_13 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_10
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511050", "story_v_out_319511.awb") ~= 0 then
					local var_204_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511050", "story_v_out_319511.awb") / 1000

					if var_204_14 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_14 + var_204_6
					end

					if var_204_9.prefab_name ~= "" and arg_201_1.actors_[var_204_9.prefab_name] ~= nil then
						local var_204_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_9.prefab_name].transform, "story_v_out_319511", "319511050", "story_v_out_319511.awb")

						arg_201_1:RecordAudio("319511050", var_204_15)
						arg_201_1:RecordAudio("319511050", var_204_15)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319511", "319511050", "story_v_out_319511.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319511", "319511050", "story_v_out_319511.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_16 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_16 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_16

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_16 and arg_201_1.time_ < var_204_6 + var_204_16 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319511051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319511051
		arg_205_1.duration_ = 3.566

		local var_205_0 = {
			zh = 3.166,
			ja = 3.566
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play319511052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10069ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect10069ui_story == nil then
				arg_205_1.var_.characterEffect10069ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect10069ui_story then
					arg_205_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect10069ui_story then
				arg_205_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_208_4 = 0
			local var_208_5 = 0.325

			if var_208_4 < arg_205_1.time_ and arg_205_1.time_ <= var_208_4 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_6 = arg_205_1:FormatText(StoryNameCfg[693].name)

				arg_205_1.leftNameTxt_.text = var_208_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_7 = arg_205_1:GetWordFromCfg(319511051)
				local var_208_8 = arg_205_1:FormatText(var_208_7.content)

				arg_205_1.text_.text = var_208_8

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_9 = 13
				local var_208_10 = utf8.len(var_208_8)
				local var_208_11 = var_208_9 <= 0 and var_208_5 or var_208_5 * (var_208_10 / var_208_9)

				if var_208_11 > 0 and var_208_5 < var_208_11 then
					arg_205_1.talkMaxDuration = var_208_11

					if var_208_11 + var_208_4 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_11 + var_208_4
					end
				end

				arg_205_1.text_.text = var_208_8
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511051", "story_v_out_319511.awb") ~= 0 then
					local var_208_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511051", "story_v_out_319511.awb") / 1000

					if var_208_12 + var_208_4 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_12 + var_208_4
					end

					if var_208_7.prefab_name ~= "" and arg_205_1.actors_[var_208_7.prefab_name] ~= nil then
						local var_208_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_7.prefab_name].transform, "story_v_out_319511", "319511051", "story_v_out_319511.awb")

						arg_205_1:RecordAudio("319511051", var_208_13)
						arg_205_1:RecordAudio("319511051", var_208_13)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319511", "319511051", "story_v_out_319511.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319511", "319511051", "story_v_out_319511.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_14 = math.max(var_208_5, arg_205_1.talkMaxDuration)

			if var_208_4 <= arg_205_1.time_ and arg_205_1.time_ < var_208_4 + var_208_14 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_4) / var_208_14

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_4 + var_208_14 and arg_205_1.time_ < var_208_4 + var_208_14 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319511052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319511052
		arg_209_1.duration_ = 8.8

		local var_209_0 = {
			zh = 4.2,
			ja = 8.8
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play319511053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10069ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect10069ui_story == nil then
				arg_209_1.var_.characterEffect10069ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect10069ui_story then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_209_1.var_.characterEffect10069ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect10069ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_209_1.var_.characterEffect10069ui_story.fillRatio = var_212_5
			end

			local var_212_6 = 0
			local var_212_7 = 0.3

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_8 = arg_209_1:FormatText(StoryNameCfg[692].name)

				arg_209_1.leftNameTxt_.text = var_212_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, true)
				arg_209_1.iconController_:SetSelectedState("hero")

				arg_209_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_9 = arg_209_1:GetWordFromCfg(319511052)
				local var_212_10 = arg_209_1:FormatText(var_212_9.content)

				arg_209_1.text_.text = var_212_10

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_11 = 12
				local var_212_12 = utf8.len(var_212_10)
				local var_212_13 = var_212_11 <= 0 and var_212_7 or var_212_7 * (var_212_12 / var_212_11)

				if var_212_13 > 0 and var_212_7 < var_212_13 then
					arg_209_1.talkMaxDuration = var_212_13

					if var_212_13 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_13 + var_212_6
					end
				end

				arg_209_1.text_.text = var_212_10
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511052", "story_v_out_319511.awb") ~= 0 then
					local var_212_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511052", "story_v_out_319511.awb") / 1000

					if var_212_14 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_14 + var_212_6
					end

					if var_212_9.prefab_name ~= "" and arg_209_1.actors_[var_212_9.prefab_name] ~= nil then
						local var_212_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_9.prefab_name].transform, "story_v_out_319511", "319511052", "story_v_out_319511.awb")

						arg_209_1:RecordAudio("319511052", var_212_15)
						arg_209_1:RecordAudio("319511052", var_212_15)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_319511", "319511052", "story_v_out_319511.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_319511", "319511052", "story_v_out_319511.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_16 = math.max(var_212_7, arg_209_1.talkMaxDuration)

			if var_212_6 <= arg_209_1.time_ and arg_209_1.time_ < var_212_6 + var_212_16 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_6) / var_212_16

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_6 + var_212_16 and arg_209_1.time_ < var_212_6 + var_212_16 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319511053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319511053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319511054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10069ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos10069ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10069ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["10069ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect10069ui_story == nil then
				arg_213_1.var_.characterEffect10069ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect10069ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_213_1.var_.characterEffect10069ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect10069ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_213_1.var_.characterEffect10069ui_story.fillRatio = var_216_14
			end

			local var_216_15 = 0
			local var_216_16 = 0.725

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_17 = arg_213_1:GetWordFromCfg(319511053)
				local var_216_18 = arg_213_1:FormatText(var_216_17.content)

				arg_213_1.text_.text = var_216_18

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_19 = 29
				local var_216_20 = utf8.len(var_216_18)
				local var_216_21 = var_216_19 <= 0 and var_216_16 or var_216_16 * (var_216_20 / var_216_19)

				if var_216_21 > 0 and var_216_16 < var_216_21 then
					arg_213_1.talkMaxDuration = var_216_21

					if var_216_21 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_21 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_18
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_22 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_22 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_22

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_22 and arg_213_1.time_ < var_216_15 + var_216_22 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319511054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319511054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play319511055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1.125

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(319511054)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 45
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_7 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_7 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_7

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_7 and arg_217_1.time_ < var_220_0 + var_220_7 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319511055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319511055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play319511056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 1.225

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_2 = arg_221_1:GetWordFromCfg(319511055)
				local var_224_3 = arg_221_1:FormatText(var_224_2.content)

				arg_221_1.text_.text = var_224_3

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_4 = 49
				local var_224_5 = utf8.len(var_224_3)
				local var_224_6 = var_224_4 <= 0 and var_224_1 or var_224_1 * (var_224_5 / var_224_4)

				if var_224_6 > 0 and var_224_1 < var_224_6 then
					arg_221_1.talkMaxDuration = var_224_6

					if var_224_6 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_6 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_3
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_7 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_7 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_7

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_7 and arg_221_1.time_ < var_224_0 + var_224_7 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play319511056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319511056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play319511057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.3

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_2 = arg_225_1:GetWordFromCfg(319511056)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 12
				local var_228_5 = utf8.len(var_228_3)
				local var_228_6 = var_228_4 <= 0 and var_228_1 or var_228_1 * (var_228_5 / var_228_4)

				if var_228_6 > 0 and var_228_1 < var_228_6 then
					arg_225_1.talkMaxDuration = var_228_6

					if var_228_6 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_6 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_3
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_7 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_7 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_7

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_7 and arg_225_1.time_ < var_228_0 + var_228_7 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319511057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319511057
		arg_229_1.duration_ = 3.266

		local var_229_0 = {
			zh = 2.2,
			ja = 3.266
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play319511058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1084ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1084ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, -0.97, -6)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1084ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["1084ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect1084ui_story == nil then
				arg_229_1.var_.characterEffect1084ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect1084ui_story then
					arg_229_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect1084ui_story then
				arg_229_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_232_13 = 0

			if var_232_13 < arg_229_1.time_ and arg_229_1.time_ <= var_232_13 + arg_232_0 then
				arg_229_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 then
				arg_229_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_232_15 = 0
			local var_232_16 = 0.9

			if var_232_15 < arg_229_1.time_ and arg_229_1.time_ <= var_232_15 + arg_232_0 then
				local var_232_17 = "play"
				local var_232_18 = "music"

				arg_229_1:AudioAction(var_232_17, var_232_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_232_19 = 0
			local var_232_20 = 0.25

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_21 = arg_229_1:FormatText(StoryNameCfg[6].name)

				arg_229_1.leftNameTxt_.text = var_232_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_22 = arg_229_1:GetWordFromCfg(319511057)
				local var_232_23 = arg_229_1:FormatText(var_232_22.content)

				arg_229_1.text_.text = var_232_23

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_24 = 10
				local var_232_25 = utf8.len(var_232_23)
				local var_232_26 = var_232_24 <= 0 and var_232_20 or var_232_20 * (var_232_25 / var_232_24)

				if var_232_26 > 0 and var_232_20 < var_232_26 then
					arg_229_1.talkMaxDuration = var_232_26

					if var_232_26 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_26 + var_232_19
					end
				end

				arg_229_1.text_.text = var_232_23
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511057", "story_v_out_319511.awb") ~= 0 then
					local var_232_27 = manager.audio:GetVoiceLength("story_v_out_319511", "319511057", "story_v_out_319511.awb") / 1000

					if var_232_27 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_27 + var_232_19
					end

					if var_232_22.prefab_name ~= "" and arg_229_1.actors_[var_232_22.prefab_name] ~= nil then
						local var_232_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_22.prefab_name].transform, "story_v_out_319511", "319511057", "story_v_out_319511.awb")

						arg_229_1:RecordAudio("319511057", var_232_28)
						arg_229_1:RecordAudio("319511057", var_232_28)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_319511", "319511057", "story_v_out_319511.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_319511", "319511057", "story_v_out_319511.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_29 = math.max(var_232_20, arg_229_1.talkMaxDuration)

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_29 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_19) / var_232_29

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_19 + var_232_29 and arg_229_1.time_ < var_232_19 + var_232_29 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319511058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319511058
		arg_233_1.duration_ = 70.958333333332

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play319511059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.mask_.enabled = true
				arg_233_1.mask_.raycastTarget = true

				arg_233_1:SetGaussion(false)
			end

			local var_236_1 = 2

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_1 then
				local var_236_2 = (arg_233_1.time_ - var_236_0) / var_236_1
				local var_236_3 = Color.New(0, 0, 0)

				var_236_3.a = Mathf.Lerp(0, 1, var_236_2)
				arg_233_1.mask_.color = var_236_3
			end

			if arg_233_1.time_ >= var_236_0 + var_236_1 and arg_233_1.time_ < var_236_0 + var_236_1 + arg_236_0 then
				local var_236_4 = Color.New(0, 0, 0)

				var_236_4.a = 1
				arg_233_1.mask_.color = var_236_4
			end

			local var_236_5 = 2

			if var_236_5 < arg_233_1.time_ and arg_233_1.time_ <= var_236_5 + arg_236_0 then
				arg_233_1.mask_.enabled = true
				arg_233_1.mask_.raycastTarget = true

				arg_233_1:SetGaussion(false)
			end

			local var_236_6 = 2

			if var_236_5 <= arg_233_1.time_ and arg_233_1.time_ < var_236_5 + var_236_6 then
				local var_236_7 = (arg_233_1.time_ - var_236_5) / var_236_6
				local var_236_8 = Color.New(0, 0, 0)

				var_236_8.a = Mathf.Lerp(1, 0, var_236_7)
				arg_233_1.mask_.color = var_236_8
			end

			if arg_233_1.time_ >= var_236_5 + var_236_6 and arg_233_1.time_ < var_236_5 + var_236_6 + arg_236_0 then
				local var_236_9 = Color.New(0, 0, 0)
				local var_236_10 = 0

				arg_233_1.mask_.enabled = false
				var_236_9.a = var_236_10
				arg_233_1.mask_.color = var_236_9
			end

			local var_236_11 = arg_233_1.actors_["1084ui_story"].transform
			local var_236_12 = 2

			if var_236_12 < arg_233_1.time_ and arg_233_1.time_ <= var_236_12 + arg_236_0 then
				arg_233_1.var_.moveOldPos1084ui_story = var_236_11.localPosition
			end

			local var_236_13 = 0.001

			if var_236_12 <= arg_233_1.time_ and arg_233_1.time_ < var_236_12 + var_236_13 then
				local var_236_14 = (arg_233_1.time_ - var_236_12) / var_236_13
				local var_236_15 = Vector3.New(0, 100, 0)

				var_236_11.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1084ui_story, var_236_15, var_236_14)

				local var_236_16 = manager.ui.mainCamera.transform.position - var_236_11.position

				var_236_11.forward = Vector3.New(var_236_16.x, var_236_16.y, var_236_16.z)

				local var_236_17 = var_236_11.localEulerAngles

				var_236_17.z = 0
				var_236_17.x = 0
				var_236_11.localEulerAngles = var_236_17
			end

			if arg_233_1.time_ >= var_236_12 + var_236_13 and arg_233_1.time_ < var_236_12 + var_236_13 + arg_236_0 then
				var_236_11.localPosition = Vector3.New(0, 100, 0)

				local var_236_18 = manager.ui.mainCamera.transform.position - var_236_11.position

				var_236_11.forward = Vector3.New(var_236_18.x, var_236_18.y, var_236_18.z)

				local var_236_19 = var_236_11.localEulerAngles

				var_236_19.z = 0
				var_236_19.x = 0
				var_236_11.localEulerAngles = var_236_19
			end

			local var_236_20 = arg_233_1.actors_["1084ui_story"]
			local var_236_21 = 2

			if var_236_21 < arg_233_1.time_ and arg_233_1.time_ <= var_236_21 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story == nil then
				arg_233_1.var_.characterEffect1084ui_story = var_236_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_22 = 0.2

			if var_236_21 <= arg_233_1.time_ and arg_233_1.time_ < var_236_21 + var_236_22 then
				local var_236_23 = (arg_233_1.time_ - var_236_21) / var_236_22

				if arg_233_1.var_.characterEffect1084ui_story then
					local var_236_24 = Mathf.Lerp(0, 0.5, var_236_23)

					arg_233_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1084ui_story.fillRatio = var_236_24
				end
			end

			if arg_233_1.time_ >= var_236_21 + var_236_22 and arg_233_1.time_ < var_236_21 + var_236_22 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story then
				local var_236_25 = 0.5

				arg_233_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1084ui_story.fillRatio = var_236_25
			end

			local var_236_26 = 2

			if var_236_26 < arg_233_1.time_ and arg_233_1.time_ <= var_236_26 + arg_236_0 then
				SetActive(arg_233_1.dialog_, false)
				SetActive(arg_233_1.allBtn_.gameObject, false)
				arg_233_1.hideBtnsController_:SetSelectedIndex(1)
				arg_233_1:StopAllVoice()

				arg_233_1.marker = "stop1"

				manager.video:Play("SofdecAsset/story/story_1031951.usm", function(arg_237_0)
					if arg_233_1.state_ == "playing" then
						arg_233_1:JumpToEnd()
					end

					if arg_233_1.playNext_ and not arg_233_1.auto_ then
						arg_233_1.playNext_(1)
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_238_0)
					if arg_238_0 then
						arg_233_1.state_ = "pause"
					else
						arg_233_1.state_ = "playing"
					end
				end, 1031951)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_236_27 = 68.9583333333333

			if var_236_26 <= arg_233_1.time_ and arg_233_1.time_ < var_236_26 + var_236_27 then
				-- block empty
			end

			if arg_233_1.time_ >= var_236_26 + var_236_27 and arg_233_1.time_ < var_236_26 + var_236_27 + arg_236_0 then
				arg_233_1.marker = ""
			end
		end
	end,
	Play319511059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319511059
		arg_239_1.duration_ = 5.9

		local var_239_0 = {
			zh = 4.433333333332,
			ja = 5.9
		}
		local var_239_1 = manager.audio:GetLocalizationFlag()

		if var_239_0[var_239_1] ~= nil then
			arg_239_1.duration_ = var_239_0[var_239_1]
		end

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play319511060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = "ST71"

			if arg_239_1.bgs_[var_242_0] == nil then
				local var_242_1 = Object.Instantiate(arg_239_1.paintGo_)

				var_242_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_242_0)
				var_242_1.name = var_242_0
				var_242_1.transform.parent = arg_239_1.stage_.transform
				var_242_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_239_1.bgs_[var_242_0] = var_242_1
			end

			local var_242_2 = 0

			if var_242_2 < arg_239_1.time_ and arg_239_1.time_ <= var_242_2 + arg_242_0 then
				local var_242_3 = manager.ui.mainCamera.transform.localPosition
				local var_242_4 = Vector3.New(0, 0, 10) + Vector3.New(var_242_3.x, var_242_3.y, 0)
				local var_242_5 = arg_239_1.bgs_.ST71

				var_242_5.transform.localPosition = var_242_4
				var_242_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_242_6 = var_242_5:GetComponent("SpriteRenderer")

				if var_242_6 and var_242_6.sprite then
					local var_242_7 = (var_242_5.transform.localPosition - var_242_3).z
					local var_242_8 = manager.ui.mainCameraCom_
					local var_242_9 = 2 * var_242_7 * Mathf.Tan(var_242_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_242_10 = var_242_9 * var_242_8.aspect
					local var_242_11 = var_242_6.sprite.bounds.size.x
					local var_242_12 = var_242_6.sprite.bounds.size.y
					local var_242_13 = var_242_10 / var_242_11
					local var_242_14 = var_242_9 / var_242_12
					local var_242_15 = var_242_14 < var_242_13 and var_242_13 or var_242_14

					var_242_5.transform.localScale = Vector3.New(var_242_15, var_242_15, 0)
				end

				for iter_242_0, iter_242_1 in pairs(arg_239_1.bgs_) do
					if iter_242_0 ~= "ST71" then
						iter_242_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.mask_.enabled = true
				arg_239_1.mask_.raycastTarget = true

				arg_239_1:SetGaussion(false)
			end

			local var_242_17 = 1.5

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_17 then
				local var_242_18 = (arg_239_1.time_ - var_242_16) / var_242_17
				local var_242_19 = Color.New(0, 0, 0)

				var_242_19.a = Mathf.Lerp(1, 0, var_242_18)
				arg_239_1.mask_.color = var_242_19
			end

			if arg_239_1.time_ >= var_242_16 + var_242_17 and arg_239_1.time_ < var_242_16 + var_242_17 + arg_242_0 then
				local var_242_20 = Color.New(0, 0, 0)
				local var_242_21 = 0

				arg_239_1.mask_.enabled = false
				var_242_20.a = var_242_21
				arg_239_1.mask_.color = var_242_20
			end

			local var_242_22 = "10050ui_story"

			if arg_239_1.actors_[var_242_22] == nil then
				local var_242_23 = Object.Instantiate(Asset.Load("Char/" .. var_242_22), arg_239_1.stage_.transform)

				var_242_23.name = var_242_22
				var_242_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_239_1.actors_[var_242_22] = var_242_23

				local var_242_24 = var_242_23:GetComponentInChildren(typeof(CharacterEffect))

				var_242_24.enabled = true

				local var_242_25 = GameObjectTools.GetOrAddComponent(var_242_23, typeof(DynamicBoneHelper))

				if var_242_25 then
					var_242_25:EnableDynamicBone(false)
				end

				arg_239_1:ShowWeapon(var_242_24.transform, false)

				arg_239_1.var_[var_242_22 .. "Animator"] = var_242_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_239_1.var_[var_242_22 .. "Animator"].applyRootMotion = true
				arg_239_1.var_[var_242_22 .. "LipSync"] = var_242_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_242_26 = arg_239_1.actors_["10050ui_story"].transform
			local var_242_27 = 1.5

			if var_242_27 < arg_239_1.time_ and arg_239_1.time_ <= var_242_27 + arg_242_0 then
				arg_239_1.var_.moveOldPos10050ui_story = var_242_26.localPosition
			end

			local var_242_28 = 0.001

			if var_242_27 <= arg_239_1.time_ and arg_239_1.time_ < var_242_27 + var_242_28 then
				local var_242_29 = (arg_239_1.time_ - var_242_27) / var_242_28
				local var_242_30 = Vector3.New(0, -0.715, -6.15)

				var_242_26.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10050ui_story, var_242_30, var_242_29)

				local var_242_31 = manager.ui.mainCamera.transform.position - var_242_26.position

				var_242_26.forward = Vector3.New(var_242_31.x, var_242_31.y, var_242_31.z)

				local var_242_32 = var_242_26.localEulerAngles

				var_242_32.z = 0
				var_242_32.x = 0
				var_242_26.localEulerAngles = var_242_32
			end

			if arg_239_1.time_ >= var_242_27 + var_242_28 and arg_239_1.time_ < var_242_27 + var_242_28 + arg_242_0 then
				var_242_26.localPosition = Vector3.New(0, -0.715, -6.15)

				local var_242_33 = manager.ui.mainCamera.transform.position - var_242_26.position

				var_242_26.forward = Vector3.New(var_242_33.x, var_242_33.y, var_242_33.z)

				local var_242_34 = var_242_26.localEulerAngles

				var_242_34.z = 0
				var_242_34.x = 0
				var_242_26.localEulerAngles = var_242_34
			end

			local var_242_35 = arg_239_1.actors_["10050ui_story"]
			local var_242_36 = 1.5

			if var_242_36 < arg_239_1.time_ and arg_239_1.time_ <= var_242_36 + arg_242_0 and arg_239_1.var_.characterEffect10050ui_story == nil then
				arg_239_1.var_.characterEffect10050ui_story = var_242_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_37 = 0.200000002980232

			if var_242_36 <= arg_239_1.time_ and arg_239_1.time_ < var_242_36 + var_242_37 then
				local var_242_38 = (arg_239_1.time_ - var_242_36) / var_242_37

				if arg_239_1.var_.characterEffect10050ui_story then
					arg_239_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_36 + var_242_37 and arg_239_1.time_ < var_242_36 + var_242_37 + arg_242_0 and arg_239_1.var_.characterEffect10050ui_story then
				arg_239_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_242_39 = 1.5

			if var_242_39 < arg_239_1.time_ and arg_239_1.time_ <= var_242_39 + arg_242_0 then
				arg_239_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action4_1")
			end

			local var_242_40 = 1.5

			if var_242_40 < arg_239_1.time_ and arg_239_1.time_ <= var_242_40 + arg_242_0 then
				arg_239_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_242_41 = 0.133333333333333
			local var_242_42 = 1

			if var_242_41 < arg_239_1.time_ and arg_239_1.time_ <= var_242_41 + arg_242_0 then
				local var_242_43 = "play"
				local var_242_44 = "music"

				arg_239_1:AudioAction(var_242_43, var_242_44, "bgm_activity_3_0_story_hospital_room", "bgm_activity_3_0_story_hospital_room", "bgm_activity_3_0_story_hospital_room.awb")
			end

			local var_242_45 = 0
			local var_242_46 = 0.0666666666666667

			if var_242_45 < arg_239_1.time_ and arg_239_1.time_ <= var_242_45 + arg_242_0 then
				local var_242_47 = "play"
				local var_242_48 = "music"

				arg_239_1:AudioAction(var_242_47, var_242_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_242_49 = 0

			if var_242_49 < arg_239_1.time_ and arg_239_1.time_ <= var_242_49 + arg_242_0 then
				SetActive(arg_239_1.dialog_, false)
				SetActive(arg_239_1.allBtn_.gameObject, true)
				arg_239_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_242_50 = 0.0333333333333333

			if var_242_49 <= arg_239_1.time_ and arg_239_1.time_ < var_242_49 + var_242_50 then
				-- block empty
			end

			if arg_239_1.time_ >= var_242_49 + var_242_50 and arg_239_1.time_ < var_242_49 + var_242_50 + arg_242_0 then
				arg_239_1.marker = ""
			end

			if arg_239_1.frameCnt_ <= 1 then
				arg_239_1.dialog_:SetActive(false)
			end

			local var_242_51 = 1.5
			local var_242_52 = 0.2

			if var_242_51 < arg_239_1.time_ and arg_239_1.time_ <= var_242_51 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_53 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_53:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_54 = arg_239_1:FormatText(StoryNameCfg[692].name)

				arg_239_1.leftNameTxt_.text = var_242_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_55 = arg_239_1:GetWordFromCfg(319511059)
				local var_242_56 = arg_239_1:FormatText(var_242_55.content)

				arg_239_1.text_.text = var_242_56

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_57 = 8
				local var_242_58 = utf8.len(var_242_56)
				local var_242_59 = var_242_57 <= 0 and var_242_52 or var_242_52 * (var_242_58 / var_242_57)

				if var_242_59 > 0 and var_242_52 < var_242_59 then
					arg_239_1.talkMaxDuration = var_242_59
					var_242_51 = var_242_51 + 0.3

					if var_242_59 + var_242_51 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_59 + var_242_51
					end
				end

				arg_239_1.text_.text = var_242_56
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511059", "story_v_out_319511.awb") ~= 0 then
					local var_242_60 = manager.audio:GetVoiceLength("story_v_out_319511", "319511059", "story_v_out_319511.awb") / 1000

					if var_242_60 + var_242_51 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_60 + var_242_51
					end

					if var_242_55.prefab_name ~= "" and arg_239_1.actors_[var_242_55.prefab_name] ~= nil then
						local var_242_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_55.prefab_name].transform, "story_v_out_319511", "319511059", "story_v_out_319511.awb")

						arg_239_1:RecordAudio("319511059", var_242_61)
						arg_239_1:RecordAudio("319511059", var_242_61)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_319511", "319511059", "story_v_out_319511.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_319511", "319511059", "story_v_out_319511.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_62 = var_242_51 + 0.3
			local var_242_63 = math.max(var_242_52, arg_239_1.talkMaxDuration)

			if var_242_62 <= arg_239_1.time_ and arg_239_1.time_ < var_242_62 + var_242_63 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_62) / var_242_63

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_62 + var_242_63 and arg_239_1.time_ < var_242_62 + var_242_63 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play319511060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319511060
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play319511061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10050ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect10050ui_story == nil then
				arg_245_1.var_.characterEffect10050ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect10050ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_245_1.var_.characterEffect10050ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect10050ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_245_1.var_.characterEffect10050ui_story.fillRatio = var_248_5
			end

			local var_248_6 = 0
			local var_248_7 = 0.925

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_8 = arg_245_1:GetWordFromCfg(319511060)
				local var_248_9 = arg_245_1:FormatText(var_248_8.content)

				arg_245_1.text_.text = var_248_9

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_10 = 37
				local var_248_11 = utf8.len(var_248_9)
				local var_248_12 = var_248_10 <= 0 and var_248_7 or var_248_7 * (var_248_11 / var_248_10)

				if var_248_12 > 0 and var_248_7 < var_248_12 then
					arg_245_1.talkMaxDuration = var_248_12

					if var_248_12 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_12 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_9
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_13 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_13 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_13

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_13 and arg_245_1.time_ < var_248_6 + var_248_13 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319511061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319511061
		arg_249_1.duration_ = 6.2

		local var_249_0 = {
			zh = 2.666,
			ja = 6.2
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play319511062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10050ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect10050ui_story == nil then
				arg_249_1.var_.characterEffect10050ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect10050ui_story then
					arg_249_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect10050ui_story then
				arg_249_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_252_4 = 0
			local var_252_5 = 0.225

			if var_252_4 < arg_249_1.time_ and arg_249_1.time_ <= var_252_4 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_6 = arg_249_1:FormatText(StoryNameCfg[692].name)

				arg_249_1.leftNameTxt_.text = var_252_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_7 = arg_249_1:GetWordFromCfg(319511061)
				local var_252_8 = arg_249_1:FormatText(var_252_7.content)

				arg_249_1.text_.text = var_252_8

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_9 = 9
				local var_252_10 = utf8.len(var_252_8)
				local var_252_11 = var_252_9 <= 0 and var_252_5 or var_252_5 * (var_252_10 / var_252_9)

				if var_252_11 > 0 and var_252_5 < var_252_11 then
					arg_249_1.talkMaxDuration = var_252_11

					if var_252_11 + var_252_4 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_11 + var_252_4
					end
				end

				arg_249_1.text_.text = var_252_8
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511061", "story_v_out_319511.awb") ~= 0 then
					local var_252_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511061", "story_v_out_319511.awb") / 1000

					if var_252_12 + var_252_4 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_12 + var_252_4
					end

					if var_252_7.prefab_name ~= "" and arg_249_1.actors_[var_252_7.prefab_name] ~= nil then
						local var_252_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_7.prefab_name].transform, "story_v_out_319511", "319511061", "story_v_out_319511.awb")

						arg_249_1:RecordAudio("319511061", var_252_13)
						arg_249_1:RecordAudio("319511061", var_252_13)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319511", "319511061", "story_v_out_319511.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319511", "319511061", "story_v_out_319511.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_14 = math.max(var_252_5, arg_249_1.talkMaxDuration)

			if var_252_4 <= arg_249_1.time_ and arg_249_1.time_ < var_252_4 + var_252_14 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_4) / var_252_14

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_4 + var_252_14 and arg_249_1.time_ < var_252_4 + var_252_14 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319511062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319511062
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play319511063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["10050ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect10050ui_story == nil then
				arg_253_1.var_.characterEffect10050ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect10050ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_253_1.var_.characterEffect10050ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect10050ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_253_1.var_.characterEffect10050ui_story.fillRatio = var_256_5
			end

			local var_256_6 = 0
			local var_256_7 = 0.425

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_8 = arg_253_1:FormatText(StoryNameCfg[698].name)

				arg_253_1.leftNameTxt_.text = var_256_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_9 = arg_253_1:GetWordFromCfg(319511062)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 17
				local var_256_12 = utf8.len(var_256_10)
				local var_256_13 = var_256_11 <= 0 and var_256_7 or var_256_7 * (var_256_12 / var_256_11)

				if var_256_13 > 0 and var_256_7 < var_256_13 then
					arg_253_1.talkMaxDuration = var_256_13

					if var_256_13 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_13 + var_256_6
					end
				end

				arg_253_1.text_.text = var_256_10
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_14 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_14 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_14

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_14 and arg_253_1.time_ < var_256_6 + var_256_14 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play319511063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319511063
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play319511064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.45

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[698].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, true)
				arg_257_1.iconController_:SetSelectedState("hero")

				arg_257_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(319511063)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 18
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_8 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_8 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_8

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_8 and arg_257_1.time_ < var_260_0 + var_260_8 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play319511064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 319511064
		arg_261_1.duration_ = 12.433

		local var_261_0 = {
			zh = 8.466,
			ja = 12.433
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play319511065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["10050ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos10050ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, -0.715, -6.15)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos10050ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, -0.715, -6.15)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = arg_261_1.actors_["10050ui_story"]
			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 and arg_261_1.var_.characterEffect10050ui_story == nil then
				arg_261_1.var_.characterEffect10050ui_story = var_264_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_11 = 0.200000002980232

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				local var_264_12 = (arg_261_1.time_ - var_264_10) / var_264_11

				if arg_261_1.var_.characterEffect10050ui_story then
					arg_261_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 and arg_261_1.var_.characterEffect10050ui_story then
				arg_261_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_264_13 = 0

			if var_264_13 < arg_261_1.time_ and arg_261_1.time_ <= var_264_13 + arg_264_0 then
				arg_261_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action4_2")
			end

			local var_264_14 = 0

			if var_264_14 < arg_261_1.time_ and arg_261_1.time_ <= var_264_14 + arg_264_0 then
				arg_261_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_264_15 = 0
			local var_264_16 = 1

			if var_264_15 < arg_261_1.time_ and arg_261_1.time_ <= var_264_15 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_17 = arg_261_1:FormatText(StoryNameCfg[692].name)

				arg_261_1.leftNameTxt_.text = var_264_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_18 = arg_261_1:GetWordFromCfg(319511064)
				local var_264_19 = arg_261_1:FormatText(var_264_18.content)

				arg_261_1.text_.text = var_264_19

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_20 = 40
				local var_264_21 = utf8.len(var_264_19)
				local var_264_22 = var_264_20 <= 0 and var_264_16 or var_264_16 * (var_264_21 / var_264_20)

				if var_264_22 > 0 and var_264_16 < var_264_22 then
					arg_261_1.talkMaxDuration = var_264_22

					if var_264_22 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_22 + var_264_15
					end
				end

				arg_261_1.text_.text = var_264_19
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511064", "story_v_out_319511.awb") ~= 0 then
					local var_264_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511064", "story_v_out_319511.awb") / 1000

					if var_264_23 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_23 + var_264_15
					end

					if var_264_18.prefab_name ~= "" and arg_261_1.actors_[var_264_18.prefab_name] ~= nil then
						local var_264_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_18.prefab_name].transform, "story_v_out_319511", "319511064", "story_v_out_319511.awb")

						arg_261_1:RecordAudio("319511064", var_264_24)
						arg_261_1:RecordAudio("319511064", var_264_24)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_319511", "319511064", "story_v_out_319511.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_319511", "319511064", "story_v_out_319511.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_25 = math.max(var_264_16, arg_261_1.talkMaxDuration)

			if var_264_15 <= arg_261_1.time_ and arg_261_1.time_ < var_264_15 + var_264_25 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_15) / var_264_25

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_15 + var_264_25 and arg_261_1.time_ < var_264_15 + var_264_25 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play319511065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 319511065
		arg_265_1.duration_ = 5.333

		local var_265_0 = {
			zh = 4.8,
			ja = 5.333
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play319511066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.55

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[692].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(319511065)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 22
				local var_268_6 = utf8.len(var_268_4)
				local var_268_7 = var_268_5 <= 0 and var_268_1 or var_268_1 * (var_268_6 / var_268_5)

				if var_268_7 > 0 and var_268_1 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_4
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511065", "story_v_out_319511.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511065", "story_v_out_319511.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_319511", "319511065", "story_v_out_319511.awb")

						arg_265_1:RecordAudio("319511065", var_268_9)
						arg_265_1:RecordAudio("319511065", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_319511", "319511065", "story_v_out_319511.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_319511", "319511065", "story_v_out_319511.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_10 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_10 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_10

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_10 and arg_265_1.time_ < var_268_0 + var_268_10 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play319511066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 319511066
		arg_269_1.duration_ = 4.566

		local var_269_0 = {
			zh = 3.3,
			ja = 4.566
		}
		local var_269_1 = manager.audio:GetLocalizationFlag()

		if var_269_0[var_269_1] ~= nil then
			arg_269_1.duration_ = var_269_0[var_269_1]
		end

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play319511067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10068ui_story"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos10068ui_story = var_272_0.localPosition
			end

			local var_272_2 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2
				local var_272_4 = Vector3.New(0.7, -0.75, -6.18)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos10068ui_story, var_272_4, var_272_3)

				local var_272_5 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_5.x, var_272_5.y, var_272_5.z)

				local var_272_6 = var_272_0.localEulerAngles

				var_272_6.z = 0
				var_272_6.x = 0
				var_272_0.localEulerAngles = var_272_6
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0.7, -0.75, -6.18)

				local var_272_7 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_7.x, var_272_7.y, var_272_7.z)

				local var_272_8 = var_272_0.localEulerAngles

				var_272_8.z = 0
				var_272_8.x = 0
				var_272_0.localEulerAngles = var_272_8
			end

			local var_272_9 = arg_269_1.actors_["10068ui_story"]
			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 and arg_269_1.var_.characterEffect10068ui_story == nil then
				arg_269_1.var_.characterEffect10068ui_story = var_272_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_11 = 0.200000002980232

			if var_272_10 <= arg_269_1.time_ and arg_269_1.time_ < var_272_10 + var_272_11 then
				local var_272_12 = (arg_269_1.time_ - var_272_10) / var_272_11

				if arg_269_1.var_.characterEffect10068ui_story then
					arg_269_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_10 + var_272_11 and arg_269_1.time_ < var_272_10 + var_272_11 + arg_272_0 and arg_269_1.var_.characterEffect10068ui_story then
				arg_269_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_272_13 = 0

			if var_272_13 < arg_269_1.time_ and arg_269_1.time_ <= var_272_13 + arg_272_0 then
				arg_269_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action1_1")
			end

			local var_272_14 = 0

			if var_272_14 < arg_269_1.time_ and arg_269_1.time_ <= var_272_14 + arg_272_0 then
				arg_269_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_272_15 = arg_269_1.actors_["10050ui_story"].transform
			local var_272_16 = 0

			if var_272_16 < arg_269_1.time_ and arg_269_1.time_ <= var_272_16 + arg_272_0 then
				arg_269_1.var_.moveOldPos10050ui_story = var_272_15.localPosition
			end

			local var_272_17 = 0.001

			if var_272_16 <= arg_269_1.time_ and arg_269_1.time_ < var_272_16 + var_272_17 then
				local var_272_18 = (arg_269_1.time_ - var_272_16) / var_272_17
				local var_272_19 = Vector3.New(-0.7, -0.715, -6.15)

				var_272_15.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos10050ui_story, var_272_19, var_272_18)

				local var_272_20 = manager.ui.mainCamera.transform.position - var_272_15.position

				var_272_15.forward = Vector3.New(var_272_20.x, var_272_20.y, var_272_20.z)

				local var_272_21 = var_272_15.localEulerAngles

				var_272_21.z = 0
				var_272_21.x = 0
				var_272_15.localEulerAngles = var_272_21
			end

			if arg_269_1.time_ >= var_272_16 + var_272_17 and arg_269_1.time_ < var_272_16 + var_272_17 + arg_272_0 then
				var_272_15.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_272_22 = manager.ui.mainCamera.transform.position - var_272_15.position

				var_272_15.forward = Vector3.New(var_272_22.x, var_272_22.y, var_272_22.z)

				local var_272_23 = var_272_15.localEulerAngles

				var_272_23.z = 0
				var_272_23.x = 0
				var_272_15.localEulerAngles = var_272_23
			end

			local var_272_24 = arg_269_1.actors_["10050ui_story"]
			local var_272_25 = 0

			if var_272_25 < arg_269_1.time_ and arg_269_1.time_ <= var_272_25 + arg_272_0 and arg_269_1.var_.characterEffect10050ui_story == nil then
				arg_269_1.var_.characterEffect10050ui_story = var_272_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_26 = 0.200000002980232

			if var_272_25 <= arg_269_1.time_ and arg_269_1.time_ < var_272_25 + var_272_26 then
				local var_272_27 = (arg_269_1.time_ - var_272_25) / var_272_26

				if arg_269_1.var_.characterEffect10050ui_story then
					local var_272_28 = Mathf.Lerp(0, 0.5, var_272_27)

					arg_269_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_269_1.var_.characterEffect10050ui_story.fillRatio = var_272_28
				end
			end

			if arg_269_1.time_ >= var_272_25 + var_272_26 and arg_269_1.time_ < var_272_25 + var_272_26 + arg_272_0 and arg_269_1.var_.characterEffect10050ui_story then
				local var_272_29 = 0.5

				arg_269_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_269_1.var_.characterEffect10050ui_story.fillRatio = var_272_29
			end

			local var_272_30 = 0
			local var_272_31 = 0.35

			if var_272_30 < arg_269_1.time_ and arg_269_1.time_ <= var_272_30 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_32 = arg_269_1:FormatText(StoryNameCfg[697].name)

				arg_269_1.leftNameTxt_.text = var_272_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_33 = arg_269_1:GetWordFromCfg(319511066)
				local var_272_34 = arg_269_1:FormatText(var_272_33.content)

				arg_269_1.text_.text = var_272_34

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_35 = 14
				local var_272_36 = utf8.len(var_272_34)
				local var_272_37 = var_272_35 <= 0 and var_272_31 or var_272_31 * (var_272_36 / var_272_35)

				if var_272_37 > 0 and var_272_31 < var_272_37 then
					arg_269_1.talkMaxDuration = var_272_37

					if var_272_37 + var_272_30 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_37 + var_272_30
					end
				end

				arg_269_1.text_.text = var_272_34
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511066", "story_v_out_319511.awb") ~= 0 then
					local var_272_38 = manager.audio:GetVoiceLength("story_v_out_319511", "319511066", "story_v_out_319511.awb") / 1000

					if var_272_38 + var_272_30 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_38 + var_272_30
					end

					if var_272_33.prefab_name ~= "" and arg_269_1.actors_[var_272_33.prefab_name] ~= nil then
						local var_272_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_33.prefab_name].transform, "story_v_out_319511", "319511066", "story_v_out_319511.awb")

						arg_269_1:RecordAudio("319511066", var_272_39)
						arg_269_1:RecordAudio("319511066", var_272_39)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_319511", "319511066", "story_v_out_319511.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_319511", "319511066", "story_v_out_319511.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_40 = math.max(var_272_31, arg_269_1.talkMaxDuration)

			if var_272_30 <= arg_269_1.time_ and arg_269_1.time_ < var_272_30 + var_272_40 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_30) / var_272_40

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_30 + var_272_40 and arg_269_1.time_ < var_272_30 + var_272_40 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play319511067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 319511067
		arg_273_1.duration_ = 7.5

		local var_273_0 = {
			zh = 7.5,
			ja = 6.966
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play319511068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["10068ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.characterEffect10068ui_story == nil then
				arg_273_1.var_.characterEffect10068ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.200000002980232

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect10068ui_story then
					local var_276_4 = Mathf.Lerp(0, 0.5, var_276_3)

					arg_273_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_273_1.var_.characterEffect10068ui_story.fillRatio = var_276_4
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect10068ui_story then
				local var_276_5 = 0.5

				arg_273_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_273_1.var_.characterEffect10068ui_story.fillRatio = var_276_5
			end

			local var_276_6 = arg_273_1.actors_["10050ui_story"]
			local var_276_7 = 0

			if var_276_7 < arg_273_1.time_ and arg_273_1.time_ <= var_276_7 + arg_276_0 and arg_273_1.var_.characterEffect10050ui_story == nil then
				arg_273_1.var_.characterEffect10050ui_story = var_276_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_8 = 0.200000002980232

			if var_276_7 <= arg_273_1.time_ and arg_273_1.time_ < var_276_7 + var_276_8 then
				local var_276_9 = (arg_273_1.time_ - var_276_7) / var_276_8

				if arg_273_1.var_.characterEffect10050ui_story then
					arg_273_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_7 + var_276_8 and arg_273_1.time_ < var_276_7 + var_276_8 + arg_276_0 and arg_273_1.var_.characterEffect10050ui_story then
				arg_273_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_276_10 = 0
			local var_276_11 = 0.85

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_12 = arg_273_1:FormatText(StoryNameCfg[692].name)

				arg_273_1.leftNameTxt_.text = var_276_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_13 = arg_273_1:GetWordFromCfg(319511067)
				local var_276_14 = arg_273_1:FormatText(var_276_13.content)

				arg_273_1.text_.text = var_276_14

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_15 = 34
				local var_276_16 = utf8.len(var_276_14)
				local var_276_17 = var_276_15 <= 0 and var_276_11 or var_276_11 * (var_276_16 / var_276_15)

				if var_276_17 > 0 and var_276_11 < var_276_17 then
					arg_273_1.talkMaxDuration = var_276_17

					if var_276_17 + var_276_10 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_17 + var_276_10
					end
				end

				arg_273_1.text_.text = var_276_14
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511067", "story_v_out_319511.awb") ~= 0 then
					local var_276_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511067", "story_v_out_319511.awb") / 1000

					if var_276_18 + var_276_10 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_18 + var_276_10
					end

					if var_276_13.prefab_name ~= "" and arg_273_1.actors_[var_276_13.prefab_name] ~= nil then
						local var_276_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_13.prefab_name].transform, "story_v_out_319511", "319511067", "story_v_out_319511.awb")

						arg_273_1:RecordAudio("319511067", var_276_19)
						arg_273_1:RecordAudio("319511067", var_276_19)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_319511", "319511067", "story_v_out_319511.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_319511", "319511067", "story_v_out_319511.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_20 = math.max(var_276_11, arg_273_1.talkMaxDuration)

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_20 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_10) / var_276_20

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_10 + var_276_20 and arg_273_1.time_ < var_276_10 + var_276_20 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play319511068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 319511068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play319511069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["10050ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect10050ui_story == nil then
				arg_277_1.var_.characterEffect10050ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect10050ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_277_1.var_.characterEffect10050ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect10050ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_277_1.var_.characterEffect10050ui_story.fillRatio = var_280_5
			end

			local var_280_6 = 0
			local var_280_7 = 0.325

			if var_280_6 < arg_277_1.time_ and arg_277_1.time_ <= var_280_6 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_8 = arg_277_1:FormatText(StoryNameCfg[698].name)

				arg_277_1.leftNameTxt_.text = var_280_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, true)
				arg_277_1.iconController_:SetSelectedState("hero")

				arg_277_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_9 = arg_277_1:GetWordFromCfg(319511068)
				local var_280_10 = arg_277_1:FormatText(var_280_9.content)

				arg_277_1.text_.text = var_280_10

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_11 = 13
				local var_280_12 = utf8.len(var_280_10)
				local var_280_13 = var_280_11 <= 0 and var_280_7 or var_280_7 * (var_280_12 / var_280_11)

				if var_280_13 > 0 and var_280_7 < var_280_13 then
					arg_277_1.talkMaxDuration = var_280_13

					if var_280_13 + var_280_6 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_6
					end
				end

				arg_277_1.text_.text = var_280_10
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_14 = math.max(var_280_7, arg_277_1.talkMaxDuration)

			if var_280_6 <= arg_277_1.time_ and arg_277_1.time_ < var_280_6 + var_280_14 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_6) / var_280_14

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_6 + var_280_14 and arg_277_1.time_ < var_280_6 + var_280_14 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play319511069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 319511069
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play319511070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.575

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_2 = arg_281_1:GetWordFromCfg(319511069)
				local var_284_3 = arg_281_1:FormatText(var_284_2.content)

				arg_281_1.text_.text = var_284_3

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_4 = 23
				local var_284_5 = utf8.len(var_284_3)
				local var_284_6 = var_284_4 <= 0 and var_284_1 or var_284_1 * (var_284_5 / var_284_4)

				if var_284_6 > 0 and var_284_1 < var_284_6 then
					arg_281_1.talkMaxDuration = var_284_6

					if var_284_6 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_6 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_3
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_7 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_7 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_7

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_7 and arg_281_1.time_ < var_284_0 + var_284_7 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play319511070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 319511070
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play319511071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.7

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[698].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(319511070)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 28
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_8 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_8 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_8

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_8 and arg_285_1.time_ < var_288_0 + var_288_8 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play319511071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 319511071
		arg_289_1.duration_ = 8

		local var_289_0 = {
			zh = 4,
			ja = 8
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play319511072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["10050ui_story"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos10050ui_story = var_292_0.localPosition
			end

			local var_292_2 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2
				local var_292_4 = Vector3.New(0, -0.715, -6.15)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos10050ui_story, var_292_4, var_292_3)

				local var_292_5 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_5.x, var_292_5.y, var_292_5.z)

				local var_292_6 = var_292_0.localEulerAngles

				var_292_6.z = 0
				var_292_6.x = 0
				var_292_0.localEulerAngles = var_292_6
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(0, -0.715, -6.15)

				local var_292_7 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_7.x, var_292_7.y, var_292_7.z)

				local var_292_8 = var_292_0.localEulerAngles

				var_292_8.z = 0
				var_292_8.x = 0
				var_292_0.localEulerAngles = var_292_8
			end

			local var_292_9 = arg_289_1.actors_["10050ui_story"]
			local var_292_10 = 0

			if var_292_10 < arg_289_1.time_ and arg_289_1.time_ <= var_292_10 + arg_292_0 and arg_289_1.var_.characterEffect10050ui_story == nil then
				arg_289_1.var_.characterEffect10050ui_story = var_292_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_11 = 0.200000002980232

			if var_292_10 <= arg_289_1.time_ and arg_289_1.time_ < var_292_10 + var_292_11 then
				local var_292_12 = (arg_289_1.time_ - var_292_10) / var_292_11

				if arg_289_1.var_.characterEffect10050ui_story then
					arg_289_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_10 + var_292_11 and arg_289_1.time_ < var_292_10 + var_292_11 + arg_292_0 and arg_289_1.var_.characterEffect10050ui_story then
				arg_289_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_292_13 = 0

			if var_292_13 < arg_289_1.time_ and arg_289_1.time_ <= var_292_13 + arg_292_0 then
				arg_289_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action13_1")
			end

			local var_292_14 = 0

			if var_292_14 < arg_289_1.time_ and arg_289_1.time_ <= var_292_14 + arg_292_0 then
				arg_289_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_292_15 = arg_289_1.actors_["10068ui_story"].transform
			local var_292_16 = 0

			if var_292_16 < arg_289_1.time_ and arg_289_1.time_ <= var_292_16 + arg_292_0 then
				arg_289_1.var_.moveOldPos10068ui_story = var_292_15.localPosition
			end

			local var_292_17 = 0.001

			if var_292_16 <= arg_289_1.time_ and arg_289_1.time_ < var_292_16 + var_292_17 then
				local var_292_18 = (arg_289_1.time_ - var_292_16) / var_292_17
				local var_292_19 = Vector3.New(0, 100, 0)

				var_292_15.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos10068ui_story, var_292_19, var_292_18)

				local var_292_20 = manager.ui.mainCamera.transform.position - var_292_15.position

				var_292_15.forward = Vector3.New(var_292_20.x, var_292_20.y, var_292_20.z)

				local var_292_21 = var_292_15.localEulerAngles

				var_292_21.z = 0
				var_292_21.x = 0
				var_292_15.localEulerAngles = var_292_21
			end

			if arg_289_1.time_ >= var_292_16 + var_292_17 and arg_289_1.time_ < var_292_16 + var_292_17 + arg_292_0 then
				var_292_15.localPosition = Vector3.New(0, 100, 0)

				local var_292_22 = manager.ui.mainCamera.transform.position - var_292_15.position

				var_292_15.forward = Vector3.New(var_292_22.x, var_292_22.y, var_292_22.z)

				local var_292_23 = var_292_15.localEulerAngles

				var_292_23.z = 0
				var_292_23.x = 0
				var_292_15.localEulerAngles = var_292_23
			end

			local var_292_24 = arg_289_1.actors_["10068ui_story"]
			local var_292_25 = 0

			if var_292_25 < arg_289_1.time_ and arg_289_1.time_ <= var_292_25 + arg_292_0 and arg_289_1.var_.characterEffect10068ui_story == nil then
				arg_289_1.var_.characterEffect10068ui_story = var_292_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_26 = 0.200000002980232

			if var_292_25 <= arg_289_1.time_ and arg_289_1.time_ < var_292_25 + var_292_26 then
				local var_292_27 = (arg_289_1.time_ - var_292_25) / var_292_26

				if arg_289_1.var_.characterEffect10068ui_story then
					arg_289_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_25 + var_292_26 and arg_289_1.time_ < var_292_25 + var_292_26 + arg_292_0 and arg_289_1.var_.characterEffect10068ui_story then
				arg_289_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_292_28 = 0
			local var_292_29 = 0.45

			if var_292_28 < arg_289_1.time_ and arg_289_1.time_ <= var_292_28 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_30 = arg_289_1:FormatText(StoryNameCfg[692].name)

				arg_289_1.leftNameTxt_.text = var_292_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_31 = arg_289_1:GetWordFromCfg(319511071)
				local var_292_32 = arg_289_1:FormatText(var_292_31.content)

				arg_289_1.text_.text = var_292_32

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_33 = 18
				local var_292_34 = utf8.len(var_292_32)
				local var_292_35 = var_292_33 <= 0 and var_292_29 or var_292_29 * (var_292_34 / var_292_33)

				if var_292_35 > 0 and var_292_29 < var_292_35 then
					arg_289_1.talkMaxDuration = var_292_35

					if var_292_35 + var_292_28 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_35 + var_292_28
					end
				end

				arg_289_1.text_.text = var_292_32
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511071", "story_v_out_319511.awb") ~= 0 then
					local var_292_36 = manager.audio:GetVoiceLength("story_v_out_319511", "319511071", "story_v_out_319511.awb") / 1000

					if var_292_36 + var_292_28 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_36 + var_292_28
					end

					if var_292_31.prefab_name ~= "" and arg_289_1.actors_[var_292_31.prefab_name] ~= nil then
						local var_292_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_31.prefab_name].transform, "story_v_out_319511", "319511071", "story_v_out_319511.awb")

						arg_289_1:RecordAudio("319511071", var_292_37)
						arg_289_1:RecordAudio("319511071", var_292_37)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_319511", "319511071", "story_v_out_319511.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_319511", "319511071", "story_v_out_319511.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_38 = math.max(var_292_29, arg_289_1.talkMaxDuration)

			if var_292_28 <= arg_289_1.time_ and arg_289_1.time_ < var_292_28 + var_292_38 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_28) / var_292_38

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_28 + var_292_38 and arg_289_1.time_ < var_292_28 + var_292_38 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play319511072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 319511072
		arg_293_1.duration_ = 2.566

		local var_293_0 = {
			zh = 2.033,
			ja = 2.566
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play319511073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1084ui_story"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos1084ui_story = var_296_0.localPosition
			end

			local var_296_2 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2
				local var_296_4 = Vector3.New(0.7, -0.97, -6)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1084ui_story, var_296_4, var_296_3)

				local var_296_5 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_5.x, var_296_5.y, var_296_5.z)

				local var_296_6 = var_296_0.localEulerAngles

				var_296_6.z = 0
				var_296_6.x = 0
				var_296_0.localEulerAngles = var_296_6
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_296_7 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_7.x, var_296_7.y, var_296_7.z)

				local var_296_8 = var_296_0.localEulerAngles

				var_296_8.z = 0
				var_296_8.x = 0
				var_296_0.localEulerAngles = var_296_8
			end

			local var_296_9 = arg_293_1.actors_["1084ui_story"]
			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 and arg_293_1.var_.characterEffect1084ui_story == nil then
				arg_293_1.var_.characterEffect1084ui_story = var_296_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_11 = 0.200000002980232

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_11 then
				local var_296_12 = (arg_293_1.time_ - var_296_10) / var_296_11

				if arg_293_1.var_.characterEffect1084ui_story then
					arg_293_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_10 + var_296_11 and arg_293_1.time_ < var_296_10 + var_296_11 + arg_296_0 and arg_293_1.var_.characterEffect1084ui_story then
				arg_293_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_296_13 = 0

			if var_296_13 < arg_293_1.time_ and arg_293_1.time_ <= var_296_13 + arg_296_0 then
				arg_293_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_296_15 = arg_293_1.actors_["10050ui_story"].transform
			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 then
				arg_293_1.var_.moveOldPos10050ui_story = var_296_15.localPosition
			end

			local var_296_17 = 0.001

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17
				local var_296_19 = Vector3.New(-0.7, -0.715, -6.15)

				var_296_15.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10050ui_story, var_296_19, var_296_18)

				local var_296_20 = manager.ui.mainCamera.transform.position - var_296_15.position

				var_296_15.forward = Vector3.New(var_296_20.x, var_296_20.y, var_296_20.z)

				local var_296_21 = var_296_15.localEulerAngles

				var_296_21.z = 0
				var_296_21.x = 0
				var_296_15.localEulerAngles = var_296_21
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				var_296_15.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_296_22 = manager.ui.mainCamera.transform.position - var_296_15.position

				var_296_15.forward = Vector3.New(var_296_22.x, var_296_22.y, var_296_22.z)

				local var_296_23 = var_296_15.localEulerAngles

				var_296_23.z = 0
				var_296_23.x = 0
				var_296_15.localEulerAngles = var_296_23
			end

			local var_296_24 = arg_293_1.actors_["10050ui_story"]
			local var_296_25 = 0

			if var_296_25 < arg_293_1.time_ and arg_293_1.time_ <= var_296_25 + arg_296_0 and arg_293_1.var_.characterEffect10050ui_story == nil then
				arg_293_1.var_.characterEffect10050ui_story = var_296_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_26 = 0.200000002980232

			if var_296_25 <= arg_293_1.time_ and arg_293_1.time_ < var_296_25 + var_296_26 then
				local var_296_27 = (arg_293_1.time_ - var_296_25) / var_296_26

				if arg_293_1.var_.characterEffect10050ui_story then
					local var_296_28 = Mathf.Lerp(0, 0.5, var_296_27)

					arg_293_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_293_1.var_.characterEffect10050ui_story.fillRatio = var_296_28
				end
			end

			if arg_293_1.time_ >= var_296_25 + var_296_26 and arg_293_1.time_ < var_296_25 + var_296_26 + arg_296_0 and arg_293_1.var_.characterEffect10050ui_story then
				local var_296_29 = 0.5

				arg_293_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_293_1.var_.characterEffect10050ui_story.fillRatio = var_296_29
			end

			local var_296_30 = 0
			local var_296_31 = 0.15

			if var_296_30 < arg_293_1.time_ and arg_293_1.time_ <= var_296_30 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_32 = arg_293_1:FormatText(StoryNameCfg[6].name)

				arg_293_1.leftNameTxt_.text = var_296_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_33 = arg_293_1:GetWordFromCfg(319511072)
				local var_296_34 = arg_293_1:FormatText(var_296_33.content)

				arg_293_1.text_.text = var_296_34

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_35 = 6
				local var_296_36 = utf8.len(var_296_34)
				local var_296_37 = var_296_35 <= 0 and var_296_31 or var_296_31 * (var_296_36 / var_296_35)

				if var_296_37 > 0 and var_296_31 < var_296_37 then
					arg_293_1.talkMaxDuration = var_296_37

					if var_296_37 + var_296_30 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_37 + var_296_30
					end
				end

				arg_293_1.text_.text = var_296_34
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511072", "story_v_out_319511.awb") ~= 0 then
					local var_296_38 = manager.audio:GetVoiceLength("story_v_out_319511", "319511072", "story_v_out_319511.awb") / 1000

					if var_296_38 + var_296_30 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_38 + var_296_30
					end

					if var_296_33.prefab_name ~= "" and arg_293_1.actors_[var_296_33.prefab_name] ~= nil then
						local var_296_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_33.prefab_name].transform, "story_v_out_319511", "319511072", "story_v_out_319511.awb")

						arg_293_1:RecordAudio("319511072", var_296_39)
						arg_293_1:RecordAudio("319511072", var_296_39)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_319511", "319511072", "story_v_out_319511.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_319511", "319511072", "story_v_out_319511.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_40 = math.max(var_296_31, arg_293_1.talkMaxDuration)

			if var_296_30 <= arg_293_1.time_ and arg_293_1.time_ < var_296_30 + var_296_40 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_30) / var_296_40

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_30 + var_296_40 and arg_293_1.time_ < var_296_30 + var_296_40 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play319511073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 319511073
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play319511074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1084ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect1084ui_story == nil then
				arg_297_1.var_.characterEffect1084ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.200000002980232

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1084ui_story then
					local var_300_4 = Mathf.Lerp(0, 0.5, var_300_3)

					arg_297_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1084ui_story.fillRatio = var_300_4
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect1084ui_story then
				local var_300_5 = 0.5

				arg_297_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1084ui_story.fillRatio = var_300_5
			end

			local var_300_6 = 0
			local var_300_7 = 1.125

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_8 = arg_297_1:GetWordFromCfg(319511073)
				local var_300_9 = arg_297_1:FormatText(var_300_8.content)

				arg_297_1.text_.text = var_300_9

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_10 = 45
				local var_300_11 = utf8.len(var_300_9)
				local var_300_12 = var_300_10 <= 0 and var_300_7 or var_300_7 * (var_300_11 / var_300_10)

				if var_300_12 > 0 and var_300_7 < var_300_12 then
					arg_297_1.talkMaxDuration = var_300_12

					if var_300_12 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_12 + var_300_6
					end
				end

				arg_297_1.text_.text = var_300_9
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_13 = math.max(var_300_7, arg_297_1.talkMaxDuration)

			if var_300_6 <= arg_297_1.time_ and arg_297_1.time_ < var_300_6 + var_300_13 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_6) / var_300_13

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_6 + var_300_13 and arg_297_1.time_ < var_300_6 + var_300_13 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play319511074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 319511074
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play319511075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1.225

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(319511074)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 49
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play319511075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 319511075
		arg_305_1.duration_ = 8.666

		local var_305_0 = {
			zh = 4.133,
			ja = 8.666
		}
		local var_305_1 = manager.audio:GetLocalizationFlag()

		if var_305_0[var_305_1] ~= nil then
			arg_305_1.duration_ = var_305_0[var_305_1]
		end

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play319511076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action13_2")
			end

			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_308_2 = arg_305_1.actors_["10050ui_story"]
			local var_308_3 = 0

			if var_308_3 < arg_305_1.time_ and arg_305_1.time_ <= var_308_3 + arg_308_0 and arg_305_1.var_.characterEffect10050ui_story == nil then
				arg_305_1.var_.characterEffect10050ui_story = var_308_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_4 = 0.200000002980232

			if var_308_3 <= arg_305_1.time_ and arg_305_1.time_ < var_308_3 + var_308_4 then
				local var_308_5 = (arg_305_1.time_ - var_308_3) / var_308_4

				if arg_305_1.var_.characterEffect10050ui_story then
					arg_305_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_3 + var_308_4 and arg_305_1.time_ < var_308_3 + var_308_4 + arg_308_0 and arg_305_1.var_.characterEffect10050ui_story then
				arg_305_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_308_6 = 0
			local var_308_7 = 0.525

			if var_308_6 < arg_305_1.time_ and arg_305_1.time_ <= var_308_6 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_8 = arg_305_1:FormatText(StoryNameCfg[692].name)

				arg_305_1.leftNameTxt_.text = var_308_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_9 = arg_305_1:GetWordFromCfg(319511075)
				local var_308_10 = arg_305_1:FormatText(var_308_9.content)

				arg_305_1.text_.text = var_308_10

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_11 = 21
				local var_308_12 = utf8.len(var_308_10)
				local var_308_13 = var_308_11 <= 0 and var_308_7 or var_308_7 * (var_308_12 / var_308_11)

				if var_308_13 > 0 and var_308_7 < var_308_13 then
					arg_305_1.talkMaxDuration = var_308_13

					if var_308_13 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_13 + var_308_6
					end
				end

				arg_305_1.text_.text = var_308_10
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511075", "story_v_out_319511.awb") ~= 0 then
					local var_308_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511075", "story_v_out_319511.awb") / 1000

					if var_308_14 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_14 + var_308_6
					end

					if var_308_9.prefab_name ~= "" and arg_305_1.actors_[var_308_9.prefab_name] ~= nil then
						local var_308_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_9.prefab_name].transform, "story_v_out_319511", "319511075", "story_v_out_319511.awb")

						arg_305_1:RecordAudio("319511075", var_308_15)
						arg_305_1:RecordAudio("319511075", var_308_15)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_319511", "319511075", "story_v_out_319511.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_319511", "319511075", "story_v_out_319511.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_16 = math.max(var_308_7, arg_305_1.talkMaxDuration)

			if var_308_6 <= arg_305_1.time_ and arg_305_1.time_ < var_308_6 + var_308_16 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_6) / var_308_16

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_6 + var_308_16 and arg_305_1.time_ < var_308_6 + var_308_16 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play319511076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 319511076
		arg_309_1.duration_ = 1.433

		local var_309_0 = {
			zh = 1.433,
			ja = 1.333
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play319511077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1084ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect1084ui_story == nil then
				arg_309_1.var_.characterEffect1084ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.200000002980232

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1084ui_story then
					arg_309_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect1084ui_story then
				arg_309_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_312_4 = arg_309_1.actors_["10050ui_story"]
			local var_312_5 = 0

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 and arg_309_1.var_.characterEffect10050ui_story == nil then
				arg_309_1.var_.characterEffect10050ui_story = var_312_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_6 = 0.200000002980232

			if var_312_5 <= arg_309_1.time_ and arg_309_1.time_ < var_312_5 + var_312_6 then
				local var_312_7 = (arg_309_1.time_ - var_312_5) / var_312_6

				if arg_309_1.var_.characterEffect10050ui_story then
					local var_312_8 = Mathf.Lerp(0, 0.5, var_312_7)

					arg_309_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_309_1.var_.characterEffect10050ui_story.fillRatio = var_312_8
				end
			end

			if arg_309_1.time_ >= var_312_5 + var_312_6 and arg_309_1.time_ < var_312_5 + var_312_6 + arg_312_0 and arg_309_1.var_.characterEffect10050ui_story then
				local var_312_9 = 0.5

				arg_309_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_309_1.var_.characterEffect10050ui_story.fillRatio = var_312_9
			end

			local var_312_10 = 0
			local var_312_11 = 0.1

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_12 = arg_309_1:FormatText(StoryNameCfg[6].name)

				arg_309_1.leftNameTxt_.text = var_312_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_13 = arg_309_1:GetWordFromCfg(319511076)
				local var_312_14 = arg_309_1:FormatText(var_312_13.content)

				arg_309_1.text_.text = var_312_14

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_15 = 4
				local var_312_16 = utf8.len(var_312_14)
				local var_312_17 = var_312_15 <= 0 and var_312_11 or var_312_11 * (var_312_16 / var_312_15)

				if var_312_17 > 0 and var_312_11 < var_312_17 then
					arg_309_1.talkMaxDuration = var_312_17

					if var_312_17 + var_312_10 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_17 + var_312_10
					end
				end

				arg_309_1.text_.text = var_312_14
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511076", "story_v_out_319511.awb") ~= 0 then
					local var_312_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511076", "story_v_out_319511.awb") / 1000

					if var_312_18 + var_312_10 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_18 + var_312_10
					end

					if var_312_13.prefab_name ~= "" and arg_309_1.actors_[var_312_13.prefab_name] ~= nil then
						local var_312_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_13.prefab_name].transform, "story_v_out_319511", "319511076", "story_v_out_319511.awb")

						arg_309_1:RecordAudio("319511076", var_312_19)
						arg_309_1:RecordAudio("319511076", var_312_19)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_319511", "319511076", "story_v_out_319511.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_319511", "319511076", "story_v_out_319511.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_20 = math.max(var_312_11, arg_309_1.talkMaxDuration)

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_20 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_10) / var_312_20

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_10 + var_312_20 and arg_309_1.time_ < var_312_10 + var_312_20 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play319511077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 319511077
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play319511078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1084ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1084ui_story == nil then
				arg_313_1.var_.characterEffect1084ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1084ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1084ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1084ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1084ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 0.4

			if var_316_6 < arg_313_1.time_ and arg_313_1.time_ <= var_316_6 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_8 = arg_313_1:FormatText(StoryNameCfg[698].name)

				arg_313_1.leftNameTxt_.text = var_316_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, true)
				arg_313_1.iconController_:SetSelectedState("hero")

				arg_313_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_9 = arg_313_1:GetWordFromCfg(319511077)
				local var_316_10 = arg_313_1:FormatText(var_316_9.content)

				arg_313_1.text_.text = var_316_10

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_11 = 16
				local var_316_12 = utf8.len(var_316_10)
				local var_316_13 = var_316_11 <= 0 and var_316_7 or var_316_7 * (var_316_12 / var_316_11)

				if var_316_13 > 0 and var_316_7 < var_316_13 then
					arg_313_1.talkMaxDuration = var_316_13

					if var_316_13 + var_316_6 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_13 + var_316_6
					end
				end

				arg_313_1.text_.text = var_316_10
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_14 = math.max(var_316_7, arg_313_1.talkMaxDuration)

			if var_316_6 <= arg_313_1.time_ and arg_313_1.time_ < var_316_6 + var_316_14 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_6) / var_316_14

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_6 + var_316_14 and arg_313_1.time_ < var_316_6 + var_316_14 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play319511078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 319511078
		arg_317_1.duration_ = 4.533

		local var_317_0 = {
			zh = 2.166,
			ja = 4.533
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play319511079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10050ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos10050ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10050ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = arg_317_1.actors_["10050ui_story"]
			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 and arg_317_1.var_.characterEffect10050ui_story == nil then
				arg_317_1.var_.characterEffect10050ui_story = var_320_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_11 = 0.200000002980232

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_11 then
				local var_320_12 = (arg_317_1.time_ - var_320_10) / var_320_11

				if arg_317_1.var_.characterEffect10050ui_story then
					arg_317_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_10 + var_320_11 and arg_317_1.time_ < var_320_10 + var_320_11 + arg_320_0 and arg_317_1.var_.characterEffect10050ui_story then
				arg_317_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_320_13 = 0

			if var_320_13 < arg_317_1.time_ and arg_317_1.time_ <= var_320_13 + arg_320_0 then
				arg_317_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action6_1")
			end

			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_320_15 = 0
			local var_320_16 = 0.225

			if var_320_15 < arg_317_1.time_ and arg_317_1.time_ <= var_320_15 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_17 = arg_317_1:FormatText(StoryNameCfg[692].name)

				arg_317_1.leftNameTxt_.text = var_320_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_18 = arg_317_1:GetWordFromCfg(319511078)
				local var_320_19 = arg_317_1:FormatText(var_320_18.content)

				arg_317_1.text_.text = var_320_19

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_20 = 9
				local var_320_21 = utf8.len(var_320_19)
				local var_320_22 = var_320_20 <= 0 and var_320_16 or var_320_16 * (var_320_21 / var_320_20)

				if var_320_22 > 0 and var_320_16 < var_320_22 then
					arg_317_1.talkMaxDuration = var_320_22

					if var_320_22 + var_320_15 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_22 + var_320_15
					end
				end

				arg_317_1.text_.text = var_320_19
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511078", "story_v_out_319511.awb") ~= 0 then
					local var_320_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511078", "story_v_out_319511.awb") / 1000

					if var_320_23 + var_320_15 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_23 + var_320_15
					end

					if var_320_18.prefab_name ~= "" and arg_317_1.actors_[var_320_18.prefab_name] ~= nil then
						local var_320_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_18.prefab_name].transform, "story_v_out_319511", "319511078", "story_v_out_319511.awb")

						arg_317_1:RecordAudio("319511078", var_320_24)
						arg_317_1:RecordAudio("319511078", var_320_24)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_319511", "319511078", "story_v_out_319511.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_319511", "319511078", "story_v_out_319511.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_25 = math.max(var_320_16, arg_317_1.talkMaxDuration)

			if var_320_15 <= arg_317_1.time_ and arg_317_1.time_ < var_320_15 + var_320_25 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_15) / var_320_25

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_15 + var_320_25 and arg_317_1.time_ < var_320_15 + var_320_25 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play319511079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 319511079
		arg_321_1.duration_ = 7.2

		local var_321_0 = {
			zh = 7.2,
			ja = 6.466
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play319511080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action6_2")
			end

			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_324_2 = 0
			local var_324_3 = 0.875

			if var_324_2 < arg_321_1.time_ and arg_321_1.time_ <= var_324_2 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_4 = arg_321_1:FormatText(StoryNameCfg[692].name)

				arg_321_1.leftNameTxt_.text = var_324_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_5 = arg_321_1:GetWordFromCfg(319511079)
				local var_324_6 = arg_321_1:FormatText(var_324_5.content)

				arg_321_1.text_.text = var_324_6

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_7 = 35
				local var_324_8 = utf8.len(var_324_6)
				local var_324_9 = var_324_7 <= 0 and var_324_3 or var_324_3 * (var_324_8 / var_324_7)

				if var_324_9 > 0 and var_324_3 < var_324_9 then
					arg_321_1.talkMaxDuration = var_324_9

					if var_324_9 + var_324_2 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_9 + var_324_2
					end
				end

				arg_321_1.text_.text = var_324_6
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511079", "story_v_out_319511.awb") ~= 0 then
					local var_324_10 = manager.audio:GetVoiceLength("story_v_out_319511", "319511079", "story_v_out_319511.awb") / 1000

					if var_324_10 + var_324_2 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_10 + var_324_2
					end

					if var_324_5.prefab_name ~= "" and arg_321_1.actors_[var_324_5.prefab_name] ~= nil then
						local var_324_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_5.prefab_name].transform, "story_v_out_319511", "319511079", "story_v_out_319511.awb")

						arg_321_1:RecordAudio("319511079", var_324_11)
						arg_321_1:RecordAudio("319511079", var_324_11)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_319511", "319511079", "story_v_out_319511.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_319511", "319511079", "story_v_out_319511.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_12 = math.max(var_324_3, arg_321_1.talkMaxDuration)

			if var_324_2 <= arg_321_1.time_ and arg_321_1.time_ < var_324_2 + var_324_12 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_2) / var_324_12

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_2 + var_324_12 and arg_321_1.time_ < var_324_2 + var_324_12 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play319511080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 319511080
		arg_325_1.duration_ = 9.766

		local var_325_0 = {
			zh = 9.766,
			ja = 8.4
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play319511081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 1.125

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[692].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(319511080)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 45
				local var_328_6 = utf8.len(var_328_4)
				local var_328_7 = var_328_5 <= 0 and var_328_1 or var_328_1 * (var_328_6 / var_328_5)

				if var_328_7 > 0 and var_328_1 < var_328_7 then
					arg_325_1.talkMaxDuration = var_328_7

					if var_328_7 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_7 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_4
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511080", "story_v_out_319511.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511080", "story_v_out_319511.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_319511", "319511080", "story_v_out_319511.awb")

						arg_325_1:RecordAudio("319511080", var_328_9)
						arg_325_1:RecordAudio("319511080", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_319511", "319511080", "story_v_out_319511.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_319511", "319511080", "story_v_out_319511.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_10 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_10 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_10

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_10 and arg_325_1.time_ < var_328_0 + var_328_10 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play319511081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 319511081
		arg_329_1.duration_ = 4.3

		local var_329_0 = {
			zh = 2.3,
			ja = 4.3
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play319511082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1084ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1084ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0.7, -0.97, -6)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1084ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1084ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and arg_329_1.var_.characterEffect1084ui_story == nil then
				arg_329_1.var_.characterEffect1084ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.200000002980232

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect1084ui_story then
					arg_329_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and arg_329_1.var_.characterEffect1084ui_story then
				arg_329_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_332_13 = 0

			if var_332_13 < arg_329_1.time_ and arg_329_1.time_ <= var_332_13 + arg_332_0 then
				arg_329_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 then
				arg_329_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_332_15 = arg_329_1.actors_["10050ui_story"]
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 and arg_329_1.var_.characterEffect10050ui_story == nil then
				arg_329_1.var_.characterEffect10050ui_story = var_332_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_17 = 0.200000002980232

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17

				if arg_329_1.var_.characterEffect10050ui_story then
					local var_332_19 = Mathf.Lerp(0, 0.5, var_332_18)

					arg_329_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10050ui_story.fillRatio = var_332_19
				end
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 and arg_329_1.var_.characterEffect10050ui_story then
				local var_332_20 = 0.5

				arg_329_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10050ui_story.fillRatio = var_332_20
			end

			local var_332_21 = 0
			local var_332_22 = 0.225

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_23 = arg_329_1:FormatText(StoryNameCfg[6].name)

				arg_329_1.leftNameTxt_.text = var_332_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_24 = arg_329_1:GetWordFromCfg(319511081)
				local var_332_25 = arg_329_1:FormatText(var_332_24.content)

				arg_329_1.text_.text = var_332_25

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_26 = 9
				local var_332_27 = utf8.len(var_332_25)
				local var_332_28 = var_332_26 <= 0 and var_332_22 or var_332_22 * (var_332_27 / var_332_26)

				if var_332_28 > 0 and var_332_22 < var_332_28 then
					arg_329_1.talkMaxDuration = var_332_28

					if var_332_28 + var_332_21 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_28 + var_332_21
					end
				end

				arg_329_1.text_.text = var_332_25
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511081", "story_v_out_319511.awb") ~= 0 then
					local var_332_29 = manager.audio:GetVoiceLength("story_v_out_319511", "319511081", "story_v_out_319511.awb") / 1000

					if var_332_29 + var_332_21 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_29 + var_332_21
					end

					if var_332_24.prefab_name ~= "" and arg_329_1.actors_[var_332_24.prefab_name] ~= nil then
						local var_332_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_24.prefab_name].transform, "story_v_out_319511", "319511081", "story_v_out_319511.awb")

						arg_329_1:RecordAudio("319511081", var_332_30)
						arg_329_1:RecordAudio("319511081", var_332_30)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_319511", "319511081", "story_v_out_319511.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_319511", "319511081", "story_v_out_319511.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_31 = math.max(var_332_22, arg_329_1.talkMaxDuration)

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_31 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_21) / var_332_31

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_21 + var_332_31 and arg_329_1.time_ < var_332_21 + var_332_31 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play319511082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 319511082
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play319511083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1084ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect1084ui_story == nil then
				arg_333_1.var_.characterEffect1084ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1084ui_story then
					local var_336_4 = Mathf.Lerp(0, 0.5, var_336_3)

					arg_333_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1084ui_story.fillRatio = var_336_4
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect1084ui_story then
				local var_336_5 = 0.5

				arg_333_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1084ui_story.fillRatio = var_336_5
			end

			local var_336_6 = 0
			local var_336_7 = 0.525

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_8 = arg_333_1:FormatText(StoryNameCfg[698].name)

				arg_333_1.leftNameTxt_.text = var_336_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, true)
				arg_333_1.iconController_:SetSelectedState("hero")

				arg_333_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_9 = arg_333_1:GetWordFromCfg(319511082)
				local var_336_10 = arg_333_1:FormatText(var_336_9.content)

				arg_333_1.text_.text = var_336_10

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_11 = 21
				local var_336_12 = utf8.len(var_336_10)
				local var_336_13 = var_336_11 <= 0 and var_336_7 or var_336_7 * (var_336_12 / var_336_11)

				if var_336_13 > 0 and var_336_7 < var_336_13 then
					arg_333_1.talkMaxDuration = var_336_13

					if var_336_13 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_13 + var_336_6
					end
				end

				arg_333_1.text_.text = var_336_10
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_14 = math.max(var_336_7, arg_333_1.talkMaxDuration)

			if var_336_6 <= arg_333_1.time_ and arg_333_1.time_ < var_336_6 + var_336_14 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_6) / var_336_14

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_6 + var_336_14 and arg_333_1.time_ < var_336_6 + var_336_14 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play319511083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 319511083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play319511084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_340_2 = 0
			local var_340_3 = 0.575

			if var_340_2 < arg_337_1.time_ and arg_337_1.time_ <= var_340_2 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_4 = arg_337_1:FormatText(StoryNameCfg[698].name)

				arg_337_1.leftNameTxt_.text = var_340_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, true)
				arg_337_1.iconController_:SetSelectedState("hero")

				arg_337_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_5 = arg_337_1:GetWordFromCfg(319511083)
				local var_340_6 = arg_337_1:FormatText(var_340_5.content)

				arg_337_1.text_.text = var_340_6

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_7 = 23
				local var_340_8 = utf8.len(var_340_6)
				local var_340_9 = var_340_7 <= 0 and var_340_3 or var_340_3 * (var_340_8 / var_340_7)

				if var_340_9 > 0 and var_340_3 < var_340_9 then
					arg_337_1.talkMaxDuration = var_340_9

					if var_340_9 + var_340_2 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_9 + var_340_2
					end
				end

				arg_337_1.text_.text = var_340_6
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_10 = math.max(var_340_3, arg_337_1.talkMaxDuration)

			if var_340_2 <= arg_337_1.time_ and arg_337_1.time_ < var_340_2 + var_340_10 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_2) / var_340_10

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_2 + var_340_10 and arg_337_1.time_ < var_340_2 + var_340_10 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play319511084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 319511084
		arg_341_1.duration_ = 5.233

		local var_341_0 = {
			zh = 3.566,
			ja = 5.233
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play319511085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10050ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect10050ui_story == nil then
				arg_341_1.var_.characterEffect10050ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect10050ui_story then
					arg_341_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect10050ui_story then
				arg_341_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_344_4 = 0
			local var_344_5 = 0.45

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_6 = arg_341_1:FormatText(StoryNameCfg[692].name)

				arg_341_1.leftNameTxt_.text = var_344_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_7 = arg_341_1:GetWordFromCfg(319511084)
				local var_344_8 = arg_341_1:FormatText(var_344_7.content)

				arg_341_1.text_.text = var_344_8

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_9 = 18
				local var_344_10 = utf8.len(var_344_8)
				local var_344_11 = var_344_9 <= 0 and var_344_5 or var_344_5 * (var_344_10 / var_344_9)

				if var_344_11 > 0 and var_344_5 < var_344_11 then
					arg_341_1.talkMaxDuration = var_344_11

					if var_344_11 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_11 + var_344_4
					end
				end

				arg_341_1.text_.text = var_344_8
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511084", "story_v_out_319511.awb") ~= 0 then
					local var_344_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511084", "story_v_out_319511.awb") / 1000

					if var_344_12 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_4
					end

					if var_344_7.prefab_name ~= "" and arg_341_1.actors_[var_344_7.prefab_name] ~= nil then
						local var_344_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_7.prefab_name].transform, "story_v_out_319511", "319511084", "story_v_out_319511.awb")

						arg_341_1:RecordAudio("319511084", var_344_13)
						arg_341_1:RecordAudio("319511084", var_344_13)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_319511", "319511084", "story_v_out_319511.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_319511", "319511084", "story_v_out_319511.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_14 = math.max(var_344_5, arg_341_1.talkMaxDuration)

			if var_344_4 <= arg_341_1.time_ and arg_341_1.time_ < var_344_4 + var_344_14 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_4) / var_344_14

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_4 + var_344_14 and arg_341_1.time_ < var_344_4 + var_344_14 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play319511085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 319511085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play319511086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10050ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.characterEffect10050ui_story == nil then
				arg_345_1.var_.characterEffect10050ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.200000002980232

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect10050ui_story then
					local var_348_4 = Mathf.Lerp(0, 0.5, var_348_3)

					arg_345_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_345_1.var_.characterEffect10050ui_story.fillRatio = var_348_4
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.characterEffect10050ui_story then
				local var_348_5 = 0.5

				arg_345_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_345_1.var_.characterEffect10050ui_story.fillRatio = var_348_5
			end

			local var_348_6 = 0
			local var_348_7 = 0.425

			if var_348_6 < arg_345_1.time_ and arg_345_1.time_ <= var_348_6 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_8 = arg_345_1:FormatText(StoryNameCfg[698].name)

				arg_345_1.leftNameTxt_.text = var_348_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, true)
				arg_345_1.iconController_:SetSelectedState("hero")

				arg_345_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_9 = arg_345_1:GetWordFromCfg(319511085)
				local var_348_10 = arg_345_1:FormatText(var_348_9.content)

				arg_345_1.text_.text = var_348_10

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_11 = 17
				local var_348_12 = utf8.len(var_348_10)
				local var_348_13 = var_348_11 <= 0 and var_348_7 or var_348_7 * (var_348_12 / var_348_11)

				if var_348_13 > 0 and var_348_7 < var_348_13 then
					arg_345_1.talkMaxDuration = var_348_13

					if var_348_13 + var_348_6 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_13 + var_348_6
					end
				end

				arg_345_1.text_.text = var_348_10
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_14 = math.max(var_348_7, arg_345_1.talkMaxDuration)

			if var_348_6 <= arg_345_1.time_ and arg_345_1.time_ < var_348_6 + var_348_14 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_6) / var_348_14

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_6 + var_348_14 and arg_345_1.time_ < var_348_6 + var_348_14 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play319511086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 319511086
		arg_349_1.duration_ = 6.233

		local var_349_0 = {
			zh = 4.4,
			ja = 6.233
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play319511087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["10050ui_story"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos10050ui_story = var_352_0.localPosition
			end

			local var_352_2 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2
				local var_352_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos10050ui_story, var_352_4, var_352_3)

				local var_352_5 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_5.x, var_352_5.y, var_352_5.z)

				local var_352_6 = var_352_0.localEulerAngles

				var_352_6.z = 0
				var_352_6.x = 0
				var_352_0.localEulerAngles = var_352_6
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_352_7 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_7.x, var_352_7.y, var_352_7.z)

				local var_352_8 = var_352_0.localEulerAngles

				var_352_8.z = 0
				var_352_8.x = 0
				var_352_0.localEulerAngles = var_352_8
			end

			local var_352_9 = arg_349_1.actors_["10050ui_story"]
			local var_352_10 = 0

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 and arg_349_1.var_.characterEffect10050ui_story == nil then
				arg_349_1.var_.characterEffect10050ui_story = var_352_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_11 = 0.200000002980232

			if var_352_10 <= arg_349_1.time_ and arg_349_1.time_ < var_352_10 + var_352_11 then
				local var_352_12 = (arg_349_1.time_ - var_352_10) / var_352_11

				if arg_349_1.var_.characterEffect10050ui_story then
					arg_349_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_10 + var_352_11 and arg_349_1.time_ < var_352_10 + var_352_11 + arg_352_0 and arg_349_1.var_.characterEffect10050ui_story then
				arg_349_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_352_13 = 0

			if var_352_13 < arg_349_1.time_ and arg_349_1.time_ <= var_352_13 + arg_352_0 then
				arg_349_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action13_1")
			end

			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 then
				arg_349_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_352_15 = 0
			local var_352_16 = 0.35

			if var_352_15 < arg_349_1.time_ and arg_349_1.time_ <= var_352_15 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_17 = arg_349_1:FormatText(StoryNameCfg[692].name)

				arg_349_1.leftNameTxt_.text = var_352_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_18 = arg_349_1:GetWordFromCfg(319511086)
				local var_352_19 = arg_349_1:FormatText(var_352_18.content)

				arg_349_1.text_.text = var_352_19

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_20 = 14
				local var_352_21 = utf8.len(var_352_19)
				local var_352_22 = var_352_20 <= 0 and var_352_16 or var_352_16 * (var_352_21 / var_352_20)

				if var_352_22 > 0 and var_352_16 < var_352_22 then
					arg_349_1.talkMaxDuration = var_352_22

					if var_352_22 + var_352_15 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_22 + var_352_15
					end
				end

				arg_349_1.text_.text = var_352_19
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511086", "story_v_out_319511.awb") ~= 0 then
					local var_352_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511086", "story_v_out_319511.awb") / 1000

					if var_352_23 + var_352_15 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_23 + var_352_15
					end

					if var_352_18.prefab_name ~= "" and arg_349_1.actors_[var_352_18.prefab_name] ~= nil then
						local var_352_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_18.prefab_name].transform, "story_v_out_319511", "319511086", "story_v_out_319511.awb")

						arg_349_1:RecordAudio("319511086", var_352_24)
						arg_349_1:RecordAudio("319511086", var_352_24)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_319511", "319511086", "story_v_out_319511.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_319511", "319511086", "story_v_out_319511.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_25 = math.max(var_352_16, arg_349_1.talkMaxDuration)

			if var_352_15 <= arg_349_1.time_ and arg_349_1.time_ < var_352_15 + var_352_25 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_15) / var_352_25

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_15 + var_352_25 and arg_349_1.time_ < var_352_15 + var_352_25 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play319511087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 319511087
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play319511088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["10050ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect10050ui_story == nil then
				arg_353_1.var_.characterEffect10050ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect10050ui_story then
					local var_356_4 = Mathf.Lerp(0, 0.5, var_356_3)

					arg_353_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_353_1.var_.characterEffect10050ui_story.fillRatio = var_356_4
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect10050ui_story then
				local var_356_5 = 0.5

				arg_353_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_353_1.var_.characterEffect10050ui_story.fillRatio = var_356_5
			end

			local var_356_6 = 0
			local var_356_7 = 0.5

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_8 = arg_353_1:FormatText(StoryNameCfg[698].name)

				arg_353_1.leftNameTxt_.text = var_356_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, true)
				arg_353_1.iconController_:SetSelectedState("hero")

				arg_353_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_9 = arg_353_1:GetWordFromCfg(319511087)
				local var_356_10 = arg_353_1:FormatText(var_356_9.content)

				arg_353_1.text_.text = var_356_10

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_11 = 20
				local var_356_12 = utf8.len(var_356_10)
				local var_356_13 = var_356_11 <= 0 and var_356_7 or var_356_7 * (var_356_12 / var_356_11)

				if var_356_13 > 0 and var_356_7 < var_356_13 then
					arg_353_1.talkMaxDuration = var_356_13

					if var_356_13 + var_356_6 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_13 + var_356_6
					end
				end

				arg_353_1.text_.text = var_356_10
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_14 = math.max(var_356_7, arg_353_1.talkMaxDuration)

			if var_356_6 <= arg_353_1.time_ and arg_353_1.time_ < var_356_6 + var_356_14 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_6) / var_356_14

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_6 + var_356_14 and arg_353_1.time_ < var_356_6 + var_356_14 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play319511088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 319511088
		arg_357_1.duration_ = 6.166

		local var_357_0 = {
			zh = 1.999999999999,
			ja = 6.166
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play319511089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10050ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect10050ui_story == nil then
				arg_357_1.var_.characterEffect10050ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect10050ui_story then
					arg_357_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect10050ui_story then
				arg_357_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_360_4 = 0

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action13_2")
			end

			local var_360_5 = 0

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_360_6 = 0
			local var_360_7 = 0.175

			if var_360_6 < arg_357_1.time_ and arg_357_1.time_ <= var_360_6 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_8 = arg_357_1:FormatText(StoryNameCfg[692].name)

				arg_357_1.leftNameTxt_.text = var_360_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_9 = arg_357_1:GetWordFromCfg(319511088)
				local var_360_10 = arg_357_1:FormatText(var_360_9.content)

				arg_357_1.text_.text = var_360_10

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_11 = 7
				local var_360_12 = utf8.len(var_360_10)
				local var_360_13 = var_360_11 <= 0 and var_360_7 or var_360_7 * (var_360_12 / var_360_11)

				if var_360_13 > 0 and var_360_7 < var_360_13 then
					arg_357_1.talkMaxDuration = var_360_13

					if var_360_13 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_13 + var_360_6
					end
				end

				arg_357_1.text_.text = var_360_10
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511088", "story_v_out_319511.awb") ~= 0 then
					local var_360_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511088", "story_v_out_319511.awb") / 1000

					if var_360_14 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_14 + var_360_6
					end

					if var_360_9.prefab_name ~= "" and arg_357_1.actors_[var_360_9.prefab_name] ~= nil then
						local var_360_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_9.prefab_name].transform, "story_v_out_319511", "319511088", "story_v_out_319511.awb")

						arg_357_1:RecordAudio("319511088", var_360_15)
						arg_357_1:RecordAudio("319511088", var_360_15)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_319511", "319511088", "story_v_out_319511.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_319511", "319511088", "story_v_out_319511.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_16 = math.max(var_360_7, arg_357_1.talkMaxDuration)

			if var_360_6 <= arg_357_1.time_ and arg_357_1.time_ < var_360_6 + var_360_16 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_6) / var_360_16

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_6 + var_360_16 and arg_357_1.time_ < var_360_6 + var_360_16 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play319511089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 319511089
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play319511090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["10050ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect10050ui_story == nil then
				arg_361_1.var_.characterEffect10050ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.200000002980232

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect10050ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_361_1.var_.characterEffect10050ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect10050ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_361_1.var_.characterEffect10050ui_story.fillRatio = var_364_5
			end

			local var_364_6 = 0
			local var_364_7 = 0.05

			if var_364_6 < arg_361_1.time_ and arg_361_1.time_ <= var_364_6 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_8 = arg_361_1:FormatText(StoryNameCfg[698].name)

				arg_361_1.leftNameTxt_.text = var_364_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, true)
				arg_361_1.iconController_:SetSelectedState("hero")

				arg_361_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_9 = arg_361_1:GetWordFromCfg(319511089)
				local var_364_10 = arg_361_1:FormatText(var_364_9.content)

				arg_361_1.text_.text = var_364_10

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_11 = 2
				local var_364_12 = utf8.len(var_364_10)
				local var_364_13 = var_364_11 <= 0 and var_364_7 or var_364_7 * (var_364_12 / var_364_11)

				if var_364_13 > 0 and var_364_7 < var_364_13 then
					arg_361_1.talkMaxDuration = var_364_13

					if var_364_13 + var_364_6 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_13 + var_364_6
					end
				end

				arg_361_1.text_.text = var_364_10
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_14 = math.max(var_364_7, arg_361_1.talkMaxDuration)

			if var_364_6 <= arg_361_1.time_ and arg_361_1.time_ < var_364_6 + var_364_14 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_6) / var_364_14

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_6 + var_364_14 and arg_361_1.time_ < var_364_6 + var_364_14 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play319511090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 319511090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play319511091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10050ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos10050ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(0, 100, 0)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos10050ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(0, 100, 0)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = arg_365_1.actors_["1084ui_story"].transform
			local var_368_10 = 0

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 then
				arg_365_1.var_.moveOldPos1084ui_story = var_368_9.localPosition
			end

			local var_368_11 = 0.001

			if var_368_10 <= arg_365_1.time_ and arg_365_1.time_ < var_368_10 + var_368_11 then
				local var_368_12 = (arg_365_1.time_ - var_368_10) / var_368_11
				local var_368_13 = Vector3.New(0, 100, 0)

				var_368_9.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1084ui_story, var_368_13, var_368_12)

				local var_368_14 = manager.ui.mainCamera.transform.position - var_368_9.position

				var_368_9.forward = Vector3.New(var_368_14.x, var_368_14.y, var_368_14.z)

				local var_368_15 = var_368_9.localEulerAngles

				var_368_15.z = 0
				var_368_15.x = 0
				var_368_9.localEulerAngles = var_368_15
			end

			if arg_365_1.time_ >= var_368_10 + var_368_11 and arg_365_1.time_ < var_368_10 + var_368_11 + arg_368_0 then
				var_368_9.localPosition = Vector3.New(0, 100, 0)

				local var_368_16 = manager.ui.mainCamera.transform.position - var_368_9.position

				var_368_9.forward = Vector3.New(var_368_16.x, var_368_16.y, var_368_16.z)

				local var_368_17 = var_368_9.localEulerAngles

				var_368_17.z = 0
				var_368_17.x = 0
				var_368_9.localEulerAngles = var_368_17
			end

			local var_368_18 = 0
			local var_368_19 = 0.925

			if var_368_18 < arg_365_1.time_ and arg_365_1.time_ <= var_368_18 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_20 = arg_365_1:GetWordFromCfg(319511090)
				local var_368_21 = arg_365_1:FormatText(var_368_20.content)

				arg_365_1.text_.text = var_368_21

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_22 = 37
				local var_368_23 = utf8.len(var_368_21)
				local var_368_24 = var_368_22 <= 0 and var_368_19 or var_368_19 * (var_368_23 / var_368_22)

				if var_368_24 > 0 and var_368_19 < var_368_24 then
					arg_365_1.talkMaxDuration = var_368_24

					if var_368_24 + var_368_18 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_24 + var_368_18
					end
				end

				arg_365_1.text_.text = var_368_21
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_25 = math.max(var_368_19, arg_365_1.talkMaxDuration)

			if var_368_18 <= arg_365_1.time_ and arg_365_1.time_ < var_368_18 + var_368_25 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_18) / var_368_25

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_18 + var_368_25 and arg_365_1.time_ < var_368_18 + var_368_25 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play319511091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 319511091
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play319511092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 1.175

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, false)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_2 = arg_369_1:GetWordFromCfg(319511091)
				local var_372_3 = arg_369_1:FormatText(var_372_2.content)

				arg_369_1.text_.text = var_372_3

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_4 = 47
				local var_372_5 = utf8.len(var_372_3)
				local var_372_6 = var_372_4 <= 0 and var_372_1 or var_372_1 * (var_372_5 / var_372_4)

				if var_372_6 > 0 and var_372_1 < var_372_6 then
					arg_369_1.talkMaxDuration = var_372_6

					if var_372_6 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_6 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_3
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_7 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_7 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_7

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_7 and arg_369_1.time_ < var_372_0 + var_372_7 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play319511092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 319511092
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play319511093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.825

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[698].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, true)
				arg_373_1.iconController_:SetSelectedState("hero")

				arg_373_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(319511092)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 33
				local var_376_6 = utf8.len(var_376_4)
				local var_376_7 = var_376_5 <= 0 and var_376_1 or var_376_1 * (var_376_6 / var_376_5)

				if var_376_7 > 0 and var_376_1 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_4
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_8 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_8 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_8

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_8 and arg_373_1.time_ < var_376_0 + var_376_8 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play319511093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 319511093
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play319511094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.8

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_2 = arg_377_1:FormatText(StoryNameCfg[698].name)

				arg_377_1.leftNameTxt_.text = var_380_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, true)
				arg_377_1.iconController_:SetSelectedState("hero")

				arg_377_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_3 = arg_377_1:GetWordFromCfg(319511093)
				local var_380_4 = arg_377_1:FormatText(var_380_3.content)

				arg_377_1.text_.text = var_380_4

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_5 = 32
				local var_380_6 = utf8.len(var_380_4)
				local var_380_7 = var_380_5 <= 0 and var_380_1 or var_380_1 * (var_380_6 / var_380_5)

				if var_380_7 > 0 and var_380_1 < var_380_7 then
					arg_377_1.talkMaxDuration = var_380_7

					if var_380_7 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_7 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_4
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_8 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_8 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_8

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_8 and arg_377_1.time_ < var_380_0 + var_380_8 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play319511094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 319511094
		arg_381_1.duration_ = 2.966

		local var_381_0 = {
			zh = 2.8,
			ja = 2.966
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play319511095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["10050ui_story"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos10050ui_story = var_384_0.localPosition
			end

			local var_384_2 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2
				local var_384_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos10050ui_story, var_384_4, var_384_3)

				local var_384_5 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_5.x, var_384_5.y, var_384_5.z)

				local var_384_6 = var_384_0.localEulerAngles

				var_384_6.z = 0
				var_384_6.x = 0
				var_384_0.localEulerAngles = var_384_6
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_384_7 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_7.x, var_384_7.y, var_384_7.z)

				local var_384_8 = var_384_0.localEulerAngles

				var_384_8.z = 0
				var_384_8.x = 0
				var_384_0.localEulerAngles = var_384_8
			end

			local var_384_9 = arg_381_1.actors_["10050ui_story"]
			local var_384_10 = 0

			if var_384_10 < arg_381_1.time_ and arg_381_1.time_ <= var_384_10 + arg_384_0 and arg_381_1.var_.characterEffect10050ui_story == nil then
				arg_381_1.var_.characterEffect10050ui_story = var_384_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_11 = 0.200000002980232

			if var_384_10 <= arg_381_1.time_ and arg_381_1.time_ < var_384_10 + var_384_11 then
				local var_384_12 = (arg_381_1.time_ - var_384_10) / var_384_11

				if arg_381_1.var_.characterEffect10050ui_story then
					arg_381_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_10 + var_384_11 and arg_381_1.time_ < var_384_10 + var_384_11 + arg_384_0 and arg_381_1.var_.characterEffect10050ui_story then
				arg_381_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_384_13 = 0

			if var_384_13 < arg_381_1.time_ and arg_381_1.time_ <= var_384_13 + arg_384_0 then
				arg_381_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			local var_384_14 = 0

			if var_384_14 < arg_381_1.time_ and arg_381_1.time_ <= var_384_14 + arg_384_0 then
				arg_381_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_384_15 = 0
			local var_384_16 = 0.2

			if var_384_15 < arg_381_1.time_ and arg_381_1.time_ <= var_384_15 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_17 = arg_381_1:FormatText(StoryNameCfg[692].name)

				arg_381_1.leftNameTxt_.text = var_384_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_18 = arg_381_1:GetWordFromCfg(319511094)
				local var_384_19 = arg_381_1:FormatText(var_384_18.content)

				arg_381_1.text_.text = var_384_19

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_20 = 8
				local var_384_21 = utf8.len(var_384_19)
				local var_384_22 = var_384_20 <= 0 and var_384_16 or var_384_16 * (var_384_21 / var_384_20)

				if var_384_22 > 0 and var_384_16 < var_384_22 then
					arg_381_1.talkMaxDuration = var_384_22

					if var_384_22 + var_384_15 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_22 + var_384_15
					end
				end

				arg_381_1.text_.text = var_384_19
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511094", "story_v_out_319511.awb") ~= 0 then
					local var_384_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511094", "story_v_out_319511.awb") / 1000

					if var_384_23 + var_384_15 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_23 + var_384_15
					end

					if var_384_18.prefab_name ~= "" and arg_381_1.actors_[var_384_18.prefab_name] ~= nil then
						local var_384_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_18.prefab_name].transform, "story_v_out_319511", "319511094", "story_v_out_319511.awb")

						arg_381_1:RecordAudio("319511094", var_384_24)
						arg_381_1:RecordAudio("319511094", var_384_24)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_319511", "319511094", "story_v_out_319511.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_319511", "319511094", "story_v_out_319511.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_25 = math.max(var_384_16, arg_381_1.talkMaxDuration)

			if var_384_15 <= arg_381_1.time_ and arg_381_1.time_ < var_384_15 + var_384_25 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_15) / var_384_25

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_15 + var_384_25 and arg_381_1.time_ < var_384_15 + var_384_25 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play319511095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 319511095
		arg_385_1.duration_ = 2.633

		local var_385_0 = {
			zh = 2.6,
			ja = 2.633
		}
		local var_385_1 = manager.audio:GetLocalizationFlag()

		if var_385_0[var_385_1] ~= nil then
			arg_385_1.duration_ = var_385_0[var_385_1]
		end

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play319511096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1084ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos1084ui_story = var_388_0.localPosition

				local var_388_2 = "1084ui_story"

				arg_385_1:ShowWeapon(arg_385_1.var_[var_388_2 .. "Animator"].transform, false)
			end

			local var_388_3 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_3 then
				local var_388_4 = (arg_385_1.time_ - var_388_1) / var_388_3
				local var_388_5 = Vector3.New(0.7, -0.97, -6)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1084ui_story, var_388_5, var_388_4)

				local var_388_6 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_6.x, var_388_6.y, var_388_6.z)

				local var_388_7 = var_388_0.localEulerAngles

				var_388_7.z = 0
				var_388_7.x = 0
				var_388_0.localEulerAngles = var_388_7
			end

			if arg_385_1.time_ >= var_388_1 + var_388_3 and arg_385_1.time_ < var_388_1 + var_388_3 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_388_8 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_8.x, var_388_8.y, var_388_8.z)

				local var_388_9 = var_388_0.localEulerAngles

				var_388_9.z = 0
				var_388_9.x = 0
				var_388_0.localEulerAngles = var_388_9
			end

			local var_388_10 = arg_385_1.actors_["1084ui_story"]
			local var_388_11 = 0

			if var_388_11 < arg_385_1.time_ and arg_385_1.time_ <= var_388_11 + arg_388_0 and arg_385_1.var_.characterEffect1084ui_story == nil then
				arg_385_1.var_.characterEffect1084ui_story = var_388_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_12 = 0.200000002980232

			if var_388_11 <= arg_385_1.time_ and arg_385_1.time_ < var_388_11 + var_388_12 then
				local var_388_13 = (arg_385_1.time_ - var_388_11) / var_388_12

				if arg_385_1.var_.characterEffect1084ui_story then
					arg_385_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_11 + var_388_12 and arg_385_1.time_ < var_388_11 + var_388_12 + arg_388_0 and arg_385_1.var_.characterEffect1084ui_story then
				arg_385_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_388_15 = 0

			if var_388_15 < arg_385_1.time_ and arg_385_1.time_ <= var_388_15 + arg_388_0 then
				arg_385_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_388_16 = arg_385_1.actors_["10050ui_story"]
			local var_388_17 = 0

			if var_388_17 < arg_385_1.time_ and arg_385_1.time_ <= var_388_17 + arg_388_0 and arg_385_1.var_.characterEffect10050ui_story == nil then
				arg_385_1.var_.characterEffect10050ui_story = var_388_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_18 = 0.200000002980232

			if var_388_17 <= arg_385_1.time_ and arg_385_1.time_ < var_388_17 + var_388_18 then
				local var_388_19 = (arg_385_1.time_ - var_388_17) / var_388_18

				if arg_385_1.var_.characterEffect10050ui_story then
					local var_388_20 = Mathf.Lerp(0, 0.5, var_388_19)

					arg_385_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_385_1.var_.characterEffect10050ui_story.fillRatio = var_388_20
				end
			end

			if arg_385_1.time_ >= var_388_17 + var_388_18 and arg_385_1.time_ < var_388_17 + var_388_18 + arg_388_0 and arg_385_1.var_.characterEffect10050ui_story then
				local var_388_21 = 0.5

				arg_385_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_385_1.var_.characterEffect10050ui_story.fillRatio = var_388_21
			end

			local var_388_22 = 0
			local var_388_23 = 0.225

			if var_388_22 < arg_385_1.time_ and arg_385_1.time_ <= var_388_22 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_24 = arg_385_1:FormatText(StoryNameCfg[6].name)

				arg_385_1.leftNameTxt_.text = var_388_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_25 = arg_385_1:GetWordFromCfg(319511095)
				local var_388_26 = arg_385_1:FormatText(var_388_25.content)

				arg_385_1.text_.text = var_388_26

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_27 = 9
				local var_388_28 = utf8.len(var_388_26)
				local var_388_29 = var_388_27 <= 0 and var_388_23 or var_388_23 * (var_388_28 / var_388_27)

				if var_388_29 > 0 and var_388_23 < var_388_29 then
					arg_385_1.talkMaxDuration = var_388_29

					if var_388_29 + var_388_22 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_29 + var_388_22
					end
				end

				arg_385_1.text_.text = var_388_26
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511095", "story_v_out_319511.awb") ~= 0 then
					local var_388_30 = manager.audio:GetVoiceLength("story_v_out_319511", "319511095", "story_v_out_319511.awb") / 1000

					if var_388_30 + var_388_22 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_30 + var_388_22
					end

					if var_388_25.prefab_name ~= "" and arg_385_1.actors_[var_388_25.prefab_name] ~= nil then
						local var_388_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_25.prefab_name].transform, "story_v_out_319511", "319511095", "story_v_out_319511.awb")

						arg_385_1:RecordAudio("319511095", var_388_31)
						arg_385_1:RecordAudio("319511095", var_388_31)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_319511", "319511095", "story_v_out_319511.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_319511", "319511095", "story_v_out_319511.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_32 = math.max(var_388_23, arg_385_1.talkMaxDuration)

			if var_388_22 <= arg_385_1.time_ and arg_385_1.time_ < var_388_22 + var_388_32 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_22) / var_388_32

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_22 + var_388_32 and arg_385_1.time_ < var_388_22 + var_388_32 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play319511096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 319511096
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play319511097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1084ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1084ui_story == nil then
				arg_389_1.var_.characterEffect1084ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1084ui_story then
					local var_392_4 = Mathf.Lerp(0, 0.5, var_392_3)

					arg_389_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_389_1.var_.characterEffect1084ui_story.fillRatio = var_392_4
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1084ui_story then
				local var_392_5 = 0.5

				arg_389_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_389_1.var_.characterEffect1084ui_story.fillRatio = var_392_5
			end

			local var_392_6 = 0
			local var_392_7 = 0.25

			if var_392_6 < arg_389_1.time_ and arg_389_1.time_ <= var_392_6 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_8 = arg_389_1:FormatText(StoryNameCfg[698].name)

				arg_389_1.leftNameTxt_.text = var_392_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, true)
				arg_389_1.iconController_:SetSelectedState("hero")

				arg_389_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_9 = arg_389_1:GetWordFromCfg(319511096)
				local var_392_10 = arg_389_1:FormatText(var_392_9.content)

				arg_389_1.text_.text = var_392_10

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_11 = 10
				local var_392_12 = utf8.len(var_392_10)
				local var_392_13 = var_392_11 <= 0 and var_392_7 or var_392_7 * (var_392_12 / var_392_11)

				if var_392_13 > 0 and var_392_7 < var_392_13 then
					arg_389_1.talkMaxDuration = var_392_13

					if var_392_13 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_13 + var_392_6
					end
				end

				arg_389_1.text_.text = var_392_10
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_14 = math.max(var_392_7, arg_389_1.talkMaxDuration)

			if var_392_6 <= arg_389_1.time_ and arg_389_1.time_ < var_392_6 + var_392_14 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_6) / var_392_14

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_6 + var_392_14 and arg_389_1.time_ < var_392_6 + var_392_14 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play319511097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 319511097
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play319511098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 0.425

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[698].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, true)
				arg_393_1.iconController_:SetSelectedState("hero")

				arg_393_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(319511097)
				local var_396_4 = arg_393_1:FormatText(var_396_3.content)

				arg_393_1.text_.text = var_396_4

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_5 = 17
				local var_396_6 = utf8.len(var_396_4)
				local var_396_7 = var_396_5 <= 0 and var_396_1 or var_396_1 * (var_396_6 / var_396_5)

				if var_396_7 > 0 and var_396_1 < var_396_7 then
					arg_393_1.talkMaxDuration = var_396_7

					if var_396_7 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_7 + var_396_0
					end
				end

				arg_393_1.text_.text = var_396_4
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_8 = math.max(var_396_1, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_8 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_0) / var_396_8

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_8 and arg_393_1.time_ < var_396_0 + var_396_8 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play319511098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 319511098
		arg_397_1.duration_ = 7

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play319511099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 2

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				local var_400_1 = manager.ui.mainCamera.transform.localPosition
				local var_400_2 = Vector3.New(0, 0, 10) + Vector3.New(var_400_1.x, var_400_1.y, 0)
				local var_400_3 = arg_397_1.bgs_.ST72

				var_400_3.transform.localPosition = var_400_2
				var_400_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_400_4 = var_400_3:GetComponent("SpriteRenderer")

				if var_400_4 and var_400_4.sprite then
					local var_400_5 = (var_400_3.transform.localPosition - var_400_1).z
					local var_400_6 = manager.ui.mainCameraCom_
					local var_400_7 = 2 * var_400_5 * Mathf.Tan(var_400_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_400_8 = var_400_7 * var_400_6.aspect
					local var_400_9 = var_400_4.sprite.bounds.size.x
					local var_400_10 = var_400_4.sprite.bounds.size.y
					local var_400_11 = var_400_8 / var_400_9
					local var_400_12 = var_400_7 / var_400_10
					local var_400_13 = var_400_12 < var_400_11 and var_400_11 or var_400_12

					var_400_3.transform.localScale = Vector3.New(var_400_13, var_400_13, 0)
				end

				for iter_400_0, iter_400_1 in pairs(arg_397_1.bgs_) do
					if iter_400_0 ~= "ST72" then
						iter_400_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_400_14 = 0

			if var_400_14 < arg_397_1.time_ and arg_397_1.time_ <= var_400_14 + arg_400_0 then
				arg_397_1.mask_.enabled = true
				arg_397_1.mask_.raycastTarget = true

				arg_397_1:SetGaussion(false)
			end

			local var_400_15 = 2

			if var_400_14 <= arg_397_1.time_ and arg_397_1.time_ < var_400_14 + var_400_15 then
				local var_400_16 = (arg_397_1.time_ - var_400_14) / var_400_15
				local var_400_17 = Color.New(0, 0, 0)

				var_400_17.a = Mathf.Lerp(0, 1, var_400_16)
				arg_397_1.mask_.color = var_400_17
			end

			if arg_397_1.time_ >= var_400_14 + var_400_15 and arg_397_1.time_ < var_400_14 + var_400_15 + arg_400_0 then
				local var_400_18 = Color.New(0, 0, 0)

				var_400_18.a = 1
				arg_397_1.mask_.color = var_400_18
			end

			local var_400_19 = 2

			if var_400_19 < arg_397_1.time_ and arg_397_1.time_ <= var_400_19 + arg_400_0 then
				arg_397_1.mask_.enabled = true
				arg_397_1.mask_.raycastTarget = true

				arg_397_1:SetGaussion(false)
			end

			local var_400_20 = 2

			if var_400_19 <= arg_397_1.time_ and arg_397_1.time_ < var_400_19 + var_400_20 then
				local var_400_21 = (arg_397_1.time_ - var_400_19) / var_400_20
				local var_400_22 = Color.New(0, 0, 0)

				var_400_22.a = Mathf.Lerp(1, 0, var_400_21)
				arg_397_1.mask_.color = var_400_22
			end

			if arg_397_1.time_ >= var_400_19 + var_400_20 and arg_397_1.time_ < var_400_19 + var_400_20 + arg_400_0 then
				local var_400_23 = Color.New(0, 0, 0)
				local var_400_24 = 0

				arg_397_1.mask_.enabled = false
				var_400_23.a = var_400_24
				arg_397_1.mask_.color = var_400_23
			end

			local var_400_25 = arg_397_1.actors_["1084ui_story"].transform
			local var_400_26 = 2

			if var_400_26 < arg_397_1.time_ and arg_397_1.time_ <= var_400_26 + arg_400_0 then
				arg_397_1.var_.moveOldPos1084ui_story = var_400_25.localPosition
			end

			local var_400_27 = 0.001

			if var_400_26 <= arg_397_1.time_ and arg_397_1.time_ < var_400_26 + var_400_27 then
				local var_400_28 = (arg_397_1.time_ - var_400_26) / var_400_27
				local var_400_29 = Vector3.New(0, 100, 0)

				var_400_25.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1084ui_story, var_400_29, var_400_28)

				local var_400_30 = manager.ui.mainCamera.transform.position - var_400_25.position

				var_400_25.forward = Vector3.New(var_400_30.x, var_400_30.y, var_400_30.z)

				local var_400_31 = var_400_25.localEulerAngles

				var_400_31.z = 0
				var_400_31.x = 0
				var_400_25.localEulerAngles = var_400_31
			end

			if arg_397_1.time_ >= var_400_26 + var_400_27 and arg_397_1.time_ < var_400_26 + var_400_27 + arg_400_0 then
				var_400_25.localPosition = Vector3.New(0, 100, 0)

				local var_400_32 = manager.ui.mainCamera.transform.position - var_400_25.position

				var_400_25.forward = Vector3.New(var_400_32.x, var_400_32.y, var_400_32.z)

				local var_400_33 = var_400_25.localEulerAngles

				var_400_33.z = 0
				var_400_33.x = 0
				var_400_25.localEulerAngles = var_400_33
			end

			local var_400_34 = arg_397_1.actors_["1084ui_story"]
			local var_400_35 = 2

			if var_400_35 < arg_397_1.time_ and arg_397_1.time_ <= var_400_35 + arg_400_0 and arg_397_1.var_.characterEffect1084ui_story == nil then
				arg_397_1.var_.characterEffect1084ui_story = var_400_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_36 = 0.200000002980232

			if var_400_35 <= arg_397_1.time_ and arg_397_1.time_ < var_400_35 + var_400_36 then
				local var_400_37 = (arg_397_1.time_ - var_400_35) / var_400_36

				if arg_397_1.var_.characterEffect1084ui_story then
					local var_400_38 = Mathf.Lerp(0, 0.5, var_400_37)

					arg_397_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1084ui_story.fillRatio = var_400_38
				end
			end

			if arg_397_1.time_ >= var_400_35 + var_400_36 and arg_397_1.time_ < var_400_35 + var_400_36 + arg_400_0 and arg_397_1.var_.characterEffect1084ui_story then
				local var_400_39 = 0.5

				arg_397_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1084ui_story.fillRatio = var_400_39
			end

			local var_400_40 = arg_397_1.actors_["10050ui_story"].transform
			local var_400_41 = 2

			if var_400_41 < arg_397_1.time_ and arg_397_1.time_ <= var_400_41 + arg_400_0 then
				arg_397_1.var_.moveOldPos10050ui_story = var_400_40.localPosition
			end

			local var_400_42 = 0.001

			if var_400_41 <= arg_397_1.time_ and arg_397_1.time_ < var_400_41 + var_400_42 then
				local var_400_43 = (arg_397_1.time_ - var_400_41) / var_400_42
				local var_400_44 = Vector3.New(0, 100, 0)

				var_400_40.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos10050ui_story, var_400_44, var_400_43)

				local var_400_45 = manager.ui.mainCamera.transform.position - var_400_40.position

				var_400_40.forward = Vector3.New(var_400_45.x, var_400_45.y, var_400_45.z)

				local var_400_46 = var_400_40.localEulerAngles

				var_400_46.z = 0
				var_400_46.x = 0
				var_400_40.localEulerAngles = var_400_46
			end

			if arg_397_1.time_ >= var_400_41 + var_400_42 and arg_397_1.time_ < var_400_41 + var_400_42 + arg_400_0 then
				var_400_40.localPosition = Vector3.New(0, 100, 0)

				local var_400_47 = manager.ui.mainCamera.transform.position - var_400_40.position

				var_400_40.forward = Vector3.New(var_400_47.x, var_400_47.y, var_400_47.z)

				local var_400_48 = var_400_40.localEulerAngles

				var_400_48.z = 0
				var_400_48.x = 0
				var_400_40.localEulerAngles = var_400_48
			end

			local var_400_49 = arg_397_1.actors_["10050ui_story"]
			local var_400_50 = 2

			if var_400_50 < arg_397_1.time_ and arg_397_1.time_ <= var_400_50 + arg_400_0 and arg_397_1.var_.characterEffect10050ui_story == nil then
				arg_397_1.var_.characterEffect10050ui_story = var_400_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_51 = 0.200000002980232

			if var_400_50 <= arg_397_1.time_ and arg_397_1.time_ < var_400_50 + var_400_51 then
				local var_400_52 = (arg_397_1.time_ - var_400_50) / var_400_51

				if arg_397_1.var_.characterEffect10050ui_story then
					local var_400_53 = Mathf.Lerp(0, 0.5, var_400_52)

					arg_397_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_397_1.var_.characterEffect10050ui_story.fillRatio = var_400_53
				end
			end

			if arg_397_1.time_ >= var_400_50 + var_400_51 and arg_397_1.time_ < var_400_50 + var_400_51 + arg_400_0 and arg_397_1.var_.characterEffect10050ui_story then
				local var_400_54 = 0.5

				arg_397_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_397_1.var_.characterEffect10050ui_story.fillRatio = var_400_54
			end

			if arg_397_1.frameCnt_ <= 1 then
				arg_397_1.dialog_:SetActive(false)
			end

			local var_400_55 = 2
			local var_400_56 = 1.35

			if var_400_55 < arg_397_1.time_ and arg_397_1.time_ <= var_400_55 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0

				arg_397_1.dialog_:SetActive(true)

				local var_400_57 = LeanTween.value(arg_397_1.dialog_, 0, 1, 0.3)

				var_400_57:setOnUpdate(LuaHelper.FloatAction(function(arg_401_0)
					arg_397_1.dialogCg_.alpha = arg_401_0
				end))
				var_400_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_397_1.dialog_)
					var_400_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_397_1.duration_ = arg_397_1.duration_ + 0.3

				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_58 = arg_397_1:GetWordFromCfg(319511098)
				local var_400_59 = arg_397_1:FormatText(var_400_58.content)

				arg_397_1.text_.text = var_400_59

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_60 = 54
				local var_400_61 = utf8.len(var_400_59)
				local var_400_62 = var_400_60 <= 0 and var_400_56 or var_400_56 * (var_400_61 / var_400_60)

				if var_400_62 > 0 and var_400_56 < var_400_62 then
					arg_397_1.talkMaxDuration = var_400_62
					var_400_55 = var_400_55 + 0.3

					if var_400_62 + var_400_55 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_62 + var_400_55
					end
				end

				arg_397_1.text_.text = var_400_59
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_63 = var_400_55 + 0.3
			local var_400_64 = math.max(var_400_56, arg_397_1.talkMaxDuration)

			if var_400_63 <= arg_397_1.time_ and arg_397_1.time_ < var_400_63 + var_400_64 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_63) / var_400_64

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_63 + var_400_64 and arg_397_1.time_ < var_400_63 + var_400_64 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play319511099 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 319511099
		arg_403_1.duration_ = 7.6

		local var_403_0 = {
			zh = 3.9,
			ja = 7.6
		}
		local var_403_1 = manager.audio:GetLocalizationFlag()

		if var_403_0[var_403_1] ~= nil then
			arg_403_1.duration_ = var_403_0[var_403_1]
		end

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play319511100(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["10068ui_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos10068ui_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(0, -0.75, -6.18)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos10068ui_story, var_406_4, var_406_3)

				local var_406_5 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_5.x, var_406_5.y, var_406_5.z)

				local var_406_6 = var_406_0.localEulerAngles

				var_406_6.z = 0
				var_406_6.x = 0
				var_406_0.localEulerAngles = var_406_6
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(0, -0.75, -6.18)

				local var_406_7 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_7.x, var_406_7.y, var_406_7.z)

				local var_406_8 = var_406_0.localEulerAngles

				var_406_8.z = 0
				var_406_8.x = 0
				var_406_0.localEulerAngles = var_406_8
			end

			local var_406_9 = arg_403_1.actors_["10068ui_story"]
			local var_406_10 = 0

			if var_406_10 < arg_403_1.time_ and arg_403_1.time_ <= var_406_10 + arg_406_0 and arg_403_1.var_.characterEffect10068ui_story == nil then
				arg_403_1.var_.characterEffect10068ui_story = var_406_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_11 = 0.200000002980232

			if var_406_10 <= arg_403_1.time_ and arg_403_1.time_ < var_406_10 + var_406_11 then
				local var_406_12 = (arg_403_1.time_ - var_406_10) / var_406_11

				if arg_403_1.var_.characterEffect10068ui_story then
					arg_403_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_403_1.time_ >= var_406_10 + var_406_11 and arg_403_1.time_ < var_406_10 + var_406_11 + arg_406_0 and arg_403_1.var_.characterEffect10068ui_story then
				arg_403_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_406_13 = 0

			if var_406_13 < arg_403_1.time_ and arg_403_1.time_ <= var_406_13 + arg_406_0 then
				arg_403_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action1_1")
			end

			local var_406_14 = 0

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 then
				arg_403_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_406_15 = 0
			local var_406_16 = 0.375

			if var_406_15 < arg_403_1.time_ and arg_403_1.time_ <= var_406_15 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_17 = arg_403_1:FormatText(StoryNameCfg[697].name)

				arg_403_1.leftNameTxt_.text = var_406_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_18 = arg_403_1:GetWordFromCfg(319511099)
				local var_406_19 = arg_403_1:FormatText(var_406_18.content)

				arg_403_1.text_.text = var_406_19

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_20 = 15
				local var_406_21 = utf8.len(var_406_19)
				local var_406_22 = var_406_20 <= 0 and var_406_16 or var_406_16 * (var_406_21 / var_406_20)

				if var_406_22 > 0 and var_406_16 < var_406_22 then
					arg_403_1.talkMaxDuration = var_406_22

					if var_406_22 + var_406_15 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_22 + var_406_15
					end
				end

				arg_403_1.text_.text = var_406_19
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511099", "story_v_out_319511.awb") ~= 0 then
					local var_406_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511099", "story_v_out_319511.awb") / 1000

					if var_406_23 + var_406_15 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_23 + var_406_15
					end

					if var_406_18.prefab_name ~= "" and arg_403_1.actors_[var_406_18.prefab_name] ~= nil then
						local var_406_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_18.prefab_name].transform, "story_v_out_319511", "319511099", "story_v_out_319511.awb")

						arg_403_1:RecordAudio("319511099", var_406_24)
						arg_403_1:RecordAudio("319511099", var_406_24)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_319511", "319511099", "story_v_out_319511.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_319511", "319511099", "story_v_out_319511.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_25 = math.max(var_406_16, arg_403_1.talkMaxDuration)

			if var_406_15 <= arg_403_1.time_ and arg_403_1.time_ < var_406_15 + var_406_25 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_15) / var_406_25

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_15 + var_406_25 and arg_403_1.time_ < var_406_15 + var_406_25 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play319511100 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 319511100
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play319511101(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["10068ui_story"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.characterEffect10068ui_story == nil then
				arg_407_1.var_.characterEffect10068ui_story = var_410_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_2 = 0.200000002980232

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.characterEffect10068ui_story then
					local var_410_4 = Mathf.Lerp(0, 0.5, var_410_3)

					arg_407_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_407_1.var_.characterEffect10068ui_story.fillRatio = var_410_4
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.characterEffect10068ui_story then
				local var_410_5 = 0.5

				arg_407_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_407_1.var_.characterEffect10068ui_story.fillRatio = var_410_5
			end

			local var_410_6 = 0
			local var_410_7 = 0.275

			if var_410_6 < arg_407_1.time_ and arg_407_1.time_ <= var_410_6 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_8 = arg_407_1:FormatText(StoryNameCfg[698].name)

				arg_407_1.leftNameTxt_.text = var_410_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, true)
				arg_407_1.iconController_:SetSelectedState("hero")

				arg_407_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_9 = arg_407_1:GetWordFromCfg(319511100)
				local var_410_10 = arg_407_1:FormatText(var_410_9.content)

				arg_407_1.text_.text = var_410_10

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_11 = 11
				local var_410_12 = utf8.len(var_410_10)
				local var_410_13 = var_410_11 <= 0 and var_410_7 or var_410_7 * (var_410_12 / var_410_11)

				if var_410_13 > 0 and var_410_7 < var_410_13 then
					arg_407_1.talkMaxDuration = var_410_13

					if var_410_13 + var_410_6 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_13 + var_410_6
					end
				end

				arg_407_1.text_.text = var_410_10
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_14 = math.max(var_410_7, arg_407_1.talkMaxDuration)

			if var_410_6 <= arg_407_1.time_ and arg_407_1.time_ < var_410_6 + var_410_14 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_6) / var_410_14

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_6 + var_410_14 and arg_407_1.time_ < var_410_6 + var_410_14 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play319511101 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 319511101
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play319511102(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.775

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_2 = arg_411_1:FormatText(StoryNameCfg[698].name)

				arg_411_1.leftNameTxt_.text = var_414_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, true)
				arg_411_1.iconController_:SetSelectedState("hero")

				arg_411_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_3 = arg_411_1:GetWordFromCfg(319511101)
				local var_414_4 = arg_411_1:FormatText(var_414_3.content)

				arg_411_1.text_.text = var_414_4

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_5 = 31
				local var_414_6 = utf8.len(var_414_4)
				local var_414_7 = var_414_5 <= 0 and var_414_1 or var_414_1 * (var_414_6 / var_414_5)

				if var_414_7 > 0 and var_414_1 < var_414_7 then
					arg_411_1.talkMaxDuration = var_414_7

					if var_414_7 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_7 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_4
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_8 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_8 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_8

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_8 and arg_411_1.time_ < var_414_0 + var_414_8 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play319511102 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 319511102
		arg_415_1.duration_ = 10.8

		local var_415_0 = {
			zh = 5.7,
			ja = 10.8
		}
		local var_415_1 = manager.audio:GetLocalizationFlag()

		if var_415_0[var_415_1] ~= nil then
			arg_415_1.duration_ = var_415_0[var_415_1]
		end

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play319511103(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["10068ui_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and arg_415_1.var_.characterEffect10068ui_story == nil then
				arg_415_1.var_.characterEffect10068ui_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.200000002980232

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect10068ui_story then
					arg_415_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and arg_415_1.var_.characterEffect10068ui_story then
				arg_415_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_418_4 = 0

			if var_418_4 < arg_415_1.time_ and arg_415_1.time_ <= var_418_4 + arg_418_0 then
				arg_415_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action2_1")
			end

			local var_418_5 = 0

			if var_418_5 < arg_415_1.time_ and arg_415_1.time_ <= var_418_5 + arg_418_0 then
				arg_415_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_418_6 = 0
			local var_418_7 = 0.5

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_8 = arg_415_1:FormatText(StoryNameCfg[697].name)

				arg_415_1.leftNameTxt_.text = var_418_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_9 = arg_415_1:GetWordFromCfg(319511102)
				local var_418_10 = arg_415_1:FormatText(var_418_9.content)

				arg_415_1.text_.text = var_418_10

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_11 = 20
				local var_418_12 = utf8.len(var_418_10)
				local var_418_13 = var_418_11 <= 0 and var_418_7 or var_418_7 * (var_418_12 / var_418_11)

				if var_418_13 > 0 and var_418_7 < var_418_13 then
					arg_415_1.talkMaxDuration = var_418_13

					if var_418_13 + var_418_6 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_13 + var_418_6
					end
				end

				arg_415_1.text_.text = var_418_10
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511102", "story_v_out_319511.awb") ~= 0 then
					local var_418_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511102", "story_v_out_319511.awb") / 1000

					if var_418_14 + var_418_6 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_14 + var_418_6
					end

					if var_418_9.prefab_name ~= "" and arg_415_1.actors_[var_418_9.prefab_name] ~= nil then
						local var_418_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_9.prefab_name].transform, "story_v_out_319511", "319511102", "story_v_out_319511.awb")

						arg_415_1:RecordAudio("319511102", var_418_15)
						arg_415_1:RecordAudio("319511102", var_418_15)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_319511", "319511102", "story_v_out_319511.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_319511", "319511102", "story_v_out_319511.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_16 = math.max(var_418_7, arg_415_1.talkMaxDuration)

			if var_418_6 <= arg_415_1.time_ and arg_415_1.time_ < var_418_6 + var_418_16 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_6) / var_418_16

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_6 + var_418_16 and arg_415_1.time_ < var_418_6 + var_418_16 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play319511103 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 319511103
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play319511104(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["10068ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.characterEffect10068ui_story == nil then
				arg_419_1.var_.characterEffect10068ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.200000002980232

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect10068ui_story then
					local var_422_4 = Mathf.Lerp(0, 0.5, var_422_3)

					arg_419_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_419_1.var_.characterEffect10068ui_story.fillRatio = var_422_4
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.characterEffect10068ui_story then
				local var_422_5 = 0.5

				arg_419_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_419_1.var_.characterEffect10068ui_story.fillRatio = var_422_5
			end

			local var_422_6 = 0
			local var_422_7 = 0.05

			if var_422_6 < arg_419_1.time_ and arg_419_1.time_ <= var_422_6 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_8 = arg_419_1:FormatText(StoryNameCfg[698].name)

				arg_419_1.leftNameTxt_.text = var_422_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, true)
				arg_419_1.iconController_:SetSelectedState("hero")

				arg_419_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_9 = arg_419_1:GetWordFromCfg(319511103)
				local var_422_10 = arg_419_1:FormatText(var_422_9.content)

				arg_419_1.text_.text = var_422_10

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_11 = 2
				local var_422_12 = utf8.len(var_422_10)
				local var_422_13 = var_422_11 <= 0 and var_422_7 or var_422_7 * (var_422_12 / var_422_11)

				if var_422_13 > 0 and var_422_7 < var_422_13 then
					arg_419_1.talkMaxDuration = var_422_13

					if var_422_13 + var_422_6 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_13 + var_422_6
					end
				end

				arg_419_1.text_.text = var_422_10
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_14 = math.max(var_422_7, arg_419_1.talkMaxDuration)

			if var_422_6 <= arg_419_1.time_ and arg_419_1.time_ < var_422_6 + var_422_14 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_6) / var_422_14

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_6 + var_422_14 and arg_419_1.time_ < var_422_6 + var_422_14 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play319511104 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 319511104
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play319511105(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 0.55

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_2 = arg_423_1:FormatText(StoryNameCfg[698].name)

				arg_423_1.leftNameTxt_.text = var_426_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, true)
				arg_423_1.iconController_:SetSelectedState("hero")

				arg_423_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_3 = arg_423_1:GetWordFromCfg(319511104)
				local var_426_4 = arg_423_1:FormatText(var_426_3.content)

				arg_423_1.text_.text = var_426_4

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_5 = 22
				local var_426_6 = utf8.len(var_426_4)
				local var_426_7 = var_426_5 <= 0 and var_426_1 or var_426_1 * (var_426_6 / var_426_5)

				if var_426_7 > 0 and var_426_1 < var_426_7 then
					arg_423_1.talkMaxDuration = var_426_7

					if var_426_7 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_7 + var_426_0
					end
				end

				arg_423_1.text_.text = var_426_4
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_8 = math.max(var_426_1, arg_423_1.talkMaxDuration)

			if var_426_0 <= arg_423_1.time_ and arg_423_1.time_ < var_426_0 + var_426_8 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_0) / var_426_8

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_0 + var_426_8 and arg_423_1.time_ < var_426_0 + var_426_8 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play319511105 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 319511105
		arg_427_1.duration_ = 5.766

		local var_427_0 = {
			zh = 4.6,
			ja = 5.766
		}
		local var_427_1 = manager.audio:GetLocalizationFlag()

		if var_427_0[var_427_1] ~= nil then
			arg_427_1.duration_ = var_427_0[var_427_1]
		end

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play319511106(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["10068ui_story"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and arg_427_1.var_.characterEffect10068ui_story == nil then
				arg_427_1.var_.characterEffect10068ui_story = var_430_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_2 = 0.200000002980232

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.characterEffect10068ui_story then
					arg_427_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and arg_427_1.var_.characterEffect10068ui_story then
				arg_427_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_430_4 = 0

			if var_430_4 < arg_427_1.time_ and arg_427_1.time_ <= var_430_4 + arg_430_0 then
				arg_427_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068actionlink/10068action425")
			end

			local var_430_5 = 0
			local var_430_6 = 0.45

			if var_430_5 < arg_427_1.time_ and arg_427_1.time_ <= var_430_5 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_7 = arg_427_1:FormatText(StoryNameCfg[697].name)

				arg_427_1.leftNameTxt_.text = var_430_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_8 = arg_427_1:GetWordFromCfg(319511105)
				local var_430_9 = arg_427_1:FormatText(var_430_8.content)

				arg_427_1.text_.text = var_430_9

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_10 = 18
				local var_430_11 = utf8.len(var_430_9)
				local var_430_12 = var_430_10 <= 0 and var_430_6 or var_430_6 * (var_430_11 / var_430_10)

				if var_430_12 > 0 and var_430_6 < var_430_12 then
					arg_427_1.talkMaxDuration = var_430_12

					if var_430_12 + var_430_5 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_12 + var_430_5
					end
				end

				arg_427_1.text_.text = var_430_9
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511105", "story_v_out_319511.awb") ~= 0 then
					local var_430_13 = manager.audio:GetVoiceLength("story_v_out_319511", "319511105", "story_v_out_319511.awb") / 1000

					if var_430_13 + var_430_5 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_13 + var_430_5
					end

					if var_430_8.prefab_name ~= "" and arg_427_1.actors_[var_430_8.prefab_name] ~= nil then
						local var_430_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_8.prefab_name].transform, "story_v_out_319511", "319511105", "story_v_out_319511.awb")

						arg_427_1:RecordAudio("319511105", var_430_14)
						arg_427_1:RecordAudio("319511105", var_430_14)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_319511", "319511105", "story_v_out_319511.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_319511", "319511105", "story_v_out_319511.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_15 = math.max(var_430_6, arg_427_1.talkMaxDuration)

			if var_430_5 <= arg_427_1.time_ and arg_427_1.time_ < var_430_5 + var_430_15 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_5) / var_430_15

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_5 + var_430_15 and arg_427_1.time_ < var_430_5 + var_430_15 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play319511106 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 319511106
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play319511107(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["10068ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect10068ui_story == nil then
				arg_431_1.var_.characterEffect10068ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.200000002980232

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect10068ui_story then
					local var_434_4 = Mathf.Lerp(0, 0.5, var_434_3)

					arg_431_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_431_1.var_.characterEffect10068ui_story.fillRatio = var_434_4
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect10068ui_story then
				local var_434_5 = 0.5

				arg_431_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_431_1.var_.characterEffect10068ui_story.fillRatio = var_434_5
			end

			local var_434_6 = 0
			local var_434_7 = 0.275

			if var_434_6 < arg_431_1.time_ and arg_431_1.time_ <= var_434_6 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_8 = arg_431_1:FormatText(StoryNameCfg[698].name)

				arg_431_1.leftNameTxt_.text = var_434_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, true)
				arg_431_1.iconController_:SetSelectedState("hero")

				arg_431_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_9 = arg_431_1:GetWordFromCfg(319511106)
				local var_434_10 = arg_431_1:FormatText(var_434_9.content)

				arg_431_1.text_.text = var_434_10

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_11 = 11
				local var_434_12 = utf8.len(var_434_10)
				local var_434_13 = var_434_11 <= 0 and var_434_7 or var_434_7 * (var_434_12 / var_434_11)

				if var_434_13 > 0 and var_434_7 < var_434_13 then
					arg_431_1.talkMaxDuration = var_434_13

					if var_434_13 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_13 + var_434_6
					end
				end

				arg_431_1.text_.text = var_434_10
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_14 = math.max(var_434_7, arg_431_1.talkMaxDuration)

			if var_434_6 <= arg_431_1.time_ and arg_431_1.time_ < var_434_6 + var_434_14 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_6) / var_434_14

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_6 + var_434_14 and arg_431_1.time_ < var_434_6 + var_434_14 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play319511107 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 319511107
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play319511108(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.825

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[698].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, true)
				arg_435_1.iconController_:SetSelectedState("hero")

				arg_435_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(319511107)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 33
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_1 or var_438_1 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_1 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_8 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_8 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_8

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_8 and arg_435_1.time_ < var_438_0 + var_438_8 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play319511108 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 319511108
		arg_439_1.duration_ = 5.5

		local var_439_0 = {
			zh = 2.566,
			ja = 5.5
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play319511109(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["10068ui_story"].transform
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.var_.moveOldPos10068ui_story = var_442_0.localPosition
			end

			local var_442_2 = 0.001

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2
				local var_442_4 = Vector3.New(0, -0.75, -6.18)

				var_442_0.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos10068ui_story, var_442_4, var_442_3)

				local var_442_5 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_5.x, var_442_5.y, var_442_5.z)

				local var_442_6 = var_442_0.localEulerAngles

				var_442_6.z = 0
				var_442_6.x = 0
				var_442_0.localEulerAngles = var_442_6
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 then
				var_442_0.localPosition = Vector3.New(0, -0.75, -6.18)

				local var_442_7 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_7.x, var_442_7.y, var_442_7.z)

				local var_442_8 = var_442_0.localEulerAngles

				var_442_8.z = 0
				var_442_8.x = 0
				var_442_0.localEulerAngles = var_442_8
			end

			local var_442_9 = arg_439_1.actors_["10068ui_story"]
			local var_442_10 = 0

			if var_442_10 < arg_439_1.time_ and arg_439_1.time_ <= var_442_10 + arg_442_0 and arg_439_1.var_.characterEffect10068ui_story == nil then
				arg_439_1.var_.characterEffect10068ui_story = var_442_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_11 = 0.200000002980232

			if var_442_10 <= arg_439_1.time_ and arg_439_1.time_ < var_442_10 + var_442_11 then
				local var_442_12 = (arg_439_1.time_ - var_442_10) / var_442_11

				if arg_439_1.var_.characterEffect10068ui_story then
					arg_439_1.var_.characterEffect10068ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_10 + var_442_11 and arg_439_1.time_ < var_442_10 + var_442_11 + arg_442_0 and arg_439_1.var_.characterEffect10068ui_story then
				arg_439_1.var_.characterEffect10068ui_story.fillFlat = false
			end

			local var_442_13 = 0

			if var_442_13 < arg_439_1.time_ and arg_439_1.time_ <= var_442_13 + arg_442_0 then
				arg_439_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/story10068/story10068action/10068action5_2")
			end

			local var_442_14 = 0

			if var_442_14 < arg_439_1.time_ and arg_439_1.time_ <= var_442_14 + arg_442_0 then
				arg_439_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_442_15 = 0
			local var_442_16 = 0.275

			if var_442_15 < arg_439_1.time_ and arg_439_1.time_ <= var_442_15 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_17 = arg_439_1:FormatText(StoryNameCfg[697].name)

				arg_439_1.leftNameTxt_.text = var_442_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_18 = arg_439_1:GetWordFromCfg(319511108)
				local var_442_19 = arg_439_1:FormatText(var_442_18.content)

				arg_439_1.text_.text = var_442_19

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_20 = 11
				local var_442_21 = utf8.len(var_442_19)
				local var_442_22 = var_442_20 <= 0 and var_442_16 or var_442_16 * (var_442_21 / var_442_20)

				if var_442_22 > 0 and var_442_16 < var_442_22 then
					arg_439_1.talkMaxDuration = var_442_22

					if var_442_22 + var_442_15 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_22 + var_442_15
					end
				end

				arg_439_1.text_.text = var_442_19
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511108", "story_v_out_319511.awb") ~= 0 then
					local var_442_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511108", "story_v_out_319511.awb") / 1000

					if var_442_23 + var_442_15 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_23 + var_442_15
					end

					if var_442_18.prefab_name ~= "" and arg_439_1.actors_[var_442_18.prefab_name] ~= nil then
						local var_442_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_18.prefab_name].transform, "story_v_out_319511", "319511108", "story_v_out_319511.awb")

						arg_439_1:RecordAudio("319511108", var_442_24)
						arg_439_1:RecordAudio("319511108", var_442_24)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_319511", "319511108", "story_v_out_319511.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_319511", "319511108", "story_v_out_319511.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_25 = math.max(var_442_16, arg_439_1.talkMaxDuration)

			if var_442_15 <= arg_439_1.time_ and arg_439_1.time_ < var_442_15 + var_442_25 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_15) / var_442_25

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_15 + var_442_25 and arg_439_1.time_ < var_442_15 + var_442_25 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play319511109 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 319511109
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play319511110(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["10068ui_story"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and arg_443_1.var_.characterEffect10068ui_story == nil then
				arg_443_1.var_.characterEffect10068ui_story = var_446_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_2 = 0.200000002980232

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.characterEffect10068ui_story then
					local var_446_4 = Mathf.Lerp(0, 0.5, var_446_3)

					arg_443_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_443_1.var_.characterEffect10068ui_story.fillRatio = var_446_4
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and arg_443_1.var_.characterEffect10068ui_story then
				local var_446_5 = 0.5

				arg_443_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_443_1.var_.characterEffect10068ui_story.fillRatio = var_446_5
			end

			local var_446_6 = 0
			local var_446_7 = 0.55

			if var_446_6 < arg_443_1.time_ and arg_443_1.time_ <= var_446_6 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_8 = arg_443_1:FormatText(StoryNameCfg[698].name)

				arg_443_1.leftNameTxt_.text = var_446_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, true)
				arg_443_1.iconController_:SetSelectedState("hero")

				arg_443_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_9 = arg_443_1:GetWordFromCfg(319511109)
				local var_446_10 = arg_443_1:FormatText(var_446_9.content)

				arg_443_1.text_.text = var_446_10

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_11 = 22
				local var_446_12 = utf8.len(var_446_10)
				local var_446_13 = var_446_11 <= 0 and var_446_7 or var_446_7 * (var_446_12 / var_446_11)

				if var_446_13 > 0 and var_446_7 < var_446_13 then
					arg_443_1.talkMaxDuration = var_446_13

					if var_446_13 + var_446_6 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_13 + var_446_6
					end
				end

				arg_443_1.text_.text = var_446_10
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_14 = math.max(var_446_7, arg_443_1.talkMaxDuration)

			if var_446_6 <= arg_443_1.time_ and arg_443_1.time_ < var_446_6 + var_446_14 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_6) / var_446_14

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_6 + var_446_14 and arg_443_1.time_ < var_446_6 + var_446_14 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play319511110 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 319511110
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play319511111(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1:PlayTimeline("10068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_450_1 = 0
			local var_450_2 = 0.55

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_3 = arg_447_1:FormatText(StoryNameCfg[698].name)

				arg_447_1.leftNameTxt_.text = var_450_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, true)
				arg_447_1.iconController_:SetSelectedState("hero")

				arg_447_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10073")

				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_4 = arg_447_1:GetWordFromCfg(319511110)
				local var_450_5 = arg_447_1:FormatText(var_450_4.content)

				arg_447_1.text_.text = var_450_5

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_6 = 22
				local var_450_7 = utf8.len(var_450_5)
				local var_450_8 = var_450_6 <= 0 and var_450_2 or var_450_2 * (var_450_7 / var_450_6)

				if var_450_8 > 0 and var_450_2 < var_450_8 then
					arg_447_1.talkMaxDuration = var_450_8

					if var_450_8 + var_450_1 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_1
					end
				end

				arg_447_1.text_.text = var_450_5
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_9 = math.max(var_450_2, arg_447_1.talkMaxDuration)

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_9 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_1) / var_450_9

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_1 + var_450_9 and arg_447_1.time_ < var_450_1 + var_450_9 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play319511111 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 319511111
		arg_451_1.duration_ = 7

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play319511112(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 2

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				local var_454_1 = manager.ui.mainCamera.transform.localPosition
				local var_454_2 = Vector3.New(0, 0, 10) + Vector3.New(var_454_1.x, var_454_1.y, 0)
				local var_454_3 = arg_451_1.bgs_.ST71

				var_454_3.transform.localPosition = var_454_2
				var_454_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_454_4 = var_454_3:GetComponent("SpriteRenderer")

				if var_454_4 and var_454_4.sprite then
					local var_454_5 = (var_454_3.transform.localPosition - var_454_1).z
					local var_454_6 = manager.ui.mainCameraCom_
					local var_454_7 = 2 * var_454_5 * Mathf.Tan(var_454_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_454_8 = var_454_7 * var_454_6.aspect
					local var_454_9 = var_454_4.sprite.bounds.size.x
					local var_454_10 = var_454_4.sprite.bounds.size.y
					local var_454_11 = var_454_8 / var_454_9
					local var_454_12 = var_454_7 / var_454_10
					local var_454_13 = var_454_12 < var_454_11 and var_454_11 or var_454_12

					var_454_3.transform.localScale = Vector3.New(var_454_13, var_454_13, 0)
				end

				for iter_454_0, iter_454_1 in pairs(arg_451_1.bgs_) do
					if iter_454_0 ~= "ST71" then
						iter_454_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				arg_451_1.mask_.enabled = true
				arg_451_1.mask_.raycastTarget = true

				arg_451_1:SetGaussion(false)
			end

			local var_454_15 = 2

			if var_454_14 <= arg_451_1.time_ and arg_451_1.time_ < var_454_14 + var_454_15 then
				local var_454_16 = (arg_451_1.time_ - var_454_14) / var_454_15
				local var_454_17 = Color.New(0, 0, 0)

				var_454_17.a = Mathf.Lerp(0, 1, var_454_16)
				arg_451_1.mask_.color = var_454_17
			end

			if arg_451_1.time_ >= var_454_14 + var_454_15 and arg_451_1.time_ < var_454_14 + var_454_15 + arg_454_0 then
				local var_454_18 = Color.New(0, 0, 0)

				var_454_18.a = 1
				arg_451_1.mask_.color = var_454_18
			end

			local var_454_19 = 2

			if var_454_19 < arg_451_1.time_ and arg_451_1.time_ <= var_454_19 + arg_454_0 then
				arg_451_1.mask_.enabled = true
				arg_451_1.mask_.raycastTarget = true

				arg_451_1:SetGaussion(false)
			end

			local var_454_20 = 2

			if var_454_19 <= arg_451_1.time_ and arg_451_1.time_ < var_454_19 + var_454_20 then
				local var_454_21 = (arg_451_1.time_ - var_454_19) / var_454_20
				local var_454_22 = Color.New(0, 0, 0)

				var_454_22.a = Mathf.Lerp(1, 0, var_454_21)
				arg_451_1.mask_.color = var_454_22
			end

			if arg_451_1.time_ >= var_454_19 + var_454_20 and arg_451_1.time_ < var_454_19 + var_454_20 + arg_454_0 then
				local var_454_23 = Color.New(0, 0, 0)
				local var_454_24 = 0

				arg_451_1.mask_.enabled = false
				var_454_23.a = var_454_24
				arg_451_1.mask_.color = var_454_23
			end

			local var_454_25 = arg_451_1.actors_["10068ui_story"].transform
			local var_454_26 = 2

			if var_454_26 < arg_451_1.time_ and arg_451_1.time_ <= var_454_26 + arg_454_0 then
				arg_451_1.var_.moveOldPos10068ui_story = var_454_25.localPosition
			end

			local var_454_27 = 0.001

			if var_454_26 <= arg_451_1.time_ and arg_451_1.time_ < var_454_26 + var_454_27 then
				local var_454_28 = (arg_451_1.time_ - var_454_26) / var_454_27
				local var_454_29 = Vector3.New(0, 100, 0)

				var_454_25.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos10068ui_story, var_454_29, var_454_28)

				local var_454_30 = manager.ui.mainCamera.transform.position - var_454_25.position

				var_454_25.forward = Vector3.New(var_454_30.x, var_454_30.y, var_454_30.z)

				local var_454_31 = var_454_25.localEulerAngles

				var_454_31.z = 0
				var_454_31.x = 0
				var_454_25.localEulerAngles = var_454_31
			end

			if arg_451_1.time_ >= var_454_26 + var_454_27 and arg_451_1.time_ < var_454_26 + var_454_27 + arg_454_0 then
				var_454_25.localPosition = Vector3.New(0, 100, 0)

				local var_454_32 = manager.ui.mainCamera.transform.position - var_454_25.position

				var_454_25.forward = Vector3.New(var_454_32.x, var_454_32.y, var_454_32.z)

				local var_454_33 = var_454_25.localEulerAngles

				var_454_33.z = 0
				var_454_33.x = 0
				var_454_25.localEulerAngles = var_454_33
			end

			local var_454_34 = arg_451_1.actors_["10068ui_story"]
			local var_454_35 = 2

			if var_454_35 < arg_451_1.time_ and arg_451_1.time_ <= var_454_35 + arg_454_0 and arg_451_1.var_.characterEffect10068ui_story == nil then
				arg_451_1.var_.characterEffect10068ui_story = var_454_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_36 = 0.200000002980232

			if var_454_35 <= arg_451_1.time_ and arg_451_1.time_ < var_454_35 + var_454_36 then
				local var_454_37 = (arg_451_1.time_ - var_454_35) / var_454_36

				if arg_451_1.var_.characterEffect10068ui_story then
					local var_454_38 = Mathf.Lerp(0, 0.5, var_454_37)

					arg_451_1.var_.characterEffect10068ui_story.fillFlat = true
					arg_451_1.var_.characterEffect10068ui_story.fillRatio = var_454_38
				end
			end

			if arg_451_1.time_ >= var_454_35 + var_454_36 and arg_451_1.time_ < var_454_35 + var_454_36 + arg_454_0 and arg_451_1.var_.characterEffect10068ui_story then
				local var_454_39 = 0.5

				arg_451_1.var_.characterEffect10068ui_story.fillFlat = true
				arg_451_1.var_.characterEffect10068ui_story.fillRatio = var_454_39
			end

			if arg_451_1.frameCnt_ <= 1 then
				arg_451_1.dialog_:SetActive(false)
			end

			local var_454_40 = 2
			local var_454_41 = 1.625

			if var_454_40 < arg_451_1.time_ and arg_451_1.time_ <= var_454_40 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0

				arg_451_1.dialog_:SetActive(true)

				local var_454_42 = LeanTween.value(arg_451_1.dialog_, 0, 1, 0.3)

				var_454_42:setOnUpdate(LuaHelper.FloatAction(function(arg_455_0)
					arg_451_1.dialogCg_.alpha = arg_455_0
				end))
				var_454_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_451_1.dialog_)
					var_454_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_451_1.duration_ = arg_451_1.duration_ + 0.3

				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_43 = arg_451_1:GetWordFromCfg(319511111)
				local var_454_44 = arg_451_1:FormatText(var_454_43.content)

				arg_451_1.text_.text = var_454_44

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_45 = 65
				local var_454_46 = utf8.len(var_454_44)
				local var_454_47 = var_454_45 <= 0 and var_454_41 or var_454_41 * (var_454_46 / var_454_45)

				if var_454_47 > 0 and var_454_41 < var_454_47 then
					arg_451_1.talkMaxDuration = var_454_47
					var_454_40 = var_454_40 + 0.3

					if var_454_47 + var_454_40 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_47 + var_454_40
					end
				end

				arg_451_1.text_.text = var_454_44
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_48 = var_454_40 + 0.3
			local var_454_49 = math.max(var_454_41, arg_451_1.talkMaxDuration)

			if var_454_48 <= arg_451_1.time_ and arg_451_1.time_ < var_454_48 + var_454_49 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_48) / var_454_49

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_48 + var_454_49 and arg_451_1.time_ < var_454_48 + var_454_49 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play319511112 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 319511112
		arg_457_1.duration_ = 5.8

		local var_457_0 = {
			zh = 2.4,
			ja = 5.8
		}
		local var_457_1 = manager.audio:GetLocalizationFlag()

		if var_457_0[var_457_1] ~= nil then
			arg_457_1.duration_ = var_457_0[var_457_1]
		end

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play319511113(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["10050ui_story"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos10050ui_story = var_460_0.localPosition
			end

			local var_460_2 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2
				local var_460_4 = Vector3.New(0, -0.715, -6.15)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos10050ui_story, var_460_4, var_460_3)

				local var_460_5 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_5.x, var_460_5.y, var_460_5.z)

				local var_460_6 = var_460_0.localEulerAngles

				var_460_6.z = 0
				var_460_6.x = 0
				var_460_0.localEulerAngles = var_460_6
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(0, -0.715, -6.15)

				local var_460_7 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_7.x, var_460_7.y, var_460_7.z)

				local var_460_8 = var_460_0.localEulerAngles

				var_460_8.z = 0
				var_460_8.x = 0
				var_460_0.localEulerAngles = var_460_8
			end

			local var_460_9 = arg_457_1.actors_["10050ui_story"]
			local var_460_10 = 0

			if var_460_10 < arg_457_1.time_ and arg_457_1.time_ <= var_460_10 + arg_460_0 and arg_457_1.var_.characterEffect10050ui_story == nil then
				arg_457_1.var_.characterEffect10050ui_story = var_460_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_11 = 0.200000002980232

			if var_460_10 <= arg_457_1.time_ and arg_457_1.time_ < var_460_10 + var_460_11 then
				local var_460_12 = (arg_457_1.time_ - var_460_10) / var_460_11

				if arg_457_1.var_.characterEffect10050ui_story then
					arg_457_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_10 + var_460_11 and arg_457_1.time_ < var_460_10 + var_460_11 + arg_460_0 and arg_457_1.var_.characterEffect10050ui_story then
				arg_457_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_460_13 = 0

			if var_460_13 < arg_457_1.time_ and arg_457_1.time_ <= var_460_13 + arg_460_0 then
				arg_457_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			local var_460_14 = 0

			if var_460_14 < arg_457_1.time_ and arg_457_1.time_ <= var_460_14 + arg_460_0 then
				arg_457_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_460_15 = 0
			local var_460_16 = 0.3

			if var_460_15 < arg_457_1.time_ and arg_457_1.time_ <= var_460_15 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_17 = arg_457_1:FormatText(StoryNameCfg[692].name)

				arg_457_1.leftNameTxt_.text = var_460_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_18 = arg_457_1:GetWordFromCfg(319511112)
				local var_460_19 = arg_457_1:FormatText(var_460_18.content)

				arg_457_1.text_.text = var_460_19

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_20 = 12
				local var_460_21 = utf8.len(var_460_19)
				local var_460_22 = var_460_20 <= 0 and var_460_16 or var_460_16 * (var_460_21 / var_460_20)

				if var_460_22 > 0 and var_460_16 < var_460_22 then
					arg_457_1.talkMaxDuration = var_460_22

					if var_460_22 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_22 + var_460_15
					end
				end

				arg_457_1.text_.text = var_460_19
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511112", "story_v_out_319511.awb") ~= 0 then
					local var_460_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511112", "story_v_out_319511.awb") / 1000

					if var_460_23 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_23 + var_460_15
					end

					if var_460_18.prefab_name ~= "" and arg_457_1.actors_[var_460_18.prefab_name] ~= nil then
						local var_460_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_18.prefab_name].transform, "story_v_out_319511", "319511112", "story_v_out_319511.awb")

						arg_457_1:RecordAudio("319511112", var_460_24)
						arg_457_1:RecordAudio("319511112", var_460_24)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_319511", "319511112", "story_v_out_319511.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_319511", "319511112", "story_v_out_319511.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_25 = math.max(var_460_16, arg_457_1.talkMaxDuration)

			if var_460_15 <= arg_457_1.time_ and arg_457_1.time_ < var_460_15 + var_460_25 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_15) / var_460_25

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_15 + var_460_25 and arg_457_1.time_ < var_460_15 + var_460_25 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play319511113 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 319511113
		arg_461_1.duration_ = 4.066

		local var_461_0 = {
			zh = 2.2,
			ja = 4.066
		}
		local var_461_1 = manager.audio:GetLocalizationFlag()

		if var_461_0[var_461_1] ~= nil then
			arg_461_1.duration_ = var_461_0[var_461_1]
		end

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play319511114(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1084ui_story"].transform
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 then
				arg_461_1.var_.moveOldPos1084ui_story = var_464_0.localPosition
			end

			local var_464_2 = 0.001

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2
				local var_464_4 = Vector3.New(0.7, -0.97, -6)

				var_464_0.localPosition = Vector3.Lerp(arg_461_1.var_.moveOldPos1084ui_story, var_464_4, var_464_3)

				local var_464_5 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_5.x, var_464_5.y, var_464_5.z)

				local var_464_6 = var_464_0.localEulerAngles

				var_464_6.z = 0
				var_464_6.x = 0
				var_464_0.localEulerAngles = var_464_6
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 then
				var_464_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_464_7 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_7.x, var_464_7.y, var_464_7.z)

				local var_464_8 = var_464_0.localEulerAngles

				var_464_8.z = 0
				var_464_8.x = 0
				var_464_0.localEulerAngles = var_464_8
			end

			local var_464_9 = arg_461_1.actors_["1084ui_story"]
			local var_464_10 = 0

			if var_464_10 < arg_461_1.time_ and arg_461_1.time_ <= var_464_10 + arg_464_0 and arg_461_1.var_.characterEffect1084ui_story == nil then
				arg_461_1.var_.characterEffect1084ui_story = var_464_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_11 = 0.200000002980232

			if var_464_10 <= arg_461_1.time_ and arg_461_1.time_ < var_464_10 + var_464_11 then
				local var_464_12 = (arg_461_1.time_ - var_464_10) / var_464_11

				if arg_461_1.var_.characterEffect1084ui_story then
					arg_461_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_10 + var_464_11 and arg_461_1.time_ < var_464_10 + var_464_11 + arg_464_0 and arg_461_1.var_.characterEffect1084ui_story then
				arg_461_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_464_13 = 0

			if var_464_13 < arg_461_1.time_ and arg_461_1.time_ <= var_464_13 + arg_464_0 then
				arg_461_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_464_14 = 0

			if var_464_14 < arg_461_1.time_ and arg_461_1.time_ <= var_464_14 + arg_464_0 then
				arg_461_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_464_15 = arg_461_1.actors_["10050ui_story"].transform
			local var_464_16 = 0

			if var_464_16 < arg_461_1.time_ and arg_461_1.time_ <= var_464_16 + arg_464_0 then
				arg_461_1.var_.moveOldPos10050ui_story = var_464_15.localPosition
			end

			local var_464_17 = 0.001

			if var_464_16 <= arg_461_1.time_ and arg_461_1.time_ < var_464_16 + var_464_17 then
				local var_464_18 = (arg_461_1.time_ - var_464_16) / var_464_17
				local var_464_19 = Vector3.New(-0.7, -0.715, -6.15)

				var_464_15.localPosition = Vector3.Lerp(arg_461_1.var_.moveOldPos10050ui_story, var_464_19, var_464_18)

				local var_464_20 = manager.ui.mainCamera.transform.position - var_464_15.position

				var_464_15.forward = Vector3.New(var_464_20.x, var_464_20.y, var_464_20.z)

				local var_464_21 = var_464_15.localEulerAngles

				var_464_21.z = 0
				var_464_21.x = 0
				var_464_15.localEulerAngles = var_464_21
			end

			if arg_461_1.time_ >= var_464_16 + var_464_17 and arg_461_1.time_ < var_464_16 + var_464_17 + arg_464_0 then
				var_464_15.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_464_22 = manager.ui.mainCamera.transform.position - var_464_15.position

				var_464_15.forward = Vector3.New(var_464_22.x, var_464_22.y, var_464_22.z)

				local var_464_23 = var_464_15.localEulerAngles

				var_464_23.z = 0
				var_464_23.x = 0
				var_464_15.localEulerAngles = var_464_23
			end

			local var_464_24 = arg_461_1.actors_["10050ui_story"]
			local var_464_25 = 0

			if var_464_25 < arg_461_1.time_ and arg_461_1.time_ <= var_464_25 + arg_464_0 and arg_461_1.var_.characterEffect10050ui_story == nil then
				arg_461_1.var_.characterEffect10050ui_story = var_464_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_26 = 0.200000002980232

			if var_464_25 <= arg_461_1.time_ and arg_461_1.time_ < var_464_25 + var_464_26 then
				local var_464_27 = (arg_461_1.time_ - var_464_25) / var_464_26

				if arg_461_1.var_.characterEffect10050ui_story then
					local var_464_28 = Mathf.Lerp(0, 0.5, var_464_27)

					arg_461_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_461_1.var_.characterEffect10050ui_story.fillRatio = var_464_28
				end
			end

			if arg_461_1.time_ >= var_464_25 + var_464_26 and arg_461_1.time_ < var_464_25 + var_464_26 + arg_464_0 and arg_461_1.var_.characterEffect10050ui_story then
				local var_464_29 = 0.5

				arg_461_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_461_1.var_.characterEffect10050ui_story.fillRatio = var_464_29
			end

			local var_464_30 = 0
			local var_464_31 = 0.2

			if var_464_30 < arg_461_1.time_ and arg_461_1.time_ <= var_464_30 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_32 = arg_461_1:FormatText(StoryNameCfg[6].name)

				arg_461_1.leftNameTxt_.text = var_464_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_33 = arg_461_1:GetWordFromCfg(319511113)
				local var_464_34 = arg_461_1:FormatText(var_464_33.content)

				arg_461_1.text_.text = var_464_34

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_35 = 8
				local var_464_36 = utf8.len(var_464_34)
				local var_464_37 = var_464_35 <= 0 and var_464_31 or var_464_31 * (var_464_36 / var_464_35)

				if var_464_37 > 0 and var_464_31 < var_464_37 then
					arg_461_1.talkMaxDuration = var_464_37

					if var_464_37 + var_464_30 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_37 + var_464_30
					end
				end

				arg_461_1.text_.text = var_464_34
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511113", "story_v_out_319511.awb") ~= 0 then
					local var_464_38 = manager.audio:GetVoiceLength("story_v_out_319511", "319511113", "story_v_out_319511.awb") / 1000

					if var_464_38 + var_464_30 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_38 + var_464_30
					end

					if var_464_33.prefab_name ~= "" and arg_461_1.actors_[var_464_33.prefab_name] ~= nil then
						local var_464_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_33.prefab_name].transform, "story_v_out_319511", "319511113", "story_v_out_319511.awb")

						arg_461_1:RecordAudio("319511113", var_464_39)
						arg_461_1:RecordAudio("319511113", var_464_39)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_319511", "319511113", "story_v_out_319511.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_319511", "319511113", "story_v_out_319511.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_40 = math.max(var_464_31, arg_461_1.talkMaxDuration)

			if var_464_30 <= arg_461_1.time_ and arg_461_1.time_ < var_464_30 + var_464_40 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_30) / var_464_40

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_30 + var_464_40 and arg_461_1.time_ < var_464_30 + var_464_40 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play319511114 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 319511114
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play319511115(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1084ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect1084ui_story == nil then
				arg_465_1.var_.characterEffect1084ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.200000002980232

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect1084ui_story then
					local var_468_4 = Mathf.Lerp(0, 0.5, var_468_3)

					arg_465_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1084ui_story.fillRatio = var_468_4
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect1084ui_story then
				local var_468_5 = 0.5

				arg_465_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1084ui_story.fillRatio = var_468_5
			end

			local var_468_6 = 0

			if var_468_6 < arg_465_1.time_ and arg_465_1.time_ <= var_468_6 + arg_468_0 then
				arg_465_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_468_7 = 0

			if var_468_7 < arg_465_1.time_ and arg_465_1.time_ <= var_468_7 + arg_468_0 then
				arg_465_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_468_8 = 0
			local var_468_9 = 0.525

			if var_468_8 < arg_465_1.time_ and arg_465_1.time_ <= var_468_8 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, false)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_10 = arg_465_1:GetWordFromCfg(319511114)
				local var_468_11 = arg_465_1:FormatText(var_468_10.content)

				arg_465_1.text_.text = var_468_11

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_12 = 21
				local var_468_13 = utf8.len(var_468_11)
				local var_468_14 = var_468_12 <= 0 and var_468_9 or var_468_9 * (var_468_13 / var_468_12)

				if var_468_14 > 0 and var_468_9 < var_468_14 then
					arg_465_1.talkMaxDuration = var_468_14

					if var_468_14 + var_468_8 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_14 + var_468_8
					end
				end

				arg_465_1.text_.text = var_468_11
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_15 = math.max(var_468_9, arg_465_1.talkMaxDuration)

			if var_468_8 <= arg_465_1.time_ and arg_465_1.time_ < var_468_8 + var_468_15 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_8) / var_468_15

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_8 + var_468_15 and arg_465_1.time_ < var_468_8 + var_468_15 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play319511115 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 319511115
		arg_469_1.duration_ = 4.5

		local var_469_0 = {
			zh = 4.033,
			ja = 4.5
		}
		local var_469_1 = manager.audio:GetLocalizationFlag()

		if var_469_0[var_469_1] ~= nil then
			arg_469_1.duration_ = var_469_0[var_469_1]
		end

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play319511116(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["10050ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect10050ui_story == nil then
				arg_469_1.var_.characterEffect10050ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect10050ui_story then
					arg_469_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect10050ui_story then
				arg_469_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_472_4 = 0

			if var_472_4 < arg_469_1.time_ and arg_469_1.time_ <= var_472_4 + arg_472_0 then
				arg_469_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action2_1")
			end

			local var_472_5 = 0

			if var_472_5 < arg_469_1.time_ and arg_469_1.time_ <= var_472_5 + arg_472_0 then
				arg_469_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_472_6 = 0
			local var_472_7 = 0.5

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_8 = arg_469_1:FormatText(StoryNameCfg[692].name)

				arg_469_1.leftNameTxt_.text = var_472_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_9 = arg_469_1:GetWordFromCfg(319511115)
				local var_472_10 = arg_469_1:FormatText(var_472_9.content)

				arg_469_1.text_.text = var_472_10

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_11 = 20
				local var_472_12 = utf8.len(var_472_10)
				local var_472_13 = var_472_11 <= 0 and var_472_7 or var_472_7 * (var_472_12 / var_472_11)

				if var_472_13 > 0 and var_472_7 < var_472_13 then
					arg_469_1.talkMaxDuration = var_472_13

					if var_472_13 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_13 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_10
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511115", "story_v_out_319511.awb") ~= 0 then
					local var_472_14 = manager.audio:GetVoiceLength("story_v_out_319511", "319511115", "story_v_out_319511.awb") / 1000

					if var_472_14 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_14 + var_472_6
					end

					if var_472_9.prefab_name ~= "" and arg_469_1.actors_[var_472_9.prefab_name] ~= nil then
						local var_472_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_9.prefab_name].transform, "story_v_out_319511", "319511115", "story_v_out_319511.awb")

						arg_469_1:RecordAudio("319511115", var_472_15)
						arg_469_1:RecordAudio("319511115", var_472_15)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_319511", "319511115", "story_v_out_319511.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_319511", "319511115", "story_v_out_319511.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_16 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_16 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_16

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_16 and arg_469_1.time_ < var_472_6 + var_472_16 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play319511116 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 319511116
		arg_473_1.duration_ = 15.1

		local var_473_0 = {
			zh = 8.733,
			ja = 15.1
		}
		local var_473_1 = manager.audio:GetLocalizationFlag()

		if var_473_0[var_473_1] ~= nil then
			arg_473_1.duration_ = var_473_0[var_473_1]
		end

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play319511117(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 1

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_2 = arg_473_1:FormatText(StoryNameCfg[692].name)

				arg_473_1.leftNameTxt_.text = var_476_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_3 = arg_473_1:GetWordFromCfg(319511116)
				local var_476_4 = arg_473_1:FormatText(var_476_3.content)

				arg_473_1.text_.text = var_476_4

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_5 = 40
				local var_476_6 = utf8.len(var_476_4)
				local var_476_7 = var_476_5 <= 0 and var_476_1 or var_476_1 * (var_476_6 / var_476_5)

				if var_476_7 > 0 and var_476_1 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_4
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511116", "story_v_out_319511.awb") ~= 0 then
					local var_476_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511116", "story_v_out_319511.awb") / 1000

					if var_476_8 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_8 + var_476_0
					end

					if var_476_3.prefab_name ~= "" and arg_473_1.actors_[var_476_3.prefab_name] ~= nil then
						local var_476_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_3.prefab_name].transform, "story_v_out_319511", "319511116", "story_v_out_319511.awb")

						arg_473_1:RecordAudio("319511116", var_476_9)
						arg_473_1:RecordAudio("319511116", var_476_9)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_319511", "319511116", "story_v_out_319511.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_319511", "319511116", "story_v_out_319511.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_10 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_10 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_10

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_10 and arg_473_1.time_ < var_476_0 + var_476_10 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play319511117 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 319511117
		arg_477_1.duration_ = 18.166

		local var_477_0 = {
			zh = 13.3,
			ja = 18.166
		}
		local var_477_1 = manager.audio:GetLocalizationFlag()

		if var_477_0[var_477_1] ~= nil then
			arg_477_1.duration_ = var_477_0[var_477_1]
		end

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play319511118(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_480_1 = 0
			local var_480_2 = 1.275

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_3 = arg_477_1:FormatText(StoryNameCfg[692].name)

				arg_477_1.leftNameTxt_.text = var_480_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_4 = arg_477_1:GetWordFromCfg(319511117)
				local var_480_5 = arg_477_1:FormatText(var_480_4.content)

				arg_477_1.text_.text = var_480_5

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_6 = 51
				local var_480_7 = utf8.len(var_480_5)
				local var_480_8 = var_480_6 <= 0 and var_480_2 or var_480_2 * (var_480_7 / var_480_6)

				if var_480_8 > 0 and var_480_2 < var_480_8 then
					arg_477_1.talkMaxDuration = var_480_8

					if var_480_8 + var_480_1 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_8 + var_480_1
					end
				end

				arg_477_1.text_.text = var_480_5
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511117", "story_v_out_319511.awb") ~= 0 then
					local var_480_9 = manager.audio:GetVoiceLength("story_v_out_319511", "319511117", "story_v_out_319511.awb") / 1000

					if var_480_9 + var_480_1 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_9 + var_480_1
					end

					if var_480_4.prefab_name ~= "" and arg_477_1.actors_[var_480_4.prefab_name] ~= nil then
						local var_480_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_4.prefab_name].transform, "story_v_out_319511", "319511117", "story_v_out_319511.awb")

						arg_477_1:RecordAudio("319511117", var_480_10)
						arg_477_1:RecordAudio("319511117", var_480_10)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_319511", "319511117", "story_v_out_319511.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_319511", "319511117", "story_v_out_319511.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_11 = math.max(var_480_2, arg_477_1.talkMaxDuration)

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_11 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_1) / var_480_11

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_1 + var_480_11 and arg_477_1.time_ < var_480_1 + var_480_11 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play319511118 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 319511118
		arg_481_1.duration_ = 8.066

		local var_481_0 = {
			zh = 7.9,
			ja = 8.066
		}
		local var_481_1 = manager.audio:GetLocalizationFlag()

		if var_481_0[var_481_1] ~= nil then
			arg_481_1.duration_ = var_481_0[var_481_1]
		end

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play319511119(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_484_1 = 0
			local var_484_2 = 0.75

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_3 = arg_481_1:FormatText(StoryNameCfg[692].name)

				arg_481_1.leftNameTxt_.text = var_484_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_4 = arg_481_1:GetWordFromCfg(319511118)
				local var_484_5 = arg_481_1:FormatText(var_484_4.content)

				arg_481_1.text_.text = var_484_5

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_6 = 30
				local var_484_7 = utf8.len(var_484_5)
				local var_484_8 = var_484_6 <= 0 and var_484_2 or var_484_2 * (var_484_7 / var_484_6)

				if var_484_8 > 0 and var_484_2 < var_484_8 then
					arg_481_1.talkMaxDuration = var_484_8

					if var_484_8 + var_484_1 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_8 + var_484_1
					end
				end

				arg_481_1.text_.text = var_484_5
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511118", "story_v_out_319511.awb") ~= 0 then
					local var_484_9 = manager.audio:GetVoiceLength("story_v_out_319511", "319511118", "story_v_out_319511.awb") / 1000

					if var_484_9 + var_484_1 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_9 + var_484_1
					end

					if var_484_4.prefab_name ~= "" and arg_481_1.actors_[var_484_4.prefab_name] ~= nil then
						local var_484_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_4.prefab_name].transform, "story_v_out_319511", "319511118", "story_v_out_319511.awb")

						arg_481_1:RecordAudio("319511118", var_484_10)
						arg_481_1:RecordAudio("319511118", var_484_10)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_319511", "319511118", "story_v_out_319511.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_319511", "319511118", "story_v_out_319511.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_11 = math.max(var_484_2, arg_481_1.talkMaxDuration)

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_11 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_1) / var_484_11

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_1 + var_484_11 and arg_481_1.time_ < var_484_1 + var_484_11 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play319511119 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 319511119
		arg_485_1.duration_ = 9.733

		local var_485_0 = {
			zh = 3.766,
			ja = 9.733
		}
		local var_485_1 = manager.audio:GetLocalizationFlag()

		if var_485_0[var_485_1] ~= nil then
			arg_485_1.duration_ = var_485_0[var_485_1]
		end

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play319511120(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.425

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_2 = arg_485_1:FormatText(StoryNameCfg[692].name)

				arg_485_1.leftNameTxt_.text = var_488_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_3 = arg_485_1:GetWordFromCfg(319511119)
				local var_488_4 = arg_485_1:FormatText(var_488_3.content)

				arg_485_1.text_.text = var_488_4

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_5 = 17
				local var_488_6 = utf8.len(var_488_4)
				local var_488_7 = var_488_5 <= 0 and var_488_1 or var_488_1 * (var_488_6 / var_488_5)

				if var_488_7 > 0 and var_488_1 < var_488_7 then
					arg_485_1.talkMaxDuration = var_488_7

					if var_488_7 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_7 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_4
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511119", "story_v_out_319511.awb") ~= 0 then
					local var_488_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511119", "story_v_out_319511.awb") / 1000

					if var_488_8 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_8 + var_488_0
					end

					if var_488_3.prefab_name ~= "" and arg_485_1.actors_[var_488_3.prefab_name] ~= nil then
						local var_488_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_3.prefab_name].transform, "story_v_out_319511", "319511119", "story_v_out_319511.awb")

						arg_485_1:RecordAudio("319511119", var_488_9)
						arg_485_1:RecordAudio("319511119", var_488_9)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_319511", "319511119", "story_v_out_319511.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_319511", "319511119", "story_v_out_319511.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_10 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_10 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_10

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_10 and arg_485_1.time_ < var_488_0 + var_488_10 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play319511120 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 319511120
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play319511121(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["10050ui_story"]
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 and arg_489_1.var_.characterEffect10050ui_story == nil then
				arg_489_1.var_.characterEffect10050ui_story = var_492_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_2 = 0.2

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2

				if arg_489_1.var_.characterEffect10050ui_story then
					local var_492_4 = Mathf.Lerp(0, 0.5, var_492_3)

					arg_489_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_489_1.var_.characterEffect10050ui_story.fillRatio = var_492_4
				end
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 and arg_489_1.var_.characterEffect10050ui_story then
				local var_492_5 = 0.5

				arg_489_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_489_1.var_.characterEffect10050ui_story.fillRatio = var_492_5
			end

			local var_492_6 = 0
			local var_492_7 = 0.75

			if var_492_6 < arg_489_1.time_ and arg_489_1.time_ <= var_492_6 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, false)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_8 = arg_489_1:GetWordFromCfg(319511120)
				local var_492_9 = arg_489_1:FormatText(var_492_8.content)

				arg_489_1.text_.text = var_492_9

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_10 = 30
				local var_492_11 = utf8.len(var_492_9)
				local var_492_12 = var_492_10 <= 0 and var_492_7 or var_492_7 * (var_492_11 / var_492_10)

				if var_492_12 > 0 and var_492_7 < var_492_12 then
					arg_489_1.talkMaxDuration = var_492_12

					if var_492_12 + var_492_6 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_12 + var_492_6
					end
				end

				arg_489_1.text_.text = var_492_9
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_13 = math.max(var_492_7, arg_489_1.talkMaxDuration)

			if var_492_6 <= arg_489_1.time_ and arg_489_1.time_ < var_492_6 + var_492_13 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_6) / var_492_13

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_6 + var_492_13 and arg_489_1.time_ < var_492_6 + var_492_13 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play319511121 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 319511121
		arg_493_1.duration_ = 4.433

		local var_493_0 = {
			zh = 3.366,
			ja = 4.433
		}
		local var_493_1 = manager.audio:GetLocalizationFlag()

		if var_493_0[var_493_1] ~= nil then
			arg_493_1.duration_ = var_493_0[var_493_1]
		end

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play319511122(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["10050ui_story"]
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 and arg_493_1.var_.characterEffect10050ui_story == nil then
				arg_493_1.var_.characterEffect10050ui_story = var_496_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_2 = 0.200000002980232

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2

				if arg_493_1.var_.characterEffect10050ui_story then
					arg_493_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 and arg_493_1.var_.characterEffect10050ui_story then
				arg_493_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_496_4 = 0

			if var_496_4 < arg_493_1.time_ and arg_493_1.time_ <= var_496_4 + arg_496_0 then
				arg_493_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action2_2")
			end

			local var_496_5 = 0

			if var_496_5 < arg_493_1.time_ and arg_493_1.time_ <= var_496_5 + arg_496_0 then
				arg_493_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_496_6 = arg_493_1.actors_["1084ui_story"]
			local var_496_7 = 0

			if var_496_7 < arg_493_1.time_ and arg_493_1.time_ <= var_496_7 + arg_496_0 and arg_493_1.var_.characterEffect1084ui_story == nil then
				arg_493_1.var_.characterEffect1084ui_story = var_496_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_8 = 0.200000002980232

			if var_496_7 <= arg_493_1.time_ and arg_493_1.time_ < var_496_7 + var_496_8 then
				local var_496_9 = (arg_493_1.time_ - var_496_7) / var_496_8

				if arg_493_1.var_.characterEffect1084ui_story then
					local var_496_10 = Mathf.Lerp(0, 0.5, var_496_9)

					arg_493_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_493_1.var_.characterEffect1084ui_story.fillRatio = var_496_10
				end
			end

			if arg_493_1.time_ >= var_496_7 + var_496_8 and arg_493_1.time_ < var_496_7 + var_496_8 + arg_496_0 and arg_493_1.var_.characterEffect1084ui_story then
				local var_496_11 = 0.5

				arg_493_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_493_1.var_.characterEffect1084ui_story.fillRatio = var_496_11
			end

			local var_496_12 = 0
			local var_496_13 = 0.3

			if var_496_12 < arg_493_1.time_ and arg_493_1.time_ <= var_496_12 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_14 = arg_493_1:FormatText(StoryNameCfg[692].name)

				arg_493_1.leftNameTxt_.text = var_496_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_15 = arg_493_1:GetWordFromCfg(319511121)
				local var_496_16 = arg_493_1:FormatText(var_496_15.content)

				arg_493_1.text_.text = var_496_16

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_17 = 12
				local var_496_18 = utf8.len(var_496_16)
				local var_496_19 = var_496_17 <= 0 and var_496_13 or var_496_13 * (var_496_18 / var_496_17)

				if var_496_19 > 0 and var_496_13 < var_496_19 then
					arg_493_1.talkMaxDuration = var_496_19

					if var_496_19 + var_496_12 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_19 + var_496_12
					end
				end

				arg_493_1.text_.text = var_496_16
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511121", "story_v_out_319511.awb") ~= 0 then
					local var_496_20 = manager.audio:GetVoiceLength("story_v_out_319511", "319511121", "story_v_out_319511.awb") / 1000

					if var_496_20 + var_496_12 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_20 + var_496_12
					end

					if var_496_15.prefab_name ~= "" and arg_493_1.actors_[var_496_15.prefab_name] ~= nil then
						local var_496_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_15.prefab_name].transform, "story_v_out_319511", "319511121", "story_v_out_319511.awb")

						arg_493_1:RecordAudio("319511121", var_496_21)
						arg_493_1:RecordAudio("319511121", var_496_21)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_319511", "319511121", "story_v_out_319511.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_319511", "319511121", "story_v_out_319511.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_22 = math.max(var_496_13, arg_493_1.talkMaxDuration)

			if var_496_12 <= arg_493_1.time_ and arg_493_1.time_ < var_496_12 + var_496_22 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_12) / var_496_22

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_12 + var_496_22 and arg_493_1.time_ < var_496_12 + var_496_22 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play319511122 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 319511122
		arg_497_1.duration_ = 3.3

		local var_497_0 = {
			zh = 2.5,
			ja = 3.3
		}
		local var_497_1 = manager.audio:GetLocalizationFlag()

		if var_497_0[var_497_1] ~= nil then
			arg_497_1.duration_ = var_497_0[var_497_1]
		end

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play319511123(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["10050ui_story"]
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 and arg_497_1.var_.characterEffect10050ui_story == nil then
				arg_497_1.var_.characterEffect10050ui_story = var_500_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_2 = 0.200000002980232

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2

				if arg_497_1.var_.characterEffect10050ui_story then
					local var_500_4 = Mathf.Lerp(0, 0.5, var_500_3)

					arg_497_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_497_1.var_.characterEffect10050ui_story.fillRatio = var_500_4
				end
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 and arg_497_1.var_.characterEffect10050ui_story then
				local var_500_5 = 0.5

				arg_497_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_497_1.var_.characterEffect10050ui_story.fillRatio = var_500_5
			end

			local var_500_6 = arg_497_1.actors_["1084ui_story"]
			local var_500_7 = 0

			if var_500_7 < arg_497_1.time_ and arg_497_1.time_ <= var_500_7 + arg_500_0 and arg_497_1.var_.characterEffect1084ui_story == nil then
				arg_497_1.var_.characterEffect1084ui_story = var_500_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_8 = 0.200000002980232

			if var_500_7 <= arg_497_1.time_ and arg_497_1.time_ < var_500_7 + var_500_8 then
				local var_500_9 = (arg_497_1.time_ - var_500_7) / var_500_8

				if arg_497_1.var_.characterEffect1084ui_story then
					arg_497_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_497_1.time_ >= var_500_7 + var_500_8 and arg_497_1.time_ < var_500_7 + var_500_8 + arg_500_0 and arg_497_1.var_.characterEffect1084ui_story then
				arg_497_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_500_10 = 0
			local var_500_11 = 0.225

			if var_500_10 < arg_497_1.time_ and arg_497_1.time_ <= var_500_10 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_12 = arg_497_1:FormatText(StoryNameCfg[6].name)

				arg_497_1.leftNameTxt_.text = var_500_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_13 = arg_497_1:GetWordFromCfg(319511122)
				local var_500_14 = arg_497_1:FormatText(var_500_13.content)

				arg_497_1.text_.text = var_500_14

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_15 = 9
				local var_500_16 = utf8.len(var_500_14)
				local var_500_17 = var_500_15 <= 0 and var_500_11 or var_500_11 * (var_500_16 / var_500_15)

				if var_500_17 > 0 and var_500_11 < var_500_17 then
					arg_497_1.talkMaxDuration = var_500_17

					if var_500_17 + var_500_10 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_17 + var_500_10
					end
				end

				arg_497_1.text_.text = var_500_14
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511122", "story_v_out_319511.awb") ~= 0 then
					local var_500_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511122", "story_v_out_319511.awb") / 1000

					if var_500_18 + var_500_10 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_18 + var_500_10
					end

					if var_500_13.prefab_name ~= "" and arg_497_1.actors_[var_500_13.prefab_name] ~= nil then
						local var_500_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_13.prefab_name].transform, "story_v_out_319511", "319511122", "story_v_out_319511.awb")

						arg_497_1:RecordAudio("319511122", var_500_19)
						arg_497_1:RecordAudio("319511122", var_500_19)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_319511", "319511122", "story_v_out_319511.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_319511", "319511122", "story_v_out_319511.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_20 = math.max(var_500_11, arg_497_1.talkMaxDuration)

			if var_500_10 <= arg_497_1.time_ and arg_497_1.time_ < var_500_10 + var_500_20 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_10) / var_500_20

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_10 + var_500_20 and arg_497_1.time_ < var_500_10 + var_500_20 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play319511123 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 319511123
		arg_501_1.duration_ = 17.133

		local var_501_0 = {
			zh = 9.433,
			ja = 17.133
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play319511124(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["1084ui_story"].transform
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 then
				arg_501_1.var_.moveOldPos1084ui_story = var_504_0.localPosition
			end

			local var_504_2 = 0.001

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2
				local var_504_4 = Vector3.New(0.7, -0.97, -6)

				var_504_0.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos1084ui_story, var_504_4, var_504_3)

				local var_504_5 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_5.x, var_504_5.y, var_504_5.z)

				local var_504_6 = var_504_0.localEulerAngles

				var_504_6.z = 0
				var_504_6.x = 0
				var_504_0.localEulerAngles = var_504_6
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 then
				var_504_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_504_7 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_7.x, var_504_7.y, var_504_7.z)

				local var_504_8 = var_504_0.localEulerAngles

				var_504_8.z = 0
				var_504_8.x = 0
				var_504_0.localEulerAngles = var_504_8
			end

			local var_504_9 = arg_501_1.actors_["1084ui_story"]
			local var_504_10 = 0

			if var_504_10 < arg_501_1.time_ and arg_501_1.time_ <= var_504_10 + arg_504_0 and arg_501_1.var_.characterEffect1084ui_story == nil then
				arg_501_1.var_.characterEffect1084ui_story = var_504_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_11 = 0.200000002980232

			if var_504_10 <= arg_501_1.time_ and arg_501_1.time_ < var_504_10 + var_504_11 then
				local var_504_12 = (arg_501_1.time_ - var_504_10) / var_504_11

				if arg_501_1.var_.characterEffect1084ui_story then
					local var_504_13 = Mathf.Lerp(0, 0.5, var_504_12)

					arg_501_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_501_1.var_.characterEffect1084ui_story.fillRatio = var_504_13
				end
			end

			if arg_501_1.time_ >= var_504_10 + var_504_11 and arg_501_1.time_ < var_504_10 + var_504_11 + arg_504_0 and arg_501_1.var_.characterEffect1084ui_story then
				local var_504_14 = 0.5

				arg_501_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_501_1.var_.characterEffect1084ui_story.fillRatio = var_504_14
			end

			local var_504_15 = arg_501_1.actors_["10050ui_story"]
			local var_504_16 = 0

			if var_504_16 < arg_501_1.time_ and arg_501_1.time_ <= var_504_16 + arg_504_0 and arg_501_1.var_.characterEffect10050ui_story == nil then
				arg_501_1.var_.characterEffect10050ui_story = var_504_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_17 = 0.200000002980232

			if var_504_16 <= arg_501_1.time_ and arg_501_1.time_ < var_504_16 + var_504_17 then
				local var_504_18 = (arg_501_1.time_ - var_504_16) / var_504_17

				if arg_501_1.var_.characterEffect10050ui_story then
					arg_501_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_16 + var_504_17 and arg_501_1.time_ < var_504_16 + var_504_17 + arg_504_0 and arg_501_1.var_.characterEffect10050ui_story then
				arg_501_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_504_19 = 0
			local var_504_20 = 0.925

			if var_504_19 < arg_501_1.time_ and arg_501_1.time_ <= var_504_19 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_21 = arg_501_1:FormatText(StoryNameCfg[692].name)

				arg_501_1.leftNameTxt_.text = var_504_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_22 = arg_501_1:GetWordFromCfg(319511123)
				local var_504_23 = arg_501_1:FormatText(var_504_22.content)

				arg_501_1.text_.text = var_504_23

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_24 = 37
				local var_504_25 = utf8.len(var_504_23)
				local var_504_26 = var_504_24 <= 0 and var_504_20 or var_504_20 * (var_504_25 / var_504_24)

				if var_504_26 > 0 and var_504_20 < var_504_26 then
					arg_501_1.talkMaxDuration = var_504_26

					if var_504_26 + var_504_19 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_26 + var_504_19
					end
				end

				arg_501_1.text_.text = var_504_23
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511123", "story_v_out_319511.awb") ~= 0 then
					local var_504_27 = manager.audio:GetVoiceLength("story_v_out_319511", "319511123", "story_v_out_319511.awb") / 1000

					if var_504_27 + var_504_19 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_27 + var_504_19
					end

					if var_504_22.prefab_name ~= "" and arg_501_1.actors_[var_504_22.prefab_name] ~= nil then
						local var_504_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_22.prefab_name].transform, "story_v_out_319511", "319511123", "story_v_out_319511.awb")

						arg_501_1:RecordAudio("319511123", var_504_28)
						arg_501_1:RecordAudio("319511123", var_504_28)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_319511", "319511123", "story_v_out_319511.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_319511", "319511123", "story_v_out_319511.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_29 = math.max(var_504_20, arg_501_1.talkMaxDuration)

			if var_504_19 <= arg_501_1.time_ and arg_501_1.time_ < var_504_19 + var_504_29 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_19) / var_504_29

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_19 + var_504_29 and arg_501_1.time_ < var_504_19 + var_504_29 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play319511124 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 319511124
		arg_505_1.duration_ = 12.6

		local var_505_0 = {
			zh = 4.133,
			ja = 12.6
		}
		local var_505_1 = manager.audio:GetLocalizationFlag()

		if var_505_0[var_505_1] ~= nil then
			arg_505_1.duration_ = var_505_0[var_505_1]
		end

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play319511125(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["1084ui_story"]
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 and arg_505_1.var_.characterEffect1084ui_story == nil then
				arg_505_1.var_.characterEffect1084ui_story = var_508_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_2 = 0.200000002980232

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2

				if arg_505_1.var_.characterEffect1084ui_story then
					arg_505_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 and arg_505_1.var_.characterEffect1084ui_story then
				arg_505_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_508_4 = arg_505_1.actors_["10050ui_story"]
			local var_508_5 = 0

			if var_508_5 < arg_505_1.time_ and arg_505_1.time_ <= var_508_5 + arg_508_0 and arg_505_1.var_.characterEffect10050ui_story == nil then
				arg_505_1.var_.characterEffect10050ui_story = var_508_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_6 = 0.200000002980232

			if var_508_5 <= arg_505_1.time_ and arg_505_1.time_ < var_508_5 + var_508_6 then
				local var_508_7 = (arg_505_1.time_ - var_508_5) / var_508_6

				if arg_505_1.var_.characterEffect10050ui_story then
					local var_508_8 = Mathf.Lerp(0, 0.5, var_508_7)

					arg_505_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_505_1.var_.characterEffect10050ui_story.fillRatio = var_508_8
				end
			end

			if arg_505_1.time_ >= var_508_5 + var_508_6 and arg_505_1.time_ < var_508_5 + var_508_6 + arg_508_0 and arg_505_1.var_.characterEffect10050ui_story then
				local var_508_9 = 0.5

				arg_505_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_505_1.var_.characterEffect10050ui_story.fillRatio = var_508_9
			end

			local var_508_10 = 0

			if var_508_10 < arg_505_1.time_ and arg_505_1.time_ <= var_508_10 + arg_508_0 then
				arg_505_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_508_11 = 0

			if var_508_11 < arg_505_1.time_ and arg_505_1.time_ <= var_508_11 + arg_508_0 then
				arg_505_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_508_12 = 0
			local var_508_13 = 0.425

			if var_508_12 < arg_505_1.time_ and arg_505_1.time_ <= var_508_12 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_14 = arg_505_1:FormatText(StoryNameCfg[6].name)

				arg_505_1.leftNameTxt_.text = var_508_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_15 = arg_505_1:GetWordFromCfg(319511124)
				local var_508_16 = arg_505_1:FormatText(var_508_15.content)

				arg_505_1.text_.text = var_508_16

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_17 = 17
				local var_508_18 = utf8.len(var_508_16)
				local var_508_19 = var_508_17 <= 0 and var_508_13 or var_508_13 * (var_508_18 / var_508_17)

				if var_508_19 > 0 and var_508_13 < var_508_19 then
					arg_505_1.talkMaxDuration = var_508_19

					if var_508_19 + var_508_12 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_19 + var_508_12
					end
				end

				arg_505_1.text_.text = var_508_16
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511124", "story_v_out_319511.awb") ~= 0 then
					local var_508_20 = manager.audio:GetVoiceLength("story_v_out_319511", "319511124", "story_v_out_319511.awb") / 1000

					if var_508_20 + var_508_12 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_20 + var_508_12
					end

					if var_508_15.prefab_name ~= "" and arg_505_1.actors_[var_508_15.prefab_name] ~= nil then
						local var_508_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_15.prefab_name].transform, "story_v_out_319511", "319511124", "story_v_out_319511.awb")

						arg_505_1:RecordAudio("319511124", var_508_21)
						arg_505_1:RecordAudio("319511124", var_508_21)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_319511", "319511124", "story_v_out_319511.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_319511", "319511124", "story_v_out_319511.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_22 = math.max(var_508_13, arg_505_1.talkMaxDuration)

			if var_508_12 <= arg_505_1.time_ and arg_505_1.time_ < var_508_12 + var_508_22 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_12) / var_508_22

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_12 + var_508_22 and arg_505_1.time_ < var_508_12 + var_508_22 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play319511125 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 319511125
		arg_509_1.duration_ = 5

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play319511126(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["1084ui_story"]
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 and arg_509_1.var_.characterEffect1084ui_story == nil then
				arg_509_1.var_.characterEffect1084ui_story = var_512_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_2 = 0.200000002980232

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2

				if arg_509_1.var_.characterEffect1084ui_story then
					local var_512_4 = Mathf.Lerp(0, 0.5, var_512_3)

					arg_509_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_509_1.var_.characterEffect1084ui_story.fillRatio = var_512_4
				end
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 and arg_509_1.var_.characterEffect1084ui_story then
				local var_512_5 = 0.5

				arg_509_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_509_1.var_.characterEffect1084ui_story.fillRatio = var_512_5
			end

			local var_512_6 = 0
			local var_512_7 = 0.8

			if var_512_6 < arg_509_1.time_ and arg_509_1.time_ <= var_512_6 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, false)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_8 = arg_509_1:GetWordFromCfg(319511125)
				local var_512_9 = arg_509_1:FormatText(var_512_8.content)

				arg_509_1.text_.text = var_512_9

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_10 = 32
				local var_512_11 = utf8.len(var_512_9)
				local var_512_12 = var_512_10 <= 0 and var_512_7 or var_512_7 * (var_512_11 / var_512_10)

				if var_512_12 > 0 and var_512_7 < var_512_12 then
					arg_509_1.talkMaxDuration = var_512_12

					if var_512_12 + var_512_6 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_12 + var_512_6
					end
				end

				arg_509_1.text_.text = var_512_9
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_13 = math.max(var_512_7, arg_509_1.talkMaxDuration)

			if var_512_6 <= arg_509_1.time_ and arg_509_1.time_ < var_512_6 + var_512_13 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_6) / var_512_13

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_6 + var_512_13 and arg_509_1.time_ < var_512_6 + var_512_13 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play319511126 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 319511126
		arg_513_1.duration_ = 10.6

		local var_513_0 = {
			zh = 2.6,
			ja = 10.6
		}
		local var_513_1 = manager.audio:GetLocalizationFlag()

		if var_513_0[var_513_1] ~= nil then
			arg_513_1.duration_ = var_513_0[var_513_1]
		end

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play319511127(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["1084ui_story"]
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 and arg_513_1.var_.characterEffect1084ui_story == nil then
				arg_513_1.var_.characterEffect1084ui_story = var_516_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_2 = 0.200000002980232

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2

				if arg_513_1.var_.characterEffect1084ui_story then
					arg_513_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 and arg_513_1.var_.characterEffect1084ui_story then
				arg_513_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_516_4 = 0
			local var_516_5 = 0.3

			if var_516_4 < arg_513_1.time_ and arg_513_1.time_ <= var_516_4 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_6 = arg_513_1:FormatText(StoryNameCfg[6].name)

				arg_513_1.leftNameTxt_.text = var_516_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_7 = arg_513_1:GetWordFromCfg(319511126)
				local var_516_8 = arg_513_1:FormatText(var_516_7.content)

				arg_513_1.text_.text = var_516_8

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_9 = 12
				local var_516_10 = utf8.len(var_516_8)
				local var_516_11 = var_516_9 <= 0 and var_516_5 or var_516_5 * (var_516_10 / var_516_9)

				if var_516_11 > 0 and var_516_5 < var_516_11 then
					arg_513_1.talkMaxDuration = var_516_11

					if var_516_11 + var_516_4 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_11 + var_516_4
					end
				end

				arg_513_1.text_.text = var_516_8
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511126", "story_v_out_319511.awb") ~= 0 then
					local var_516_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511126", "story_v_out_319511.awb") / 1000

					if var_516_12 + var_516_4 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_12 + var_516_4
					end

					if var_516_7.prefab_name ~= "" and arg_513_1.actors_[var_516_7.prefab_name] ~= nil then
						local var_516_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_7.prefab_name].transform, "story_v_out_319511", "319511126", "story_v_out_319511.awb")

						arg_513_1:RecordAudio("319511126", var_516_13)
						arg_513_1:RecordAudio("319511126", var_516_13)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_319511", "319511126", "story_v_out_319511.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_319511", "319511126", "story_v_out_319511.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_14 = math.max(var_516_5, arg_513_1.talkMaxDuration)

			if var_516_4 <= arg_513_1.time_ and arg_513_1.time_ < var_516_4 + var_516_14 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_4) / var_516_14

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_4 + var_516_14 and arg_513_1.time_ < var_516_4 + var_516_14 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play319511127 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 319511127
		arg_517_1.duration_ = 13.5

		local var_517_0 = {
			zh = 9.633,
			ja = 13.5
		}
		local var_517_1 = manager.audio:GetLocalizationFlag()

		if var_517_0[var_517_1] ~= nil then
			arg_517_1.duration_ = var_517_0[var_517_1]
		end

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play319511128(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["10050ui_story"].transform
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 then
				arg_517_1.var_.moveOldPos10050ui_story = var_520_0.localPosition
			end

			local var_520_2 = 0.001

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2
				local var_520_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_520_0.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos10050ui_story, var_520_4, var_520_3)

				local var_520_5 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_5.x, var_520_5.y, var_520_5.z)

				local var_520_6 = var_520_0.localEulerAngles

				var_520_6.z = 0
				var_520_6.x = 0
				var_520_0.localEulerAngles = var_520_6
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 then
				var_520_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_520_7 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_7.x, var_520_7.y, var_520_7.z)

				local var_520_8 = var_520_0.localEulerAngles

				var_520_8.z = 0
				var_520_8.x = 0
				var_520_0.localEulerAngles = var_520_8
			end

			local var_520_9 = arg_517_1.actors_["10050ui_story"]
			local var_520_10 = 0

			if var_520_10 < arg_517_1.time_ and arg_517_1.time_ <= var_520_10 + arg_520_0 and arg_517_1.var_.characterEffect10050ui_story == nil then
				arg_517_1.var_.characterEffect10050ui_story = var_520_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_11 = 0.200000002980232

			if var_520_10 <= arg_517_1.time_ and arg_517_1.time_ < var_520_10 + var_520_11 then
				local var_520_12 = (arg_517_1.time_ - var_520_10) / var_520_11

				if arg_517_1.var_.characterEffect10050ui_story then
					arg_517_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_517_1.time_ >= var_520_10 + var_520_11 and arg_517_1.time_ < var_520_10 + var_520_11 + arg_520_0 and arg_517_1.var_.characterEffect10050ui_story then
				arg_517_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_520_13 = 0

			if var_520_13 < arg_517_1.time_ and arg_517_1.time_ <= var_520_13 + arg_520_0 then
				arg_517_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action6_1")
			end

			local var_520_14 = 0

			if var_520_14 < arg_517_1.time_ and arg_517_1.time_ <= var_520_14 + arg_520_0 then
				arg_517_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_520_15 = arg_517_1.actors_["1084ui_story"]
			local var_520_16 = 0

			if var_520_16 < arg_517_1.time_ and arg_517_1.time_ <= var_520_16 + arg_520_0 and arg_517_1.var_.characterEffect1084ui_story == nil then
				arg_517_1.var_.characterEffect1084ui_story = var_520_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_17 = 0.200000002980232

			if var_520_16 <= arg_517_1.time_ and arg_517_1.time_ < var_520_16 + var_520_17 then
				local var_520_18 = (arg_517_1.time_ - var_520_16) / var_520_17

				if arg_517_1.var_.characterEffect1084ui_story then
					local var_520_19 = Mathf.Lerp(0, 0.5, var_520_18)

					arg_517_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_517_1.var_.characterEffect1084ui_story.fillRatio = var_520_19
				end
			end

			if arg_517_1.time_ >= var_520_16 + var_520_17 and arg_517_1.time_ < var_520_16 + var_520_17 + arg_520_0 and arg_517_1.var_.characterEffect1084ui_story then
				local var_520_20 = 0.5

				arg_517_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_517_1.var_.characterEffect1084ui_story.fillRatio = var_520_20
			end

			local var_520_21 = 0
			local var_520_22 = 0.9

			if var_520_21 < arg_517_1.time_ and arg_517_1.time_ <= var_520_21 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_23 = arg_517_1:FormatText(StoryNameCfg[692].name)

				arg_517_1.leftNameTxt_.text = var_520_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_24 = arg_517_1:GetWordFromCfg(319511127)
				local var_520_25 = arg_517_1:FormatText(var_520_24.content)

				arg_517_1.text_.text = var_520_25

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_26 = 36
				local var_520_27 = utf8.len(var_520_25)
				local var_520_28 = var_520_26 <= 0 and var_520_22 or var_520_22 * (var_520_27 / var_520_26)

				if var_520_28 > 0 and var_520_22 < var_520_28 then
					arg_517_1.talkMaxDuration = var_520_28

					if var_520_28 + var_520_21 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_28 + var_520_21
					end
				end

				arg_517_1.text_.text = var_520_25
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511127", "story_v_out_319511.awb") ~= 0 then
					local var_520_29 = manager.audio:GetVoiceLength("story_v_out_319511", "319511127", "story_v_out_319511.awb") / 1000

					if var_520_29 + var_520_21 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_29 + var_520_21
					end

					if var_520_24.prefab_name ~= "" and arg_517_1.actors_[var_520_24.prefab_name] ~= nil then
						local var_520_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_24.prefab_name].transform, "story_v_out_319511", "319511127", "story_v_out_319511.awb")

						arg_517_1:RecordAudio("319511127", var_520_30)
						arg_517_1:RecordAudio("319511127", var_520_30)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_319511", "319511127", "story_v_out_319511.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_319511", "319511127", "story_v_out_319511.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_31 = math.max(var_520_22, arg_517_1.talkMaxDuration)

			if var_520_21 <= arg_517_1.time_ and arg_517_1.time_ < var_520_21 + var_520_31 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_21) / var_520_31

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_21 + var_520_31 and arg_517_1.time_ < var_520_21 + var_520_31 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play319511128 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 319511128
		arg_521_1.duration_ = 6.033

		local var_521_0 = {
			zh = 6.033,
			ja = 2.766
		}
		local var_521_1 = manager.audio:GetLocalizationFlag()

		if var_521_0[var_521_1] ~= nil then
			arg_521_1.duration_ = var_521_0[var_521_1]
		end

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play319511129(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["10050ui_story"]
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 and arg_521_1.var_.characterEffect10050ui_story == nil then
				arg_521_1.var_.characterEffect10050ui_story = var_524_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_2 = 0.200000002980232

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2

				if arg_521_1.var_.characterEffect10050ui_story then
					local var_524_4 = Mathf.Lerp(0, 0.5, var_524_3)

					arg_521_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_521_1.var_.characterEffect10050ui_story.fillRatio = var_524_4
				end
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 and arg_521_1.var_.characterEffect10050ui_story then
				local var_524_5 = 0.5

				arg_521_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_521_1.var_.characterEffect10050ui_story.fillRatio = var_524_5
			end

			local var_524_6 = arg_521_1.actors_["1084ui_story"]
			local var_524_7 = 0

			if var_524_7 < arg_521_1.time_ and arg_521_1.time_ <= var_524_7 + arg_524_0 and arg_521_1.var_.characterEffect1084ui_story == nil then
				arg_521_1.var_.characterEffect1084ui_story = var_524_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_8 = 0.200000002980232

			if var_524_7 <= arg_521_1.time_ and arg_521_1.time_ < var_524_7 + var_524_8 then
				local var_524_9 = (arg_521_1.time_ - var_524_7) / var_524_8

				if arg_521_1.var_.characterEffect1084ui_story then
					arg_521_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_7 + var_524_8 and arg_521_1.time_ < var_524_7 + var_524_8 + arg_524_0 and arg_521_1.var_.characterEffect1084ui_story then
				arg_521_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_524_10 = 0
			local var_524_11 = 0.775

			if var_524_10 < arg_521_1.time_ and arg_521_1.time_ <= var_524_10 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_12 = arg_521_1:FormatText(StoryNameCfg[6].name)

				arg_521_1.leftNameTxt_.text = var_524_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_13 = arg_521_1:GetWordFromCfg(319511128)
				local var_524_14 = arg_521_1:FormatText(var_524_13.content)

				arg_521_1.text_.text = var_524_14

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_15 = 31
				local var_524_16 = utf8.len(var_524_14)
				local var_524_17 = var_524_15 <= 0 and var_524_11 or var_524_11 * (var_524_16 / var_524_15)

				if var_524_17 > 0 and var_524_11 < var_524_17 then
					arg_521_1.talkMaxDuration = var_524_17

					if var_524_17 + var_524_10 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_17 + var_524_10
					end
				end

				arg_521_1.text_.text = var_524_14
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511128", "story_v_out_319511.awb") ~= 0 then
					local var_524_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511128", "story_v_out_319511.awb") / 1000

					if var_524_18 + var_524_10 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_18 + var_524_10
					end

					if var_524_13.prefab_name ~= "" and arg_521_1.actors_[var_524_13.prefab_name] ~= nil then
						local var_524_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_13.prefab_name].transform, "story_v_out_319511", "319511128", "story_v_out_319511.awb")

						arg_521_1:RecordAudio("319511128", var_524_19)
						arg_521_1:RecordAudio("319511128", var_524_19)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_319511", "319511128", "story_v_out_319511.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_319511", "319511128", "story_v_out_319511.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_20 = math.max(var_524_11, arg_521_1.talkMaxDuration)

			if var_524_10 <= arg_521_1.time_ and arg_521_1.time_ < var_524_10 + var_524_20 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_10) / var_524_20

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_10 + var_524_20 and arg_521_1.time_ < var_524_10 + var_524_20 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play319511129 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 319511129
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play319511130(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["1084ui_story"]
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 and arg_525_1.var_.characterEffect1084ui_story == nil then
				arg_525_1.var_.characterEffect1084ui_story = var_528_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_2 = 0.200000002980232

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2

				if arg_525_1.var_.characterEffect1084ui_story then
					local var_528_4 = Mathf.Lerp(0, 0.5, var_528_3)

					arg_525_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_525_1.var_.characterEffect1084ui_story.fillRatio = var_528_4
				end
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 and arg_525_1.var_.characterEffect1084ui_story then
				local var_528_5 = 0.5

				arg_525_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_525_1.var_.characterEffect1084ui_story.fillRatio = var_528_5
			end

			local var_528_6 = 0
			local var_528_7 = 1.425

			if var_528_6 < arg_525_1.time_ and arg_525_1.time_ <= var_528_6 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, false)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_8 = arg_525_1:GetWordFromCfg(319511129)
				local var_528_9 = arg_525_1:FormatText(var_528_8.content)

				arg_525_1.text_.text = var_528_9

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_10 = 57
				local var_528_11 = utf8.len(var_528_9)
				local var_528_12 = var_528_10 <= 0 and var_528_7 or var_528_7 * (var_528_11 / var_528_10)

				if var_528_12 > 0 and var_528_7 < var_528_12 then
					arg_525_1.talkMaxDuration = var_528_12

					if var_528_12 + var_528_6 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_12 + var_528_6
					end
				end

				arg_525_1.text_.text = var_528_9
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_13 = math.max(var_528_7, arg_525_1.talkMaxDuration)

			if var_528_6 <= arg_525_1.time_ and arg_525_1.time_ < var_528_6 + var_528_13 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_6) / var_528_13

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_6 + var_528_13 and arg_525_1.time_ < var_528_6 + var_528_13 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play319511130 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 319511130
		arg_529_1.duration_ = 5.9

		local var_529_0 = {
			zh = 4.266,
			ja = 5.9
		}
		local var_529_1 = manager.audio:GetLocalizationFlag()

		if var_529_0[var_529_1] ~= nil then
			arg_529_1.duration_ = var_529_0[var_529_1]
		end

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play319511131(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["10050ui_story"]
			local var_532_1 = 0

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 and arg_529_1.var_.characterEffect10050ui_story == nil then
				arg_529_1.var_.characterEffect10050ui_story = var_532_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_2 = 0.200000002980232

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2

				if arg_529_1.var_.characterEffect10050ui_story then
					arg_529_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_529_1.time_ >= var_532_1 + var_532_2 and arg_529_1.time_ < var_532_1 + var_532_2 + arg_532_0 and arg_529_1.var_.characterEffect10050ui_story then
				arg_529_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_532_4 = 0

			if var_532_4 < arg_529_1.time_ and arg_529_1.time_ <= var_532_4 + arg_532_0 then
				arg_529_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_532_5 = 0
			local var_532_6 = 0.475

			if var_532_5 < arg_529_1.time_ and arg_529_1.time_ <= var_532_5 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_7 = arg_529_1:FormatText(StoryNameCfg[692].name)

				arg_529_1.leftNameTxt_.text = var_532_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_8 = arg_529_1:GetWordFromCfg(319511130)
				local var_532_9 = arg_529_1:FormatText(var_532_8.content)

				arg_529_1.text_.text = var_532_9

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_10 = 19
				local var_532_11 = utf8.len(var_532_9)
				local var_532_12 = var_532_10 <= 0 and var_532_6 or var_532_6 * (var_532_11 / var_532_10)

				if var_532_12 > 0 and var_532_6 < var_532_12 then
					arg_529_1.talkMaxDuration = var_532_12

					if var_532_12 + var_532_5 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_12 + var_532_5
					end
				end

				arg_529_1.text_.text = var_532_9
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511130", "story_v_out_319511.awb") ~= 0 then
					local var_532_13 = manager.audio:GetVoiceLength("story_v_out_319511", "319511130", "story_v_out_319511.awb") / 1000

					if var_532_13 + var_532_5 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_13 + var_532_5
					end

					if var_532_8.prefab_name ~= "" and arg_529_1.actors_[var_532_8.prefab_name] ~= nil then
						local var_532_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_529_1.actors_[var_532_8.prefab_name].transform, "story_v_out_319511", "319511130", "story_v_out_319511.awb")

						arg_529_1:RecordAudio("319511130", var_532_14)
						arg_529_1:RecordAudio("319511130", var_532_14)
					else
						arg_529_1:AudioAction("play", "voice", "story_v_out_319511", "319511130", "story_v_out_319511.awb")
					end

					arg_529_1:RecordHistoryTalkVoice("story_v_out_319511", "319511130", "story_v_out_319511.awb")
				end

				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_15 = math.max(var_532_6, arg_529_1.talkMaxDuration)

			if var_532_5 <= arg_529_1.time_ and arg_529_1.time_ < var_532_5 + var_532_15 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_5) / var_532_15

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_5 + var_532_15 and arg_529_1.time_ < var_532_5 + var_532_15 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play319511131 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 319511131
		arg_533_1.duration_ = 6.966

		local var_533_0 = {
			zh = 5.4,
			ja = 6.966
		}
		local var_533_1 = manager.audio:GetLocalizationFlag()

		if var_533_0[var_533_1] ~= nil then
			arg_533_1.duration_ = var_533_0[var_533_1]
		end

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play319511132(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = arg_533_1.actors_["1084ui_story"]
			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 and arg_533_1.var_.characterEffect1084ui_story == nil then
				arg_533_1.var_.characterEffect1084ui_story = var_536_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_2 = 0.200000002980232

			if var_536_1 <= arg_533_1.time_ and arg_533_1.time_ < var_536_1 + var_536_2 then
				local var_536_3 = (arg_533_1.time_ - var_536_1) / var_536_2

				if arg_533_1.var_.characterEffect1084ui_story then
					arg_533_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_533_1.time_ >= var_536_1 + var_536_2 and arg_533_1.time_ < var_536_1 + var_536_2 + arg_536_0 and arg_533_1.var_.characterEffect1084ui_story then
				arg_533_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_536_4 = arg_533_1.actors_["10050ui_story"]
			local var_536_5 = 0

			if var_536_5 < arg_533_1.time_ and arg_533_1.time_ <= var_536_5 + arg_536_0 and arg_533_1.var_.characterEffect10050ui_story == nil then
				arg_533_1.var_.characterEffect10050ui_story = var_536_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_6 = 0.200000002980232

			if var_536_5 <= arg_533_1.time_ and arg_533_1.time_ < var_536_5 + var_536_6 then
				local var_536_7 = (arg_533_1.time_ - var_536_5) / var_536_6

				if arg_533_1.var_.characterEffect10050ui_story then
					local var_536_8 = Mathf.Lerp(0, 0.5, var_536_7)

					arg_533_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_533_1.var_.characterEffect10050ui_story.fillRatio = var_536_8
				end
			end

			if arg_533_1.time_ >= var_536_5 + var_536_6 and arg_533_1.time_ < var_536_5 + var_536_6 + arg_536_0 and arg_533_1.var_.characterEffect10050ui_story then
				local var_536_9 = 0.5

				arg_533_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_533_1.var_.characterEffect10050ui_story.fillRatio = var_536_9
			end

			local var_536_10 = 0
			local var_536_11 = 0.7

			if var_536_10 < arg_533_1.time_ and arg_533_1.time_ <= var_536_10 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_12 = arg_533_1:FormatText(StoryNameCfg[6].name)

				arg_533_1.leftNameTxt_.text = var_536_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_13 = arg_533_1:GetWordFromCfg(319511131)
				local var_536_14 = arg_533_1:FormatText(var_536_13.content)

				arg_533_1.text_.text = var_536_14

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_15 = 28
				local var_536_16 = utf8.len(var_536_14)
				local var_536_17 = var_536_15 <= 0 and var_536_11 or var_536_11 * (var_536_16 / var_536_15)

				if var_536_17 > 0 and var_536_11 < var_536_17 then
					arg_533_1.talkMaxDuration = var_536_17

					if var_536_17 + var_536_10 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_17 + var_536_10
					end
				end

				arg_533_1.text_.text = var_536_14
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511131", "story_v_out_319511.awb") ~= 0 then
					local var_536_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511131", "story_v_out_319511.awb") / 1000

					if var_536_18 + var_536_10 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_18 + var_536_10
					end

					if var_536_13.prefab_name ~= "" and arg_533_1.actors_[var_536_13.prefab_name] ~= nil then
						local var_536_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_533_1.actors_[var_536_13.prefab_name].transform, "story_v_out_319511", "319511131", "story_v_out_319511.awb")

						arg_533_1:RecordAudio("319511131", var_536_19)
						arg_533_1:RecordAudio("319511131", var_536_19)
					else
						arg_533_1:AudioAction("play", "voice", "story_v_out_319511", "319511131", "story_v_out_319511.awb")
					end

					arg_533_1:RecordHistoryTalkVoice("story_v_out_319511", "319511131", "story_v_out_319511.awb")
				end

				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_20 = math.max(var_536_11, arg_533_1.talkMaxDuration)

			if var_536_10 <= arg_533_1.time_ and arg_533_1.time_ < var_536_10 + var_536_20 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_10) / var_536_20

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_10 + var_536_20 and arg_533_1.time_ < var_536_10 + var_536_20 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play319511132 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 319511132
		arg_537_1.duration_ = 8.166

		local var_537_0 = {
			zh = 3.833,
			ja = 8.166
		}
		local var_537_1 = manager.audio:GetLocalizationFlag()

		if var_537_0[var_537_1] ~= nil then
			arg_537_1.duration_ = var_537_0[var_537_1]
		end

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play319511133(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = 0

			if var_540_0 < arg_537_1.time_ and arg_537_1.time_ <= var_540_0 + arg_540_0 then
				arg_537_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 then
				arg_537_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_540_2 = 0
			local var_540_3 = 0.5

			if var_540_2 < arg_537_1.time_ and arg_537_1.time_ <= var_540_2 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_4 = arg_537_1:FormatText(StoryNameCfg[6].name)

				arg_537_1.leftNameTxt_.text = var_540_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_5 = arg_537_1:GetWordFromCfg(319511132)
				local var_540_6 = arg_537_1:FormatText(var_540_5.content)

				arg_537_1.text_.text = var_540_6

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_7 = 20
				local var_540_8 = utf8.len(var_540_6)
				local var_540_9 = var_540_7 <= 0 and var_540_3 or var_540_3 * (var_540_8 / var_540_7)

				if var_540_9 > 0 and var_540_3 < var_540_9 then
					arg_537_1.talkMaxDuration = var_540_9

					if var_540_9 + var_540_2 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_9 + var_540_2
					end
				end

				arg_537_1.text_.text = var_540_6
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511132", "story_v_out_319511.awb") ~= 0 then
					local var_540_10 = manager.audio:GetVoiceLength("story_v_out_319511", "319511132", "story_v_out_319511.awb") / 1000

					if var_540_10 + var_540_2 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_10 + var_540_2
					end

					if var_540_5.prefab_name ~= "" and arg_537_1.actors_[var_540_5.prefab_name] ~= nil then
						local var_540_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_5.prefab_name].transform, "story_v_out_319511", "319511132", "story_v_out_319511.awb")

						arg_537_1:RecordAudio("319511132", var_540_11)
						arg_537_1:RecordAudio("319511132", var_540_11)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_319511", "319511132", "story_v_out_319511.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_319511", "319511132", "story_v_out_319511.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_12 = math.max(var_540_3, arg_537_1.talkMaxDuration)

			if var_540_2 <= arg_537_1.time_ and arg_537_1.time_ < var_540_2 + var_540_12 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_2) / var_540_12

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_2 + var_540_12 and arg_537_1.time_ < var_540_2 + var_540_12 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play319511133 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 319511133
		arg_541_1.duration_ = 2

		local var_541_0 = {
			zh = 2,
			ja = 1.999999999999
		}
		local var_541_1 = manager.audio:GetLocalizationFlag()

		if var_541_0[var_541_1] ~= nil then
			arg_541_1.duration_ = var_541_0[var_541_1]
		end

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play319511134(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = arg_541_1.actors_["1084ui_story"]
			local var_544_1 = 0

			if var_544_1 < arg_541_1.time_ and arg_541_1.time_ <= var_544_1 + arg_544_0 and arg_541_1.var_.characterEffect1084ui_story == nil then
				arg_541_1.var_.characterEffect1084ui_story = var_544_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_544_2 = 0.200000002980232

			if var_544_1 <= arg_541_1.time_ and arg_541_1.time_ < var_544_1 + var_544_2 then
				local var_544_3 = (arg_541_1.time_ - var_544_1) / var_544_2

				if arg_541_1.var_.characterEffect1084ui_story then
					local var_544_4 = Mathf.Lerp(0, 0.5, var_544_3)

					arg_541_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_541_1.var_.characterEffect1084ui_story.fillRatio = var_544_4
				end
			end

			if arg_541_1.time_ >= var_544_1 + var_544_2 and arg_541_1.time_ < var_544_1 + var_544_2 + arg_544_0 and arg_541_1.var_.characterEffect1084ui_story then
				local var_544_5 = 0.5

				arg_541_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_541_1.var_.characterEffect1084ui_story.fillRatio = var_544_5
			end

			local var_544_6 = arg_541_1.actors_["10050ui_story"]
			local var_544_7 = 0

			if var_544_7 < arg_541_1.time_ and arg_541_1.time_ <= var_544_7 + arg_544_0 and arg_541_1.var_.characterEffect10050ui_story == nil then
				arg_541_1.var_.characterEffect10050ui_story = var_544_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_544_8 = 0.200000002980232

			if var_544_7 <= arg_541_1.time_ and arg_541_1.time_ < var_544_7 + var_544_8 then
				local var_544_9 = (arg_541_1.time_ - var_544_7) / var_544_8

				if arg_541_1.var_.characterEffect10050ui_story then
					arg_541_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_541_1.time_ >= var_544_7 + var_544_8 and arg_541_1.time_ < var_544_7 + var_544_8 + arg_544_0 and arg_541_1.var_.characterEffect10050ui_story then
				arg_541_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_544_10 = 0

			if var_544_10 < arg_541_1.time_ and arg_541_1.time_ <= var_544_10 + arg_544_0 then
				arg_541_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action6_2")
			end

			local var_544_11 = 0

			if var_544_11 < arg_541_1.time_ and arg_541_1.time_ <= var_544_11 + arg_544_0 then
				arg_541_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_544_12 = 0
			local var_544_13 = 0.125

			if var_544_12 < arg_541_1.time_ and arg_541_1.time_ <= var_544_12 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_14 = arg_541_1:FormatText(StoryNameCfg[692].name)

				arg_541_1.leftNameTxt_.text = var_544_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_15 = arg_541_1:GetWordFromCfg(319511133)
				local var_544_16 = arg_541_1:FormatText(var_544_15.content)

				arg_541_1.text_.text = var_544_16

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_17 = 5
				local var_544_18 = utf8.len(var_544_16)
				local var_544_19 = var_544_17 <= 0 and var_544_13 or var_544_13 * (var_544_18 / var_544_17)

				if var_544_19 > 0 and var_544_13 < var_544_19 then
					arg_541_1.talkMaxDuration = var_544_19

					if var_544_19 + var_544_12 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_19 + var_544_12
					end
				end

				arg_541_1.text_.text = var_544_16
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511133", "story_v_out_319511.awb") ~= 0 then
					local var_544_20 = manager.audio:GetVoiceLength("story_v_out_319511", "319511133", "story_v_out_319511.awb") / 1000

					if var_544_20 + var_544_12 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_20 + var_544_12
					end

					if var_544_15.prefab_name ~= "" and arg_541_1.actors_[var_544_15.prefab_name] ~= nil then
						local var_544_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_15.prefab_name].transform, "story_v_out_319511", "319511133", "story_v_out_319511.awb")

						arg_541_1:RecordAudio("319511133", var_544_21)
						arg_541_1:RecordAudio("319511133", var_544_21)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_319511", "319511133", "story_v_out_319511.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_319511", "319511133", "story_v_out_319511.awb")
				end

				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_22 = math.max(var_544_13, arg_541_1.talkMaxDuration)

			if var_544_12 <= arg_541_1.time_ and arg_541_1.time_ < var_544_12 + var_544_22 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_12) / var_544_22

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_12 + var_544_22 and arg_541_1.time_ < var_544_12 + var_544_22 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play319511134 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 319511134
		arg_545_1.duration_ = 5

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play319511135(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = arg_545_1.actors_["10050ui_story"]
			local var_548_1 = 0

			if var_548_1 < arg_545_1.time_ and arg_545_1.time_ <= var_548_1 + arg_548_0 and arg_545_1.var_.characterEffect10050ui_story == nil then
				arg_545_1.var_.characterEffect10050ui_story = var_548_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_548_2 = 0.200000002980232

			if var_548_1 <= arg_545_1.time_ and arg_545_1.time_ < var_548_1 + var_548_2 then
				local var_548_3 = (arg_545_1.time_ - var_548_1) / var_548_2

				if arg_545_1.var_.characterEffect10050ui_story then
					local var_548_4 = Mathf.Lerp(0, 0.5, var_548_3)

					arg_545_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_545_1.var_.characterEffect10050ui_story.fillRatio = var_548_4
				end
			end

			if arg_545_1.time_ >= var_548_1 + var_548_2 and arg_545_1.time_ < var_548_1 + var_548_2 + arg_548_0 and arg_545_1.var_.characterEffect10050ui_story then
				local var_548_5 = 0.5

				arg_545_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_545_1.var_.characterEffect10050ui_story.fillRatio = var_548_5
			end

			local var_548_6 = 0
			local var_548_7 = 0.575

			if var_548_6 < arg_545_1.time_ and arg_545_1.time_ <= var_548_6 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, false)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_8 = arg_545_1:GetWordFromCfg(319511134)
				local var_548_9 = arg_545_1:FormatText(var_548_8.content)

				arg_545_1.text_.text = var_548_9

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_10 = 23
				local var_548_11 = utf8.len(var_548_9)
				local var_548_12 = var_548_10 <= 0 and var_548_7 or var_548_7 * (var_548_11 / var_548_10)

				if var_548_12 > 0 and var_548_7 < var_548_12 then
					arg_545_1.talkMaxDuration = var_548_12

					if var_548_12 + var_548_6 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_12 + var_548_6
					end
				end

				arg_545_1.text_.text = var_548_9
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)
				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_13 = math.max(var_548_7, arg_545_1.talkMaxDuration)

			if var_548_6 <= arg_545_1.time_ and arg_545_1.time_ < var_548_6 + var_548_13 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_6) / var_548_13

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_6 + var_548_13 and arg_545_1.time_ < var_548_6 + var_548_13 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play319511135 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 319511135
		arg_549_1.duration_ = 11.8

		local var_549_0 = {
			zh = 5.1,
			ja = 11.8
		}
		local var_549_1 = manager.audio:GetLocalizationFlag()

		if var_549_0[var_549_1] ~= nil then
			arg_549_1.duration_ = var_549_0[var_549_1]
		end

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play319511136(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["10050ui_story"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 and arg_549_1.var_.characterEffect10050ui_story == nil then
				arg_549_1.var_.characterEffect10050ui_story = var_552_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_2 = 0.200000002980232

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_2 then
				local var_552_3 = (arg_549_1.time_ - var_552_1) / var_552_2

				if arg_549_1.var_.characterEffect10050ui_story then
					arg_549_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 and arg_549_1.var_.characterEffect10050ui_story then
				arg_549_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_552_4 = 0
			local var_552_5 = 0.425

			if var_552_4 < arg_549_1.time_ and arg_549_1.time_ <= var_552_4 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_6 = arg_549_1:FormatText(StoryNameCfg[692].name)

				arg_549_1.leftNameTxt_.text = var_552_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_7 = arg_549_1:GetWordFromCfg(319511135)
				local var_552_8 = arg_549_1:FormatText(var_552_7.content)

				arg_549_1.text_.text = var_552_8

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_9 = 17
				local var_552_10 = utf8.len(var_552_8)
				local var_552_11 = var_552_9 <= 0 and var_552_5 or var_552_5 * (var_552_10 / var_552_9)

				if var_552_11 > 0 and var_552_5 < var_552_11 then
					arg_549_1.talkMaxDuration = var_552_11

					if var_552_11 + var_552_4 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_11 + var_552_4
					end
				end

				arg_549_1.text_.text = var_552_8
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511135", "story_v_out_319511.awb") ~= 0 then
					local var_552_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511135", "story_v_out_319511.awb") / 1000

					if var_552_12 + var_552_4 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_12 + var_552_4
					end

					if var_552_7.prefab_name ~= "" and arg_549_1.actors_[var_552_7.prefab_name] ~= nil then
						local var_552_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_549_1.actors_[var_552_7.prefab_name].transform, "story_v_out_319511", "319511135", "story_v_out_319511.awb")

						arg_549_1:RecordAudio("319511135", var_552_13)
						arg_549_1:RecordAudio("319511135", var_552_13)
					else
						arg_549_1:AudioAction("play", "voice", "story_v_out_319511", "319511135", "story_v_out_319511.awb")
					end

					arg_549_1:RecordHistoryTalkVoice("story_v_out_319511", "319511135", "story_v_out_319511.awb")
				end

				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_14 = math.max(var_552_5, arg_549_1.talkMaxDuration)

			if var_552_4 <= arg_549_1.time_ and arg_549_1.time_ < var_552_4 + var_552_14 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_4) / var_552_14

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_4 + var_552_14 and arg_549_1.time_ < var_552_4 + var_552_14 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play319511136 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 319511136
		arg_553_1.duration_ = 8.5

		local var_553_0 = {
			zh = 4.3,
			ja = 8.5
		}
		local var_553_1 = manager.audio:GetLocalizationFlag()

		if var_553_0[var_553_1] ~= nil then
			arg_553_1.duration_ = var_553_0[var_553_1]
		end

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play319511137(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = 0
			local var_556_1 = 0.55

			if var_556_0 < arg_553_1.time_ and arg_553_1.time_ <= var_556_0 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_2 = arg_553_1:FormatText(StoryNameCfg[692].name)

				arg_553_1.leftNameTxt_.text = var_556_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_3 = arg_553_1:GetWordFromCfg(319511136)
				local var_556_4 = arg_553_1:FormatText(var_556_3.content)

				arg_553_1.text_.text = var_556_4

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_5 = 22
				local var_556_6 = utf8.len(var_556_4)
				local var_556_7 = var_556_5 <= 0 and var_556_1 or var_556_1 * (var_556_6 / var_556_5)

				if var_556_7 > 0 and var_556_1 < var_556_7 then
					arg_553_1.talkMaxDuration = var_556_7

					if var_556_7 + var_556_0 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_7 + var_556_0
					end
				end

				arg_553_1.text_.text = var_556_4
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511136", "story_v_out_319511.awb") ~= 0 then
					local var_556_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511136", "story_v_out_319511.awb") / 1000

					if var_556_8 + var_556_0 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_8 + var_556_0
					end

					if var_556_3.prefab_name ~= "" and arg_553_1.actors_[var_556_3.prefab_name] ~= nil then
						local var_556_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_553_1.actors_[var_556_3.prefab_name].transform, "story_v_out_319511", "319511136", "story_v_out_319511.awb")

						arg_553_1:RecordAudio("319511136", var_556_9)
						arg_553_1:RecordAudio("319511136", var_556_9)
					else
						arg_553_1:AudioAction("play", "voice", "story_v_out_319511", "319511136", "story_v_out_319511.awb")
					end

					arg_553_1:RecordHistoryTalkVoice("story_v_out_319511", "319511136", "story_v_out_319511.awb")
				end

				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_10 = math.max(var_556_1, arg_553_1.talkMaxDuration)

			if var_556_0 <= arg_553_1.time_ and arg_553_1.time_ < var_556_0 + var_556_10 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_0) / var_556_10

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_0 + var_556_10 and arg_553_1.time_ < var_556_0 + var_556_10 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play319511137 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 319511137
		arg_557_1.duration_ = 4.633

		local var_557_0 = {
			zh = 3.7,
			ja = 4.633
		}
		local var_557_1 = manager.audio:GetLocalizationFlag()

		if var_557_0[var_557_1] ~= nil then
			arg_557_1.duration_ = var_557_0[var_557_1]
		end

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play319511138(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = arg_557_1.actors_["1084ui_story"]
			local var_560_1 = 0

			if var_560_1 < arg_557_1.time_ and arg_557_1.time_ <= var_560_1 + arg_560_0 and arg_557_1.var_.characterEffect1084ui_story == nil then
				arg_557_1.var_.characterEffect1084ui_story = var_560_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_560_2 = 0.200000002980232

			if var_560_1 <= arg_557_1.time_ and arg_557_1.time_ < var_560_1 + var_560_2 then
				local var_560_3 = (arg_557_1.time_ - var_560_1) / var_560_2

				if arg_557_1.var_.characterEffect1084ui_story then
					arg_557_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_557_1.time_ >= var_560_1 + var_560_2 and arg_557_1.time_ < var_560_1 + var_560_2 + arg_560_0 and arg_557_1.var_.characterEffect1084ui_story then
				arg_557_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_560_4 = arg_557_1.actors_["10050ui_story"]
			local var_560_5 = 0

			if var_560_5 < arg_557_1.time_ and arg_557_1.time_ <= var_560_5 + arg_560_0 and arg_557_1.var_.characterEffect10050ui_story == nil then
				arg_557_1.var_.characterEffect10050ui_story = var_560_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_560_6 = 0.200000002980232

			if var_560_5 <= arg_557_1.time_ and arg_557_1.time_ < var_560_5 + var_560_6 then
				local var_560_7 = (arg_557_1.time_ - var_560_5) / var_560_6

				if arg_557_1.var_.characterEffect10050ui_story then
					local var_560_8 = Mathf.Lerp(0, 0.5, var_560_7)

					arg_557_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_557_1.var_.characterEffect10050ui_story.fillRatio = var_560_8
				end
			end

			if arg_557_1.time_ >= var_560_5 + var_560_6 and arg_557_1.time_ < var_560_5 + var_560_6 + arg_560_0 and arg_557_1.var_.characterEffect10050ui_story then
				local var_560_9 = 0.5

				arg_557_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_557_1.var_.characterEffect10050ui_story.fillRatio = var_560_9
			end

			local var_560_10 = 0

			if var_560_10 < arg_557_1.time_ and arg_557_1.time_ <= var_560_10 + arg_560_0 then
				arg_557_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_560_11 = 0
			local var_560_12 = 0.375

			if var_560_11 < arg_557_1.time_ and arg_557_1.time_ <= var_560_11 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, true)

				local var_560_13 = arg_557_1:FormatText(StoryNameCfg[6].name)

				arg_557_1.leftNameTxt_.text = var_560_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_557_1.leftNameTxt_.transform)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1.leftNameTxt_.text)
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_14 = arg_557_1:GetWordFromCfg(319511137)
				local var_560_15 = arg_557_1:FormatText(var_560_14.content)

				arg_557_1.text_.text = var_560_15

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_16 = 15
				local var_560_17 = utf8.len(var_560_15)
				local var_560_18 = var_560_16 <= 0 and var_560_12 or var_560_12 * (var_560_17 / var_560_16)

				if var_560_18 > 0 and var_560_12 < var_560_18 then
					arg_557_1.talkMaxDuration = var_560_18

					if var_560_18 + var_560_11 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_18 + var_560_11
					end
				end

				arg_557_1.text_.text = var_560_15
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511137", "story_v_out_319511.awb") ~= 0 then
					local var_560_19 = manager.audio:GetVoiceLength("story_v_out_319511", "319511137", "story_v_out_319511.awb") / 1000

					if var_560_19 + var_560_11 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_19 + var_560_11
					end

					if var_560_14.prefab_name ~= "" and arg_557_1.actors_[var_560_14.prefab_name] ~= nil then
						local var_560_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_557_1.actors_[var_560_14.prefab_name].transform, "story_v_out_319511", "319511137", "story_v_out_319511.awb")

						arg_557_1:RecordAudio("319511137", var_560_20)
						arg_557_1:RecordAudio("319511137", var_560_20)
					else
						arg_557_1:AudioAction("play", "voice", "story_v_out_319511", "319511137", "story_v_out_319511.awb")
					end

					arg_557_1:RecordHistoryTalkVoice("story_v_out_319511", "319511137", "story_v_out_319511.awb")
				end

				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_21 = math.max(var_560_12, arg_557_1.talkMaxDuration)

			if var_560_11 <= arg_557_1.time_ and arg_557_1.time_ < var_560_11 + var_560_21 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_11) / var_560_21

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_11 + var_560_21 and arg_557_1.time_ < var_560_11 + var_560_21 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play319511138 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 319511138
		arg_561_1.duration_ = 3.966

		local var_561_0 = {
			zh = 1.999999999999,
			ja = 3.966
		}
		local var_561_1 = manager.audio:GetLocalizationFlag()

		if var_561_0[var_561_1] ~= nil then
			arg_561_1.duration_ = var_561_0[var_561_1]
		end

		SetActive(arg_561_1.tipsGo_, false)

		function arg_561_1.onSingleLineFinish_()
			arg_561_1.onSingleLineUpdate_ = nil
			arg_561_1.onSingleLineFinish_ = nil
			arg_561_1.state_ = "waiting"
		end

		function arg_561_1.playNext_(arg_563_0)
			if arg_563_0 == 1 then
				arg_561_0:Play319511139(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = arg_561_1.actors_["10050ui_story"].transform
			local var_564_1 = 0

			if var_564_1 < arg_561_1.time_ and arg_561_1.time_ <= var_564_1 + arg_564_0 then
				arg_561_1.var_.moveOldPos10050ui_story = var_564_0.localPosition
			end

			local var_564_2 = 0.001

			if var_564_1 <= arg_561_1.time_ and arg_561_1.time_ < var_564_1 + var_564_2 then
				local var_564_3 = (arg_561_1.time_ - var_564_1) / var_564_2
				local var_564_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_564_0.localPosition = Vector3.Lerp(arg_561_1.var_.moveOldPos10050ui_story, var_564_4, var_564_3)

				local var_564_5 = manager.ui.mainCamera.transform.position - var_564_0.position

				var_564_0.forward = Vector3.New(var_564_5.x, var_564_5.y, var_564_5.z)

				local var_564_6 = var_564_0.localEulerAngles

				var_564_6.z = 0
				var_564_6.x = 0
				var_564_0.localEulerAngles = var_564_6
			end

			if arg_561_1.time_ >= var_564_1 + var_564_2 and arg_561_1.time_ < var_564_1 + var_564_2 + arg_564_0 then
				var_564_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_564_7 = manager.ui.mainCamera.transform.position - var_564_0.position

				var_564_0.forward = Vector3.New(var_564_7.x, var_564_7.y, var_564_7.z)

				local var_564_8 = var_564_0.localEulerAngles

				var_564_8.z = 0
				var_564_8.x = 0
				var_564_0.localEulerAngles = var_564_8
			end

			local var_564_9 = arg_561_1.actors_["10050ui_story"]
			local var_564_10 = 0

			if var_564_10 < arg_561_1.time_ and arg_561_1.time_ <= var_564_10 + arg_564_0 and arg_561_1.var_.characterEffect10050ui_story == nil then
				arg_561_1.var_.characterEffect10050ui_story = var_564_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_11 = 0.200000002980232

			if var_564_10 <= arg_561_1.time_ and arg_561_1.time_ < var_564_10 + var_564_11 then
				local var_564_12 = (arg_561_1.time_ - var_564_10) / var_564_11

				if arg_561_1.var_.characterEffect10050ui_story then
					arg_561_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_561_1.time_ >= var_564_10 + var_564_11 and arg_561_1.time_ < var_564_10 + var_564_11 + arg_564_0 and arg_561_1.var_.characterEffect10050ui_story then
				arg_561_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_564_13 = 0

			if var_564_13 < arg_561_1.time_ and arg_561_1.time_ <= var_564_13 + arg_564_0 then
				arg_561_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			local var_564_14 = 0

			if var_564_14 < arg_561_1.time_ and arg_561_1.time_ <= var_564_14 + arg_564_0 then
				arg_561_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_564_15 = arg_561_1.actors_["1084ui_story"]
			local var_564_16 = 0

			if var_564_16 < arg_561_1.time_ and arg_561_1.time_ <= var_564_16 + arg_564_0 and arg_561_1.var_.characterEffect1084ui_story == nil then
				arg_561_1.var_.characterEffect1084ui_story = var_564_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_17 = 0.200000002980232

			if var_564_16 <= arg_561_1.time_ and arg_561_1.time_ < var_564_16 + var_564_17 then
				local var_564_18 = (arg_561_1.time_ - var_564_16) / var_564_17

				if arg_561_1.var_.characterEffect1084ui_story then
					local var_564_19 = Mathf.Lerp(0, 0.5, var_564_18)

					arg_561_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_561_1.var_.characterEffect1084ui_story.fillRatio = var_564_19
				end
			end

			if arg_561_1.time_ >= var_564_16 + var_564_17 and arg_561_1.time_ < var_564_16 + var_564_17 + arg_564_0 and arg_561_1.var_.characterEffect1084ui_story then
				local var_564_20 = 0.5

				arg_561_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_561_1.var_.characterEffect1084ui_story.fillRatio = var_564_20
			end

			local var_564_21 = 0
			local var_564_22 = 0.125

			if var_564_21 < arg_561_1.time_ and arg_561_1.time_ <= var_564_21 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_23 = arg_561_1:FormatText(StoryNameCfg[692].name)

				arg_561_1.leftNameTxt_.text = var_564_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, false)
				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_24 = arg_561_1:GetWordFromCfg(319511138)
				local var_564_25 = arg_561_1:FormatText(var_564_24.content)

				arg_561_1.text_.text = var_564_25

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_26 = 5
				local var_564_27 = utf8.len(var_564_25)
				local var_564_28 = var_564_26 <= 0 and var_564_22 or var_564_22 * (var_564_27 / var_564_26)

				if var_564_28 > 0 and var_564_22 < var_564_28 then
					arg_561_1.talkMaxDuration = var_564_28

					if var_564_28 + var_564_21 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_28 + var_564_21
					end
				end

				arg_561_1.text_.text = var_564_25
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511138", "story_v_out_319511.awb") ~= 0 then
					local var_564_29 = manager.audio:GetVoiceLength("story_v_out_319511", "319511138", "story_v_out_319511.awb") / 1000

					if var_564_29 + var_564_21 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_29 + var_564_21
					end

					if var_564_24.prefab_name ~= "" and arg_561_1.actors_[var_564_24.prefab_name] ~= nil then
						local var_564_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_561_1.actors_[var_564_24.prefab_name].transform, "story_v_out_319511", "319511138", "story_v_out_319511.awb")

						arg_561_1:RecordAudio("319511138", var_564_30)
						arg_561_1:RecordAudio("319511138", var_564_30)
					else
						arg_561_1:AudioAction("play", "voice", "story_v_out_319511", "319511138", "story_v_out_319511.awb")
					end

					arg_561_1:RecordHistoryTalkVoice("story_v_out_319511", "319511138", "story_v_out_319511.awb")
				end

				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_31 = math.max(var_564_22, arg_561_1.talkMaxDuration)

			if var_564_21 <= arg_561_1.time_ and arg_561_1.time_ < var_564_21 + var_564_31 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_21) / var_564_31

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_21 + var_564_31 and arg_561_1.time_ < var_564_21 + var_564_31 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play319511139 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 319511139
		arg_565_1.duration_ = 5

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play319511140(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["10050ui_story"]
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 and arg_565_1.var_.characterEffect10050ui_story == nil then
				arg_565_1.var_.characterEffect10050ui_story = var_568_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_568_2 = 0.200000002980232

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_2 then
				local var_568_3 = (arg_565_1.time_ - var_568_1) / var_568_2

				if arg_565_1.var_.characterEffect10050ui_story then
					local var_568_4 = Mathf.Lerp(0, 0.5, var_568_3)

					arg_565_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_565_1.var_.characterEffect10050ui_story.fillRatio = var_568_4
				end
			end

			if arg_565_1.time_ >= var_568_1 + var_568_2 and arg_565_1.time_ < var_568_1 + var_568_2 + arg_568_0 and arg_565_1.var_.characterEffect10050ui_story then
				local var_568_5 = 0.5

				arg_565_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_565_1.var_.characterEffect10050ui_story.fillRatio = var_568_5
			end

			local var_568_6 = 0
			local var_568_7 = 1.475

			if var_568_6 < arg_565_1.time_ and arg_565_1.time_ <= var_568_6 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, false)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_8 = arg_565_1:GetWordFromCfg(319511139)
				local var_568_9 = arg_565_1:FormatText(var_568_8.content)

				arg_565_1.text_.text = var_568_9

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_10 = 59
				local var_568_11 = utf8.len(var_568_9)
				local var_568_12 = var_568_10 <= 0 and var_568_7 or var_568_7 * (var_568_11 / var_568_10)

				if var_568_12 > 0 and var_568_7 < var_568_12 then
					arg_565_1.talkMaxDuration = var_568_12

					if var_568_12 + var_568_6 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_12 + var_568_6
					end
				end

				arg_565_1.text_.text = var_568_9
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)
				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_13 = math.max(var_568_7, arg_565_1.talkMaxDuration)

			if var_568_6 <= arg_565_1.time_ and arg_565_1.time_ < var_568_6 + var_568_13 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_6) / var_568_13

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_6 + var_568_13 and arg_565_1.time_ < var_568_6 + var_568_13 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play319511140 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 319511140
		arg_569_1.duration_ = 5

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play319511141(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = 0
			local var_572_1 = 1.2

			if var_572_0 < arg_569_1.time_ and arg_569_1.time_ <= var_572_0 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, false)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_569_1.iconTrs_.gameObject, false)
				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_2 = arg_569_1:GetWordFromCfg(319511140)
				local var_572_3 = arg_569_1:FormatText(var_572_2.content)

				arg_569_1.text_.text = var_572_3

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_4 = 48
				local var_572_5 = utf8.len(var_572_3)
				local var_572_6 = var_572_4 <= 0 and var_572_1 or var_572_1 * (var_572_5 / var_572_4)

				if var_572_6 > 0 and var_572_1 < var_572_6 then
					arg_569_1.talkMaxDuration = var_572_6

					if var_572_6 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_6 + var_572_0
					end
				end

				arg_569_1.text_.text = var_572_3
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)
				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_7 = math.max(var_572_1, arg_569_1.talkMaxDuration)

			if var_572_0 <= arg_569_1.time_ and arg_569_1.time_ < var_572_0 + var_572_7 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_0) / var_572_7

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_0 + var_572_7 and arg_569_1.time_ < var_572_0 + var_572_7 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play319511141 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 319511141
		arg_573_1.duration_ = 5

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play319511142(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = 0
			local var_576_1 = 0.675

			if var_576_0 < arg_573_1.time_ and arg_573_1.time_ <= var_576_0 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, false)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_2 = arg_573_1:GetWordFromCfg(319511141)
				local var_576_3 = arg_573_1:FormatText(var_576_2.content)

				arg_573_1.text_.text = var_576_3

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_4 = 28
				local var_576_5 = utf8.len(var_576_3)
				local var_576_6 = var_576_4 <= 0 and var_576_1 or var_576_1 * (var_576_5 / var_576_4)

				if var_576_6 > 0 and var_576_1 < var_576_6 then
					arg_573_1.talkMaxDuration = var_576_6

					if var_576_6 + var_576_0 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_6 + var_576_0
					end
				end

				arg_573_1.text_.text = var_576_3
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)
				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_7 = math.max(var_576_1, arg_573_1.talkMaxDuration)

			if var_576_0 <= arg_573_1.time_ and arg_573_1.time_ < var_576_0 + var_576_7 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_0) / var_576_7

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_0 + var_576_7 and arg_573_1.time_ < var_576_0 + var_576_7 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play319511142 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 319511142
		arg_577_1.duration_ = 7.633

		local var_577_0 = {
			zh = 3.033,
			ja = 7.633
		}
		local var_577_1 = manager.audio:GetLocalizationFlag()

		if var_577_0[var_577_1] ~= nil then
			arg_577_1.duration_ = var_577_0[var_577_1]
		end

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play319511143(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = arg_577_1.actors_["1084ui_story"]
			local var_580_1 = 0

			if var_580_1 < arg_577_1.time_ and arg_577_1.time_ <= var_580_1 + arg_580_0 and arg_577_1.var_.characterEffect1084ui_story == nil then
				arg_577_1.var_.characterEffect1084ui_story = var_580_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_2 = 0.200000002980232

			if var_580_1 <= arg_577_1.time_ and arg_577_1.time_ < var_580_1 + var_580_2 then
				local var_580_3 = (arg_577_1.time_ - var_580_1) / var_580_2

				if arg_577_1.var_.characterEffect1084ui_story then
					arg_577_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_577_1.time_ >= var_580_1 + var_580_2 and arg_577_1.time_ < var_580_1 + var_580_2 + arg_580_0 and arg_577_1.var_.characterEffect1084ui_story then
				arg_577_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_580_4 = 0
			local var_580_5 = 0.375

			if var_580_4 < arg_577_1.time_ and arg_577_1.time_ <= var_580_4 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_6 = arg_577_1:FormatText(StoryNameCfg[6].name)

				arg_577_1.leftNameTxt_.text = var_580_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_7 = arg_577_1:GetWordFromCfg(319511142)
				local var_580_8 = arg_577_1:FormatText(var_580_7.content)

				arg_577_1.text_.text = var_580_8

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_9 = 15
				local var_580_10 = utf8.len(var_580_8)
				local var_580_11 = var_580_9 <= 0 and var_580_5 or var_580_5 * (var_580_10 / var_580_9)

				if var_580_11 > 0 and var_580_5 < var_580_11 then
					arg_577_1.talkMaxDuration = var_580_11

					if var_580_11 + var_580_4 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_11 + var_580_4
					end
				end

				arg_577_1.text_.text = var_580_8
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511142", "story_v_out_319511.awb") ~= 0 then
					local var_580_12 = manager.audio:GetVoiceLength("story_v_out_319511", "319511142", "story_v_out_319511.awb") / 1000

					if var_580_12 + var_580_4 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_12 + var_580_4
					end

					if var_580_7.prefab_name ~= "" and arg_577_1.actors_[var_580_7.prefab_name] ~= nil then
						local var_580_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_577_1.actors_[var_580_7.prefab_name].transform, "story_v_out_319511", "319511142", "story_v_out_319511.awb")

						arg_577_1:RecordAudio("319511142", var_580_13)
						arg_577_1:RecordAudio("319511142", var_580_13)
					else
						arg_577_1:AudioAction("play", "voice", "story_v_out_319511", "319511142", "story_v_out_319511.awb")
					end

					arg_577_1:RecordHistoryTalkVoice("story_v_out_319511", "319511142", "story_v_out_319511.awb")
				end

				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_14 = math.max(var_580_5, arg_577_1.talkMaxDuration)

			if var_580_4 <= arg_577_1.time_ and arg_577_1.time_ < var_580_4 + var_580_14 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_4) / var_580_14

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_4 + var_580_14 and arg_577_1.time_ < var_580_4 + var_580_14 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play319511143 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 319511143
		arg_581_1.duration_ = 9.3

		local var_581_0 = {
			zh = 5.133,
			ja = 9.3
		}
		local var_581_1 = manager.audio:GetLocalizationFlag()

		if var_581_0[var_581_1] ~= nil then
			arg_581_1.duration_ = var_581_0[var_581_1]
		end

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play319511144(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = arg_581_1.actors_["10050ui_story"]
			local var_584_1 = 0

			if var_584_1 < arg_581_1.time_ and arg_581_1.time_ <= var_584_1 + arg_584_0 and arg_581_1.var_.characterEffect10050ui_story == nil then
				arg_581_1.var_.characterEffect10050ui_story = var_584_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_584_2 = 0.200000002980232

			if var_584_1 <= arg_581_1.time_ and arg_581_1.time_ < var_584_1 + var_584_2 then
				local var_584_3 = (arg_581_1.time_ - var_584_1) / var_584_2

				if arg_581_1.var_.characterEffect10050ui_story then
					arg_581_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_581_1.time_ >= var_584_1 + var_584_2 and arg_581_1.time_ < var_584_1 + var_584_2 + arg_584_0 and arg_581_1.var_.characterEffect10050ui_story then
				arg_581_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_584_4 = arg_581_1.actors_["1084ui_story"]
			local var_584_5 = 0

			if var_584_5 < arg_581_1.time_ and arg_581_1.time_ <= var_584_5 + arg_584_0 and arg_581_1.var_.characterEffect1084ui_story == nil then
				arg_581_1.var_.characterEffect1084ui_story = var_584_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_584_6 = 0.200000002980232

			if var_584_5 <= arg_581_1.time_ and arg_581_1.time_ < var_584_5 + var_584_6 then
				local var_584_7 = (arg_581_1.time_ - var_584_5) / var_584_6

				if arg_581_1.var_.characterEffect1084ui_story then
					local var_584_8 = Mathf.Lerp(0, 0.5, var_584_7)

					arg_581_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_581_1.var_.characterEffect1084ui_story.fillRatio = var_584_8
				end
			end

			if arg_581_1.time_ >= var_584_5 + var_584_6 and arg_581_1.time_ < var_584_5 + var_584_6 + arg_584_0 and arg_581_1.var_.characterEffect1084ui_story then
				local var_584_9 = 0.5

				arg_581_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_581_1.var_.characterEffect1084ui_story.fillRatio = var_584_9
			end

			local var_584_10 = 0
			local var_584_11 = 0.475

			if var_584_10 < arg_581_1.time_ and arg_581_1.time_ <= var_584_10 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_12 = arg_581_1:FormatText(StoryNameCfg[692].name)

				arg_581_1.leftNameTxt_.text = var_584_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_13 = arg_581_1:GetWordFromCfg(319511143)
				local var_584_14 = arg_581_1:FormatText(var_584_13.content)

				arg_581_1.text_.text = var_584_14

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_15 = 19
				local var_584_16 = utf8.len(var_584_14)
				local var_584_17 = var_584_15 <= 0 and var_584_11 or var_584_11 * (var_584_16 / var_584_15)

				if var_584_17 > 0 and var_584_11 < var_584_17 then
					arg_581_1.talkMaxDuration = var_584_17

					if var_584_17 + var_584_10 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_17 + var_584_10
					end
				end

				arg_581_1.text_.text = var_584_14
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511143", "story_v_out_319511.awb") ~= 0 then
					local var_584_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511143", "story_v_out_319511.awb") / 1000

					if var_584_18 + var_584_10 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_18 + var_584_10
					end

					if var_584_13.prefab_name ~= "" and arg_581_1.actors_[var_584_13.prefab_name] ~= nil then
						local var_584_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_581_1.actors_[var_584_13.prefab_name].transform, "story_v_out_319511", "319511143", "story_v_out_319511.awb")

						arg_581_1:RecordAudio("319511143", var_584_19)
						arg_581_1:RecordAudio("319511143", var_584_19)
					else
						arg_581_1:AudioAction("play", "voice", "story_v_out_319511", "319511143", "story_v_out_319511.awb")
					end

					arg_581_1:RecordHistoryTalkVoice("story_v_out_319511", "319511143", "story_v_out_319511.awb")
				end

				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_20 = math.max(var_584_11, arg_581_1.talkMaxDuration)

			if var_584_10 <= arg_581_1.time_ and arg_581_1.time_ < var_584_10 + var_584_20 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_10) / var_584_20

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_10 + var_584_20 and arg_581_1.time_ < var_584_10 + var_584_20 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play319511144 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 319511144
		arg_585_1.duration_ = 19.366

		local var_585_0 = {
			zh = 10.766,
			ja = 19.366
		}
		local var_585_1 = manager.audio:GetLocalizationFlag()

		if var_585_0[var_585_1] ~= nil then
			arg_585_1.duration_ = var_585_0[var_585_1]
		end

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play319511145(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = arg_585_1.actors_["10050ui_story"]
			local var_588_1 = 0

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 and arg_585_1.var_.characterEffect10050ui_story == nil then
				arg_585_1.var_.characterEffect10050ui_story = var_588_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_588_2 = 0.200000002980232

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_2 then
				local var_588_3 = (arg_585_1.time_ - var_588_1) / var_588_2

				if arg_585_1.var_.characterEffect10050ui_story then
					arg_585_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_585_1.time_ >= var_588_1 + var_588_2 and arg_585_1.time_ < var_588_1 + var_588_2 + arg_588_0 and arg_585_1.var_.characterEffect10050ui_story then
				arg_585_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_588_4 = arg_585_1.actors_["1084ui_story"]
			local var_588_5 = 0

			if var_588_5 < arg_585_1.time_ and arg_585_1.time_ <= var_588_5 + arg_588_0 and arg_585_1.var_.characterEffect1084ui_story == nil then
				arg_585_1.var_.characterEffect1084ui_story = var_588_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_588_6 = 0.200000002980232

			if var_588_5 <= arg_585_1.time_ and arg_585_1.time_ < var_588_5 + var_588_6 then
				local var_588_7 = (arg_585_1.time_ - var_588_5) / var_588_6

				if arg_585_1.var_.characterEffect1084ui_story then
					local var_588_8 = Mathf.Lerp(0, 0.5, var_588_7)

					arg_585_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_585_1.var_.characterEffect1084ui_story.fillRatio = var_588_8
				end
			end

			if arg_585_1.time_ >= var_588_5 + var_588_6 and arg_585_1.time_ < var_588_5 + var_588_6 + arg_588_0 and arg_585_1.var_.characterEffect1084ui_story then
				local var_588_9 = 0.5

				arg_585_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_585_1.var_.characterEffect1084ui_story.fillRatio = var_588_9
			end

			local var_588_10 = 0

			if var_588_10 < arg_585_1.time_ and arg_585_1.time_ <= var_588_10 + arg_588_0 then
				arg_585_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action13_1")
			end

			local var_588_11 = 0

			if var_588_11 < arg_585_1.time_ and arg_585_1.time_ <= var_588_11 + arg_588_0 then
				arg_585_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_588_12 = 0
			local var_588_13 = 1.1

			if var_588_12 < arg_585_1.time_ and arg_585_1.time_ <= var_588_12 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_14 = arg_585_1:FormatText(StoryNameCfg[692].name)

				arg_585_1.leftNameTxt_.text = var_588_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_15 = arg_585_1:GetWordFromCfg(319511144)
				local var_588_16 = arg_585_1:FormatText(var_588_15.content)

				arg_585_1.text_.text = var_588_16

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_17 = 44
				local var_588_18 = utf8.len(var_588_16)
				local var_588_19 = var_588_17 <= 0 and var_588_13 or var_588_13 * (var_588_18 / var_588_17)

				if var_588_19 > 0 and var_588_13 < var_588_19 then
					arg_585_1.talkMaxDuration = var_588_19

					if var_588_19 + var_588_12 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_19 + var_588_12
					end
				end

				arg_585_1.text_.text = var_588_16
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511144", "story_v_out_319511.awb") ~= 0 then
					local var_588_20 = manager.audio:GetVoiceLength("story_v_out_319511", "319511144", "story_v_out_319511.awb") / 1000

					if var_588_20 + var_588_12 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_20 + var_588_12
					end

					if var_588_15.prefab_name ~= "" and arg_585_1.actors_[var_588_15.prefab_name] ~= nil then
						local var_588_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_15.prefab_name].transform, "story_v_out_319511", "319511144", "story_v_out_319511.awb")

						arg_585_1:RecordAudio("319511144", var_588_21)
						arg_585_1:RecordAudio("319511144", var_588_21)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_319511", "319511144", "story_v_out_319511.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_319511", "319511144", "story_v_out_319511.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_22 = math.max(var_588_13, arg_585_1.talkMaxDuration)

			if var_588_12 <= arg_585_1.time_ and arg_585_1.time_ < var_588_12 + var_588_22 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_12) / var_588_22

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_12 + var_588_22 and arg_585_1.time_ < var_588_12 + var_588_22 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play319511145 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 319511145
		arg_589_1.duration_ = 18.3

		local var_589_0 = {
			zh = 8.1,
			ja = 18.3
		}
		local var_589_1 = manager.audio:GetLocalizationFlag()

		if var_589_0[var_589_1] ~= nil then
			arg_589_1.duration_ = var_589_0[var_589_1]
		end

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play319511146(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = arg_589_1.actors_["10050ui_story"].transform
			local var_592_1 = 0

			if var_592_1 < arg_589_1.time_ and arg_589_1.time_ <= var_592_1 + arg_592_0 then
				arg_589_1.var_.moveOldPos10050ui_story = var_592_0.localPosition
			end

			local var_592_2 = 0.001

			if var_592_1 <= arg_589_1.time_ and arg_589_1.time_ < var_592_1 + var_592_2 then
				local var_592_3 = (arg_589_1.time_ - var_592_1) / var_592_2
				local var_592_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_592_0.localPosition = Vector3.Lerp(arg_589_1.var_.moveOldPos10050ui_story, var_592_4, var_592_3)

				local var_592_5 = manager.ui.mainCamera.transform.position - var_592_0.position

				var_592_0.forward = Vector3.New(var_592_5.x, var_592_5.y, var_592_5.z)

				local var_592_6 = var_592_0.localEulerAngles

				var_592_6.z = 0
				var_592_6.x = 0
				var_592_0.localEulerAngles = var_592_6
			end

			if arg_589_1.time_ >= var_592_1 + var_592_2 and arg_589_1.time_ < var_592_1 + var_592_2 + arg_592_0 then
				var_592_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_592_7 = manager.ui.mainCamera.transform.position - var_592_0.position

				var_592_0.forward = Vector3.New(var_592_7.x, var_592_7.y, var_592_7.z)

				local var_592_8 = var_592_0.localEulerAngles

				var_592_8.z = 0
				var_592_8.x = 0
				var_592_0.localEulerAngles = var_592_8
			end

			local var_592_9 = arg_589_1.actors_["10050ui_story"]
			local var_592_10 = 0

			if var_592_10 < arg_589_1.time_ and arg_589_1.time_ <= var_592_10 + arg_592_0 and arg_589_1.var_.characterEffect10050ui_story == nil then
				arg_589_1.var_.characterEffect10050ui_story = var_592_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_592_11 = 0.200000002980232

			if var_592_10 <= arg_589_1.time_ and arg_589_1.time_ < var_592_10 + var_592_11 then
				local var_592_12 = (arg_589_1.time_ - var_592_10) / var_592_11

				if arg_589_1.var_.characterEffect10050ui_story then
					arg_589_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_589_1.time_ >= var_592_10 + var_592_11 and arg_589_1.time_ < var_592_10 + var_592_11 + arg_592_0 and arg_589_1.var_.characterEffect10050ui_story then
				arg_589_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_592_13 = 0

			if var_592_13 < arg_589_1.time_ and arg_589_1.time_ <= var_592_13 + arg_592_0 then
				arg_589_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action13_2")
			end

			local var_592_14 = 0

			if var_592_14 < arg_589_1.time_ and arg_589_1.time_ <= var_592_14 + arg_592_0 then
				arg_589_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_592_15 = 0
			local var_592_16 = 0.85

			if var_592_15 < arg_589_1.time_ and arg_589_1.time_ <= var_592_15 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, true)

				local var_592_17 = arg_589_1:FormatText(StoryNameCfg[692].name)

				arg_589_1.leftNameTxt_.text = var_592_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_589_1.leftNameTxt_.transform)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1.leftNameTxt_.text)
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_18 = arg_589_1:GetWordFromCfg(319511145)
				local var_592_19 = arg_589_1:FormatText(var_592_18.content)

				arg_589_1.text_.text = var_592_19

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_20 = 34
				local var_592_21 = utf8.len(var_592_19)
				local var_592_22 = var_592_20 <= 0 and var_592_16 or var_592_16 * (var_592_21 / var_592_20)

				if var_592_22 > 0 and var_592_16 < var_592_22 then
					arg_589_1.talkMaxDuration = var_592_22

					if var_592_22 + var_592_15 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_22 + var_592_15
					end
				end

				arg_589_1.text_.text = var_592_19
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511145", "story_v_out_319511.awb") ~= 0 then
					local var_592_23 = manager.audio:GetVoiceLength("story_v_out_319511", "319511145", "story_v_out_319511.awb") / 1000

					if var_592_23 + var_592_15 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_23 + var_592_15
					end

					if var_592_18.prefab_name ~= "" and arg_589_1.actors_[var_592_18.prefab_name] ~= nil then
						local var_592_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_589_1.actors_[var_592_18.prefab_name].transform, "story_v_out_319511", "319511145", "story_v_out_319511.awb")

						arg_589_1:RecordAudio("319511145", var_592_24)
						arg_589_1:RecordAudio("319511145", var_592_24)
					else
						arg_589_1:AudioAction("play", "voice", "story_v_out_319511", "319511145", "story_v_out_319511.awb")
					end

					arg_589_1:RecordHistoryTalkVoice("story_v_out_319511", "319511145", "story_v_out_319511.awb")
				end

				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_25 = math.max(var_592_16, arg_589_1.talkMaxDuration)

			if var_592_15 <= arg_589_1.time_ and arg_589_1.time_ < var_592_15 + var_592_25 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_15) / var_592_25

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_15 + var_592_25 and arg_589_1.time_ < var_592_15 + var_592_25 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play319511146 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 319511146
		arg_593_1.duration_ = 5

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play319511147(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = arg_593_1.actors_["10050ui_story"]
			local var_596_1 = 0

			if var_596_1 < arg_593_1.time_ and arg_593_1.time_ <= var_596_1 + arg_596_0 and arg_593_1.var_.characterEffect10050ui_story == nil then
				arg_593_1.var_.characterEffect10050ui_story = var_596_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_596_2 = 0.200000002980232

			if var_596_1 <= arg_593_1.time_ and arg_593_1.time_ < var_596_1 + var_596_2 then
				local var_596_3 = (arg_593_1.time_ - var_596_1) / var_596_2

				if arg_593_1.var_.characterEffect10050ui_story then
					local var_596_4 = Mathf.Lerp(0, 0.5, var_596_3)

					arg_593_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_593_1.var_.characterEffect10050ui_story.fillRatio = var_596_4
				end
			end

			if arg_593_1.time_ >= var_596_1 + var_596_2 and arg_593_1.time_ < var_596_1 + var_596_2 + arg_596_0 and arg_593_1.var_.characterEffect10050ui_story then
				local var_596_5 = 0.5

				arg_593_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_593_1.var_.characterEffect10050ui_story.fillRatio = var_596_5
			end

			local var_596_6 = 0
			local var_596_7 = 0.566666666666667

			if var_596_6 < arg_593_1.time_ and arg_593_1.time_ <= var_596_6 + arg_596_0 then
				local var_596_8 = "play"
				local var_596_9 = "effect"

				arg_593_1:AudioAction(var_596_8, var_596_9, "se_story_130", "se_story_130_didi", "")
			end

			local var_596_10 = 0
			local var_596_11 = 0.925

			if var_596_10 < arg_593_1.time_ and arg_593_1.time_ <= var_596_10 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0
				arg_593_1.dialogCg_.alpha = 1

				arg_593_1.dialog_:SetActive(true)
				SetActive(arg_593_1.leftNameGo_, false)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_12 = arg_593_1:GetWordFromCfg(319511146)
				local var_596_13 = arg_593_1:FormatText(var_596_12.content)

				arg_593_1.text_.text = var_596_13

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_14 = 37
				local var_596_15 = utf8.len(var_596_13)
				local var_596_16 = var_596_14 <= 0 and var_596_11 or var_596_11 * (var_596_15 / var_596_14)

				if var_596_16 > 0 and var_596_11 < var_596_16 then
					arg_593_1.talkMaxDuration = var_596_16

					if var_596_16 + var_596_10 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_16 + var_596_10
					end
				end

				arg_593_1.text_.text = var_596_13
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)
				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_17 = math.max(var_596_11, arg_593_1.talkMaxDuration)

			if var_596_10 <= arg_593_1.time_ and arg_593_1.time_ < var_596_10 + var_596_17 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_10) / var_596_17

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_10 + var_596_17 and arg_593_1.time_ < var_596_10 + var_596_17 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play319511147 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 319511147
		arg_597_1.duration_ = 2.399999999999

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play319511148(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = 0

			if var_600_0 < arg_597_1.time_ and arg_597_1.time_ <= var_600_0 + arg_600_0 then
				local var_600_1 = manager.ui.mainCamera.transform.localPosition
				local var_600_2 = Vector3.New(0, 0, 10) + Vector3.New(var_600_1.x, var_600_1.y, 0)
				local var_600_3 = arg_597_1.bgs_.STblack

				var_600_3.transform.localPosition = var_600_2
				var_600_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_600_4 = var_600_3:GetComponent("SpriteRenderer")

				if var_600_4 and var_600_4.sprite then
					local var_600_5 = (var_600_3.transform.localPosition - var_600_1).z
					local var_600_6 = manager.ui.mainCameraCom_
					local var_600_7 = 2 * var_600_5 * Mathf.Tan(var_600_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_600_8 = var_600_7 * var_600_6.aspect
					local var_600_9 = var_600_4.sprite.bounds.size.x
					local var_600_10 = var_600_4.sprite.bounds.size.y
					local var_600_11 = var_600_8 / var_600_9
					local var_600_12 = var_600_7 / var_600_10
					local var_600_13 = var_600_12 < var_600_11 and var_600_11 or var_600_12

					var_600_3.transform.localScale = Vector3.New(var_600_13, var_600_13, 0)
				end

				for iter_600_0, iter_600_1 in pairs(arg_597_1.bgs_) do
					if iter_600_0 ~= "STblack" then
						iter_600_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_600_14 = 0

			if var_600_14 < arg_597_1.time_ and arg_597_1.time_ <= var_600_14 + arg_600_0 then
				local var_600_15 = arg_597_1.fswbg_.transform:Find("textbox/adapt/content") or arg_597_1.fswbg_.transform:Find("textbox/content")
				local var_600_16 = var_600_15:GetComponent("Text")
				local var_600_17 = var_600_15:GetComponent("RectTransform")

				var_600_16.alignment = UnityEngine.TextAnchor.LowerCenter
				var_600_17.offsetMin = Vector2.New(0, 0)
				var_600_17.offsetMax = Vector2.New(0, 0)
			end

			local var_600_18 = 0

			if var_600_18 < arg_597_1.time_ and arg_597_1.time_ <= var_600_18 + arg_600_0 then
				arg_597_1.fswbg_:SetActive(true)
				arg_597_1.dialog_:SetActive(false)

				arg_597_1.fswtw_.percent = 0

				local var_600_19 = arg_597_1:GetWordFromCfg(319511147)
				local var_600_20 = arg_597_1:FormatText(var_600_19.content)

				arg_597_1.fswt_.text = var_600_20

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.fswt_)

				arg_597_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_597_1.fswtw_:SetDirty()

				arg_597_1.typewritterCharCountI18N = 0

				SetActive(arg_597_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_597_1:ShowNextGo(false)
			end

			local var_600_21 = 0.4

			if var_600_21 < arg_597_1.time_ and arg_597_1.time_ <= var_600_21 + arg_600_0 then
				arg_597_1.var_.oldValueTypewriter = arg_597_1.fswtw_.percent

				arg_597_1:ShowNextGo(false)
			end

			local var_600_22 = 9
			local var_600_23 = 0.6
			local var_600_24 = arg_597_1:GetWordFromCfg(319511147)
			local var_600_25 = arg_597_1:FormatText(var_600_24.content)
			local var_600_26, var_600_27 = arg_597_1:GetPercentByPara(var_600_25, 1)

			if var_600_21 < arg_597_1.time_ and arg_597_1.time_ <= var_600_21 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0

				local var_600_28 = var_600_22 <= 0 and var_600_23 or var_600_23 * ((var_600_27 - arg_597_1.typewritterCharCountI18N) / var_600_22)

				if var_600_28 > 0 and var_600_23 < var_600_28 then
					arg_597_1.talkMaxDuration = var_600_28

					if var_600_28 + var_600_21 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_28 + var_600_21
					end
				end
			end

			local var_600_29 = 0.6
			local var_600_30 = math.max(var_600_29, arg_597_1.talkMaxDuration)

			if var_600_21 <= arg_597_1.time_ and arg_597_1.time_ < var_600_21 + var_600_30 then
				local var_600_31 = (arg_597_1.time_ - var_600_21) / var_600_30

				arg_597_1.fswtw_.percent = Mathf.Lerp(arg_597_1.var_.oldValueTypewriter, var_600_26, var_600_31)
				arg_597_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_597_1.fswtw_:SetDirty()
			end

			if arg_597_1.time_ >= var_600_21 + var_600_30 and arg_597_1.time_ < var_600_21 + var_600_30 + arg_600_0 then
				arg_597_1.fswtw_.percent = var_600_26

				arg_597_1.fswtw_:SetDirty()
				arg_597_1:ShowNextGo(true)

				arg_597_1.typewritterCharCountI18N = var_600_27
			end

			local var_600_32 = 0

			if var_600_32 < arg_597_1.time_ and arg_597_1.time_ <= var_600_32 + arg_600_0 then
				arg_597_1.cswbg_:SetActive(true)

				local var_600_33 = arg_597_1.cswt_:GetComponent("RectTransform")

				arg_597_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_600_33.offsetMin = Vector2.New(410, 330)
				var_600_33.offsetMax = Vector2.New(-400, -175)

				local var_600_34 = arg_597_1:GetWordFromCfg(419027)
				local var_600_35 = arg_597_1:FormatText(var_600_34.content)

				arg_597_1.cswt_.text = var_600_35

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.cswt_)

				arg_597_1.cswt_.fontSize = 180
				arg_597_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_597_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_600_36 = arg_597_1.actors_["10050ui_story"].transform
			local var_600_37 = 0

			if var_600_37 < arg_597_1.time_ and arg_597_1.time_ <= var_600_37 + arg_600_0 then
				arg_597_1.var_.moveOldPos10050ui_story = var_600_36.localPosition
			end

			local var_600_38 = 0.001

			if var_600_37 <= arg_597_1.time_ and arg_597_1.time_ < var_600_37 + var_600_38 then
				local var_600_39 = (arg_597_1.time_ - var_600_37) / var_600_38
				local var_600_40 = Vector3.New(0, 100, 0)

				var_600_36.localPosition = Vector3.Lerp(arg_597_1.var_.moveOldPos10050ui_story, var_600_40, var_600_39)

				local var_600_41 = manager.ui.mainCamera.transform.position - var_600_36.position

				var_600_36.forward = Vector3.New(var_600_41.x, var_600_41.y, var_600_41.z)

				local var_600_42 = var_600_36.localEulerAngles

				var_600_42.z = 0
				var_600_42.x = 0
				var_600_36.localEulerAngles = var_600_42
			end

			if arg_597_1.time_ >= var_600_37 + var_600_38 and arg_597_1.time_ < var_600_37 + var_600_38 + arg_600_0 then
				var_600_36.localPosition = Vector3.New(0, 100, 0)

				local var_600_43 = manager.ui.mainCamera.transform.position - var_600_36.position

				var_600_36.forward = Vector3.New(var_600_43.x, var_600_43.y, var_600_43.z)

				local var_600_44 = var_600_36.localEulerAngles

				var_600_44.z = 0
				var_600_44.x = 0
				var_600_36.localEulerAngles = var_600_44
			end

			local var_600_45 = arg_597_1.actors_["1084ui_story"].transform
			local var_600_46 = 0

			if var_600_46 < arg_597_1.time_ and arg_597_1.time_ <= var_600_46 + arg_600_0 then
				arg_597_1.var_.moveOldPos1084ui_story = var_600_45.localPosition
			end

			local var_600_47 = 0.001

			if var_600_46 <= arg_597_1.time_ and arg_597_1.time_ < var_600_46 + var_600_47 then
				local var_600_48 = (arg_597_1.time_ - var_600_46) / var_600_47
				local var_600_49 = Vector3.New(0, 100, 0)

				var_600_45.localPosition = Vector3.Lerp(arg_597_1.var_.moveOldPos1084ui_story, var_600_49, var_600_48)

				local var_600_50 = manager.ui.mainCamera.transform.position - var_600_45.position

				var_600_45.forward = Vector3.New(var_600_50.x, var_600_50.y, var_600_50.z)

				local var_600_51 = var_600_45.localEulerAngles

				var_600_51.z = 0
				var_600_51.x = 0
				var_600_45.localEulerAngles = var_600_51
			end

			if arg_597_1.time_ >= var_600_46 + var_600_47 and arg_597_1.time_ < var_600_46 + var_600_47 + arg_600_0 then
				var_600_45.localPosition = Vector3.New(0, 100, 0)

				local var_600_52 = manager.ui.mainCamera.transform.position - var_600_45.position

				var_600_45.forward = Vector3.New(var_600_52.x, var_600_52.y, var_600_52.z)

				local var_600_53 = var_600_45.localEulerAngles

				var_600_53.z = 0
				var_600_53.x = 0
				var_600_45.localEulerAngles = var_600_53
			end

			local var_600_54 = 0.4
			local var_600_55 = 2
			local var_600_56 = manager.audio:GetVoiceLength("story_v_out_319511", "319511147", "story_v_out_319511.awb") / 1000

			if var_600_56 > 0 and var_600_55 < var_600_56 and var_600_56 + var_600_54 > arg_597_1.duration_ then
				local var_600_57 = var_600_56

				arg_597_1.duration_ = var_600_56 + var_600_54
			end

			if var_600_54 < arg_597_1.time_ and arg_597_1.time_ <= var_600_54 + arg_600_0 then
				local var_600_58 = "play"
				local var_600_59 = "voice"

				arg_597_1:AudioAction(var_600_58, var_600_59, "story_v_out_319511", "319511147", "story_v_out_319511.awb")
			end

			local var_600_60 = 0
			local var_600_61 = 0.566666666666667

			if var_600_60 < arg_597_1.time_ and arg_597_1.time_ <= var_600_60 + arg_600_0 then
				local var_600_62 = "stop"
				local var_600_63 = "effect"

				arg_597_1:AudioAction(var_600_62, var_600_63, "se_story_130", "se_story_130_didi", "")
			end
		end
	end,
	Play319511148 = function(arg_601_0, arg_601_1)
		arg_601_1.time_ = 0
		arg_601_1.frameCnt_ = 0
		arg_601_1.state_ = "playing"
		arg_601_1.curTalkId_ = 319511148
		arg_601_1.duration_ = 1.999999999999

		SetActive(arg_601_1.tipsGo_, false)

		function arg_601_1.onSingleLineFinish_()
			arg_601_1.onSingleLineUpdate_ = nil
			arg_601_1.onSingleLineFinish_ = nil
			arg_601_1.state_ = "waiting"
		end

		function arg_601_1.playNext_(arg_603_0)
			if arg_603_0 == 1 then
				arg_601_0:Play319511149(arg_601_1)
			end
		end

		function arg_601_1.onSingleLineUpdate_(arg_604_0)
			local var_604_0 = 0

			if var_604_0 < arg_601_1.time_ and arg_601_1.time_ <= var_604_0 + arg_604_0 then
				arg_601_1.fswbg_:SetActive(true)
				arg_601_1.dialog_:SetActive(false)

				arg_601_1.fswtw_.percent = 0

				local var_604_1 = arg_601_1:GetWordFromCfg(319511148)
				local var_604_2 = arg_601_1:FormatText(var_604_1.content)

				arg_601_1.fswt_.text = var_604_2

				LuaForUtil.ClearLinePrefixSymbol(arg_601_1.fswt_)

				arg_601_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_601_1.fswtw_:SetDirty()

				arg_601_1.typewritterCharCountI18N = 0

				SetActive(arg_601_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_601_1:ShowNextGo(false)
			end

			local var_604_3 = 0.2

			if var_604_3 < arg_601_1.time_ and arg_601_1.time_ <= var_604_3 + arg_604_0 then
				arg_601_1.var_.oldValueTypewriter = arg_601_1.fswtw_.percent

				arg_601_1:ShowNextGo(false)
			end

			local var_604_4 = 26
			local var_604_5 = 1.8
			local var_604_6 = arg_601_1:GetWordFromCfg(319511148)
			local var_604_7 = arg_601_1:FormatText(var_604_6.content)
			local var_604_8, var_604_9 = arg_601_1:GetPercentByPara(var_604_7, 1)

			if var_604_3 < arg_601_1.time_ and arg_601_1.time_ <= var_604_3 + arg_604_0 then
				arg_601_1.talkMaxDuration = 0

				local var_604_10 = var_604_4 <= 0 and var_604_5 or var_604_5 * ((var_604_9 - arg_601_1.typewritterCharCountI18N) / var_604_4)

				if var_604_10 > 0 and var_604_5 < var_604_10 then
					arg_601_1.talkMaxDuration = var_604_10

					if var_604_10 + var_604_3 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_10 + var_604_3
					end
				end
			end

			local var_604_11 = 1.8
			local var_604_12 = math.max(var_604_11, arg_601_1.talkMaxDuration)

			if var_604_3 <= arg_601_1.time_ and arg_601_1.time_ < var_604_3 + var_604_12 then
				local var_604_13 = (arg_601_1.time_ - var_604_3) / var_604_12

				arg_601_1.fswtw_.percent = Mathf.Lerp(arg_601_1.var_.oldValueTypewriter, var_604_8, var_604_13)
				arg_601_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_601_1.fswtw_:SetDirty()
			end

			if arg_601_1.time_ >= var_604_3 + var_604_12 and arg_601_1.time_ < var_604_3 + var_604_12 + arg_604_0 then
				arg_601_1.fswtw_.percent = var_604_8

				arg_601_1.fswtw_:SetDirty()
				arg_601_1:ShowNextGo(true)

				arg_601_1.typewritterCharCountI18N = var_604_9
			end

			local var_604_14 = 0.2
			local var_604_15 = 0.266666666666667
			local var_604_16 = manager.audio:GetVoiceLength("story_v_out_319511", "319511148", "story_v_out_319511.awb") / 1000

			if var_604_16 > 0 and var_604_15 < var_604_16 and var_604_16 + var_604_14 > arg_601_1.duration_ then
				local var_604_17 = var_604_16

				arg_601_1.duration_ = var_604_16 + var_604_14
			end

			if var_604_14 < arg_601_1.time_ and arg_601_1.time_ <= var_604_14 + arg_604_0 then
				local var_604_18 = "play"
				local var_604_19 = "voice"

				arg_601_1:AudioAction(var_604_18, var_604_19, "story_v_out_319511", "319511148", "story_v_out_319511.awb")
			end
		end
	end,
	Play319511149 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 319511149
		arg_605_1.duration_ = 0.999999999999

		SetActive(arg_605_1.tipsGo_, false)

		function arg_605_1.onSingleLineFinish_()
			arg_605_1.onSingleLineUpdate_ = nil
			arg_605_1.onSingleLineFinish_ = nil
			arg_605_1.state_ = "waiting"
		end

		function arg_605_1.playNext_(arg_607_0)
			if arg_607_0 == 1 then
				arg_605_0:Play319511150(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = 0

			if var_608_0 < arg_605_1.time_ and arg_605_1.time_ <= var_608_0 + arg_608_0 then
				arg_605_1.fswbg_:SetActive(true)
				arg_605_1.dialog_:SetActive(false)

				arg_605_1.fswtw_.percent = 0

				local var_608_1 = arg_605_1:GetWordFromCfg(319511149)
				local var_608_2 = arg_605_1:FormatText(var_608_1.content)

				arg_605_1.fswt_.text = var_608_2

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.fswt_)

				arg_605_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_605_1.fswtw_:SetDirty()

				arg_605_1.typewritterCharCountI18N = 0

				SetActive(arg_605_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_605_1:ShowNextGo(false)
			end

			local var_608_3 = 0.2

			if var_608_3 < arg_605_1.time_ and arg_605_1.time_ <= var_608_3 + arg_608_0 then
				arg_605_1.var_.oldValueTypewriter = arg_605_1.fswtw_.percent

				arg_605_1:ShowNextGo(false)
			end

			local var_608_4 = 5
			local var_608_5 = 0.333333333333333
			local var_608_6 = arg_605_1:GetWordFromCfg(319511149)
			local var_608_7 = arg_605_1:FormatText(var_608_6.content)
			local var_608_8, var_608_9 = arg_605_1:GetPercentByPara(var_608_7, 1)

			if var_608_3 < arg_605_1.time_ and arg_605_1.time_ <= var_608_3 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0

				local var_608_10 = var_608_4 <= 0 and var_608_5 or var_608_5 * ((var_608_9 - arg_605_1.typewritterCharCountI18N) / var_608_4)

				if var_608_10 > 0 and var_608_5 < var_608_10 then
					arg_605_1.talkMaxDuration = var_608_10

					if var_608_10 + var_608_3 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_10 + var_608_3
					end
				end
			end

			local var_608_11 = 0.333333333333333
			local var_608_12 = math.max(var_608_11, arg_605_1.talkMaxDuration)

			if var_608_3 <= arg_605_1.time_ and arg_605_1.time_ < var_608_3 + var_608_12 then
				local var_608_13 = (arg_605_1.time_ - var_608_3) / var_608_12

				arg_605_1.fswtw_.percent = Mathf.Lerp(arg_605_1.var_.oldValueTypewriter, var_608_8, var_608_13)
				arg_605_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_605_1.fswtw_:SetDirty()
			end

			if arg_605_1.time_ >= var_608_3 + var_608_12 and arg_605_1.time_ < var_608_3 + var_608_12 + arg_608_0 then
				arg_605_1.fswtw_.percent = var_608_8

				arg_605_1.fswtw_:SetDirty()
				arg_605_1:ShowNextGo(true)

				arg_605_1.typewritterCharCountI18N = var_608_9
			end

			local var_608_14 = 0.2
			local var_608_15 = 0.266666666666667
			local var_608_16 = manager.audio:GetVoiceLength("story_v_out_319511", "319511149", "story_v_out_319511.awb") / 1000

			if var_608_16 > 0 and var_608_15 < var_608_16 and var_608_16 + var_608_14 > arg_605_1.duration_ then
				local var_608_17 = var_608_16

				arg_605_1.duration_ = var_608_16 + var_608_14
			end

			if var_608_14 < arg_605_1.time_ and arg_605_1.time_ <= var_608_14 + arg_608_0 then
				local var_608_18 = "play"
				local var_608_19 = "voice"

				arg_605_1:AudioAction(var_608_18, var_608_19, "story_v_out_319511", "319511149", "story_v_out_319511.awb")
			end
		end
	end,
	Play319511150 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 319511150
		arg_609_1.duration_ = 10

		local var_609_0 = {
			zh = 6,
			ja = 10
		}
		local var_609_1 = manager.audio:GetLocalizationFlag()

		if var_609_0[var_609_1] ~= nil then
			arg_609_1.duration_ = var_609_0[var_609_1]
		end

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play319511151(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = 0

			if var_612_0 < arg_609_1.time_ and arg_609_1.time_ <= var_612_0 + arg_612_0 then
				local var_612_1 = manager.ui.mainCamera.transform.localPosition
				local var_612_2 = Vector3.New(0, 0, 10) + Vector3.New(var_612_1.x, var_612_1.y, 0)
				local var_612_3 = arg_609_1.bgs_.ST71

				var_612_3.transform.localPosition = var_612_2
				var_612_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_612_4 = var_612_3:GetComponent("SpriteRenderer")

				if var_612_4 and var_612_4.sprite then
					local var_612_5 = (var_612_3.transform.localPosition - var_612_1).z
					local var_612_6 = manager.ui.mainCameraCom_
					local var_612_7 = 2 * var_612_5 * Mathf.Tan(var_612_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_612_8 = var_612_7 * var_612_6.aspect
					local var_612_9 = var_612_4.sprite.bounds.size.x
					local var_612_10 = var_612_4.sprite.bounds.size.y
					local var_612_11 = var_612_8 / var_612_9
					local var_612_12 = var_612_7 / var_612_10
					local var_612_13 = var_612_12 < var_612_11 and var_612_11 or var_612_12

					var_612_3.transform.localScale = Vector3.New(var_612_13, var_612_13, 0)
				end

				for iter_612_0, iter_612_1 in pairs(arg_609_1.bgs_) do
					if iter_612_0 ~= "ST71" then
						iter_612_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_612_14 = arg_609_1.actors_["1084ui_story"].transform
			local var_612_15 = 1

			if var_612_15 < arg_609_1.time_ and arg_609_1.time_ <= var_612_15 + arg_612_0 then
				arg_609_1.var_.moveOldPos1084ui_story = var_612_14.localPosition
			end

			local var_612_16 = 0.001

			if var_612_15 <= arg_609_1.time_ and arg_609_1.time_ < var_612_15 + var_612_16 then
				local var_612_17 = (arg_609_1.time_ - var_612_15) / var_612_16
				local var_612_18 = Vector3.New(0.7, -0.97, -6)

				var_612_14.localPosition = Vector3.Lerp(arg_609_1.var_.moveOldPos1084ui_story, var_612_18, var_612_17)

				local var_612_19 = manager.ui.mainCamera.transform.position - var_612_14.position

				var_612_14.forward = Vector3.New(var_612_19.x, var_612_19.y, var_612_19.z)

				local var_612_20 = var_612_14.localEulerAngles

				var_612_20.z = 0
				var_612_20.x = 0
				var_612_14.localEulerAngles = var_612_20
			end

			if arg_609_1.time_ >= var_612_15 + var_612_16 and arg_609_1.time_ < var_612_15 + var_612_16 + arg_612_0 then
				var_612_14.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_612_21 = manager.ui.mainCamera.transform.position - var_612_14.position

				var_612_14.forward = Vector3.New(var_612_21.x, var_612_21.y, var_612_21.z)

				local var_612_22 = var_612_14.localEulerAngles

				var_612_22.z = 0
				var_612_22.x = 0
				var_612_14.localEulerAngles = var_612_22
			end

			local var_612_23 = arg_609_1.actors_["1084ui_story"]
			local var_612_24 = 1

			if var_612_24 < arg_609_1.time_ and arg_609_1.time_ <= var_612_24 + arg_612_0 and arg_609_1.var_.characterEffect1084ui_story == nil then
				arg_609_1.var_.characterEffect1084ui_story = var_612_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_612_25 = 0.200000002980232

			if var_612_24 <= arg_609_1.time_ and arg_609_1.time_ < var_612_24 + var_612_25 then
				local var_612_26 = (arg_609_1.time_ - var_612_24) / var_612_25

				if arg_609_1.var_.characterEffect1084ui_story then
					arg_609_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_609_1.time_ >= var_612_24 + var_612_25 and arg_609_1.time_ < var_612_24 + var_612_25 + arg_612_0 and arg_609_1.var_.characterEffect1084ui_story then
				arg_609_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_612_27 = 1

			if var_612_27 < arg_609_1.time_ and arg_609_1.time_ <= var_612_27 + arg_612_0 then
				arg_609_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_612_28 = 1

			if var_612_28 < arg_609_1.time_ and arg_609_1.time_ <= var_612_28 + arg_612_0 then
				arg_609_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_612_29 = arg_609_1.actors_["10050ui_story"]
			local var_612_30 = 1

			if var_612_30 < arg_609_1.time_ and arg_609_1.time_ <= var_612_30 + arg_612_0 and arg_609_1.var_.characterEffect10050ui_story == nil then
				arg_609_1.var_.characterEffect10050ui_story = var_612_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_612_31 = 0.200000002980232

			if var_612_30 <= arg_609_1.time_ and arg_609_1.time_ < var_612_30 + var_612_31 then
				local var_612_32 = (arg_609_1.time_ - var_612_30) / var_612_31

				if arg_609_1.var_.characterEffect10050ui_story then
					local var_612_33 = Mathf.Lerp(0, 0.5, var_612_32)

					arg_609_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_609_1.var_.characterEffect10050ui_story.fillRatio = var_612_33
				end
			end

			if arg_609_1.time_ >= var_612_30 + var_612_31 and arg_609_1.time_ < var_612_30 + var_612_31 + arg_612_0 and arg_609_1.var_.characterEffect10050ui_story then
				local var_612_34 = 0.5

				arg_609_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_609_1.var_.characterEffect10050ui_story.fillRatio = var_612_34
			end

			local var_612_35 = 0

			if var_612_35 < arg_609_1.time_ and arg_609_1.time_ <= var_612_35 + arg_612_0 then
				arg_609_1.fswbg_:SetActive(false)
				arg_609_1.dialog_:SetActive(false)
				arg_609_1:ShowNextGo(false)
			end

			local var_612_36 = 0

			if var_612_36 < arg_609_1.time_ and arg_609_1.time_ <= var_612_36 + arg_612_0 then
				arg_609_1.cswbg_:SetActive(false)
			end

			local var_612_37 = arg_609_1.actors_["10050ui_story"].transform
			local var_612_38 = 1

			if var_612_38 < arg_609_1.time_ and arg_609_1.time_ <= var_612_38 + arg_612_0 then
				arg_609_1.var_.moveOldPos10050ui_story = var_612_37.localPosition
			end

			local var_612_39 = 0.001

			if var_612_38 <= arg_609_1.time_ and arg_609_1.time_ < var_612_38 + var_612_39 then
				local var_612_40 = (arg_609_1.time_ - var_612_38) / var_612_39
				local var_612_41 = Vector3.New(-0.7, -0.715, -6.15)

				var_612_37.localPosition = Vector3.Lerp(arg_609_1.var_.moveOldPos10050ui_story, var_612_41, var_612_40)

				local var_612_42 = manager.ui.mainCamera.transform.position - var_612_37.position

				var_612_37.forward = Vector3.New(var_612_42.x, var_612_42.y, var_612_42.z)

				local var_612_43 = var_612_37.localEulerAngles

				var_612_43.z = 0
				var_612_43.x = 0
				var_612_37.localEulerAngles = var_612_43
			end

			if arg_609_1.time_ >= var_612_38 + var_612_39 and arg_609_1.time_ < var_612_38 + var_612_39 + arg_612_0 then
				var_612_37.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_612_44 = manager.ui.mainCamera.transform.position - var_612_37.position

				var_612_37.forward = Vector3.New(var_612_44.x, var_612_44.y, var_612_44.z)

				local var_612_45 = var_612_37.localEulerAngles

				var_612_45.z = 0
				var_612_45.x = 0
				var_612_37.localEulerAngles = var_612_45
			end

			local var_612_46 = 1

			if var_612_46 < arg_609_1.time_ and arg_609_1.time_ <= var_612_46 + arg_612_0 then
				arg_609_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			if arg_609_1.frameCnt_ <= 1 then
				arg_609_1.dialog_:SetActive(false)
			end

			local var_612_47 = 1
			local var_612_48 = 0.625

			if var_612_47 < arg_609_1.time_ and arg_609_1.time_ <= var_612_47 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0

				arg_609_1.dialog_:SetActive(true)

				local var_612_49 = LeanTween.value(arg_609_1.dialog_, 0, 1, 0.3)

				var_612_49:setOnUpdate(LuaHelper.FloatAction(function(arg_613_0)
					arg_609_1.dialogCg_.alpha = arg_613_0
				end))
				var_612_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_609_1.dialog_)
					var_612_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_609_1.duration_ = arg_609_1.duration_ + 0.3

				SetActive(arg_609_1.leftNameGo_, true)

				local var_612_50 = arg_609_1:FormatText(StoryNameCfg[6].name)

				arg_609_1.leftNameTxt_.text = var_612_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_609_1.leftNameTxt_.transform)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1.leftNameTxt_.text)
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_51 = arg_609_1:GetWordFromCfg(319511150)
				local var_612_52 = arg_609_1:FormatText(var_612_51.content)

				arg_609_1.text_.text = var_612_52

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_53 = 25
				local var_612_54 = utf8.len(var_612_52)
				local var_612_55 = var_612_53 <= 0 and var_612_48 or var_612_48 * (var_612_54 / var_612_53)

				if var_612_55 > 0 and var_612_48 < var_612_55 then
					arg_609_1.talkMaxDuration = var_612_55
					var_612_47 = var_612_47 + 0.3

					if var_612_55 + var_612_47 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_55 + var_612_47
					end
				end

				arg_609_1.text_.text = var_612_52
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511150", "story_v_out_319511.awb") ~= 0 then
					local var_612_56 = manager.audio:GetVoiceLength("story_v_out_319511", "319511150", "story_v_out_319511.awb") / 1000

					if var_612_56 + var_612_47 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_56 + var_612_47
					end

					if var_612_51.prefab_name ~= "" and arg_609_1.actors_[var_612_51.prefab_name] ~= nil then
						local var_612_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_609_1.actors_[var_612_51.prefab_name].transform, "story_v_out_319511", "319511150", "story_v_out_319511.awb")

						arg_609_1:RecordAudio("319511150", var_612_57)
						arg_609_1:RecordAudio("319511150", var_612_57)
					else
						arg_609_1:AudioAction("play", "voice", "story_v_out_319511", "319511150", "story_v_out_319511.awb")
					end

					arg_609_1:RecordHistoryTalkVoice("story_v_out_319511", "319511150", "story_v_out_319511.awb")
				end

				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_58 = var_612_47 + 0.3
			local var_612_59 = math.max(var_612_48, arg_609_1.talkMaxDuration)

			if var_612_58 <= arg_609_1.time_ and arg_609_1.time_ < var_612_58 + var_612_59 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_58) / var_612_59

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_58 + var_612_59 and arg_609_1.time_ < var_612_58 + var_612_59 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play319511151 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 319511151
		arg_615_1.duration_ = 14.5

		local var_615_0 = {
			zh = 8.866,
			ja = 14.5
		}
		local var_615_1 = manager.audio:GetLocalizationFlag()

		if var_615_0[var_615_1] ~= nil then
			arg_615_1.duration_ = var_615_0[var_615_1]
		end

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play319511152(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 then
				arg_615_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_618_2 = 0
			local var_618_3 = 1.125

			if var_618_2 < arg_615_1.time_ and arg_615_1.time_ <= var_618_2 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_4 = arg_615_1:FormatText(StoryNameCfg[6].name)

				arg_615_1.leftNameTxt_.text = var_618_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_5 = arg_615_1:GetWordFromCfg(319511151)
				local var_618_6 = arg_615_1:FormatText(var_618_5.content)

				arg_615_1.text_.text = var_618_6

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_7 = 45
				local var_618_8 = utf8.len(var_618_6)
				local var_618_9 = var_618_7 <= 0 and var_618_3 or var_618_3 * (var_618_8 / var_618_7)

				if var_618_9 > 0 and var_618_3 < var_618_9 then
					arg_615_1.talkMaxDuration = var_618_9

					if var_618_9 + var_618_2 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_9 + var_618_2
					end
				end

				arg_615_1.text_.text = var_618_6
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511151", "story_v_out_319511.awb") ~= 0 then
					local var_618_10 = manager.audio:GetVoiceLength("story_v_out_319511", "319511151", "story_v_out_319511.awb") / 1000

					if var_618_10 + var_618_2 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_10 + var_618_2
					end

					if var_618_5.prefab_name ~= "" and arg_615_1.actors_[var_618_5.prefab_name] ~= nil then
						local var_618_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_5.prefab_name].transform, "story_v_out_319511", "319511151", "story_v_out_319511.awb")

						arg_615_1:RecordAudio("319511151", var_618_11)
						arg_615_1:RecordAudio("319511151", var_618_11)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_319511", "319511151", "story_v_out_319511.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_319511", "319511151", "story_v_out_319511.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_12 = math.max(var_618_3, arg_615_1.talkMaxDuration)

			if var_618_2 <= arg_615_1.time_ and arg_615_1.time_ < var_618_2 + var_618_12 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_2) / var_618_12

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_2 + var_618_12 and arg_615_1.time_ < var_618_2 + var_618_12 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play319511152 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 319511152
		arg_619_1.duration_ = 6.9

		local var_619_0 = {
			zh = 5.1,
			ja = 6.9
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play319511153(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 0.7

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[6].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(319511152)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 28
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_1 or var_622_1 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_1 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511152", "story_v_out_319511.awb") ~= 0 then
					local var_622_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511152", "story_v_out_319511.awb") / 1000

					if var_622_8 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_8 + var_622_0
					end

					if var_622_3.prefab_name ~= "" and arg_619_1.actors_[var_622_3.prefab_name] ~= nil then
						local var_622_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_3.prefab_name].transform, "story_v_out_319511", "319511152", "story_v_out_319511.awb")

						arg_619_1:RecordAudio("319511152", var_622_9)
						arg_619_1:RecordAudio("319511152", var_622_9)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_319511", "319511152", "story_v_out_319511.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_319511", "319511152", "story_v_out_319511.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_10 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_10 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_10

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_10 and arg_619_1.time_ < var_622_0 + var_622_10 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play319511153 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 319511153
		arg_623_1.duration_ = 9.033

		local var_623_0 = {
			zh = 7.266,
			ja = 9.033
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play319511154(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action435")
			end

			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 then
				arg_623_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_626_2 = 0
			local var_626_3 = 1.1

			if var_626_2 < arg_623_1.time_ and arg_623_1.time_ <= var_626_2 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_4 = arg_623_1:FormatText(StoryNameCfg[6].name)

				arg_623_1.leftNameTxt_.text = var_626_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_5 = arg_623_1:GetWordFromCfg(319511153)
				local var_626_6 = arg_623_1:FormatText(var_626_5.content)

				arg_623_1.text_.text = var_626_6

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_7 = 44
				local var_626_8 = utf8.len(var_626_6)
				local var_626_9 = var_626_7 <= 0 and var_626_3 or var_626_3 * (var_626_8 / var_626_7)

				if var_626_9 > 0 and var_626_3 < var_626_9 then
					arg_623_1.talkMaxDuration = var_626_9

					if var_626_9 + var_626_2 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_9 + var_626_2
					end
				end

				arg_623_1.text_.text = var_626_6
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511153", "story_v_out_319511.awb") ~= 0 then
					local var_626_10 = manager.audio:GetVoiceLength("story_v_out_319511", "319511153", "story_v_out_319511.awb") / 1000

					if var_626_10 + var_626_2 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_10 + var_626_2
					end

					if var_626_5.prefab_name ~= "" and arg_623_1.actors_[var_626_5.prefab_name] ~= nil then
						local var_626_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_5.prefab_name].transform, "story_v_out_319511", "319511153", "story_v_out_319511.awb")

						arg_623_1:RecordAudio("319511153", var_626_11)
						arg_623_1:RecordAudio("319511153", var_626_11)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_319511", "319511153", "story_v_out_319511.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_319511", "319511153", "story_v_out_319511.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_12 = math.max(var_626_3, arg_623_1.talkMaxDuration)

			if var_626_2 <= arg_623_1.time_ and arg_623_1.time_ < var_626_2 + var_626_12 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_2) / var_626_12

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_2 + var_626_12 and arg_623_1.time_ < var_626_2 + var_626_12 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play319511154 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 319511154
		arg_627_1.duration_ = 2.4

		local var_627_0 = {
			zh = 2.4,
			ja = 2.166
		}
		local var_627_1 = manager.audio:GetLocalizationFlag()

		if var_627_0[var_627_1] ~= nil then
			arg_627_1.duration_ = var_627_0[var_627_1]
		end

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play319511155(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["10050ui_story"].transform
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1.var_.moveOldPos10050ui_story = var_630_0.localPosition
			end

			local var_630_2 = 0.001

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2
				local var_630_4 = Vector3.New(-0.7, -0.715, -6.15)

				var_630_0.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos10050ui_story, var_630_4, var_630_3)

				local var_630_5 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_5.x, var_630_5.y, var_630_5.z)

				local var_630_6 = var_630_0.localEulerAngles

				var_630_6.z = 0
				var_630_6.x = 0
				var_630_0.localEulerAngles = var_630_6
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 then
				var_630_0.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_630_7 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_7.x, var_630_7.y, var_630_7.z)

				local var_630_8 = var_630_0.localEulerAngles

				var_630_8.z = 0
				var_630_8.x = 0
				var_630_0.localEulerAngles = var_630_8
			end

			local var_630_9 = arg_627_1.actors_["10050ui_story"]
			local var_630_10 = 0

			if var_630_10 < arg_627_1.time_ and arg_627_1.time_ <= var_630_10 + arg_630_0 and arg_627_1.var_.characterEffect10050ui_story == nil then
				arg_627_1.var_.characterEffect10050ui_story = var_630_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_11 = 0.200000002980232

			if var_630_10 <= arg_627_1.time_ and arg_627_1.time_ < var_630_10 + var_630_11 then
				local var_630_12 = (arg_627_1.time_ - var_630_10) / var_630_11

				if arg_627_1.var_.characterEffect10050ui_story then
					arg_627_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_10 + var_630_11 and arg_627_1.time_ < var_630_10 + var_630_11 + arg_630_0 and arg_627_1.var_.characterEffect10050ui_story then
				arg_627_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_630_13 = 0

			if var_630_13 < arg_627_1.time_ and arg_627_1.time_ <= var_630_13 + arg_630_0 then
				arg_627_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			local var_630_14 = 0

			if var_630_14 < arg_627_1.time_ and arg_627_1.time_ <= var_630_14 + arg_630_0 then
				arg_627_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_630_15 = arg_627_1.actors_["1084ui_story"]
			local var_630_16 = 0

			if var_630_16 < arg_627_1.time_ and arg_627_1.time_ <= var_630_16 + arg_630_0 and arg_627_1.var_.characterEffect1084ui_story == nil then
				arg_627_1.var_.characterEffect1084ui_story = var_630_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_17 = 0.200000002980232

			if var_630_16 <= arg_627_1.time_ and arg_627_1.time_ < var_630_16 + var_630_17 then
				local var_630_18 = (arg_627_1.time_ - var_630_16) / var_630_17

				if arg_627_1.var_.characterEffect1084ui_story then
					local var_630_19 = Mathf.Lerp(0, 0.5, var_630_18)

					arg_627_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_627_1.var_.characterEffect1084ui_story.fillRatio = var_630_19
				end
			end

			if arg_627_1.time_ >= var_630_16 + var_630_17 and arg_627_1.time_ < var_630_16 + var_630_17 + arg_630_0 and arg_627_1.var_.characterEffect1084ui_story then
				local var_630_20 = 0.5

				arg_627_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_627_1.var_.characterEffect1084ui_story.fillRatio = var_630_20
			end

			local var_630_21 = 0
			local var_630_22 = 0.325

			if var_630_21 < arg_627_1.time_ and arg_627_1.time_ <= var_630_21 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_23 = arg_627_1:FormatText(StoryNameCfg[692].name)

				arg_627_1.leftNameTxt_.text = var_630_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_24 = arg_627_1:GetWordFromCfg(319511154)
				local var_630_25 = arg_627_1:FormatText(var_630_24.content)

				arg_627_1.text_.text = var_630_25

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_26 = 13
				local var_630_27 = utf8.len(var_630_25)
				local var_630_28 = var_630_26 <= 0 and var_630_22 or var_630_22 * (var_630_27 / var_630_26)

				if var_630_28 > 0 and var_630_22 < var_630_28 then
					arg_627_1.talkMaxDuration = var_630_28

					if var_630_28 + var_630_21 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_28 + var_630_21
					end
				end

				arg_627_1.text_.text = var_630_25
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511154", "story_v_out_319511.awb") ~= 0 then
					local var_630_29 = manager.audio:GetVoiceLength("story_v_out_319511", "319511154", "story_v_out_319511.awb") / 1000

					if var_630_29 + var_630_21 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_29 + var_630_21
					end

					if var_630_24.prefab_name ~= "" and arg_627_1.actors_[var_630_24.prefab_name] ~= nil then
						local var_630_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_24.prefab_name].transform, "story_v_out_319511", "319511154", "story_v_out_319511.awb")

						arg_627_1:RecordAudio("319511154", var_630_30)
						arg_627_1:RecordAudio("319511154", var_630_30)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_319511", "319511154", "story_v_out_319511.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_319511", "319511154", "story_v_out_319511.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_31 = math.max(var_630_22, arg_627_1.talkMaxDuration)

			if var_630_21 <= arg_627_1.time_ and arg_627_1.time_ < var_630_21 + var_630_31 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_21) / var_630_31

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_21 + var_630_31 and arg_627_1.time_ < var_630_21 + var_630_31 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play319511155 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 319511155
		arg_631_1.duration_ = 9.833

		local var_631_0 = {
			zh = 7.266,
			ja = 9.833
		}
		local var_631_1 = manager.audio:GetLocalizationFlag()

		if var_631_0[var_631_1] ~= nil then
			arg_631_1.duration_ = var_631_0[var_631_1]
		end

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play319511156(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["10050ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect10050ui_story == nil then
				arg_631_1.var_.characterEffect10050ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.200000002980232

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect10050ui_story then
					local var_634_4 = Mathf.Lerp(0, 0.5, var_634_3)

					arg_631_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_631_1.var_.characterEffect10050ui_story.fillRatio = var_634_4
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect10050ui_story then
				local var_634_5 = 0.5

				arg_631_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_631_1.var_.characterEffect10050ui_story.fillRatio = var_634_5
			end

			local var_634_6 = arg_631_1.actors_["1084ui_story"]
			local var_634_7 = 0

			if var_634_7 < arg_631_1.time_ and arg_631_1.time_ <= var_634_7 + arg_634_0 and arg_631_1.var_.characterEffect1084ui_story == nil then
				arg_631_1.var_.characterEffect1084ui_story = var_634_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_8 = 0.200000002980232

			if var_634_7 <= arg_631_1.time_ and arg_631_1.time_ < var_634_7 + var_634_8 then
				local var_634_9 = (arg_631_1.time_ - var_634_7) / var_634_8

				if arg_631_1.var_.characterEffect1084ui_story then
					arg_631_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_7 + var_634_8 and arg_631_1.time_ < var_634_7 + var_634_8 + arg_634_0 and arg_631_1.var_.characterEffect1084ui_story then
				arg_631_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_634_10 = 0

			if var_634_10 < arg_631_1.time_ and arg_631_1.time_ <= var_634_10 + arg_634_0 then
				arg_631_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_634_11 = 0

			if var_634_11 < arg_631_1.time_ and arg_631_1.time_ <= var_634_11 + arg_634_0 then
				arg_631_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_634_12 = 0
			local var_634_13 = 0.85

			if var_634_12 < arg_631_1.time_ and arg_631_1.time_ <= var_634_12 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_14 = arg_631_1:FormatText(StoryNameCfg[6].name)

				arg_631_1.leftNameTxt_.text = var_634_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_15 = arg_631_1:GetWordFromCfg(319511155)
				local var_634_16 = arg_631_1:FormatText(var_634_15.content)

				arg_631_1.text_.text = var_634_16

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_17 = 34
				local var_634_18 = utf8.len(var_634_16)
				local var_634_19 = var_634_17 <= 0 and var_634_13 or var_634_13 * (var_634_18 / var_634_17)

				if var_634_19 > 0 and var_634_13 < var_634_19 then
					arg_631_1.talkMaxDuration = var_634_19

					if var_634_19 + var_634_12 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_19 + var_634_12
					end
				end

				arg_631_1.text_.text = var_634_16
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511155", "story_v_out_319511.awb") ~= 0 then
					local var_634_20 = manager.audio:GetVoiceLength("story_v_out_319511", "319511155", "story_v_out_319511.awb") / 1000

					if var_634_20 + var_634_12 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_20 + var_634_12
					end

					if var_634_15.prefab_name ~= "" and arg_631_1.actors_[var_634_15.prefab_name] ~= nil then
						local var_634_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_15.prefab_name].transform, "story_v_out_319511", "319511155", "story_v_out_319511.awb")

						arg_631_1:RecordAudio("319511155", var_634_21)
						arg_631_1:RecordAudio("319511155", var_634_21)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_319511", "319511155", "story_v_out_319511.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_319511", "319511155", "story_v_out_319511.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_22 = math.max(var_634_13, arg_631_1.talkMaxDuration)

			if var_634_12 <= arg_631_1.time_ and arg_631_1.time_ < var_634_12 + var_634_22 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_12) / var_634_22

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_12 + var_634_22 and arg_631_1.time_ < var_634_12 + var_634_22 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play319511156 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 319511156
		arg_635_1.duration_ = 13.133

		local var_635_0 = {
			zh = 5.566,
			ja = 13.133
		}
		local var_635_1 = manager.audio:GetLocalizationFlag()

		if var_635_0[var_635_1] ~= nil then
			arg_635_1.duration_ = var_635_0[var_635_1]
		end

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play319511157(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1084ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.characterEffect1084ui_story == nil then
				arg_635_1.var_.characterEffect1084ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.200000002980232

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1084ui_story then
					local var_638_4 = Mathf.Lerp(0, 0.5, var_638_3)

					arg_635_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1084ui_story.fillRatio = var_638_4
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.characterEffect1084ui_story then
				local var_638_5 = 0.5

				arg_635_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1084ui_story.fillRatio = var_638_5
			end

			local var_638_6 = arg_635_1.actors_["10050ui_story"]
			local var_638_7 = 0

			if var_638_7 < arg_635_1.time_ and arg_635_1.time_ <= var_638_7 + arg_638_0 and arg_635_1.var_.characterEffect10050ui_story == nil then
				arg_635_1.var_.characterEffect10050ui_story = var_638_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_8 = 0.200000002980232

			if var_638_7 <= arg_635_1.time_ and arg_635_1.time_ < var_638_7 + var_638_8 then
				local var_638_9 = (arg_635_1.time_ - var_638_7) / var_638_8

				if arg_635_1.var_.characterEffect10050ui_story then
					arg_635_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_635_1.time_ >= var_638_7 + var_638_8 and arg_635_1.time_ < var_638_7 + var_638_8 + arg_638_0 and arg_635_1.var_.characterEffect10050ui_story then
				arg_635_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_638_10 = 0
			local var_638_11 = 0.65

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_12 = arg_635_1:FormatText(StoryNameCfg[692].name)

				arg_635_1.leftNameTxt_.text = var_638_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_13 = arg_635_1:GetWordFromCfg(319511156)
				local var_638_14 = arg_635_1:FormatText(var_638_13.content)

				arg_635_1.text_.text = var_638_14

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_15 = 26
				local var_638_16 = utf8.len(var_638_14)
				local var_638_17 = var_638_15 <= 0 and var_638_11 or var_638_11 * (var_638_16 / var_638_15)

				if var_638_17 > 0 and var_638_11 < var_638_17 then
					arg_635_1.talkMaxDuration = var_638_17

					if var_638_17 + var_638_10 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_17 + var_638_10
					end
				end

				arg_635_1.text_.text = var_638_14
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511156", "story_v_out_319511.awb") ~= 0 then
					local var_638_18 = manager.audio:GetVoiceLength("story_v_out_319511", "319511156", "story_v_out_319511.awb") / 1000

					if var_638_18 + var_638_10 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_18 + var_638_10
					end

					if var_638_13.prefab_name ~= "" and arg_635_1.actors_[var_638_13.prefab_name] ~= nil then
						local var_638_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_13.prefab_name].transform, "story_v_out_319511", "319511156", "story_v_out_319511.awb")

						arg_635_1:RecordAudio("319511156", var_638_19)
						arg_635_1:RecordAudio("319511156", var_638_19)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_319511", "319511156", "story_v_out_319511.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_319511", "319511156", "story_v_out_319511.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_20 = math.max(var_638_11, arg_635_1.talkMaxDuration)

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_20 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_10) / var_638_20

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_10 + var_638_20 and arg_635_1.time_ < var_638_10 + var_638_20 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play319511157 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 319511157
		arg_639_1.duration_ = 9

		local var_639_0 = {
			zh = 9,
			ja = 8.366
		}
		local var_639_1 = manager.audio:GetLocalizationFlag()

		if var_639_0[var_639_1] ~= nil then
			arg_639_1.duration_ = var_639_0[var_639_1]
		end

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play319511158(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0
			local var_642_1 = 0.875

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_2 = arg_639_1:FormatText(StoryNameCfg[692].name)

				arg_639_1.leftNameTxt_.text = var_642_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_3 = arg_639_1:GetWordFromCfg(319511157)
				local var_642_4 = arg_639_1:FormatText(var_642_3.content)

				arg_639_1.text_.text = var_642_4

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_5 = 35
				local var_642_6 = utf8.len(var_642_4)
				local var_642_7 = var_642_5 <= 0 and var_642_1 or var_642_1 * (var_642_6 / var_642_5)

				if var_642_7 > 0 and var_642_1 < var_642_7 then
					arg_639_1.talkMaxDuration = var_642_7

					if var_642_7 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_7 + var_642_0
					end
				end

				arg_639_1.text_.text = var_642_4
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511157", "story_v_out_319511.awb") ~= 0 then
					local var_642_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511157", "story_v_out_319511.awb") / 1000

					if var_642_8 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_8 + var_642_0
					end

					if var_642_3.prefab_name ~= "" and arg_639_1.actors_[var_642_3.prefab_name] ~= nil then
						local var_642_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_3.prefab_name].transform, "story_v_out_319511", "319511157", "story_v_out_319511.awb")

						arg_639_1:RecordAudio("319511157", var_642_9)
						arg_639_1:RecordAudio("319511157", var_642_9)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_319511", "319511157", "story_v_out_319511.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_319511", "319511157", "story_v_out_319511.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_10 = math.max(var_642_1, arg_639_1.talkMaxDuration)

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_10 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_0) / var_642_10

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_0 + var_642_10 and arg_639_1.time_ < var_642_0 + var_642_10 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play319511158 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 319511158
		arg_643_1.duration_ = 10.033

		local var_643_0 = {
			zh = 5.366,
			ja = 10.033
		}
		local var_643_1 = manager.audio:GetLocalizationFlag()

		if var_643_0[var_643_1] ~= nil then
			arg_643_1.duration_ = var_643_0[var_643_1]
		end

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play319511159(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 0.475

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_2 = arg_643_1:FormatText(StoryNameCfg[692].name)

				arg_643_1.leftNameTxt_.text = var_646_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_3 = arg_643_1:GetWordFromCfg(319511158)
				local var_646_4 = arg_643_1:FormatText(var_646_3.content)

				arg_643_1.text_.text = var_646_4

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_5 = 19
				local var_646_6 = utf8.len(var_646_4)
				local var_646_7 = var_646_5 <= 0 and var_646_1 or var_646_1 * (var_646_6 / var_646_5)

				if var_646_7 > 0 and var_646_1 < var_646_7 then
					arg_643_1.talkMaxDuration = var_646_7

					if var_646_7 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_7 + var_646_0
					end
				end

				arg_643_1.text_.text = var_646_4
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511158", "story_v_out_319511.awb") ~= 0 then
					local var_646_8 = manager.audio:GetVoiceLength("story_v_out_319511", "319511158", "story_v_out_319511.awb") / 1000

					if var_646_8 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_8 + var_646_0
					end

					if var_646_3.prefab_name ~= "" and arg_643_1.actors_[var_646_3.prefab_name] ~= nil then
						local var_646_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_3.prefab_name].transform, "story_v_out_319511", "319511158", "story_v_out_319511.awb")

						arg_643_1:RecordAudio("319511158", var_646_9)
						arg_643_1:RecordAudio("319511158", var_646_9)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_319511", "319511158", "story_v_out_319511.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_319511", "319511158", "story_v_out_319511.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_10 = math.max(var_646_1, arg_643_1.talkMaxDuration)

			if var_646_0 <= arg_643_1.time_ and arg_643_1.time_ < var_646_0 + var_646_10 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_0) / var_646_10

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_0 + var_646_10 and arg_643_1.time_ < var_646_0 + var_646_10 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play319511159 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 319511159
		arg_647_1.duration_ = 5

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play319511160(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["10050ui_story"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and arg_647_1.var_.characterEffect10050ui_story == nil then
				arg_647_1.var_.characterEffect10050ui_story = var_650_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_2 = 0.200000002980232

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.characterEffect10050ui_story then
					local var_650_4 = Mathf.Lerp(0, 0.5, var_650_3)

					arg_647_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_647_1.var_.characterEffect10050ui_story.fillRatio = var_650_4
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and arg_647_1.var_.characterEffect10050ui_story then
				local var_650_5 = 0.5

				arg_647_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_647_1.var_.characterEffect10050ui_story.fillRatio = var_650_5
			end

			local var_650_6 = 0
			local var_650_7 = 1.125

			if var_650_6 < arg_647_1.time_ and arg_647_1.time_ <= var_650_6 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, false)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_8 = arg_647_1:GetWordFromCfg(319511159)
				local var_650_9 = arg_647_1:FormatText(var_650_8.content)

				arg_647_1.text_.text = var_650_9

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_10 = 45
				local var_650_11 = utf8.len(var_650_9)
				local var_650_12 = var_650_10 <= 0 and var_650_7 or var_650_7 * (var_650_11 / var_650_10)

				if var_650_12 > 0 and var_650_7 < var_650_12 then
					arg_647_1.talkMaxDuration = var_650_12

					if var_650_12 + var_650_6 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_12 + var_650_6
					end
				end

				arg_647_1.text_.text = var_650_9
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)
				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_13 = math.max(var_650_7, arg_647_1.talkMaxDuration)

			if var_650_6 <= arg_647_1.time_ and arg_647_1.time_ < var_650_6 + var_650_13 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_6) / var_650_13

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_6 + var_650_13 and arg_647_1.time_ < var_650_6 + var_650_13 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play319511160 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 319511160
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play319511161(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = 0
			local var_654_1 = 1.275

			if var_654_0 < arg_651_1.time_ and arg_651_1.time_ <= var_654_0 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_2 = arg_651_1:GetWordFromCfg(319511160)
				local var_654_3 = arg_651_1:FormatText(var_654_2.content)

				arg_651_1.text_.text = var_654_3

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_4 = 51
				local var_654_5 = utf8.len(var_654_3)
				local var_654_6 = var_654_4 <= 0 and var_654_1 or var_654_1 * (var_654_5 / var_654_4)

				if var_654_6 > 0 and var_654_1 < var_654_6 then
					arg_651_1.talkMaxDuration = var_654_6

					if var_654_6 + var_654_0 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_6 + var_654_0
					end
				end

				arg_651_1.text_.text = var_654_3
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_7 = math.max(var_654_1, arg_651_1.talkMaxDuration)

			if var_654_0 <= arg_651_1.time_ and arg_651_1.time_ < var_654_0 + var_654_7 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_0) / var_654_7

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_0 + var_654_7 and arg_651_1.time_ < var_654_0 + var_654_7 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play319511161 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 319511161
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play319511162(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.8

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_2 = arg_655_1:GetWordFromCfg(319511161)
				local var_658_3 = arg_655_1:FormatText(var_658_2.content)

				arg_655_1.text_.text = var_658_3

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_4 = 32
				local var_658_5 = utf8.len(var_658_3)
				local var_658_6 = var_658_4 <= 0 and var_658_1 or var_658_1 * (var_658_5 / var_658_4)

				if var_658_6 > 0 and var_658_1 < var_658_6 then
					arg_655_1.talkMaxDuration = var_658_6

					if var_658_6 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_6 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_3
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_7 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_7 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_7

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_7 and arg_655_1.time_ < var_658_0 + var_658_7 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play319511162 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 319511162
		arg_659_1.duration_ = 13.533

		local var_659_0 = {
			zh = 3.6,
			ja = 13.533
		}
		local var_659_1 = manager.audio:GetLocalizationFlag()

		if var_659_0[var_659_1] ~= nil then
			arg_659_1.duration_ = var_659_0[var_659_1]
		end

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
			arg_659_1.auto_ = false
		end

		function arg_659_1.playNext_(arg_661_0)
			arg_659_1.onStoryFinished_()
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1084ui_story"]
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 and arg_659_1.var_.characterEffect1084ui_story == nil then
				arg_659_1.var_.characterEffect1084ui_story = var_662_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_2 = 0.200000002980232

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2

				if arg_659_1.var_.characterEffect1084ui_story then
					arg_659_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 and arg_659_1.var_.characterEffect1084ui_story then
				arg_659_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_662_4 = 0

			if var_662_4 < arg_659_1.time_ and arg_659_1.time_ <= var_662_4 + arg_662_0 then
				arg_659_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_662_5 = 0
			local var_662_6 = 0.45

			if var_662_5 < arg_659_1.time_ and arg_659_1.time_ <= var_662_5 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_7 = arg_659_1:FormatText(StoryNameCfg[6].name)

				arg_659_1.leftNameTxt_.text = var_662_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_8 = arg_659_1:GetWordFromCfg(319511162)
				local var_662_9 = arg_659_1:FormatText(var_662_8.content)

				arg_659_1.text_.text = var_662_9

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_10 = 18
				local var_662_11 = utf8.len(var_662_9)
				local var_662_12 = var_662_10 <= 0 and var_662_6 or var_662_6 * (var_662_11 / var_662_10)

				if var_662_12 > 0 and var_662_6 < var_662_12 then
					arg_659_1.talkMaxDuration = var_662_12

					if var_662_12 + var_662_5 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_12 + var_662_5
					end
				end

				arg_659_1.text_.text = var_662_9
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319511", "319511162", "story_v_out_319511.awb") ~= 0 then
					local var_662_13 = manager.audio:GetVoiceLength("story_v_out_319511", "319511162", "story_v_out_319511.awb") / 1000

					if var_662_13 + var_662_5 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_13 + var_662_5
					end

					if var_662_8.prefab_name ~= "" and arg_659_1.actors_[var_662_8.prefab_name] ~= nil then
						local var_662_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_8.prefab_name].transform, "story_v_out_319511", "319511162", "story_v_out_319511.awb")

						arg_659_1:RecordAudio("319511162", var_662_14)
						arg_659_1:RecordAudio("319511162", var_662_14)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_319511", "319511162", "story_v_out_319511.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_319511", "319511162", "story_v_out_319511.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_15 = math.max(var_662_6, arg_659_1.talkMaxDuration)

			if var_662_5 <= arg_659_1.time_ and arg_659_1.time_ < var_662_5 + var_662_15 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_5) / var_662_15

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_5 + var_662_15 and arg_659_1.time_ < var_662_5 + var_662_15 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST72",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"SofdecAsset/story/story_1031951.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST71"
	},
	voices = {
		"story_v_out_319511.awb"
	},
	skipMarkers = {
		319511058
	}
}
