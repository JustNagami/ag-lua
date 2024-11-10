return {
	Play412102001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 412102001
		arg_1_1.duration_ = 6.00000000298023

		local var_1_0 = {
			zh = 4.50000000298023,
			ja = 6.00000000298023
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
				arg_1_0:Play412102002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST85b"

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
				local var_4_5 = arg_1_1.bgs_.ST85b

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
					if iter_4_0 ~= "ST85b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 2.00000000298023

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = "1097ui_story"

			if arg_1_1.actors_[var_4_24] == nil then
				local var_4_25 = Object.Instantiate(Asset.Load("Char/" .. var_4_24), arg_1_1.stage_.transform)

				var_4_25.name = var_4_24
				var_4_25.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_24] = var_4_25

				local var_4_26 = var_4_25:GetComponentInChildren(typeof(CharacterEffect))

				var_4_26.enabled = true

				local var_4_27 = GameObjectTools.GetOrAddComponent(var_4_25, typeof(DynamicBoneHelper))

				if var_4_27 then
					var_4_27:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_26.transform, false)

				arg_1_1.var_[var_4_24 .. "Animator"] = var_4_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_24 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_24 .. "LipSync"] = var_4_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_28 = arg_1_1.actors_["1097ui_story"].transform
			local var_4_29 = 1.8

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPos1097ui_story = var_4_28.localPosition
			end

			local var_4_30 = 0.001

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / var_4_30
				local var_4_32 = Vector3.New(0, -0.54, -6.3)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1097ui_story, var_4_32, var_4_31)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_28.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_28.localEulerAngles = var_4_34
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_28.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_28.localEulerAngles = var_4_36
			end

			local var_4_37 = arg_1_1.actors_["1097ui_story"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1097ui_story == nil then
				arg_1_1.var_.characterEffect1097ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.200000002980232

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1097ui_story then
					arg_1_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1097ui_story then
				arg_1_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_4_41 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_43 = 0
			local var_4_44 = 0.233333333333333

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_47 = 2.00000000298023
			local var_4_48 = 0.2

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_49 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_49:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_50 = arg_1_1:FormatText(StoryNameCfg[216].name)

				arg_1_1.leftNameTxt_.text = var_4_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_51 = arg_1_1:GetWordFromCfg(412102001)
				local var_4_52 = arg_1_1:FormatText(var_4_51.content)

				arg_1_1.text_.text = var_4_52

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_53 = 8
				local var_4_54 = utf8.len(var_4_52)
				local var_4_55 = var_4_53 <= 0 and var_4_48 or var_4_48 * (var_4_54 / var_4_53)

				if var_4_55 > 0 and var_4_48 < var_4_55 then
					arg_1_1.talkMaxDuration = var_4_55
					var_4_47 = var_4_47 + 0.3

					if var_4_55 + var_4_47 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_55 + var_4_47
					end
				end

				arg_1_1.text_.text = var_4_52
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102001", "story_v_out_412102.awb") ~= 0 then
					local var_4_56 = manager.audio:GetVoiceLength("story_v_out_412102", "412102001", "story_v_out_412102.awb") / 1000

					if var_4_56 + var_4_47 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_56 + var_4_47
					end

					if var_4_51.prefab_name ~= "" and arg_1_1.actors_[var_4_51.prefab_name] ~= nil then
						local var_4_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_51.prefab_name].transform, "story_v_out_412102", "412102001", "story_v_out_412102.awb")

						arg_1_1:RecordAudio("412102001", var_4_57)
						arg_1_1:RecordAudio("412102001", var_4_57)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_412102", "412102001", "story_v_out_412102.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_412102", "412102001", "story_v_out_412102.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_58 = var_4_47 + 0.3
			local var_4_59 = math.max(var_4_48, arg_1_1.talkMaxDuration)

			if var_4_58 <= arg_1_1.time_ and arg_1_1.time_ < var_4_58 + var_4_59 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_58) / var_4_59

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_58 + var_4_59 and arg_1_1.time_ < var_4_58 + var_4_59 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play412102002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 412102002
		arg_7_1.duration_ = 2.133

		local var_7_0 = {
			zh = 2.133,
			ja = 2
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
				arg_7_0:Play412102003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1097ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1097ui_story == nil then
				arg_7_1.var_.characterEffect1097ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1097ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1097ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1097ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1097ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.2

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[913].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097_sheep")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(412102002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 8
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102002", "story_v_out_412102.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_412102", "412102002", "story_v_out_412102.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_412102", "412102002", "story_v_out_412102.awb")

						arg_7_1:RecordAudio("412102002", var_10_15)
						arg_7_1:RecordAudio("412102002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_412102", "412102002", "story_v_out_412102.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_412102", "412102002", "story_v_out_412102.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_16 and arg_7_1.time_ < var_10_6 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play412102003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 412102003
		arg_11_1.duration_ = 8.5

		local var_11_0 = {
			zh = 8.5,
			ja = 7.3
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
				arg_11_0:Play412102004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1097ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1097ui_story == nil then
				arg_11_1.var_.characterEffect1097ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1097ui_story then
					arg_11_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1097ui_story then
				arg_11_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_6 = 0
			local var_14_7 = 0.625

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[216].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(412102003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 25
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_7 or var_14_7 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_7 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102003", "story_v_out_412102.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_412102", "412102003", "story_v_out_412102.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_412102", "412102003", "story_v_out_412102.awb")

						arg_11_1:RecordAudio("412102003", var_14_15)
						arg_11_1:RecordAudio("412102003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_412102", "412102003", "story_v_out_412102.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_412102", "412102003", "story_v_out_412102.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_16 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_16 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_16

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_16 and arg_11_1.time_ < var_14_6 + var_14_16 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play412102004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 412102004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play412102005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1097ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1097ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1097ui_story, var_18_4, var_18_3)

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

			local var_18_9 = arg_15_1.actors_["1097ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1097ui_story == nil then
				arg_15_1.var_.characterEffect1097ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1097ui_story then
					local var_18_13 = Mathf.Lerp(0, 0.5, var_18_12)

					arg_15_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1097ui_story.fillRatio = var_18_13
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1097ui_story then
				local var_18_14 = 0.5

				arg_15_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1097ui_story.fillRatio = var_18_14
			end

			local var_18_15 = 0
			local var_18_16 = 0.2

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

				local var_18_17 = arg_15_1:GetWordFromCfg(412102004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 8
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
	Play412102005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 412102005
		arg_19_1.duration_ = 3.8

		local var_19_0 = {
			zh = 3.8,
			ja = 3.799999999999
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
				arg_19_0:Play412102006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "ST30a"

			if arg_19_1.bgs_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_0)
				var_22_1.name = var_22_0
				var_22_1.transform.parent = arg_19_1.stage_.transform
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_0] = var_22_1
			end

			local var_22_2 = 0

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				local var_22_3 = manager.ui.mainCamera.transform.localPosition
				local var_22_4 = Vector3.New(0, 0, 10) + Vector3.New(var_22_3.x, var_22_3.y, 0)
				local var_22_5 = arg_19_1.bgs_.ST30a

				var_22_5.transform.localPosition = var_22_4
				var_22_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_6 = var_22_5:GetComponent("SpriteRenderer")

				if var_22_6 and var_22_6.sprite then
					local var_22_7 = (var_22_5.transform.localPosition - var_22_3).z
					local var_22_8 = manager.ui.mainCameraCom_
					local var_22_9 = 2 * var_22_7 * Mathf.Tan(var_22_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_10 = var_22_9 * var_22_8.aspect
					local var_22_11 = var_22_6.sprite.bounds.size.x
					local var_22_12 = var_22_6.sprite.bounds.size.y
					local var_22_13 = var_22_10 / var_22_11
					local var_22_14 = var_22_9 / var_22_12
					local var_22_15 = var_22_14 < var_22_13 and var_22_13 or var_22_14

					var_22_5.transform.localScale = Vector3.New(var_22_15, var_22_15, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "ST30a" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_16 = 2

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.allBtn_.enabled = false
			end

			local var_22_17 = 0.3

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				arg_19_1.allBtn_.enabled = true
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_19 = 2

			if var_22_18 <= arg_19_1.time_ and arg_19_1.time_ < var_22_18 + var_22_19 then
				local var_22_20 = (arg_19_1.time_ - var_22_18) / var_22_19
				local var_22_21 = Color.New(1, 1, 1)

				var_22_21.a = Mathf.Lerp(1, 0, var_22_20)
				arg_19_1.mask_.color = var_22_21
			end

			if arg_19_1.time_ >= var_22_18 + var_22_19 and arg_19_1.time_ < var_22_18 + var_22_19 + arg_22_0 then
				local var_22_22 = Color.New(1, 1, 1)
				local var_22_23 = 0

				arg_19_1.mask_.enabled = false
				var_22_22.a = var_22_23
				arg_19_1.mask_.color = var_22_22
			end

			local var_22_24 = arg_19_1.actors_["1097ui_story"].transform
			local var_22_25 = 1.8

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.var_.moveOldPos1097ui_story = var_22_24.localPosition
			end

			local var_22_26 = 0.001

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_26 then
				local var_22_27 = (arg_19_1.time_ - var_22_25) / var_22_26
				local var_22_28 = Vector3.New(0, -0.54, -6.3)

				var_22_24.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1097ui_story, var_22_28, var_22_27)

				local var_22_29 = manager.ui.mainCamera.transform.position - var_22_24.position

				var_22_24.forward = Vector3.New(var_22_29.x, var_22_29.y, var_22_29.z)

				local var_22_30 = var_22_24.localEulerAngles

				var_22_30.z = 0
				var_22_30.x = 0
				var_22_24.localEulerAngles = var_22_30
			end

			if arg_19_1.time_ >= var_22_25 + var_22_26 and arg_19_1.time_ < var_22_25 + var_22_26 + arg_22_0 then
				var_22_24.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_22_31 = manager.ui.mainCamera.transform.position - var_22_24.position

				var_22_24.forward = Vector3.New(var_22_31.x, var_22_31.y, var_22_31.z)

				local var_22_32 = var_22_24.localEulerAngles

				var_22_32.z = 0
				var_22_32.x = 0
				var_22_24.localEulerAngles = var_22_32
			end

			local var_22_33 = arg_19_1.actors_["1097ui_story"]
			local var_22_34 = 1.8

			if var_22_34 < arg_19_1.time_ and arg_19_1.time_ <= var_22_34 + arg_22_0 and arg_19_1.var_.characterEffect1097ui_story == nil then
				arg_19_1.var_.characterEffect1097ui_story = var_22_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_35 = 0.200000002980232

			if var_22_34 <= arg_19_1.time_ and arg_19_1.time_ < var_22_34 + var_22_35 then
				local var_22_36 = (arg_19_1.time_ - var_22_34) / var_22_35

				if arg_19_1.var_.characterEffect1097ui_story then
					arg_19_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_34 + var_22_35 and arg_19_1.time_ < var_22_34 + var_22_35 + arg_22_0 and arg_19_1.var_.characterEffect1097ui_story then
				arg_19_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_22_37 = 1.8

			if var_22_37 < arg_19_1.time_ and arg_19_1.time_ <= var_22_37 + arg_22_0 then
				arg_19_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_22_38 = 1.8

			if var_22_38 < arg_19_1.time_ and arg_19_1.time_ <= var_22_38 + arg_22_0 then
				arg_19_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_22_39 = 0
			local var_22_40 = 0.233333333333333

			if var_22_39 < arg_19_1.time_ and arg_19_1.time_ <= var_22_39 + arg_22_0 then
				local var_22_41 = "play"
				local var_22_42 = "music"

				arg_19_1:AudioAction(var_22_41, var_22_42, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_22_43 = 0.266666666666667
			local var_22_44 = 1

			if var_22_43 < arg_19_1.time_ and arg_19_1.time_ <= var_22_43 + arg_22_0 then
				local var_22_45 = "play"
				local var_22_46 = "music"

				arg_19_1:AudioAction(var_22_45, var_22_46, "bgm_activity_3_2_story_house_nightmare", "bgm_activity_3_2_story_house_nightmare", "bgm_activity_3_2_story_house_nightmare.awb")
			end

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_47 = 2
			local var_22_48 = 0.125

			if var_22_47 < arg_19_1.time_ and arg_19_1.time_ <= var_22_47 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_49 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_49:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_50 = arg_19_1:FormatText(StoryNameCfg[216].name)

				arg_19_1.leftNameTxt_.text = var_22_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_51 = arg_19_1:GetWordFromCfg(412102005)
				local var_22_52 = arg_19_1:FormatText(var_22_51.content)

				arg_19_1.text_.text = var_22_52

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_53 = 5
				local var_22_54 = utf8.len(var_22_52)
				local var_22_55 = var_22_53 <= 0 and var_22_48 or var_22_48 * (var_22_54 / var_22_53)

				if var_22_55 > 0 and var_22_48 < var_22_55 then
					arg_19_1.talkMaxDuration = var_22_55
					var_22_47 = var_22_47 + 0.3

					if var_22_55 + var_22_47 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_55 + var_22_47
					end
				end

				arg_19_1.text_.text = var_22_52
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102005", "story_v_out_412102.awb") ~= 0 then
					local var_22_56 = manager.audio:GetVoiceLength("story_v_out_412102", "412102005", "story_v_out_412102.awb") / 1000

					if var_22_56 + var_22_47 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_56 + var_22_47
					end

					if var_22_51.prefab_name ~= "" and arg_19_1.actors_[var_22_51.prefab_name] ~= nil then
						local var_22_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_51.prefab_name].transform, "story_v_out_412102", "412102005", "story_v_out_412102.awb")

						arg_19_1:RecordAudio("412102005", var_22_57)
						arg_19_1:RecordAudio("412102005", var_22_57)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_412102", "412102005", "story_v_out_412102.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_412102", "412102005", "story_v_out_412102.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_58 = var_22_47 + 0.3
			local var_22_59 = math.max(var_22_48, arg_19_1.talkMaxDuration)

			if var_22_58 <= arg_19_1.time_ and arg_19_1.time_ < var_22_58 + var_22_59 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_58) / var_22_59

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_58 + var_22_59 and arg_19_1.time_ < var_22_58 + var_22_59 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play412102006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 412102006
		arg_25_1.duration_ = 3.133

		local var_25_0 = {
			zh = 1.9,
			ja = 3.133
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
				arg_25_0:Play412102007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1097ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos1097ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0, 100, 0)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1097ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0, 100, 0)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["1097ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.characterEffect1097ui_story == nil then
				arg_25_1.var_.characterEffect1097ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect1097ui_story then
					local var_28_13 = Mathf.Lerp(0, 0.5, var_28_12)

					arg_25_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_25_1.var_.characterEffect1097ui_story.fillRatio = var_28_13
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.characterEffect1097ui_story then
				local var_28_14 = 0.5

				arg_25_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_25_1.var_.characterEffect1097ui_story.fillRatio = var_28_14
			end

			local var_28_15 = 0
			local var_28_16 = 0.175

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_17 = arg_25_1:FormatText(StoryNameCfg[927].name)

				arg_25_1.leftNameTxt_.text = var_28_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_18 = arg_25_1:GetWordFromCfg(412102006)
				local var_28_19 = arg_25_1:FormatText(var_28_18.content)

				arg_25_1.text_.text = var_28_19

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_20 = 7
				local var_28_21 = utf8.len(var_28_19)
				local var_28_22 = var_28_20 <= 0 and var_28_16 or var_28_16 * (var_28_21 / var_28_20)

				if var_28_22 > 0 and var_28_16 < var_28_22 then
					arg_25_1.talkMaxDuration = var_28_22

					if var_28_22 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_22 + var_28_15
					end
				end

				arg_25_1.text_.text = var_28_19
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102006", "story_v_out_412102.awb") ~= 0 then
					local var_28_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102006", "story_v_out_412102.awb") / 1000

					if var_28_23 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_23 + var_28_15
					end

					if var_28_18.prefab_name ~= "" and arg_25_1.actors_[var_28_18.prefab_name] ~= nil then
						local var_28_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_18.prefab_name].transform, "story_v_out_412102", "412102006", "story_v_out_412102.awb")

						arg_25_1:RecordAudio("412102006", var_28_24)
						arg_25_1:RecordAudio("412102006", var_28_24)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_412102", "412102006", "story_v_out_412102.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_412102", "412102006", "story_v_out_412102.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_25 = math.max(var_28_16, arg_25_1.talkMaxDuration)

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_25 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_15) / var_28_25

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_15 + var_28_25 and arg_25_1.time_ < var_28_15 + var_28_25 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play412102007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 412102007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play412102008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 1.15

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_2 = arg_29_1:GetWordFromCfg(412102007)
				local var_32_3 = arg_29_1:FormatText(var_32_2.content)

				arg_29_1.text_.text = var_32_3

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_4 = 46
				local var_32_5 = utf8.len(var_32_3)
				local var_32_6 = var_32_4 <= 0 and var_32_1 or var_32_1 * (var_32_5 / var_32_4)

				if var_32_6 > 0 and var_32_1 < var_32_6 then
					arg_29_1.talkMaxDuration = var_32_6

					if var_32_6 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_6 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_3
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_7 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_7 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_7

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_7 and arg_29_1.time_ < var_32_0 + var_32_7 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play412102008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 412102008
		arg_33_1.duration_ = 3.566

		local var_33_0 = {
			zh = 2.466,
			ja = 3.566
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
				arg_33_0:Play412102009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1097ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1097ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0, -0.54, -6.3)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1097ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["1097ui_story"]
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 and arg_33_1.var_.characterEffect1097ui_story == nil then
				arg_33_1.var_.characterEffect1097ui_story = var_36_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_11 = 0.200000002980232

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11

				if arg_33_1.var_.characterEffect1097ui_story then
					arg_33_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 and arg_33_1.var_.characterEffect1097ui_story then
				arg_33_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_36_13 = 0

			if var_36_13 < arg_33_1.time_ and arg_33_1.time_ <= var_36_13 + arg_36_0 then
				arg_33_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action2_1")
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_36_15 = 0
			local var_36_16 = 0.15

			if var_36_15 < arg_33_1.time_ and arg_33_1.time_ <= var_36_15 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_17 = arg_33_1:FormatText(StoryNameCfg[216].name)

				arg_33_1.leftNameTxt_.text = var_36_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_18 = arg_33_1:GetWordFromCfg(412102008)
				local var_36_19 = arg_33_1:FormatText(var_36_18.content)

				arg_33_1.text_.text = var_36_19

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_20 = 6
				local var_36_21 = utf8.len(var_36_19)
				local var_36_22 = var_36_20 <= 0 and var_36_16 or var_36_16 * (var_36_21 / var_36_20)

				if var_36_22 > 0 and var_36_16 < var_36_22 then
					arg_33_1.talkMaxDuration = var_36_22

					if var_36_22 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_22 + var_36_15
					end
				end

				arg_33_1.text_.text = var_36_19
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102008", "story_v_out_412102.awb") ~= 0 then
					local var_36_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102008", "story_v_out_412102.awb") / 1000

					if var_36_23 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_23 + var_36_15
					end

					if var_36_18.prefab_name ~= "" and arg_33_1.actors_[var_36_18.prefab_name] ~= nil then
						local var_36_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_18.prefab_name].transform, "story_v_out_412102", "412102008", "story_v_out_412102.awb")

						arg_33_1:RecordAudio("412102008", var_36_24)
						arg_33_1:RecordAudio("412102008", var_36_24)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_412102", "412102008", "story_v_out_412102.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_412102", "412102008", "story_v_out_412102.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_25 = math.max(var_36_16, arg_33_1.talkMaxDuration)

			if var_36_15 <= arg_33_1.time_ and arg_33_1.time_ < var_36_15 + var_36_25 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_15) / var_36_25

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_15 + var_36_25 and arg_33_1.time_ < var_36_15 + var_36_25 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play412102009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 412102009
		arg_37_1.duration_ = 2.3

		local var_37_0 = {
			zh = 2.3,
			ja = 2.166
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
				arg_37_0:Play412102010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1097ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1097ui_story == nil then
				arg_37_1.var_.characterEffect1097ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.200000002980232

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1097ui_story then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1097ui_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1097ui_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1097ui_story.fillRatio = var_40_5
			end

			local var_40_6 = "1197ui_story"

			if arg_37_1.actors_[var_40_6] == nil then
				local var_40_7 = Object.Instantiate(Asset.Load("Char/" .. var_40_6), arg_37_1.stage_.transform)

				var_40_7.name = var_40_6
				var_40_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.actors_[var_40_6] = var_40_7

				local var_40_8 = var_40_7:GetComponentInChildren(typeof(CharacterEffect))

				var_40_8.enabled = true

				local var_40_9 = GameObjectTools.GetOrAddComponent(var_40_7, typeof(DynamicBoneHelper))

				if var_40_9 then
					var_40_9:EnableDynamicBone(false)
				end

				arg_37_1:ShowWeapon(var_40_8.transform, false)

				arg_37_1.var_[var_40_6 .. "Animator"] = var_40_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_37_1.var_[var_40_6 .. "Animator"].applyRootMotion = true
				arg_37_1.var_[var_40_6 .. "LipSync"] = var_40_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_40_10 = arg_37_1.actors_["1197ui_story"].transform
			local var_40_11 = 0

			if var_40_11 < arg_37_1.time_ and arg_37_1.time_ <= var_40_11 + arg_40_0 then
				arg_37_1.var_.moveOldPos1197ui_story = var_40_10.localPosition
			end

			local var_40_12 = 0.001

			if var_40_11 <= arg_37_1.time_ and arg_37_1.time_ < var_40_11 + var_40_12 then
				local var_40_13 = (arg_37_1.time_ - var_40_11) / var_40_12
				local var_40_14 = Vector3.New(0.7, -0.545, -6.3)

				var_40_10.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1197ui_story, var_40_14, var_40_13)

				local var_40_15 = manager.ui.mainCamera.transform.position - var_40_10.position

				var_40_10.forward = Vector3.New(var_40_15.x, var_40_15.y, var_40_15.z)

				local var_40_16 = var_40_10.localEulerAngles

				var_40_16.z = 0
				var_40_16.x = 0
				var_40_10.localEulerAngles = var_40_16
			end

			if arg_37_1.time_ >= var_40_11 + var_40_12 and arg_37_1.time_ < var_40_11 + var_40_12 + arg_40_0 then
				var_40_10.localPosition = Vector3.New(0.7, -0.545, -6.3)

				local var_40_17 = manager.ui.mainCamera.transform.position - var_40_10.position

				var_40_10.forward = Vector3.New(var_40_17.x, var_40_17.y, var_40_17.z)

				local var_40_18 = var_40_10.localEulerAngles

				var_40_18.z = 0
				var_40_18.x = 0
				var_40_10.localEulerAngles = var_40_18
			end

			local var_40_19 = arg_37_1.actors_["1197ui_story"]
			local var_40_20 = 0

			if var_40_20 < arg_37_1.time_ and arg_37_1.time_ <= var_40_20 + arg_40_0 and arg_37_1.var_.characterEffect1197ui_story == nil then
				arg_37_1.var_.characterEffect1197ui_story = var_40_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_21 = 0.200000002980232

			if var_40_20 <= arg_37_1.time_ and arg_37_1.time_ < var_40_20 + var_40_21 then
				local var_40_22 = (arg_37_1.time_ - var_40_20) / var_40_21

				if arg_37_1.var_.characterEffect1197ui_story then
					arg_37_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_20 + var_40_21 and arg_37_1.time_ < var_40_20 + var_40_21 + arg_40_0 and arg_37_1.var_.characterEffect1197ui_story then
				arg_37_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_40_23 = 0

			if var_40_23 < arg_37_1.time_ and arg_37_1.time_ <= var_40_23 + arg_40_0 then
				arg_37_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action6_1")
			end

			local var_40_24 = 0

			if var_40_24 < arg_37_1.time_ and arg_37_1.time_ <= var_40_24 + arg_40_0 then
				arg_37_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_40_25 = arg_37_1.actors_["1097ui_story"].transform
			local var_40_26 = 0

			if var_40_26 < arg_37_1.time_ and arg_37_1.time_ <= var_40_26 + arg_40_0 then
				arg_37_1.var_.moveOldPos1097ui_story = var_40_25.localPosition
			end

			local var_40_27 = 0.001

			if var_40_26 <= arg_37_1.time_ and arg_37_1.time_ < var_40_26 + var_40_27 then
				local var_40_28 = (arg_37_1.time_ - var_40_26) / var_40_27
				local var_40_29 = Vector3.New(-0.7, -0.54, -6.3)

				var_40_25.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1097ui_story, var_40_29, var_40_28)

				local var_40_30 = manager.ui.mainCamera.transform.position - var_40_25.position

				var_40_25.forward = Vector3.New(var_40_30.x, var_40_30.y, var_40_30.z)

				local var_40_31 = var_40_25.localEulerAngles

				var_40_31.z = 0
				var_40_31.x = 0
				var_40_25.localEulerAngles = var_40_31
			end

			if arg_37_1.time_ >= var_40_26 + var_40_27 and arg_37_1.time_ < var_40_26 + var_40_27 + arg_40_0 then
				var_40_25.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_40_32 = manager.ui.mainCamera.transform.position - var_40_25.position

				var_40_25.forward = Vector3.New(var_40_32.x, var_40_32.y, var_40_32.z)

				local var_40_33 = var_40_25.localEulerAngles

				var_40_33.z = 0
				var_40_33.x = 0
				var_40_25.localEulerAngles = var_40_33
			end

			local var_40_34 = 0
			local var_40_35 = 0.2

			if var_40_34 < arg_37_1.time_ and arg_37_1.time_ <= var_40_34 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_36 = arg_37_1:FormatText(StoryNameCfg[927].name)

				arg_37_1.leftNameTxt_.text = var_40_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_37 = arg_37_1:GetWordFromCfg(412102009)
				local var_40_38 = arg_37_1:FormatText(var_40_37.content)

				arg_37_1.text_.text = var_40_38

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_39 = 8
				local var_40_40 = utf8.len(var_40_38)
				local var_40_41 = var_40_39 <= 0 and var_40_35 or var_40_35 * (var_40_40 / var_40_39)

				if var_40_41 > 0 and var_40_35 < var_40_41 then
					arg_37_1.talkMaxDuration = var_40_41

					if var_40_41 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_41 + var_40_34
					end
				end

				arg_37_1.text_.text = var_40_38
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102009", "story_v_out_412102.awb") ~= 0 then
					local var_40_42 = manager.audio:GetVoiceLength("story_v_out_412102", "412102009", "story_v_out_412102.awb") / 1000

					if var_40_42 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_42 + var_40_34
					end

					if var_40_37.prefab_name ~= "" and arg_37_1.actors_[var_40_37.prefab_name] ~= nil then
						local var_40_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_37.prefab_name].transform, "story_v_out_412102", "412102009", "story_v_out_412102.awb")

						arg_37_1:RecordAudio("412102009", var_40_43)
						arg_37_1:RecordAudio("412102009", var_40_43)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_412102", "412102009", "story_v_out_412102.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_412102", "412102009", "story_v_out_412102.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_44 = math.max(var_40_35, arg_37_1.talkMaxDuration)

			if var_40_34 <= arg_37_1.time_ and arg_37_1.time_ < var_40_34 + var_40_44 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_34) / var_40_44

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_34 + var_40_44 and arg_37_1.time_ < var_40_34 + var_40_44 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play412102010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 412102010
		arg_41_1.duration_ = 4.766

		local var_41_0 = {
			zh = 4.766,
			ja = 2.366
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
				arg_41_0:Play412102011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1097ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1097ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1097ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["1097ui_story"]
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect1097ui_story == nil then
				arg_41_1.var_.characterEffect1097ui_story = var_44_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_11 = 0.200000002980232

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11

				if arg_41_1.var_.characterEffect1097ui_story then
					arg_41_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect1097ui_story then
				arg_41_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_44_13 = 0

			if var_44_13 < arg_41_1.time_ and arg_41_1.time_ <= var_44_13 + arg_44_0 then
				arg_41_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action2_2")
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_44_15 = arg_41_1.actors_["1197ui_story"]
			local var_44_16 = 0

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 and arg_41_1.var_.characterEffect1197ui_story == nil then
				arg_41_1.var_.characterEffect1197ui_story = var_44_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_17 = 0.200000002980232

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_17 then
				local var_44_18 = (arg_41_1.time_ - var_44_16) / var_44_17

				if arg_41_1.var_.characterEffect1197ui_story then
					local var_44_19 = Mathf.Lerp(0, 0.5, var_44_18)

					arg_41_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1197ui_story.fillRatio = var_44_19
				end
			end

			if arg_41_1.time_ >= var_44_16 + var_44_17 and arg_41_1.time_ < var_44_16 + var_44_17 + arg_44_0 and arg_41_1.var_.characterEffect1197ui_story then
				local var_44_20 = 0.5

				arg_41_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1197ui_story.fillRatio = var_44_20
			end

			local var_44_21 = 0
			local var_44_22 = 0.375

			if var_44_21 < arg_41_1.time_ and arg_41_1.time_ <= var_44_21 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_23 = arg_41_1:FormatText(StoryNameCfg[928].name)

				arg_41_1.leftNameTxt_.text = var_44_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_24 = arg_41_1:GetWordFromCfg(412102010)
				local var_44_25 = arg_41_1:FormatText(var_44_24.content)

				arg_41_1.text_.text = var_44_25

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_26 = 15
				local var_44_27 = utf8.len(var_44_25)
				local var_44_28 = var_44_26 <= 0 and var_44_22 or var_44_22 * (var_44_27 / var_44_26)

				if var_44_28 > 0 and var_44_22 < var_44_28 then
					arg_41_1.talkMaxDuration = var_44_28

					if var_44_28 + var_44_21 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_28 + var_44_21
					end
				end

				arg_41_1.text_.text = var_44_25
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102010", "story_v_out_412102.awb") ~= 0 then
					local var_44_29 = manager.audio:GetVoiceLength("story_v_out_412102", "412102010", "story_v_out_412102.awb") / 1000

					if var_44_29 + var_44_21 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_29 + var_44_21
					end

					if var_44_24.prefab_name ~= "" and arg_41_1.actors_[var_44_24.prefab_name] ~= nil then
						local var_44_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_24.prefab_name].transform, "story_v_out_412102", "412102010", "story_v_out_412102.awb")

						arg_41_1:RecordAudio("412102010", var_44_30)
						arg_41_1:RecordAudio("412102010", var_44_30)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_412102", "412102010", "story_v_out_412102.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_412102", "412102010", "story_v_out_412102.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_31 = math.max(var_44_22, arg_41_1.talkMaxDuration)

			if var_44_21 <= arg_41_1.time_ and arg_41_1.time_ < var_44_21 + var_44_31 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_21) / var_44_31

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_21 + var_44_31 and arg_41_1.time_ < var_44_21 + var_44_31 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play412102011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 412102011
		arg_45_1.duration_ = 3.4

		local var_45_0 = {
			zh = 1.999999999999,
			ja = 3.4
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
				arg_45_0:Play412102012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1097ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1097ui_story == nil then
				arg_45_1.var_.characterEffect1097ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1097ui_story then
					local var_48_4 = Mathf.Lerp(0, 0.5, var_48_3)

					arg_45_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1097ui_story.fillRatio = var_48_4
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1097ui_story then
				local var_48_5 = 0.5

				arg_45_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1097ui_story.fillRatio = var_48_5
			end

			local var_48_6 = 0

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action6_2")
			end

			local var_48_7 = 0

			if var_48_7 < arg_45_1.time_ and arg_45_1.time_ <= var_48_7 + arg_48_0 then
				arg_45_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_48_8 = arg_45_1.actors_["1197ui_story"]
			local var_48_9 = 0

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 and arg_45_1.var_.characterEffect1197ui_story == nil then
				arg_45_1.var_.characterEffect1197ui_story = var_48_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_10 = 0.200000002980232

			if var_48_9 <= arg_45_1.time_ and arg_45_1.time_ < var_48_9 + var_48_10 then
				local var_48_11 = (arg_45_1.time_ - var_48_9) / var_48_10

				if arg_45_1.var_.characterEffect1197ui_story then
					arg_45_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_9 + var_48_10 and arg_45_1.time_ < var_48_9 + var_48_10 + arg_48_0 and arg_45_1.var_.characterEffect1197ui_story then
				arg_45_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_48_12 = 0
			local var_48_13 = 0.175

			if var_48_12 < arg_45_1.time_ and arg_45_1.time_ <= var_48_12 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_14 = arg_45_1:FormatText(StoryNameCfg[927].name)

				arg_45_1.leftNameTxt_.text = var_48_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_15 = arg_45_1:GetWordFromCfg(412102011)
				local var_48_16 = arg_45_1:FormatText(var_48_15.content)

				arg_45_1.text_.text = var_48_16

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_17 = 7
				local var_48_18 = utf8.len(var_48_16)
				local var_48_19 = var_48_17 <= 0 and var_48_13 or var_48_13 * (var_48_18 / var_48_17)

				if var_48_19 > 0 and var_48_13 < var_48_19 then
					arg_45_1.talkMaxDuration = var_48_19

					if var_48_19 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_19 + var_48_12
					end
				end

				arg_45_1.text_.text = var_48_16
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102011", "story_v_out_412102.awb") ~= 0 then
					local var_48_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102011", "story_v_out_412102.awb") / 1000

					if var_48_20 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_20 + var_48_12
					end

					if var_48_15.prefab_name ~= "" and arg_45_1.actors_[var_48_15.prefab_name] ~= nil then
						local var_48_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_15.prefab_name].transform, "story_v_out_412102", "412102011", "story_v_out_412102.awb")

						arg_45_1:RecordAudio("412102011", var_48_21)
						arg_45_1:RecordAudio("412102011", var_48_21)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_412102", "412102011", "story_v_out_412102.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_412102", "412102011", "story_v_out_412102.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_22 = math.max(var_48_13, arg_45_1.talkMaxDuration)

			if var_48_12 <= arg_45_1.time_ and arg_45_1.time_ < var_48_12 + var_48_22 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_12) / var_48_22

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_12 + var_48_22 and arg_45_1.time_ < var_48_12 + var_48_22 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play412102012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 412102012
		arg_49_1.duration_ = 4.466

		local var_49_0 = {
			zh = 1.999999999999,
			ja = 4.466
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
				arg_49_0:Play412102013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1097ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect1097ui_story == nil then
				arg_49_1.var_.characterEffect1097ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1097ui_story then
					arg_49_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect1097ui_story then
				arg_49_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_52_4 = 0

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 then
				arg_49_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_52_6 = arg_49_1.actors_["1197ui_story"]
			local var_52_7 = 0

			if var_52_7 < arg_49_1.time_ and arg_49_1.time_ <= var_52_7 + arg_52_0 and arg_49_1.var_.characterEffect1197ui_story == nil then
				arg_49_1.var_.characterEffect1197ui_story = var_52_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_8 = 0.200000002980232

			if var_52_7 <= arg_49_1.time_ and arg_49_1.time_ < var_52_7 + var_52_8 then
				local var_52_9 = (arg_49_1.time_ - var_52_7) / var_52_8

				if arg_49_1.var_.characterEffect1197ui_story then
					local var_52_10 = Mathf.Lerp(0, 0.5, var_52_9)

					arg_49_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1197ui_story.fillRatio = var_52_10
				end
			end

			if arg_49_1.time_ >= var_52_7 + var_52_8 and arg_49_1.time_ < var_52_7 + var_52_8 + arg_52_0 and arg_49_1.var_.characterEffect1197ui_story then
				local var_52_11 = 0.5

				arg_49_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1197ui_story.fillRatio = var_52_11
			end

			local var_52_12 = 0
			local var_52_13 = 0.175

			if var_52_12 < arg_49_1.time_ and arg_49_1.time_ <= var_52_12 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_14 = arg_49_1:FormatText(StoryNameCfg[928].name)

				arg_49_1.leftNameTxt_.text = var_52_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_15 = arg_49_1:GetWordFromCfg(412102012)
				local var_52_16 = arg_49_1:FormatText(var_52_15.content)

				arg_49_1.text_.text = var_52_16

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_17 = 7
				local var_52_18 = utf8.len(var_52_16)
				local var_52_19 = var_52_17 <= 0 and var_52_13 or var_52_13 * (var_52_18 / var_52_17)

				if var_52_19 > 0 and var_52_13 < var_52_19 then
					arg_49_1.talkMaxDuration = var_52_19

					if var_52_19 + var_52_12 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_19 + var_52_12
					end
				end

				arg_49_1.text_.text = var_52_16
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102012", "story_v_out_412102.awb") ~= 0 then
					local var_52_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102012", "story_v_out_412102.awb") / 1000

					if var_52_20 + var_52_12 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_20 + var_52_12
					end

					if var_52_15.prefab_name ~= "" and arg_49_1.actors_[var_52_15.prefab_name] ~= nil then
						local var_52_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_15.prefab_name].transform, "story_v_out_412102", "412102012", "story_v_out_412102.awb")

						arg_49_1:RecordAudio("412102012", var_52_21)
						arg_49_1:RecordAudio("412102012", var_52_21)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_412102", "412102012", "story_v_out_412102.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_412102", "412102012", "story_v_out_412102.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_22 = math.max(var_52_13, arg_49_1.talkMaxDuration)

			if var_52_12 <= arg_49_1.time_ and arg_49_1.time_ < var_52_12 + var_52_22 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_12) / var_52_22

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_12 + var_52_22 and arg_49_1.time_ < var_52_12 + var_52_22 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play412102013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 412102013
		arg_53_1.duration_ = 5.433

		local var_53_0 = {
			zh = 5.1,
			ja = 5.433
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
				arg_53_0:Play412102014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1097ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1097ui_story == nil then
				arg_53_1.var_.characterEffect1097ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1097ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1097ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1097ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1097ui_story.fillRatio = var_56_5
			end

			local var_56_6 = arg_53_1.actors_["1197ui_story"]
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 and arg_53_1.var_.characterEffect1197ui_story == nil then
				arg_53_1.var_.characterEffect1197ui_story = var_56_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_8 = 0.200000002980232

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_8 then
				local var_56_9 = (arg_53_1.time_ - var_56_7) / var_56_8

				if arg_53_1.var_.characterEffect1197ui_story then
					arg_53_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_7 + var_56_8 and arg_53_1.time_ < var_56_7 + var_56_8 + arg_56_0 and arg_53_1.var_.characterEffect1197ui_story then
				arg_53_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_56_10 = 0
			local var_56_11 = 0.4

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_12 = arg_53_1:FormatText(StoryNameCfg[927].name)

				arg_53_1.leftNameTxt_.text = var_56_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_13 = arg_53_1:GetWordFromCfg(412102013)
				local var_56_14 = arg_53_1:FormatText(var_56_13.content)

				arg_53_1.text_.text = var_56_14

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_15 = 16
				local var_56_16 = utf8.len(var_56_14)
				local var_56_17 = var_56_15 <= 0 and var_56_11 or var_56_11 * (var_56_16 / var_56_15)

				if var_56_17 > 0 and var_56_11 < var_56_17 then
					arg_53_1.talkMaxDuration = var_56_17

					if var_56_17 + var_56_10 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_17 + var_56_10
					end
				end

				arg_53_1.text_.text = var_56_14
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102013", "story_v_out_412102.awb") ~= 0 then
					local var_56_18 = manager.audio:GetVoiceLength("story_v_out_412102", "412102013", "story_v_out_412102.awb") / 1000

					if var_56_18 + var_56_10 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_18 + var_56_10
					end

					if var_56_13.prefab_name ~= "" and arg_53_1.actors_[var_56_13.prefab_name] ~= nil then
						local var_56_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_13.prefab_name].transform, "story_v_out_412102", "412102013", "story_v_out_412102.awb")

						arg_53_1:RecordAudio("412102013", var_56_19)
						arg_53_1:RecordAudio("412102013", var_56_19)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_412102", "412102013", "story_v_out_412102.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_412102", "412102013", "story_v_out_412102.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_20 = math.max(var_56_11, arg_53_1.talkMaxDuration)

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_20 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_10) / var_56_20

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_10 + var_56_20 and arg_53_1.time_ < var_56_10 + var_56_20 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play412102014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 412102014
		arg_57_1.duration_ = 7.233

		local var_57_0 = {
			zh = 7.233,
			ja = 5.8
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
				arg_57_0:Play412102015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1097ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1097ui_story == nil then
				arg_57_1.var_.characterEffect1097ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1097ui_story then
					arg_57_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1097ui_story then
				arg_57_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_60_4 = arg_57_1.actors_["1197ui_story"]
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 and arg_57_1.var_.characterEffect1197ui_story == nil then
				arg_57_1.var_.characterEffect1197ui_story = var_60_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_6 = 0.200000002980232

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_6 then
				local var_60_7 = (arg_57_1.time_ - var_60_5) / var_60_6

				if arg_57_1.var_.characterEffect1197ui_story then
					local var_60_8 = Mathf.Lerp(0, 0.5, var_60_7)

					arg_57_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1197ui_story.fillRatio = var_60_8
				end
			end

			if arg_57_1.time_ >= var_60_5 + var_60_6 and arg_57_1.time_ < var_60_5 + var_60_6 + arg_60_0 and arg_57_1.var_.characterEffect1197ui_story then
				local var_60_9 = 0.5

				arg_57_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1197ui_story.fillRatio = var_60_9
			end

			local var_60_10 = 0
			local var_60_11 = 0.625

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_12 = arg_57_1:FormatText(StoryNameCfg[928].name)

				arg_57_1.leftNameTxt_.text = var_60_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_13 = arg_57_1:GetWordFromCfg(412102014)
				local var_60_14 = arg_57_1:FormatText(var_60_13.content)

				arg_57_1.text_.text = var_60_14

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_15 = 25
				local var_60_16 = utf8.len(var_60_14)
				local var_60_17 = var_60_15 <= 0 and var_60_11 or var_60_11 * (var_60_16 / var_60_15)

				if var_60_17 > 0 and var_60_11 < var_60_17 then
					arg_57_1.talkMaxDuration = var_60_17

					if var_60_17 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_17 + var_60_10
					end
				end

				arg_57_1.text_.text = var_60_14
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102014", "story_v_out_412102.awb") ~= 0 then
					local var_60_18 = manager.audio:GetVoiceLength("story_v_out_412102", "412102014", "story_v_out_412102.awb") / 1000

					if var_60_18 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_18 + var_60_10
					end

					if var_60_13.prefab_name ~= "" and arg_57_1.actors_[var_60_13.prefab_name] ~= nil then
						local var_60_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_13.prefab_name].transform, "story_v_out_412102", "412102014", "story_v_out_412102.awb")

						arg_57_1:RecordAudio("412102014", var_60_19)
						arg_57_1:RecordAudio("412102014", var_60_19)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_412102", "412102014", "story_v_out_412102.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_412102", "412102014", "story_v_out_412102.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_20 = math.max(var_60_11, arg_57_1.talkMaxDuration)

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_20 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_10) / var_60_20

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_10 + var_60_20 and arg_57_1.time_ < var_60_10 + var_60_20 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play412102015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 412102015
		arg_61_1.duration_ = 6.566

		local var_61_0 = {
			zh = 5.066,
			ja = 6.566
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
				arg_61_0:Play412102016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1097ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1097ui_story == nil then
				arg_61_1.var_.characterEffect1097ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1097ui_story then
					local var_64_4 = Mathf.Lerp(0, 0.5, var_64_3)

					arg_61_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1097ui_story.fillRatio = var_64_4
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1097ui_story then
				local var_64_5 = 0.5

				arg_61_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1097ui_story.fillRatio = var_64_5
			end

			local var_64_6 = arg_61_1.actors_["1197ui_story"]
			local var_64_7 = 0

			if var_64_7 < arg_61_1.time_ and arg_61_1.time_ <= var_64_7 + arg_64_0 and arg_61_1.var_.characterEffect1197ui_story == nil then
				arg_61_1.var_.characterEffect1197ui_story = var_64_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_8 = 0.200000002980232

			if var_64_7 <= arg_61_1.time_ and arg_61_1.time_ < var_64_7 + var_64_8 then
				local var_64_9 = (arg_61_1.time_ - var_64_7) / var_64_8

				if arg_61_1.var_.characterEffect1197ui_story then
					arg_61_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_7 + var_64_8 and arg_61_1.time_ < var_64_7 + var_64_8 + arg_64_0 and arg_61_1.var_.characterEffect1197ui_story then
				arg_61_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_64_10 = 0
			local var_64_11 = 0.475

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_12 = arg_61_1:FormatText(StoryNameCfg[927].name)

				arg_61_1.leftNameTxt_.text = var_64_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_13 = arg_61_1:GetWordFromCfg(412102015)
				local var_64_14 = arg_61_1:FormatText(var_64_13.content)

				arg_61_1.text_.text = var_64_14

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_15 = 19
				local var_64_16 = utf8.len(var_64_14)
				local var_64_17 = var_64_15 <= 0 and var_64_11 or var_64_11 * (var_64_16 / var_64_15)

				if var_64_17 > 0 and var_64_11 < var_64_17 then
					arg_61_1.talkMaxDuration = var_64_17

					if var_64_17 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_17 + var_64_10
					end
				end

				arg_61_1.text_.text = var_64_14
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102015", "story_v_out_412102.awb") ~= 0 then
					local var_64_18 = manager.audio:GetVoiceLength("story_v_out_412102", "412102015", "story_v_out_412102.awb") / 1000

					if var_64_18 + var_64_10 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_18 + var_64_10
					end

					if var_64_13.prefab_name ~= "" and arg_61_1.actors_[var_64_13.prefab_name] ~= nil then
						local var_64_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_13.prefab_name].transform, "story_v_out_412102", "412102015", "story_v_out_412102.awb")

						arg_61_1:RecordAudio("412102015", var_64_19)
						arg_61_1:RecordAudio("412102015", var_64_19)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_412102", "412102015", "story_v_out_412102.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_412102", "412102015", "story_v_out_412102.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_20 = math.max(var_64_11, arg_61_1.talkMaxDuration)

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_20 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_10) / var_64_20

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_10 + var_64_20 and arg_61_1.time_ < var_64_10 + var_64_20 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play412102016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 412102016
		arg_65_1.duration_ = 5.2

		local var_65_0 = {
			zh = 2,
			ja = 5.2
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
				arg_65_0:Play412102017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1097ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect1097ui_story == nil then
				arg_65_1.var_.characterEffect1097ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.200000002980232

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect1097ui_story then
					arg_65_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect1097ui_story then
				arg_65_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_68_4 = 0

			if var_68_4 < arg_65_1.time_ and arg_65_1.time_ <= var_68_4 + arg_68_0 then
				arg_65_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_68_5 = 0

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 then
				arg_65_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_68_6 = arg_65_1.actors_["1197ui_story"]
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 and arg_65_1.var_.characterEffect1197ui_story == nil then
				arg_65_1.var_.characterEffect1197ui_story = var_68_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_8 = 0.200000002980232

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8

				if arg_65_1.var_.characterEffect1197ui_story then
					local var_68_10 = Mathf.Lerp(0, 0.5, var_68_9)

					arg_65_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1197ui_story.fillRatio = var_68_10
				end
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 and arg_65_1.var_.characterEffect1197ui_story then
				local var_68_11 = 0.5

				arg_65_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1197ui_story.fillRatio = var_68_11
			end

			local var_68_12 = 0
			local var_68_13 = 0.125

			if var_68_12 < arg_65_1.time_ and arg_65_1.time_ <= var_68_12 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_14 = arg_65_1:FormatText(StoryNameCfg[928].name)

				arg_65_1.leftNameTxt_.text = var_68_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_15 = arg_65_1:GetWordFromCfg(412102016)
				local var_68_16 = arg_65_1:FormatText(var_68_15.content)

				arg_65_1.text_.text = var_68_16

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_17 = 5
				local var_68_18 = utf8.len(var_68_16)
				local var_68_19 = var_68_17 <= 0 and var_68_13 or var_68_13 * (var_68_18 / var_68_17)

				if var_68_19 > 0 and var_68_13 < var_68_19 then
					arg_65_1.talkMaxDuration = var_68_19

					if var_68_19 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_19 + var_68_12
					end
				end

				arg_65_1.text_.text = var_68_16
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102016", "story_v_out_412102.awb") ~= 0 then
					local var_68_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102016", "story_v_out_412102.awb") / 1000

					if var_68_20 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_20 + var_68_12
					end

					if var_68_15.prefab_name ~= "" and arg_65_1.actors_[var_68_15.prefab_name] ~= nil then
						local var_68_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_15.prefab_name].transform, "story_v_out_412102", "412102016", "story_v_out_412102.awb")

						arg_65_1:RecordAudio("412102016", var_68_21)
						arg_65_1:RecordAudio("412102016", var_68_21)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_412102", "412102016", "story_v_out_412102.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_412102", "412102016", "story_v_out_412102.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_22 = math.max(var_68_13, arg_65_1.talkMaxDuration)

			if var_68_12 <= arg_65_1.time_ and arg_65_1.time_ < var_68_12 + var_68_22 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_12) / var_68_22

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_12 + var_68_22 and arg_65_1.time_ < var_68_12 + var_68_22 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play412102017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 412102017
		arg_69_1.duration_ = 7.233

		local var_69_0 = {
			zh = 7.233,
			ja = 5.833
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
				arg_69_0:Play412102018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1097ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1097ui_story == nil then
				arg_69_1.var_.characterEffect1097ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1097ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1097ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1097ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1097ui_story.fillRatio = var_72_5
			end

			local var_72_6 = 0

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action9_1")
			end

			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 then
				arg_69_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_72_8 = arg_69_1.actors_["1197ui_story"]
			local var_72_9 = 0

			if var_72_9 < arg_69_1.time_ and arg_69_1.time_ <= var_72_9 + arg_72_0 and arg_69_1.var_.characterEffect1197ui_story == nil then
				arg_69_1.var_.characterEffect1197ui_story = var_72_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_10 = 0.200000002980232

			if var_72_9 <= arg_69_1.time_ and arg_69_1.time_ < var_72_9 + var_72_10 then
				local var_72_11 = (arg_69_1.time_ - var_72_9) / var_72_10

				if arg_69_1.var_.characterEffect1197ui_story then
					arg_69_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_9 + var_72_10 and arg_69_1.time_ < var_72_9 + var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect1197ui_story then
				arg_69_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_72_12 = 0
			local var_72_13 = 0.675

			if var_72_12 < arg_69_1.time_ and arg_69_1.time_ <= var_72_12 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_14 = arg_69_1:FormatText(StoryNameCfg[927].name)

				arg_69_1.leftNameTxt_.text = var_72_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_15 = arg_69_1:GetWordFromCfg(412102017)
				local var_72_16 = arg_69_1:FormatText(var_72_15.content)

				arg_69_1.text_.text = var_72_16

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_17 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102017", "story_v_out_412102.awb") ~= 0 then
					local var_72_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102017", "story_v_out_412102.awb") / 1000

					if var_72_20 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_12
					end

					if var_72_15.prefab_name ~= "" and arg_69_1.actors_[var_72_15.prefab_name] ~= nil then
						local var_72_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_15.prefab_name].transform, "story_v_out_412102", "412102017", "story_v_out_412102.awb")

						arg_69_1:RecordAudio("412102017", var_72_21)
						arg_69_1:RecordAudio("412102017", var_72_21)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_412102", "412102017", "story_v_out_412102.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_412102", "412102017", "story_v_out_412102.awb")
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
	Play412102018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 412102018
		arg_73_1.duration_ = 7.733

		local var_73_0 = {
			zh = 6.666,
			ja = 7.733
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
				arg_73_0:Play412102019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_76_2 = arg_73_1.actors_["1097ui_story"]
			local var_76_3 = 0

			if var_76_3 < arg_73_1.time_ and arg_73_1.time_ <= var_76_3 + arg_76_0 and arg_73_1.var_.characterEffect1097ui_story == nil then
				arg_73_1.var_.characterEffect1097ui_story = var_76_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_4 = 0.2

			if var_76_3 <= arg_73_1.time_ and arg_73_1.time_ < var_76_3 + var_76_4 then
				local var_76_5 = (arg_73_1.time_ - var_76_3) / var_76_4

				if arg_73_1.var_.characterEffect1097ui_story then
					arg_73_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_3 + var_76_4 and arg_73_1.time_ < var_76_3 + var_76_4 + arg_76_0 and arg_73_1.var_.characterEffect1097ui_story then
				arg_73_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_76_6 = arg_73_1.actors_["1197ui_story"]
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 and arg_73_1.var_.characterEffect1197ui_story == nil then
				arg_73_1.var_.characterEffect1197ui_story = var_76_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_8 = 0.2

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8

				if arg_73_1.var_.characterEffect1197ui_story then
					local var_76_10 = Mathf.Lerp(0, 0.5, var_76_9)

					arg_73_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1197ui_story.fillRatio = var_76_10
				end
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 and arg_73_1.var_.characterEffect1197ui_story then
				local var_76_11 = 0.5

				arg_73_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1197ui_story.fillRatio = var_76_11
			end

			local var_76_12 = 0
			local var_76_13 = 0.4

			if var_76_12 < arg_73_1.time_ and arg_73_1.time_ <= var_76_12 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_14 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_14:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_15 = arg_73_1:FormatText(StoryNameCfg[928].name)

				arg_73_1.leftNameTxt_.text = var_76_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_16 = arg_73_1:GetWordFromCfg(412102018)
				local var_76_17 = arg_73_1:FormatText(var_76_16.content)

				arg_73_1.text_.text = var_76_17

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_18 = 16
				local var_76_19 = utf8.len(var_76_17)
				local var_76_20 = var_76_18 <= 0 and var_76_13 or var_76_13 * (var_76_19 / var_76_18)

				if var_76_20 > 0 and var_76_13 < var_76_20 then
					arg_73_1.talkMaxDuration = var_76_20
					var_76_12 = var_76_12 + 0.3

					if var_76_20 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_12
					end
				end

				arg_73_1.text_.text = var_76_17
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102018", "story_v_out_412102.awb") ~= 0 then
					local var_76_21 = manager.audio:GetVoiceLength("story_v_out_412102", "412102018", "story_v_out_412102.awb") / 1000

					if var_76_21 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_21 + var_76_12
					end

					if var_76_16.prefab_name ~= "" and arg_73_1.actors_[var_76_16.prefab_name] ~= nil then
						local var_76_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_16.prefab_name].transform, "story_v_out_412102", "412102018", "story_v_out_412102.awb")

						arg_73_1:RecordAudio("412102018", var_76_22)
						arg_73_1:RecordAudio("412102018", var_76_22)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_412102", "412102018", "story_v_out_412102.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_412102", "412102018", "story_v_out_412102.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_23 = var_76_12 + 0.3
			local var_76_24 = math.max(var_76_13, arg_73_1.talkMaxDuration)

			if var_76_23 <= arg_73_1.time_ and arg_73_1.time_ < var_76_23 + var_76_24 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_23) / var_76_24

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_23 + var_76_24 and arg_73_1.time_ < var_76_23 + var_76_24 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play412102019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 412102019
		arg_79_1.duration_ = 8.999999999999

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play412102020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 2

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				local var_82_1 = manager.ui.mainCamera.transform.localPosition
				local var_82_2 = Vector3.New(0, 0, 10) + Vector3.New(var_82_1.x, var_82_1.y, 0)
				local var_82_3 = arg_79_1.bgs_.ST30a

				var_82_3.transform.localPosition = var_82_2
				var_82_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_82_4 = var_82_3:GetComponent("SpriteRenderer")

				if var_82_4 and var_82_4.sprite then
					local var_82_5 = (var_82_3.transform.localPosition - var_82_1).z
					local var_82_6 = manager.ui.mainCameraCom_
					local var_82_7 = 2 * var_82_5 * Mathf.Tan(var_82_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_82_8 = var_82_7 * var_82_6.aspect
					local var_82_9 = var_82_4.sprite.bounds.size.x
					local var_82_10 = var_82_4.sprite.bounds.size.y
					local var_82_11 = var_82_8 / var_82_9
					local var_82_12 = var_82_7 / var_82_10
					local var_82_13 = var_82_12 < var_82_11 and var_82_11 or var_82_12

					var_82_3.transform.localScale = Vector3.New(var_82_13, var_82_13, 0)
				end

				for iter_82_0, iter_82_1 in pairs(arg_79_1.bgs_) do
					if iter_82_0 ~= "ST30a" then
						iter_82_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_82_14 = 3.999999999999

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1.allBtn_.enabled = false
			end

			local var_82_15 = 0.3

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 then
				arg_79_1.allBtn_.enabled = true
			end

			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_17 = 2

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17
				local var_82_19 = Color.New(0, 0, 0)

				var_82_19.a = Mathf.Lerp(0, 1, var_82_18)
				arg_79_1.mask_.color = var_82_19
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 then
				local var_82_20 = Color.New(0, 0, 0)

				var_82_20.a = 1
				arg_79_1.mask_.color = var_82_20
			end

			local var_82_21 = 2

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_22 = 2

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_22 then
				local var_82_23 = (arg_79_1.time_ - var_82_21) / var_82_22
				local var_82_24 = Color.New(0, 0, 0)

				var_82_24.a = Mathf.Lerp(1, 0, var_82_23)
				arg_79_1.mask_.color = var_82_24
			end

			if arg_79_1.time_ >= var_82_21 + var_82_22 and arg_79_1.time_ < var_82_21 + var_82_22 + arg_82_0 then
				local var_82_25 = Color.New(0, 0, 0)
				local var_82_26 = 0

				arg_79_1.mask_.enabled = false
				var_82_25.a = var_82_26
				arg_79_1.mask_.color = var_82_25
			end

			local var_82_27 = arg_79_1.actors_["1097ui_story"].transform
			local var_82_28 = 1.96599999815226

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 then
				arg_79_1.var_.moveOldPos1097ui_story = var_82_27.localPosition
			end

			local var_82_29 = 0.001

			if var_82_28 <= arg_79_1.time_ and arg_79_1.time_ < var_82_28 + var_82_29 then
				local var_82_30 = (arg_79_1.time_ - var_82_28) / var_82_29
				local var_82_31 = Vector3.New(0, 100, 0)

				var_82_27.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1097ui_story, var_82_31, var_82_30)

				local var_82_32 = manager.ui.mainCamera.transform.position - var_82_27.position

				var_82_27.forward = Vector3.New(var_82_32.x, var_82_32.y, var_82_32.z)

				local var_82_33 = var_82_27.localEulerAngles

				var_82_33.z = 0
				var_82_33.x = 0
				var_82_27.localEulerAngles = var_82_33
			end

			if arg_79_1.time_ >= var_82_28 + var_82_29 and arg_79_1.time_ < var_82_28 + var_82_29 + arg_82_0 then
				var_82_27.localPosition = Vector3.New(0, 100, 0)

				local var_82_34 = manager.ui.mainCamera.transform.position - var_82_27.position

				var_82_27.forward = Vector3.New(var_82_34.x, var_82_34.y, var_82_34.z)

				local var_82_35 = var_82_27.localEulerAngles

				var_82_35.z = 0
				var_82_35.x = 0
				var_82_27.localEulerAngles = var_82_35
			end

			local var_82_36 = arg_79_1.actors_["1197ui_story"].transform
			local var_82_37 = 1.96599999815226

			if var_82_37 < arg_79_1.time_ and arg_79_1.time_ <= var_82_37 + arg_82_0 then
				arg_79_1.var_.moveOldPos1197ui_story = var_82_36.localPosition
			end

			local var_82_38 = 0.001

			if var_82_37 <= arg_79_1.time_ and arg_79_1.time_ < var_82_37 + var_82_38 then
				local var_82_39 = (arg_79_1.time_ - var_82_37) / var_82_38
				local var_82_40 = Vector3.New(0, 100, 0)

				var_82_36.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1197ui_story, var_82_40, var_82_39)

				local var_82_41 = manager.ui.mainCamera.transform.position - var_82_36.position

				var_82_36.forward = Vector3.New(var_82_41.x, var_82_41.y, var_82_41.z)

				local var_82_42 = var_82_36.localEulerAngles

				var_82_42.z = 0
				var_82_42.x = 0
				var_82_36.localEulerAngles = var_82_42
			end

			if arg_79_1.time_ >= var_82_37 + var_82_38 and arg_79_1.time_ < var_82_37 + var_82_38 + arg_82_0 then
				var_82_36.localPosition = Vector3.New(0, 100, 0)

				local var_82_43 = manager.ui.mainCamera.transform.position - var_82_36.position

				var_82_36.forward = Vector3.New(var_82_43.x, var_82_43.y, var_82_43.z)

				local var_82_44 = var_82_36.localEulerAngles

				var_82_44.z = 0
				var_82_44.x = 0
				var_82_36.localEulerAngles = var_82_44
			end

			if arg_79_1.frameCnt_ <= 1 then
				arg_79_1.dialog_:SetActive(false)
			end

			local var_82_45 = 3.999999999999
			local var_82_46 = 1.2

			if var_82_45 < arg_79_1.time_ and arg_79_1.time_ <= var_82_45 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				arg_79_1.dialog_:SetActive(true)

				local var_82_47 = LeanTween.value(arg_79_1.dialog_, 0, 1, 0.3)

				var_82_47:setOnUpdate(LuaHelper.FloatAction(function(arg_83_0)
					arg_79_1.dialogCg_.alpha = arg_83_0
				end))
				var_82_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_79_1.dialog_)
					var_82_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_79_1.duration_ = arg_79_1.duration_ + 0.3

				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_48 = arg_79_1:GetWordFromCfg(412102019)
				local var_82_49 = arg_79_1:FormatText(var_82_48.content)

				arg_79_1.text_.text = var_82_49

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_50 = 48
				local var_82_51 = utf8.len(var_82_49)
				local var_82_52 = var_82_50 <= 0 and var_82_46 or var_82_46 * (var_82_51 / var_82_50)

				if var_82_52 > 0 and var_82_46 < var_82_52 then
					arg_79_1.talkMaxDuration = var_82_52
					var_82_45 = var_82_45 + 0.3

					if var_82_52 + var_82_45 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_52 + var_82_45
					end
				end

				arg_79_1.text_.text = var_82_49
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_53 = var_82_45 + 0.3
			local var_82_54 = math.max(var_82_46, arg_79_1.talkMaxDuration)

			if var_82_53 <= arg_79_1.time_ and arg_79_1.time_ < var_82_53 + var_82_54 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_53) / var_82_54

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_53 + var_82_54 and arg_79_1.time_ < var_82_53 + var_82_54 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play412102020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 412102020
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play412102021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.8

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_2 = arg_85_1:GetWordFromCfg(412102020)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 32
				local var_88_5 = utf8.len(var_88_3)
				local var_88_6 = var_88_4 <= 0 and var_88_1 or var_88_1 * (var_88_5 / var_88_4)

				if var_88_6 > 0 and var_88_1 < var_88_6 then
					arg_85_1.talkMaxDuration = var_88_6

					if var_88_6 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_6 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_3
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_7 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_7 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_7

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_7 and arg_85_1.time_ < var_88_0 + var_88_7 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play412102021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 412102021
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play412102022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.5

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_2 = arg_89_1:GetWordFromCfg(412102021)
				local var_92_3 = arg_89_1:FormatText(var_92_2.content)

				arg_89_1.text_.text = var_92_3

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_4 = 20
				local var_92_5 = utf8.len(var_92_3)
				local var_92_6 = var_92_4 <= 0 and var_92_1 or var_92_1 * (var_92_5 / var_92_4)

				if var_92_6 > 0 and var_92_1 < var_92_6 then
					arg_89_1.talkMaxDuration = var_92_6

					if var_92_6 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_6 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_3
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_7 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_7 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_7

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_7 and arg_89_1.time_ < var_92_0 + var_92_7 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play412102022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 412102022
		arg_93_1.duration_ = 17.933

		local var_93_0 = {
			zh = 14.7,
			ja = 17.933
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play412102023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1197ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1197ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(0.7, -0.545, -6.3)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1197ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0.7, -0.545, -6.3)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["1197ui_story"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect1197ui_story == nil then
				arg_93_1.var_.characterEffect1197ui_story = var_96_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_11 = 0.200000002980232

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.characterEffect1197ui_story then
					arg_93_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.characterEffect1197ui_story then
				arg_93_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_96_13 = 0

			if var_96_13 < arg_93_1.time_ and arg_93_1.time_ <= var_96_13 + arg_96_0 then
				arg_93_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action9_2")
			end

			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_96_15 = arg_93_1.actors_["1097ui_story"].transform
			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 then
				arg_93_1.var_.moveOldPos1097ui_story = var_96_15.localPosition
			end

			local var_96_17 = 0.001

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_17 then
				local var_96_18 = (arg_93_1.time_ - var_96_16) / var_96_17
				local var_96_19 = Vector3.New(-0.7, -0.54, -6.3)

				var_96_15.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1097ui_story, var_96_19, var_96_18)

				local var_96_20 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_20.x, var_96_20.y, var_96_20.z)

				local var_96_21 = var_96_15.localEulerAngles

				var_96_21.z = 0
				var_96_21.x = 0
				var_96_15.localEulerAngles = var_96_21
			end

			if arg_93_1.time_ >= var_96_16 + var_96_17 and arg_93_1.time_ < var_96_16 + var_96_17 + arg_96_0 then
				var_96_15.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_96_22 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_22.x, var_96_22.y, var_96_22.z)

				local var_96_23 = var_96_15.localEulerAngles

				var_96_23.z = 0
				var_96_23.x = 0
				var_96_15.localEulerAngles = var_96_23
			end

			local var_96_24 = arg_93_1.actors_["1097ui_story"]
			local var_96_25 = 0

			if var_96_25 < arg_93_1.time_ and arg_93_1.time_ <= var_96_25 + arg_96_0 and arg_93_1.var_.characterEffect1097ui_story == nil then
				arg_93_1.var_.characterEffect1097ui_story = var_96_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_26 = 0.034000001847744

			if var_96_25 <= arg_93_1.time_ and arg_93_1.time_ < var_96_25 + var_96_26 then
				local var_96_27 = (arg_93_1.time_ - var_96_25) / var_96_26

				if arg_93_1.var_.characterEffect1097ui_story then
					local var_96_28 = Mathf.Lerp(0, 0.5, var_96_27)

					arg_93_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1097ui_story.fillRatio = var_96_28
				end
			end

			if arg_93_1.time_ >= var_96_25 + var_96_26 and arg_93_1.time_ < var_96_25 + var_96_26 + arg_96_0 and arg_93_1.var_.characterEffect1097ui_story then
				local var_96_29 = 0.5

				arg_93_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1097ui_story.fillRatio = var_96_29
			end

			local var_96_30 = 0
			local var_96_31 = 1.2

			if var_96_30 < arg_93_1.time_ and arg_93_1.time_ <= var_96_30 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_32 = arg_93_1:FormatText(StoryNameCfg[927].name)

				arg_93_1.leftNameTxt_.text = var_96_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_33 = arg_93_1:GetWordFromCfg(412102022)
				local var_96_34 = arg_93_1:FormatText(var_96_33.content)

				arg_93_1.text_.text = var_96_34

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_35 = 48
				local var_96_36 = utf8.len(var_96_34)
				local var_96_37 = var_96_35 <= 0 and var_96_31 or var_96_31 * (var_96_36 / var_96_35)

				if var_96_37 > 0 and var_96_31 < var_96_37 then
					arg_93_1.talkMaxDuration = var_96_37

					if var_96_37 + var_96_30 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_37 + var_96_30
					end
				end

				arg_93_1.text_.text = var_96_34
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102022", "story_v_out_412102.awb") ~= 0 then
					local var_96_38 = manager.audio:GetVoiceLength("story_v_out_412102", "412102022", "story_v_out_412102.awb") / 1000

					if var_96_38 + var_96_30 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_38 + var_96_30
					end

					if var_96_33.prefab_name ~= "" and arg_93_1.actors_[var_96_33.prefab_name] ~= nil then
						local var_96_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_33.prefab_name].transform, "story_v_out_412102", "412102022", "story_v_out_412102.awb")

						arg_93_1:RecordAudio("412102022", var_96_39)
						arg_93_1:RecordAudio("412102022", var_96_39)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_412102", "412102022", "story_v_out_412102.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_412102", "412102022", "story_v_out_412102.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_40 = math.max(var_96_31, arg_93_1.talkMaxDuration)

			if var_96_30 <= arg_93_1.time_ and arg_93_1.time_ < var_96_30 + var_96_40 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_30) / var_96_40

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_30 + var_96_40 and arg_93_1.time_ < var_96_30 + var_96_40 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play412102023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 412102023
		arg_97_1.duration_ = 7.2

		local var_97_0 = {
			zh = 7.2,
			ja = 6.533
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
				arg_97_0:Play412102024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.725

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[927].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(412102023)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 29
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102023", "story_v_out_412102.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102023", "story_v_out_412102.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_412102", "412102023", "story_v_out_412102.awb")

						arg_97_1:RecordAudio("412102023", var_100_9)
						arg_97_1:RecordAudio("412102023", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_412102", "412102023", "story_v_out_412102.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_412102", "412102023", "story_v_out_412102.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play412102024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 412102024
		arg_101_1.duration_ = 9.333

		local var_101_0 = {
			zh = 5.4,
			ja = 9.333
		}
		local var_101_1 = manager.audio:GetLocalizationFlag()

		if var_101_0[var_101_1] ~= nil then
			arg_101_1.duration_ = var_101_0[var_101_1]
		end

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play412102025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1097ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1097ui_story == nil then
				arg_101_1.var_.characterEffect1097ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1097ui_story then
					arg_101_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1097ui_story then
				arg_101_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_104_4 = 0

			if var_104_4 < arg_101_1.time_ and arg_101_1.time_ <= var_104_4 + arg_104_0 then
				arg_101_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 then
				arg_101_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_6 = arg_101_1.actors_["1197ui_story"]
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 and arg_101_1.var_.characterEffect1197ui_story == nil then
				arg_101_1.var_.characterEffect1197ui_story = var_104_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_8 = 0.200000002980232

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_8 then
				local var_104_9 = (arg_101_1.time_ - var_104_7) / var_104_8

				if arg_101_1.var_.characterEffect1197ui_story then
					local var_104_10 = Mathf.Lerp(0, 0.5, var_104_9)

					arg_101_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1197ui_story.fillRatio = var_104_10
				end
			end

			if arg_101_1.time_ >= var_104_7 + var_104_8 and arg_101_1.time_ < var_104_7 + var_104_8 + arg_104_0 and arg_101_1.var_.characterEffect1197ui_story then
				local var_104_11 = 0.5

				arg_101_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1197ui_story.fillRatio = var_104_11
			end

			local var_104_12 = 0
			local var_104_13 = 0.275

			if var_104_12 < arg_101_1.time_ and arg_101_1.time_ <= var_104_12 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_14 = arg_101_1:FormatText(StoryNameCfg[928].name)

				arg_101_1.leftNameTxt_.text = var_104_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_15 = arg_101_1:GetWordFromCfg(412102024)
				local var_104_16 = arg_101_1:FormatText(var_104_15.content)

				arg_101_1.text_.text = var_104_16

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_17 = 11
				local var_104_18 = utf8.len(var_104_16)
				local var_104_19 = var_104_17 <= 0 and var_104_13 or var_104_13 * (var_104_18 / var_104_17)

				if var_104_19 > 0 and var_104_13 < var_104_19 then
					arg_101_1.talkMaxDuration = var_104_19

					if var_104_19 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_12
					end
				end

				arg_101_1.text_.text = var_104_16
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102024", "story_v_out_412102.awb") ~= 0 then
					local var_104_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102024", "story_v_out_412102.awb") / 1000

					if var_104_20 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_20 + var_104_12
					end

					if var_104_15.prefab_name ~= "" and arg_101_1.actors_[var_104_15.prefab_name] ~= nil then
						local var_104_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_15.prefab_name].transform, "story_v_out_412102", "412102024", "story_v_out_412102.awb")

						arg_101_1:RecordAudio("412102024", var_104_21)
						arg_101_1:RecordAudio("412102024", var_104_21)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_412102", "412102024", "story_v_out_412102.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_412102", "412102024", "story_v_out_412102.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_22 = math.max(var_104_13, arg_101_1.talkMaxDuration)

			if var_104_12 <= arg_101_1.time_ and arg_101_1.time_ < var_104_12 + var_104_22 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_12) / var_104_22

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_12 + var_104_22 and arg_101_1.time_ < var_104_12 + var_104_22 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play412102025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 412102025
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play412102026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1097ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1097ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, 100, 0)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1097ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, 100, 0)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1097ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1097ui_story == nil then
				arg_105_1.var_.characterEffect1097ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1097ui_story then
					local var_108_13 = Mathf.Lerp(0, 0.5, var_108_12)

					arg_105_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1097ui_story.fillRatio = var_108_13
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1097ui_story then
				local var_108_14 = 0.5

				arg_105_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1097ui_story.fillRatio = var_108_14
			end

			local var_108_15 = arg_105_1.actors_["1197ui_story"].transform
			local var_108_16 = 0

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 then
				arg_105_1.var_.moveOldPos1197ui_story = var_108_15.localPosition
			end

			local var_108_17 = 0.001

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_16) / var_108_17
				local var_108_19 = Vector3.New(0, 100, 0)

				var_108_15.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1197ui_story, var_108_19, var_108_18)

				local var_108_20 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_20.x, var_108_20.y, var_108_20.z)

				local var_108_21 = var_108_15.localEulerAngles

				var_108_21.z = 0
				var_108_21.x = 0
				var_108_15.localEulerAngles = var_108_21
			end

			if arg_105_1.time_ >= var_108_16 + var_108_17 and arg_105_1.time_ < var_108_16 + var_108_17 + arg_108_0 then
				var_108_15.localPosition = Vector3.New(0, 100, 0)

				local var_108_22 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_22.x, var_108_22.y, var_108_22.z)

				local var_108_23 = var_108_15.localEulerAngles

				var_108_23.z = 0
				var_108_23.x = 0
				var_108_15.localEulerAngles = var_108_23
			end

			local var_108_24 = 0
			local var_108_25 = 0.8

			if var_108_24 < arg_105_1.time_ and arg_105_1.time_ <= var_108_24 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_26 = arg_105_1:GetWordFromCfg(412102025)
				local var_108_27 = arg_105_1:FormatText(var_108_26.content)

				arg_105_1.text_.text = var_108_27

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_28 = 32
				local var_108_29 = utf8.len(var_108_27)
				local var_108_30 = var_108_28 <= 0 and var_108_25 or var_108_25 * (var_108_29 / var_108_28)

				if var_108_30 > 0 and var_108_25 < var_108_30 then
					arg_105_1.talkMaxDuration = var_108_30

					if var_108_30 + var_108_24 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_30 + var_108_24
					end
				end

				arg_105_1.text_.text = var_108_27
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_31 = math.max(var_108_25, arg_105_1.talkMaxDuration)

			if var_108_24 <= arg_105_1.time_ and arg_105_1.time_ < var_108_24 + var_108_31 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_24) / var_108_31

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_24 + var_108_31 and arg_105_1.time_ < var_108_24 + var_108_31 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play412102026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 412102026
		arg_109_1.duration_ = 3.6

		local var_109_0 = {
			zh = 2.466,
			ja = 3.6
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
				arg_109_0:Play412102027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1097ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1097ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(0, -0.54, -6.3)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1097ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1097ui_story"]
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1097ui_story == nil then
				arg_109_1.var_.characterEffect1097ui_story = var_112_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_11 = 0.200000002980232

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11

				if arg_109_1.var_.characterEffect1097ui_story then
					arg_109_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1097ui_story then
				arg_109_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_112_13 = 0

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 then
				arg_109_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				arg_109_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_112_15 = 0
			local var_112_16 = 0.15

			if var_112_15 < arg_109_1.time_ and arg_109_1.time_ <= var_112_15 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_17 = arg_109_1:FormatText(StoryNameCfg[928].name)

				arg_109_1.leftNameTxt_.text = var_112_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_18 = arg_109_1:GetWordFromCfg(412102026)
				local var_112_19 = arg_109_1:FormatText(var_112_18.content)

				arg_109_1.text_.text = var_112_19

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_20 = 6
				local var_112_21 = utf8.len(var_112_19)
				local var_112_22 = var_112_20 <= 0 and var_112_16 or var_112_16 * (var_112_21 / var_112_20)

				if var_112_22 > 0 and var_112_16 < var_112_22 then
					arg_109_1.talkMaxDuration = var_112_22

					if var_112_22 + var_112_15 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_22 + var_112_15
					end
				end

				arg_109_1.text_.text = var_112_19
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102026", "story_v_out_412102.awb") ~= 0 then
					local var_112_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102026", "story_v_out_412102.awb") / 1000

					if var_112_23 + var_112_15 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_23 + var_112_15
					end

					if var_112_18.prefab_name ~= "" and arg_109_1.actors_[var_112_18.prefab_name] ~= nil then
						local var_112_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_18.prefab_name].transform, "story_v_out_412102", "412102026", "story_v_out_412102.awb")

						arg_109_1:RecordAudio("412102026", var_112_24)
						arg_109_1:RecordAudio("412102026", var_112_24)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_412102", "412102026", "story_v_out_412102.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_412102", "412102026", "story_v_out_412102.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_25 = math.max(var_112_16, arg_109_1.talkMaxDuration)

			if var_112_15 <= arg_109_1.time_ and arg_109_1.time_ < var_112_15 + var_112_25 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_15) / var_112_25

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_15 + var_112_25 and arg_109_1.time_ < var_112_15 + var_112_25 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play412102027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 412102027
		arg_113_1.duration_ = 1.999999999999

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play412102028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1097ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1097ui_story == nil then
				arg_113_1.var_.characterEffect1097ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1097ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1097ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1097ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1097ui_story.fillRatio = var_116_5
			end

			local var_116_6 = arg_113_1.actors_["1197ui_story"].transform
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				arg_113_1.var_.moveOldPos1197ui_story = var_116_6.localPosition
			end

			local var_116_8 = 0.001

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8
				local var_116_10 = Vector3.New(0.7, -0.545, -6.3)

				var_116_6.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1197ui_story, var_116_10, var_116_9)

				local var_116_11 = manager.ui.mainCamera.transform.position - var_116_6.position

				var_116_6.forward = Vector3.New(var_116_11.x, var_116_11.y, var_116_11.z)

				local var_116_12 = var_116_6.localEulerAngles

				var_116_12.z = 0
				var_116_12.x = 0
				var_116_6.localEulerAngles = var_116_12
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 then
				var_116_6.localPosition = Vector3.New(0.7, -0.545, -6.3)

				local var_116_13 = manager.ui.mainCamera.transform.position - var_116_6.position

				var_116_6.forward = Vector3.New(var_116_13.x, var_116_13.y, var_116_13.z)

				local var_116_14 = var_116_6.localEulerAngles

				var_116_14.z = 0
				var_116_14.x = 0
				var_116_6.localEulerAngles = var_116_14
			end

			local var_116_15 = arg_113_1.actors_["1197ui_story"]
			local var_116_16 = 0

			if var_116_16 < arg_113_1.time_ and arg_113_1.time_ <= var_116_16 + arg_116_0 and arg_113_1.var_.characterEffect1197ui_story == nil then
				arg_113_1.var_.characterEffect1197ui_story = var_116_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_17 = 0.200000002980232

			if var_116_16 <= arg_113_1.time_ and arg_113_1.time_ < var_116_16 + var_116_17 then
				local var_116_18 = (arg_113_1.time_ - var_116_16) / var_116_17

				if arg_113_1.var_.characterEffect1197ui_story then
					arg_113_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_16 + var_116_17 and arg_113_1.time_ < var_116_16 + var_116_17 + arg_116_0 and arg_113_1.var_.characterEffect1197ui_story then
				arg_113_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_116_19 = 0

			if var_116_19 < arg_113_1.time_ and arg_113_1.time_ <= var_116_19 + arg_116_0 then
				arg_113_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_116_20 = arg_113_1.actors_["1097ui_story"].transform
			local var_116_21 = 0

			if var_116_21 < arg_113_1.time_ and arg_113_1.time_ <= var_116_21 + arg_116_0 then
				arg_113_1.var_.moveOldPos1097ui_story = var_116_20.localPosition
			end

			local var_116_22 = 0.001

			if var_116_21 <= arg_113_1.time_ and arg_113_1.time_ < var_116_21 + var_116_22 then
				local var_116_23 = (arg_113_1.time_ - var_116_21) / var_116_22
				local var_116_24 = Vector3.New(-0.7, -0.54, -6.3)

				var_116_20.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1097ui_story, var_116_24, var_116_23)

				local var_116_25 = manager.ui.mainCamera.transform.position - var_116_20.position

				var_116_20.forward = Vector3.New(var_116_25.x, var_116_25.y, var_116_25.z)

				local var_116_26 = var_116_20.localEulerAngles

				var_116_26.z = 0
				var_116_26.x = 0
				var_116_20.localEulerAngles = var_116_26
			end

			if arg_113_1.time_ >= var_116_21 + var_116_22 and arg_113_1.time_ < var_116_21 + var_116_22 + arg_116_0 then
				var_116_20.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_116_27 = manager.ui.mainCamera.transform.position - var_116_20.position

				var_116_20.forward = Vector3.New(var_116_27.x, var_116_27.y, var_116_27.z)

				local var_116_28 = var_116_20.localEulerAngles

				var_116_28.z = 0
				var_116_28.x = 0
				var_116_20.localEulerAngles = var_116_28
			end

			local var_116_29 = 0
			local var_116_30 = 0.15

			if var_116_29 < arg_113_1.time_ and arg_113_1.time_ <= var_116_29 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_31 = arg_113_1:FormatText(StoryNameCfg[927].name)

				arg_113_1.leftNameTxt_.text = var_116_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_32 = arg_113_1:GetWordFromCfg(412102027)
				local var_116_33 = arg_113_1:FormatText(var_116_32.content)

				arg_113_1.text_.text = var_116_33

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_34 = 6
				local var_116_35 = utf8.len(var_116_33)
				local var_116_36 = var_116_34 <= 0 and var_116_30 or var_116_30 * (var_116_35 / var_116_34)

				if var_116_36 > 0 and var_116_30 < var_116_36 then
					arg_113_1.talkMaxDuration = var_116_36

					if var_116_36 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_36 + var_116_29
					end
				end

				arg_113_1.text_.text = var_116_33
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102027", "story_v_out_412102.awb") ~= 0 then
					local var_116_37 = manager.audio:GetVoiceLength("story_v_out_412102", "412102027", "story_v_out_412102.awb") / 1000

					if var_116_37 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_37 + var_116_29
					end

					if var_116_32.prefab_name ~= "" and arg_113_1.actors_[var_116_32.prefab_name] ~= nil then
						local var_116_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_32.prefab_name].transform, "story_v_out_412102", "412102027", "story_v_out_412102.awb")

						arg_113_1:RecordAudio("412102027", var_116_38)
						arg_113_1:RecordAudio("412102027", var_116_38)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_412102", "412102027", "story_v_out_412102.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_412102", "412102027", "story_v_out_412102.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_39 = math.max(var_116_30, arg_113_1.talkMaxDuration)

			if var_116_29 <= arg_113_1.time_ and arg_113_1.time_ < var_116_29 + var_116_39 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_29) / var_116_39

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_29 + var_116_39 and arg_113_1.time_ < var_116_29 + var_116_39 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play412102028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 412102028
		arg_117_1.duration_ = 1.999999999999

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play412102029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1097ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1097ui_story == nil then
				arg_117_1.var_.characterEffect1097ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1097ui_story then
					arg_117_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1097ui_story then
				arg_117_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_120_4 = 0

			if var_120_4 < arg_117_1.time_ and arg_117_1.time_ <= var_120_4 + arg_120_0 then
				arg_117_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_6 = arg_117_1.actors_["1197ui_story"]
			local var_120_7 = 0

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 and arg_117_1.var_.characterEffect1197ui_story == nil then
				arg_117_1.var_.characterEffect1197ui_story = var_120_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_8 = 0.200000002980232

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_8 then
				local var_120_9 = (arg_117_1.time_ - var_120_7) / var_120_8

				if arg_117_1.var_.characterEffect1197ui_story then
					local var_120_10 = Mathf.Lerp(0, 0.5, var_120_9)

					arg_117_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1197ui_story.fillRatio = var_120_10
				end
			end

			if arg_117_1.time_ >= var_120_7 + var_120_8 and arg_117_1.time_ < var_120_7 + var_120_8 + arg_120_0 and arg_117_1.var_.characterEffect1197ui_story then
				local var_120_11 = 0.5

				arg_117_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1197ui_story.fillRatio = var_120_11
			end

			local var_120_12 = 0
			local var_120_13 = 0.1

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_14 = arg_117_1:FormatText(StoryNameCfg[928].name)

				arg_117_1.leftNameTxt_.text = var_120_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_15 = arg_117_1:GetWordFromCfg(412102028)
				local var_120_16 = arg_117_1:FormatText(var_120_15.content)

				arg_117_1.text_.text = var_120_16

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_17 = 4
				local var_120_18 = utf8.len(var_120_16)
				local var_120_19 = var_120_17 <= 0 and var_120_13 or var_120_13 * (var_120_18 / var_120_17)

				if var_120_19 > 0 and var_120_13 < var_120_19 then
					arg_117_1.talkMaxDuration = var_120_19

					if var_120_19 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_19 + var_120_12
					end
				end

				arg_117_1.text_.text = var_120_16
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102028", "story_v_out_412102.awb") ~= 0 then
					local var_120_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102028", "story_v_out_412102.awb") / 1000

					if var_120_20 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_12
					end

					if var_120_15.prefab_name ~= "" and arg_117_1.actors_[var_120_15.prefab_name] ~= nil then
						local var_120_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_15.prefab_name].transform, "story_v_out_412102", "412102028", "story_v_out_412102.awb")

						arg_117_1:RecordAudio("412102028", var_120_21)
						arg_117_1:RecordAudio("412102028", var_120_21)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_412102", "412102028", "story_v_out_412102.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_412102", "412102028", "story_v_out_412102.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_22 = math.max(var_120_13, arg_117_1.talkMaxDuration)

			if var_120_12 <= arg_117_1.time_ and arg_117_1.time_ < var_120_12 + var_120_22 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_12) / var_120_22

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_12 + var_120_22 and arg_117_1.time_ < var_120_12 + var_120_22 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play412102029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 412102029
		arg_121_1.duration_ = 6.566

		local var_121_0 = {
			zh = 4.866,
			ja = 6.566
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
				arg_121_0:Play412102030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1097ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1097ui_story == nil then
				arg_121_1.var_.characterEffect1097ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1097ui_story then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1097ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1097ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1097ui_story.fillRatio = var_124_5
			end

			local var_124_6 = arg_121_1.actors_["1197ui_story"]
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 and arg_121_1.var_.characterEffect1197ui_story == nil then
				arg_121_1.var_.characterEffect1197ui_story = var_124_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_8 = 0.200000002980232

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_8 then
				local var_124_9 = (arg_121_1.time_ - var_124_7) / var_124_8

				if arg_121_1.var_.characterEffect1197ui_story then
					arg_121_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_7 + var_124_8 and arg_121_1.time_ < var_124_7 + var_124_8 + arg_124_0 and arg_121_1.var_.characterEffect1197ui_story then
				arg_121_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 then
				arg_121_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action1_1")
			end

			local var_124_11 = 0

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				arg_121_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_124_12 = 0
			local var_124_13 = 0.55

			if var_124_12 < arg_121_1.time_ and arg_121_1.time_ <= var_124_12 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_14 = arg_121_1:FormatText(StoryNameCfg[927].name)

				arg_121_1.leftNameTxt_.text = var_124_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_15 = arg_121_1:GetWordFromCfg(412102029)
				local var_124_16 = arg_121_1:FormatText(var_124_15.content)

				arg_121_1.text_.text = var_124_16

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_17 = 22
				local var_124_18 = utf8.len(var_124_16)
				local var_124_19 = var_124_17 <= 0 and var_124_13 or var_124_13 * (var_124_18 / var_124_17)

				if var_124_19 > 0 and var_124_13 < var_124_19 then
					arg_121_1.talkMaxDuration = var_124_19

					if var_124_19 + var_124_12 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_19 + var_124_12
					end
				end

				arg_121_1.text_.text = var_124_16
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102029", "story_v_out_412102.awb") ~= 0 then
					local var_124_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102029", "story_v_out_412102.awb") / 1000

					if var_124_20 + var_124_12 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_20 + var_124_12
					end

					if var_124_15.prefab_name ~= "" and arg_121_1.actors_[var_124_15.prefab_name] ~= nil then
						local var_124_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_15.prefab_name].transform, "story_v_out_412102", "412102029", "story_v_out_412102.awb")

						arg_121_1:RecordAudio("412102029", var_124_21)
						arg_121_1:RecordAudio("412102029", var_124_21)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_412102", "412102029", "story_v_out_412102.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_412102", "412102029", "story_v_out_412102.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_22 = math.max(var_124_13, arg_121_1.talkMaxDuration)

			if var_124_12 <= arg_121_1.time_ and arg_121_1.time_ < var_124_12 + var_124_22 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_12) / var_124_22

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_12 + var_124_22 and arg_121_1.time_ < var_124_12 + var_124_22 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play412102030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 412102030
		arg_125_1.duration_ = 5.3

		local var_125_0 = {
			zh = 5.3,
			ja = 1.999999999999
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play412102031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1097ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1097ui_story == nil then
				arg_125_1.var_.characterEffect1097ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1097ui_story then
					arg_125_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1097ui_story then
				arg_125_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_128_4 = 0

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				arg_125_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_128_6 = arg_125_1.actors_["1197ui_story"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect1197ui_story == nil then
				arg_125_1.var_.characterEffect1197ui_story = var_128_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_8 = 0.200000002980232

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.characterEffect1197ui_story then
					local var_128_10 = Mathf.Lerp(0, 0.5, var_128_9)

					arg_125_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1197ui_story.fillRatio = var_128_10
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.characterEffect1197ui_story then
				local var_128_11 = 0.5

				arg_125_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1197ui_story.fillRatio = var_128_11
			end

			local var_128_12 = 0
			local var_128_13 = 0.375

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_14 = arg_125_1:FormatText(StoryNameCfg[928].name)

				arg_125_1.leftNameTxt_.text = var_128_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_15 = arg_125_1:GetWordFromCfg(412102030)
				local var_128_16 = arg_125_1:FormatText(var_128_15.content)

				arg_125_1.text_.text = var_128_16

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_17 = 15
				local var_128_18 = utf8.len(var_128_16)
				local var_128_19 = var_128_17 <= 0 and var_128_13 or var_128_13 * (var_128_18 / var_128_17)

				if var_128_19 > 0 and var_128_13 < var_128_19 then
					arg_125_1.talkMaxDuration = var_128_19

					if var_128_19 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_19 + var_128_12
					end
				end

				arg_125_1.text_.text = var_128_16
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102030", "story_v_out_412102.awb") ~= 0 then
					local var_128_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102030", "story_v_out_412102.awb") / 1000

					if var_128_20 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_12
					end

					if var_128_15.prefab_name ~= "" and arg_125_1.actors_[var_128_15.prefab_name] ~= nil then
						local var_128_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_15.prefab_name].transform, "story_v_out_412102", "412102030", "story_v_out_412102.awb")

						arg_125_1:RecordAudio("412102030", var_128_21)
						arg_125_1:RecordAudio("412102030", var_128_21)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_412102", "412102030", "story_v_out_412102.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_412102", "412102030", "story_v_out_412102.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_22 = math.max(var_128_13, arg_125_1.talkMaxDuration)

			if var_128_12 <= arg_125_1.time_ and arg_125_1.time_ < var_128_12 + var_128_22 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_12) / var_128_22

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_12 + var_128_22 and arg_125_1.time_ < var_128_12 + var_128_22 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play412102031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 412102031
		arg_129_1.duration_ = 10.5

		local var_129_0 = {
			zh = 10.5,
			ja = 8.8
		}
		local var_129_1 = manager.audio:GetLocalizationFlag()

		if var_129_0[var_129_1] ~= nil then
			arg_129_1.duration_ = var_129_0[var_129_1]
		end

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play412102032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1097ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1097ui_story == nil then
				arg_129_1.var_.characterEffect1097ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1097ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1097ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1097ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1097ui_story.fillRatio = var_132_5
			end

			local var_132_6 = arg_129_1.actors_["1197ui_story"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and arg_129_1.var_.characterEffect1197ui_story == nil then
				arg_129_1.var_.characterEffect1197ui_story = var_132_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_8 = 0.200000002980232

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.characterEffect1197ui_story then
					arg_129_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and arg_129_1.var_.characterEffect1197ui_story then
				arg_129_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_132_10 = 0
			local var_132_11 = 0.975

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_12 = arg_129_1:FormatText(StoryNameCfg[927].name)

				arg_129_1.leftNameTxt_.text = var_132_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_13 = arg_129_1:GetWordFromCfg(412102031)
				local var_132_14 = arg_129_1:FormatText(var_132_13.content)

				arg_129_1.text_.text = var_132_14

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_15 = 39
				local var_132_16 = utf8.len(var_132_14)
				local var_132_17 = var_132_15 <= 0 and var_132_11 or var_132_11 * (var_132_16 / var_132_15)

				if var_132_17 > 0 and var_132_11 < var_132_17 then
					arg_129_1.talkMaxDuration = var_132_17

					if var_132_17 + var_132_10 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_17 + var_132_10
					end
				end

				arg_129_1.text_.text = var_132_14
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102031", "story_v_out_412102.awb") ~= 0 then
					local var_132_18 = manager.audio:GetVoiceLength("story_v_out_412102", "412102031", "story_v_out_412102.awb") / 1000

					if var_132_18 + var_132_10 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_18 + var_132_10
					end

					if var_132_13.prefab_name ~= "" and arg_129_1.actors_[var_132_13.prefab_name] ~= nil then
						local var_132_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_13.prefab_name].transform, "story_v_out_412102", "412102031", "story_v_out_412102.awb")

						arg_129_1:RecordAudio("412102031", var_132_19)
						arg_129_1:RecordAudio("412102031", var_132_19)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_412102", "412102031", "story_v_out_412102.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_412102", "412102031", "story_v_out_412102.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_20 = math.max(var_132_11, arg_129_1.talkMaxDuration)

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_20 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_10) / var_132_20

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_10 + var_132_20 and arg_129_1.time_ < var_132_10 + var_132_20 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play412102032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 412102032
		arg_133_1.duration_ = 6.5

		local var_133_0 = {
			zh = 2.033,
			ja = 6.5
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
				arg_133_0:Play412102033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1097ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1097ui_story == nil then
				arg_133_1.var_.characterEffect1097ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1097ui_story then
					arg_133_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1097ui_story then
				arg_133_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_136_6 = arg_133_1.actors_["1197ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect1197ui_story == nil then
				arg_133_1.var_.characterEffect1197ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.200000002980232

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect1197ui_story then
					local var_136_10 = Mathf.Lerp(0, 0.5, var_136_9)

					arg_133_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1197ui_story.fillRatio = var_136_10
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect1197ui_story then
				local var_136_11 = 0.5

				arg_133_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1197ui_story.fillRatio = var_136_11
			end

			local var_136_12 = 0
			local var_136_13 = 0.15

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_14 = arg_133_1:FormatText(StoryNameCfg[928].name)

				arg_133_1.leftNameTxt_.text = var_136_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_15 = arg_133_1:GetWordFromCfg(412102032)
				local var_136_16 = arg_133_1:FormatText(var_136_15.content)

				arg_133_1.text_.text = var_136_16

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_17 = 6
				local var_136_18 = utf8.len(var_136_16)
				local var_136_19 = var_136_17 <= 0 and var_136_13 or var_136_13 * (var_136_18 / var_136_17)

				if var_136_19 > 0 and var_136_13 < var_136_19 then
					arg_133_1.talkMaxDuration = var_136_19

					if var_136_19 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_12
					end
				end

				arg_133_1.text_.text = var_136_16
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102032", "story_v_out_412102.awb") ~= 0 then
					local var_136_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102032", "story_v_out_412102.awb") / 1000

					if var_136_20 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_12
					end

					if var_136_15.prefab_name ~= "" and arg_133_1.actors_[var_136_15.prefab_name] ~= nil then
						local var_136_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_15.prefab_name].transform, "story_v_out_412102", "412102032", "story_v_out_412102.awb")

						arg_133_1:RecordAudio("412102032", var_136_21)
						arg_133_1:RecordAudio("412102032", var_136_21)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_412102", "412102032", "story_v_out_412102.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_412102", "412102032", "story_v_out_412102.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_13, arg_133_1.talkMaxDuration)

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_12) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_12 + var_136_22 and arg_133_1.time_ < var_136_12 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play412102033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 412102033
		arg_137_1.duration_ = 8.7

		local var_137_0 = {
			zh = 8.266,
			ja = 8.7
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play412102034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1097ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1097ui_story == nil then
				arg_137_1.var_.characterEffect1097ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1097ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1097ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1097ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1097ui_story.fillRatio = var_140_5
			end

			local var_140_6 = arg_137_1.actors_["1197ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1197ui_story == nil then
				arg_137_1.var_.characterEffect1197ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.200000002980232

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1197ui_story then
					arg_137_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1197ui_story then
				arg_137_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_140_10 = 0
			local var_140_11 = 0.75

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_12 = arg_137_1:FormatText(StoryNameCfg[927].name)

				arg_137_1.leftNameTxt_.text = var_140_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_13 = arg_137_1:GetWordFromCfg(412102033)
				local var_140_14 = arg_137_1:FormatText(var_140_13.content)

				arg_137_1.text_.text = var_140_14

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_15 = 30
				local var_140_16 = utf8.len(var_140_14)
				local var_140_17 = var_140_15 <= 0 and var_140_11 or var_140_11 * (var_140_16 / var_140_15)

				if var_140_17 > 0 and var_140_11 < var_140_17 then
					arg_137_1.talkMaxDuration = var_140_17

					if var_140_17 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_17 + var_140_10
					end
				end

				arg_137_1.text_.text = var_140_14
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102033", "story_v_out_412102.awb") ~= 0 then
					local var_140_18 = manager.audio:GetVoiceLength("story_v_out_412102", "412102033", "story_v_out_412102.awb") / 1000

					if var_140_18 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_18 + var_140_10
					end

					if var_140_13.prefab_name ~= "" and arg_137_1.actors_[var_140_13.prefab_name] ~= nil then
						local var_140_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_13.prefab_name].transform, "story_v_out_412102", "412102033", "story_v_out_412102.awb")

						arg_137_1:RecordAudio("412102033", var_140_19)
						arg_137_1:RecordAudio("412102033", var_140_19)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_412102", "412102033", "story_v_out_412102.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_412102", "412102033", "story_v_out_412102.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_20 = math.max(var_140_11, arg_137_1.talkMaxDuration)

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_20 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_10) / var_140_20

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_10 + var_140_20 and arg_137_1.time_ < var_140_10 + var_140_20 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play412102034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 412102034
		arg_141_1.duration_ = 8.2

		local var_141_0 = {
			zh = 5.033,
			ja = 8.2
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
				arg_141_0:Play412102035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1097ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1097ui_story == nil then
				arg_141_1.var_.characterEffect1097ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1097ui_story then
					arg_141_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1097ui_story then
				arg_141_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_6 = arg_141_1.actors_["1197ui_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect1197ui_story == nil then
				arg_141_1.var_.characterEffect1197ui_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.200000002980232

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect1197ui_story then
					local var_144_10 = Mathf.Lerp(0, 0.5, var_144_9)

					arg_141_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1197ui_story.fillRatio = var_144_10
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect1197ui_story then
				local var_144_11 = 0.5

				arg_141_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1197ui_story.fillRatio = var_144_11
			end

			local var_144_12 = 0
			local var_144_13 = 0.525

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_14 = arg_141_1:FormatText(StoryNameCfg[928].name)

				arg_141_1.leftNameTxt_.text = var_144_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_15 = arg_141_1:GetWordFromCfg(412102034)
				local var_144_16 = arg_141_1:FormatText(var_144_15.content)

				arg_141_1.text_.text = var_144_16

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_17 = 21
				local var_144_18 = utf8.len(var_144_16)
				local var_144_19 = var_144_17 <= 0 and var_144_13 or var_144_13 * (var_144_18 / var_144_17)

				if var_144_19 > 0 and var_144_13 < var_144_19 then
					arg_141_1.talkMaxDuration = var_144_19

					if var_144_19 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_12
					end
				end

				arg_141_1.text_.text = var_144_16
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102034", "story_v_out_412102.awb") ~= 0 then
					local var_144_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102034", "story_v_out_412102.awb") / 1000

					if var_144_20 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_20 + var_144_12
					end

					if var_144_15.prefab_name ~= "" and arg_141_1.actors_[var_144_15.prefab_name] ~= nil then
						local var_144_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_15.prefab_name].transform, "story_v_out_412102", "412102034", "story_v_out_412102.awb")

						arg_141_1:RecordAudio("412102034", var_144_21)
						arg_141_1:RecordAudio("412102034", var_144_21)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_412102", "412102034", "story_v_out_412102.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_412102", "412102034", "story_v_out_412102.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_13, arg_141_1.talkMaxDuration)

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_12) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_12 + var_144_22 and arg_141_1.time_ < var_144_12 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play412102035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 412102035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play412102036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1097ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1097ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, 100, 0)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1097ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, 100, 0)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1097ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and arg_145_1.var_.characterEffect1097ui_story == nil then
				arg_145_1.var_.characterEffect1097ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1097ui_story then
					local var_148_13 = Mathf.Lerp(0, 0.5, var_148_12)

					arg_145_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1097ui_story.fillRatio = var_148_13
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and arg_145_1.var_.characterEffect1097ui_story then
				local var_148_14 = 0.5

				arg_145_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1097ui_story.fillRatio = var_148_14
			end

			local var_148_15 = arg_145_1.actors_["1197ui_story"].transform
			local var_148_16 = 0

			if var_148_16 < arg_145_1.time_ and arg_145_1.time_ <= var_148_16 + arg_148_0 then
				arg_145_1.var_.moveOldPos1197ui_story = var_148_15.localPosition
			end

			local var_148_17 = 0.001

			if var_148_16 <= arg_145_1.time_ and arg_145_1.time_ < var_148_16 + var_148_17 then
				local var_148_18 = (arg_145_1.time_ - var_148_16) / var_148_17
				local var_148_19 = Vector3.New(0, 100, 0)

				var_148_15.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1197ui_story, var_148_19, var_148_18)

				local var_148_20 = manager.ui.mainCamera.transform.position - var_148_15.position

				var_148_15.forward = Vector3.New(var_148_20.x, var_148_20.y, var_148_20.z)

				local var_148_21 = var_148_15.localEulerAngles

				var_148_21.z = 0
				var_148_21.x = 0
				var_148_15.localEulerAngles = var_148_21
			end

			if arg_145_1.time_ >= var_148_16 + var_148_17 and arg_145_1.time_ < var_148_16 + var_148_17 + arg_148_0 then
				var_148_15.localPosition = Vector3.New(0, 100, 0)

				local var_148_22 = manager.ui.mainCamera.transform.position - var_148_15.position

				var_148_15.forward = Vector3.New(var_148_22.x, var_148_22.y, var_148_22.z)

				local var_148_23 = var_148_15.localEulerAngles

				var_148_23.z = 0
				var_148_23.x = 0
				var_148_15.localEulerAngles = var_148_23
			end

			local var_148_24 = 0
			local var_148_25 = 0.35

			if var_148_24 < arg_145_1.time_ and arg_145_1.time_ <= var_148_24 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_26 = arg_145_1:GetWordFromCfg(412102035)
				local var_148_27 = arg_145_1:FormatText(var_148_26.content)

				arg_145_1.text_.text = var_148_27

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_28 = 14
				local var_148_29 = utf8.len(var_148_27)
				local var_148_30 = var_148_28 <= 0 and var_148_25 or var_148_25 * (var_148_29 / var_148_28)

				if var_148_30 > 0 and var_148_25 < var_148_30 then
					arg_145_1.talkMaxDuration = var_148_30

					if var_148_30 + var_148_24 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_30 + var_148_24
					end
				end

				arg_145_1.text_.text = var_148_27
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_31 = math.max(var_148_25, arg_145_1.talkMaxDuration)

			if var_148_24 <= arg_145_1.time_ and arg_145_1.time_ < var_148_24 + var_148_31 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_24) / var_148_31

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_24 + var_148_31 and arg_145_1.time_ < var_148_24 + var_148_31 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play412102036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 412102036
		arg_149_1.duration_ = 16.133

		local var_149_0 = {
			zh = 4.666,
			ja = 16.133
		}
		local var_149_1 = manager.audio:GetLocalizationFlag()

		if var_149_0[var_149_1] ~= nil then
			arg_149_1.duration_ = var_149_0[var_149_1]
		end

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play412102037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1097ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1097ui_story == nil then
				arg_149_1.var_.characterEffect1097ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1097ui_story then
					arg_149_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1097ui_story then
				arg_149_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_152_4 = 0

			if var_152_4 < arg_149_1.time_ and arg_149_1.time_ <= var_152_4 + arg_152_0 then
				arg_149_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 then
				arg_149_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_152_6 = arg_149_1.actors_["1097ui_story"].transform
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 then
				arg_149_1.var_.moveOldPos1097ui_story = var_152_6.localPosition
			end

			local var_152_8 = 0.001

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8
				local var_152_10 = Vector3.New(0, -0.54, -6.3)

				var_152_6.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1097ui_story, var_152_10, var_152_9)

				local var_152_11 = manager.ui.mainCamera.transform.position - var_152_6.position

				var_152_6.forward = Vector3.New(var_152_11.x, var_152_11.y, var_152_11.z)

				local var_152_12 = var_152_6.localEulerAngles

				var_152_12.z = 0
				var_152_12.x = 0
				var_152_6.localEulerAngles = var_152_12
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 then
				var_152_6.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_152_13 = manager.ui.mainCamera.transform.position - var_152_6.position

				var_152_6.forward = Vector3.New(var_152_13.x, var_152_13.y, var_152_13.z)

				local var_152_14 = var_152_6.localEulerAngles

				var_152_14.z = 0
				var_152_14.x = 0
				var_152_6.localEulerAngles = var_152_14
			end

			local var_152_15 = 0
			local var_152_16 = 0.5

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_17 = arg_149_1:FormatText(StoryNameCfg[928].name)

				arg_149_1.leftNameTxt_.text = var_152_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_18 = arg_149_1:GetWordFromCfg(412102036)
				local var_152_19 = arg_149_1:FormatText(var_152_18.content)

				arg_149_1.text_.text = var_152_19

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_20 = 20
				local var_152_21 = utf8.len(var_152_19)
				local var_152_22 = var_152_20 <= 0 and var_152_16 or var_152_16 * (var_152_21 / var_152_20)

				if var_152_22 > 0 and var_152_16 < var_152_22 then
					arg_149_1.talkMaxDuration = var_152_22

					if var_152_22 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_15
					end
				end

				arg_149_1.text_.text = var_152_19
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102036", "story_v_out_412102.awb") ~= 0 then
					local var_152_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102036", "story_v_out_412102.awb") / 1000

					if var_152_23 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_23 + var_152_15
					end

					if var_152_18.prefab_name ~= "" and arg_149_1.actors_[var_152_18.prefab_name] ~= nil then
						local var_152_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_18.prefab_name].transform, "story_v_out_412102", "412102036", "story_v_out_412102.awb")

						arg_149_1:RecordAudio("412102036", var_152_24)
						arg_149_1:RecordAudio("412102036", var_152_24)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_412102", "412102036", "story_v_out_412102.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_412102", "412102036", "story_v_out_412102.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_25 = math.max(var_152_16, arg_149_1.talkMaxDuration)

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_25 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_15) / var_152_25

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_15 + var_152_25 and arg_149_1.time_ < var_152_15 + var_152_25 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play412102037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 412102037
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play412102038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1097ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1097ui_story == nil then
				arg_153_1.var_.characterEffect1097ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1097ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1097ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1097ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1097ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 0.075

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_8 = arg_153_1:GetWordFromCfg(412102037)
				local var_156_9 = arg_153_1:FormatText(var_156_8.content)

				arg_153_1.text_.text = var_156_9

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_10 = 3
				local var_156_11 = utf8.len(var_156_9)
				local var_156_12 = var_156_10 <= 0 and var_156_7 or var_156_7 * (var_156_11 / var_156_10)

				if var_156_12 > 0 and var_156_7 < var_156_12 then
					arg_153_1.talkMaxDuration = var_156_12

					if var_156_12 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_9
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_13 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_13 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_13

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_13 and arg_153_1.time_ < var_156_6 + var_156_13 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play412102038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 412102038
		arg_157_1.duration_ = 3.366

		local var_157_0 = {
			zh = 1.999999999999,
			ja = 3.366
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play412102039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1097ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1097ui_story == nil then
				arg_157_1.var_.characterEffect1097ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1097ui_story then
					arg_157_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1097ui_story then
				arg_157_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_160_4 = 0

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 then
				arg_157_1.allBtn_.enabled = false
			end

			local var_160_6 = 1

			if arg_157_1.time_ >= var_160_5 + var_160_6 and arg_157_1.time_ < var_160_5 + var_160_6 + arg_160_0 then
				arg_157_1.allBtn_.enabled = true
			end

			local var_160_7 = 0
			local var_160_8 = 1

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_9 = arg_157_1:FormatText(StoryNameCfg[928].name)

				arg_157_1.leftNameTxt_.text = var_160_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_10 = arg_157_1:GetWordFromCfg(412102038)
				local var_160_11 = arg_157_1:FormatText(var_160_10.content)

				arg_157_1.text_.text = var_160_11

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_12 = 6
				local var_160_13 = utf8.len(var_160_11)
				local var_160_14 = var_160_12 <= 0 and var_160_8 or var_160_8 * (var_160_13 / var_160_12)

				if var_160_14 > 0 and var_160_8 < var_160_14 then
					arg_157_1.talkMaxDuration = var_160_14

					if var_160_14 + var_160_7 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_7
					end
				end

				arg_157_1.text_.text = var_160_11
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102038", "story_v_out_412102.awb") ~= 0 then
					local var_160_15 = manager.audio:GetVoiceLength("story_v_out_412102", "412102038", "story_v_out_412102.awb") / 1000

					if var_160_15 + var_160_7 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_15 + var_160_7
					end

					if var_160_10.prefab_name ~= "" and arg_157_1.actors_[var_160_10.prefab_name] ~= nil then
						local var_160_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_10.prefab_name].transform, "story_v_out_412102", "412102038", "story_v_out_412102.awb")

						arg_157_1:RecordAudio("412102038", var_160_16)
						arg_157_1:RecordAudio("412102038", var_160_16)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_412102", "412102038", "story_v_out_412102.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_412102", "412102038", "story_v_out_412102.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_17 = math.max(var_160_8, arg_157_1.talkMaxDuration)

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_17 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_7) / var_160_17

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_7 + var_160_17 and arg_157_1.time_ < var_160_7 + var_160_17 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play412102039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 412102039
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play412102040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1097ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1097ui_story == nil then
				arg_161_1.var_.characterEffect1097ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1097ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1097ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1097ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1097ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 0.95

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_8 = arg_161_1:GetWordFromCfg(412102039)
				local var_164_9 = arg_161_1:FormatText(var_164_8.content)

				arg_161_1.text_.text = var_164_9

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_10 = 38
				local var_164_11 = utf8.len(var_164_9)
				local var_164_12 = var_164_10 <= 0 and var_164_7 or var_164_7 * (var_164_11 / var_164_10)

				if var_164_12 > 0 and var_164_7 < var_164_12 then
					arg_161_1.talkMaxDuration = var_164_12

					if var_164_12 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_12 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_9
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_13 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_13 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_13

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_13 and arg_161_1.time_ < var_164_6 + var_164_13 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play412102040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 412102040
		arg_165_1.duration_ = 3.266

		local var_165_0 = {
			zh = 1.999999999999,
			ja = 3.266
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play412102041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1197ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1197ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0.7, -0.545, -6.3)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1197ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0.7, -0.545, -6.3)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = 0

			if var_168_9 < arg_165_1.time_ and arg_165_1.time_ <= var_168_9 + arg_168_0 then
				arg_165_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action1_1")
			end

			local var_168_10 = arg_165_1.actors_["1197ui_story"]
			local var_168_11 = 0

			if var_168_11 < arg_165_1.time_ and arg_165_1.time_ <= var_168_11 + arg_168_0 and arg_165_1.var_.characterEffect1197ui_story == nil then
				arg_165_1.var_.characterEffect1197ui_story = var_168_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_12 = 0.2

			if var_168_11 <= arg_165_1.time_ and arg_165_1.time_ < var_168_11 + var_168_12 then
				local var_168_13 = (arg_165_1.time_ - var_168_11) / var_168_12

				if arg_165_1.var_.characterEffect1197ui_story then
					arg_165_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_11 + var_168_12 and arg_165_1.time_ < var_168_11 + var_168_12 + arg_168_0 and arg_165_1.var_.characterEffect1197ui_story then
				arg_165_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_168_14 = arg_165_1.actors_["1097ui_story"].transform
			local var_168_15 = 0

			if var_168_15 < arg_165_1.time_ and arg_165_1.time_ <= var_168_15 + arg_168_0 then
				arg_165_1.var_.moveOldPos1097ui_story = var_168_14.localPosition
			end

			local var_168_16 = 0.001

			if var_168_15 <= arg_165_1.time_ and arg_165_1.time_ < var_168_15 + var_168_16 then
				local var_168_17 = (arg_165_1.time_ - var_168_15) / var_168_16
				local var_168_18 = Vector3.New(-0.7, -0.54, -6.3)

				var_168_14.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1097ui_story, var_168_18, var_168_17)

				local var_168_19 = manager.ui.mainCamera.transform.position - var_168_14.position

				var_168_14.forward = Vector3.New(var_168_19.x, var_168_19.y, var_168_19.z)

				local var_168_20 = var_168_14.localEulerAngles

				var_168_20.z = 0
				var_168_20.x = 0
				var_168_14.localEulerAngles = var_168_20
			end

			if arg_165_1.time_ >= var_168_15 + var_168_16 and arg_165_1.time_ < var_168_15 + var_168_16 + arg_168_0 then
				var_168_14.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_168_21 = manager.ui.mainCamera.transform.position - var_168_14.position

				var_168_14.forward = Vector3.New(var_168_21.x, var_168_21.y, var_168_21.z)

				local var_168_22 = var_168_14.localEulerAngles

				var_168_22.z = 0
				var_168_22.x = 0
				var_168_14.localEulerAngles = var_168_22
			end

			local var_168_23 = 0
			local var_168_24 = 0.075

			if var_168_23 < arg_165_1.time_ and arg_165_1.time_ <= var_168_23 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_25 = arg_165_1:FormatText(StoryNameCfg[927].name)

				arg_165_1.leftNameTxt_.text = var_168_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_26 = arg_165_1:GetWordFromCfg(412102040)
				local var_168_27 = arg_165_1:FormatText(var_168_26.content)

				arg_165_1.text_.text = var_168_27

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_28 = 3
				local var_168_29 = utf8.len(var_168_27)
				local var_168_30 = var_168_28 <= 0 and var_168_24 or var_168_24 * (var_168_29 / var_168_28)

				if var_168_30 > 0 and var_168_24 < var_168_30 then
					arg_165_1.talkMaxDuration = var_168_30

					if var_168_30 + var_168_23 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_30 + var_168_23
					end
				end

				arg_165_1.text_.text = var_168_27
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102040", "story_v_out_412102.awb") ~= 0 then
					local var_168_31 = manager.audio:GetVoiceLength("story_v_out_412102", "412102040", "story_v_out_412102.awb") / 1000

					if var_168_31 + var_168_23 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_31 + var_168_23
					end

					if var_168_26.prefab_name ~= "" and arg_165_1.actors_[var_168_26.prefab_name] ~= nil then
						local var_168_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_26.prefab_name].transform, "story_v_out_412102", "412102040", "story_v_out_412102.awb")

						arg_165_1:RecordAudio("412102040", var_168_32)
						arg_165_1:RecordAudio("412102040", var_168_32)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_412102", "412102040", "story_v_out_412102.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_412102", "412102040", "story_v_out_412102.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_33 = math.max(var_168_24, arg_165_1.talkMaxDuration)

			if var_168_23 <= arg_165_1.time_ and arg_165_1.time_ < var_168_23 + var_168_33 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_23) / var_168_33

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_23 + var_168_33 and arg_165_1.time_ < var_168_23 + var_168_33 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play412102041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 412102041
		arg_169_1.duration_ = 8.533

		local var_169_0 = {
			zh = 8.533,
			ja = 5.7
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play412102042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1097ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1097ui_story == nil then
				arg_169_1.var_.characterEffect1097ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.200000002980232

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1097ui_story then
					arg_169_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1097ui_story then
				arg_169_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_172_4 = 0

			if var_172_4 < arg_169_1.time_ and arg_169_1.time_ <= var_172_4 + arg_172_0 then
				arg_169_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 then
				arg_169_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_172_6 = arg_169_1.actors_["1197ui_story"]
			local var_172_7 = 0

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 and arg_169_1.var_.characterEffect1197ui_story == nil then
				arg_169_1.var_.characterEffect1197ui_story = var_172_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_8 = 0.200000002980232

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_8 then
				local var_172_9 = (arg_169_1.time_ - var_172_7) / var_172_8

				if arg_169_1.var_.characterEffect1197ui_story then
					local var_172_10 = Mathf.Lerp(0, 0.5, var_172_9)

					arg_169_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1197ui_story.fillRatio = var_172_10
				end
			end

			if arg_169_1.time_ >= var_172_7 + var_172_8 and arg_169_1.time_ < var_172_7 + var_172_8 + arg_172_0 and arg_169_1.var_.characterEffect1197ui_story then
				local var_172_11 = 0.5

				arg_169_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1197ui_story.fillRatio = var_172_11
			end

			local var_172_12 = 0
			local var_172_13 = 0.925

			if var_172_12 < arg_169_1.time_ and arg_169_1.time_ <= var_172_12 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_14 = arg_169_1:FormatText(StoryNameCfg[928].name)

				arg_169_1.leftNameTxt_.text = var_172_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_15 = arg_169_1:GetWordFromCfg(412102041)
				local var_172_16 = arg_169_1:FormatText(var_172_15.content)

				arg_169_1.text_.text = var_172_16

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_17 = 37
				local var_172_18 = utf8.len(var_172_16)
				local var_172_19 = var_172_17 <= 0 and var_172_13 or var_172_13 * (var_172_18 / var_172_17)

				if var_172_19 > 0 and var_172_13 < var_172_19 then
					arg_169_1.talkMaxDuration = var_172_19

					if var_172_19 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_19 + var_172_12
					end
				end

				arg_169_1.text_.text = var_172_16
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102041", "story_v_out_412102.awb") ~= 0 then
					local var_172_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102041", "story_v_out_412102.awb") / 1000

					if var_172_20 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_20 + var_172_12
					end

					if var_172_15.prefab_name ~= "" and arg_169_1.actors_[var_172_15.prefab_name] ~= nil then
						local var_172_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_15.prefab_name].transform, "story_v_out_412102", "412102041", "story_v_out_412102.awb")

						arg_169_1:RecordAudio("412102041", var_172_21)
						arg_169_1:RecordAudio("412102041", var_172_21)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_412102", "412102041", "story_v_out_412102.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_412102", "412102041", "story_v_out_412102.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_22 = math.max(var_172_13, arg_169_1.talkMaxDuration)

			if var_172_12 <= arg_169_1.time_ and arg_169_1.time_ < var_172_12 + var_172_22 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_12) / var_172_22

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_12 + var_172_22 and arg_169_1.time_ < var_172_12 + var_172_22 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play412102042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 412102042
		arg_173_1.duration_ = 3.966

		local var_173_0 = {
			zh = 1.999999999999,
			ja = 3.966
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play412102043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1097ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1097ui_story == nil then
				arg_173_1.var_.characterEffect1097ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1097ui_story then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1097ui_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1097ui_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1097ui_story.fillRatio = var_176_5
			end

			local var_176_6 = arg_173_1.actors_["1197ui_story"]
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 and arg_173_1.var_.characterEffect1197ui_story == nil then
				arg_173_1.var_.characterEffect1197ui_story = var_176_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_8 = 0.200000002980232

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_8 then
				local var_176_9 = (arg_173_1.time_ - var_176_7) / var_176_8

				if arg_173_1.var_.characterEffect1197ui_story then
					arg_173_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_7 + var_176_8 and arg_173_1.time_ < var_176_7 + var_176_8 + arg_176_0 and arg_173_1.var_.characterEffect1197ui_story then
				arg_173_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 then
				arg_173_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action1_1")
			end

			local var_176_11 = 0
			local var_176_12 = 0.225

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_13 = arg_173_1:FormatText(StoryNameCfg[927].name)

				arg_173_1.leftNameTxt_.text = var_176_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_14 = arg_173_1:GetWordFromCfg(412102042)
				local var_176_15 = arg_173_1:FormatText(var_176_14.content)

				arg_173_1.text_.text = var_176_15

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_16 = 9
				local var_176_17 = utf8.len(var_176_15)
				local var_176_18 = var_176_16 <= 0 and var_176_12 or var_176_12 * (var_176_17 / var_176_16)

				if var_176_18 > 0 and var_176_12 < var_176_18 then
					arg_173_1.talkMaxDuration = var_176_18

					if var_176_18 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_18 + var_176_11
					end
				end

				arg_173_1.text_.text = var_176_15
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102042", "story_v_out_412102.awb") ~= 0 then
					local var_176_19 = manager.audio:GetVoiceLength("story_v_out_412102", "412102042", "story_v_out_412102.awb") / 1000

					if var_176_19 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_11
					end

					if var_176_14.prefab_name ~= "" and arg_173_1.actors_[var_176_14.prefab_name] ~= nil then
						local var_176_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_14.prefab_name].transform, "story_v_out_412102", "412102042", "story_v_out_412102.awb")

						arg_173_1:RecordAudio("412102042", var_176_20)
						arg_173_1:RecordAudio("412102042", var_176_20)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_412102", "412102042", "story_v_out_412102.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_412102", "412102042", "story_v_out_412102.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_21 = math.max(var_176_12, arg_173_1.talkMaxDuration)

			if var_176_11 <= arg_173_1.time_ and arg_173_1.time_ < var_176_11 + var_176_21 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_11) / var_176_21

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_11 + var_176_21 and arg_173_1.time_ < var_176_11 + var_176_21 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play412102043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 412102043
		arg_177_1.duration_ = 3.6

		local var_177_0 = {
			zh = 2.7,
			ja = 3.6
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
				arg_177_0:Play412102044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1097ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1097ui_story == nil then
				arg_177_1.var_.characterEffect1097ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1097ui_story then
					arg_177_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1097ui_story then
				arg_177_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_180_4 = 0

			if var_180_4 < arg_177_1.time_ and arg_177_1.time_ <= var_180_4 + arg_180_0 then
				arg_177_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_180_5 = 0

			if var_180_5 < arg_177_1.time_ and arg_177_1.time_ <= var_180_5 + arg_180_0 then
				arg_177_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_180_6 = arg_177_1.actors_["1197ui_story"]
			local var_180_7 = 0

			if var_180_7 < arg_177_1.time_ and arg_177_1.time_ <= var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect1197ui_story == nil then
				arg_177_1.var_.characterEffect1197ui_story = var_180_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_8 = 0.200000002980232

			if var_180_7 <= arg_177_1.time_ and arg_177_1.time_ < var_180_7 + var_180_8 then
				local var_180_9 = (arg_177_1.time_ - var_180_7) / var_180_8

				if arg_177_1.var_.characterEffect1197ui_story then
					local var_180_10 = Mathf.Lerp(0, 0.5, var_180_9)

					arg_177_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1197ui_story.fillRatio = var_180_10
				end
			end

			if arg_177_1.time_ >= var_180_7 + var_180_8 and arg_177_1.time_ < var_180_7 + var_180_8 + arg_180_0 and arg_177_1.var_.characterEffect1197ui_story then
				local var_180_11 = 0.5

				arg_177_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1197ui_story.fillRatio = var_180_11
			end

			local var_180_12 = 0
			local var_180_13 = 0.275

			if var_180_12 < arg_177_1.time_ and arg_177_1.time_ <= var_180_12 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_14 = arg_177_1:FormatText(StoryNameCfg[928].name)

				arg_177_1.leftNameTxt_.text = var_180_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_15 = arg_177_1:GetWordFromCfg(412102043)
				local var_180_16 = arg_177_1:FormatText(var_180_15.content)

				arg_177_1.text_.text = var_180_16

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_17 = 11
				local var_180_18 = utf8.len(var_180_16)
				local var_180_19 = var_180_17 <= 0 and var_180_13 or var_180_13 * (var_180_18 / var_180_17)

				if var_180_19 > 0 and var_180_13 < var_180_19 then
					arg_177_1.talkMaxDuration = var_180_19

					if var_180_19 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_12
					end
				end

				arg_177_1.text_.text = var_180_16
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102043", "story_v_out_412102.awb") ~= 0 then
					local var_180_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102043", "story_v_out_412102.awb") / 1000

					if var_180_20 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_20 + var_180_12
					end

					if var_180_15.prefab_name ~= "" and arg_177_1.actors_[var_180_15.prefab_name] ~= nil then
						local var_180_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_15.prefab_name].transform, "story_v_out_412102", "412102043", "story_v_out_412102.awb")

						arg_177_1:RecordAudio("412102043", var_180_21)
						arg_177_1:RecordAudio("412102043", var_180_21)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_412102", "412102043", "story_v_out_412102.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_412102", "412102043", "story_v_out_412102.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_22 = math.max(var_180_13, arg_177_1.talkMaxDuration)

			if var_180_12 <= arg_177_1.time_ and arg_177_1.time_ < var_180_12 + var_180_22 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_12) / var_180_22

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_12 + var_180_22 and arg_177_1.time_ < var_180_12 + var_180_22 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play412102044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 412102044
		arg_181_1.duration_ = 3.8

		local var_181_0 = {
			zh = 3.8,
			ja = 1.9
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play412102045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.25

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[928].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(412102044)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 10
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102044", "story_v_out_412102.awb") ~= 0 then
					local var_184_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102044", "story_v_out_412102.awb") / 1000

					if var_184_8 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_0
					end

					if var_184_3.prefab_name ~= "" and arg_181_1.actors_[var_184_3.prefab_name] ~= nil then
						local var_184_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_3.prefab_name].transform, "story_v_out_412102", "412102044", "story_v_out_412102.awb")

						arg_181_1:RecordAudio("412102044", var_184_9)
						arg_181_1:RecordAudio("412102044", var_184_9)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_412102", "412102044", "story_v_out_412102.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_412102", "412102044", "story_v_out_412102.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_10 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_10 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_10

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_10 and arg_181_1.time_ < var_184_0 + var_184_10 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play412102045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 412102045
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play412102046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1097ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1097ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0, 100, 0)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1097ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, 100, 0)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["1097ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect1097ui_story == nil then
				arg_185_1.var_.characterEffect1097ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect1097ui_story then
					local var_188_13 = Mathf.Lerp(0, 0.5, var_188_12)

					arg_185_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1097ui_story.fillRatio = var_188_13
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect1097ui_story then
				local var_188_14 = 0.5

				arg_185_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1097ui_story.fillRatio = var_188_14
			end

			local var_188_15 = 0
			local var_188_16 = 0.233333333333333

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				local var_188_17 = "play"
				local var_188_18 = "effect"

				arg_185_1:AudioAction(var_188_17, var_188_18, "se_story_132", "se_story_132_clock", "")
			end

			local var_188_19 = manager.ui.mainCamera.transform
			local var_188_20 = 0

			if var_188_20 < arg_185_1.time_ and arg_185_1.time_ <= var_188_20 + arg_188_0 then
				local var_188_21 = arg_185_1.var_.effectdidasheng1

				if not var_188_21 then
					var_188_21 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_188_21.name = "didasheng1"
					arg_185_1.var_.effectdidasheng1 = var_188_21
				end

				local var_188_22 = var_188_19:Find("")

				if var_188_22 then
					var_188_21.transform.parent = var_188_22
				else
					var_188_21.transform.parent = var_188_19
				end

				var_188_21.transform.localPosition = Vector3.New(0, 0, 0)
				var_188_21.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_188_23 = arg_185_1.actors_["1197ui_story"].transform
			local var_188_24 = 0

			if var_188_24 < arg_185_1.time_ and arg_185_1.time_ <= var_188_24 + arg_188_0 then
				arg_185_1.var_.moveOldPos1197ui_story = var_188_23.localPosition
			end

			local var_188_25 = 0.001

			if var_188_24 <= arg_185_1.time_ and arg_185_1.time_ < var_188_24 + var_188_25 then
				local var_188_26 = (arg_185_1.time_ - var_188_24) / var_188_25
				local var_188_27 = Vector3.New(0, 100, 0)

				var_188_23.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1197ui_story, var_188_27, var_188_26)

				local var_188_28 = manager.ui.mainCamera.transform.position - var_188_23.position

				var_188_23.forward = Vector3.New(var_188_28.x, var_188_28.y, var_188_28.z)

				local var_188_29 = var_188_23.localEulerAngles

				var_188_29.z = 0
				var_188_29.x = 0
				var_188_23.localEulerAngles = var_188_29
			end

			if arg_185_1.time_ >= var_188_24 + var_188_25 and arg_185_1.time_ < var_188_24 + var_188_25 + arg_188_0 then
				var_188_23.localPosition = Vector3.New(0, 100, 0)

				local var_188_30 = manager.ui.mainCamera.transform.position - var_188_23.position

				var_188_23.forward = Vector3.New(var_188_30.x, var_188_30.y, var_188_30.z)

				local var_188_31 = var_188_23.localEulerAngles

				var_188_31.z = 0
				var_188_31.x = 0
				var_188_23.localEulerAngles = var_188_31
			end

			local var_188_32 = 0
			local var_188_33 = 0.225

			if var_188_32 < arg_185_1.time_ and arg_185_1.time_ <= var_188_32 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_34 = arg_185_1:GetWordFromCfg(412102045)
				local var_188_35 = arg_185_1:FormatText(var_188_34.content)

				arg_185_1.text_.text = var_188_35

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_36 = 9
				local var_188_37 = utf8.len(var_188_35)
				local var_188_38 = var_188_36 <= 0 and var_188_33 or var_188_33 * (var_188_37 / var_188_36)

				if var_188_38 > 0 and var_188_33 < var_188_38 then
					arg_185_1.talkMaxDuration = var_188_38

					if var_188_38 + var_188_32 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_38 + var_188_32
					end
				end

				arg_185_1.text_.text = var_188_35
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_39 = math.max(var_188_33, arg_185_1.talkMaxDuration)

			if var_188_32 <= arg_185_1.time_ and arg_185_1.time_ < var_188_32 + var_188_39 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_32) / var_188_39

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_32 + var_188_39 and arg_185_1.time_ < var_188_32 + var_188_39 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play412102046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 412102046
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play412102047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.65

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_2 = arg_189_1:GetWordFromCfg(412102046)
				local var_192_3 = arg_189_1:FormatText(var_192_2.content)

				arg_189_1.text_.text = var_192_3

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_4 = 26
				local var_192_5 = utf8.len(var_192_3)
				local var_192_6 = var_192_4 <= 0 and var_192_1 or var_192_1 * (var_192_5 / var_192_4)

				if var_192_6 > 0 and var_192_1 < var_192_6 then
					arg_189_1.talkMaxDuration = var_192_6

					if var_192_6 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_6 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_3
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_7 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_7 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_7

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_7 and arg_189_1.time_ < var_192_0 + var_192_7 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play412102047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 412102047
		arg_193_1.duration_ = 5.4

		local var_193_0 = {
			zh = 1.999999999999,
			ja = 5.4
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play412102048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1097ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1097ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, -0.54, -6.3)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1097ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1097ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect1097ui_story == nil then
				arg_193_1.var_.characterEffect1097ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1097ui_story then
					arg_193_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect1097ui_story then
				arg_193_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_196_13 = 0

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_196_14 = 0

			if var_196_14 < arg_193_1.time_ and arg_193_1.time_ <= var_196_14 + arg_196_0 then
				arg_193_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_196_15 = manager.ui.mainCamera.transform
			local var_196_16 = 0

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 then
				local var_196_17 = arg_193_1.var_.effectdidasheng1

				if var_196_17 then
					Object.Destroy(var_196_17)

					arg_193_1.var_.effectdidasheng1 = nil
				end
			end

			local var_196_18 = 0
			local var_196_19 = 0.15

			if var_196_18 < arg_193_1.time_ and arg_193_1.time_ <= var_196_18 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_20 = arg_193_1:FormatText(StoryNameCfg[928].name)

				arg_193_1.leftNameTxt_.text = var_196_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_21 = arg_193_1:GetWordFromCfg(412102047)
				local var_196_22 = arg_193_1:FormatText(var_196_21.content)

				arg_193_1.text_.text = var_196_22

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_23 = 6
				local var_196_24 = utf8.len(var_196_22)
				local var_196_25 = var_196_23 <= 0 and var_196_19 or var_196_19 * (var_196_24 / var_196_23)

				if var_196_25 > 0 and var_196_19 < var_196_25 then
					arg_193_1.talkMaxDuration = var_196_25

					if var_196_25 + var_196_18 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_25 + var_196_18
					end
				end

				arg_193_1.text_.text = var_196_22
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102047", "story_v_out_412102.awb") ~= 0 then
					local var_196_26 = manager.audio:GetVoiceLength("story_v_out_412102", "412102047", "story_v_out_412102.awb") / 1000

					if var_196_26 + var_196_18 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_26 + var_196_18
					end

					if var_196_21.prefab_name ~= "" and arg_193_1.actors_[var_196_21.prefab_name] ~= nil then
						local var_196_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_21.prefab_name].transform, "story_v_out_412102", "412102047", "story_v_out_412102.awb")

						arg_193_1:RecordAudio("412102047", var_196_27)
						arg_193_1:RecordAudio("412102047", var_196_27)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_412102", "412102047", "story_v_out_412102.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_412102", "412102047", "story_v_out_412102.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_28 = math.max(var_196_19, arg_193_1.talkMaxDuration)

			if var_196_18 <= arg_193_1.time_ and arg_193_1.time_ < var_196_18 + var_196_28 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_18) / var_196_28

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_18 + var_196_28 and arg_193_1.time_ < var_196_18 + var_196_28 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play412102048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 412102048
		arg_197_1.duration_ = 9.033

		local var_197_0 = {
			zh = 3.266,
			ja = 9.033
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
				arg_197_0:Play412102049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.375

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[928].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(412102048)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 15
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102048", "story_v_out_412102.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102048", "story_v_out_412102.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_412102", "412102048", "story_v_out_412102.awb")

						arg_197_1:RecordAudio("412102048", var_200_9)
						arg_197_1:RecordAudio("412102048", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_412102", "412102048", "story_v_out_412102.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_412102", "412102048", "story_v_out_412102.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play412102049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 412102049
		arg_201_1.duration_ = 16.2

		local var_201_0 = {
			zh = 11.6,
			ja = 16.2
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
				arg_201_0:Play412102050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 1.275

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[928].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(412102049)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 50
				local var_204_6 = utf8.len(var_204_4)
				local var_204_7 = var_204_5 <= 0 and var_204_1 or var_204_1 * (var_204_6 / var_204_5)

				if var_204_7 > 0 and var_204_1 < var_204_7 then
					arg_201_1.talkMaxDuration = var_204_7

					if var_204_7 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_7 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_4
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102049", "story_v_out_412102.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102049", "story_v_out_412102.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_412102", "412102049", "story_v_out_412102.awb")

						arg_201_1:RecordAudio("412102049", var_204_9)
						arg_201_1:RecordAudio("412102049", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_412102", "412102049", "story_v_out_412102.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_412102", "412102049", "story_v_out_412102.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_10 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_10 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_10

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_10 and arg_201_1.time_ < var_204_0 + var_204_10 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play412102050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 412102050
		arg_205_1.duration_ = 1.999999999999

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play412102051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1097ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect1097ui_story == nil then
				arg_205_1.var_.characterEffect1097ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.2

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1097ui_story then
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1097ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1097ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1097ui_story.fillRatio = var_208_5
			end

			local var_208_6 = arg_205_1.actors_["1197ui_story"].transform
			local var_208_7 = 0

			if var_208_7 < arg_205_1.time_ and arg_205_1.time_ <= var_208_7 + arg_208_0 then
				arg_205_1.var_.moveOldPos1197ui_story = var_208_6.localPosition
			end

			local var_208_8 = 0.001

			if var_208_7 <= arg_205_1.time_ and arg_205_1.time_ < var_208_7 + var_208_8 then
				local var_208_9 = (arg_205_1.time_ - var_208_7) / var_208_8
				local var_208_10 = Vector3.New(0.7, -0.545, -6.3)

				var_208_6.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1197ui_story, var_208_10, var_208_9)

				local var_208_11 = manager.ui.mainCamera.transform.position - var_208_6.position

				var_208_6.forward = Vector3.New(var_208_11.x, var_208_11.y, var_208_11.z)

				local var_208_12 = var_208_6.localEulerAngles

				var_208_12.z = 0
				var_208_12.x = 0
				var_208_6.localEulerAngles = var_208_12
			end

			if arg_205_1.time_ >= var_208_7 + var_208_8 and arg_205_1.time_ < var_208_7 + var_208_8 + arg_208_0 then
				var_208_6.localPosition = Vector3.New(0.7, -0.545, -6.3)

				local var_208_13 = manager.ui.mainCamera.transform.position - var_208_6.position

				var_208_6.forward = Vector3.New(var_208_13.x, var_208_13.y, var_208_13.z)

				local var_208_14 = var_208_6.localEulerAngles

				var_208_14.z = 0
				var_208_14.x = 0
				var_208_6.localEulerAngles = var_208_14
			end

			local var_208_15 = arg_205_1.actors_["1197ui_story"]
			local var_208_16 = 0

			if var_208_16 < arg_205_1.time_ and arg_205_1.time_ <= var_208_16 + arg_208_0 and arg_205_1.var_.characterEffect1197ui_story == nil then
				arg_205_1.var_.characterEffect1197ui_story = var_208_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_17 = 0.200000002980232

			if var_208_16 <= arg_205_1.time_ and arg_205_1.time_ < var_208_16 + var_208_17 then
				local var_208_18 = (arg_205_1.time_ - var_208_16) / var_208_17

				if arg_205_1.var_.characterEffect1197ui_story then
					arg_205_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_16 + var_208_17 and arg_205_1.time_ < var_208_16 + var_208_17 + arg_208_0 and arg_205_1.var_.characterEffect1197ui_story then
				arg_205_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_208_19 = 0

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 then
				arg_205_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action9_1")
			end

			local var_208_20 = 0

			if var_208_20 < arg_205_1.time_ and arg_205_1.time_ <= var_208_20 + arg_208_0 then
				arg_205_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_208_21 = arg_205_1.actors_["1097ui_story"].transform
			local var_208_22 = 0

			if var_208_22 < arg_205_1.time_ and arg_205_1.time_ <= var_208_22 + arg_208_0 then
				arg_205_1.var_.moveOldPos1097ui_story = var_208_21.localPosition
			end

			local var_208_23 = 0.001

			if var_208_22 <= arg_205_1.time_ and arg_205_1.time_ < var_208_22 + var_208_23 then
				local var_208_24 = (arg_205_1.time_ - var_208_22) / var_208_23
				local var_208_25 = Vector3.New(-0.7, -0.54, -6.3)

				var_208_21.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1097ui_story, var_208_25, var_208_24)

				local var_208_26 = manager.ui.mainCamera.transform.position - var_208_21.position

				var_208_21.forward = Vector3.New(var_208_26.x, var_208_26.y, var_208_26.z)

				local var_208_27 = var_208_21.localEulerAngles

				var_208_27.z = 0
				var_208_27.x = 0
				var_208_21.localEulerAngles = var_208_27
			end

			if arg_205_1.time_ >= var_208_22 + var_208_23 and arg_205_1.time_ < var_208_22 + var_208_23 + arg_208_0 then
				var_208_21.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_208_28 = manager.ui.mainCamera.transform.position - var_208_21.position

				var_208_21.forward = Vector3.New(var_208_28.x, var_208_28.y, var_208_28.z)

				local var_208_29 = var_208_21.localEulerAngles

				var_208_29.z = 0
				var_208_29.x = 0
				var_208_21.localEulerAngles = var_208_29
			end

			local var_208_30 = 0
			local var_208_31 = 0.2

			if var_208_30 < arg_205_1.time_ and arg_205_1.time_ <= var_208_30 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_32 = arg_205_1:FormatText(StoryNameCfg[927].name)

				arg_205_1.leftNameTxt_.text = var_208_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_33 = arg_205_1:GetWordFromCfg(412102050)
				local var_208_34 = arg_205_1:FormatText(var_208_33.content)

				arg_205_1.text_.text = var_208_34

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_35 = 8
				local var_208_36 = utf8.len(var_208_34)
				local var_208_37 = var_208_35 <= 0 and var_208_31 or var_208_31 * (var_208_36 / var_208_35)

				if var_208_37 > 0 and var_208_31 < var_208_37 then
					arg_205_1.talkMaxDuration = var_208_37

					if var_208_37 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_37 + var_208_30
					end
				end

				arg_205_1.text_.text = var_208_34
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102050", "story_v_out_412102.awb") ~= 0 then
					local var_208_38 = manager.audio:GetVoiceLength("story_v_out_412102", "412102050", "story_v_out_412102.awb") / 1000

					if var_208_38 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_38 + var_208_30
					end

					if var_208_33.prefab_name ~= "" and arg_205_1.actors_[var_208_33.prefab_name] ~= nil then
						local var_208_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_33.prefab_name].transform, "story_v_out_412102", "412102050", "story_v_out_412102.awb")

						arg_205_1:RecordAudio("412102050", var_208_39)
						arg_205_1:RecordAudio("412102050", var_208_39)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_412102", "412102050", "story_v_out_412102.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_412102", "412102050", "story_v_out_412102.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_40 = math.max(var_208_31, arg_205_1.talkMaxDuration)

			if var_208_30 <= arg_205_1.time_ and arg_205_1.time_ < var_208_30 + var_208_40 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_30) / var_208_40

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_30 + var_208_40 and arg_205_1.time_ < var_208_30 + var_208_40 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play412102051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 412102051
		arg_209_1.duration_ = 9.433

		local var_209_0 = {
			zh = 3.566,
			ja = 9.433
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
				arg_209_0:Play412102052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1097ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1097ui_story == nil then
				arg_209_1.var_.characterEffect1097ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1097ui_story then
					arg_209_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1097ui_story then
				arg_209_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_212_4 = 0

			if var_212_4 < arg_209_1.time_ and arg_209_1.time_ <= var_212_4 + arg_212_0 then
				arg_209_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_212_5 = arg_209_1.actors_["1197ui_story"]
			local var_212_6 = 0

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 and arg_209_1.var_.characterEffect1197ui_story == nil then
				arg_209_1.var_.characterEffect1197ui_story = var_212_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_7 = 0.200000002980232

			if var_212_6 <= arg_209_1.time_ and arg_209_1.time_ < var_212_6 + var_212_7 then
				local var_212_8 = (arg_209_1.time_ - var_212_6) / var_212_7

				if arg_209_1.var_.characterEffect1197ui_story then
					local var_212_9 = Mathf.Lerp(0, 0.5, var_212_8)

					arg_209_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1197ui_story.fillRatio = var_212_9
				end
			end

			if arg_209_1.time_ >= var_212_6 + var_212_7 and arg_209_1.time_ < var_212_6 + var_212_7 + arg_212_0 and arg_209_1.var_.characterEffect1197ui_story then
				local var_212_10 = 0.5

				arg_209_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1197ui_story.fillRatio = var_212_10
			end

			local var_212_11 = 0
			local var_212_12 = 0.35

			if var_212_11 < arg_209_1.time_ and arg_209_1.time_ <= var_212_11 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_13 = arg_209_1:FormatText(StoryNameCfg[928].name)

				arg_209_1.leftNameTxt_.text = var_212_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_14 = arg_209_1:GetWordFromCfg(412102051)
				local var_212_15 = arg_209_1:FormatText(var_212_14.content)

				arg_209_1.text_.text = var_212_15

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_16 = 14
				local var_212_17 = utf8.len(var_212_15)
				local var_212_18 = var_212_16 <= 0 and var_212_12 or var_212_12 * (var_212_17 / var_212_16)

				if var_212_18 > 0 and var_212_12 < var_212_18 then
					arg_209_1.talkMaxDuration = var_212_18

					if var_212_18 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_18 + var_212_11
					end
				end

				arg_209_1.text_.text = var_212_15
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102051", "story_v_out_412102.awb") ~= 0 then
					local var_212_19 = manager.audio:GetVoiceLength("story_v_out_412102", "412102051", "story_v_out_412102.awb") / 1000

					if var_212_19 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_11
					end

					if var_212_14.prefab_name ~= "" and arg_209_1.actors_[var_212_14.prefab_name] ~= nil then
						local var_212_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_14.prefab_name].transform, "story_v_out_412102", "412102051", "story_v_out_412102.awb")

						arg_209_1:RecordAudio("412102051", var_212_20)
						arg_209_1:RecordAudio("412102051", var_212_20)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_412102", "412102051", "story_v_out_412102.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_412102", "412102051", "story_v_out_412102.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_21 = math.max(var_212_12, arg_209_1.talkMaxDuration)

			if var_212_11 <= arg_209_1.time_ and arg_209_1.time_ < var_212_11 + var_212_21 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_11) / var_212_21

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_11 + var_212_21 and arg_209_1.time_ < var_212_11 + var_212_21 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play412102052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 412102052
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play412102053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1097ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1097ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1097ui_story, var_216_4, var_216_3)

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

			local var_216_9 = arg_213_1.actors_["1097ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1097ui_story == nil then
				arg_213_1.var_.characterEffect1097ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1097ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1097ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1097ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1097ui_story.fillRatio = var_216_14
			end

			local var_216_15 = arg_213_1.actors_["1197ui_story"].transform
			local var_216_16 = 0

			if var_216_16 < arg_213_1.time_ and arg_213_1.time_ <= var_216_16 + arg_216_0 then
				arg_213_1.var_.moveOldPos1197ui_story = var_216_15.localPosition
			end

			local var_216_17 = 0.001

			if var_216_16 <= arg_213_1.time_ and arg_213_1.time_ < var_216_16 + var_216_17 then
				local var_216_18 = (arg_213_1.time_ - var_216_16) / var_216_17
				local var_216_19 = Vector3.New(0, 100, 0)

				var_216_15.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1197ui_story, var_216_19, var_216_18)

				local var_216_20 = manager.ui.mainCamera.transform.position - var_216_15.position

				var_216_15.forward = Vector3.New(var_216_20.x, var_216_20.y, var_216_20.z)

				local var_216_21 = var_216_15.localEulerAngles

				var_216_21.z = 0
				var_216_21.x = 0
				var_216_15.localEulerAngles = var_216_21
			end

			if arg_213_1.time_ >= var_216_16 + var_216_17 and arg_213_1.time_ < var_216_16 + var_216_17 + arg_216_0 then
				var_216_15.localPosition = Vector3.New(0, 100, 0)

				local var_216_22 = manager.ui.mainCamera.transform.position - var_216_15.position

				var_216_15.forward = Vector3.New(var_216_22.x, var_216_22.y, var_216_22.z)

				local var_216_23 = var_216_15.localEulerAngles

				var_216_23.z = 0
				var_216_23.x = 0
				var_216_15.localEulerAngles = var_216_23
			end

			local var_216_24 = 0

			if var_216_24 < arg_213_1.time_ and arg_213_1.time_ <= var_216_24 + arg_216_0 then
				arg_213_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action9_2")
			end

			local var_216_25 = 0
			local var_216_26 = 1.125

			if var_216_25 < arg_213_1.time_ and arg_213_1.time_ <= var_216_25 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_27 = arg_213_1:GetWordFromCfg(412102052)
				local var_216_28 = arg_213_1:FormatText(var_216_27.content)

				arg_213_1.text_.text = var_216_28

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_29 = 45
				local var_216_30 = utf8.len(var_216_28)
				local var_216_31 = var_216_29 <= 0 and var_216_26 or var_216_26 * (var_216_30 / var_216_29)

				if var_216_31 > 0 and var_216_26 < var_216_31 then
					arg_213_1.talkMaxDuration = var_216_31

					if var_216_31 + var_216_25 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_31 + var_216_25
					end
				end

				arg_213_1.text_.text = var_216_28
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_32 = math.max(var_216_26, arg_213_1.talkMaxDuration)

			if var_216_25 <= arg_213_1.time_ and arg_213_1.time_ < var_216_25 + var_216_32 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_25) / var_216_32

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_25 + var_216_32 and arg_213_1.time_ < var_216_25 + var_216_32 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play412102053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 412102053
		arg_217_1.duration_ = 4

		local var_217_0 = {
			zh = 2.966,
			ja = 4
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play412102054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1097ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1097ui_story == nil then
				arg_217_1.var_.characterEffect1097ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.200000002980232

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1097ui_story then
					arg_217_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1097ui_story then
				arg_217_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_220_4 = 0

			if var_220_4 < arg_217_1.time_ and arg_217_1.time_ <= var_220_4 + arg_220_0 then
				arg_217_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_220_5 = 0

			if var_220_5 < arg_217_1.time_ and arg_217_1.time_ <= var_220_5 + arg_220_0 then
				arg_217_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_220_6 = arg_217_1.actors_["1097ui_story"].transform
			local var_220_7 = 0

			if var_220_7 < arg_217_1.time_ and arg_217_1.time_ <= var_220_7 + arg_220_0 then
				arg_217_1.var_.moveOldPos1097ui_story = var_220_6.localPosition
			end

			local var_220_8 = 0.001

			if var_220_7 <= arg_217_1.time_ and arg_217_1.time_ < var_220_7 + var_220_8 then
				local var_220_9 = (arg_217_1.time_ - var_220_7) / var_220_8
				local var_220_10 = Vector3.New(-0.7, -0.54, -6.3)

				var_220_6.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1097ui_story, var_220_10, var_220_9)

				local var_220_11 = manager.ui.mainCamera.transform.position - var_220_6.position

				var_220_6.forward = Vector3.New(var_220_11.x, var_220_11.y, var_220_11.z)

				local var_220_12 = var_220_6.localEulerAngles

				var_220_12.z = 0
				var_220_12.x = 0
				var_220_6.localEulerAngles = var_220_12
			end

			if arg_217_1.time_ >= var_220_7 + var_220_8 and arg_217_1.time_ < var_220_7 + var_220_8 + arg_220_0 then
				var_220_6.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_220_13 = manager.ui.mainCamera.transform.position - var_220_6.position

				var_220_6.forward = Vector3.New(var_220_13.x, var_220_13.y, var_220_13.z)

				local var_220_14 = var_220_6.localEulerAngles

				var_220_14.z = 0
				var_220_14.x = 0
				var_220_6.localEulerAngles = var_220_14
			end

			local var_220_15 = arg_217_1.actors_["1197ui_story"].transform
			local var_220_16 = 0

			if var_220_16 < arg_217_1.time_ and arg_217_1.time_ <= var_220_16 + arg_220_0 then
				arg_217_1.var_.moveOldPos1197ui_story = var_220_15.localPosition
			end

			local var_220_17 = 0.001

			if var_220_16 <= arg_217_1.time_ and arg_217_1.time_ < var_220_16 + var_220_17 then
				local var_220_18 = (arg_217_1.time_ - var_220_16) / var_220_17
				local var_220_19 = Vector3.New(0.7, -0.545, -6.3)

				var_220_15.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1197ui_story, var_220_19, var_220_18)

				local var_220_20 = manager.ui.mainCamera.transform.position - var_220_15.position

				var_220_15.forward = Vector3.New(var_220_20.x, var_220_20.y, var_220_20.z)

				local var_220_21 = var_220_15.localEulerAngles

				var_220_21.z = 0
				var_220_21.x = 0
				var_220_15.localEulerAngles = var_220_21
			end

			if arg_217_1.time_ >= var_220_16 + var_220_17 and arg_217_1.time_ < var_220_16 + var_220_17 + arg_220_0 then
				var_220_15.localPosition = Vector3.New(0.7, -0.545, -6.3)

				local var_220_22 = manager.ui.mainCamera.transform.position - var_220_15.position

				var_220_15.forward = Vector3.New(var_220_22.x, var_220_22.y, var_220_22.z)

				local var_220_23 = var_220_15.localEulerAngles

				var_220_23.z = 0
				var_220_23.x = 0
				var_220_15.localEulerAngles = var_220_23
			end

			local var_220_24 = 0
			local var_220_25 = 0.275

			if var_220_24 < arg_217_1.time_ and arg_217_1.time_ <= var_220_24 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_26 = arg_217_1:FormatText(StoryNameCfg[928].name)

				arg_217_1.leftNameTxt_.text = var_220_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_27 = arg_217_1:GetWordFromCfg(412102053)
				local var_220_28 = arg_217_1:FormatText(var_220_27.content)

				arg_217_1.text_.text = var_220_28

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_29 = 11
				local var_220_30 = utf8.len(var_220_28)
				local var_220_31 = var_220_29 <= 0 and var_220_25 or var_220_25 * (var_220_30 / var_220_29)

				if var_220_31 > 0 and var_220_25 < var_220_31 then
					arg_217_1.talkMaxDuration = var_220_31

					if var_220_31 + var_220_24 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_31 + var_220_24
					end
				end

				arg_217_1.text_.text = var_220_28
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102053", "story_v_out_412102.awb") ~= 0 then
					local var_220_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102053", "story_v_out_412102.awb") / 1000

					if var_220_32 + var_220_24 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_32 + var_220_24
					end

					if var_220_27.prefab_name ~= "" and arg_217_1.actors_[var_220_27.prefab_name] ~= nil then
						local var_220_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_27.prefab_name].transform, "story_v_out_412102", "412102053", "story_v_out_412102.awb")

						arg_217_1:RecordAudio("412102053", var_220_33)
						arg_217_1:RecordAudio("412102053", var_220_33)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_412102", "412102053", "story_v_out_412102.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_412102", "412102053", "story_v_out_412102.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_34 = math.max(var_220_25, arg_217_1.talkMaxDuration)

			if var_220_24 <= arg_217_1.time_ and arg_217_1.time_ < var_220_24 + var_220_34 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_24) / var_220_34

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_24 + var_220_34 and arg_217_1.time_ < var_220_24 + var_220_34 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play412102054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 412102054
		arg_221_1.duration_ = 11.2

		local var_221_0 = {
			zh = 7.1,
			ja = 11.2
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play412102055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1097ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1097ui_story == nil then
				arg_221_1.var_.characterEffect1097ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1097ui_story then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1097ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1097ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1097ui_story.fillRatio = var_224_5
			end

			local var_224_6 = arg_221_1.actors_["1197ui_story"]
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 and arg_221_1.var_.characterEffect1197ui_story == nil then
				arg_221_1.var_.characterEffect1197ui_story = var_224_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_8 = 0.200000002980232

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_8 then
				local var_224_9 = (arg_221_1.time_ - var_224_7) / var_224_8

				if arg_221_1.var_.characterEffect1197ui_story then
					arg_221_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_7 + var_224_8 and arg_221_1.time_ < var_224_7 + var_224_8 + arg_224_0 and arg_221_1.var_.characterEffect1197ui_story then
				arg_221_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_224_10 = 0
			local var_224_11 = 0.875

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_12 = arg_221_1:FormatText(StoryNameCfg[927].name)

				arg_221_1.leftNameTxt_.text = var_224_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_13 = arg_221_1:GetWordFromCfg(412102054)
				local var_224_14 = arg_221_1:FormatText(var_224_13.content)

				arg_221_1.text_.text = var_224_14

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_15 = 35
				local var_224_16 = utf8.len(var_224_14)
				local var_224_17 = var_224_15 <= 0 and var_224_11 or var_224_11 * (var_224_16 / var_224_15)

				if var_224_17 > 0 and var_224_11 < var_224_17 then
					arg_221_1.talkMaxDuration = var_224_17

					if var_224_17 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_17 + var_224_10
					end
				end

				arg_221_1.text_.text = var_224_14
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102054", "story_v_out_412102.awb") ~= 0 then
					local var_224_18 = manager.audio:GetVoiceLength("story_v_out_412102", "412102054", "story_v_out_412102.awb") / 1000

					if var_224_18 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_18 + var_224_10
					end

					if var_224_13.prefab_name ~= "" and arg_221_1.actors_[var_224_13.prefab_name] ~= nil then
						local var_224_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_13.prefab_name].transform, "story_v_out_412102", "412102054", "story_v_out_412102.awb")

						arg_221_1:RecordAudio("412102054", var_224_19)
						arg_221_1:RecordAudio("412102054", var_224_19)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_412102", "412102054", "story_v_out_412102.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_412102", "412102054", "story_v_out_412102.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_20 = math.max(var_224_11, arg_221_1.talkMaxDuration)

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_20 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_10) / var_224_20

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_10 + var_224_20 and arg_221_1.time_ < var_224_10 + var_224_20 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play412102055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 412102055
		arg_225_1.duration_ = 2.3

		local var_225_0 = {
			zh = 2.233,
			ja = 2.3
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play412102056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1097ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1097ui_story == nil then
				arg_225_1.var_.characterEffect1097ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.200000002980232

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1097ui_story then
					arg_225_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1097ui_story then
				arg_225_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_228_4 = 0

			if var_228_4 < arg_225_1.time_ and arg_225_1.time_ <= var_228_4 + arg_228_0 then
				arg_225_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_228_5 = 0

			if var_228_5 < arg_225_1.time_ and arg_225_1.time_ <= var_228_5 + arg_228_0 then
				arg_225_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_228_6 = arg_225_1.actors_["1197ui_story"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 and arg_225_1.var_.characterEffect1197ui_story == nil then
				arg_225_1.var_.characterEffect1197ui_story = var_228_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_8 = 0.200000002980232

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8

				if arg_225_1.var_.characterEffect1197ui_story then
					local var_228_10 = Mathf.Lerp(0, 0.5, var_228_9)

					arg_225_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1197ui_story.fillRatio = var_228_10
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 and arg_225_1.var_.characterEffect1197ui_story then
				local var_228_11 = 0.5

				arg_225_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1197ui_story.fillRatio = var_228_11
			end

			local var_228_12 = 0
			local var_228_13 = 0.2

			if var_228_12 < arg_225_1.time_ and arg_225_1.time_ <= var_228_12 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_14 = arg_225_1:FormatText(StoryNameCfg[928].name)

				arg_225_1.leftNameTxt_.text = var_228_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_15 = arg_225_1:GetWordFromCfg(412102055)
				local var_228_16 = arg_225_1:FormatText(var_228_15.content)

				arg_225_1.text_.text = var_228_16

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_17 = 8
				local var_228_18 = utf8.len(var_228_16)
				local var_228_19 = var_228_17 <= 0 and var_228_13 or var_228_13 * (var_228_18 / var_228_17)

				if var_228_19 > 0 and var_228_13 < var_228_19 then
					arg_225_1.talkMaxDuration = var_228_19

					if var_228_19 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_19 + var_228_12
					end
				end

				arg_225_1.text_.text = var_228_16
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102055", "story_v_out_412102.awb") ~= 0 then
					local var_228_20 = manager.audio:GetVoiceLength("story_v_out_412102", "412102055", "story_v_out_412102.awb") / 1000

					if var_228_20 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_12
					end

					if var_228_15.prefab_name ~= "" and arg_225_1.actors_[var_228_15.prefab_name] ~= nil then
						local var_228_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_15.prefab_name].transform, "story_v_out_412102", "412102055", "story_v_out_412102.awb")

						arg_225_1:RecordAudio("412102055", var_228_21)
						arg_225_1:RecordAudio("412102055", var_228_21)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_412102", "412102055", "story_v_out_412102.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_412102", "412102055", "story_v_out_412102.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_22 = math.max(var_228_13, arg_225_1.talkMaxDuration)

			if var_228_12 <= arg_225_1.time_ and arg_225_1.time_ < var_228_12 + var_228_22 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_12) / var_228_22

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_12 + var_228_22 and arg_225_1.time_ < var_228_12 + var_228_22 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play412102056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 412102056
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play412102057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1097ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1097ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, 100, 0)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1097ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, 100, 0)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["1097ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect1097ui_story == nil then
				arg_229_1.var_.characterEffect1097ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect1097ui_story then
					local var_232_13 = Mathf.Lerp(0, 0.5, var_232_12)

					arg_229_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1097ui_story.fillRatio = var_232_13
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect1097ui_story then
				local var_232_14 = 0.5

				arg_229_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1097ui_story.fillRatio = var_232_14
			end

			local var_232_15 = arg_229_1.actors_["1197ui_story"].transform
			local var_232_16 = 0

			if var_232_16 < arg_229_1.time_ and arg_229_1.time_ <= var_232_16 + arg_232_0 then
				arg_229_1.var_.moveOldPos1197ui_story = var_232_15.localPosition
			end

			local var_232_17 = 0.001

			if var_232_16 <= arg_229_1.time_ and arg_229_1.time_ < var_232_16 + var_232_17 then
				local var_232_18 = (arg_229_1.time_ - var_232_16) / var_232_17
				local var_232_19 = Vector3.New(0, 100, 0)

				var_232_15.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1197ui_story, var_232_19, var_232_18)

				local var_232_20 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_20.x, var_232_20.y, var_232_20.z)

				local var_232_21 = var_232_15.localEulerAngles

				var_232_21.z = 0
				var_232_21.x = 0
				var_232_15.localEulerAngles = var_232_21
			end

			if arg_229_1.time_ >= var_232_16 + var_232_17 and arg_229_1.time_ < var_232_16 + var_232_17 + arg_232_0 then
				var_232_15.localPosition = Vector3.New(0, 100, 0)

				local var_232_22 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_22.x, var_232_22.y, var_232_22.z)

				local var_232_23 = var_232_15.localEulerAngles

				var_232_23.z = 0
				var_232_23.x = 0
				var_232_15.localEulerAngles = var_232_23
			end

			local var_232_24 = 0
			local var_232_25 = 1

			if var_232_24 < arg_229_1.time_ and arg_229_1.time_ <= var_232_24 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_26 = arg_229_1:GetWordFromCfg(412102056)
				local var_232_27 = arg_229_1:FormatText(var_232_26.content)

				arg_229_1.text_.text = var_232_27

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_28 = 40
				local var_232_29 = utf8.len(var_232_27)
				local var_232_30 = var_232_28 <= 0 and var_232_25 or var_232_25 * (var_232_29 / var_232_28)

				if var_232_30 > 0 and var_232_25 < var_232_30 then
					arg_229_1.talkMaxDuration = var_232_30

					if var_232_30 + var_232_24 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_30 + var_232_24
					end
				end

				arg_229_1.text_.text = var_232_27
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_31 = math.max(var_232_25, arg_229_1.talkMaxDuration)

			if var_232_24 <= arg_229_1.time_ and arg_229_1.time_ < var_232_24 + var_232_31 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_24) / var_232_31

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_24 + var_232_31 and arg_229_1.time_ < var_232_24 + var_232_31 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play412102057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 412102057
		arg_233_1.duration_ = 6.866

		local var_233_0 = {
			zh = 3.4,
			ja = 6.866
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play412102058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1197ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos1197ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(0, -0.545, -6.3)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1197ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["1197ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect1197ui_story == nil then
				arg_233_1.var_.characterEffect1197ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.2

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect1197ui_story then
					arg_233_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect1197ui_story then
				arg_233_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_236_13 = 0
			local var_236_14 = 0.35

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_15 = arg_233_1:FormatText(StoryNameCfg[927].name)

				arg_233_1.leftNameTxt_.text = var_236_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_16 = arg_233_1:GetWordFromCfg(412102057)
				local var_236_17 = arg_233_1:FormatText(var_236_16.content)

				arg_233_1.text_.text = var_236_17

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_18 = 14
				local var_236_19 = utf8.len(var_236_17)
				local var_236_20 = var_236_18 <= 0 and var_236_14 or var_236_14 * (var_236_19 / var_236_18)

				if var_236_20 > 0 and var_236_14 < var_236_20 then
					arg_233_1.talkMaxDuration = var_236_20

					if var_236_20 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_20 + var_236_13
					end
				end

				arg_233_1.text_.text = var_236_17
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102057", "story_v_out_412102.awb") ~= 0 then
					local var_236_21 = manager.audio:GetVoiceLength("story_v_out_412102", "412102057", "story_v_out_412102.awb") / 1000

					if var_236_21 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_13
					end

					if var_236_16.prefab_name ~= "" and arg_233_1.actors_[var_236_16.prefab_name] ~= nil then
						local var_236_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_16.prefab_name].transform, "story_v_out_412102", "412102057", "story_v_out_412102.awb")

						arg_233_1:RecordAudio("412102057", var_236_22)
						arg_233_1:RecordAudio("412102057", var_236_22)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_412102", "412102057", "story_v_out_412102.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_412102", "412102057", "story_v_out_412102.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_23 = math.max(var_236_14, arg_233_1.talkMaxDuration)

			if var_236_13 <= arg_233_1.time_ and arg_233_1.time_ < var_236_13 + var_236_23 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_13) / var_236_23

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_13 + var_236_23 and arg_233_1.time_ < var_236_13 + var_236_23 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play412102058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 412102058
		arg_237_1.duration_ = 5.966

		local var_237_0 = {
			zh = 1.999999999999,
			ja = 5.966
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play412102059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1097ui_story"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos1097ui_story = var_240_0.localPosition
			end

			local var_240_2 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2
				local var_240_4 = Vector3.New(0, -0.54, -6.3)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1097ui_story, var_240_4, var_240_3)

				local var_240_5 = manager.ui.mainCamera.transform.position - var_240_0.position

				var_240_0.forward = Vector3.New(var_240_5.x, var_240_5.y, var_240_5.z)

				local var_240_6 = var_240_0.localEulerAngles

				var_240_6.z = 0
				var_240_6.x = 0
				var_240_0.localEulerAngles = var_240_6
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_240_7 = manager.ui.mainCamera.transform.position - var_240_0.position

				var_240_0.forward = Vector3.New(var_240_7.x, var_240_7.y, var_240_7.z)

				local var_240_8 = var_240_0.localEulerAngles

				var_240_8.z = 0
				var_240_8.x = 0
				var_240_0.localEulerAngles = var_240_8
			end

			local var_240_9 = arg_237_1.actors_["1097ui_story"]
			local var_240_10 = 0

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 and arg_237_1.var_.characterEffect1097ui_story == nil then
				arg_237_1.var_.characterEffect1097ui_story = var_240_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_11 = 0.200000002980232

			if var_240_10 <= arg_237_1.time_ and arg_237_1.time_ < var_240_10 + var_240_11 then
				local var_240_12 = (arg_237_1.time_ - var_240_10) / var_240_11

				if arg_237_1.var_.characterEffect1097ui_story then
					arg_237_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_10 + var_240_11 and arg_237_1.time_ < var_240_10 + var_240_11 + arg_240_0 and arg_237_1.var_.characterEffect1097ui_story then
				arg_237_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_240_13 = 0

			if var_240_13 < arg_237_1.time_ and arg_237_1.time_ <= var_240_13 + arg_240_0 then
				arg_237_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_240_14 = 0

			if var_240_14 < arg_237_1.time_ and arg_237_1.time_ <= var_240_14 + arg_240_0 then
				arg_237_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_240_15 = arg_237_1.actors_["1197ui_story"].transform
			local var_240_16 = 0

			if var_240_16 < arg_237_1.time_ and arg_237_1.time_ <= var_240_16 + arg_240_0 then
				arg_237_1.var_.moveOldPos1197ui_story = var_240_15.localPosition
			end

			local var_240_17 = 0.001

			if var_240_16 <= arg_237_1.time_ and arg_237_1.time_ < var_240_16 + var_240_17 then
				local var_240_18 = (arg_237_1.time_ - var_240_16) / var_240_17
				local var_240_19 = Vector3.New(0, 100, 0)

				var_240_15.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1197ui_story, var_240_19, var_240_18)

				local var_240_20 = manager.ui.mainCamera.transform.position - var_240_15.position

				var_240_15.forward = Vector3.New(var_240_20.x, var_240_20.y, var_240_20.z)

				local var_240_21 = var_240_15.localEulerAngles

				var_240_21.z = 0
				var_240_21.x = 0
				var_240_15.localEulerAngles = var_240_21
			end

			if arg_237_1.time_ >= var_240_16 + var_240_17 and arg_237_1.time_ < var_240_16 + var_240_17 + arg_240_0 then
				var_240_15.localPosition = Vector3.New(0, 100, 0)

				local var_240_22 = manager.ui.mainCamera.transform.position - var_240_15.position

				var_240_15.forward = Vector3.New(var_240_22.x, var_240_22.y, var_240_22.z)

				local var_240_23 = var_240_15.localEulerAngles

				var_240_23.z = 0
				var_240_23.x = 0
				var_240_15.localEulerAngles = var_240_23
			end

			local var_240_24 = 0
			local var_240_25 = 0.125

			if var_240_24 < arg_237_1.time_ and arg_237_1.time_ <= var_240_24 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_26 = arg_237_1:FormatText(StoryNameCfg[928].name)

				arg_237_1.leftNameTxt_.text = var_240_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_27 = arg_237_1:GetWordFromCfg(412102058)
				local var_240_28 = arg_237_1:FormatText(var_240_27.content)

				arg_237_1.text_.text = var_240_28

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_29 = 5
				local var_240_30 = utf8.len(var_240_28)
				local var_240_31 = var_240_29 <= 0 and var_240_25 or var_240_25 * (var_240_30 / var_240_29)

				if var_240_31 > 0 and var_240_25 < var_240_31 then
					arg_237_1.talkMaxDuration = var_240_31

					if var_240_31 + var_240_24 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_31 + var_240_24
					end
				end

				arg_237_1.text_.text = var_240_28
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102058", "story_v_out_412102.awb") ~= 0 then
					local var_240_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102058", "story_v_out_412102.awb") / 1000

					if var_240_32 + var_240_24 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_32 + var_240_24
					end

					if var_240_27.prefab_name ~= "" and arg_237_1.actors_[var_240_27.prefab_name] ~= nil then
						local var_240_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_27.prefab_name].transform, "story_v_out_412102", "412102058", "story_v_out_412102.awb")

						arg_237_1:RecordAudio("412102058", var_240_33)
						arg_237_1:RecordAudio("412102058", var_240_33)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_412102", "412102058", "story_v_out_412102.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_412102", "412102058", "story_v_out_412102.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_34 = math.max(var_240_25, arg_237_1.talkMaxDuration)

			if var_240_24 <= arg_237_1.time_ and arg_237_1.time_ < var_240_24 + var_240_34 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_24) / var_240_34

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_24 + var_240_34 and arg_237_1.time_ < var_240_24 + var_240_34 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play412102059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 412102059
		arg_241_1.duration_ = 4.233

		local var_241_0 = {
			zh = 2,
			ja = 4.233
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play412102060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1097ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1097ui_story == nil then
				arg_241_1.var_.characterEffect1097ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1097ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1097ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1097ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1097ui_story.fillRatio = var_244_5
			end

			local var_244_6 = arg_241_1.actors_["1097ui_story"].transform
			local var_244_7 = 0

			if var_244_7 < arg_241_1.time_ and arg_241_1.time_ <= var_244_7 + arg_244_0 then
				arg_241_1.var_.moveOldPos1097ui_story = var_244_6.localPosition
			end

			local var_244_8 = 0.001

			if var_244_7 <= arg_241_1.time_ and arg_241_1.time_ < var_244_7 + var_244_8 then
				local var_244_9 = (arg_241_1.time_ - var_244_7) / var_244_8
				local var_244_10 = Vector3.New(0, 100, 0)

				var_244_6.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1097ui_story, var_244_10, var_244_9)

				local var_244_11 = manager.ui.mainCamera.transform.position - var_244_6.position

				var_244_6.forward = Vector3.New(var_244_11.x, var_244_11.y, var_244_11.z)

				local var_244_12 = var_244_6.localEulerAngles

				var_244_12.z = 0
				var_244_12.x = 0
				var_244_6.localEulerAngles = var_244_12
			end

			if arg_241_1.time_ >= var_244_7 + var_244_8 and arg_241_1.time_ < var_244_7 + var_244_8 + arg_244_0 then
				var_244_6.localPosition = Vector3.New(0, 100, 0)

				local var_244_13 = manager.ui.mainCamera.transform.position - var_244_6.position

				var_244_6.forward = Vector3.New(var_244_13.x, var_244_13.y, var_244_13.z)

				local var_244_14 = var_244_6.localEulerAngles

				var_244_14.z = 0
				var_244_14.x = 0
				var_244_6.localEulerAngles = var_244_14
			end

			local var_244_15 = arg_241_1.actors_["1197ui_story"].transform
			local var_244_16 = 0

			if var_244_16 < arg_241_1.time_ and arg_241_1.time_ <= var_244_16 + arg_244_0 then
				arg_241_1.var_.moveOldPos1197ui_story = var_244_15.localPosition
			end

			local var_244_17 = 0.001

			if var_244_16 <= arg_241_1.time_ and arg_241_1.time_ < var_244_16 + var_244_17 then
				local var_244_18 = (arg_241_1.time_ - var_244_16) / var_244_17
				local var_244_19 = Vector3.New(0, -0.545, -6.3)

				var_244_15.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1197ui_story, var_244_19, var_244_18)

				local var_244_20 = manager.ui.mainCamera.transform.position - var_244_15.position

				var_244_15.forward = Vector3.New(var_244_20.x, var_244_20.y, var_244_20.z)

				local var_244_21 = var_244_15.localEulerAngles

				var_244_21.z = 0
				var_244_21.x = 0
				var_244_15.localEulerAngles = var_244_21
			end

			if arg_241_1.time_ >= var_244_16 + var_244_17 and arg_241_1.time_ < var_244_16 + var_244_17 + arg_244_0 then
				var_244_15.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_244_22 = manager.ui.mainCamera.transform.position - var_244_15.position

				var_244_15.forward = Vector3.New(var_244_22.x, var_244_22.y, var_244_22.z)

				local var_244_23 = var_244_15.localEulerAngles

				var_244_23.z = 0
				var_244_23.x = 0
				var_244_15.localEulerAngles = var_244_23
			end

			local var_244_24 = arg_241_1.actors_["1197ui_story"]
			local var_244_25 = 0

			if var_244_25 < arg_241_1.time_ and arg_241_1.time_ <= var_244_25 + arg_244_0 and arg_241_1.var_.characterEffect1197ui_story == nil then
				arg_241_1.var_.characterEffect1197ui_story = var_244_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_26 = 0.200000002980232

			if var_244_25 <= arg_241_1.time_ and arg_241_1.time_ < var_244_25 + var_244_26 then
				local var_244_27 = (arg_241_1.time_ - var_244_25) / var_244_26

				if arg_241_1.var_.characterEffect1197ui_story then
					arg_241_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_25 + var_244_26 and arg_241_1.time_ < var_244_25 + var_244_26 + arg_244_0 and arg_241_1.var_.characterEffect1197ui_story then
				arg_241_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_244_28 = 0

			if var_244_28 < arg_241_1.time_ and arg_241_1.time_ <= var_244_28 + arg_244_0 then
				arg_241_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_244_29 = 0
			local var_244_30 = 0.225

			if var_244_29 < arg_241_1.time_ and arg_241_1.time_ <= var_244_29 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_31 = arg_241_1:FormatText(StoryNameCfg[927].name)

				arg_241_1.leftNameTxt_.text = var_244_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_32 = arg_241_1:GetWordFromCfg(412102059)
				local var_244_33 = arg_241_1:FormatText(var_244_32.content)

				arg_241_1.text_.text = var_244_33

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_34 = 9
				local var_244_35 = utf8.len(var_244_33)
				local var_244_36 = var_244_34 <= 0 and var_244_30 or var_244_30 * (var_244_35 / var_244_34)

				if var_244_36 > 0 and var_244_30 < var_244_36 then
					arg_241_1.talkMaxDuration = var_244_36

					if var_244_36 + var_244_29 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_36 + var_244_29
					end
				end

				arg_241_1.text_.text = var_244_33
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102059", "story_v_out_412102.awb") ~= 0 then
					local var_244_37 = manager.audio:GetVoiceLength("story_v_out_412102", "412102059", "story_v_out_412102.awb") / 1000

					if var_244_37 + var_244_29 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_37 + var_244_29
					end

					if var_244_32.prefab_name ~= "" and arg_241_1.actors_[var_244_32.prefab_name] ~= nil then
						local var_244_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_32.prefab_name].transform, "story_v_out_412102", "412102059", "story_v_out_412102.awb")

						arg_241_1:RecordAudio("412102059", var_244_38)
						arg_241_1:RecordAudio("412102059", var_244_38)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_412102", "412102059", "story_v_out_412102.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_412102", "412102059", "story_v_out_412102.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_39 = math.max(var_244_30, arg_241_1.talkMaxDuration)

			if var_244_29 <= arg_241_1.time_ and arg_241_1.time_ < var_244_29 + var_244_39 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_29) / var_244_39

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_29 + var_244_39 and arg_241_1.time_ < var_244_29 + var_244_39 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play412102060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 412102060
		arg_245_1.duration_ = 4.733

		local var_245_0 = {
			zh = 1.999999999999,
			ja = 4.733
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play412102061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1097ui_story"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos1097ui_story = var_248_0.localPosition
			end

			local var_248_2 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2
				local var_248_4 = Vector3.New(0, -0.54, -6.3)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1097ui_story, var_248_4, var_248_3)

				local var_248_5 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_5.x, var_248_5.y, var_248_5.z)

				local var_248_6 = var_248_0.localEulerAngles

				var_248_6.z = 0
				var_248_6.x = 0
				var_248_0.localEulerAngles = var_248_6
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_248_7 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_7.x, var_248_7.y, var_248_7.z)

				local var_248_8 = var_248_0.localEulerAngles

				var_248_8.z = 0
				var_248_8.x = 0
				var_248_0.localEulerAngles = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["1097ui_story"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 and arg_245_1.var_.characterEffect1097ui_story == nil then
				arg_245_1.var_.characterEffect1097ui_story = var_248_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_11 = 0.200000002980232

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_11 then
				local var_248_12 = (arg_245_1.time_ - var_248_10) / var_248_11

				if arg_245_1.var_.characterEffect1097ui_story then
					arg_245_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_11 and arg_245_1.time_ < var_248_10 + var_248_11 + arg_248_0 and arg_245_1.var_.characterEffect1097ui_story then
				arg_245_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_248_15 = arg_245_1.actors_["1197ui_story"].transform
			local var_248_16 = 0

			if var_248_16 < arg_245_1.time_ and arg_245_1.time_ <= var_248_16 + arg_248_0 then
				arg_245_1.var_.moveOldPos1197ui_story = var_248_15.localPosition
			end

			local var_248_17 = 0.001

			if var_248_16 <= arg_245_1.time_ and arg_245_1.time_ < var_248_16 + var_248_17 then
				local var_248_18 = (arg_245_1.time_ - var_248_16) / var_248_17
				local var_248_19 = Vector3.New(0, 100, 0)

				var_248_15.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1197ui_story, var_248_19, var_248_18)

				local var_248_20 = manager.ui.mainCamera.transform.position - var_248_15.position

				var_248_15.forward = Vector3.New(var_248_20.x, var_248_20.y, var_248_20.z)

				local var_248_21 = var_248_15.localEulerAngles

				var_248_21.z = 0
				var_248_21.x = 0
				var_248_15.localEulerAngles = var_248_21
			end

			if arg_245_1.time_ >= var_248_16 + var_248_17 and arg_245_1.time_ < var_248_16 + var_248_17 + arg_248_0 then
				var_248_15.localPosition = Vector3.New(0, 100, 0)

				local var_248_22 = manager.ui.mainCamera.transform.position - var_248_15.position

				var_248_15.forward = Vector3.New(var_248_22.x, var_248_22.y, var_248_22.z)

				local var_248_23 = var_248_15.localEulerAngles

				var_248_23.z = 0
				var_248_23.x = 0
				var_248_15.localEulerAngles = var_248_23
			end

			local var_248_24 = 0
			local var_248_25 = 0.175

			if var_248_24 < arg_245_1.time_ and arg_245_1.time_ <= var_248_24 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_26 = arg_245_1:FormatText(StoryNameCfg[928].name)

				arg_245_1.leftNameTxt_.text = var_248_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_27 = arg_245_1:GetWordFromCfg(412102060)
				local var_248_28 = arg_245_1:FormatText(var_248_27.content)

				arg_245_1.text_.text = var_248_28

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_29 = 7
				local var_248_30 = utf8.len(var_248_28)
				local var_248_31 = var_248_29 <= 0 and var_248_25 or var_248_25 * (var_248_30 / var_248_29)

				if var_248_31 > 0 and var_248_25 < var_248_31 then
					arg_245_1.talkMaxDuration = var_248_31

					if var_248_31 + var_248_24 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_31 + var_248_24
					end
				end

				arg_245_1.text_.text = var_248_28
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102060", "story_v_out_412102.awb") ~= 0 then
					local var_248_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102060", "story_v_out_412102.awb") / 1000

					if var_248_32 + var_248_24 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_32 + var_248_24
					end

					if var_248_27.prefab_name ~= "" and arg_245_1.actors_[var_248_27.prefab_name] ~= nil then
						local var_248_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_27.prefab_name].transform, "story_v_out_412102", "412102060", "story_v_out_412102.awb")

						arg_245_1:RecordAudio("412102060", var_248_33)
						arg_245_1:RecordAudio("412102060", var_248_33)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_412102", "412102060", "story_v_out_412102.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_412102", "412102060", "story_v_out_412102.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_34 = math.max(var_248_25, arg_245_1.talkMaxDuration)

			if var_248_24 <= arg_245_1.time_ and arg_245_1.time_ < var_248_24 + var_248_34 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_24) / var_248_34

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_24 + var_248_34 and arg_245_1.time_ < var_248_24 + var_248_34 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play412102061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 412102061
		arg_249_1.duration_ = 7.7

		local var_249_0 = {
			zh = 4.433,
			ja = 7.7
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
				arg_249_0:Play412102062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1097ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1097ui_story == nil then
				arg_249_1.var_.characterEffect1097ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1097ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1097ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1097ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1097ui_story.fillRatio = var_252_5
			end

			local var_252_6 = arg_249_1.actors_["1097ui_story"].transform
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 then
				arg_249_1.var_.moveOldPos1097ui_story = var_252_6.localPosition
			end

			local var_252_8 = 0.001

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8
				local var_252_10 = Vector3.New(0, 100, 0)

				var_252_6.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1097ui_story, var_252_10, var_252_9)

				local var_252_11 = manager.ui.mainCamera.transform.position - var_252_6.position

				var_252_6.forward = Vector3.New(var_252_11.x, var_252_11.y, var_252_11.z)

				local var_252_12 = var_252_6.localEulerAngles

				var_252_12.z = 0
				var_252_12.x = 0
				var_252_6.localEulerAngles = var_252_12
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 then
				var_252_6.localPosition = Vector3.New(0, 100, 0)

				local var_252_13 = manager.ui.mainCamera.transform.position - var_252_6.position

				var_252_6.forward = Vector3.New(var_252_13.x, var_252_13.y, var_252_13.z)

				local var_252_14 = var_252_6.localEulerAngles

				var_252_14.z = 0
				var_252_14.x = 0
				var_252_6.localEulerAngles = var_252_14
			end

			local var_252_15 = arg_249_1.actors_["1197ui_story"].transform
			local var_252_16 = 0

			if var_252_16 < arg_249_1.time_ and arg_249_1.time_ <= var_252_16 + arg_252_0 then
				arg_249_1.var_.moveOldPos1197ui_story = var_252_15.localPosition
			end

			local var_252_17 = 0.001

			if var_252_16 <= arg_249_1.time_ and arg_249_1.time_ < var_252_16 + var_252_17 then
				local var_252_18 = (arg_249_1.time_ - var_252_16) / var_252_17
				local var_252_19 = Vector3.New(0, -0.545, -6.3)

				var_252_15.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1197ui_story, var_252_19, var_252_18)

				local var_252_20 = manager.ui.mainCamera.transform.position - var_252_15.position

				var_252_15.forward = Vector3.New(var_252_20.x, var_252_20.y, var_252_20.z)

				local var_252_21 = var_252_15.localEulerAngles

				var_252_21.z = 0
				var_252_21.x = 0
				var_252_15.localEulerAngles = var_252_21
			end

			if arg_249_1.time_ >= var_252_16 + var_252_17 and arg_249_1.time_ < var_252_16 + var_252_17 + arg_252_0 then
				var_252_15.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_252_22 = manager.ui.mainCamera.transform.position - var_252_15.position

				var_252_15.forward = Vector3.New(var_252_22.x, var_252_22.y, var_252_22.z)

				local var_252_23 = var_252_15.localEulerAngles

				var_252_23.z = 0
				var_252_23.x = 0
				var_252_15.localEulerAngles = var_252_23
			end

			local var_252_24 = arg_249_1.actors_["1197ui_story"]
			local var_252_25 = 0

			if var_252_25 < arg_249_1.time_ and arg_249_1.time_ <= var_252_25 + arg_252_0 and arg_249_1.var_.characterEffect1197ui_story == nil then
				arg_249_1.var_.characterEffect1197ui_story = var_252_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_26 = 0.200000002980232

			if var_252_25 <= arg_249_1.time_ and arg_249_1.time_ < var_252_25 + var_252_26 then
				local var_252_27 = (arg_249_1.time_ - var_252_25) / var_252_26

				if arg_249_1.var_.characterEffect1197ui_story then
					arg_249_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_25 + var_252_26 and arg_249_1.time_ < var_252_25 + var_252_26 + arg_252_0 and arg_249_1.var_.characterEffect1197ui_story then
				arg_249_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_252_28 = 0
			local var_252_29 = 0.475

			if var_252_28 < arg_249_1.time_ and arg_249_1.time_ <= var_252_28 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_30 = arg_249_1:FormatText(StoryNameCfg[927].name)

				arg_249_1.leftNameTxt_.text = var_252_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_31 = arg_249_1:GetWordFromCfg(412102061)
				local var_252_32 = arg_249_1:FormatText(var_252_31.content)

				arg_249_1.text_.text = var_252_32

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_33 = 19
				local var_252_34 = utf8.len(var_252_32)
				local var_252_35 = var_252_33 <= 0 and var_252_29 or var_252_29 * (var_252_34 / var_252_33)

				if var_252_35 > 0 and var_252_29 < var_252_35 then
					arg_249_1.talkMaxDuration = var_252_35

					if var_252_35 + var_252_28 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_35 + var_252_28
					end
				end

				arg_249_1.text_.text = var_252_32
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102061", "story_v_out_412102.awb") ~= 0 then
					local var_252_36 = manager.audio:GetVoiceLength("story_v_out_412102", "412102061", "story_v_out_412102.awb") / 1000

					if var_252_36 + var_252_28 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_36 + var_252_28
					end

					if var_252_31.prefab_name ~= "" and arg_249_1.actors_[var_252_31.prefab_name] ~= nil then
						local var_252_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_31.prefab_name].transform, "story_v_out_412102", "412102061", "story_v_out_412102.awb")

						arg_249_1:RecordAudio("412102061", var_252_37)
						arg_249_1:RecordAudio("412102061", var_252_37)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_412102", "412102061", "story_v_out_412102.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_412102", "412102061", "story_v_out_412102.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_38 = math.max(var_252_29, arg_249_1.talkMaxDuration)

			if var_252_28 <= arg_249_1.time_ and arg_249_1.time_ < var_252_28 + var_252_38 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_28) / var_252_38

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_28 + var_252_38 and arg_249_1.time_ < var_252_28 + var_252_38 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play412102062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 412102062
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play412102063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1197ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1197ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0, 100, 0)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1197ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0, 100, 0)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = arg_253_1.actors_["1097ui_story"]
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 and arg_253_1.var_.characterEffect1097ui_story == nil then
				arg_253_1.var_.characterEffect1097ui_story = var_256_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_11 = 0.200000002980232

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11

				if arg_253_1.var_.characterEffect1097ui_story then
					local var_256_13 = Mathf.Lerp(0, 0.5, var_256_12)

					arg_253_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1097ui_story.fillRatio = var_256_13
				end
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 and arg_253_1.var_.characterEffect1097ui_story then
				local var_256_14 = 0.5

				arg_253_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1097ui_story.fillRatio = var_256_14
			end

			local var_256_15 = 0
			local var_256_16 = 0.825

			if var_256_15 < arg_253_1.time_ and arg_253_1.time_ <= var_256_15 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_17 = arg_253_1:GetWordFromCfg(412102062)
				local var_256_18 = arg_253_1:FormatText(var_256_17.content)

				arg_253_1.text_.text = var_256_18

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_19 = 33
				local var_256_20 = utf8.len(var_256_18)
				local var_256_21 = var_256_19 <= 0 and var_256_16 or var_256_16 * (var_256_20 / var_256_19)

				if var_256_21 > 0 and var_256_16 < var_256_21 then
					arg_253_1.talkMaxDuration = var_256_21

					if var_256_21 + var_256_15 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_21 + var_256_15
					end
				end

				arg_253_1.text_.text = var_256_18
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_22 = math.max(var_256_16, arg_253_1.talkMaxDuration)

			if var_256_15 <= arg_253_1.time_ and arg_253_1.time_ < var_256_15 + var_256_22 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_15) / var_256_22

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_15 + var_256_22 and arg_253_1.time_ < var_256_15 + var_256_22 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play412102063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 412102063
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play412102064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.45

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_2 = arg_257_1:GetWordFromCfg(412102063)
				local var_260_3 = arg_257_1:FormatText(var_260_2.content)

				arg_257_1.text_.text = var_260_3

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_4 = 18
				local var_260_5 = utf8.len(var_260_3)
				local var_260_6 = var_260_4 <= 0 and var_260_1 or var_260_1 * (var_260_5 / var_260_4)

				if var_260_6 > 0 and var_260_1 < var_260_6 then
					arg_257_1.talkMaxDuration = var_260_6

					if var_260_6 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_6 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_3
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_7 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_7 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_7

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_7 and arg_257_1.time_ < var_260_0 + var_260_7 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play412102064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 412102064
		arg_261_1.duration_ = 7.2

		local var_261_0 = {
			zh = 7.2,
			ja = 6.966
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
				arg_261_0:Play412102065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1097ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1097ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, -0.54, -6.3)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1097ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = arg_261_1.actors_["1097ui_story"]
			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 and arg_261_1.var_.characterEffect1097ui_story == nil then
				arg_261_1.var_.characterEffect1097ui_story = var_264_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_11 = 0.200000002980232

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				local var_264_12 = (arg_261_1.time_ - var_264_10) / var_264_11

				if arg_261_1.var_.characterEffect1097ui_story then
					arg_261_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 and arg_261_1.var_.characterEffect1097ui_story then
				arg_261_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_264_13 = 0

			if var_264_13 < arg_261_1.time_ and arg_261_1.time_ <= var_264_13 + arg_264_0 then
				arg_261_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_264_14 = 0

			if var_264_14 < arg_261_1.time_ and arg_261_1.time_ <= var_264_14 + arg_264_0 then
				arg_261_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_264_15 = 0
			local var_264_16 = 0.8

			if var_264_15 < arg_261_1.time_ and arg_261_1.time_ <= var_264_15 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_17 = arg_261_1:FormatText(StoryNameCfg[928].name)

				arg_261_1.leftNameTxt_.text = var_264_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_18 = arg_261_1:GetWordFromCfg(412102064)
				local var_264_19 = arg_261_1:FormatText(var_264_18.content)

				arg_261_1.text_.text = var_264_19

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_20 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102064", "story_v_out_412102.awb") ~= 0 then
					local var_264_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102064", "story_v_out_412102.awb") / 1000

					if var_264_23 + var_264_15 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_23 + var_264_15
					end

					if var_264_18.prefab_name ~= "" and arg_261_1.actors_[var_264_18.prefab_name] ~= nil then
						local var_264_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_18.prefab_name].transform, "story_v_out_412102", "412102064", "story_v_out_412102.awb")

						arg_261_1:RecordAudio("412102064", var_264_24)
						arg_261_1:RecordAudio("412102064", var_264_24)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_412102", "412102064", "story_v_out_412102.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_412102", "412102064", "story_v_out_412102.awb")
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
	Play412102065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 412102065
		arg_265_1.duration_ = 7.2

		local var_265_0 = {
			zh = 7.2,
			ja = 4.6
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
				arg_265_0:Play412102066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1097ui_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.characterEffect1097ui_story == nil then
				arg_265_1.var_.characterEffect1097ui_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.200000002980232

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect1097ui_story then
					local var_268_4 = Mathf.Lerp(0, 0.5, var_268_3)

					arg_265_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_265_1.var_.characterEffect1097ui_story.fillRatio = var_268_4
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.characterEffect1097ui_story then
				local var_268_5 = 0.5

				arg_265_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_265_1.var_.characterEffect1097ui_story.fillRatio = var_268_5
			end

			local var_268_6 = arg_265_1.actors_["1097ui_story"].transform
			local var_268_7 = 0

			if var_268_7 < arg_265_1.time_ and arg_265_1.time_ <= var_268_7 + arg_268_0 then
				arg_265_1.var_.moveOldPos1097ui_story = var_268_6.localPosition
			end

			local var_268_8 = 0.001

			if var_268_7 <= arg_265_1.time_ and arg_265_1.time_ < var_268_7 + var_268_8 then
				local var_268_9 = (arg_265_1.time_ - var_268_7) / var_268_8
				local var_268_10 = Vector3.New(0, 100, 0)

				var_268_6.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1097ui_story, var_268_10, var_268_9)

				local var_268_11 = manager.ui.mainCamera.transform.position - var_268_6.position

				var_268_6.forward = Vector3.New(var_268_11.x, var_268_11.y, var_268_11.z)

				local var_268_12 = var_268_6.localEulerAngles

				var_268_12.z = 0
				var_268_12.x = 0
				var_268_6.localEulerAngles = var_268_12
			end

			if arg_265_1.time_ >= var_268_7 + var_268_8 and arg_265_1.time_ < var_268_7 + var_268_8 + arg_268_0 then
				var_268_6.localPosition = Vector3.New(0, 100, 0)

				local var_268_13 = manager.ui.mainCamera.transform.position - var_268_6.position

				var_268_6.forward = Vector3.New(var_268_13.x, var_268_13.y, var_268_13.z)

				local var_268_14 = var_268_6.localEulerAngles

				var_268_14.z = 0
				var_268_14.x = 0
				var_268_6.localEulerAngles = var_268_14
			end

			local var_268_15 = arg_265_1.actors_["1197ui_story"].transform
			local var_268_16 = 0

			if var_268_16 < arg_265_1.time_ and arg_265_1.time_ <= var_268_16 + arg_268_0 then
				arg_265_1.var_.moveOldPos1197ui_story = var_268_15.localPosition
			end

			local var_268_17 = 0.001

			if var_268_16 <= arg_265_1.time_ and arg_265_1.time_ < var_268_16 + var_268_17 then
				local var_268_18 = (arg_265_1.time_ - var_268_16) / var_268_17
				local var_268_19 = Vector3.New(0, -0.545, -6.3)

				var_268_15.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1197ui_story, var_268_19, var_268_18)

				local var_268_20 = manager.ui.mainCamera.transform.position - var_268_15.position

				var_268_15.forward = Vector3.New(var_268_20.x, var_268_20.y, var_268_20.z)

				local var_268_21 = var_268_15.localEulerAngles

				var_268_21.z = 0
				var_268_21.x = 0
				var_268_15.localEulerAngles = var_268_21
			end

			if arg_265_1.time_ >= var_268_16 + var_268_17 and arg_265_1.time_ < var_268_16 + var_268_17 + arg_268_0 then
				var_268_15.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_268_22 = manager.ui.mainCamera.transform.position - var_268_15.position

				var_268_15.forward = Vector3.New(var_268_22.x, var_268_22.y, var_268_22.z)

				local var_268_23 = var_268_15.localEulerAngles

				var_268_23.z = 0
				var_268_23.x = 0
				var_268_15.localEulerAngles = var_268_23
			end

			local var_268_24 = arg_265_1.actors_["1197ui_story"]
			local var_268_25 = 0

			if var_268_25 < arg_265_1.time_ and arg_265_1.time_ <= var_268_25 + arg_268_0 and arg_265_1.var_.characterEffect1197ui_story == nil then
				arg_265_1.var_.characterEffect1197ui_story = var_268_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_26 = 0.200000002980232

			if var_268_25 <= arg_265_1.time_ and arg_265_1.time_ < var_268_25 + var_268_26 then
				local var_268_27 = (arg_265_1.time_ - var_268_25) / var_268_26

				if arg_265_1.var_.characterEffect1197ui_story then
					arg_265_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_25 + var_268_26 and arg_265_1.time_ < var_268_25 + var_268_26 + arg_268_0 and arg_265_1.var_.characterEffect1197ui_story then
				arg_265_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_268_28 = 0
			local var_268_29 = 0.725

			if var_268_28 < arg_265_1.time_ and arg_265_1.time_ <= var_268_28 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_30 = arg_265_1:FormatText(StoryNameCfg[927].name)

				arg_265_1.leftNameTxt_.text = var_268_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_31 = arg_265_1:GetWordFromCfg(412102065)
				local var_268_32 = arg_265_1:FormatText(var_268_31.content)

				arg_265_1.text_.text = var_268_32

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_33 = 29
				local var_268_34 = utf8.len(var_268_32)
				local var_268_35 = var_268_33 <= 0 and var_268_29 or var_268_29 * (var_268_34 / var_268_33)

				if var_268_35 > 0 and var_268_29 < var_268_35 then
					arg_265_1.talkMaxDuration = var_268_35

					if var_268_35 + var_268_28 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_35 + var_268_28
					end
				end

				arg_265_1.text_.text = var_268_32
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102065", "story_v_out_412102.awb") ~= 0 then
					local var_268_36 = manager.audio:GetVoiceLength("story_v_out_412102", "412102065", "story_v_out_412102.awb") / 1000

					if var_268_36 + var_268_28 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_36 + var_268_28
					end

					if var_268_31.prefab_name ~= "" and arg_265_1.actors_[var_268_31.prefab_name] ~= nil then
						local var_268_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_31.prefab_name].transform, "story_v_out_412102", "412102065", "story_v_out_412102.awb")

						arg_265_1:RecordAudio("412102065", var_268_37)
						arg_265_1:RecordAudio("412102065", var_268_37)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_412102", "412102065", "story_v_out_412102.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_412102", "412102065", "story_v_out_412102.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_38 = math.max(var_268_29, arg_265_1.talkMaxDuration)

			if var_268_28 <= arg_265_1.time_ and arg_265_1.time_ < var_268_28 + var_268_38 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_28) / var_268_38

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_28 + var_268_38 and arg_265_1.time_ < var_268_28 + var_268_38 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play412102066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 412102066
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play412102067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1197ui_story"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos1197ui_story = var_272_0.localPosition
			end

			local var_272_2 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2
				local var_272_4 = Vector3.New(0, 100, 0)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1197ui_story, var_272_4, var_272_3)

				local var_272_5 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_5.x, var_272_5.y, var_272_5.z)

				local var_272_6 = var_272_0.localEulerAngles

				var_272_6.z = 0
				var_272_6.x = 0
				var_272_0.localEulerAngles = var_272_6
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0, 100, 0)

				local var_272_7 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_7.x, var_272_7.y, var_272_7.z)

				local var_272_8 = var_272_0.localEulerAngles

				var_272_8.z = 0
				var_272_8.x = 0
				var_272_0.localEulerAngles = var_272_8
			end

			local var_272_9 = arg_269_1.actors_["1097ui_story"]
			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 and arg_269_1.var_.characterEffect1097ui_story == nil then
				arg_269_1.var_.characterEffect1097ui_story = var_272_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_11 = 0.200000002980232

			if var_272_10 <= arg_269_1.time_ and arg_269_1.time_ < var_272_10 + var_272_11 then
				local var_272_12 = (arg_269_1.time_ - var_272_10) / var_272_11

				if arg_269_1.var_.characterEffect1097ui_story then
					local var_272_13 = Mathf.Lerp(0, 0.5, var_272_12)

					arg_269_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1097ui_story.fillRatio = var_272_13
				end
			end

			if arg_269_1.time_ >= var_272_10 + var_272_11 and arg_269_1.time_ < var_272_10 + var_272_11 + arg_272_0 and arg_269_1.var_.characterEffect1097ui_story then
				local var_272_14 = 0.5

				arg_269_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1097ui_story.fillRatio = var_272_14
			end

			local var_272_15 = 0
			local var_272_16 = 0.25

			if var_272_15 < arg_269_1.time_ and arg_269_1.time_ <= var_272_15 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_17 = arg_269_1:GetWordFromCfg(412102066)
				local var_272_18 = arg_269_1:FormatText(var_272_17.content)

				arg_269_1.text_.text = var_272_18

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_19 = 10
				local var_272_20 = utf8.len(var_272_18)
				local var_272_21 = var_272_19 <= 0 and var_272_16 or var_272_16 * (var_272_20 / var_272_19)

				if var_272_21 > 0 and var_272_16 < var_272_21 then
					arg_269_1.talkMaxDuration = var_272_21

					if var_272_21 + var_272_15 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_21 + var_272_15
					end
				end

				arg_269_1.text_.text = var_272_18
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_22 = math.max(var_272_16, arg_269_1.talkMaxDuration)

			if var_272_15 <= arg_269_1.time_ and arg_269_1.time_ < var_272_15 + var_272_22 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_15) / var_272_22

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_15 + var_272_22 and arg_269_1.time_ < var_272_15 + var_272_22 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play412102067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 412102067
		arg_273_1.duration_ = 3.2

		local var_273_0 = {
			zh = 1.999999999999,
			ja = 3.2
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
				arg_273_0:Play412102068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1097ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1097ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0, -0.54, -6.3)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1097ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["1097ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect1097ui_story == nil then
				arg_273_1.var_.characterEffect1097ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect1097ui_story then
					arg_273_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect1097ui_story then
				arg_273_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_276_13 = 0

			if var_276_13 < arg_273_1.time_ and arg_273_1.time_ <= var_276_13 + arg_276_0 then
				arg_273_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				arg_273_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_276_15 = 0
			local var_276_16 = 0.075

			if var_276_15 < arg_273_1.time_ and arg_273_1.time_ <= var_276_15 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_17 = arg_273_1:FormatText(StoryNameCfg[928].name)

				arg_273_1.leftNameTxt_.text = var_276_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_18 = arg_273_1:GetWordFromCfg(412102067)
				local var_276_19 = arg_273_1:FormatText(var_276_18.content)

				arg_273_1.text_.text = var_276_19

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_20 = 3
				local var_276_21 = utf8.len(var_276_19)
				local var_276_22 = var_276_20 <= 0 and var_276_16 or var_276_16 * (var_276_21 / var_276_20)

				if var_276_22 > 0 and var_276_16 < var_276_22 then
					arg_273_1.talkMaxDuration = var_276_22

					if var_276_22 + var_276_15 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_22 + var_276_15
					end
				end

				arg_273_1.text_.text = var_276_19
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102067", "story_v_out_412102.awb") ~= 0 then
					local var_276_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102067", "story_v_out_412102.awb") / 1000

					if var_276_23 + var_276_15 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_23 + var_276_15
					end

					if var_276_18.prefab_name ~= "" and arg_273_1.actors_[var_276_18.prefab_name] ~= nil then
						local var_276_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_18.prefab_name].transform, "story_v_out_412102", "412102067", "story_v_out_412102.awb")

						arg_273_1:RecordAudio("412102067", var_276_24)
						arg_273_1:RecordAudio("412102067", var_276_24)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_412102", "412102067", "story_v_out_412102.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_412102", "412102067", "story_v_out_412102.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_25 = math.max(var_276_16, arg_273_1.talkMaxDuration)

			if var_276_15 <= arg_273_1.time_ and arg_273_1.time_ < var_276_15 + var_276_25 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_15) / var_276_25

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_15 + var_276_25 and arg_273_1.time_ < var_276_15 + var_276_25 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play412102068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 412102068
		arg_277_1.duration_ = 1.9

		local var_277_0 = {
			zh = 1.2,
			ja = 1.9
		}
		local var_277_1 = manager.audio:GetLocalizationFlag()

		if var_277_0[var_277_1] ~= nil then
			arg_277_1.duration_ = var_277_0[var_277_1]
		end

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play412102069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1097ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1097ui_story == nil then
				arg_277_1.var_.characterEffect1097ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1097ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1097ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1097ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1097ui_story.fillRatio = var_280_5
			end

			local var_280_6 = arg_277_1.actors_["1197ui_story"].transform
			local var_280_7 = 0

			if var_280_7 < arg_277_1.time_ and arg_277_1.time_ <= var_280_7 + arg_280_0 then
				arg_277_1.var_.moveOldPos1197ui_story = var_280_6.localPosition
			end

			local var_280_8 = 0.001

			if var_280_7 <= arg_277_1.time_ and arg_277_1.time_ < var_280_7 + var_280_8 then
				local var_280_9 = (arg_277_1.time_ - var_280_7) / var_280_8
				local var_280_10 = Vector3.New(0, -0.545, -6.3)

				var_280_6.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1197ui_story, var_280_10, var_280_9)

				local var_280_11 = manager.ui.mainCamera.transform.position - var_280_6.position

				var_280_6.forward = Vector3.New(var_280_11.x, var_280_11.y, var_280_11.z)

				local var_280_12 = var_280_6.localEulerAngles

				var_280_12.z = 0
				var_280_12.x = 0
				var_280_6.localEulerAngles = var_280_12
			end

			if arg_277_1.time_ >= var_280_7 + var_280_8 and arg_277_1.time_ < var_280_7 + var_280_8 + arg_280_0 then
				var_280_6.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_280_13 = manager.ui.mainCamera.transform.position - var_280_6.position

				var_280_6.forward = Vector3.New(var_280_13.x, var_280_13.y, var_280_13.z)

				local var_280_14 = var_280_6.localEulerAngles

				var_280_14.z = 0
				var_280_14.x = 0
				var_280_6.localEulerAngles = var_280_14
			end

			local var_280_15 = arg_277_1.actors_["1197ui_story"]
			local var_280_16 = 0

			if var_280_16 < arg_277_1.time_ and arg_277_1.time_ <= var_280_16 + arg_280_0 and arg_277_1.var_.characterEffect1197ui_story == nil then
				arg_277_1.var_.characterEffect1197ui_story = var_280_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_17 = 0.200000002980232

			if var_280_16 <= arg_277_1.time_ and arg_277_1.time_ < var_280_16 + var_280_17 then
				local var_280_18 = (arg_277_1.time_ - var_280_16) / var_280_17

				if arg_277_1.var_.characterEffect1197ui_story then
					arg_277_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_16 + var_280_17 and arg_277_1.time_ < var_280_16 + var_280_17 + arg_280_0 and arg_277_1.var_.characterEffect1197ui_story then
				arg_277_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_280_19 = arg_277_1.actors_["1097ui_story"].transform
			local var_280_20 = 0

			if var_280_20 < arg_277_1.time_ and arg_277_1.time_ <= var_280_20 + arg_280_0 then
				arg_277_1.var_.moveOldPos1097ui_story = var_280_19.localPosition
			end

			local var_280_21 = 0.001

			if var_280_20 <= arg_277_1.time_ and arg_277_1.time_ < var_280_20 + var_280_21 then
				local var_280_22 = (arg_277_1.time_ - var_280_20) / var_280_21
				local var_280_23 = Vector3.New(0, 100, 0)

				var_280_19.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1097ui_story, var_280_23, var_280_22)

				local var_280_24 = manager.ui.mainCamera.transform.position - var_280_19.position

				var_280_19.forward = Vector3.New(var_280_24.x, var_280_24.y, var_280_24.z)

				local var_280_25 = var_280_19.localEulerAngles

				var_280_25.z = 0
				var_280_25.x = 0
				var_280_19.localEulerAngles = var_280_25
			end

			if arg_277_1.time_ >= var_280_20 + var_280_21 and arg_277_1.time_ < var_280_20 + var_280_21 + arg_280_0 then
				var_280_19.localPosition = Vector3.New(0, 100, 0)

				local var_280_26 = manager.ui.mainCamera.transform.position - var_280_19.position

				var_280_19.forward = Vector3.New(var_280_26.x, var_280_26.y, var_280_26.z)

				local var_280_27 = var_280_19.localEulerAngles

				var_280_27.z = 0
				var_280_27.x = 0
				var_280_19.localEulerAngles = var_280_27
			end

			local var_280_28 = 0
			local var_280_29 = 0.1

			if var_280_28 < arg_277_1.time_ and arg_277_1.time_ <= var_280_28 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_30 = arg_277_1:FormatText(StoryNameCfg[927].name)

				arg_277_1.leftNameTxt_.text = var_280_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_31 = arg_277_1:GetWordFromCfg(412102068)
				local var_280_32 = arg_277_1:FormatText(var_280_31.content)

				arg_277_1.text_.text = var_280_32

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_33 = 4
				local var_280_34 = utf8.len(var_280_32)
				local var_280_35 = var_280_33 <= 0 and var_280_29 or var_280_29 * (var_280_34 / var_280_33)

				if var_280_35 > 0 and var_280_29 < var_280_35 then
					arg_277_1.talkMaxDuration = var_280_35

					if var_280_35 + var_280_28 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_35 + var_280_28
					end
				end

				arg_277_1.text_.text = var_280_32
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102068", "story_v_out_412102.awb") ~= 0 then
					local var_280_36 = manager.audio:GetVoiceLength("story_v_out_412102", "412102068", "story_v_out_412102.awb") / 1000

					if var_280_36 + var_280_28 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_36 + var_280_28
					end

					if var_280_31.prefab_name ~= "" and arg_277_1.actors_[var_280_31.prefab_name] ~= nil then
						local var_280_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_31.prefab_name].transform, "story_v_out_412102", "412102068", "story_v_out_412102.awb")

						arg_277_1:RecordAudio("412102068", var_280_37)
						arg_277_1:RecordAudio("412102068", var_280_37)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_412102", "412102068", "story_v_out_412102.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_412102", "412102068", "story_v_out_412102.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_38 = math.max(var_280_29, arg_277_1.talkMaxDuration)

			if var_280_28 <= arg_277_1.time_ and arg_277_1.time_ < var_280_28 + var_280_38 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_28) / var_280_38

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_28 + var_280_38 and arg_277_1.time_ < var_280_28 + var_280_38 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play412102069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 412102069
		arg_281_1.duration_ = 12.166

		local var_281_0 = {
			zh = 6.8,
			ja = 12.166
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play412102070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1097ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1097ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, -0.54, -6.3)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1097ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["1097ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect1097ui_story == nil then
				arg_281_1.var_.characterEffect1097ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect1097ui_story then
					arg_281_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect1097ui_story then
				arg_281_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_284_13 = 0

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				arg_281_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 then
				arg_281_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_284_15 = arg_281_1.actors_["1197ui_story"].transform
			local var_284_16 = 0

			if var_284_16 < arg_281_1.time_ and arg_281_1.time_ <= var_284_16 + arg_284_0 then
				arg_281_1.var_.moveOldPos1197ui_story = var_284_15.localPosition
			end

			local var_284_17 = 0.001

			if var_284_16 <= arg_281_1.time_ and arg_281_1.time_ < var_284_16 + var_284_17 then
				local var_284_18 = (arg_281_1.time_ - var_284_16) / var_284_17
				local var_284_19 = Vector3.New(0, 100, 0)

				var_284_15.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1197ui_story, var_284_19, var_284_18)

				local var_284_20 = manager.ui.mainCamera.transform.position - var_284_15.position

				var_284_15.forward = Vector3.New(var_284_20.x, var_284_20.y, var_284_20.z)

				local var_284_21 = var_284_15.localEulerAngles

				var_284_21.z = 0
				var_284_21.x = 0
				var_284_15.localEulerAngles = var_284_21
			end

			if arg_281_1.time_ >= var_284_16 + var_284_17 and arg_281_1.time_ < var_284_16 + var_284_17 + arg_284_0 then
				var_284_15.localPosition = Vector3.New(0, 100, 0)

				local var_284_22 = manager.ui.mainCamera.transform.position - var_284_15.position

				var_284_15.forward = Vector3.New(var_284_22.x, var_284_22.y, var_284_22.z)

				local var_284_23 = var_284_15.localEulerAngles

				var_284_23.z = 0
				var_284_23.x = 0
				var_284_15.localEulerAngles = var_284_23
			end

			local var_284_24 = 0
			local var_284_25 = 0.825

			if var_284_24 < arg_281_1.time_ and arg_281_1.time_ <= var_284_24 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_26 = arg_281_1:FormatText(StoryNameCfg[928].name)

				arg_281_1.leftNameTxt_.text = var_284_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_27 = arg_281_1:GetWordFromCfg(412102069)
				local var_284_28 = arg_281_1:FormatText(var_284_27.content)

				arg_281_1.text_.text = var_284_28

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_29 = 33
				local var_284_30 = utf8.len(var_284_28)
				local var_284_31 = var_284_29 <= 0 and var_284_25 or var_284_25 * (var_284_30 / var_284_29)

				if var_284_31 > 0 and var_284_25 < var_284_31 then
					arg_281_1.talkMaxDuration = var_284_31

					if var_284_31 + var_284_24 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_31 + var_284_24
					end
				end

				arg_281_1.text_.text = var_284_28
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102069", "story_v_out_412102.awb") ~= 0 then
					local var_284_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102069", "story_v_out_412102.awb") / 1000

					if var_284_32 + var_284_24 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_32 + var_284_24
					end

					if var_284_27.prefab_name ~= "" and arg_281_1.actors_[var_284_27.prefab_name] ~= nil then
						local var_284_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_27.prefab_name].transform, "story_v_out_412102", "412102069", "story_v_out_412102.awb")

						arg_281_1:RecordAudio("412102069", var_284_33)
						arg_281_1:RecordAudio("412102069", var_284_33)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_412102", "412102069", "story_v_out_412102.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_412102", "412102069", "story_v_out_412102.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_34 = math.max(var_284_25, arg_281_1.talkMaxDuration)

			if var_284_24 <= arg_281_1.time_ and arg_281_1.time_ < var_284_24 + var_284_34 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_24) / var_284_34

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_24 + var_284_34 and arg_281_1.time_ < var_284_24 + var_284_34 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play412102070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 412102070
		arg_285_1.duration_ = 9.033

		local var_285_0 = {
			zh = 9.033,
			ja = 5.033
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play412102071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 1.05

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[928].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(412102070)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102070", "story_v_out_412102.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102070", "story_v_out_412102.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_412102", "412102070", "story_v_out_412102.awb")

						arg_285_1:RecordAudio("412102070", var_288_9)
						arg_285_1:RecordAudio("412102070", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_412102", "412102070", "story_v_out_412102.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_412102", "412102070", "story_v_out_412102.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play412102071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 412102071
		arg_289_1.duration_ = 3.466

		local var_289_0 = {
			zh = 2.4,
			ja = 3.466
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
				arg_289_0:Play412102072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1197ui_story"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos1197ui_story = var_292_0.localPosition
			end

			local var_292_2 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2
				local var_292_4 = Vector3.New(0, -0.545, -6.3)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1197ui_story, var_292_4, var_292_3)

				local var_292_5 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_5.x, var_292_5.y, var_292_5.z)

				local var_292_6 = var_292_0.localEulerAngles

				var_292_6.z = 0
				var_292_6.x = 0
				var_292_0.localEulerAngles = var_292_6
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_292_7 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_7.x, var_292_7.y, var_292_7.z)

				local var_292_8 = var_292_0.localEulerAngles

				var_292_8.z = 0
				var_292_8.x = 0
				var_292_0.localEulerAngles = var_292_8
			end

			local var_292_9 = arg_289_1.actors_["1197ui_story"]
			local var_292_10 = 0

			if var_292_10 < arg_289_1.time_ and arg_289_1.time_ <= var_292_10 + arg_292_0 and arg_289_1.var_.characterEffect1197ui_story == nil then
				arg_289_1.var_.characterEffect1197ui_story = var_292_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_11 = 0.200000002980232

			if var_292_10 <= arg_289_1.time_ and arg_289_1.time_ < var_292_10 + var_292_11 then
				local var_292_12 = (arg_289_1.time_ - var_292_10) / var_292_11

				if arg_289_1.var_.characterEffect1197ui_story then
					arg_289_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_10 + var_292_11 and arg_289_1.time_ < var_292_10 + var_292_11 + arg_292_0 and arg_289_1.var_.characterEffect1197ui_story then
				arg_289_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_292_13 = arg_289_1.actors_["1097ui_story"].transform
			local var_292_14 = 0

			if var_292_14 < arg_289_1.time_ and arg_289_1.time_ <= var_292_14 + arg_292_0 then
				arg_289_1.var_.moveOldPos1097ui_story = var_292_13.localPosition
			end

			local var_292_15 = 0.001

			if var_292_14 <= arg_289_1.time_ and arg_289_1.time_ < var_292_14 + var_292_15 then
				local var_292_16 = (arg_289_1.time_ - var_292_14) / var_292_15
				local var_292_17 = Vector3.New(0, 100, 0)

				var_292_13.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1097ui_story, var_292_17, var_292_16)

				local var_292_18 = manager.ui.mainCamera.transform.position - var_292_13.position

				var_292_13.forward = Vector3.New(var_292_18.x, var_292_18.y, var_292_18.z)

				local var_292_19 = var_292_13.localEulerAngles

				var_292_19.z = 0
				var_292_19.x = 0
				var_292_13.localEulerAngles = var_292_19
			end

			if arg_289_1.time_ >= var_292_14 + var_292_15 and arg_289_1.time_ < var_292_14 + var_292_15 + arg_292_0 then
				var_292_13.localPosition = Vector3.New(0, 100, 0)

				local var_292_20 = manager.ui.mainCamera.transform.position - var_292_13.position

				var_292_13.forward = Vector3.New(var_292_20.x, var_292_20.y, var_292_20.z)

				local var_292_21 = var_292_13.localEulerAngles

				var_292_21.z = 0
				var_292_21.x = 0
				var_292_13.localEulerAngles = var_292_21
			end

			local var_292_22 = 0
			local var_292_23 = 0.25

			if var_292_22 < arg_289_1.time_ and arg_289_1.time_ <= var_292_22 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_24 = arg_289_1:FormatText(StoryNameCfg[927].name)

				arg_289_1.leftNameTxt_.text = var_292_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_25 = arg_289_1:GetWordFromCfg(412102071)
				local var_292_26 = arg_289_1:FormatText(var_292_25.content)

				arg_289_1.text_.text = var_292_26

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_27 = 10
				local var_292_28 = utf8.len(var_292_26)
				local var_292_29 = var_292_27 <= 0 and var_292_23 or var_292_23 * (var_292_28 / var_292_27)

				if var_292_29 > 0 and var_292_23 < var_292_29 then
					arg_289_1.talkMaxDuration = var_292_29

					if var_292_29 + var_292_22 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_29 + var_292_22
					end
				end

				arg_289_1.text_.text = var_292_26
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102071", "story_v_out_412102.awb") ~= 0 then
					local var_292_30 = manager.audio:GetVoiceLength("story_v_out_412102", "412102071", "story_v_out_412102.awb") / 1000

					if var_292_30 + var_292_22 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_30 + var_292_22
					end

					if var_292_25.prefab_name ~= "" and arg_289_1.actors_[var_292_25.prefab_name] ~= nil then
						local var_292_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_25.prefab_name].transform, "story_v_out_412102", "412102071", "story_v_out_412102.awb")

						arg_289_1:RecordAudio("412102071", var_292_31)
						arg_289_1:RecordAudio("412102071", var_292_31)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_412102", "412102071", "story_v_out_412102.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_412102", "412102071", "story_v_out_412102.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_32 = math.max(var_292_23, arg_289_1.talkMaxDuration)

			if var_292_22 <= arg_289_1.time_ and arg_289_1.time_ < var_292_22 + var_292_32 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_22) / var_292_32

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_22 + var_292_32 and arg_289_1.time_ < var_292_22 + var_292_32 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play412102072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 412102072
		arg_293_1.duration_ = 12.266

		local var_293_0 = {
			zh = 4.2,
			ja = 12.266
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
				arg_293_0:Play412102073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1097ui_story"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos1097ui_story = var_296_0.localPosition
			end

			local var_296_2 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2
				local var_296_4 = Vector3.New(0, -0.54, -6.3)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1097ui_story, var_296_4, var_296_3)

				local var_296_5 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_5.x, var_296_5.y, var_296_5.z)

				local var_296_6 = var_296_0.localEulerAngles

				var_296_6.z = 0
				var_296_6.x = 0
				var_296_0.localEulerAngles = var_296_6
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_296_7 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_7.x, var_296_7.y, var_296_7.z)

				local var_296_8 = var_296_0.localEulerAngles

				var_296_8.z = 0
				var_296_8.x = 0
				var_296_0.localEulerAngles = var_296_8
			end

			local var_296_9 = arg_293_1.actors_["1097ui_story"]
			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 and arg_293_1.var_.characterEffect1097ui_story == nil then
				arg_293_1.var_.characterEffect1097ui_story = var_296_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_11 = 0.200000002980232

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_11 then
				local var_296_12 = (arg_293_1.time_ - var_296_10) / var_296_11

				if arg_293_1.var_.characterEffect1097ui_story then
					arg_293_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_10 + var_296_11 and arg_293_1.time_ < var_296_10 + var_296_11 + arg_296_0 and arg_293_1.var_.characterEffect1097ui_story then
				arg_293_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_296_13 = 0

			if var_296_13 < arg_293_1.time_ and arg_293_1.time_ <= var_296_13 + arg_296_0 then
				arg_293_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_2")
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_296_15 = arg_293_1.actors_["1197ui_story"].transform
			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 then
				arg_293_1.var_.moveOldPos1197ui_story = var_296_15.localPosition
			end

			local var_296_17 = 0.001

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17
				local var_296_19 = Vector3.New(0, 100, 0)

				var_296_15.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1197ui_story, var_296_19, var_296_18)

				local var_296_20 = manager.ui.mainCamera.transform.position - var_296_15.position

				var_296_15.forward = Vector3.New(var_296_20.x, var_296_20.y, var_296_20.z)

				local var_296_21 = var_296_15.localEulerAngles

				var_296_21.z = 0
				var_296_21.x = 0
				var_296_15.localEulerAngles = var_296_21
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				var_296_15.localPosition = Vector3.New(0, 100, 0)

				local var_296_22 = manager.ui.mainCamera.transform.position - var_296_15.position

				var_296_15.forward = Vector3.New(var_296_22.x, var_296_22.y, var_296_22.z)

				local var_296_23 = var_296_15.localEulerAngles

				var_296_23.z = 0
				var_296_23.x = 0
				var_296_15.localEulerAngles = var_296_23
			end

			local var_296_24 = 0
			local var_296_25 = 0.45

			if var_296_24 < arg_293_1.time_ and arg_293_1.time_ <= var_296_24 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_26 = arg_293_1:FormatText(StoryNameCfg[928].name)

				arg_293_1.leftNameTxt_.text = var_296_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_27 = arg_293_1:GetWordFromCfg(412102072)
				local var_296_28 = arg_293_1:FormatText(var_296_27.content)

				arg_293_1.text_.text = var_296_28

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_29 = 18
				local var_296_30 = utf8.len(var_296_28)
				local var_296_31 = var_296_29 <= 0 and var_296_25 or var_296_25 * (var_296_30 / var_296_29)

				if var_296_31 > 0 and var_296_25 < var_296_31 then
					arg_293_1.talkMaxDuration = var_296_31

					if var_296_31 + var_296_24 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_31 + var_296_24
					end
				end

				arg_293_1.text_.text = var_296_28
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102072", "story_v_out_412102.awb") ~= 0 then
					local var_296_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102072", "story_v_out_412102.awb") / 1000

					if var_296_32 + var_296_24 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_32 + var_296_24
					end

					if var_296_27.prefab_name ~= "" and arg_293_1.actors_[var_296_27.prefab_name] ~= nil then
						local var_296_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_27.prefab_name].transform, "story_v_out_412102", "412102072", "story_v_out_412102.awb")

						arg_293_1:RecordAudio("412102072", var_296_33)
						arg_293_1:RecordAudio("412102072", var_296_33)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_412102", "412102072", "story_v_out_412102.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_412102", "412102072", "story_v_out_412102.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_34 = math.max(var_296_25, arg_293_1.talkMaxDuration)

			if var_296_24 <= arg_293_1.time_ and arg_293_1.time_ < var_296_24 + var_296_34 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_24) / var_296_34

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_24 + var_296_34 and arg_293_1.time_ < var_296_24 + var_296_34 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play412102073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 412102073
		arg_297_1.duration_ = 7.2

		local var_297_0 = {
			zh = 2.833,
			ja = 7.2
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play412102074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1097ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect1097ui_story == nil then
				arg_297_1.var_.characterEffect1097ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.200000002980232

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1097ui_story then
					local var_300_4 = Mathf.Lerp(0, 0.5, var_300_3)

					arg_297_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1097ui_story.fillRatio = var_300_4
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect1097ui_story then
				local var_300_5 = 0.5

				arg_297_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1097ui_story.fillRatio = var_300_5
			end

			local var_300_6 = arg_297_1.actors_["1197ui_story"].transform
			local var_300_7 = 0

			if var_300_7 < arg_297_1.time_ and arg_297_1.time_ <= var_300_7 + arg_300_0 then
				arg_297_1.var_.moveOldPos1197ui_story = var_300_6.localPosition
			end

			local var_300_8 = 0.001

			if var_300_7 <= arg_297_1.time_ and arg_297_1.time_ < var_300_7 + var_300_8 then
				local var_300_9 = (arg_297_1.time_ - var_300_7) / var_300_8
				local var_300_10 = Vector3.New(0, -0.545, -6.3)

				var_300_6.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1197ui_story, var_300_10, var_300_9)

				local var_300_11 = manager.ui.mainCamera.transform.position - var_300_6.position

				var_300_6.forward = Vector3.New(var_300_11.x, var_300_11.y, var_300_11.z)

				local var_300_12 = var_300_6.localEulerAngles

				var_300_12.z = 0
				var_300_12.x = 0
				var_300_6.localEulerAngles = var_300_12
			end

			if arg_297_1.time_ >= var_300_7 + var_300_8 and arg_297_1.time_ < var_300_7 + var_300_8 + arg_300_0 then
				var_300_6.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_300_13 = manager.ui.mainCamera.transform.position - var_300_6.position

				var_300_6.forward = Vector3.New(var_300_13.x, var_300_13.y, var_300_13.z)

				local var_300_14 = var_300_6.localEulerAngles

				var_300_14.z = 0
				var_300_14.x = 0
				var_300_6.localEulerAngles = var_300_14
			end

			local var_300_15 = arg_297_1.actors_["1197ui_story"]
			local var_300_16 = 0

			if var_300_16 < arg_297_1.time_ and arg_297_1.time_ <= var_300_16 + arg_300_0 and arg_297_1.var_.characterEffect1197ui_story == nil then
				arg_297_1.var_.characterEffect1197ui_story = var_300_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_17 = 0.200000002980232

			if var_300_16 <= arg_297_1.time_ and arg_297_1.time_ < var_300_16 + var_300_17 then
				local var_300_18 = (arg_297_1.time_ - var_300_16) / var_300_17

				if arg_297_1.var_.characterEffect1197ui_story then
					arg_297_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_16 + var_300_17 and arg_297_1.time_ < var_300_16 + var_300_17 + arg_300_0 and arg_297_1.var_.characterEffect1197ui_story then
				arg_297_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_300_19 = arg_297_1.actors_["1097ui_story"].transform
			local var_300_20 = 0

			if var_300_20 < arg_297_1.time_ and arg_297_1.time_ <= var_300_20 + arg_300_0 then
				arg_297_1.var_.moveOldPos1097ui_story = var_300_19.localPosition
			end

			local var_300_21 = 0.001

			if var_300_20 <= arg_297_1.time_ and arg_297_1.time_ < var_300_20 + var_300_21 then
				local var_300_22 = (arg_297_1.time_ - var_300_20) / var_300_21
				local var_300_23 = Vector3.New(0, 100, 0)

				var_300_19.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1097ui_story, var_300_23, var_300_22)

				local var_300_24 = manager.ui.mainCamera.transform.position - var_300_19.position

				var_300_19.forward = Vector3.New(var_300_24.x, var_300_24.y, var_300_24.z)

				local var_300_25 = var_300_19.localEulerAngles

				var_300_25.z = 0
				var_300_25.x = 0
				var_300_19.localEulerAngles = var_300_25
			end

			if arg_297_1.time_ >= var_300_20 + var_300_21 and arg_297_1.time_ < var_300_20 + var_300_21 + arg_300_0 then
				var_300_19.localPosition = Vector3.New(0, 100, 0)

				local var_300_26 = manager.ui.mainCamera.transform.position - var_300_19.position

				var_300_19.forward = Vector3.New(var_300_26.x, var_300_26.y, var_300_26.z)

				local var_300_27 = var_300_19.localEulerAngles

				var_300_27.z = 0
				var_300_27.x = 0
				var_300_19.localEulerAngles = var_300_27
			end

			local var_300_28 = 0
			local var_300_29 = 0.3

			if var_300_28 < arg_297_1.time_ and arg_297_1.time_ <= var_300_28 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_30 = arg_297_1:FormatText(StoryNameCfg[927].name)

				arg_297_1.leftNameTxt_.text = var_300_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_31 = arg_297_1:GetWordFromCfg(412102073)
				local var_300_32 = arg_297_1:FormatText(var_300_31.content)

				arg_297_1.text_.text = var_300_32

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_33 = 12
				local var_300_34 = utf8.len(var_300_32)
				local var_300_35 = var_300_33 <= 0 and var_300_29 or var_300_29 * (var_300_34 / var_300_33)

				if var_300_35 > 0 and var_300_29 < var_300_35 then
					arg_297_1.talkMaxDuration = var_300_35

					if var_300_35 + var_300_28 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_35 + var_300_28
					end
				end

				arg_297_1.text_.text = var_300_32
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102073", "story_v_out_412102.awb") ~= 0 then
					local var_300_36 = manager.audio:GetVoiceLength("story_v_out_412102", "412102073", "story_v_out_412102.awb") / 1000

					if var_300_36 + var_300_28 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_36 + var_300_28
					end

					if var_300_31.prefab_name ~= "" and arg_297_1.actors_[var_300_31.prefab_name] ~= nil then
						local var_300_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_31.prefab_name].transform, "story_v_out_412102", "412102073", "story_v_out_412102.awb")

						arg_297_1:RecordAudio("412102073", var_300_37)
						arg_297_1:RecordAudio("412102073", var_300_37)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_412102", "412102073", "story_v_out_412102.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_412102", "412102073", "story_v_out_412102.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_38 = math.max(var_300_29, arg_297_1.talkMaxDuration)

			if var_300_28 <= arg_297_1.time_ and arg_297_1.time_ < var_300_28 + var_300_38 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_28) / var_300_38

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_28 + var_300_38 and arg_297_1.time_ < var_300_28 + var_300_38 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play412102074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 412102074
		arg_301_1.duration_ = 4.966

		local var_301_0 = {
			zh = 1.999999999999,
			ja = 4.966
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play412102075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1097ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1097ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(0, -0.54, -6.3)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1097ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["1097ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect1097ui_story == nil then
				arg_301_1.var_.characterEffect1097ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.200000002980232

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect1097ui_story then
					arg_301_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect1097ui_story then
				arg_301_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_304_15 = arg_301_1.actors_["1197ui_story"].transform
			local var_304_16 = 0

			if var_304_16 < arg_301_1.time_ and arg_301_1.time_ <= var_304_16 + arg_304_0 then
				arg_301_1.var_.moveOldPos1197ui_story = var_304_15.localPosition
			end

			local var_304_17 = 0.001

			if var_304_16 <= arg_301_1.time_ and arg_301_1.time_ < var_304_16 + var_304_17 then
				local var_304_18 = (arg_301_1.time_ - var_304_16) / var_304_17
				local var_304_19 = Vector3.New(0, 100, 0)

				var_304_15.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1197ui_story, var_304_19, var_304_18)

				local var_304_20 = manager.ui.mainCamera.transform.position - var_304_15.position

				var_304_15.forward = Vector3.New(var_304_20.x, var_304_20.y, var_304_20.z)

				local var_304_21 = var_304_15.localEulerAngles

				var_304_21.z = 0
				var_304_21.x = 0
				var_304_15.localEulerAngles = var_304_21
			end

			if arg_301_1.time_ >= var_304_16 + var_304_17 and arg_301_1.time_ < var_304_16 + var_304_17 + arg_304_0 then
				var_304_15.localPosition = Vector3.New(0, 100, 0)

				local var_304_22 = manager.ui.mainCamera.transform.position - var_304_15.position

				var_304_15.forward = Vector3.New(var_304_22.x, var_304_22.y, var_304_22.z)

				local var_304_23 = var_304_15.localEulerAngles

				var_304_23.z = 0
				var_304_23.x = 0
				var_304_15.localEulerAngles = var_304_23
			end

			local var_304_24 = 0
			local var_304_25 = 0.1

			if var_304_24 < arg_301_1.time_ and arg_301_1.time_ <= var_304_24 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_26 = arg_301_1:FormatText(StoryNameCfg[928].name)

				arg_301_1.leftNameTxt_.text = var_304_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_27 = arg_301_1:GetWordFromCfg(412102074)
				local var_304_28 = arg_301_1:FormatText(var_304_27.content)

				arg_301_1.text_.text = var_304_28

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_29 = 4
				local var_304_30 = utf8.len(var_304_28)
				local var_304_31 = var_304_29 <= 0 and var_304_25 or var_304_25 * (var_304_30 / var_304_29)

				if var_304_31 > 0 and var_304_25 < var_304_31 then
					arg_301_1.talkMaxDuration = var_304_31

					if var_304_31 + var_304_24 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_31 + var_304_24
					end
				end

				arg_301_1.text_.text = var_304_28
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102074", "story_v_out_412102.awb") ~= 0 then
					local var_304_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102074", "story_v_out_412102.awb") / 1000

					if var_304_32 + var_304_24 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_32 + var_304_24
					end

					if var_304_27.prefab_name ~= "" and arg_301_1.actors_[var_304_27.prefab_name] ~= nil then
						local var_304_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_27.prefab_name].transform, "story_v_out_412102", "412102074", "story_v_out_412102.awb")

						arg_301_1:RecordAudio("412102074", var_304_33)
						arg_301_1:RecordAudio("412102074", var_304_33)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_412102", "412102074", "story_v_out_412102.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_412102", "412102074", "story_v_out_412102.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_34 = math.max(var_304_25, arg_301_1.talkMaxDuration)

			if var_304_24 <= arg_301_1.time_ and arg_301_1.time_ < var_304_24 + var_304_34 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_24) / var_304_34

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_24 + var_304_34 and arg_301_1.time_ < var_304_24 + var_304_34 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play412102075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 412102075
		arg_305_1.duration_ = 3.433

		local var_305_0 = {
			zh = 3.2,
			ja = 3.433
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
				arg_305_0:Play412102076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1097ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect1097ui_story == nil then
				arg_305_1.var_.characterEffect1097ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.200000002980232

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect1097ui_story then
					local var_308_4 = Mathf.Lerp(0, 0.5, var_308_3)

					arg_305_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_305_1.var_.characterEffect1097ui_story.fillRatio = var_308_4
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect1097ui_story then
				local var_308_5 = 0.5

				arg_305_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_305_1.var_.characterEffect1097ui_story.fillRatio = var_308_5
			end

			local var_308_6 = arg_305_1.actors_["1197ui_story"].transform
			local var_308_7 = 0

			if var_308_7 < arg_305_1.time_ and arg_305_1.time_ <= var_308_7 + arg_308_0 then
				arg_305_1.var_.moveOldPos1197ui_story = var_308_6.localPosition
			end

			local var_308_8 = 0.001

			if var_308_7 <= arg_305_1.time_ and arg_305_1.time_ < var_308_7 + var_308_8 then
				local var_308_9 = (arg_305_1.time_ - var_308_7) / var_308_8
				local var_308_10 = Vector3.New(0, -0.545, -6.3)

				var_308_6.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1197ui_story, var_308_10, var_308_9)

				local var_308_11 = manager.ui.mainCamera.transform.position - var_308_6.position

				var_308_6.forward = Vector3.New(var_308_11.x, var_308_11.y, var_308_11.z)

				local var_308_12 = var_308_6.localEulerAngles

				var_308_12.z = 0
				var_308_12.x = 0
				var_308_6.localEulerAngles = var_308_12
			end

			if arg_305_1.time_ >= var_308_7 + var_308_8 and arg_305_1.time_ < var_308_7 + var_308_8 + arg_308_0 then
				var_308_6.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_308_13 = manager.ui.mainCamera.transform.position - var_308_6.position

				var_308_6.forward = Vector3.New(var_308_13.x, var_308_13.y, var_308_13.z)

				local var_308_14 = var_308_6.localEulerAngles

				var_308_14.z = 0
				var_308_14.x = 0
				var_308_6.localEulerAngles = var_308_14
			end

			local var_308_15 = arg_305_1.actors_["1197ui_story"]
			local var_308_16 = 0

			if var_308_16 < arg_305_1.time_ and arg_305_1.time_ <= var_308_16 + arg_308_0 and arg_305_1.var_.characterEffect1197ui_story == nil then
				arg_305_1.var_.characterEffect1197ui_story = var_308_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_17 = 0.200000002980232

			if var_308_16 <= arg_305_1.time_ and arg_305_1.time_ < var_308_16 + var_308_17 then
				local var_308_18 = (arg_305_1.time_ - var_308_16) / var_308_17

				if arg_305_1.var_.characterEffect1197ui_story then
					arg_305_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_16 + var_308_17 and arg_305_1.time_ < var_308_16 + var_308_17 + arg_308_0 and arg_305_1.var_.characterEffect1197ui_story then
				arg_305_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_308_19 = arg_305_1.actors_["1097ui_story"].transform
			local var_308_20 = 0

			if var_308_20 < arg_305_1.time_ and arg_305_1.time_ <= var_308_20 + arg_308_0 then
				arg_305_1.var_.moveOldPos1097ui_story = var_308_19.localPosition
			end

			local var_308_21 = 0.001

			if var_308_20 <= arg_305_1.time_ and arg_305_1.time_ < var_308_20 + var_308_21 then
				local var_308_22 = (arg_305_1.time_ - var_308_20) / var_308_21
				local var_308_23 = Vector3.New(0, 100, 0)

				var_308_19.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1097ui_story, var_308_23, var_308_22)

				local var_308_24 = manager.ui.mainCamera.transform.position - var_308_19.position

				var_308_19.forward = Vector3.New(var_308_24.x, var_308_24.y, var_308_24.z)

				local var_308_25 = var_308_19.localEulerAngles

				var_308_25.z = 0
				var_308_25.x = 0
				var_308_19.localEulerAngles = var_308_25
			end

			if arg_305_1.time_ >= var_308_20 + var_308_21 and arg_305_1.time_ < var_308_20 + var_308_21 + arg_308_0 then
				var_308_19.localPosition = Vector3.New(0, 100, 0)

				local var_308_26 = manager.ui.mainCamera.transform.position - var_308_19.position

				var_308_19.forward = Vector3.New(var_308_26.x, var_308_26.y, var_308_26.z)

				local var_308_27 = var_308_19.localEulerAngles

				var_308_27.z = 0
				var_308_27.x = 0
				var_308_19.localEulerAngles = var_308_27
			end

			local var_308_28 = 0
			local var_308_29 = 0.375

			if var_308_28 < arg_305_1.time_ and arg_305_1.time_ <= var_308_28 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_30 = arg_305_1:FormatText(StoryNameCfg[927].name)

				arg_305_1.leftNameTxt_.text = var_308_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_31 = arg_305_1:GetWordFromCfg(412102075)
				local var_308_32 = arg_305_1:FormatText(var_308_31.content)

				arg_305_1.text_.text = var_308_32

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_33 = 15
				local var_308_34 = utf8.len(var_308_32)
				local var_308_35 = var_308_33 <= 0 and var_308_29 or var_308_29 * (var_308_34 / var_308_33)

				if var_308_35 > 0 and var_308_29 < var_308_35 then
					arg_305_1.talkMaxDuration = var_308_35

					if var_308_35 + var_308_28 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_35 + var_308_28
					end
				end

				arg_305_1.text_.text = var_308_32
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102075", "story_v_out_412102.awb") ~= 0 then
					local var_308_36 = manager.audio:GetVoiceLength("story_v_out_412102", "412102075", "story_v_out_412102.awb") / 1000

					if var_308_36 + var_308_28 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_36 + var_308_28
					end

					if var_308_31.prefab_name ~= "" and arg_305_1.actors_[var_308_31.prefab_name] ~= nil then
						local var_308_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_31.prefab_name].transform, "story_v_out_412102", "412102075", "story_v_out_412102.awb")

						arg_305_1:RecordAudio("412102075", var_308_37)
						arg_305_1:RecordAudio("412102075", var_308_37)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_412102", "412102075", "story_v_out_412102.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_412102", "412102075", "story_v_out_412102.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_38 = math.max(var_308_29, arg_305_1.talkMaxDuration)

			if var_308_28 <= arg_305_1.time_ and arg_305_1.time_ < var_308_28 + var_308_38 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_28) / var_308_38

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_28 + var_308_38 and arg_305_1.time_ < var_308_28 + var_308_38 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play412102076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 412102076
		arg_309_1.duration_ = 5.6

		local var_309_0 = {
			zh = 5.1,
			ja = 5.6
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
				arg_309_0:Play412102077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1097ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1097ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, -0.54, -6.3)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1097ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1097ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1097ui_story == nil then
				arg_309_1.var_.characterEffect1097ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1097ui_story then
					arg_309_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1097ui_story then
				arg_309_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_312_15 = arg_309_1.actors_["1197ui_story"].transform
			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 then
				arg_309_1.var_.moveOldPos1197ui_story = var_312_15.localPosition
			end

			local var_312_17 = 0.001

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17
				local var_312_19 = Vector3.New(0, 100, 0)

				var_312_15.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1197ui_story, var_312_19, var_312_18)

				local var_312_20 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_20.x, var_312_20.y, var_312_20.z)

				local var_312_21 = var_312_15.localEulerAngles

				var_312_21.z = 0
				var_312_21.x = 0
				var_312_15.localEulerAngles = var_312_21
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 then
				var_312_15.localPosition = Vector3.New(0, 100, 0)

				local var_312_22 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_22.x, var_312_22.y, var_312_22.z)

				local var_312_23 = var_312_15.localEulerAngles

				var_312_23.z = 0
				var_312_23.x = 0
				var_312_15.localEulerAngles = var_312_23
			end

			local var_312_24 = 0
			local var_312_25 = 0.65

			if var_312_24 < arg_309_1.time_ and arg_309_1.time_ <= var_312_24 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_26 = arg_309_1:FormatText(StoryNameCfg[928].name)

				arg_309_1.leftNameTxt_.text = var_312_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_27 = arg_309_1:GetWordFromCfg(412102076)
				local var_312_28 = arg_309_1:FormatText(var_312_27.content)

				arg_309_1.text_.text = var_312_28

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_29 = 26
				local var_312_30 = utf8.len(var_312_28)
				local var_312_31 = var_312_29 <= 0 and var_312_25 or var_312_25 * (var_312_30 / var_312_29)

				if var_312_31 > 0 and var_312_25 < var_312_31 then
					arg_309_1.talkMaxDuration = var_312_31

					if var_312_31 + var_312_24 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_31 + var_312_24
					end
				end

				arg_309_1.text_.text = var_312_28
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102076", "story_v_out_412102.awb") ~= 0 then
					local var_312_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102076", "story_v_out_412102.awb") / 1000

					if var_312_32 + var_312_24 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_32 + var_312_24
					end

					if var_312_27.prefab_name ~= "" and arg_309_1.actors_[var_312_27.prefab_name] ~= nil then
						local var_312_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_27.prefab_name].transform, "story_v_out_412102", "412102076", "story_v_out_412102.awb")

						arg_309_1:RecordAudio("412102076", var_312_33)
						arg_309_1:RecordAudio("412102076", var_312_33)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_412102", "412102076", "story_v_out_412102.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_412102", "412102076", "story_v_out_412102.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_34 = math.max(var_312_25, arg_309_1.talkMaxDuration)

			if var_312_24 <= arg_309_1.time_ and arg_309_1.time_ < var_312_24 + var_312_34 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_24) / var_312_34

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_24 + var_312_34 and arg_309_1.time_ < var_312_24 + var_312_34 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play412102077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 412102077
		arg_313_1.duration_ = 6.1

		local var_313_0 = {
			zh = 4.433,
			ja = 6.1
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play412102078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.5

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[928].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(412102077)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 20
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102077", "story_v_out_412102.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102077", "story_v_out_412102.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_412102", "412102077", "story_v_out_412102.awb")

						arg_313_1:RecordAudio("412102077", var_316_9)
						arg_313_1:RecordAudio("412102077", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_412102", "412102077", "story_v_out_412102.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_412102", "412102077", "story_v_out_412102.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play412102078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 412102078
		arg_317_1.duration_ = 7.433

		local var_317_0 = {
			zh = 6.6,
			ja = 7.433
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
				arg_317_0:Play412102079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1197ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos1197ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(0, -0.545, -6.3)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1197ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = arg_317_1.actors_["1197ui_story"]
			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 and arg_317_1.var_.characterEffect1197ui_story == nil then
				arg_317_1.var_.characterEffect1197ui_story = var_320_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_11 = 0.200000002980232

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_11 then
				local var_320_12 = (arg_317_1.time_ - var_320_10) / var_320_11

				if arg_317_1.var_.characterEffect1197ui_story then
					arg_317_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_10 + var_320_11 and arg_317_1.time_ < var_320_10 + var_320_11 + arg_320_0 and arg_317_1.var_.characterEffect1197ui_story then
				arg_317_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_320_13 = arg_317_1.actors_["1097ui_story"].transform
			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1.var_.moveOldPos1097ui_story = var_320_13.localPosition
			end

			local var_320_15 = 0.001

			if var_320_14 <= arg_317_1.time_ and arg_317_1.time_ < var_320_14 + var_320_15 then
				local var_320_16 = (arg_317_1.time_ - var_320_14) / var_320_15
				local var_320_17 = Vector3.New(0, 100, 0)

				var_320_13.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1097ui_story, var_320_17, var_320_16)

				local var_320_18 = manager.ui.mainCamera.transform.position - var_320_13.position

				var_320_13.forward = Vector3.New(var_320_18.x, var_320_18.y, var_320_18.z)

				local var_320_19 = var_320_13.localEulerAngles

				var_320_19.z = 0
				var_320_19.x = 0
				var_320_13.localEulerAngles = var_320_19
			end

			if arg_317_1.time_ >= var_320_14 + var_320_15 and arg_317_1.time_ < var_320_14 + var_320_15 + arg_320_0 then
				var_320_13.localPosition = Vector3.New(0, 100, 0)

				local var_320_20 = manager.ui.mainCamera.transform.position - var_320_13.position

				var_320_13.forward = Vector3.New(var_320_20.x, var_320_20.y, var_320_20.z)

				local var_320_21 = var_320_13.localEulerAngles

				var_320_21.z = 0
				var_320_21.x = 0
				var_320_13.localEulerAngles = var_320_21
			end

			local var_320_22 = 0
			local var_320_23 = 0.75

			if var_320_22 < arg_317_1.time_ and arg_317_1.time_ <= var_320_22 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_24 = arg_317_1:FormatText(StoryNameCfg[927].name)

				arg_317_1.leftNameTxt_.text = var_320_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_25 = arg_317_1:GetWordFromCfg(412102078)
				local var_320_26 = arg_317_1:FormatText(var_320_25.content)

				arg_317_1.text_.text = var_320_26

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_27 = 30
				local var_320_28 = utf8.len(var_320_26)
				local var_320_29 = var_320_27 <= 0 and var_320_23 or var_320_23 * (var_320_28 / var_320_27)

				if var_320_29 > 0 and var_320_23 < var_320_29 then
					arg_317_1.talkMaxDuration = var_320_29

					if var_320_29 + var_320_22 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_29 + var_320_22
					end
				end

				arg_317_1.text_.text = var_320_26
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102078", "story_v_out_412102.awb") ~= 0 then
					local var_320_30 = manager.audio:GetVoiceLength("story_v_out_412102", "412102078", "story_v_out_412102.awb") / 1000

					if var_320_30 + var_320_22 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_30 + var_320_22
					end

					if var_320_25.prefab_name ~= "" and arg_317_1.actors_[var_320_25.prefab_name] ~= nil then
						local var_320_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_25.prefab_name].transform, "story_v_out_412102", "412102078", "story_v_out_412102.awb")

						arg_317_1:RecordAudio("412102078", var_320_31)
						arg_317_1:RecordAudio("412102078", var_320_31)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_412102", "412102078", "story_v_out_412102.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_412102", "412102078", "story_v_out_412102.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_32 = math.max(var_320_23, arg_317_1.talkMaxDuration)

			if var_320_22 <= arg_317_1.time_ and arg_317_1.time_ < var_320_22 + var_320_32 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_22) / var_320_32

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_22 + var_320_32 and arg_317_1.time_ < var_320_22 + var_320_32 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play412102079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 412102079
		arg_321_1.duration_ = 1.999999999999

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play412102080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1097ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1097ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(0, -0.54, -6.3)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1097ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["1097ui_story"]
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 and arg_321_1.var_.characterEffect1097ui_story == nil then
				arg_321_1.var_.characterEffect1097ui_story = var_324_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_11 = 0.200000002980232

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11

				if arg_321_1.var_.characterEffect1097ui_story then
					arg_321_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 and arg_321_1.var_.characterEffect1097ui_story then
				arg_321_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_324_13 = 0

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_324_15 = arg_321_1.actors_["1197ui_story"].transform
			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1.var_.moveOldPos1197ui_story = var_324_15.localPosition
			end

			local var_324_17 = 0.001

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_17 then
				local var_324_18 = (arg_321_1.time_ - var_324_16) / var_324_17
				local var_324_19 = Vector3.New(0, 100, 0)

				var_324_15.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1197ui_story, var_324_19, var_324_18)

				local var_324_20 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_20.x, var_324_20.y, var_324_20.z)

				local var_324_21 = var_324_15.localEulerAngles

				var_324_21.z = 0
				var_324_21.x = 0
				var_324_15.localEulerAngles = var_324_21
			end

			if arg_321_1.time_ >= var_324_16 + var_324_17 and arg_321_1.time_ < var_324_16 + var_324_17 + arg_324_0 then
				var_324_15.localPosition = Vector3.New(0, 100, 0)

				local var_324_22 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_22.x, var_324_22.y, var_324_22.z)

				local var_324_23 = var_324_15.localEulerAngles

				var_324_23.z = 0
				var_324_23.x = 0
				var_324_15.localEulerAngles = var_324_23
			end

			local var_324_24 = 0
			local var_324_25 = 0.075

			if var_324_24 < arg_321_1.time_ and arg_321_1.time_ <= var_324_24 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_26 = arg_321_1:FormatText(StoryNameCfg[928].name)

				arg_321_1.leftNameTxt_.text = var_324_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_27 = arg_321_1:GetWordFromCfg(412102079)
				local var_324_28 = arg_321_1:FormatText(var_324_27.content)

				arg_321_1.text_.text = var_324_28

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_29 = 3
				local var_324_30 = utf8.len(var_324_28)
				local var_324_31 = var_324_29 <= 0 and var_324_25 or var_324_25 * (var_324_30 / var_324_29)

				if var_324_31 > 0 and var_324_25 < var_324_31 then
					arg_321_1.talkMaxDuration = var_324_31

					if var_324_31 + var_324_24 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_31 + var_324_24
					end
				end

				arg_321_1.text_.text = var_324_28
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102079", "story_v_out_412102.awb") ~= 0 then
					local var_324_32 = manager.audio:GetVoiceLength("story_v_out_412102", "412102079", "story_v_out_412102.awb") / 1000

					if var_324_32 + var_324_24 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_32 + var_324_24
					end

					if var_324_27.prefab_name ~= "" and arg_321_1.actors_[var_324_27.prefab_name] ~= nil then
						local var_324_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_27.prefab_name].transform, "story_v_out_412102", "412102079", "story_v_out_412102.awb")

						arg_321_1:RecordAudio("412102079", var_324_33)
						arg_321_1:RecordAudio("412102079", var_324_33)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_412102", "412102079", "story_v_out_412102.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_412102", "412102079", "story_v_out_412102.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_34 = math.max(var_324_25, arg_321_1.talkMaxDuration)

			if var_324_24 <= arg_321_1.time_ and arg_321_1.time_ < var_324_24 + var_324_34 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_24) / var_324_34

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_24 + var_324_34 and arg_321_1.time_ < var_324_24 + var_324_34 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play412102080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 412102080
		arg_325_1.duration_ = 5.13333333333333

		local var_325_0 = {
			zh = 5.13333333333333,
			ja = 4.73333333333333
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
				arg_325_0:Play412102081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = "STwhite"

			if arg_325_1.bgs_[var_328_0] == nil then
				local var_328_1 = Object.Instantiate(arg_325_1.paintGo_)

				var_328_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_328_0)
				var_328_1.name = var_328_0
				var_328_1.transform.parent = arg_325_1.stage_.transform
				var_328_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_325_1.bgs_[var_328_0] = var_328_1
			end

			local var_328_2 = 0.4

			if var_328_2 < arg_325_1.time_ and arg_325_1.time_ <= var_328_2 + arg_328_0 then
				local var_328_3 = manager.ui.mainCamera.transform.localPosition
				local var_328_4 = Vector3.New(0, 0, 10) + Vector3.New(var_328_3.x, var_328_3.y, 0)
				local var_328_5 = arg_325_1.bgs_.STwhite

				var_328_5.transform.localPosition = var_328_4
				var_328_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_328_6 = var_328_5:GetComponent("SpriteRenderer")

				if var_328_6 and var_328_6.sprite then
					local var_328_7 = (var_328_5.transform.localPosition - var_328_3).z
					local var_328_8 = manager.ui.mainCameraCom_
					local var_328_9 = 2 * var_328_7 * Mathf.Tan(var_328_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_328_10 = var_328_9 * var_328_8.aspect
					local var_328_11 = var_328_6.sprite.bounds.size.x
					local var_328_12 = var_328_6.sprite.bounds.size.y
					local var_328_13 = var_328_10 / var_328_11
					local var_328_14 = var_328_9 / var_328_12
					local var_328_15 = var_328_14 < var_328_13 and var_328_13 or var_328_14

					var_328_5.transform.localScale = Vector3.New(var_328_15, var_328_15, 0)
				end

				for iter_328_0, iter_328_1 in pairs(arg_325_1.bgs_) do
					if iter_328_0 ~= "STwhite" then
						iter_328_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_328_16 = "10076ui_story"

			if arg_325_1.actors_[var_328_16] == nil then
				local var_328_17 = Object.Instantiate(Asset.Load("Char/" .. var_328_16), arg_325_1.stage_.transform)

				var_328_17.name = var_328_16
				var_328_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_325_1.actors_[var_328_16] = var_328_17

				local var_328_18 = var_328_17:GetComponentInChildren(typeof(CharacterEffect))

				var_328_18.enabled = true

				local var_328_19 = GameObjectTools.GetOrAddComponent(var_328_17, typeof(DynamicBoneHelper))

				if var_328_19 then
					var_328_19:EnableDynamicBone(false)
				end

				arg_325_1:ShowWeapon(var_328_18.transform, false)

				arg_325_1.var_[var_328_16 .. "Animator"] = var_328_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_325_1.var_[var_328_16 .. "Animator"].applyRootMotion = true
				arg_325_1.var_[var_328_16 .. "LipSync"] = var_328_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_328_20 = arg_325_1.actors_["10076ui_story"].transform
			local var_328_21 = 0.2

			if var_328_21 < arg_325_1.time_ and arg_325_1.time_ <= var_328_21 + arg_328_0 then
				arg_325_1.var_.moveOldPos10076ui_story = var_328_20.localPosition
			end

			local var_328_22 = 0.001

			if var_328_21 <= arg_325_1.time_ and arg_325_1.time_ < var_328_21 + var_328_22 then
				local var_328_23 = (arg_325_1.time_ - var_328_21) / var_328_22
				local var_328_24 = Vector3.New(0, -0.35, -4)

				var_328_20.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos10076ui_story, var_328_24, var_328_23)

				local var_328_25 = manager.ui.mainCamera.transform.position - var_328_20.position

				var_328_20.forward = Vector3.New(var_328_25.x, var_328_25.y, var_328_25.z)

				local var_328_26 = var_328_20.localEulerAngles

				var_328_26.z = 0
				var_328_26.x = 0
				var_328_20.localEulerAngles = var_328_26
			end

			if arg_325_1.time_ >= var_328_21 + var_328_22 and arg_325_1.time_ < var_328_21 + var_328_22 + arg_328_0 then
				var_328_20.localPosition = Vector3.New(0, -0.35, -4)

				local var_328_27 = manager.ui.mainCamera.transform.position - var_328_20.position

				var_328_20.forward = Vector3.New(var_328_27.x, var_328_27.y, var_328_27.z)

				local var_328_28 = var_328_20.localEulerAngles

				var_328_28.z = 0
				var_328_28.x = 0
				var_328_20.localEulerAngles = var_328_28
			end

			local var_328_29 = arg_325_1.actors_["10076ui_story"]
			local var_328_30 = 0.2

			if var_328_30 < arg_325_1.time_ and arg_325_1.time_ <= var_328_30 + arg_328_0 and arg_325_1.var_.characterEffect10076ui_story == nil then
				arg_325_1.var_.characterEffect10076ui_story = var_328_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_31 = 0.034000001847744

			if var_328_30 <= arg_325_1.time_ and arg_325_1.time_ < var_328_30 + var_328_31 then
				local var_328_32 = (arg_325_1.time_ - var_328_30) / var_328_31

				if arg_325_1.var_.characterEffect10076ui_story then
					arg_325_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_30 + var_328_31 and arg_325_1.time_ < var_328_30 + var_328_31 + arg_328_0 and arg_325_1.var_.characterEffect10076ui_story then
				arg_325_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_328_33 = 0.4

			if var_328_33 < arg_325_1.time_ and arg_325_1.time_ <= var_328_33 + arg_328_0 then
				arg_325_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action1_1")
			end

			local var_328_34 = 0.4

			if var_328_34 < arg_325_1.time_ and arg_325_1.time_ <= var_328_34 + arg_328_0 then
				arg_325_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_328_35 = arg_325_1.actors_["1097ui_story"].transform
			local var_328_36 = 0.4

			if var_328_36 < arg_325_1.time_ and arg_325_1.time_ <= var_328_36 + arg_328_0 then
				arg_325_1.var_.moveOldPos1097ui_story = var_328_35.localPosition
			end

			local var_328_37 = 0.001

			if var_328_36 <= arg_325_1.time_ and arg_325_1.time_ < var_328_36 + var_328_37 then
				local var_328_38 = (arg_325_1.time_ - var_328_36) / var_328_37
				local var_328_39 = Vector3.New(0, 100, 0)

				var_328_35.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1097ui_story, var_328_39, var_328_38)

				local var_328_40 = manager.ui.mainCamera.transform.position - var_328_35.position

				var_328_35.forward = Vector3.New(var_328_40.x, var_328_40.y, var_328_40.z)

				local var_328_41 = var_328_35.localEulerAngles

				var_328_41.z = 0
				var_328_41.x = 0
				var_328_35.localEulerAngles = var_328_41
			end

			if arg_325_1.time_ >= var_328_36 + var_328_37 and arg_325_1.time_ < var_328_36 + var_328_37 + arg_328_0 then
				var_328_35.localPosition = Vector3.New(0, 100, 0)

				local var_328_42 = manager.ui.mainCamera.transform.position - var_328_35.position

				var_328_35.forward = Vector3.New(var_328_42.x, var_328_42.y, var_328_42.z)

				local var_328_43 = var_328_35.localEulerAngles

				var_328_43.z = 0
				var_328_43.x = 0
				var_328_35.localEulerAngles = var_328_43
			end

			local var_328_44 = arg_325_1.actors_["1097ui_story"]
			local var_328_45 = 0.4

			if var_328_45 < arg_325_1.time_ and arg_325_1.time_ <= var_328_45 + arg_328_0 and arg_325_1.var_.characterEffect1097ui_story == nil then
				arg_325_1.var_.characterEffect1097ui_story = var_328_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_46 = 0.200000002980232

			if var_328_45 <= arg_325_1.time_ and arg_325_1.time_ < var_328_45 + var_328_46 then
				local var_328_47 = (arg_325_1.time_ - var_328_45) / var_328_46

				if arg_325_1.var_.characterEffect1097ui_story then
					local var_328_48 = Mathf.Lerp(0, 0.5, var_328_47)

					arg_325_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1097ui_story.fillRatio = var_328_48
				end
			end

			if arg_325_1.time_ >= var_328_45 + var_328_46 and arg_325_1.time_ < var_328_45 + var_328_46 + arg_328_0 and arg_325_1.var_.characterEffect1097ui_story then
				local var_328_49 = 0.5

				arg_325_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1097ui_story.fillRatio = var_328_49
			end

			local var_328_50 = 0.200000002980232

			if var_328_50 < arg_325_1.time_ and arg_325_1.time_ <= var_328_50 + arg_328_0 then
				arg_325_1.mask_.enabled = true
				arg_325_1.mask_.raycastTarget = true

				arg_325_1:SetGaussion(false)
			end

			local var_328_51 = 1.2

			if var_328_50 <= arg_325_1.time_ and arg_325_1.time_ < var_328_50 + var_328_51 then
				local var_328_52 = (arg_325_1.time_ - var_328_50) / var_328_51
				local var_328_53 = Color.New(1, 1, 1)

				var_328_53.a = Mathf.Lerp(1, 0, var_328_52)
				arg_325_1.mask_.color = var_328_53
			end

			if arg_325_1.time_ >= var_328_50 + var_328_51 and arg_325_1.time_ < var_328_50 + var_328_51 + arg_328_0 then
				local var_328_54 = Color.New(1, 1, 1)
				local var_328_55 = 0

				arg_325_1.mask_.enabled = false
				var_328_54.a = var_328_55
				arg_325_1.mask_.color = var_328_54
			end

			local var_328_56 = 0

			if var_328_56 < arg_325_1.time_ and arg_325_1.time_ <= var_328_56 + arg_328_0 then
				arg_325_1.allBtn_.enabled = false
			end

			local var_328_57 = 0.200000002980232

			if arg_325_1.time_ >= var_328_56 + var_328_57 and arg_325_1.time_ < var_328_56 + var_328_57 + arg_328_0 then
				arg_325_1.allBtn_.enabled = true
			end

			local var_328_58 = 0.733333333333333
			local var_328_59 = 0.4

			if var_328_58 < arg_325_1.time_ and arg_325_1.time_ <= var_328_58 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_60 = arg_325_1:FormatText(StoryNameCfg[917].name)

				arg_325_1.leftNameTxt_.text = var_328_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_61 = arg_325_1:GetWordFromCfg(412102080)
				local var_328_62 = arg_325_1:FormatText(var_328_61.content)

				arg_325_1.text_.text = var_328_62

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_63 = 16
				local var_328_64 = utf8.len(var_328_62)
				local var_328_65 = var_328_63 <= 0 and var_328_59 or var_328_59 * (var_328_64 / var_328_63)

				if var_328_65 > 0 and var_328_59 < var_328_65 then
					arg_325_1.talkMaxDuration = var_328_65

					if var_328_65 + var_328_58 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_65 + var_328_58
					end
				end

				arg_325_1.text_.text = var_328_62
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102080", "story_v_out_412102.awb") ~= 0 then
					local var_328_66 = manager.audio:GetVoiceLength("story_v_out_412102", "412102080", "story_v_out_412102.awb") / 1000

					if var_328_66 + var_328_58 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_66 + var_328_58
					end

					if var_328_61.prefab_name ~= "" and arg_325_1.actors_[var_328_61.prefab_name] ~= nil then
						local var_328_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_61.prefab_name].transform, "story_v_out_412102", "412102080", "story_v_out_412102.awb")

						arg_325_1:RecordAudio("412102080", var_328_67)
						arg_325_1:RecordAudio("412102080", var_328_67)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_412102", "412102080", "story_v_out_412102.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_412102", "412102080", "story_v_out_412102.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_68 = math.max(var_328_59, arg_325_1.talkMaxDuration)

			if var_328_58 <= arg_325_1.time_ and arg_325_1.time_ < var_328_58 + var_328_68 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_58) / var_328_68

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_58 + var_328_68 and arg_325_1.time_ < var_328_58 + var_328_68 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play412102081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 412102081
		arg_329_1.duration_ = 4.933

		local var_329_0 = {
			zh = 4.333,
			ja = 4.933
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
				arg_329_0:Play412102082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = "10077ui_story"

			if arg_329_1.actors_[var_332_0] == nil then
				local var_332_1 = Object.Instantiate(Asset.Load("Char/" .. var_332_0), arg_329_1.stage_.transform)

				var_332_1.name = var_332_0
				var_332_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_329_1.actors_[var_332_0] = var_332_1

				local var_332_2 = var_332_1:GetComponentInChildren(typeof(CharacterEffect))

				var_332_2.enabled = true

				local var_332_3 = GameObjectTools.GetOrAddComponent(var_332_1, typeof(DynamicBoneHelper))

				if var_332_3 then
					var_332_3:EnableDynamicBone(false)
				end

				arg_329_1:ShowWeapon(var_332_2.transform, false)

				arg_329_1.var_[var_332_0 .. "Animator"] = var_332_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_329_1.var_[var_332_0 .. "Animator"].applyRootMotion = true
				arg_329_1.var_[var_332_0 .. "LipSync"] = var_332_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_332_4 = arg_329_1.actors_["10077ui_story"].transform
			local var_332_5 = 0

			if var_332_5 < arg_329_1.time_ and arg_329_1.time_ <= var_332_5 + arg_332_0 then
				arg_329_1.var_.moveOldPos10077ui_story = var_332_4.localPosition
			end

			local var_332_6 = 0.001

			if var_332_5 <= arg_329_1.time_ and arg_329_1.time_ < var_332_5 + var_332_6 then
				local var_332_7 = (arg_329_1.time_ - var_332_5) / var_332_6
				local var_332_8 = Vector3.New(0, 0, -5)

				var_332_4.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10077ui_story, var_332_8, var_332_7)

				local var_332_9 = manager.ui.mainCamera.transform.position - var_332_4.position

				var_332_4.forward = Vector3.New(var_332_9.x, var_332_9.y, var_332_9.z)

				local var_332_10 = var_332_4.localEulerAngles

				var_332_10.z = 0
				var_332_10.x = 0
				var_332_4.localEulerAngles = var_332_10
			end

			if arg_329_1.time_ >= var_332_5 + var_332_6 and arg_329_1.time_ < var_332_5 + var_332_6 + arg_332_0 then
				var_332_4.localPosition = Vector3.New(0, 0, -5)

				local var_332_11 = manager.ui.mainCamera.transform.position - var_332_4.position

				var_332_4.forward = Vector3.New(var_332_11.x, var_332_11.y, var_332_11.z)

				local var_332_12 = var_332_4.localEulerAngles

				var_332_12.z = 0
				var_332_12.x = 0
				var_332_4.localEulerAngles = var_332_12
			end

			local var_332_13 = arg_329_1.actors_["10077ui_story"]
			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 and arg_329_1.var_.characterEffect10077ui_story == nil then
				arg_329_1.var_.characterEffect10077ui_story = var_332_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_15 = 0.200000002980232

			if var_332_14 <= arg_329_1.time_ and arg_329_1.time_ < var_332_14 + var_332_15 then
				local var_332_16 = (arg_329_1.time_ - var_332_14) / var_332_15

				if arg_329_1.var_.characterEffect10077ui_story then
					arg_329_1.var_.characterEffect10077ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_14 + var_332_15 and arg_329_1.time_ < var_332_14 + var_332_15 + arg_332_0 and arg_329_1.var_.characterEffect10077ui_story then
				arg_329_1.var_.characterEffect10077ui_story.fillFlat = false
			end

			local var_332_17 = 0

			if var_332_17 < arg_329_1.time_ and arg_329_1.time_ <= var_332_17 + arg_332_0 then
				arg_329_1:PlayTimeline("10077ui_story", "StoryTimeline/CharAction/story10077/story10077action/10077action4_1")
			end

			local var_332_18 = 0

			if var_332_18 < arg_329_1.time_ and arg_329_1.time_ <= var_332_18 + arg_332_0 then
				arg_329_1:PlayTimeline("10077ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_332_19 = arg_329_1.actors_["10076ui_story"].transform
			local var_332_20 = 0

			if var_332_20 < arg_329_1.time_ and arg_329_1.time_ <= var_332_20 + arg_332_0 then
				arg_329_1.var_.moveOldPos10076ui_story = var_332_19.localPosition
			end

			local var_332_21 = 0.001

			if var_332_20 <= arg_329_1.time_ and arg_329_1.time_ < var_332_20 + var_332_21 then
				local var_332_22 = (arg_329_1.time_ - var_332_20) / var_332_21
				local var_332_23 = Vector3.New(0, 100, 0)

				var_332_19.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10076ui_story, var_332_23, var_332_22)

				local var_332_24 = manager.ui.mainCamera.transform.position - var_332_19.position

				var_332_19.forward = Vector3.New(var_332_24.x, var_332_24.y, var_332_24.z)

				local var_332_25 = var_332_19.localEulerAngles

				var_332_25.z = 0
				var_332_25.x = 0
				var_332_19.localEulerAngles = var_332_25
			end

			if arg_329_1.time_ >= var_332_20 + var_332_21 and arg_329_1.time_ < var_332_20 + var_332_21 + arg_332_0 then
				var_332_19.localPosition = Vector3.New(0, 100, 0)

				local var_332_26 = manager.ui.mainCamera.transform.position - var_332_19.position

				var_332_19.forward = Vector3.New(var_332_26.x, var_332_26.y, var_332_26.z)

				local var_332_27 = var_332_19.localEulerAngles

				var_332_27.z = 0
				var_332_27.x = 0
				var_332_19.localEulerAngles = var_332_27
			end

			local var_332_28 = arg_329_1.actors_["10076ui_story"]
			local var_332_29 = 0

			if var_332_29 < arg_329_1.time_ and arg_329_1.time_ <= var_332_29 + arg_332_0 and arg_329_1.var_.characterEffect10076ui_story == nil then
				arg_329_1.var_.characterEffect10076ui_story = var_332_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_30 = 0.200000002980232

			if var_332_29 <= arg_329_1.time_ and arg_329_1.time_ < var_332_29 + var_332_30 then
				local var_332_31 = (arg_329_1.time_ - var_332_29) / var_332_30

				if arg_329_1.var_.characterEffect10076ui_story then
					local var_332_32 = Mathf.Lerp(0, 0.5, var_332_31)

					arg_329_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10076ui_story.fillRatio = var_332_32
				end
			end

			if arg_329_1.time_ >= var_332_29 + var_332_30 and arg_329_1.time_ < var_332_29 + var_332_30 + arg_332_0 and arg_329_1.var_.characterEffect10076ui_story then
				local var_332_33 = 0.5

				arg_329_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10076ui_story.fillRatio = var_332_33
			end

			local var_332_34 = 0
			local var_332_35 = 0.425

			if var_332_34 < arg_329_1.time_ and arg_329_1.time_ <= var_332_34 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_36 = arg_329_1:FormatText(StoryNameCfg[922].name)

				arg_329_1.leftNameTxt_.text = var_332_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_37 = arg_329_1:GetWordFromCfg(412102081)
				local var_332_38 = arg_329_1:FormatText(var_332_37.content)

				arg_329_1.text_.text = var_332_38

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_39 = 17
				local var_332_40 = utf8.len(var_332_38)
				local var_332_41 = var_332_39 <= 0 and var_332_35 or var_332_35 * (var_332_40 / var_332_39)

				if var_332_41 > 0 and var_332_35 < var_332_41 then
					arg_329_1.talkMaxDuration = var_332_41

					if var_332_41 + var_332_34 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_41 + var_332_34
					end
				end

				arg_329_1.text_.text = var_332_38
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102081", "story_v_out_412102.awb") ~= 0 then
					local var_332_42 = manager.audio:GetVoiceLength("story_v_out_412102", "412102081", "story_v_out_412102.awb") / 1000

					if var_332_42 + var_332_34 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_42 + var_332_34
					end

					if var_332_37.prefab_name ~= "" and arg_329_1.actors_[var_332_37.prefab_name] ~= nil then
						local var_332_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_37.prefab_name].transform, "story_v_out_412102", "412102081", "story_v_out_412102.awb")

						arg_329_1:RecordAudio("412102081", var_332_43)
						arg_329_1:RecordAudio("412102081", var_332_43)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_412102", "412102081", "story_v_out_412102.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_412102", "412102081", "story_v_out_412102.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_44 = math.max(var_332_35, arg_329_1.talkMaxDuration)

			if var_332_34 <= arg_329_1.time_ and arg_329_1.time_ < var_332_34 + var_332_44 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_34) / var_332_44

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_34 + var_332_44 and arg_329_1.time_ < var_332_34 + var_332_44 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play412102082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 412102082
		arg_333_1.duration_ = 6.3

		local var_333_0 = {
			zh = 5.233,
			ja = 6.3
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play412102083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = "10078ui_story"

			if arg_333_1.actors_[var_336_0] == nil then
				local var_336_1 = Object.Instantiate(Asset.Load("Char/" .. var_336_0), arg_333_1.stage_.transform)

				var_336_1.name = var_336_0
				var_336_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_333_1.actors_[var_336_0] = var_336_1

				local var_336_2 = var_336_1:GetComponentInChildren(typeof(CharacterEffect))

				var_336_2.enabled = true

				local var_336_3 = GameObjectTools.GetOrAddComponent(var_336_1, typeof(DynamicBoneHelper))

				if var_336_3 then
					var_336_3:EnableDynamicBone(false)
				end

				arg_333_1:ShowWeapon(var_336_2.transform, false)

				arg_333_1.var_[var_336_0 .. "Animator"] = var_336_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_333_1.var_[var_336_0 .. "Animator"].applyRootMotion = true
				arg_333_1.var_[var_336_0 .. "LipSync"] = var_336_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_336_4 = arg_333_1.actors_["10078ui_story"].transform
			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 then
				arg_333_1.var_.moveOldPos10078ui_story = var_336_4.localPosition
			end

			local var_336_6 = 0.001

			if var_336_5 <= arg_333_1.time_ and arg_333_1.time_ < var_336_5 + var_336_6 then
				local var_336_7 = (arg_333_1.time_ - var_336_5) / var_336_6
				local var_336_8 = Vector3.New(0, -0.5, -6.3)

				var_336_4.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos10078ui_story, var_336_8, var_336_7)

				local var_336_9 = manager.ui.mainCamera.transform.position - var_336_4.position

				var_336_4.forward = Vector3.New(var_336_9.x, var_336_9.y, var_336_9.z)

				local var_336_10 = var_336_4.localEulerAngles

				var_336_10.z = 0
				var_336_10.x = 0
				var_336_4.localEulerAngles = var_336_10
			end

			if arg_333_1.time_ >= var_336_5 + var_336_6 and arg_333_1.time_ < var_336_5 + var_336_6 + arg_336_0 then
				var_336_4.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_336_11 = manager.ui.mainCamera.transform.position - var_336_4.position

				var_336_4.forward = Vector3.New(var_336_11.x, var_336_11.y, var_336_11.z)

				local var_336_12 = var_336_4.localEulerAngles

				var_336_12.z = 0
				var_336_12.x = 0
				var_336_4.localEulerAngles = var_336_12
			end

			local var_336_13 = arg_333_1.actors_["10078ui_story"]
			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 and arg_333_1.var_.characterEffect10078ui_story == nil then
				arg_333_1.var_.characterEffect10078ui_story = var_336_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_15 = 0.200000002980232

			if var_336_14 <= arg_333_1.time_ and arg_333_1.time_ < var_336_14 + var_336_15 then
				local var_336_16 = (arg_333_1.time_ - var_336_14) / var_336_15

				if arg_333_1.var_.characterEffect10078ui_story then
					arg_333_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_14 + var_336_15 and arg_333_1.time_ < var_336_14 + var_336_15 + arg_336_0 and arg_333_1.var_.characterEffect10078ui_story then
				arg_333_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_336_17 = 0

			if var_336_17 < arg_333_1.time_ and arg_333_1.time_ <= var_336_17 + arg_336_0 then
				arg_333_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action5_1")
			end

			local var_336_18 = 0

			if var_336_18 < arg_333_1.time_ and arg_333_1.time_ <= var_336_18 + arg_336_0 then
				arg_333_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_336_19 = arg_333_1.actors_["10077ui_story"].transform
			local var_336_20 = 0

			if var_336_20 < arg_333_1.time_ and arg_333_1.time_ <= var_336_20 + arg_336_0 then
				arg_333_1.var_.moveOldPos10077ui_story = var_336_19.localPosition
			end

			local var_336_21 = 0.001

			if var_336_20 <= arg_333_1.time_ and arg_333_1.time_ < var_336_20 + var_336_21 then
				local var_336_22 = (arg_333_1.time_ - var_336_20) / var_336_21
				local var_336_23 = Vector3.New(0, 100, 0)

				var_336_19.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos10077ui_story, var_336_23, var_336_22)

				local var_336_24 = manager.ui.mainCamera.transform.position - var_336_19.position

				var_336_19.forward = Vector3.New(var_336_24.x, var_336_24.y, var_336_24.z)

				local var_336_25 = var_336_19.localEulerAngles

				var_336_25.z = 0
				var_336_25.x = 0
				var_336_19.localEulerAngles = var_336_25
			end

			if arg_333_1.time_ >= var_336_20 + var_336_21 and arg_333_1.time_ < var_336_20 + var_336_21 + arg_336_0 then
				var_336_19.localPosition = Vector3.New(0, 100, 0)

				local var_336_26 = manager.ui.mainCamera.transform.position - var_336_19.position

				var_336_19.forward = Vector3.New(var_336_26.x, var_336_26.y, var_336_26.z)

				local var_336_27 = var_336_19.localEulerAngles

				var_336_27.z = 0
				var_336_27.x = 0
				var_336_19.localEulerAngles = var_336_27
			end

			local var_336_28 = arg_333_1.actors_["10077ui_story"]
			local var_336_29 = 0

			if var_336_29 < arg_333_1.time_ and arg_333_1.time_ <= var_336_29 + arg_336_0 and arg_333_1.var_.characterEffect10077ui_story == nil then
				arg_333_1.var_.characterEffect10077ui_story = var_336_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_30 = 0.200000002980232

			if var_336_29 <= arg_333_1.time_ and arg_333_1.time_ < var_336_29 + var_336_30 then
				local var_336_31 = (arg_333_1.time_ - var_336_29) / var_336_30

				if arg_333_1.var_.characterEffect10077ui_story then
					local var_336_32 = Mathf.Lerp(0, 0.5, var_336_31)

					arg_333_1.var_.characterEffect10077ui_story.fillFlat = true
					arg_333_1.var_.characterEffect10077ui_story.fillRatio = var_336_32
				end
			end

			if arg_333_1.time_ >= var_336_29 + var_336_30 and arg_333_1.time_ < var_336_29 + var_336_30 + arg_336_0 and arg_333_1.var_.characterEffect10077ui_story then
				local var_336_33 = 0.5

				arg_333_1.var_.characterEffect10077ui_story.fillFlat = true
				arg_333_1.var_.characterEffect10077ui_story.fillRatio = var_336_33
			end

			local var_336_34 = 0
			local var_336_35 = 0.325

			if var_336_34 < arg_333_1.time_ and arg_333_1.time_ <= var_336_34 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_36 = arg_333_1:FormatText(StoryNameCfg[919].name)

				arg_333_1.leftNameTxt_.text = var_336_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_37 = arg_333_1:GetWordFromCfg(412102082)
				local var_336_38 = arg_333_1:FormatText(var_336_37.content)

				arg_333_1.text_.text = var_336_38

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_39 = 13
				local var_336_40 = utf8.len(var_336_38)
				local var_336_41 = var_336_39 <= 0 and var_336_35 or var_336_35 * (var_336_40 / var_336_39)

				if var_336_41 > 0 and var_336_35 < var_336_41 then
					arg_333_1.talkMaxDuration = var_336_41

					if var_336_41 + var_336_34 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_41 + var_336_34
					end
				end

				arg_333_1.text_.text = var_336_38
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102082", "story_v_out_412102.awb") ~= 0 then
					local var_336_42 = manager.audio:GetVoiceLength("story_v_out_412102", "412102082", "story_v_out_412102.awb") / 1000

					if var_336_42 + var_336_34 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_42 + var_336_34
					end

					if var_336_37.prefab_name ~= "" and arg_333_1.actors_[var_336_37.prefab_name] ~= nil then
						local var_336_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_37.prefab_name].transform, "story_v_out_412102", "412102082", "story_v_out_412102.awb")

						arg_333_1:RecordAudio("412102082", var_336_43)
						arg_333_1:RecordAudio("412102082", var_336_43)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_412102", "412102082", "story_v_out_412102.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_412102", "412102082", "story_v_out_412102.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_44 = math.max(var_336_35, arg_333_1.talkMaxDuration)

			if var_336_34 <= arg_333_1.time_ and arg_333_1.time_ < var_336_34 + var_336_44 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_34) / var_336_44

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_34 + var_336_44 and arg_333_1.time_ < var_336_34 + var_336_44 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play412102083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 412102083
		arg_337_1.duration_ = 4.566

		local var_337_0 = {
			zh = 4.566,
			ja = 4.166
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play412102084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = "10083ui_story"

			if arg_337_1.actors_[var_340_0] == nil then
				local var_340_1 = Object.Instantiate(Asset.Load("Char/" .. var_340_0), arg_337_1.stage_.transform)

				var_340_1.name = var_340_0
				var_340_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_337_1.actors_[var_340_0] = var_340_1

				local var_340_2 = var_340_1:GetComponentInChildren(typeof(CharacterEffect))

				var_340_2.enabled = true

				local var_340_3 = GameObjectTools.GetOrAddComponent(var_340_1, typeof(DynamicBoneHelper))

				if var_340_3 then
					var_340_3:EnableDynamicBone(false)
				end

				arg_337_1:ShowWeapon(var_340_2.transform, false)

				arg_337_1.var_[var_340_0 .. "Animator"] = var_340_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_337_1.var_[var_340_0 .. "Animator"].applyRootMotion = true
				arg_337_1.var_[var_340_0 .. "LipSync"] = var_340_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_340_4 = arg_337_1.actors_["10083ui_story"].transform
			local var_340_5 = 0

			if var_340_5 < arg_337_1.time_ and arg_337_1.time_ <= var_340_5 + arg_340_0 then
				arg_337_1.var_.moveOldPos10083ui_story = var_340_4.localPosition
			end

			local var_340_6 = 0.001

			if var_340_5 <= arg_337_1.time_ and arg_337_1.time_ < var_340_5 + var_340_6 then
				local var_340_7 = (arg_337_1.time_ - var_340_5) / var_340_6
				local var_340_8 = Vector3.New(0, -2.6, -2.8)

				var_340_4.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos10083ui_story, var_340_8, var_340_7)

				local var_340_9 = manager.ui.mainCamera.transform.position - var_340_4.position

				var_340_4.forward = Vector3.New(var_340_9.x, var_340_9.y, var_340_9.z)

				local var_340_10 = var_340_4.localEulerAngles

				var_340_10.z = 0
				var_340_10.x = 0
				var_340_4.localEulerAngles = var_340_10
			end

			if arg_337_1.time_ >= var_340_5 + var_340_6 and arg_337_1.time_ < var_340_5 + var_340_6 + arg_340_0 then
				var_340_4.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_340_11 = manager.ui.mainCamera.transform.position - var_340_4.position

				var_340_4.forward = Vector3.New(var_340_11.x, var_340_11.y, var_340_11.z)

				local var_340_12 = var_340_4.localEulerAngles

				var_340_12.z = 0
				var_340_12.x = 0
				var_340_4.localEulerAngles = var_340_12
			end

			local var_340_13 = arg_337_1.actors_["10083ui_story"]
			local var_340_14 = 0

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 and arg_337_1.var_.characterEffect10083ui_story == nil then
				arg_337_1.var_.characterEffect10083ui_story = var_340_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_15 = 0.200000002980232

			if var_340_14 <= arg_337_1.time_ and arg_337_1.time_ < var_340_14 + var_340_15 then
				local var_340_16 = (arg_337_1.time_ - var_340_14) / var_340_15

				if arg_337_1.var_.characterEffect10083ui_story then
					arg_337_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_14 + var_340_15 and arg_337_1.time_ < var_340_14 + var_340_15 + arg_340_0 and arg_337_1.var_.characterEffect10083ui_story then
				arg_337_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_340_17 = 0

			if var_340_17 < arg_337_1.time_ and arg_337_1.time_ <= var_340_17 + arg_340_0 then
				arg_337_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action1_1")
			end

			local var_340_18 = 0

			if var_340_18 < arg_337_1.time_ and arg_337_1.time_ <= var_340_18 + arg_340_0 then
				arg_337_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_340_19 = arg_337_1.actors_["10078ui_story"].transform
			local var_340_20 = 0

			if var_340_20 < arg_337_1.time_ and arg_337_1.time_ <= var_340_20 + arg_340_0 then
				arg_337_1.var_.moveOldPos10078ui_story = var_340_19.localPosition
			end

			local var_340_21 = 0.001

			if var_340_20 <= arg_337_1.time_ and arg_337_1.time_ < var_340_20 + var_340_21 then
				local var_340_22 = (arg_337_1.time_ - var_340_20) / var_340_21
				local var_340_23 = Vector3.New(0, 100, 0)

				var_340_19.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos10078ui_story, var_340_23, var_340_22)

				local var_340_24 = manager.ui.mainCamera.transform.position - var_340_19.position

				var_340_19.forward = Vector3.New(var_340_24.x, var_340_24.y, var_340_24.z)

				local var_340_25 = var_340_19.localEulerAngles

				var_340_25.z = 0
				var_340_25.x = 0
				var_340_19.localEulerAngles = var_340_25
			end

			if arg_337_1.time_ >= var_340_20 + var_340_21 and arg_337_1.time_ < var_340_20 + var_340_21 + arg_340_0 then
				var_340_19.localPosition = Vector3.New(0, 100, 0)

				local var_340_26 = manager.ui.mainCamera.transform.position - var_340_19.position

				var_340_19.forward = Vector3.New(var_340_26.x, var_340_26.y, var_340_26.z)

				local var_340_27 = var_340_19.localEulerAngles

				var_340_27.z = 0
				var_340_27.x = 0
				var_340_19.localEulerAngles = var_340_27
			end

			local var_340_28 = arg_337_1.actors_["10078ui_story"]
			local var_340_29 = 0

			if var_340_29 < arg_337_1.time_ and arg_337_1.time_ <= var_340_29 + arg_340_0 and arg_337_1.var_.characterEffect10078ui_story == nil then
				arg_337_1.var_.characterEffect10078ui_story = var_340_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_30 = 0.200000002980232

			if var_340_29 <= arg_337_1.time_ and arg_337_1.time_ < var_340_29 + var_340_30 then
				local var_340_31 = (arg_337_1.time_ - var_340_29) / var_340_30

				if arg_337_1.var_.characterEffect10078ui_story then
					local var_340_32 = Mathf.Lerp(0, 0.5, var_340_31)

					arg_337_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_337_1.var_.characterEffect10078ui_story.fillRatio = var_340_32
				end
			end

			if arg_337_1.time_ >= var_340_29 + var_340_30 and arg_337_1.time_ < var_340_29 + var_340_30 + arg_340_0 and arg_337_1.var_.characterEffect10078ui_story then
				local var_340_33 = 0.5

				arg_337_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_337_1.var_.characterEffect10078ui_story.fillRatio = var_340_33
			end

			local var_340_34 = 0
			local var_340_35 = 0.425

			if var_340_34 < arg_337_1.time_ and arg_337_1.time_ <= var_340_34 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_36 = arg_337_1:FormatText(StoryNameCfg[918].name)

				arg_337_1.leftNameTxt_.text = var_340_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_37 = arg_337_1:GetWordFromCfg(412102083)
				local var_340_38 = arg_337_1:FormatText(var_340_37.content)

				arg_337_1.text_.text = var_340_38

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_39 = 17
				local var_340_40 = utf8.len(var_340_38)
				local var_340_41 = var_340_39 <= 0 and var_340_35 or var_340_35 * (var_340_40 / var_340_39)

				if var_340_41 > 0 and var_340_35 < var_340_41 then
					arg_337_1.talkMaxDuration = var_340_41

					if var_340_41 + var_340_34 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_41 + var_340_34
					end
				end

				arg_337_1.text_.text = var_340_38
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102083", "story_v_out_412102.awb") ~= 0 then
					local var_340_42 = manager.audio:GetVoiceLength("story_v_out_412102", "412102083", "story_v_out_412102.awb") / 1000

					if var_340_42 + var_340_34 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_42 + var_340_34
					end

					if var_340_37.prefab_name ~= "" and arg_337_1.actors_[var_340_37.prefab_name] ~= nil then
						local var_340_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_37.prefab_name].transform, "story_v_out_412102", "412102083", "story_v_out_412102.awb")

						arg_337_1:RecordAudio("412102083", var_340_43)
						arg_337_1:RecordAudio("412102083", var_340_43)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_412102", "412102083", "story_v_out_412102.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_412102", "412102083", "story_v_out_412102.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_44 = math.max(var_340_35, arg_337_1.talkMaxDuration)

			if var_340_34 <= arg_337_1.time_ and arg_337_1.time_ < var_340_34 + var_340_44 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_34) / var_340_44

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_34 + var_340_44 and arg_337_1.time_ < var_340_34 + var_340_44 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play412102084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 412102084
		arg_341_1.duration_ = 3.665999999999

		local var_341_0 = {
			zh = 3.632999999999,
			ja = 3.665999999999
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
				arg_341_0:Play412102085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				local var_344_1 = manager.ui.mainCamera.transform.localPosition
				local var_344_2 = Vector3.New(0, 0, 10) + Vector3.New(var_344_1.x, var_344_1.y, 0)
				local var_344_3 = arg_341_1.bgs_.STwhite

				var_344_3.transform.localPosition = var_344_2
				var_344_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_344_4 = var_344_3:GetComponent("SpriteRenderer")

				if var_344_4 and var_344_4.sprite then
					local var_344_5 = (var_344_3.transform.localPosition - var_344_1).z
					local var_344_6 = manager.ui.mainCameraCom_
					local var_344_7 = 2 * var_344_5 * Mathf.Tan(var_344_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_344_8 = var_344_7 * var_344_6.aspect
					local var_344_9 = var_344_4.sprite.bounds.size.x
					local var_344_10 = var_344_4.sprite.bounds.size.y
					local var_344_11 = var_344_8 / var_344_9
					local var_344_12 = var_344_7 / var_344_10
					local var_344_13 = var_344_12 < var_344_11 and var_344_11 or var_344_12

					var_344_3.transform.localScale = Vector3.New(var_344_13, var_344_13, 0)
				end

				for iter_344_0, iter_344_1 in pairs(arg_341_1.bgs_) do
					if iter_344_0 ~= "STwhite" then
						iter_344_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_344_14 = 1.999999999999

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 then
				arg_341_1.allBtn_.enabled = false
			end

			local var_344_15 = 0.3

			if arg_341_1.time_ >= var_344_14 + var_344_15 and arg_341_1.time_ < var_344_14 + var_344_15 + arg_344_0 then
				arg_341_1.allBtn_.enabled = true
			end

			local var_344_16 = 0

			if var_344_16 < arg_341_1.time_ and arg_341_1.time_ <= var_344_16 + arg_344_0 then
				arg_341_1.mask_.enabled = true
				arg_341_1.mask_.raycastTarget = true

				arg_341_1:SetGaussion(false)
			end

			local var_344_17 = 2

			if var_344_16 <= arg_341_1.time_ and arg_341_1.time_ < var_344_16 + var_344_17 then
				local var_344_18 = (arg_341_1.time_ - var_344_16) / var_344_17
				local var_344_19 = Color.New(1, 1, 1)

				var_344_19.a = Mathf.Lerp(1, 0, var_344_18)
				arg_341_1.mask_.color = var_344_19
			end

			if arg_341_1.time_ >= var_344_16 + var_344_17 and arg_341_1.time_ < var_344_16 + var_344_17 + arg_344_0 then
				local var_344_20 = Color.New(1, 1, 1)
				local var_344_21 = 0

				arg_341_1.mask_.enabled = false
				var_344_20.a = var_344_21
				arg_341_1.mask_.color = var_344_20
			end

			local var_344_22 = arg_341_1.actors_["10083ui_story"].transform
			local var_344_23 = 0

			if var_344_23 < arg_341_1.time_ and arg_341_1.time_ <= var_344_23 + arg_344_0 then
				arg_341_1.var_.moveOldPos10083ui_story = var_344_22.localPosition
			end

			local var_344_24 = 0.001

			if var_344_23 <= arg_341_1.time_ and arg_341_1.time_ < var_344_23 + var_344_24 then
				local var_344_25 = (arg_341_1.time_ - var_344_23) / var_344_24
				local var_344_26 = Vector3.New(0, 100, 0)

				var_344_22.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos10083ui_story, var_344_26, var_344_25)

				local var_344_27 = manager.ui.mainCamera.transform.position - var_344_22.position

				var_344_22.forward = Vector3.New(var_344_27.x, var_344_27.y, var_344_27.z)

				local var_344_28 = var_344_22.localEulerAngles

				var_344_28.z = 0
				var_344_28.x = 0
				var_344_22.localEulerAngles = var_344_28
			end

			if arg_341_1.time_ >= var_344_23 + var_344_24 and arg_341_1.time_ < var_344_23 + var_344_24 + arg_344_0 then
				var_344_22.localPosition = Vector3.New(0, 100, 0)

				local var_344_29 = manager.ui.mainCamera.transform.position - var_344_22.position

				var_344_22.forward = Vector3.New(var_344_29.x, var_344_29.y, var_344_29.z)

				local var_344_30 = var_344_22.localEulerAngles

				var_344_30.z = 0
				var_344_30.x = 0
				var_344_22.localEulerAngles = var_344_30
			end

			local var_344_31 = arg_341_1.actors_["10083ui_story"]
			local var_344_32 = 0

			if var_344_32 < arg_341_1.time_ and arg_341_1.time_ <= var_344_32 + arg_344_0 and arg_341_1.var_.characterEffect10083ui_story == nil then
				arg_341_1.var_.characterEffect10083ui_story = var_344_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_33 = 0.034000001847744

			if var_344_32 <= arg_341_1.time_ and arg_341_1.time_ < var_344_32 + var_344_33 then
				local var_344_34 = (arg_341_1.time_ - var_344_32) / var_344_33

				if arg_341_1.var_.characterEffect10083ui_story then
					local var_344_35 = Mathf.Lerp(0, 0.5, var_344_34)

					arg_341_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_341_1.var_.characterEffect10083ui_story.fillRatio = var_344_35
				end
			end

			if arg_341_1.time_ >= var_344_32 + var_344_33 and arg_341_1.time_ < var_344_32 + var_344_33 + arg_344_0 and arg_341_1.var_.characterEffect10083ui_story then
				local var_344_36 = 0.5

				arg_341_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_341_1.var_.characterEffect10083ui_story.fillRatio = var_344_36
			end

			local var_344_37 = 0
			local var_344_38 = 0.233333333333333

			if var_344_37 < arg_341_1.time_ and arg_341_1.time_ <= var_344_37 + arg_344_0 then
				local var_344_39 = "play"
				local var_344_40 = "music"

				arg_341_1:AudioAction(var_344_39, var_344_40, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_341_1.frameCnt_ <= 1 then
				arg_341_1.dialog_:SetActive(false)
			end

			local var_344_41 = 1.999999999999
			local var_344_42 = 0.225

			if var_344_41 < arg_341_1.time_ and arg_341_1.time_ <= var_344_41 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0

				arg_341_1.dialog_:SetActive(true)

				local var_344_43 = LeanTween.value(arg_341_1.dialog_, 0, 1, 0.3)

				var_344_43:setOnUpdate(LuaHelper.FloatAction(function(arg_345_0)
					arg_341_1.dialogCg_.alpha = arg_345_0
				end))
				var_344_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_341_1.dialog_)
					var_344_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_341_1.duration_ = arg_341_1.duration_ + 0.3

				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_44 = arg_341_1:FormatText(StoryNameCfg[216].name)

				arg_341_1.leftNameTxt_.text = var_344_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_45 = arg_341_1:GetWordFromCfg(412102084)
				local var_344_46 = arg_341_1:FormatText(var_344_45.content)

				arg_341_1.text_.text = var_344_46

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_47 = 9
				local var_344_48 = utf8.len(var_344_46)
				local var_344_49 = var_344_47 <= 0 and var_344_42 or var_344_42 * (var_344_48 / var_344_47)

				if var_344_49 > 0 and var_344_42 < var_344_49 then
					arg_341_1.talkMaxDuration = var_344_49
					var_344_41 = var_344_41 + 0.3

					if var_344_49 + var_344_41 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_49 + var_344_41
					end
				end

				arg_341_1.text_.text = var_344_46
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102084", "story_v_out_412102.awb") ~= 0 then
					local var_344_50 = manager.audio:GetVoiceLength("story_v_out_412102", "412102084", "story_v_out_412102.awb") / 1000

					if var_344_50 + var_344_41 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_50 + var_344_41
					end

					if var_344_45.prefab_name ~= "" and arg_341_1.actors_[var_344_45.prefab_name] ~= nil then
						local var_344_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_45.prefab_name].transform, "story_v_out_412102", "412102084", "story_v_out_412102.awb")

						arg_341_1:RecordAudio("412102084", var_344_51)
						arg_341_1:RecordAudio("412102084", var_344_51)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_412102", "412102084", "story_v_out_412102.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_412102", "412102084", "story_v_out_412102.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_52 = var_344_41 + 0.3
			local var_344_53 = math.max(var_344_42, arg_341_1.talkMaxDuration)

			if var_344_52 <= arg_341_1.time_ and arg_341_1.time_ < var_344_52 + var_344_53 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_52) / var_344_53

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_52 + var_344_53 and arg_341_1.time_ < var_344_52 + var_344_53 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play412102085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 412102085
		arg_347_1.duration_ = 5.099999999999

		local var_347_0 = {
			zh = 4.265999999999,
			ja = 5.099999999999
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play412102086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = "EN0107"

			if arg_347_1.bgs_[var_350_0] == nil then
				local var_350_1 = Object.Instantiate(arg_347_1.paintGo_)

				var_350_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_350_0)
				var_350_1.name = var_350_0
				var_350_1.transform.parent = arg_347_1.stage_.transform
				var_350_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_347_1.bgs_[var_350_0] = var_350_1
			end

			local var_350_2 = 0

			if var_350_2 < arg_347_1.time_ and arg_347_1.time_ <= var_350_2 + arg_350_0 then
				local var_350_3 = manager.ui.mainCamera.transform.localPosition
				local var_350_4 = Vector3.New(0, 0, 10) + Vector3.New(var_350_3.x, var_350_3.y, 0)
				local var_350_5 = arg_347_1.bgs_.EN0107

				var_350_5.transform.localPosition = var_350_4
				var_350_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_350_6 = var_350_5:GetComponent("SpriteRenderer")

				if var_350_6 and var_350_6.sprite then
					local var_350_7 = (var_350_5.transform.localPosition - var_350_3).z
					local var_350_8 = manager.ui.mainCameraCom_
					local var_350_9 = 2 * var_350_7 * Mathf.Tan(var_350_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_350_10 = var_350_9 * var_350_8.aspect
					local var_350_11 = var_350_6.sprite.bounds.size.x
					local var_350_12 = var_350_6.sprite.bounds.size.y
					local var_350_13 = var_350_10 / var_350_11
					local var_350_14 = var_350_9 / var_350_12
					local var_350_15 = var_350_14 < var_350_13 and var_350_13 or var_350_14

					var_350_5.transform.localScale = Vector3.New(var_350_15, var_350_15, 0)
				end

				for iter_350_0, iter_350_1 in pairs(arg_347_1.bgs_) do
					if iter_350_0 ~= "EN0107" then
						iter_350_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_350_16 = 1.999999999999

			if var_350_16 < arg_347_1.time_ and arg_347_1.time_ <= var_350_16 + arg_350_0 then
				arg_347_1.allBtn_.enabled = false
			end

			local var_350_17 = 0.3

			if arg_347_1.time_ >= var_350_16 + var_350_17 and arg_347_1.time_ < var_350_16 + var_350_17 + arg_350_0 then
				arg_347_1.allBtn_.enabled = true
			end

			local var_350_18 = 0

			if var_350_18 < arg_347_1.time_ and arg_347_1.time_ <= var_350_18 + arg_350_0 then
				arg_347_1.mask_.enabled = true
				arg_347_1.mask_.raycastTarget = true

				arg_347_1:SetGaussion(false)
			end

			local var_350_19 = 2

			if var_350_18 <= arg_347_1.time_ and arg_347_1.time_ < var_350_18 + var_350_19 then
				local var_350_20 = (arg_347_1.time_ - var_350_18) / var_350_19
				local var_350_21 = Color.New(0, 0, 0)

				var_350_21.a = Mathf.Lerp(1, 0, var_350_20)
				arg_347_1.mask_.color = var_350_21
			end

			if arg_347_1.time_ >= var_350_18 + var_350_19 and arg_347_1.time_ < var_350_18 + var_350_19 + arg_350_0 then
				local var_350_22 = Color.New(0, 0, 0)
				local var_350_23 = 0

				arg_347_1.mask_.enabled = false
				var_350_22.a = var_350_23
				arg_347_1.mask_.color = var_350_22
			end

			local var_350_24 = 0
			local var_350_25 = 0.233333333333333

			if var_350_24 < arg_347_1.time_ and arg_347_1.time_ <= var_350_24 + arg_350_0 then
				local var_350_26 = "play"
				local var_350_27 = "music"

				arg_347_1:AudioAction(var_350_26, var_350_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_350_28 = 0.266666666666667
			local var_350_29 = 1

			if var_350_28 < arg_347_1.time_ and arg_347_1.time_ <= var_350_28 + arg_350_0 then
				local var_350_30 = "play"
				local var_350_31 = "music"

				arg_347_1:AudioAction(var_350_30, var_350_31, "bgm_activity_3_2_ui", "bgm_activity_3_2_ui", "bgm_activity_3_2_ui.awb")
			end

			local var_350_32 = arg_347_1.bgs_.EN0107.transform
			local var_350_33 = 0.0333333333333333

			if var_350_33 < arg_347_1.time_ and arg_347_1.time_ <= var_350_33 + arg_350_0 then
				arg_347_1.var_.moveOldPosEN0107 = var_350_32.localPosition
			end

			local var_350_34 = 0.001

			if var_350_33 <= arg_347_1.time_ and arg_347_1.time_ < var_350_33 + var_350_34 then
				local var_350_35 = (arg_347_1.time_ - var_350_33) / var_350_34
				local var_350_36 = Vector3.New(-0.5, 0, 2)

				var_350_32.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPosEN0107, var_350_36, var_350_35)
			end

			if arg_347_1.time_ >= var_350_33 + var_350_34 and arg_347_1.time_ < var_350_33 + var_350_34 + arg_350_0 then
				var_350_32.localPosition = Vector3.New(-0.5, 0, 2)
			end

			local var_350_37 = arg_347_1.bgs_.EN0107.transform
			local var_350_38 = 0.05

			if var_350_38 < arg_347_1.time_ and arg_347_1.time_ <= var_350_38 + arg_350_0 then
				arg_347_1.var_.moveOldPosEN0107 = var_350_37.localPosition
			end

			local var_350_39 = 3

			if var_350_38 <= arg_347_1.time_ and arg_347_1.time_ < var_350_38 + var_350_39 then
				local var_350_40 = (arg_347_1.time_ - var_350_38) / var_350_39
				local var_350_41 = Vector3.New(-1, 0, 2)

				var_350_37.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPosEN0107, var_350_41, var_350_40)
			end

			if arg_347_1.time_ >= var_350_38 + var_350_39 and arg_347_1.time_ < var_350_38 + var_350_39 + arg_350_0 then
				var_350_37.localPosition = Vector3.New(-1, 0, 2)
			end

			if arg_347_1.frameCnt_ <= 1 then
				arg_347_1.dialog_:SetActive(false)
			end

			local var_350_42 = 1.999999999999
			local var_350_43 = 0.225

			if var_350_42 < arg_347_1.time_ and arg_347_1.time_ <= var_350_42 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0

				arg_347_1.dialog_:SetActive(true)

				local var_350_44 = LeanTween.value(arg_347_1.dialog_, 0, 1, 0.3)

				var_350_44:setOnUpdate(LuaHelper.FloatAction(function(arg_351_0)
					arg_347_1.dialogCg_.alpha = arg_351_0
				end))
				var_350_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_347_1.dialog_)
					var_350_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_347_1.duration_ = arg_347_1.duration_ + 0.3

				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_45 = arg_347_1:FormatText(StoryNameCfg[216].name)

				arg_347_1.leftNameTxt_.text = var_350_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_46 = arg_347_1:GetWordFromCfg(412102085)
				local var_350_47 = arg_347_1:FormatText(var_350_46.content)

				arg_347_1.text_.text = var_350_47

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_48 = 9
				local var_350_49 = utf8.len(var_350_47)
				local var_350_50 = var_350_48 <= 0 and var_350_43 or var_350_43 * (var_350_49 / var_350_48)

				if var_350_50 > 0 and var_350_43 < var_350_50 then
					arg_347_1.talkMaxDuration = var_350_50
					var_350_42 = var_350_42 + 0.3

					if var_350_50 + var_350_42 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_50 + var_350_42
					end
				end

				arg_347_1.text_.text = var_350_47
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102085", "story_v_out_412102.awb") ~= 0 then
					local var_350_51 = manager.audio:GetVoiceLength("story_v_out_412102", "412102085", "story_v_out_412102.awb") / 1000

					if var_350_51 + var_350_42 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_51 + var_350_42
					end

					if var_350_46.prefab_name ~= "" and arg_347_1.actors_[var_350_46.prefab_name] ~= nil then
						local var_350_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_46.prefab_name].transform, "story_v_out_412102", "412102085", "story_v_out_412102.awb")

						arg_347_1:RecordAudio("412102085", var_350_52)
						arg_347_1:RecordAudio("412102085", var_350_52)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_412102", "412102085", "story_v_out_412102.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_412102", "412102085", "story_v_out_412102.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_53 = var_350_42 + 0.3
			local var_350_54 = math.max(var_350_43, arg_347_1.talkMaxDuration)

			if var_350_53 <= arg_347_1.time_ and arg_347_1.time_ < var_350_53 + var_350_54 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_53) / var_350_54

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_53 + var_350_54 and arg_347_1.time_ < var_350_53 + var_350_54 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play412102086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 412102086
		arg_353_1.duration_ = 2.5

		local var_353_0 = {
			zh = 2.016666666666,
			ja = 2.5
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play412102087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = manager.ui.mainCamera.transform
			local var_356_1 = 0.2

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				local var_356_2 = arg_353_1.var_.effectxiaokunzhengyan1

				if var_356_2 then
					Object.Destroy(var_356_2)

					arg_353_1.var_.effectxiaokunzhengyan1 = nil
				end
			end

			local var_356_3 = manager.ui.mainCamera.transform
			local var_356_4 = 0

			if var_356_4 < arg_353_1.time_ and arg_353_1.time_ <= var_356_4 + arg_356_0 then
				local var_356_5 = arg_353_1.var_.effectxiaokunzhengyan1

				if not var_356_5 then
					var_356_5 = Object.Instantiate(Asset.Load("Effect/Scene/fx_scence_pingmu_niuqu"))
					var_356_5.name = "xiaokunzhengyan1"
					arg_353_1.var_.effectxiaokunzhengyan1 = var_356_5
				end

				local var_356_6 = var_356_3:Find("")

				if var_356_6 then
					var_356_5.transform.parent = var_356_6
				else
					var_356_5.transform.parent = var_356_3
				end

				var_356_5.transform.localPosition = Vector3.New(0, 0, 0)
				var_356_5.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_356_7 = arg_353_1.bgs_.EN0107.transform
			local var_356_8 = 0

			if var_356_8 < arg_353_1.time_ and arg_353_1.time_ <= var_356_8 + arg_356_0 then
				arg_353_1.var_.moveOldPosEN0107 = var_356_7.localPosition
			end

			local var_356_9 = 0.001

			if var_356_8 <= arg_353_1.time_ and arg_353_1.time_ < var_356_8 + var_356_9 then
				local var_356_10 = (arg_353_1.time_ - var_356_8) / var_356_9
				local var_356_11 = Vector3.New(0, 1, 9.5)

				var_356_7.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPosEN0107, var_356_11, var_356_10)
			end

			if arg_353_1.time_ >= var_356_8 + var_356_9 and arg_353_1.time_ < var_356_8 + var_356_9 + arg_356_0 then
				var_356_7.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_356_12 = arg_353_1.bgs_.EN0107.transform
			local var_356_13 = 0.0166666666666667

			if var_356_13 < arg_353_1.time_ and arg_353_1.time_ <= var_356_13 + arg_356_0 then
				arg_353_1.var_.moveOldPosEN0107 = var_356_12.localPosition
			end

			local var_356_14 = 2

			if var_356_13 <= arg_353_1.time_ and arg_353_1.time_ < var_356_13 + var_356_14 then
				local var_356_15 = (arg_353_1.time_ - var_356_13) / var_356_14
				local var_356_16 = Vector3.New(0, 1, 10)

				var_356_12.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPosEN0107, var_356_16, var_356_15)
			end

			if arg_353_1.time_ >= var_356_13 + var_356_14 and arg_353_1.time_ < var_356_13 + var_356_14 + arg_356_0 then
				var_356_12.localPosition = Vector3.New(0, 1, 10)
			end

			local var_356_17 = 0.3

			if var_356_17 < arg_353_1.time_ and arg_353_1.time_ <= var_356_17 + arg_356_0 then
				arg_353_1.allBtn_.enabled = false
			end

			local var_356_18 = 1.71666666666667

			if arg_353_1.time_ >= var_356_17 + var_356_18 and arg_353_1.time_ < var_356_17 + var_356_18 + arg_356_0 then
				arg_353_1.allBtn_.enabled = true
			end

			local var_356_19 = 0
			local var_356_20 = 0.175

			if var_356_19 < arg_353_1.time_ and arg_353_1.time_ <= var_356_19 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_21 = arg_353_1:FormatText(StoryNameCfg[216].name)

				arg_353_1.leftNameTxt_.text = var_356_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_22 = arg_353_1:GetWordFromCfg(412102086)
				local var_356_23 = arg_353_1:FormatText(var_356_22.content)

				arg_353_1.text_.text = var_356_23

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_24 = 7
				local var_356_25 = utf8.len(var_356_23)
				local var_356_26 = var_356_24 <= 0 and var_356_20 or var_356_20 * (var_356_25 / var_356_24)

				if var_356_26 > 0 and var_356_20 < var_356_26 then
					arg_353_1.talkMaxDuration = var_356_26

					if var_356_26 + var_356_19 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_26 + var_356_19
					end
				end

				arg_353_1.text_.text = var_356_23
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102086", "story_v_out_412102.awb") ~= 0 then
					local var_356_27 = manager.audio:GetVoiceLength("story_v_out_412102", "412102086", "story_v_out_412102.awb") / 1000

					if var_356_27 + var_356_19 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_27 + var_356_19
					end

					if var_356_22.prefab_name ~= "" and arg_353_1.actors_[var_356_22.prefab_name] ~= nil then
						local var_356_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_22.prefab_name].transform, "story_v_out_412102", "412102086", "story_v_out_412102.awb")

						arg_353_1:RecordAudio("412102086", var_356_28)
						arg_353_1:RecordAudio("412102086", var_356_28)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_412102", "412102086", "story_v_out_412102.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_412102", "412102086", "story_v_out_412102.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_29 = math.max(var_356_20, arg_353_1.talkMaxDuration)

			if var_356_19 <= arg_353_1.time_ and arg_353_1.time_ < var_356_19 + var_356_29 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_19) / var_356_29

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_19 + var_356_29 and arg_353_1.time_ < var_356_19 + var_356_29 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play412102087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 412102087
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play412102088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = manager.ui.mainCamera.transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				local var_360_2 = arg_357_1.var_.effectxiaokunzhengyan1

				if not var_360_2 then
					var_360_2 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_360_2.name = "xiaokunzhengyan1"
					arg_357_1.var_.effectxiaokunzhengyan1 = var_360_2
				end

				local var_360_3 = var_360_0:Find("")

				if var_360_3 then
					var_360_2.transform.parent = var_360_3
				else
					var_360_2.transform.parent = var_360_0
				end

				var_360_2.transform.localPosition = Vector3.New(0, 0, 0)
				var_360_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_360_4 = 0
			local var_360_5 = 0.425

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, false)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_6 = arg_357_1:GetWordFromCfg(412102087)
				local var_360_7 = arg_357_1:FormatText(var_360_6.content)

				arg_357_1.text_.text = var_360_7

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_8 = 17
				local var_360_9 = utf8.len(var_360_7)
				local var_360_10 = var_360_8 <= 0 and var_360_5 or var_360_5 * (var_360_9 / var_360_8)

				if var_360_10 > 0 and var_360_5 < var_360_10 then
					arg_357_1.talkMaxDuration = var_360_10

					if var_360_10 + var_360_4 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_10 + var_360_4
					end
				end

				arg_357_1.text_.text = var_360_7
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_11 = math.max(var_360_5, arg_357_1.talkMaxDuration)

			if var_360_4 <= arg_357_1.time_ and arg_357_1.time_ < var_360_4 + var_360_11 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_4) / var_360_11

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_4 + var_360_11 and arg_357_1.time_ < var_360_4 + var_360_11 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play412102088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 412102088
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play412102089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.7

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, false)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_2 = arg_361_1:GetWordFromCfg(412102088)
				local var_364_3 = arg_361_1:FormatText(var_364_2.content)

				arg_361_1.text_.text = var_364_3

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_4 = 28
				local var_364_5 = utf8.len(var_364_3)
				local var_364_6 = var_364_4 <= 0 and var_364_1 or var_364_1 * (var_364_5 / var_364_4)

				if var_364_6 > 0 and var_364_1 < var_364_6 then
					arg_361_1.talkMaxDuration = var_364_6

					if var_364_6 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_6 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_3
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_7 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_7 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_7

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_7 and arg_361_1.time_ < var_364_0 + var_364_7 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play412102089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 412102089
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play412102090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.425

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_2 = arg_365_1:GetWordFromCfg(412102089)
				local var_368_3 = arg_365_1:FormatText(var_368_2.content)

				arg_365_1.text_.text = var_368_3

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_4 = 17
				local var_368_5 = utf8.len(var_368_3)
				local var_368_6 = var_368_4 <= 0 and var_368_1 or var_368_1 * (var_368_5 / var_368_4)

				if var_368_6 > 0 and var_368_1 < var_368_6 then
					arg_365_1.talkMaxDuration = var_368_6

					if var_368_6 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_6 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_3
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_7 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_7 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_7

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_7 and arg_365_1.time_ < var_368_0 + var_368_7 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play412102090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 412102090
		arg_369_1.duration_ = 4.233

		local var_369_0 = {
			zh = 4.166,
			ja = 4.233
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play412102091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.5

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[216].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(412102090)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 20
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102090", "story_v_out_412102.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102090", "story_v_out_412102.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_412102", "412102090", "story_v_out_412102.awb")

						arg_369_1:RecordAudio("412102090", var_372_9)
						arg_369_1:RecordAudio("412102090", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_412102", "412102090", "story_v_out_412102.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_412102", "412102090", "story_v_out_412102.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play412102091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 412102091
		arg_373_1.duration_ = 8.4

		local var_373_0 = {
			zh = 6.5,
			ja = 8.4
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play412102092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.75

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[216].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(412102091)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102091", "story_v_out_412102.awb") ~= 0 then
					local var_376_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102091", "story_v_out_412102.awb") / 1000

					if var_376_8 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_8 + var_376_0
					end

					if var_376_3.prefab_name ~= "" and arg_373_1.actors_[var_376_3.prefab_name] ~= nil then
						local var_376_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_3.prefab_name].transform, "story_v_out_412102", "412102091", "story_v_out_412102.awb")

						arg_373_1:RecordAudio("412102091", var_376_9)
						arg_373_1:RecordAudio("412102091", var_376_9)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_412102", "412102091", "story_v_out_412102.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_412102", "412102091", "story_v_out_412102.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_10 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_10 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_10

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_10 and arg_373_1.time_ < var_376_0 + var_376_10 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play412102092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 412102092
		arg_377_1.duration_ = 4.1

		local var_377_0 = {
			zh = 3.333,
			ja = 4.1
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play412102093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				local var_380_1 = manager.ui.mainCamera.transform.localPosition
				local var_380_2 = Vector3.New(0, 0, 10) + Vector3.New(var_380_1.x, var_380_1.y, 0)
				local var_380_3 = arg_377_1.bgs_.ST30a

				var_380_3.transform.localPosition = var_380_2
				var_380_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_380_4 = var_380_3:GetComponent("SpriteRenderer")

				if var_380_4 and var_380_4.sprite then
					local var_380_5 = (var_380_3.transform.localPosition - var_380_1).z
					local var_380_6 = manager.ui.mainCameraCom_
					local var_380_7 = 2 * var_380_5 * Mathf.Tan(var_380_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_380_8 = var_380_7 * var_380_6.aspect
					local var_380_9 = var_380_4.sprite.bounds.size.x
					local var_380_10 = var_380_4.sprite.bounds.size.y
					local var_380_11 = var_380_8 / var_380_9
					local var_380_12 = var_380_7 / var_380_10
					local var_380_13 = var_380_12 < var_380_11 and var_380_11 or var_380_12

					var_380_3.transform.localScale = Vector3.New(var_380_13, var_380_13, 0)
				end

				for iter_380_0, iter_380_1 in pairs(arg_377_1.bgs_) do
					if iter_380_0 ~= "ST30a" then
						iter_380_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_380_14 = 1.999999999999

			if var_380_14 < arg_377_1.time_ and arg_377_1.time_ <= var_380_14 + arg_380_0 then
				arg_377_1.allBtn_.enabled = false
			end

			local var_380_15 = 0.3

			if arg_377_1.time_ >= var_380_14 + var_380_15 and arg_377_1.time_ < var_380_14 + var_380_15 + arg_380_0 then
				arg_377_1.allBtn_.enabled = true
			end

			local var_380_16 = 0

			if var_380_16 < arg_377_1.time_ and arg_377_1.time_ <= var_380_16 + arg_380_0 then
				arg_377_1.mask_.enabled = true
				arg_377_1.mask_.raycastTarget = true

				arg_377_1:SetGaussion(false)
			end

			local var_380_17 = 2

			if var_380_16 <= arg_377_1.time_ and arg_377_1.time_ < var_380_16 + var_380_17 then
				local var_380_18 = (arg_377_1.time_ - var_380_16) / var_380_17
				local var_380_19 = Color.New(1, 1, 1)

				var_380_19.a = Mathf.Lerp(1, 0, var_380_18)
				arg_377_1.mask_.color = var_380_19
			end

			if arg_377_1.time_ >= var_380_16 + var_380_17 and arg_377_1.time_ < var_380_16 + var_380_17 + arg_380_0 then
				local var_380_20 = Color.New(1, 1, 1)
				local var_380_21 = 0

				arg_377_1.mask_.enabled = false
				var_380_20.a = var_380_21
				arg_377_1.mask_.color = var_380_20
			end

			if arg_377_1.frameCnt_ <= 1 then
				arg_377_1.dialog_:SetActive(false)
			end

			local var_380_22 = 2
			local var_380_23 = 0.35

			if var_380_22 < arg_377_1.time_ and arg_377_1.time_ <= var_380_22 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0

				arg_377_1.dialog_:SetActive(true)

				local var_380_24 = LeanTween.value(arg_377_1.dialog_, 0, 1, 0.3)

				var_380_24:setOnUpdate(LuaHelper.FloatAction(function(arg_381_0)
					arg_377_1.dialogCg_.alpha = arg_381_0
				end))
				var_380_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_377_1.dialog_)
					var_380_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_377_1.duration_ = arg_377_1.duration_ + 0.3

				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_25 = arg_377_1:FormatText(StoryNameCfg[913].name)

				arg_377_1.leftNameTxt_.text = var_380_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, true)
				arg_377_1.iconController_:SetSelectedState("hero")

				arg_377_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097_sheep")

				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_26 = arg_377_1:GetWordFromCfg(412102092)
				local var_380_27 = arg_377_1:FormatText(var_380_26.content)

				arg_377_1.text_.text = var_380_27

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_28 = 14
				local var_380_29 = utf8.len(var_380_27)
				local var_380_30 = var_380_28 <= 0 and var_380_23 or var_380_23 * (var_380_29 / var_380_28)

				if var_380_30 > 0 and var_380_23 < var_380_30 then
					arg_377_1.talkMaxDuration = var_380_30
					var_380_22 = var_380_22 + 0.3

					if var_380_30 + var_380_22 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_30 + var_380_22
					end
				end

				arg_377_1.text_.text = var_380_27
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102092", "story_v_out_412102.awb") ~= 0 then
					local var_380_31 = manager.audio:GetVoiceLength("story_v_out_412102", "412102092", "story_v_out_412102.awb") / 1000

					if var_380_31 + var_380_22 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_31 + var_380_22
					end

					if var_380_26.prefab_name ~= "" and arg_377_1.actors_[var_380_26.prefab_name] ~= nil then
						local var_380_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_26.prefab_name].transform, "story_v_out_412102", "412102092", "story_v_out_412102.awb")

						arg_377_1:RecordAudio("412102092", var_380_32)
						arg_377_1:RecordAudio("412102092", var_380_32)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_412102", "412102092", "story_v_out_412102.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_412102", "412102092", "story_v_out_412102.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_33 = var_380_22 + 0.3
			local var_380_34 = math.max(var_380_23, arg_377_1.talkMaxDuration)

			if var_380_33 <= arg_377_1.time_ and arg_377_1.time_ < var_380_33 + var_380_34 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_33) / var_380_34

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_33 + var_380_34 and arg_377_1.time_ < var_380_33 + var_380_34 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play412102093 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 412102093
		arg_383_1.duration_ = 5.733

		local var_383_0 = {
			zh = 3.166,
			ja = 5.733
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play412102094(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1197ui_story"].transform
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 then
				arg_383_1.var_.moveOldPos1197ui_story = var_386_0.localPosition
			end

			local var_386_2 = 0.001

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2
				local var_386_4 = Vector3.New(0, -0.545, -6.3)

				var_386_0.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1197ui_story, var_386_4, var_386_3)

				local var_386_5 = manager.ui.mainCamera.transform.position - var_386_0.position

				var_386_0.forward = Vector3.New(var_386_5.x, var_386_5.y, var_386_5.z)

				local var_386_6 = var_386_0.localEulerAngles

				var_386_6.z = 0
				var_386_6.x = 0
				var_386_0.localEulerAngles = var_386_6
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 then
				var_386_0.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_386_7 = manager.ui.mainCamera.transform.position - var_386_0.position

				var_386_0.forward = Vector3.New(var_386_7.x, var_386_7.y, var_386_7.z)

				local var_386_8 = var_386_0.localEulerAngles

				var_386_8.z = 0
				var_386_8.x = 0
				var_386_0.localEulerAngles = var_386_8
			end

			local var_386_9 = arg_383_1.actors_["1197ui_story"]
			local var_386_10 = 0

			if var_386_10 < arg_383_1.time_ and arg_383_1.time_ <= var_386_10 + arg_386_0 and arg_383_1.var_.characterEffect1197ui_story == nil then
				arg_383_1.var_.characterEffect1197ui_story = var_386_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_11 = 0.200000002980232

			if var_386_10 <= arg_383_1.time_ and arg_383_1.time_ < var_386_10 + var_386_11 then
				local var_386_12 = (arg_383_1.time_ - var_386_10) / var_386_11

				if arg_383_1.var_.characterEffect1197ui_story then
					arg_383_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_383_1.time_ >= var_386_10 + var_386_11 and arg_383_1.time_ < var_386_10 + var_386_11 + arg_386_0 and arg_383_1.var_.characterEffect1197ui_story then
				arg_383_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_386_13 = 0

			if var_386_13 < arg_383_1.time_ and arg_383_1.time_ <= var_386_13 + arg_386_0 then
				arg_383_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action6_1")
			end

			local var_386_14 = 0

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 then
				arg_383_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_386_15 = 0
			local var_386_16 = 0.3

			if var_386_15 < arg_383_1.time_ and arg_383_1.time_ <= var_386_15 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_17 = arg_383_1:FormatText(StoryNameCfg[216].name)

				arg_383_1.leftNameTxt_.text = var_386_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_18 = arg_383_1:GetWordFromCfg(412102093)
				local var_386_19 = arg_383_1:FormatText(var_386_18.content)

				arg_383_1.text_.text = var_386_19

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_20 = 12
				local var_386_21 = utf8.len(var_386_19)
				local var_386_22 = var_386_20 <= 0 and var_386_16 or var_386_16 * (var_386_21 / var_386_20)

				if var_386_22 > 0 and var_386_16 < var_386_22 then
					arg_383_1.talkMaxDuration = var_386_22

					if var_386_22 + var_386_15 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_22 + var_386_15
					end
				end

				arg_383_1.text_.text = var_386_19
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102093", "story_v_out_412102.awb") ~= 0 then
					local var_386_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102093", "story_v_out_412102.awb") / 1000

					if var_386_23 + var_386_15 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_23 + var_386_15
					end

					if var_386_18.prefab_name ~= "" and arg_383_1.actors_[var_386_18.prefab_name] ~= nil then
						local var_386_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_18.prefab_name].transform, "story_v_out_412102", "412102093", "story_v_out_412102.awb")

						arg_383_1:RecordAudio("412102093", var_386_24)
						arg_383_1:RecordAudio("412102093", var_386_24)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_412102", "412102093", "story_v_out_412102.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_412102", "412102093", "story_v_out_412102.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_25 = math.max(var_386_16, arg_383_1.talkMaxDuration)

			if var_386_15 <= arg_383_1.time_ and arg_383_1.time_ < var_386_15 + var_386_25 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_15) / var_386_25

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_15 + var_386_25 and arg_383_1.time_ < var_386_15 + var_386_25 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play412102094 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 412102094
		arg_387_1.duration_ = 10

		local var_387_0 = {
			zh = 8.1,
			ja = 10
		}
		local var_387_1 = manager.audio:GetLocalizationFlag()

		if var_387_0[var_387_1] ~= nil then
			arg_387_1.duration_ = var_387_0[var_387_1]
		end

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play412102095(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.85

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[216].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(412102094)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 34
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102094", "story_v_out_412102.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102094", "story_v_out_412102.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_412102", "412102094", "story_v_out_412102.awb")

						arg_387_1:RecordAudio("412102094", var_390_9)
						arg_387_1:RecordAudio("412102094", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_412102", "412102094", "story_v_out_412102.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_412102", "412102094", "story_v_out_412102.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play412102095 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 412102095
		arg_391_1.duration_ = 11.566

		local var_391_0 = {
			zh = 6.566,
			ja = 11.566
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play412102096(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1197ui_story"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1197ui_story = var_394_0.localPosition
			end

			local var_394_2 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2
				local var_394_4 = Vector3.New(0, -0.545, -6.3)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1197ui_story, var_394_4, var_394_3)

				local var_394_5 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_5.x, var_394_5.y, var_394_5.z)

				local var_394_6 = var_394_0.localEulerAngles

				var_394_6.z = 0
				var_394_6.x = 0
				var_394_0.localEulerAngles = var_394_6
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_394_7 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_7.x, var_394_7.y, var_394_7.z)

				local var_394_8 = var_394_0.localEulerAngles

				var_394_8.z = 0
				var_394_8.x = 0
				var_394_0.localEulerAngles = var_394_8
			end

			local var_394_9 = arg_391_1.actors_["1197ui_story"]
			local var_394_10 = 0

			if var_394_10 < arg_391_1.time_ and arg_391_1.time_ <= var_394_10 + arg_394_0 and arg_391_1.var_.characterEffect1197ui_story == nil then
				arg_391_1.var_.characterEffect1197ui_story = var_394_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_11 = 0.200000002980232

			if var_394_10 <= arg_391_1.time_ and arg_391_1.time_ < var_394_10 + var_394_11 then
				local var_394_12 = (arg_391_1.time_ - var_394_10) / var_394_11

				if arg_391_1.var_.characterEffect1197ui_story then
					arg_391_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_10 + var_394_11 and arg_391_1.time_ < var_394_10 + var_394_11 + arg_394_0 and arg_391_1.var_.characterEffect1197ui_story then
				arg_391_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_394_13 = 0

			if var_394_13 < arg_391_1.time_ and arg_391_1.time_ <= var_394_13 + arg_394_0 then
				arg_391_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action6_2")
			end

			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				arg_391_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_394_15 = 0
			local var_394_16 = 0.725

			if var_394_15 < arg_391_1.time_ and arg_391_1.time_ <= var_394_15 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_17 = arg_391_1:FormatText(StoryNameCfg[216].name)

				arg_391_1.leftNameTxt_.text = var_394_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_18 = arg_391_1:GetWordFromCfg(412102095)
				local var_394_19 = arg_391_1:FormatText(var_394_18.content)

				arg_391_1.text_.text = var_394_19

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_20 = 29
				local var_394_21 = utf8.len(var_394_19)
				local var_394_22 = var_394_20 <= 0 and var_394_16 or var_394_16 * (var_394_21 / var_394_20)

				if var_394_22 > 0 and var_394_16 < var_394_22 then
					arg_391_1.talkMaxDuration = var_394_22

					if var_394_22 + var_394_15 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_22 + var_394_15
					end
				end

				arg_391_1.text_.text = var_394_19
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102095", "story_v_out_412102.awb") ~= 0 then
					local var_394_23 = manager.audio:GetVoiceLength("story_v_out_412102", "412102095", "story_v_out_412102.awb") / 1000

					if var_394_23 + var_394_15 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_23 + var_394_15
					end

					if var_394_18.prefab_name ~= "" and arg_391_1.actors_[var_394_18.prefab_name] ~= nil then
						local var_394_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_18.prefab_name].transform, "story_v_out_412102", "412102095", "story_v_out_412102.awb")

						arg_391_1:RecordAudio("412102095", var_394_24)
						arg_391_1:RecordAudio("412102095", var_394_24)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_412102", "412102095", "story_v_out_412102.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_412102", "412102095", "story_v_out_412102.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_25 = math.max(var_394_16, arg_391_1.talkMaxDuration)

			if var_394_15 <= arg_391_1.time_ and arg_391_1.time_ < var_394_15 + var_394_25 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_15) / var_394_25

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_15 + var_394_25 and arg_391_1.time_ < var_394_15 + var_394_25 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play412102096 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 412102096
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play412102097(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1197ui_story"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1197ui_story = var_398_0.localPosition
			end

			local var_398_2 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2
				local var_398_4 = Vector3.New(0, 100, 0)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1197ui_story, var_398_4, var_398_3)

				local var_398_5 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_5.x, var_398_5.y, var_398_5.z)

				local var_398_6 = var_398_0.localEulerAngles

				var_398_6.z = 0
				var_398_6.x = 0
				var_398_0.localEulerAngles = var_398_6
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(0, 100, 0)

				local var_398_7 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_7.x, var_398_7.y, var_398_7.z)

				local var_398_8 = var_398_0.localEulerAngles

				var_398_8.z = 0
				var_398_8.x = 0
				var_398_0.localEulerAngles = var_398_8
			end

			local var_398_9 = arg_395_1.actors_["1197ui_story"]
			local var_398_10 = 0

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 and arg_395_1.var_.characterEffect1197ui_story == nil then
				arg_395_1.var_.characterEffect1197ui_story = var_398_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_11 = 0.200000002980232

			if var_398_10 <= arg_395_1.time_ and arg_395_1.time_ < var_398_10 + var_398_11 then
				local var_398_12 = (arg_395_1.time_ - var_398_10) / var_398_11

				if arg_395_1.var_.characterEffect1197ui_story then
					local var_398_13 = Mathf.Lerp(0, 0.5, var_398_12)

					arg_395_1.var_.characterEffect1197ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1197ui_story.fillRatio = var_398_13
				end
			end

			if arg_395_1.time_ >= var_398_10 + var_398_11 and arg_395_1.time_ < var_398_10 + var_398_11 + arg_398_0 and arg_395_1.var_.characterEffect1197ui_story then
				local var_398_14 = 0.5

				arg_395_1.var_.characterEffect1197ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1197ui_story.fillRatio = var_398_14
			end

			local var_398_15 = 0
			local var_398_16 = 0.233333333333333

			if var_398_15 < arg_395_1.time_ and arg_395_1.time_ <= var_398_15 + arg_398_0 then
				local var_398_17 = "play"
				local var_398_18 = "effect"

				arg_395_1:AudioAction(var_398_17, var_398_18, "se_story_120_00", "se_story_120_00_door_break02", "")
			end

			local var_398_19 = manager.ui.mainCamera.transform
			local var_398_20 = 0

			if var_398_20 < arg_395_1.time_ and arg_395_1.time_ <= var_398_20 + arg_398_0 then
				arg_395_1.var_.shakeOldPos = var_398_19.localPosition
			end

			local var_398_21 = 0.6

			if var_398_20 <= arg_395_1.time_ and arg_395_1.time_ < var_398_20 + var_398_21 then
				local var_398_22 = (arg_395_1.time_ - var_398_20) / 0.066
				local var_398_23, var_398_24 = math.modf(var_398_22)

				var_398_19.localPosition = Vector3.New(var_398_24 * 0.13, var_398_24 * 0.13, var_398_24 * 0.13) + arg_395_1.var_.shakeOldPos
			end

			if arg_395_1.time_ >= var_398_20 + var_398_21 and arg_395_1.time_ < var_398_20 + var_398_21 + arg_398_0 then
				var_398_19.localPosition = arg_395_1.var_.shakeOldPos
			end

			local var_398_25 = 0

			if var_398_25 < arg_395_1.time_ and arg_395_1.time_ <= var_398_25 + arg_398_0 then
				arg_395_1.allBtn_.enabled = false
			end

			local var_398_26 = 0.6

			if arg_395_1.time_ >= var_398_25 + var_398_26 and arg_395_1.time_ < var_398_25 + var_398_26 + arg_398_0 then
				arg_395_1.allBtn_.enabled = true
			end

			local var_398_27 = 0
			local var_398_28 = 0.9

			if var_398_27 < arg_395_1.time_ and arg_395_1.time_ <= var_398_27 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_29 = arg_395_1:GetWordFromCfg(412102096)
				local var_398_30 = arg_395_1:FormatText(var_398_29.content)

				arg_395_1.text_.text = var_398_30

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_31 = 36
				local var_398_32 = utf8.len(var_398_30)
				local var_398_33 = var_398_31 <= 0 and var_398_28 or var_398_28 * (var_398_32 / var_398_31)

				if var_398_33 > 0 and var_398_28 < var_398_33 then
					arg_395_1.talkMaxDuration = var_398_33

					if var_398_33 + var_398_27 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_33 + var_398_27
					end
				end

				arg_395_1.text_.text = var_398_30
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_34 = math.max(var_398_28, arg_395_1.talkMaxDuration)

			if var_398_27 <= arg_395_1.time_ and arg_395_1.time_ < var_398_27 + var_398_34 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_27) / var_398_34

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_27 + var_398_34 and arg_395_1.time_ < var_398_27 + var_398_34 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play412102097 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 412102097
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play412102098(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 0.75

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_2 = arg_399_1:GetWordFromCfg(412102097)
				local var_402_3 = arg_399_1:FormatText(var_402_2.content)

				arg_399_1.text_.text = var_402_3

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_4 = 30
				local var_402_5 = utf8.len(var_402_3)
				local var_402_6 = var_402_4 <= 0 and var_402_1 or var_402_1 * (var_402_5 / var_402_4)

				if var_402_6 > 0 and var_402_1 < var_402_6 then
					arg_399_1.talkMaxDuration = var_402_6

					if var_402_6 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_6 + var_402_0
					end
				end

				arg_399_1.text_.text = var_402_3
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_7 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_7 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_7

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_7 and arg_399_1.time_ < var_402_0 + var_402_7 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play412102098 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 412102098
		arg_403_1.duration_ = 12

		local var_403_0 = {
			zh = 8.5,
			ja = 12
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
				arg_403_0:Play412102099(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = 2

			if var_406_0 < arg_403_1.time_ and arg_403_1.time_ <= var_406_0 + arg_406_0 then
				local var_406_1 = manager.ui.mainCamera.transform.localPosition
				local var_406_2 = Vector3.New(0, 0, 10) + Vector3.New(var_406_1.x, var_406_1.y, 0)
				local var_406_3 = arg_403_1.bgs_.STwhite

				var_406_3.transform.localPosition = var_406_2
				var_406_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_406_4 = var_406_3:GetComponent("SpriteRenderer")

				if var_406_4 and var_406_4.sprite then
					local var_406_5 = (var_406_3.transform.localPosition - var_406_1).z
					local var_406_6 = manager.ui.mainCameraCom_
					local var_406_7 = 2 * var_406_5 * Mathf.Tan(var_406_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_406_8 = var_406_7 * var_406_6.aspect
					local var_406_9 = var_406_4.sprite.bounds.size.x
					local var_406_10 = var_406_4.sprite.bounds.size.y
					local var_406_11 = var_406_8 / var_406_9
					local var_406_12 = var_406_7 / var_406_10
					local var_406_13 = var_406_12 < var_406_11 and var_406_11 or var_406_12

					var_406_3.transform.localScale = Vector3.New(var_406_13, var_406_13, 0)
				end

				for iter_406_0, iter_406_1 in pairs(arg_403_1.bgs_) do
					if iter_406_0 ~= "STwhite" then
						iter_406_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_406_14 = 4

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 then
				arg_403_1.allBtn_.enabled = false
			end

			local var_406_15 = 0.3

			if arg_403_1.time_ >= var_406_14 + var_406_15 and arg_403_1.time_ < var_406_14 + var_406_15 + arg_406_0 then
				arg_403_1.allBtn_.enabled = true
			end

			local var_406_16 = 0

			if var_406_16 < arg_403_1.time_ and arg_403_1.time_ <= var_406_16 + arg_406_0 then
				arg_403_1.mask_.enabled = true
				arg_403_1.mask_.raycastTarget = true

				arg_403_1:SetGaussion(false)
			end

			local var_406_17 = 2

			if var_406_16 <= arg_403_1.time_ and arg_403_1.time_ < var_406_16 + var_406_17 then
				local var_406_18 = (arg_403_1.time_ - var_406_16) / var_406_17
				local var_406_19 = Color.New(0, 0, 0)

				var_406_19.a = Mathf.Lerp(0, 1, var_406_18)
				arg_403_1.mask_.color = var_406_19
			end

			if arg_403_1.time_ >= var_406_16 + var_406_17 and arg_403_1.time_ < var_406_16 + var_406_17 + arg_406_0 then
				local var_406_20 = Color.New(0, 0, 0)

				var_406_20.a = 1
				arg_403_1.mask_.color = var_406_20
			end

			local var_406_21 = 2

			if var_406_21 < arg_403_1.time_ and arg_403_1.time_ <= var_406_21 + arg_406_0 then
				arg_403_1.mask_.enabled = true
				arg_403_1.mask_.raycastTarget = true

				arg_403_1:SetGaussion(false)
			end

			local var_406_22 = 2

			if var_406_21 <= arg_403_1.time_ and arg_403_1.time_ < var_406_21 + var_406_22 then
				local var_406_23 = (arg_403_1.time_ - var_406_21) / var_406_22
				local var_406_24 = Color.New(0, 0, 0)

				var_406_24.a = Mathf.Lerp(1, 0, var_406_23)
				arg_403_1.mask_.color = var_406_24
			end

			if arg_403_1.time_ >= var_406_21 + var_406_22 and arg_403_1.time_ < var_406_21 + var_406_22 + arg_406_0 then
				local var_406_25 = Color.New(0, 0, 0)
				local var_406_26 = 0

				arg_403_1.mask_.enabled = false
				var_406_25.a = var_406_26
				arg_403_1.mask_.color = var_406_25
			end

			local var_406_27 = arg_403_1.actors_["1197ui_story"].transform
			local var_406_28 = 3.8

			if var_406_28 < arg_403_1.time_ and arg_403_1.time_ <= var_406_28 + arg_406_0 then
				arg_403_1.var_.moveOldPos1197ui_story = var_406_27.localPosition
			end

			local var_406_29 = 0.001

			if var_406_28 <= arg_403_1.time_ and arg_403_1.time_ < var_406_28 + var_406_29 then
				local var_406_30 = (arg_403_1.time_ - var_406_28) / var_406_29
				local var_406_31 = Vector3.New(0, -0.545, -6.3)

				var_406_27.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1197ui_story, var_406_31, var_406_30)

				local var_406_32 = manager.ui.mainCamera.transform.position - var_406_27.position

				var_406_27.forward = Vector3.New(var_406_32.x, var_406_32.y, var_406_32.z)

				local var_406_33 = var_406_27.localEulerAngles

				var_406_33.z = 0
				var_406_33.x = 0
				var_406_27.localEulerAngles = var_406_33
			end

			if arg_403_1.time_ >= var_406_28 + var_406_29 and arg_403_1.time_ < var_406_28 + var_406_29 + arg_406_0 then
				var_406_27.localPosition = Vector3.New(0, -0.545, -6.3)

				local var_406_34 = manager.ui.mainCamera.transform.position - var_406_27.position

				var_406_27.forward = Vector3.New(var_406_34.x, var_406_34.y, var_406_34.z)

				local var_406_35 = var_406_27.localEulerAngles

				var_406_35.z = 0
				var_406_35.x = 0
				var_406_27.localEulerAngles = var_406_35
			end

			local var_406_36 = arg_403_1.actors_["1197ui_story"]
			local var_406_37 = 3.8

			if var_406_37 < arg_403_1.time_ and arg_403_1.time_ <= var_406_37 + arg_406_0 and arg_403_1.var_.characterEffect1197ui_story == nil then
				arg_403_1.var_.characterEffect1197ui_story = var_406_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_38 = 0.200000002980232

			if var_406_37 <= arg_403_1.time_ and arg_403_1.time_ < var_406_37 + var_406_38 then
				local var_406_39 = (arg_403_1.time_ - var_406_37) / var_406_38

				if arg_403_1.var_.characterEffect1197ui_story then
					arg_403_1.var_.characterEffect1197ui_story.fillFlat = false
				end
			end

			if arg_403_1.time_ >= var_406_37 + var_406_38 and arg_403_1.time_ < var_406_37 + var_406_38 + arg_406_0 and arg_403_1.var_.characterEffect1197ui_story then
				arg_403_1.var_.characterEffect1197ui_story.fillFlat = false
			end

			local var_406_40 = 3.8

			if var_406_40 < arg_403_1.time_ and arg_403_1.time_ <= var_406_40 + arg_406_0 then
				arg_403_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/story1197/story1197action/1197action6_1")
			end

			local var_406_41 = 3.8

			if var_406_41 < arg_403_1.time_ and arg_403_1.time_ <= var_406_41 + arg_406_0 then
				arg_403_1:PlayTimeline("1197ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			if arg_403_1.frameCnt_ <= 1 then
				arg_403_1.dialog_:SetActive(false)
			end

			local var_406_42 = 4
			local var_406_43 = 0.45

			if var_406_42 < arg_403_1.time_ and arg_403_1.time_ <= var_406_42 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0

				arg_403_1.dialog_:SetActive(true)

				local var_406_44 = LeanTween.value(arg_403_1.dialog_, 0, 1, 0.3)

				var_406_44:setOnUpdate(LuaHelper.FloatAction(function(arg_407_0)
					arg_403_1.dialogCg_.alpha = arg_407_0
				end))
				var_406_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_403_1.dialog_)
					var_406_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_403_1.duration_ = arg_403_1.duration_ + 0.3

				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_45 = arg_403_1:FormatText(StoryNameCfg[216].name)

				arg_403_1.leftNameTxt_.text = var_406_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_46 = arg_403_1:GetWordFromCfg(412102098)
				local var_406_47 = arg_403_1:FormatText(var_406_46.content)

				arg_403_1.text_.text = var_406_47

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_48 = 18
				local var_406_49 = utf8.len(var_406_47)
				local var_406_50 = var_406_48 <= 0 and var_406_43 or var_406_43 * (var_406_49 / var_406_48)

				if var_406_50 > 0 and var_406_43 < var_406_50 then
					arg_403_1.talkMaxDuration = var_406_50
					var_406_42 = var_406_42 + 0.3

					if var_406_50 + var_406_42 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_50 + var_406_42
					end
				end

				arg_403_1.text_.text = var_406_47
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102098", "story_v_out_412102.awb") ~= 0 then
					local var_406_51 = manager.audio:GetVoiceLength("story_v_out_412102", "412102098", "story_v_out_412102.awb") / 1000

					if var_406_51 + var_406_42 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_51 + var_406_42
					end

					if var_406_46.prefab_name ~= "" and arg_403_1.actors_[var_406_46.prefab_name] ~= nil then
						local var_406_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_46.prefab_name].transform, "story_v_out_412102", "412102098", "story_v_out_412102.awb")

						arg_403_1:RecordAudio("412102098", var_406_52)
						arg_403_1:RecordAudio("412102098", var_406_52)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_412102", "412102098", "story_v_out_412102.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_412102", "412102098", "story_v_out_412102.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_53 = var_406_42 + 0.3
			local var_406_54 = math.max(var_406_43, arg_403_1.talkMaxDuration)

			if var_406_53 <= arg_403_1.time_ and arg_403_1.time_ < var_406_53 + var_406_54 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_53) / var_406_54

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_53 + var_406_54 and arg_403_1.time_ < var_406_53 + var_406_54 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play412102099 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 412102099
		arg_409_1.duration_ = 6.333

		local var_409_0 = {
			zh = 3.066,
			ja = 6.333
		}
		local var_409_1 = manager.audio:GetLocalizationFlag()

		if var_409_0[var_409_1] ~= nil then
			arg_409_1.duration_ = var_409_0[var_409_1]
		end

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play412102100(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0
			local var_412_1 = 0.325

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_2 = arg_409_1:FormatText(StoryNameCfg[216].name)

				arg_409_1.leftNameTxt_.text = var_412_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_3 = arg_409_1:GetWordFromCfg(412102099)
				local var_412_4 = arg_409_1:FormatText(var_412_3.content)

				arg_409_1.text_.text = var_412_4

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_5 = 13
				local var_412_6 = utf8.len(var_412_4)
				local var_412_7 = var_412_5 <= 0 and var_412_1 or var_412_1 * (var_412_6 / var_412_5)

				if var_412_7 > 0 and var_412_1 < var_412_7 then
					arg_409_1.talkMaxDuration = var_412_7

					if var_412_7 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_7 + var_412_0
					end
				end

				arg_409_1.text_.text = var_412_4
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412102", "412102099", "story_v_out_412102.awb") ~= 0 then
					local var_412_8 = manager.audio:GetVoiceLength("story_v_out_412102", "412102099", "story_v_out_412102.awb") / 1000

					if var_412_8 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_8 + var_412_0
					end

					if var_412_3.prefab_name ~= "" and arg_409_1.actors_[var_412_3.prefab_name] ~= nil then
						local var_412_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_3.prefab_name].transform, "story_v_out_412102", "412102099", "story_v_out_412102.awb")

						arg_409_1:RecordAudio("412102099", var_412_9)
						arg_409_1:RecordAudio("412102099", var_412_9)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_412102", "412102099", "story_v_out_412102.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_412102", "412102099", "story_v_out_412102.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_10 = math.max(var_412_1, arg_409_1.talkMaxDuration)

			if var_412_0 <= arg_409_1.time_ and arg_409_1.time_ < var_412_0 + var_412_10 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_0) / var_412_10

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_0 + var_412_10 and arg_409_1.time_ < var_412_0 + var_412_10 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play412102100 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 412102100
		arg_413_1.duration_ = 5.5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
			arg_413_1.auto_ = false
		end

		function arg_413_1.playNext_(arg_415_0)
			arg_413_1.onStoryFinished_()
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0
			local var_416_1 = 0.233333333333333

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				local var_416_2 = "play"
				local var_416_3 = "music"

				arg_413_1:AudioAction(var_416_2, var_416_3, "se_story_side_1199", "se_story_1199_collapse", "")
			end

			local var_416_4 = 0

			if var_416_4 < arg_413_1.time_ and arg_413_1.time_ <= var_416_4 + arg_416_0 then
				arg_413_1.mask_.enabled = true
				arg_413_1.mask_.raycastTarget = true

				arg_413_1:SetGaussion(false)
			end

			local var_416_5 = 0.5

			if var_416_4 <= arg_413_1.time_ and arg_413_1.time_ < var_416_4 + var_416_5 then
				local var_416_6 = (arg_413_1.time_ - var_416_4) / var_416_5
				local var_416_7 = Color.New(1, 1, 1)

				var_416_7.a = Mathf.Lerp(1, 0, var_416_6)
				arg_413_1.mask_.color = var_416_7
			end

			if arg_413_1.time_ >= var_416_4 + var_416_5 and arg_413_1.time_ < var_416_4 + var_416_5 + arg_416_0 then
				local var_416_8 = Color.New(1, 1, 1)
				local var_416_9 = 0

				arg_413_1.mask_.enabled = false
				var_416_8.a = var_416_9
				arg_413_1.mask_.color = var_416_8
			end

			local var_416_10 = arg_413_1.actors_["1197ui_story"].transform
			local var_416_11 = 0

			if var_416_11 < arg_413_1.time_ and arg_413_1.time_ <= var_416_11 + arg_416_0 then
				arg_413_1.var_.moveOldPos1197ui_story = var_416_10.localPosition
			end

			local var_416_12 = 0.001

			if var_416_11 <= arg_413_1.time_ and arg_413_1.time_ < var_416_11 + var_416_12 then
				local var_416_13 = (arg_413_1.time_ - var_416_11) / var_416_12
				local var_416_14 = Vector3.New(0, 100, 0)

				var_416_10.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1197ui_story, var_416_14, var_416_13)

				local var_416_15 = manager.ui.mainCamera.transform.position - var_416_10.position

				var_416_10.forward = Vector3.New(var_416_15.x, var_416_15.y, var_416_15.z)

				local var_416_16 = var_416_10.localEulerAngles

				var_416_16.z = 0
				var_416_16.x = 0
				var_416_10.localEulerAngles = var_416_16
			end

			if arg_413_1.time_ >= var_416_11 + var_416_12 and arg_413_1.time_ < var_416_11 + var_416_12 + arg_416_0 then
				var_416_10.localPosition = Vector3.New(0, 100, 0)

				local var_416_17 = manager.ui.mainCamera.transform.position - var_416_10.position

				var_416_10.forward = Vector3.New(var_416_17.x, var_416_17.y, var_416_17.z)

				local var_416_18 = var_416_10.localEulerAngles

				var_416_18.z = 0
				var_416_18.x = 0
				var_416_10.localEulerAngles = var_416_18
			end

			if arg_413_1.frameCnt_ <= 1 then
				arg_413_1.dialog_:SetActive(false)
			end

			local var_416_19 = 0.5
			local var_416_20 = 0.6

			if var_416_19 < arg_413_1.time_ and arg_413_1.time_ <= var_416_19 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0

				arg_413_1.dialog_:SetActive(true)

				local var_416_21 = LeanTween.value(arg_413_1.dialog_, 0, 1, 0.3)

				var_416_21:setOnUpdate(LuaHelper.FloatAction(function(arg_417_0)
					arg_413_1.dialogCg_.alpha = arg_417_0
				end))
				var_416_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_413_1.dialog_)
					var_416_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_413_1.duration_ = arg_413_1.duration_ + 0.3

				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_22 = arg_413_1:GetWordFromCfg(412102100)
				local var_416_23 = arg_413_1:FormatText(var_416_22.content)

				arg_413_1.text_.text = var_416_23

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_24 = 24
				local var_416_25 = utf8.len(var_416_23)
				local var_416_26 = var_416_24 <= 0 and var_416_20 or var_416_20 * (var_416_25 / var_416_24)

				if var_416_26 > 0 and var_416_20 < var_416_26 then
					arg_413_1.talkMaxDuration = var_416_26
					var_416_19 = var_416_19 + 0.3

					if var_416_26 + var_416_19 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_26 + var_416_19
					end
				end

				arg_413_1.text_.text = var_416_23
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_27 = var_416_19 + 0.3
			local var_416_28 = math.max(var_416_20, arg_413_1.talkMaxDuration)

			if var_416_27 <= arg_413_1.time_ and arg_413_1.time_ < var_416_27 + var_416_28 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_27) / var_416_28

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_27 + var_416_28 and arg_413_1.time_ < var_416_27 + var_416_28 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST85b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST30a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/EN0107"
	},
	voices = {
		"story_v_out_412102.awb"
	}
}
