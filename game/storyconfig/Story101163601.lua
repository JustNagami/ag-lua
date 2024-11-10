return {
	Play116361001 = function(arg_1_0, arg_1_1)
		arg_1_1.marker = "Mark1"
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116361001
		arg_1_1.duration_ = 22.503

		local var_1_0 = {
			zh = 18.336,
			ja = 22.503
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
			arg_1_1.marker = ""

			if arg_3_0 == 1 then
				arg_1_0:Play116361002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I07a"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 3.67

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.I07a

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
					if iter_4_0 ~= "I07a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				SetActive(arg_1_1.dialog_, false)
				SetActive(arg_1_1.allBtn_.gameObject, false)
				arg_1_1.hideBtnsController_:SetSelectedIndex(1)

				arg_1_1.marker = "PlayCantSkipVideo"

				manager.video:Play("SofdecAsset/story/story_101161201.usm", function(arg_5_0)
					arg_1_1.time_ = var_4_16 + 3.66000000022352

					if arg_1_1.state_ == "pause" then
						arg_1_1.state_ = "playing"
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_6_0)
					if arg_6_0 then
						arg_1_1.state_ = "pause"
					else
						arg_1_1.state_ = "playing"
					end
				end)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_4_17 = 3.67

			if var_4_16 <= arg_1_1.time_ and arg_1_1.time_ < var_4_16 + var_4_17 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.marker = ""
			end

			local var_4_18 = 3.67

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				SetActive(arg_1_1.dialog_, true)
				SetActive(arg_1_1.allBtn_.gameObject, true)
				arg_1_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_4_19 = 0.0166666666666667

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				-- block empty
			end

			local var_4_20 = 3.68666666666667

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_21 = 2

			if var_4_20 <= arg_1_1.time_ and arg_1_1.time_ < var_4_20 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_20) / var_4_21
				local var_4_23 = Color.New(0, 0, 0)

				var_4_23.a = Mathf.Lerp(1, 0, var_4_22)
				arg_1_1.mask_.color = var_4_23
			end

			if arg_1_1.time_ >= var_4_20 + var_4_21 and arg_1_1.time_ < var_4_20 + var_4_21 + arg_4_0 then
				local var_4_24 = Color.New(0, 0, 0)
				local var_4_25 = 0

				arg_1_1.mask_.enabled = false
				var_4_24.a = var_4_25
				arg_1_1.mask_.color = var_4_24
			end

			local var_4_26 = "10032ui_story"

			if arg_1_1.actors_[var_4_26] == nil then
				local var_4_27 = Object.Instantiate(Asset.Load("Char/" .. var_4_26), arg_1_1.stage_.transform)

				var_4_27.name = var_4_26
				var_4_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_26] = var_4_27

				local var_4_28 = var_4_27:GetComponentInChildren(typeof(CharacterEffect))

				var_4_28.enabled = true

				local var_4_29 = GameObjectTools.GetOrAddComponent(var_4_27, typeof(DynamicBoneHelper))

				if var_4_29 then
					var_4_29:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_28.transform, false)

				arg_1_1.var_[var_4_26 .. "Animator"] = var_4_28.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_26 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_26 .. "LipSync"] = var_4_28.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_30 = arg_1_1.actors_["10032ui_story"].transform
			local var_4_31 = 5.68666666666667

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.var_.moveOldPos10032ui_story = var_4_30.localPosition
			end

			local var_4_32 = 0.001

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / var_4_32
				local var_4_34 = Vector3.New(0, -1.1, -5.9)

				var_4_30.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10032ui_story, var_4_34, var_4_33)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_30.position

				var_4_30.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_30.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_30.localEulerAngles = var_4_36
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				var_4_30.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_4_37 = manager.ui.mainCamera.transform.position - var_4_30.position

				var_4_30.forward = Vector3.New(var_4_37.x, var_4_37.y, var_4_37.z)

				local var_4_38 = var_4_30.localEulerAngles

				var_4_38.z = 0
				var_4_38.x = 0
				var_4_30.localEulerAngles = var_4_38
			end

			local var_4_39 = 5.68666666666667

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action1_1")
			end

			local var_4_40 = 5.68666666666667

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_4_41 = arg_1_1.actors_["10032ui_story"]
			local var_4_42 = 5.68666666666667

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 and arg_1_1.var_.characterEffect10032ui_story == nil then
				arg_1_1.var_.characterEffect10032ui_story = var_4_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_43 = 0.2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43

				if arg_1_1.var_.characterEffect10032ui_story then
					arg_1_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 and arg_1_1.var_.characterEffect10032ui_story then
				arg_1_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_4_45 = 0
			local var_4_46 = 0.266666666666667

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 5.67
			local var_4_50 = 1.075

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_51 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_51:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[328].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(116361001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 43
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_50 or var_4_50 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_50 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_49 = var_4_49 + 0.3

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361001", "story_v_out_116361.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_116361", "116361001", "story_v_out_116361.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_116361", "116361001", "story_v_out_116361.awb")

						arg_1_1:RecordAudio("116361001", var_4_59)
						arg_1_1:RecordAudio("116361001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116361", "116361001", "story_v_out_116361.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116361", "116361001", "story_v_out_116361.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_60 = var_4_49 + 0.3
			local var_4_61 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_60 <= arg_1_1.time_ and arg_1_1.time_ < var_4_60 + var_4_61 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_60) / var_4_61

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_60 + var_4_61 and arg_1_1.time_ < var_4_60 + var_4_61 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play116361002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 116361002
		arg_9_1.duration_ = 12.533

		local var_9_0 = {
			zh = 11.966,
			ja = 12.533
		}
		local var_9_1 = manager.audio:GetLocalizationFlag()

		if var_9_0[var_9_1] ~= nil then
			arg_9_1.duration_ = var_9_0[var_9_1]
		end

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play116361003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = arg_9_1.actors_["10032ui_story"].transform
			local var_12_1 = 0

			if var_12_1 < arg_9_1.time_ and arg_9_1.time_ <= var_12_1 + arg_12_0 then
				arg_9_1.var_.moveOldPos10032ui_story = var_12_0.localPosition
			end

			local var_12_2 = 0.001

			if var_12_1 <= arg_9_1.time_ and arg_9_1.time_ < var_12_1 + var_12_2 then
				local var_12_3 = (arg_9_1.time_ - var_12_1) / var_12_2
				local var_12_4 = Vector3.New(0, -1.1, -5.9)

				var_12_0.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos10032ui_story, var_12_4, var_12_3)

				local var_12_5 = manager.ui.mainCamera.transform.position - var_12_0.position

				var_12_0.forward = Vector3.New(var_12_5.x, var_12_5.y, var_12_5.z)

				local var_12_6 = var_12_0.localEulerAngles

				var_12_6.z = 0
				var_12_6.x = 0
				var_12_0.localEulerAngles = var_12_6
			end

			if arg_9_1.time_ >= var_12_1 + var_12_2 and arg_9_1.time_ < var_12_1 + var_12_2 + arg_12_0 then
				var_12_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_12_7 = manager.ui.mainCamera.transform.position - var_12_0.position

				var_12_0.forward = Vector3.New(var_12_7.x, var_12_7.y, var_12_7.z)

				local var_12_8 = var_12_0.localEulerAngles

				var_12_8.z = 0
				var_12_8.x = 0
				var_12_0.localEulerAngles = var_12_8
			end

			local var_12_9 = 0

			if var_12_9 < arg_9_1.time_ and arg_9_1.time_ <= var_12_9 + arg_12_0 then
				arg_9_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_12_10 = arg_9_1.actors_["10032ui_story"]
			local var_12_11 = 0

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 and arg_9_1.var_.characterEffect10032ui_story == nil then
				arg_9_1.var_.characterEffect10032ui_story = var_12_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_12 = 0.2

			if var_12_11 <= arg_9_1.time_ and arg_9_1.time_ < var_12_11 + var_12_12 then
				local var_12_13 = (arg_9_1.time_ - var_12_11) / var_12_12

				if arg_9_1.var_.characterEffect10032ui_story then
					arg_9_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_11 + var_12_12 and arg_9_1.time_ < var_12_11 + var_12_12 + arg_12_0 and arg_9_1.var_.characterEffect10032ui_story then
				arg_9_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_12_14 = 0

			if var_12_14 < arg_9_1.time_ and arg_9_1.time_ <= var_12_14 + arg_12_0 then
				arg_9_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_12_15 = 0
			local var_12_16 = 1.2

			if var_12_15 < arg_9_1.time_ and arg_9_1.time_ <= var_12_15 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_17 = arg_9_1:FormatText(StoryNameCfg[328].name)

				arg_9_1.leftNameTxt_.text = var_12_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_18 = arg_9_1:GetWordFromCfg(116361002)
				local var_12_19 = arg_9_1:FormatText(var_12_18.content)

				arg_9_1.text_.text = var_12_19

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_20 = 48
				local var_12_21 = utf8.len(var_12_19)
				local var_12_22 = var_12_20 <= 0 and var_12_16 or var_12_16 * (var_12_21 / var_12_20)

				if var_12_22 > 0 and var_12_16 < var_12_22 then
					arg_9_1.talkMaxDuration = var_12_22

					if var_12_22 + var_12_15 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_22 + var_12_15
					end
				end

				arg_9_1.text_.text = var_12_19
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361002", "story_v_out_116361.awb") ~= 0 then
					local var_12_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361002", "story_v_out_116361.awb") / 1000

					if var_12_23 + var_12_15 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_23 + var_12_15
					end

					if var_12_18.prefab_name ~= "" and arg_9_1.actors_[var_12_18.prefab_name] ~= nil then
						local var_12_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_18.prefab_name].transform, "story_v_out_116361", "116361002", "story_v_out_116361.awb")

						arg_9_1:RecordAudio("116361002", var_12_24)
						arg_9_1:RecordAudio("116361002", var_12_24)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_116361", "116361002", "story_v_out_116361.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_116361", "116361002", "story_v_out_116361.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_25 = math.max(var_12_16, arg_9_1.talkMaxDuration)

			if var_12_15 <= arg_9_1.time_ and arg_9_1.time_ < var_12_15 + var_12_25 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_15) / var_12_25

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_15 + var_12_25 and arg_9_1.time_ < var_12_15 + var_12_25 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play116361003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 116361003
		arg_13_1.duration_ = 10.7

		local var_13_0 = {
			zh = 7.1,
			ja = 10.7
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play116361004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["10032ui_story"].transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos10032ui_story = var_16_0.localPosition
			end

			local var_16_2 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2
				local var_16_4 = Vector3.New(0, -1.1, -5.9)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos10032ui_story, var_16_4, var_16_3)

				local var_16_5 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_5.x, var_16_5.y, var_16_5.z)

				local var_16_6 = var_16_0.localEulerAngles

				var_16_6.z = 0
				var_16_6.x = 0
				var_16_0.localEulerAngles = var_16_6
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 then
				var_16_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_16_7 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_7.x, var_16_7.y, var_16_7.z)

				local var_16_8 = var_16_0.localEulerAngles

				var_16_8.z = 0
				var_16_8.x = 0
				var_16_0.localEulerAngles = var_16_8
			end

			local var_16_9 = 0

			if var_16_9 < arg_13_1.time_ and arg_13_1.time_ <= var_16_9 + arg_16_0 then
				arg_13_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_16_10 = 0
			local var_16_11 = 0.7

			if var_16_10 < arg_13_1.time_ and arg_13_1.time_ <= var_16_10 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_12 = arg_13_1:FormatText(StoryNameCfg[328].name)

				arg_13_1.leftNameTxt_.text = var_16_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_13 = arg_13_1:GetWordFromCfg(116361003)
				local var_16_14 = arg_13_1:FormatText(var_16_13.content)

				arg_13_1.text_.text = var_16_14

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_15 = 28
				local var_16_16 = utf8.len(var_16_14)
				local var_16_17 = var_16_15 <= 0 and var_16_11 or var_16_11 * (var_16_16 / var_16_15)

				if var_16_17 > 0 and var_16_11 < var_16_17 then
					arg_13_1.talkMaxDuration = var_16_17

					if var_16_17 + var_16_10 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_17 + var_16_10
					end
				end

				arg_13_1.text_.text = var_16_14
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361003", "story_v_out_116361.awb") ~= 0 then
					local var_16_18 = manager.audio:GetVoiceLength("story_v_out_116361", "116361003", "story_v_out_116361.awb") / 1000

					if var_16_18 + var_16_10 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_18 + var_16_10
					end

					if var_16_13.prefab_name ~= "" and arg_13_1.actors_[var_16_13.prefab_name] ~= nil then
						local var_16_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_13.prefab_name].transform, "story_v_out_116361", "116361003", "story_v_out_116361.awb")

						arg_13_1:RecordAudio("116361003", var_16_19)
						arg_13_1:RecordAudio("116361003", var_16_19)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_116361", "116361003", "story_v_out_116361.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_116361", "116361003", "story_v_out_116361.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_20 = math.max(var_16_11, arg_13_1.talkMaxDuration)

			if var_16_10 <= arg_13_1.time_ and arg_13_1.time_ < var_16_10 + var_16_20 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_10) / var_16_20

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_10 + var_16_20 and arg_13_1.time_ < var_16_10 + var_16_20 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play116361004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 116361004
		arg_17_1.duration_ = 6.633

		local var_17_0 = {
			zh = 3.733,
			ja = 6.633
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
				arg_17_0:Play116361005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["10032ui_story"].transform
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1.var_.moveOldPos10032ui_story = var_20_0.localPosition
			end

			local var_20_2 = 0.001

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2
				local var_20_4 = Vector3.New(0, -1.1, -5.9)

				var_20_0.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos10032ui_story, var_20_4, var_20_3)

				local var_20_5 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_5.x, var_20_5.y, var_20_5.z)

				local var_20_6 = var_20_0.localEulerAngles

				var_20_6.z = 0
				var_20_6.x = 0
				var_20_0.localEulerAngles = var_20_6
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 then
				var_20_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_20_7 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_7.x, var_20_7.y, var_20_7.z)

				local var_20_8 = var_20_0.localEulerAngles

				var_20_8.z = 0
				var_20_8.x = 0
				var_20_0.localEulerAngles = var_20_8
			end

			local var_20_9 = 0

			if var_20_9 < arg_17_1.time_ and arg_17_1.time_ <= var_20_9 + arg_20_0 then
				arg_17_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_20_10 = 0

			if var_20_10 < arg_17_1.time_ and arg_17_1.time_ <= var_20_10 + arg_20_0 then
				arg_17_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025actionlink/10025action447")
			end

			local var_20_11 = 0
			local var_20_12 = 0.25

			if var_20_11 < arg_17_1.time_ and arg_17_1.time_ <= var_20_11 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_13 = arg_17_1:FormatText(StoryNameCfg[328].name)

				arg_17_1.leftNameTxt_.text = var_20_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_14 = arg_17_1:GetWordFromCfg(116361004)
				local var_20_15 = arg_17_1:FormatText(var_20_14.content)

				arg_17_1.text_.text = var_20_15

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_16 = 10
				local var_20_17 = utf8.len(var_20_15)
				local var_20_18 = var_20_16 <= 0 and var_20_12 or var_20_12 * (var_20_17 / var_20_16)

				if var_20_18 > 0 and var_20_12 < var_20_18 then
					arg_17_1.talkMaxDuration = var_20_18

					if var_20_18 + var_20_11 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_18 + var_20_11
					end
				end

				arg_17_1.text_.text = var_20_15
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361004", "story_v_out_116361.awb") ~= 0 then
					local var_20_19 = manager.audio:GetVoiceLength("story_v_out_116361", "116361004", "story_v_out_116361.awb") / 1000

					if var_20_19 + var_20_11 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_19 + var_20_11
					end

					if var_20_14.prefab_name ~= "" and arg_17_1.actors_[var_20_14.prefab_name] ~= nil then
						local var_20_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_14.prefab_name].transform, "story_v_out_116361", "116361004", "story_v_out_116361.awb")

						arg_17_1:RecordAudio("116361004", var_20_20)
						arg_17_1:RecordAudio("116361004", var_20_20)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_116361", "116361004", "story_v_out_116361.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_116361", "116361004", "story_v_out_116361.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_21 = math.max(var_20_12, arg_17_1.talkMaxDuration)

			if var_20_11 <= arg_17_1.time_ and arg_17_1.time_ < var_20_11 + var_20_21 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_11) / var_20_21

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_11 + var_20_21 and arg_17_1.time_ < var_20_11 + var_20_21 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play116361005 = function(arg_21_0, arg_21_1)
		arg_21_1.marker = "Mark2"
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 116361005
		arg_21_1.duration_ = 12.6866666666667

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			arg_21_1.marker = ""

			if arg_23_0 == 1 then
				arg_21_0:Play116361006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = "ST15"

			if arg_21_1.bgs_[var_24_0] == nil then
				local var_24_1 = Object.Instantiate(arg_21_1.paintGo_)

				var_24_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_24_0)
				var_24_1.name = var_24_0
				var_24_1.transform.parent = arg_21_1.stage_.transform
				var_24_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_21_1.bgs_[var_24_0] = var_24_1
			end

			local var_24_2 = 5.68666666666667

			if var_24_2 < arg_21_1.time_ and arg_21_1.time_ <= var_24_2 + arg_24_0 then
				local var_24_3 = manager.ui.mainCamera.transform.localPosition
				local var_24_4 = Vector3.New(0, 0, 10) + Vector3.New(var_24_3.x, var_24_3.y, 0)
				local var_24_5 = arg_21_1.bgs_.ST15

				var_24_5.transform.localPosition = var_24_4
				var_24_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_24_6 = var_24_5:GetComponent("SpriteRenderer")

				if var_24_6 and var_24_6.sprite then
					local var_24_7 = (var_24_5.transform.localPosition - var_24_3).z
					local var_24_8 = manager.ui.mainCameraCom_
					local var_24_9 = 2 * var_24_7 * Mathf.Tan(var_24_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_24_10 = var_24_9 * var_24_8.aspect
					local var_24_11 = var_24_6.sprite.bounds.size.x
					local var_24_12 = var_24_6.sprite.bounds.size.y
					local var_24_13 = var_24_10 / var_24_11
					local var_24_14 = var_24_9 / var_24_12
					local var_24_15 = var_24_14 < var_24_13 and var_24_13 or var_24_14

					var_24_5.transform.localScale = Vector3.New(var_24_15, var_24_15, 0)
				end

				for iter_24_0, iter_24_1 in pairs(arg_21_1.bgs_) do
					if iter_24_0 ~= "ST15" then
						iter_24_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_24_16 = 5.68666666666667

			if var_24_16 < arg_21_1.time_ and arg_21_1.time_ <= var_24_16 + arg_24_0 then
				arg_21_1.mask_.enabled = true
				arg_21_1.mask_.raycastTarget = true

				arg_21_1:SetGaussion(false)
			end

			local var_24_17 = 2

			if var_24_16 <= arg_21_1.time_ and arg_21_1.time_ < var_24_16 + var_24_17 then
				local var_24_18 = (arg_21_1.time_ - var_24_16) / var_24_17
				local var_24_19 = Color.New(0, 0, 0)

				var_24_19.a = Mathf.Lerp(1, 0, var_24_18)
				arg_21_1.mask_.color = var_24_19
			end

			if arg_21_1.time_ >= var_24_16 + var_24_17 and arg_21_1.time_ < var_24_16 + var_24_17 + arg_24_0 then
				local var_24_20 = Color.New(0, 0, 0)
				local var_24_21 = 0

				arg_21_1.mask_.enabled = false
				var_24_20.a = var_24_21
				arg_21_1.mask_.color = var_24_20
			end

			local var_24_22 = 2

			if var_24_22 < arg_21_1.time_ and arg_21_1.time_ <= var_24_22 + arg_24_0 then
				SetActive(arg_21_1.dialog_, false)
				SetActive(arg_21_1.allBtn_.gameObject, false)
				arg_21_1.hideBtnsController_:SetSelectedIndex(1)

				arg_21_1.marker = "PlayCantSkipVideo"

				manager.video:Play("SofdecAsset/story/story_101161201.usm", function(arg_25_0)
					arg_21_1.time_ = var_24_22 + 3.66000000022352

					if arg_21_1.state_ == "pause" then
						arg_21_1.state_ = "playing"
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_26_0)
					if arg_26_0 then
						arg_21_1.state_ = "pause"
					else
						arg_21_1.state_ = "playing"
					end
				end)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_24_23 = 3.67

			if var_24_22 <= arg_21_1.time_ and arg_21_1.time_ < var_24_22 + var_24_23 then
				-- block empty
			end

			if arg_21_1.time_ >= var_24_22 + var_24_23 and arg_21_1.time_ < var_24_22 + var_24_23 + arg_24_0 then
				arg_21_1.marker = ""
			end

			local var_24_24 = 5.67

			if var_24_24 < arg_21_1.time_ and arg_21_1.time_ <= var_24_24 + arg_24_0 then
				SetActive(arg_21_1.dialog_, false)
				SetActive(arg_21_1.allBtn_.gameObject, true)
				arg_21_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_24_25 = 0.0166666666666667

			if var_24_24 <= arg_21_1.time_ and arg_21_1.time_ < var_24_24 + var_24_25 then
				-- block empty
			end

			if arg_21_1.time_ >= var_24_24 + var_24_25 and arg_21_1.time_ < var_24_24 + var_24_25 + arg_24_0 then
				-- block empty
			end

			local var_24_26 = arg_21_1.actors_["10032ui_story"].transform
			local var_24_27 = 1.966

			if var_24_27 < arg_21_1.time_ and arg_21_1.time_ <= var_24_27 + arg_24_0 then
				arg_21_1.var_.moveOldPos10032ui_story = var_24_26.localPosition
			end

			local var_24_28 = 0.001

			if var_24_27 <= arg_21_1.time_ and arg_21_1.time_ < var_24_27 + var_24_28 then
				local var_24_29 = (arg_21_1.time_ - var_24_27) / var_24_28
				local var_24_30 = Vector3.New(0, 100, 0)

				var_24_26.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos10032ui_story, var_24_30, var_24_29)

				local var_24_31 = manager.ui.mainCamera.transform.position - var_24_26.position

				var_24_26.forward = Vector3.New(var_24_31.x, var_24_31.y, var_24_31.z)

				local var_24_32 = var_24_26.localEulerAngles

				var_24_32.z = 0
				var_24_32.x = 0
				var_24_26.localEulerAngles = var_24_32
			end

			if arg_21_1.time_ >= var_24_27 + var_24_28 and arg_21_1.time_ < var_24_27 + var_24_28 + arg_24_0 then
				var_24_26.localPosition = Vector3.New(0, 100, 0)

				local var_24_33 = manager.ui.mainCamera.transform.position - var_24_26.position

				var_24_26.forward = Vector3.New(var_24_33.x, var_24_33.y, var_24_33.z)

				local var_24_34 = var_24_26.localEulerAngles

				var_24_34.z = 0
				var_24_34.x = 0
				var_24_26.localEulerAngles = var_24_34
			end

			local var_24_35 = 2.034
			local var_24_36 = 0.666666666666667

			if var_24_35 < arg_21_1.time_ and arg_21_1.time_ <= var_24_35 + arg_24_0 then
				local var_24_37 = "play"
				local var_24_38 = "music"

				arg_21_1:AudioAction(var_24_37, var_24_38, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_24_39 = 7.68666666666667
			local var_24_40 = 0.483333333333333

			if var_24_39 < arg_21_1.time_ and arg_21_1.time_ <= var_24_39 + arg_24_0 then
				local var_24_41 = "play"
				local var_24_42 = "music"

				arg_21_1:AudioAction(var_24_41, var_24_42, "bgm_side_daily05", "bgm_side_daily05", "bgm_side_daily05.awb")
			end

			local var_24_43 = 0

			if var_24_43 < arg_21_1.time_ and arg_21_1.time_ <= var_24_43 + arg_24_0 then
				arg_21_1.mask_.enabled = true
				arg_21_1.mask_.raycastTarget = true

				arg_21_1:SetGaussion(false)
			end

			local var_24_44 = 2

			if var_24_43 <= arg_21_1.time_ and arg_21_1.time_ < var_24_43 + var_24_44 then
				local var_24_45 = (arg_21_1.time_ - var_24_43) / var_24_44
				local var_24_46 = Color.New(0, 0, 0)

				var_24_46.a = Mathf.Lerp(0, 1, var_24_45)
				arg_21_1.mask_.color = var_24_46
			end

			if arg_21_1.time_ >= var_24_43 + var_24_44 and arg_21_1.time_ < var_24_43 + var_24_44 + arg_24_0 then
				local var_24_47 = Color.New(0, 0, 0)

				var_24_47.a = 1
				arg_21_1.mask_.color = var_24_47
			end

			local var_24_48 = 2

			if var_24_48 < arg_21_1.time_ and arg_21_1.time_ <= var_24_48 + arg_24_0 then
				arg_21_1.mask_.enabled = true
				arg_21_1.mask_.raycastTarget = true

				arg_21_1:SetGaussion(false)
			end

			local var_24_49 = 0.0166666666666667

			if var_24_48 <= arg_21_1.time_ and arg_21_1.time_ < var_24_48 + var_24_49 then
				local var_24_50 = (arg_21_1.time_ - var_24_48) / var_24_49
				local var_24_51 = Color.New(0, 0, 0)

				var_24_51.a = Mathf.Lerp(1, 0, var_24_50)
				arg_21_1.mask_.color = var_24_51
			end

			if arg_21_1.time_ >= var_24_48 + var_24_49 and arg_21_1.time_ < var_24_48 + var_24_49 + arg_24_0 then
				local var_24_52 = Color.New(0, 0, 0)
				local var_24_53 = 0

				arg_21_1.mask_.enabled = false
				var_24_52.a = var_24_53
				arg_21_1.mask_.color = var_24_52
			end

			if arg_21_1.frameCnt_ <= 1 then
				arg_21_1.dialog_:SetActive(false)
			end

			local var_24_54 = 7.68666666666667
			local var_24_55 = 0.5

			if var_24_54 < arg_21_1.time_ and arg_21_1.time_ <= var_24_54 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				arg_21_1.dialog_:SetActive(true)

				local var_24_56 = LeanTween.value(arg_21_1.dialog_, 0, 1, 0.3)

				var_24_56:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_21_1.dialogCg_.alpha = arg_27_0
				end))
				var_24_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_21_1.dialog_)
					var_24_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_21_1.duration_ = arg_21_1.duration_ + 0.3

				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_57 = arg_21_1:FormatText(StoryNameCfg[344].name)

				arg_21_1.leftNameTxt_.text = var_24_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_58 = arg_21_1:GetWordFromCfg(116361005)
				local var_24_59 = arg_21_1:FormatText(var_24_58.content)

				arg_21_1.text_.text = var_24_59

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_60 = 20
				local var_24_61 = utf8.len(var_24_59)
				local var_24_62 = var_24_60 <= 0 and var_24_55 or var_24_55 * (var_24_61 / var_24_60)

				if var_24_62 > 0 and var_24_55 < var_24_62 then
					arg_21_1.talkMaxDuration = var_24_62
					var_24_54 = var_24_54 + 0.3

					if var_24_62 + var_24_54 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_62 + var_24_54
					end
				end

				arg_21_1.text_.text = var_24_59
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_63 = var_24_54 + 0.3
			local var_24_64 = math.max(var_24_55, arg_21_1.talkMaxDuration)

			if var_24_63 <= arg_21_1.time_ and arg_21_1.time_ < var_24_63 + var_24_64 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_63) / var_24_64

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_63 + var_24_64 and arg_21_1.time_ < var_24_63 + var_24_64 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play116361006 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 116361006
		arg_29_1.duration_ = 6.033

		local var_29_0 = {
			zh = 4.933,
			ja = 6.033
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
				arg_29_0:Play116361007(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "10025ui_story"

			if arg_29_1.actors_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(Asset.Load("Char/" .. var_32_0), arg_29_1.stage_.transform)

				var_32_1.name = var_32_0
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_0] = var_32_1

				local var_32_2 = var_32_1:GetComponentInChildren(typeof(CharacterEffect))

				var_32_2.enabled = true

				local var_32_3 = GameObjectTools.GetOrAddComponent(var_32_1, typeof(DynamicBoneHelper))

				if var_32_3 then
					var_32_3:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_2.transform, false)

				arg_29_1.var_[var_32_0 .. "Animator"] = var_32_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_0 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_0 .. "LipSync"] = var_32_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_4 = arg_29_1.actors_["10025ui_story"].transform
			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 then
				arg_29_1.var_.moveOldPos10025ui_story = var_32_4.localPosition
			end

			local var_32_6 = 0.001

			if var_32_5 <= arg_29_1.time_ and arg_29_1.time_ < var_32_5 + var_32_6 then
				local var_32_7 = (arg_29_1.time_ - var_32_5) / var_32_6
				local var_32_8 = Vector3.New(0, -1.1, -5.9)

				var_32_4.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos10025ui_story, var_32_8, var_32_7)

				local var_32_9 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_9.x, var_32_9.y, var_32_9.z)

				local var_32_10 = var_32_4.localEulerAngles

				var_32_10.z = 0
				var_32_10.x = 0
				var_32_4.localEulerAngles = var_32_10
			end

			if arg_29_1.time_ >= var_32_5 + var_32_6 and arg_29_1.time_ < var_32_5 + var_32_6 + arg_32_0 then
				var_32_4.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_32_11 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_11.x, var_32_11.y, var_32_11.z)

				local var_32_12 = var_32_4.localEulerAngles

				var_32_12.z = 0
				var_32_12.x = 0
				var_32_4.localEulerAngles = var_32_12
			end

			local var_32_13 = 0

			if var_32_13 < arg_29_1.time_ and arg_29_1.time_ <= var_32_13 + arg_32_0 then
				arg_29_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action5_1")
			end

			local var_32_15 = arg_29_1.actors_["10025ui_story"]
			local var_32_16 = 0

			if var_32_16 < arg_29_1.time_ and arg_29_1.time_ <= var_32_16 + arg_32_0 and arg_29_1.var_.characterEffect10025ui_story == nil then
				arg_29_1.var_.characterEffect10025ui_story = var_32_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_17 = 0.2

			if var_32_16 <= arg_29_1.time_ and arg_29_1.time_ < var_32_16 + var_32_17 then
				local var_32_18 = (arg_29_1.time_ - var_32_16) / var_32_17

				if arg_29_1.var_.characterEffect10025ui_story then
					arg_29_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_16 + var_32_17 and arg_29_1.time_ < var_32_16 + var_32_17 + arg_32_0 and arg_29_1.var_.characterEffect10025ui_story then
				arg_29_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_32_19 = 0
			local var_32_20 = 0.35

			if var_32_19 < arg_29_1.time_ and arg_29_1.time_ <= var_32_19 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_21 = arg_29_1:FormatText(StoryNameCfg[328].name)

				arg_29_1.leftNameTxt_.text = var_32_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_22 = arg_29_1:GetWordFromCfg(116361006)
				local var_32_23 = arg_29_1:FormatText(var_32_22.content)

				arg_29_1.text_.text = var_32_23

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_24 = 14
				local var_32_25 = utf8.len(var_32_23)
				local var_32_26 = var_32_24 <= 0 and var_32_20 or var_32_20 * (var_32_25 / var_32_24)

				if var_32_26 > 0 and var_32_20 < var_32_26 then
					arg_29_1.talkMaxDuration = var_32_26

					if var_32_26 + var_32_19 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_26 + var_32_19
					end
				end

				arg_29_1.text_.text = var_32_23
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361006", "story_v_out_116361.awb") ~= 0 then
					local var_32_27 = manager.audio:GetVoiceLength("story_v_out_116361", "116361006", "story_v_out_116361.awb") / 1000

					if var_32_27 + var_32_19 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_27 + var_32_19
					end

					if var_32_22.prefab_name ~= "" and arg_29_1.actors_[var_32_22.prefab_name] ~= nil then
						local var_32_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_22.prefab_name].transform, "story_v_out_116361", "116361006", "story_v_out_116361.awb")

						arg_29_1:RecordAudio("116361006", var_32_28)
						arg_29_1:RecordAudio("116361006", var_32_28)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_116361", "116361006", "story_v_out_116361.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_116361", "116361006", "story_v_out_116361.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_29 = math.max(var_32_20, arg_29_1.talkMaxDuration)

			if var_32_19 <= arg_29_1.time_ and arg_29_1.time_ < var_32_19 + var_32_29 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_19) / var_32_29

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_19 + var_32_29 and arg_29_1.time_ < var_32_19 + var_32_29 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play116361007 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 116361007
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play116361008(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["10025ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect10025ui_story == nil then
				arg_33_1.var_.characterEffect10025ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.2

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect10025ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_33_1.var_.characterEffect10025ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect10025ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_33_1.var_.characterEffect10025ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 1.05

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[344].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(116361007)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 42
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_14 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_14 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_14

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_14 and arg_33_1.time_ < var_36_6 + var_36_14 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play116361008 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 116361008
		arg_37_1.duration_ = 3.4

		local var_37_0 = {
			zh = 3.4,
			ja = 3.2
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
				arg_37_0:Play116361009(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["10025ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos10025ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(0, -1.1, -5.9)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos10025ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = 0

			if var_40_9 < arg_37_1.time_ and arg_37_1.time_ <= var_40_9 + arg_40_0 then
				arg_37_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 then
				arg_37_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action5_2")
			end

			local var_40_11 = arg_37_1.actors_["10025ui_story"]
			local var_40_12 = 0

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 and arg_37_1.var_.characterEffect10025ui_story == nil then
				arg_37_1.var_.characterEffect10025ui_story = var_40_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_13 = 0.2

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_13 then
				local var_40_14 = (arg_37_1.time_ - var_40_12) / var_40_13

				if arg_37_1.var_.characterEffect10025ui_story then
					arg_37_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_12 + var_40_13 and arg_37_1.time_ < var_40_12 + var_40_13 + arg_40_0 and arg_37_1.var_.characterEffect10025ui_story then
				arg_37_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_40_15 = 0
			local var_40_16 = 0.225

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_17 = arg_37_1:FormatText(StoryNameCfg[328].name)

				arg_37_1.leftNameTxt_.text = var_40_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_18 = arg_37_1:GetWordFromCfg(116361008)
				local var_40_19 = arg_37_1:FormatText(var_40_18.content)

				arg_37_1.text_.text = var_40_19

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_20 = 9
				local var_40_21 = utf8.len(var_40_19)
				local var_40_22 = var_40_20 <= 0 and var_40_16 or var_40_16 * (var_40_21 / var_40_20)

				if var_40_22 > 0 and var_40_16 < var_40_22 then
					arg_37_1.talkMaxDuration = var_40_22

					if var_40_22 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_22 + var_40_15
					end
				end

				arg_37_1.text_.text = var_40_19
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361008", "story_v_out_116361.awb") ~= 0 then
					local var_40_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361008", "story_v_out_116361.awb") / 1000

					if var_40_23 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_23 + var_40_15
					end

					if var_40_18.prefab_name ~= "" and arg_37_1.actors_[var_40_18.prefab_name] ~= nil then
						local var_40_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_18.prefab_name].transform, "story_v_out_116361", "116361008", "story_v_out_116361.awb")

						arg_37_1:RecordAudio("116361008", var_40_24)
						arg_37_1:RecordAudio("116361008", var_40_24)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_116361", "116361008", "story_v_out_116361.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_116361", "116361008", "story_v_out_116361.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_25 = math.max(var_40_16, arg_37_1.talkMaxDuration)

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_25 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_15) / var_40_25

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_15 + var_40_25 and arg_37_1.time_ < var_40_15 + var_40_25 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play116361009 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 116361009
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play116361010(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10025ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect10025ui_story == nil then
				arg_41_1.var_.characterEffect10025ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect10025ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_41_1.var_.characterEffect10025ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect10025ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_41_1.var_.characterEffect10025ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0
			local var_44_7 = 1.475

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_8 = arg_41_1:FormatText(StoryNameCfg[344].name)

				arg_41_1.leftNameTxt_.text = var_44_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_9 = arg_41_1:GetWordFromCfg(116361009)
				local var_44_10 = arg_41_1:FormatText(var_44_9.content)

				arg_41_1.text_.text = var_44_10

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_11 = 59
				local var_44_12 = utf8.len(var_44_10)
				local var_44_13 = var_44_11 <= 0 and var_44_7 or var_44_7 * (var_44_12 / var_44_11)

				if var_44_13 > 0 and var_44_7 < var_44_13 then
					arg_41_1.talkMaxDuration = var_44_13

					if var_44_13 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_13 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_10
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_14 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_14 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_14

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_14 and arg_41_1.time_ < var_44_6 + var_44_14 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play116361010 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 116361010
		arg_45_1.duration_ = 7.6

		local var_45_0 = {
			zh = 6.966,
			ja = 7.6
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
				arg_45_0:Play116361011(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10025ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos10025ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, -1.1, -5.9)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10025ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = 0

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 then
				arg_45_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_48_10 = arg_45_1.actors_["10025ui_story"]
			local var_48_11 = 0

			if var_48_11 < arg_45_1.time_ and arg_45_1.time_ <= var_48_11 + arg_48_0 and arg_45_1.var_.characterEffect10025ui_story == nil then
				arg_45_1.var_.characterEffect10025ui_story = var_48_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_12 = 0.2

			if var_48_11 <= arg_45_1.time_ and arg_45_1.time_ < var_48_11 + var_48_12 then
				local var_48_13 = (arg_45_1.time_ - var_48_11) / var_48_12

				if arg_45_1.var_.characterEffect10025ui_story then
					arg_45_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_11 + var_48_12 and arg_45_1.time_ < var_48_11 + var_48_12 + arg_48_0 and arg_45_1.var_.characterEffect10025ui_story then
				arg_45_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_48_15 = 0
			local var_48_16 = 0.575

			if var_48_15 < arg_45_1.time_ and arg_45_1.time_ <= var_48_15 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_17 = arg_45_1:FormatText(StoryNameCfg[328].name)

				arg_45_1.leftNameTxt_.text = var_48_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_18 = arg_45_1:GetWordFromCfg(116361010)
				local var_48_19 = arg_45_1:FormatText(var_48_18.content)

				arg_45_1.text_.text = var_48_19

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_20 = 23
				local var_48_21 = utf8.len(var_48_19)
				local var_48_22 = var_48_20 <= 0 and var_48_16 or var_48_16 * (var_48_21 / var_48_20)

				if var_48_22 > 0 and var_48_16 < var_48_22 then
					arg_45_1.talkMaxDuration = var_48_22

					if var_48_22 + var_48_15 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_22 + var_48_15
					end
				end

				arg_45_1.text_.text = var_48_19
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361010", "story_v_out_116361.awb") ~= 0 then
					local var_48_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361010", "story_v_out_116361.awb") / 1000

					if var_48_23 + var_48_15 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_23 + var_48_15
					end

					if var_48_18.prefab_name ~= "" and arg_45_1.actors_[var_48_18.prefab_name] ~= nil then
						local var_48_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_18.prefab_name].transform, "story_v_out_116361", "116361010", "story_v_out_116361.awb")

						arg_45_1:RecordAudio("116361010", var_48_24)
						arg_45_1:RecordAudio("116361010", var_48_24)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_116361", "116361010", "story_v_out_116361.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_116361", "116361010", "story_v_out_116361.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_25 = math.max(var_48_16, arg_45_1.talkMaxDuration)

			if var_48_15 <= arg_45_1.time_ and arg_45_1.time_ < var_48_15 + var_48_25 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_15) / var_48_25

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_15 + var_48_25 and arg_45_1.time_ < var_48_15 + var_48_25 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play116361011 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 116361011
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play116361012(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10025ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect10025ui_story == nil then
				arg_49_1.var_.characterEffect10025ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.2

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect10025ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_49_1.var_.characterEffect10025ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect10025ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_49_1.var_.characterEffect10025ui_story.fillRatio = var_52_5
			end

			local var_52_6 = 0
			local var_52_7 = 0.525

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_8 = arg_49_1:FormatText(StoryNameCfg[344].name)

				arg_49_1.leftNameTxt_.text = var_52_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_9 = arg_49_1:GetWordFromCfg(116361011)
				local var_52_10 = arg_49_1:FormatText(var_52_9.content)

				arg_49_1.text_.text = var_52_10

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_11 = 21
				local var_52_12 = utf8.len(var_52_10)
				local var_52_13 = var_52_11 <= 0 and var_52_7 or var_52_7 * (var_52_12 / var_52_11)

				if var_52_13 > 0 and var_52_7 < var_52_13 then
					arg_49_1.talkMaxDuration = var_52_13

					if var_52_13 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_13 + var_52_6
					end
				end

				arg_49_1.text_.text = var_52_10
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_14 = math.max(var_52_7, arg_49_1.talkMaxDuration)

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_14 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_6) / var_52_14

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_6 + var_52_14 and arg_49_1.time_ < var_52_6 + var_52_14 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play116361012 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 116361012
		arg_53_1.duration_ = 2.699999999999

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play116361013(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10025ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos10025ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0, -1.1, -5.9)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos10025ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = 0

			if var_56_9 < arg_53_1.time_ and arg_53_1.time_ <= var_56_9 + arg_56_0 then
				arg_53_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_10 = arg_53_1.actors_["10025ui_story"]
			local var_56_11 = 0

			if var_56_11 < arg_53_1.time_ and arg_53_1.time_ <= var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect10025ui_story == nil then
				arg_53_1.var_.characterEffect10025ui_story = var_56_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_12 = 0.2

			if var_56_11 <= arg_53_1.time_ and arg_53_1.time_ < var_56_11 + var_56_12 then
				local var_56_13 = (arg_53_1.time_ - var_56_11) / var_56_12

				if arg_53_1.var_.characterEffect10025ui_story then
					arg_53_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_11 + var_56_12 and arg_53_1.time_ < var_56_11 + var_56_12 + arg_56_0 and arg_53_1.var_.characterEffect10025ui_story then
				arg_53_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_56_14 = 0

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 then
				arg_53_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_2")
			end

			local var_56_15 = 0
			local var_56_16 = 0.075

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_17 = arg_53_1:FormatText(StoryNameCfg[328].name)

				arg_53_1.leftNameTxt_.text = var_56_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_18 = arg_53_1:GetWordFromCfg(116361012)
				local var_56_19 = arg_53_1:FormatText(var_56_18.content)

				arg_53_1.text_.text = var_56_19

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_20 = 3
				local var_56_21 = utf8.len(var_56_19)
				local var_56_22 = var_56_20 <= 0 and var_56_16 or var_56_16 * (var_56_21 / var_56_20)

				if var_56_22 > 0 and var_56_16 < var_56_22 then
					arg_53_1.talkMaxDuration = var_56_22

					if var_56_22 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_22 + var_56_15
					end
				end

				arg_53_1.text_.text = var_56_19
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361012", "story_v_out_116361.awb") ~= 0 then
					local var_56_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361012", "story_v_out_116361.awb") / 1000

					if var_56_23 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_15
					end

					if var_56_18.prefab_name ~= "" and arg_53_1.actors_[var_56_18.prefab_name] ~= nil then
						local var_56_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_18.prefab_name].transform, "story_v_out_116361", "116361012", "story_v_out_116361.awb")

						arg_53_1:RecordAudio("116361012", var_56_24)
						arg_53_1:RecordAudio("116361012", var_56_24)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_116361", "116361012", "story_v_out_116361.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_116361", "116361012", "story_v_out_116361.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_25 = math.max(var_56_16, arg_53_1.talkMaxDuration)

			if var_56_15 <= arg_53_1.time_ and arg_53_1.time_ < var_56_15 + var_56_25 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_15) / var_56_25

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_15 + var_56_25 and arg_53_1.time_ < var_56_15 + var_56_25 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play116361013 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 116361013
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play116361014(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10025ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect10025ui_story == nil then
				arg_57_1.var_.characterEffect10025ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect10025ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_57_1.var_.characterEffect10025ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect10025ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_57_1.var_.characterEffect10025ui_story.fillRatio = var_60_5
			end

			local var_60_6 = 0
			local var_60_7 = 0.725

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_8 = arg_57_1:FormatText(StoryNameCfg[344].name)

				arg_57_1.leftNameTxt_.text = var_60_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_9 = arg_57_1:GetWordFromCfg(116361013)
				local var_60_10 = arg_57_1:FormatText(var_60_9.content)

				arg_57_1.text_.text = var_60_10

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_11 = 29
				local var_60_12 = utf8.len(var_60_10)
				local var_60_13 = var_60_11 <= 0 and var_60_7 or var_60_7 * (var_60_12 / var_60_11)

				if var_60_13 > 0 and var_60_7 < var_60_13 then
					arg_57_1.talkMaxDuration = var_60_13

					if var_60_13 + var_60_6 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_13 + var_60_6
					end
				end

				arg_57_1.text_.text = var_60_10
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_14 = math.max(var_60_7, arg_57_1.talkMaxDuration)

			if var_60_6 <= arg_57_1.time_ and arg_57_1.time_ < var_60_6 + var_60_14 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_6) / var_60_14

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_6 + var_60_14 and arg_57_1.time_ < var_60_6 + var_60_14 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play116361014 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 116361014
		arg_61_1.duration_ = 8.333

		local var_61_0 = {
			zh = 7.633,
			ja = 8.333
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
				arg_61_0:Play116361015(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10025ui_story"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos10025ui_story = var_64_0.localPosition
			end

			local var_64_2 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2
				local var_64_4 = Vector3.New(0, -1.1, -5.9)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10025ui_story, var_64_4, var_64_3)

				local var_64_5 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_5.x, var_64_5.y, var_64_5.z)

				local var_64_6 = var_64_0.localEulerAngles

				var_64_6.z = 0
				var_64_6.x = 0
				var_64_0.localEulerAngles = var_64_6
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_64_7 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_7.x, var_64_7.y, var_64_7.z)

				local var_64_8 = var_64_0.localEulerAngles

				var_64_8.z = 0
				var_64_8.x = 0
				var_64_0.localEulerAngles = var_64_8
			end

			local var_64_9 = 0

			if var_64_9 < arg_61_1.time_ and arg_61_1.time_ <= var_64_9 + arg_64_0 then
				arg_61_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_64_10 = arg_61_1.actors_["10025ui_story"]
			local var_64_11 = 0

			if var_64_11 < arg_61_1.time_ and arg_61_1.time_ <= var_64_11 + arg_64_0 and arg_61_1.var_.characterEffect10025ui_story == nil then
				arg_61_1.var_.characterEffect10025ui_story = var_64_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_12 = 0.2

			if var_64_11 <= arg_61_1.time_ and arg_61_1.time_ < var_64_11 + var_64_12 then
				local var_64_13 = (arg_61_1.time_ - var_64_11) / var_64_12

				if arg_61_1.var_.characterEffect10025ui_story then
					arg_61_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_11 + var_64_12 and arg_61_1.time_ < var_64_11 + var_64_12 + arg_64_0 and arg_61_1.var_.characterEffect10025ui_story then
				arg_61_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 then
				arg_61_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action2_1")
			end

			local var_64_15 = 0
			local var_64_16 = 0.675

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_17 = arg_61_1:FormatText(StoryNameCfg[328].name)

				arg_61_1.leftNameTxt_.text = var_64_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_18 = arg_61_1:GetWordFromCfg(116361014)
				local var_64_19 = arg_61_1:FormatText(var_64_18.content)

				arg_61_1.text_.text = var_64_19

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_20 = 27
				local var_64_21 = utf8.len(var_64_19)
				local var_64_22 = var_64_20 <= 0 and var_64_16 or var_64_16 * (var_64_21 / var_64_20)

				if var_64_22 > 0 and var_64_16 < var_64_22 then
					arg_61_1.talkMaxDuration = var_64_22

					if var_64_22 + var_64_15 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_22 + var_64_15
					end
				end

				arg_61_1.text_.text = var_64_19
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361014", "story_v_out_116361.awb") ~= 0 then
					local var_64_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361014", "story_v_out_116361.awb") / 1000

					if var_64_23 + var_64_15 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_23 + var_64_15
					end

					if var_64_18.prefab_name ~= "" and arg_61_1.actors_[var_64_18.prefab_name] ~= nil then
						local var_64_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_18.prefab_name].transform, "story_v_out_116361", "116361014", "story_v_out_116361.awb")

						arg_61_1:RecordAudio("116361014", var_64_24)
						arg_61_1:RecordAudio("116361014", var_64_24)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_116361", "116361014", "story_v_out_116361.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_116361", "116361014", "story_v_out_116361.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_25 = math.max(var_64_16, arg_61_1.talkMaxDuration)

			if var_64_15 <= arg_61_1.time_ and arg_61_1.time_ < var_64_15 + var_64_25 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_15) / var_64_25

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_15 + var_64_25 and arg_61_1.time_ < var_64_15 + var_64_25 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play116361015 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 116361015
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play116361016(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10025ui_story"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos10025ui_story = var_68_0.localPosition
			end

			local var_68_2 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2
				local var_68_4 = Vector3.New(0, 100, 0)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos10025ui_story, var_68_4, var_68_3)

				local var_68_5 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_5.x, var_68_5.y, var_68_5.z)

				local var_68_6 = var_68_0.localEulerAngles

				var_68_6.z = 0
				var_68_6.x = 0
				var_68_0.localEulerAngles = var_68_6
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, 100, 0)

				local var_68_7 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_7.x, var_68_7.y, var_68_7.z)

				local var_68_8 = var_68_0.localEulerAngles

				var_68_8.z = 0
				var_68_8.x = 0
				var_68_0.localEulerAngles = var_68_8
			end

			local var_68_9 = 0
			local var_68_10 = 0.225

			if var_68_9 < arg_65_1.time_ and arg_65_1.time_ <= var_68_9 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_11 = arg_65_1:FormatText(StoryNameCfg[344].name)

				arg_65_1.leftNameTxt_.text = var_68_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_12 = arg_65_1:GetWordFromCfg(116361015)
				local var_68_13 = arg_65_1:FormatText(var_68_12.content)

				arg_65_1.text_.text = var_68_13

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_14 = 9
				local var_68_15 = utf8.len(var_68_13)
				local var_68_16 = var_68_14 <= 0 and var_68_10 or var_68_10 * (var_68_15 / var_68_14)

				if var_68_16 > 0 and var_68_10 < var_68_16 then
					arg_65_1.talkMaxDuration = var_68_16

					if var_68_16 + var_68_9 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_16 + var_68_9
					end
				end

				arg_65_1.text_.text = var_68_13
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_17 = math.max(var_68_10, arg_65_1.talkMaxDuration)

			if var_68_9 <= arg_65_1.time_ and arg_65_1.time_ < var_68_9 + var_68_17 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_9) / var_68_17

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_9 + var_68_17 and arg_65_1.time_ < var_68_9 + var_68_17 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play116361016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 116361016
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play116361017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.9

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_2 = arg_69_1:GetWordFromCfg(116361016)
				local var_72_3 = arg_69_1:FormatText(var_72_2.content)

				arg_69_1.text_.text = var_72_3

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_4 = 36
				local var_72_5 = utf8.len(var_72_3)
				local var_72_6 = var_72_4 <= 0 and var_72_1 or var_72_1 * (var_72_5 / var_72_4)

				if var_72_6 > 0 and var_72_1 < var_72_6 then
					arg_69_1.talkMaxDuration = var_72_6

					if var_72_6 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_6 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_3
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_7 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_7 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_7

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_7 and arg_69_1.time_ < var_72_0 + var_72_7 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play116361017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 116361017
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play116361018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.975

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[344].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(116361017)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 39
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_8 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_8 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_8

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_8 and arg_73_1.time_ < var_76_0 + var_76_8 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play116361018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 116361018
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play116361019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.625

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[344].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(116361018)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 25
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_8 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_8 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_8

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_8 and arg_77_1.time_ < var_80_0 + var_80_8 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play116361019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 116361019
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play116361020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.725

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[344].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(116361019)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 29
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_8 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_8 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_8

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_8 and arg_81_1.time_ < var_84_0 + var_84_8 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play116361020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 116361020
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play116361021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.575

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

				local var_88_2 = arg_85_1:GetWordFromCfg(116361020)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 23
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
	Play116361021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 116361021
		arg_89_1.duration_ = 7

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play116361022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.mask_.enabled = true
				arg_89_1.mask_.raycastTarget = true

				arg_89_1:SetGaussion(false)
			end

			local var_92_1 = 2

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_1 then
				local var_92_2 = (arg_89_1.time_ - var_92_0) / var_92_1
				local var_92_3 = Color.New(1, 1, 1)

				var_92_3.a = Mathf.Lerp(1, 0, var_92_2)
				arg_89_1.mask_.color = var_92_3
			end

			if arg_89_1.time_ >= var_92_0 + var_92_1 and arg_89_1.time_ < var_92_0 + var_92_1 + arg_92_0 then
				local var_92_4 = Color.New(1, 1, 1)
				local var_92_5 = 0

				arg_89_1.mask_.enabled = false
				var_92_4.a = var_92_5
				arg_89_1.mask_.color = var_92_4
			end

			local var_92_6 = 0
			local var_92_7 = 1

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				local var_92_8 = "play"
				local var_92_9 = "effect"

				arg_89_1:AudioAction(var_92_8, var_92_9, "se_story_16", "se_story_16_camera", "")
			end

			if arg_89_1.frameCnt_ <= 1 then
				arg_89_1.dialog_:SetActive(false)
			end

			local var_92_10 = 2
			local var_92_11 = 0.1

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0

				arg_89_1.dialog_:SetActive(true)

				local var_92_12 = LeanTween.value(arg_89_1.dialog_, 0, 1, 0.3)

				var_92_12:setOnUpdate(LuaHelper.FloatAction(function(arg_93_0)
					arg_89_1.dialogCg_.alpha = arg_93_0
				end))
				var_92_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_89_1.dialog_)
					var_92_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_89_1.duration_ = arg_89_1.duration_ + 0.3

				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_13 = arg_89_1:GetWordFromCfg(116361021)
				local var_92_14 = arg_89_1:FormatText(var_92_13.content)

				arg_89_1.text_.text = var_92_14

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_15 = 4
				local var_92_16 = utf8.len(var_92_14)
				local var_92_17 = var_92_15 <= 0 and var_92_11 or var_92_11 * (var_92_16 / var_92_15)

				if var_92_17 > 0 and var_92_11 < var_92_17 then
					arg_89_1.talkMaxDuration = var_92_17
					var_92_10 = var_92_10 + 0.3

					if var_92_17 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_17 + var_92_10
					end
				end

				arg_89_1.text_.text = var_92_14
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_18 = var_92_10 + 0.3
			local var_92_19 = math.max(var_92_11, arg_89_1.talkMaxDuration)

			if var_92_18 <= arg_89_1.time_ and arg_89_1.time_ < var_92_18 + var_92_19 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_18) / var_92_19

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_18 + var_92_19 and arg_89_1.time_ < var_92_18 + var_92_19 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play116361022 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116361022
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play116361023(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.15

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[344].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(116361022)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 6
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_8 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_8 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_8

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_8 and arg_95_1.time_ < var_98_0 + var_98_8 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play116361023 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 116361023
		arg_99_1.duration_ = 5.566

		local var_99_0 = {
			zh = 5.566,
			ja = 4.133
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
				arg_99_0:Play116361024(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10025ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10025ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.1, -5.9)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10025ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = 0

			if var_102_9 < arg_99_1.time_ and arg_99_1.time_ <= var_102_9 + arg_102_0 then
				arg_99_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_102_10 = arg_99_1.actors_["10025ui_story"]
			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect10025ui_story == nil then
				arg_99_1.var_.characterEffect10025ui_story = var_102_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_12 = 0.2

			if var_102_11 <= arg_99_1.time_ and arg_99_1.time_ < var_102_11 + var_102_12 then
				local var_102_13 = (arg_99_1.time_ - var_102_11) / var_102_12

				if arg_99_1.var_.characterEffect10025ui_story then
					arg_99_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_11 + var_102_12 and arg_99_1.time_ < var_102_11 + var_102_12 + arg_102_0 and arg_99_1.var_.characterEffect10025ui_story then
				arg_99_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action5_1")
			end

			local var_102_15 = 0
			local var_102_16 = 0.55

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[328].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(116361023)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 22
				local var_102_21 = utf8.len(var_102_19)
				local var_102_22 = var_102_20 <= 0 and var_102_16 or var_102_16 * (var_102_21 / var_102_20)

				if var_102_22 > 0 and var_102_16 < var_102_22 then
					arg_99_1.talkMaxDuration = var_102_22

					if var_102_22 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_15
					end
				end

				arg_99_1.text_.text = var_102_19
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361023", "story_v_out_116361.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361023", "story_v_out_116361.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_out_116361", "116361023", "story_v_out_116361.awb")

						arg_99_1:RecordAudio("116361023", var_102_24)
						arg_99_1:RecordAudio("116361023", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_116361", "116361023", "story_v_out_116361.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_116361", "116361023", "story_v_out_116361.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_25 = math.max(var_102_16, arg_99_1.talkMaxDuration)

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_25 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_15) / var_102_25

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_15 + var_102_25 and arg_99_1.time_ < var_102_15 + var_102_25 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play116361024 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 116361024
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play116361025(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10025ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect10025ui_story == nil then
				arg_103_1.var_.characterEffect10025ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect10025ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10025ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect10025ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10025ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.375

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[344].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(116361024)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 15
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_14 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_14 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_14

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_14 and arg_103_1.time_ < var_106_6 + var_106_14 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play116361025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116361025
		arg_107_1.duration_ = 5

		local var_107_0 = {
			zh = 2.2,
			ja = 5
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
				arg_107_0:Play116361026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10025ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10025ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, -1.1, -5.9)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10025ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = 0

			if var_110_9 < arg_107_1.time_ and arg_107_1.time_ <= var_110_9 + arg_110_0 then
				arg_107_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_110_10 = arg_107_1.actors_["10025ui_story"]
			local var_110_11 = 0

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect10025ui_story == nil then
				arg_107_1.var_.characterEffect10025ui_story = var_110_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_12 = 0.2

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_12 then
				local var_110_13 = (arg_107_1.time_ - var_110_11) / var_110_12

				if arg_107_1.var_.characterEffect10025ui_story then
					arg_107_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_11 + var_110_12 and arg_107_1.time_ < var_110_11 + var_110_12 + arg_110_0 and arg_107_1.var_.characterEffect10025ui_story then
				arg_107_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_110_14 = 0
			local var_110_15 = 0.225

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_16 = arg_107_1:FormatText(StoryNameCfg[328].name)

				arg_107_1.leftNameTxt_.text = var_110_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_17 = arg_107_1:GetWordFromCfg(116361025)
				local var_110_18 = arg_107_1:FormatText(var_110_17.content)

				arg_107_1.text_.text = var_110_18

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_19 = 9
				local var_110_20 = utf8.len(var_110_18)
				local var_110_21 = var_110_19 <= 0 and var_110_15 or var_110_15 * (var_110_20 / var_110_19)

				if var_110_21 > 0 and var_110_15 < var_110_21 then
					arg_107_1.talkMaxDuration = var_110_21

					if var_110_21 + var_110_14 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_21 + var_110_14
					end
				end

				arg_107_1.text_.text = var_110_18
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361025", "story_v_out_116361.awb") ~= 0 then
					local var_110_22 = manager.audio:GetVoiceLength("story_v_out_116361", "116361025", "story_v_out_116361.awb") / 1000

					if var_110_22 + var_110_14 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_22 + var_110_14
					end

					if var_110_17.prefab_name ~= "" and arg_107_1.actors_[var_110_17.prefab_name] ~= nil then
						local var_110_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_17.prefab_name].transform, "story_v_out_116361", "116361025", "story_v_out_116361.awb")

						arg_107_1:RecordAudio("116361025", var_110_23)
						arg_107_1:RecordAudio("116361025", var_110_23)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_116361", "116361025", "story_v_out_116361.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_116361", "116361025", "story_v_out_116361.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_24 = math.max(var_110_15, arg_107_1.talkMaxDuration)

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_24 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_14) / var_110_24

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_14 + var_110_24 and arg_107_1.time_ < var_110_14 + var_110_24 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play116361026 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116361026
		arg_111_1.duration_ = 7

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play116361027(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = "STblack"

			if arg_111_1.bgs_[var_114_0] == nil then
				local var_114_1 = Object.Instantiate(arg_111_1.paintGo_)

				var_114_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_114_0)
				var_114_1.name = var_114_0
				var_114_1.transform.parent = arg_111_1.stage_.transform
				var_114_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.bgs_[var_114_0] = var_114_1
			end

			local var_114_2 = 0

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				local var_114_3 = manager.ui.mainCamera.transform.localPosition
				local var_114_4 = Vector3.New(0, 0, 10) + Vector3.New(var_114_3.x, var_114_3.y, 0)
				local var_114_5 = arg_111_1.bgs_.STblack

				var_114_5.transform.localPosition = var_114_4
				var_114_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_114_6 = var_114_5:GetComponent("SpriteRenderer")

				if var_114_6 and var_114_6.sprite then
					local var_114_7 = (var_114_5.transform.localPosition - var_114_3).z
					local var_114_8 = manager.ui.mainCameraCom_
					local var_114_9 = 2 * var_114_7 * Mathf.Tan(var_114_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_114_10 = var_114_9 * var_114_8.aspect
					local var_114_11 = var_114_6.sprite.bounds.size.x
					local var_114_12 = var_114_6.sprite.bounds.size.y
					local var_114_13 = var_114_10 / var_114_11
					local var_114_14 = var_114_9 / var_114_12
					local var_114_15 = var_114_14 < var_114_13 and var_114_13 or var_114_14

					var_114_5.transform.localScale = Vector3.New(var_114_15, var_114_15, 0)
				end

				for iter_114_0, iter_114_1 in pairs(arg_111_1.bgs_) do
					if iter_114_0 ~= "STblack" then
						iter_114_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_17 = 2

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Color.New(0, 0, 0)

				var_114_19.a = Mathf.Lerp(1, 0, var_114_18)
				arg_111_1.mask_.color = var_114_19
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				local var_114_20 = Color.New(0, 0, 0)
				local var_114_21 = 0

				arg_111_1.mask_.enabled = false
				var_114_20.a = var_114_21
				arg_111_1.mask_.color = var_114_20
			end

			local var_114_22 = arg_111_1.actors_["10025ui_story"].transform
			local var_114_23 = 0

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1.var_.moveOldPos10025ui_story = var_114_22.localPosition
			end

			local var_114_24 = 0.001

			if var_114_23 <= arg_111_1.time_ and arg_111_1.time_ < var_114_23 + var_114_24 then
				local var_114_25 = (arg_111_1.time_ - var_114_23) / var_114_24
				local var_114_26 = Vector3.New(0, 100, 0)

				var_114_22.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10025ui_story, var_114_26, var_114_25)

				local var_114_27 = manager.ui.mainCamera.transform.position - var_114_22.position

				var_114_22.forward = Vector3.New(var_114_27.x, var_114_27.y, var_114_27.z)

				local var_114_28 = var_114_22.localEulerAngles

				var_114_28.z = 0
				var_114_28.x = 0
				var_114_22.localEulerAngles = var_114_28
			end

			if arg_111_1.time_ >= var_114_23 + var_114_24 and arg_111_1.time_ < var_114_23 + var_114_24 + arg_114_0 then
				var_114_22.localPosition = Vector3.New(0, 100, 0)

				local var_114_29 = manager.ui.mainCamera.transform.position - var_114_22.position

				var_114_22.forward = Vector3.New(var_114_29.x, var_114_29.y, var_114_29.z)

				local var_114_30 = var_114_22.localEulerAngles

				var_114_30.z = 0
				var_114_30.x = 0
				var_114_22.localEulerAngles = var_114_30
			end

			local var_114_31 = 0
			local var_114_32 = 0.034

			if var_114_31 < arg_111_1.time_ and arg_111_1.time_ <= var_114_31 + arg_114_0 then
				local var_114_33 = "play"
				local var_114_34 = "music"

				arg_111_1:AudioAction(var_114_33, var_114_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_114_35 = 0.034
			local var_114_36 = 1

			if var_114_35 < arg_111_1.time_ and arg_111_1.time_ <= var_114_35 + arg_114_0 then
				local var_114_37 = "play"
				local var_114_38 = "music"

				arg_111_1:AudioAction(var_114_37, var_114_38, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			if arg_111_1.frameCnt_ <= 1 then
				arg_111_1.dialog_:SetActive(false)
			end

			local var_114_39 = 2
			local var_114_40 = 0.175

			if var_114_39 < arg_111_1.time_ and arg_111_1.time_ <= var_114_39 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				arg_111_1.dialog_:SetActive(true)

				local var_114_41 = LeanTween.value(arg_111_1.dialog_, 0, 1, 0.3)

				var_114_41:setOnUpdate(LuaHelper.FloatAction(function(arg_115_0)
					arg_111_1.dialogCg_.alpha = arg_115_0
				end))
				var_114_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_111_1.dialog_)
					var_114_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_111_1.duration_ = arg_111_1.duration_ + 0.3

				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_42 = arg_111_1:GetWordFromCfg(116361026)
				local var_114_43 = arg_111_1:FormatText(var_114_42.content)

				arg_111_1.text_.text = var_114_43

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_44 = 7
				local var_114_45 = utf8.len(var_114_43)
				local var_114_46 = var_114_44 <= 0 and var_114_40 or var_114_40 * (var_114_45 / var_114_44)

				if var_114_46 > 0 and var_114_40 < var_114_46 then
					arg_111_1.talkMaxDuration = var_114_46
					var_114_39 = var_114_39 + 0.3

					if var_114_46 + var_114_39 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_46 + var_114_39
					end
				end

				arg_111_1.text_.text = var_114_43
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_47 = var_114_39 + 0.3
			local var_114_48 = math.max(var_114_40, arg_111_1.talkMaxDuration)

			if var_114_47 <= arg_111_1.time_ and arg_111_1.time_ < var_114_47 + var_114_48 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_47) / var_114_48

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_47 + var_114_48 and arg_111_1.time_ < var_114_47 + var_114_48 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play116361027 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 116361027
		arg_117_1.duration_ = 7

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play116361028(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				local var_120_1 = manager.ui.mainCamera.transform.localPosition
				local var_120_2 = Vector3.New(0, 0, 10) + Vector3.New(var_120_1.x, var_120_1.y, 0)
				local var_120_3 = arg_117_1.bgs_.I07a

				var_120_3.transform.localPosition = var_120_2
				var_120_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_120_4 = var_120_3:GetComponent("SpriteRenderer")

				if var_120_4 and var_120_4.sprite then
					local var_120_5 = (var_120_3.transform.localPosition - var_120_1).z
					local var_120_6 = manager.ui.mainCameraCom_
					local var_120_7 = 2 * var_120_5 * Mathf.Tan(var_120_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_120_8 = var_120_7 * var_120_6.aspect
					local var_120_9 = var_120_4.sprite.bounds.size.x
					local var_120_10 = var_120_4.sprite.bounds.size.y
					local var_120_11 = var_120_8 / var_120_9
					local var_120_12 = var_120_7 / var_120_10
					local var_120_13 = var_120_12 < var_120_11 and var_120_11 or var_120_12

					var_120_3.transform.localScale = Vector3.New(var_120_13, var_120_13, 0)
				end

				for iter_120_0, iter_120_1 in pairs(arg_117_1.bgs_) do
					if iter_120_0 ~= "I07a" then
						iter_120_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = true

				arg_117_1:SetGaussion(false)
			end

			local var_120_15 = 2

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15
				local var_120_17 = Color.New(0, 0, 0)

				var_120_17.a = Mathf.Lerp(1, 0, var_120_16)
				arg_117_1.mask_.color = var_120_17
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 then
				local var_120_18 = Color.New(0, 0, 0)
				local var_120_19 = 0

				arg_117_1.mask_.enabled = false
				var_120_18.a = var_120_19
				arg_117_1.mask_.color = var_120_18
			end

			if arg_117_1.frameCnt_ <= 1 then
				arg_117_1.dialog_:SetActive(false)
			end

			local var_120_20 = 2
			local var_120_21 = 1.35

			if var_120_20 < arg_117_1.time_ and arg_117_1.time_ <= var_120_20 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				arg_117_1.dialog_:SetActive(true)

				local var_120_22 = LeanTween.value(arg_117_1.dialog_, 0, 1, 0.3)

				var_120_22:setOnUpdate(LuaHelper.FloatAction(function(arg_121_0)
					arg_117_1.dialogCg_.alpha = arg_121_0
				end))
				var_120_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_117_1.dialog_)
					var_120_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_117_1.duration_ = arg_117_1.duration_ + 0.3

				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_23 = arg_117_1:GetWordFromCfg(116361027)
				local var_120_24 = arg_117_1:FormatText(var_120_23.content)

				arg_117_1.text_.text = var_120_24

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_25 = 54
				local var_120_26 = utf8.len(var_120_24)
				local var_120_27 = var_120_25 <= 0 and var_120_21 or var_120_21 * (var_120_26 / var_120_25)

				if var_120_27 > 0 and var_120_21 < var_120_27 then
					arg_117_1.talkMaxDuration = var_120_27
					var_120_20 = var_120_20 + 0.3

					if var_120_27 + var_120_20 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_27 + var_120_20
					end
				end

				arg_117_1.text_.text = var_120_24
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_28 = var_120_20 + 0.3
			local var_120_29 = math.max(var_120_21, arg_117_1.talkMaxDuration)

			if var_120_28 <= arg_117_1.time_ and arg_117_1.time_ < var_120_28 + var_120_29 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_28) / var_120_29

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_28 + var_120_29 and arg_117_1.time_ < var_120_28 + var_120_29 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play116361028 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116361028
		arg_123_1.duration_ = 8.033

		local var_123_0 = {
			zh = 8.033,
			ja = 5.433
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
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play116361029(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10032ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos10032ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, -1.1, -5.9)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10032ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = 0

			if var_126_9 < arg_123_1.time_ and arg_123_1.time_ <= var_126_9 + arg_126_0 then
				arg_123_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_126_10 = arg_123_1.actors_["10032ui_story"]
			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect10032ui_story == nil then
				arg_123_1.var_.characterEffect10032ui_story = var_126_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_12 = 0.2

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_12 then
				local var_126_13 = (arg_123_1.time_ - var_126_11) / var_126_12

				if arg_123_1.var_.characterEffect10032ui_story then
					arg_123_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_11 + var_126_12 and arg_123_1.time_ < var_126_11 + var_126_12 + arg_126_0 and arg_123_1.var_.characterEffect10032ui_story then
				arg_123_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_126_15 = 0
			local var_126_16 = 0.625

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[328].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(116361028)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 25
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_16 or var_126_16 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_16 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361028", "story_v_out_116361.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361028", "story_v_out_116361.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_116361", "116361028", "story_v_out_116361.awb")

						arg_123_1:RecordAudio("116361028", var_126_24)
						arg_123_1:RecordAudio("116361028", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_116361", "116361028", "story_v_out_116361.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_116361", "116361028", "story_v_out_116361.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_25 and arg_123_1.time_ < var_126_15 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play116361029 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 116361029
		arg_127_1.duration_ = 11

		local var_127_0 = {
			zh = 11,
			ja = 8.2
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
				arg_127_0:Play116361030(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10032ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10032ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, -1.1, -5.9)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10032ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = 0

			if var_130_9 < arg_127_1.time_ and arg_127_1.time_ <= var_130_9 + arg_130_0 then
				arg_127_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_130_10 = 0
			local var_130_11 = 1

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_12 = arg_127_1:FormatText(StoryNameCfg[328].name)

				arg_127_1.leftNameTxt_.text = var_130_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_13 = arg_127_1:GetWordFromCfg(116361029)
				local var_130_14 = arg_127_1:FormatText(var_130_13.content)

				arg_127_1.text_.text = var_130_14

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_15 = 40
				local var_130_16 = utf8.len(var_130_14)
				local var_130_17 = var_130_15 <= 0 and var_130_11 or var_130_11 * (var_130_16 / var_130_15)

				if var_130_17 > 0 and var_130_11 < var_130_17 then
					arg_127_1.talkMaxDuration = var_130_17

					if var_130_17 + var_130_10 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_17 + var_130_10
					end
				end

				arg_127_1.text_.text = var_130_14
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361029", "story_v_out_116361.awb") ~= 0 then
					local var_130_18 = manager.audio:GetVoiceLength("story_v_out_116361", "116361029", "story_v_out_116361.awb") / 1000

					if var_130_18 + var_130_10 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_10
					end

					if var_130_13.prefab_name ~= "" and arg_127_1.actors_[var_130_13.prefab_name] ~= nil then
						local var_130_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_13.prefab_name].transform, "story_v_out_116361", "116361029", "story_v_out_116361.awb")

						arg_127_1:RecordAudio("116361029", var_130_19)
						arg_127_1:RecordAudio("116361029", var_130_19)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_116361", "116361029", "story_v_out_116361.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_116361", "116361029", "story_v_out_116361.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_20 = math.max(var_130_11, arg_127_1.talkMaxDuration)

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_20 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_10) / var_130_20

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_10 + var_130_20 and arg_127_1.time_ < var_130_10 + var_130_20 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play116361030 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 116361030
		arg_131_1.duration_ = 11.166

		local var_131_0 = {
			zh = 8.633,
			ja = 11.166
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
				arg_131_0:Play116361031(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10032ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10032ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, -1.1, -5.9)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10032ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = 0

			if var_134_9 < arg_131_1.time_ and arg_131_1.time_ <= var_134_9 + arg_134_0 then
				arg_131_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_134_10 = arg_131_1.actors_["10032ui_story"]
			local var_134_11 = 0

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect10032ui_story == nil then
				arg_131_1.var_.characterEffect10032ui_story = var_134_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_12 = 0.2

			if var_134_11 <= arg_131_1.time_ and arg_131_1.time_ < var_134_11 + var_134_12 then
				local var_134_13 = (arg_131_1.time_ - var_134_11) / var_134_12

				if arg_131_1.var_.characterEffect10032ui_story then
					arg_131_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_11 + var_134_12 and arg_131_1.time_ < var_134_11 + var_134_12 + arg_134_0 and arg_131_1.var_.characterEffect10032ui_story then
				arg_131_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025actionlink/10025action442")
			end

			local var_134_15 = 0
			local var_134_16 = 0.725

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_17 = arg_131_1:FormatText(StoryNameCfg[328].name)

				arg_131_1.leftNameTxt_.text = var_134_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_18 = arg_131_1:GetWordFromCfg(116361030)
				local var_134_19 = arg_131_1:FormatText(var_134_18.content)

				arg_131_1.text_.text = var_134_19

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_20 = 29
				local var_134_21 = utf8.len(var_134_19)
				local var_134_22 = var_134_20 <= 0 and var_134_16 or var_134_16 * (var_134_21 / var_134_20)

				if var_134_22 > 0 and var_134_16 < var_134_22 then
					arg_131_1.talkMaxDuration = var_134_22

					if var_134_22 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_15
					end
				end

				arg_131_1.text_.text = var_134_19
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361030", "story_v_out_116361.awb") ~= 0 then
					local var_134_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361030", "story_v_out_116361.awb") / 1000

					if var_134_23 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_23 + var_134_15
					end

					if var_134_18.prefab_name ~= "" and arg_131_1.actors_[var_134_18.prefab_name] ~= nil then
						local var_134_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_18.prefab_name].transform, "story_v_out_116361", "116361030", "story_v_out_116361.awb")

						arg_131_1:RecordAudio("116361030", var_134_24)
						arg_131_1:RecordAudio("116361030", var_134_24)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_116361", "116361030", "story_v_out_116361.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_116361", "116361030", "story_v_out_116361.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_25 = math.max(var_134_16, arg_131_1.talkMaxDuration)

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_15) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_15 + var_134_25 and arg_131_1.time_ < var_134_15 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play116361031 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 116361031
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play116361032(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10032ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos10032ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, 100, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10032ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, 100, 0)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = 0
			local var_138_10 = 0.725

			if var_138_9 < arg_135_1.time_ and arg_135_1.time_ <= var_138_9 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_11 = arg_135_1:GetWordFromCfg(116361031)
				local var_138_12 = arg_135_1:FormatText(var_138_11.content)

				arg_135_1.text_.text = var_138_12

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_13 = 29
				local var_138_14 = utf8.len(var_138_12)
				local var_138_15 = var_138_13 <= 0 and var_138_10 or var_138_10 * (var_138_14 / var_138_13)

				if var_138_15 > 0 and var_138_10 < var_138_15 then
					arg_135_1.talkMaxDuration = var_138_15

					if var_138_15 + var_138_9 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_15 + var_138_9
					end
				end

				arg_135_1.text_.text = var_138_12
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_16 = math.max(var_138_10, arg_135_1.talkMaxDuration)

			if var_138_9 <= arg_135_1.time_ and arg_135_1.time_ < var_138_9 + var_138_16 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_9) / var_138_16

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_9 + var_138_16 and arg_135_1.time_ < var_138_9 + var_138_16 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play116361032 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 116361032
		arg_139_1.duration_ = 5.8

		local var_139_0 = {
			zh = 4.2,
			ja = 5.8
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
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play116361033(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.375

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[328].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, true)
				arg_139_1.iconController_:SetSelectedState("hero")

				arg_139_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(116361032)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 15
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361032", "story_v_out_116361.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_116361", "116361032", "story_v_out_116361.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_116361", "116361032", "story_v_out_116361.awb")

						arg_139_1:RecordAudio("116361032", var_142_9)
						arg_139_1:RecordAudio("116361032", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_116361", "116361032", "story_v_out_116361.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_116361", "116361032", "story_v_out_116361.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play116361033 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 116361033
		arg_143_1.duration_ = 26.699999999999

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play116361034(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = "I05"

			if arg_143_1.bgs_[var_146_0] == nil then
				local var_146_1 = Object.Instantiate(arg_143_1.paintGo_)

				var_146_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_146_0)
				var_146_1.name = var_146_0
				var_146_1.transform.parent = arg_143_1.stage_.transform
				var_146_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_143_1.bgs_[var_146_0] = var_146_1
			end

			local var_146_2 = 12.6866666666667

			if var_146_2 < arg_143_1.time_ and arg_143_1.time_ <= var_146_2 + arg_146_0 then
				local var_146_3 = manager.ui.mainCamera.transform.localPosition
				local var_146_4 = Vector3.New(0, 0, 10) + Vector3.New(var_146_3.x, var_146_3.y, 0)
				local var_146_5 = arg_143_1.bgs_.I05

				var_146_5.transform.localPosition = var_146_4
				var_146_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_6 = var_146_5:GetComponent("SpriteRenderer")

				if var_146_6 and var_146_6.sprite then
					local var_146_7 = (var_146_5.transform.localPosition - var_146_3).z
					local var_146_8 = manager.ui.mainCameraCom_
					local var_146_9 = 2 * var_146_7 * Mathf.Tan(var_146_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_10 = var_146_9 * var_146_8.aspect
					local var_146_11 = var_146_6.sprite.bounds.size.x
					local var_146_12 = var_146_6.sprite.bounds.size.y
					local var_146_13 = var_146_10 / var_146_11
					local var_146_14 = var_146_9 / var_146_12
					local var_146_15 = var_146_14 < var_146_13 and var_146_13 or var_146_14

					var_146_5.transform.localScale = Vector3.New(var_146_15, var_146_15, 0)
				end

				for iter_146_0, iter_146_1 in pairs(arg_143_1.bgs_) do
					if iter_146_0 ~= "I05" then
						iter_146_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_146_16 = "ST03_blur"

			if arg_143_1.bgs_[var_146_16] == nil then
				local var_146_17 = Object.Instantiate(arg_143_1.paintGo_)

				var_146_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_146_16)
				var_146_17.name = var_146_16
				var_146_17.transform.parent = arg_143_1.stage_.transform
				var_146_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_143_1.bgs_[var_146_16] = var_146_17
			end

			local var_146_18 = 5.7

			if var_146_18 < arg_143_1.time_ and arg_143_1.time_ <= var_146_18 + arg_146_0 then
				local var_146_19 = manager.ui.mainCamera.transform.localPosition
				local var_146_20 = Vector3.New(0, 0, 10) + Vector3.New(var_146_19.x, var_146_19.y, 0)
				local var_146_21 = arg_143_1.bgs_.ST03_blur

				var_146_21.transform.localPosition = var_146_20
				var_146_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_22 = var_146_21:GetComponent("SpriteRenderer")

				if var_146_22 and var_146_22.sprite then
					local var_146_23 = (var_146_21.transform.localPosition - var_146_19).z
					local var_146_24 = manager.ui.mainCameraCom_
					local var_146_25 = 2 * var_146_23 * Mathf.Tan(var_146_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_26 = var_146_25 * var_146_24.aspect
					local var_146_27 = var_146_22.sprite.bounds.size.x
					local var_146_28 = var_146_22.sprite.bounds.size.y
					local var_146_29 = var_146_26 / var_146_27
					local var_146_30 = var_146_25 / var_146_28
					local var_146_31 = var_146_30 < var_146_29 and var_146_29 or var_146_30

					var_146_21.transform.localScale = Vector3.New(var_146_31, var_146_31, 0)
				end

				for iter_146_2, iter_146_3 in pairs(arg_143_1.bgs_) do
					if iter_146_2 ~= "ST03_blur" then
						iter_146_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_146_32 = 19.7

			if var_146_32 < arg_143_1.time_ and arg_143_1.time_ <= var_146_32 + arg_146_0 then
				local var_146_33 = manager.ui.mainCamera.transform.localPosition
				local var_146_34 = Vector3.New(0, 0, 10) + Vector3.New(var_146_33.x, var_146_33.y, 0)
				local var_146_35 = arg_143_1.bgs_.ST15

				var_146_35.transform.localPosition = var_146_34
				var_146_35.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_36 = var_146_35:GetComponent("SpriteRenderer")

				if var_146_36 and var_146_36.sprite then
					local var_146_37 = (var_146_35.transform.localPosition - var_146_33).z
					local var_146_38 = manager.ui.mainCameraCom_
					local var_146_39 = 2 * var_146_37 * Mathf.Tan(var_146_38.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_40 = var_146_39 * var_146_38.aspect
					local var_146_41 = var_146_36.sprite.bounds.size.x
					local var_146_42 = var_146_36.sprite.bounds.size.y
					local var_146_43 = var_146_40 / var_146_41
					local var_146_44 = var_146_39 / var_146_42
					local var_146_45 = var_146_44 < var_146_43 and var_146_43 or var_146_44

					var_146_35.transform.localScale = Vector3.New(var_146_45, var_146_45, 0)
				end

				for iter_146_4, iter_146_5 in pairs(arg_143_1.bgs_) do
					if iter_146_4 ~= "ST15" then
						iter_146_5.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_146_46 = 0

			if var_146_46 < arg_143_1.time_ and arg_143_1.time_ <= var_146_46 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_47 = 2

			if var_146_46 <= arg_143_1.time_ and arg_143_1.time_ < var_146_46 + var_146_47 then
				local var_146_48 = (arg_143_1.time_ - var_146_46) / var_146_47
				local var_146_49 = Color.New(0, 0, 0)

				var_146_49.a = Mathf.Lerp(0, 1, var_146_48)
				arg_143_1.mask_.color = var_146_49
			end

			if arg_143_1.time_ >= var_146_46 + var_146_47 and arg_143_1.time_ < var_146_46 + var_146_47 + arg_146_0 then
				local var_146_50 = Color.New(0, 0, 0)

				var_146_50.a = 1
				arg_143_1.mask_.color = var_146_50
			end

			local var_146_51 = 2

			if var_146_51 < arg_143_1.time_ and arg_143_1.time_ <= var_146_51 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_52 = 0.0166666666666667

			if var_146_51 <= arg_143_1.time_ and arg_143_1.time_ < var_146_51 + var_146_52 then
				local var_146_53 = (arg_143_1.time_ - var_146_51) / var_146_52
				local var_146_54 = Color.New(0, 0, 0)

				var_146_54.a = Mathf.Lerp(1, 0, var_146_53)
				arg_143_1.mask_.color = var_146_54
			end

			if arg_143_1.time_ >= var_146_51 + var_146_52 and arg_143_1.time_ < var_146_51 + var_146_52 + arg_146_0 then
				local var_146_55 = Color.New(0, 0, 0)
				local var_146_56 = 0

				arg_143_1.mask_.enabled = false
				var_146_55.a = var_146_56
				arg_143_1.mask_.color = var_146_55
			end

			local var_146_57 = 2
			local var_146_58 = 1

			if var_146_57 < arg_143_1.time_ and arg_143_1.time_ <= var_146_57 + arg_146_0 then
				local var_146_59 = "play"
				local var_146_60 = "effect"

				arg_143_1:AudioAction(var_146_59, var_146_60, "se_story_16", "se_story_16_whoosh", "")
			end

			local var_146_61 = 2

			if var_146_61 < arg_143_1.time_ and arg_143_1.time_ <= var_146_61 + arg_146_0 then
				SetActive(arg_143_1.dialog_, false)
				SetActive(arg_143_1.allBtn_.gameObject, false)
				arg_143_1.hideBtnsController_:SetSelectedIndex(1)
				manager.video:Play("SofdecAsset/story/story_101161201.usm", function(arg_147_0)
					arg_143_1.time_ = var_146_61 + 3.66000000022352

					if arg_143_1.state_ == "pause" then
						arg_143_1.state_ = "playing"
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_148_0)
					if arg_148_0 then
						arg_143_1.state_ = "pause"
					else
						arg_143_1.state_ = "playing"
					end
				end)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_146_62 = 3.67

			if var_146_61 <= arg_143_1.time_ and arg_143_1.time_ < var_146_61 + var_146_62 then
				-- block empty
			end

			if arg_143_1.time_ >= var_146_61 + var_146_62 and arg_143_1.time_ < var_146_61 + var_146_62 + arg_146_0 then
				-- block empty
			end

			local var_146_63 = 5.67

			if var_146_63 < arg_143_1.time_ and arg_143_1.time_ <= var_146_63 + arg_146_0 then
				SetActive(arg_143_1.dialog_, true)
				SetActive(arg_143_1.allBtn_.gameObject, true)
				arg_143_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_146_64 = 0.0300000000000002

			if var_146_63 <= arg_143_1.time_ and arg_143_1.time_ < var_146_63 + var_146_64 then
				-- block empty
			end

			if arg_143_1.time_ >= var_146_63 + var_146_64 and arg_143_1.time_ < var_146_63 + var_146_64 + arg_146_0 then
				-- block empty
			end

			local var_146_65 = "I05_blur"

			if arg_143_1.bgs_[var_146_65] == nil then
				local var_146_66 = Object.Instantiate(arg_143_1.blurPaintGo_)
				local var_146_67 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_146_65)

				var_146_66:GetComponent("SpriteRenderer").sprite = var_146_67
				var_146_66.name = var_146_65
				var_146_66.transform.parent = arg_143_1.stage_.transform
				var_146_66.transform.localPosition = Vector3.New(0, 100, 0)
				arg_143_1.bgs_[var_146_65] = var_146_66
			end

			local var_146_68 = 12.7
			local var_146_69 = arg_143_1.bgs_[var_146_65]

			if var_146_68 < arg_143_1.time_ and arg_143_1.time_ <= var_146_68 + arg_146_0 then
				local var_146_70 = manager.ui.mainCamera.transform.localPosition
				local var_146_71 = Vector3.New(0, 0, 10) + Vector3.New(var_146_70.x, var_146_70.y, 0)

				var_146_69.transform.localPosition = var_146_71
				var_146_69.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_72 = var_146_69:GetComponent("SpriteRenderer")

				if var_146_72 and var_146_72.sprite then
					local var_146_73 = (var_146_69.transform.localPosition - var_146_70).z
					local var_146_74 = manager.ui.mainCameraCom_
					local var_146_75 = 2 * var_146_73 * Mathf.Tan(var_146_74.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_76 = var_146_75 * var_146_74.aspect
					local var_146_77 = var_146_72.sprite.bounds.size.x
					local var_146_78 = var_146_72.sprite.bounds.size.y
					local var_146_79 = var_146_76 / var_146_77
					local var_146_80 = var_146_75 / var_146_78
					local var_146_81 = var_146_80 < var_146_79 and var_146_79 or var_146_80

					var_146_69.transform.localScale = Vector3.New(var_146_81, var_146_81, 0)
				end
			end

			local var_146_82 = 7

			if var_146_68 <= arg_143_1.time_ and arg_143_1.time_ < var_146_68 + var_146_82 then
				local var_146_83 = (arg_143_1.time_ - var_146_68) / var_146_82
				local var_146_84 = Color.New(1, 1, 1)

				var_146_84.a = Mathf.Lerp(0, 1, var_146_83)

				var_146_69:GetComponent("SpriteRenderer").material:SetColor("_Color", var_146_84)
			end

			local var_146_85 = "ST15_blur"

			if arg_143_1.bgs_[var_146_85] == nil then
				local var_146_86 = Object.Instantiate(arg_143_1.blurPaintGo_)
				local var_146_87 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_146_85)

				var_146_86:GetComponent("SpriteRenderer").sprite = var_146_87
				var_146_86.name = var_146_85
				var_146_86.transform.parent = arg_143_1.stage_.transform
				var_146_86.transform.localPosition = Vector3.New(0, 100, 0)
				arg_143_1.bgs_[var_146_85] = var_146_86
			end

			local var_146_88 = 19.7
			local var_146_89 = arg_143_1.bgs_[var_146_85]

			if var_146_88 < arg_143_1.time_ and arg_143_1.time_ <= var_146_88 + arg_146_0 then
				local var_146_90 = manager.ui.mainCamera.transform.localPosition
				local var_146_91 = Vector3.New(0, 0, 10) + Vector3.New(var_146_90.x, var_146_90.y, 0)

				var_146_89.transform.localPosition = var_146_91
				var_146_89.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_92 = var_146_89:GetComponent("SpriteRenderer")

				if var_146_92 and var_146_92.sprite then
					local var_146_93 = (var_146_89.transform.localPosition - var_146_90).z
					local var_146_94 = manager.ui.mainCameraCom_
					local var_146_95 = 2 * var_146_93 * Mathf.Tan(var_146_94.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_96 = var_146_95 * var_146_94.aspect
					local var_146_97 = var_146_92.sprite.bounds.size.x
					local var_146_98 = var_146_92.sprite.bounds.size.y
					local var_146_99 = var_146_96 / var_146_97
					local var_146_100 = var_146_95 / var_146_98
					local var_146_101 = var_146_100 < var_146_99 and var_146_99 or var_146_100

					var_146_89.transform.localScale = Vector3.New(var_146_101, var_146_101, 0)
				end
			end

			local var_146_102 = 7

			if var_146_88 <= arg_143_1.time_ and arg_143_1.time_ < var_146_88 + var_146_102 then
				local var_146_103 = (arg_143_1.time_ - var_146_88) / var_146_102
				local var_146_104 = Color.New(1, 1, 1)

				var_146_104.a = Mathf.Lerp(0, 1, var_146_103)

				var_146_89:GetComponent("SpriteRenderer").material:SetColor("_Color", var_146_104)
			end

			local var_146_105 = "ST03_blur"

			if arg_143_1.bgs_[var_146_105] == nil then
				local var_146_106 = Object.Instantiate(arg_143_1.blurPaintGo_)
				local var_146_107 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_146_105)

				var_146_106:GetComponent("SpriteRenderer").sprite = var_146_107
				var_146_106.name = var_146_105
				var_146_106.transform.parent = arg_143_1.stage_.transform
				var_146_106.transform.localPosition = Vector3.New(0, 100, 0)
				arg_143_1.bgs_[var_146_105] = var_146_106
			end

			local var_146_108 = 5.7
			local var_146_109 = arg_143_1.bgs_[var_146_105]

			if var_146_108 < arg_143_1.time_ and arg_143_1.time_ <= var_146_108 + arg_146_0 then
				local var_146_110 = manager.ui.mainCamera.transform.localPosition
				local var_146_111 = Vector3.New(0, 0, 10) + Vector3.New(var_146_110.x, var_146_110.y, 0)

				var_146_109.transform.localPosition = var_146_111
				var_146_109.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_112 = var_146_109:GetComponent("SpriteRenderer")

				if var_146_112 and var_146_112.sprite then
					local var_146_113 = (var_146_109.transform.localPosition - var_146_110).z
					local var_146_114 = manager.ui.mainCameraCom_
					local var_146_115 = 2 * var_146_113 * Mathf.Tan(var_146_114.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_116 = var_146_115 * var_146_114.aspect
					local var_146_117 = var_146_112.sprite.bounds.size.x
					local var_146_118 = var_146_112.sprite.bounds.size.y
					local var_146_119 = var_146_116 / var_146_117
					local var_146_120 = var_146_115 / var_146_118
					local var_146_121 = var_146_120 < var_146_119 and var_146_119 or var_146_120

					var_146_109.transform.localScale = Vector3.New(var_146_121, var_146_121, 0)
				end
			end

			local var_146_122 = 7

			if var_146_108 <= arg_143_1.time_ and arg_143_1.time_ < var_146_108 + var_146_122 then
				local var_146_123 = (arg_143_1.time_ - var_146_108) / var_146_122
				local var_146_124 = Color.New(1, 1, 1)

				var_146_124.a = Mathf.Lerp(0, 1, var_146_123)

				var_146_109:GetComponent("SpriteRenderer").material:SetColor("_Color", var_146_124)
			end

			local var_146_125 = 5.7

			if var_146_125 < arg_143_1.time_ and arg_143_1.time_ <= var_146_125 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_126 = 5

			if var_146_125 <= arg_143_1.time_ and arg_143_1.time_ < var_146_125 + var_146_126 then
				local var_146_127 = (arg_143_1.time_ - var_146_125) / var_146_126
				local var_146_128 = Color.New(1, 1, 1)

				var_146_128.a = Mathf.Lerp(1, 0, var_146_127)
				arg_143_1.mask_.color = var_146_128
			end

			if arg_143_1.time_ >= var_146_125 + var_146_126 and arg_143_1.time_ < var_146_125 + var_146_126 + arg_146_0 then
				local var_146_129 = Color.New(1, 1, 1)
				local var_146_130 = 0

				arg_143_1.mask_.enabled = false
				var_146_129.a = var_146_130
				arg_143_1.mask_.color = var_146_129
			end

			local var_146_131 = 12.7

			if var_146_131 < arg_143_1.time_ and arg_143_1.time_ <= var_146_131 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_132 = 5

			if var_146_131 <= arg_143_1.time_ and arg_143_1.time_ < var_146_131 + var_146_132 then
				local var_146_133 = (arg_143_1.time_ - var_146_131) / var_146_132
				local var_146_134 = Color.New(1, 1, 1)

				var_146_134.a = Mathf.Lerp(1, 0, var_146_133)
				arg_143_1.mask_.color = var_146_134
			end

			if arg_143_1.time_ >= var_146_131 + var_146_132 and arg_143_1.time_ < var_146_131 + var_146_132 + arg_146_0 then
				local var_146_135 = Color.New(1, 1, 1)
				local var_146_136 = 0

				arg_143_1.mask_.enabled = false
				var_146_135.a = var_146_136
				arg_143_1.mask_.color = var_146_135
			end

			local var_146_137 = 19.7

			if var_146_137 < arg_143_1.time_ and arg_143_1.time_ <= var_146_137 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_138 = 5

			if var_146_137 <= arg_143_1.time_ and arg_143_1.time_ < var_146_137 + var_146_138 then
				local var_146_139 = (arg_143_1.time_ - var_146_137) / var_146_138
				local var_146_140 = Color.New(1, 1, 1)

				var_146_140.a = Mathf.Lerp(1, 0, var_146_139)
				arg_143_1.mask_.color = var_146_140
			end

			if arg_143_1.time_ >= var_146_137 + var_146_138 and arg_143_1.time_ < var_146_137 + var_146_138 + arg_146_0 then
				local var_146_141 = Color.New(1, 1, 1)
				local var_146_142 = 0

				arg_143_1.mask_.enabled = false
				var_146_141.a = var_146_142
				arg_143_1.mask_.color = var_146_141
			end

			local var_146_143 = 2

			if var_146_143 < arg_143_1.time_ and arg_143_1.time_ <= var_146_143 + arg_146_0 then
				local var_146_144 = arg_143_1.fswbg_.transform:Find("textbox/adapt/content") or arg_143_1.fswbg_.transform:Find("textbox/content")
				local var_146_145 = var_146_144:GetComponent("Text")
				local var_146_146 = var_146_144:GetComponent("RectTransform")

				var_146_145.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_146_146.offsetMin = Vector2.New(0, 0)
				var_146_146.offsetMax = Vector2.New(0, 0)
			end

			local var_146_147 = 5.70333333333333

			if var_146_147 < arg_143_1.time_ and arg_143_1.time_ <= var_146_147 + arg_146_0 then
				arg_143_1.var_.oldValueTypewriter = arg_143_1.fswtw_.percent

				arg_143_1:ShowNextGo(false)
			end

			local var_146_148 = 2
			local var_146_149 = 0.133333333333333
			local var_146_150 = arg_143_1:GetWordFromCfg(116361033)
			local var_146_151 = arg_143_1:FormatText(var_146_150.content)
			local var_146_152, var_146_153 = arg_143_1:GetPercentByPara(var_146_151, 1)

			if var_146_147 < arg_143_1.time_ and arg_143_1.time_ <= var_146_147 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				local var_146_154 = var_146_148 <= 0 and var_146_149 or var_146_149 * ((var_146_153 - arg_143_1.typewritterCharCountI18N) / var_146_148)

				if var_146_154 > 0 and var_146_149 < var_146_154 then
					arg_143_1.talkMaxDuration = var_146_154

					if var_146_154 + var_146_147 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_154 + var_146_147
					end
				end
			end

			local var_146_155 = 0.133333333333333
			local var_146_156 = math.max(var_146_155, arg_143_1.talkMaxDuration)

			if var_146_147 <= arg_143_1.time_ and arg_143_1.time_ < var_146_147 + var_146_156 then
				local var_146_157 = (arg_143_1.time_ - var_146_147) / var_146_156

				arg_143_1.fswtw_.percent = Mathf.Lerp(arg_143_1.var_.oldValueTypewriter, var_146_152, var_146_157)
				arg_143_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_143_1.fswtw_:SetDirty()
			end

			if arg_143_1.time_ >= var_146_147 + var_146_156 and arg_143_1.time_ < var_146_147 + var_146_156 + arg_146_0 then
				arg_143_1.fswtw_.percent = var_146_152

				arg_143_1.fswtw_:SetDirty()
				arg_143_1:ShowNextGo(true)

				arg_143_1.typewritterCharCountI18N = var_146_153
			end

			local var_146_158 = 5.67

			if var_146_158 < arg_143_1.time_ and arg_143_1.time_ <= var_146_158 + arg_146_0 then
				arg_143_1.fswbg_:SetActive(true)
				arg_143_1.dialog_:SetActive(false)

				arg_143_1.fswtw_.percent = 0

				local var_146_159 = arg_143_1:GetWordFromCfg(116361033)
				local var_146_160 = arg_143_1:FormatText(var_146_159.content)

				arg_143_1.fswt_.text = var_146_160

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.fswt_)

				arg_143_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_143_1.fswtw_:SetDirty()

				arg_143_1.typewritterCharCountI18N = 0

				SetActive(arg_143_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_143_1:ShowNextGo(false)
			end

			local var_146_161 = 5.67

			if var_146_161 < arg_143_1.time_ and arg_143_1.time_ <= var_146_161 + arg_146_0 then
				arg_143_1.allBtn_.enabled = false
			end

			local var_146_162 = 21.03

			if arg_143_1.time_ >= var_146_161 + var_146_162 and arg_143_1.time_ < var_146_161 + var_146_162 + arg_146_0 then
				arg_143_1.allBtn_.enabled = true
			end

			local var_146_163 = 0
			local var_146_164 = 1

			if var_146_163 < arg_143_1.time_ and arg_143_1.time_ <= var_146_163 + arg_146_0 then
				local var_146_165 = "play"
				local var_146_166 = "music"

				arg_143_1:AudioAction(var_146_165, var_146_166, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_146_167 = 5.83666666666667
			local var_146_168 = 1

			if var_146_167 < arg_143_1.time_ and arg_143_1.time_ <= var_146_167 + arg_146_0 then
				local var_146_169 = "play"
				local var_146_170 = "music"

				arg_143_1:AudioAction(var_146_169, var_146_170, "bgm_activity_1_6_story_skuld", "bgm_activity_1_6_story_skuld", "bgm_activity_1_6_story_skuld.awb")
			end
		end
	end,
	Play116361034 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 116361034
		arg_149_1.duration_ = 23.199999999999

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play116361035(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				local var_152_2 = "play"
				local var_152_3 = "effect"

				arg_149_1:AudioAction(var_152_2, var_152_3, "se_story_16", "se_story_16_whoosh", "")
			end

			local var_152_4 = 16.2

			if var_152_4 < arg_149_1.time_ and arg_149_1.time_ <= var_152_4 + arg_152_0 then
				local var_152_5 = manager.ui.mainCamera.transform.localPosition
				local var_152_6 = Vector3.New(0, 0, 10) + Vector3.New(var_152_5.x, var_152_5.y, 0)
				local var_152_7 = arg_149_1.bgs_.ST15

				var_152_7.transform.localPosition = var_152_6
				var_152_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_8 = var_152_7:GetComponent("SpriteRenderer")

				if var_152_8 and var_152_8.sprite then
					local var_152_9 = (var_152_7.transform.localPosition - var_152_5).z
					local var_152_10 = manager.ui.mainCameraCom_
					local var_152_11 = 2 * var_152_9 * Mathf.Tan(var_152_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_12 = var_152_11 * var_152_10.aspect
					local var_152_13 = var_152_8.sprite.bounds.size.x
					local var_152_14 = var_152_8.sprite.bounds.size.y
					local var_152_15 = var_152_12 / var_152_13
					local var_152_16 = var_152_11 / var_152_14
					local var_152_17 = var_152_16 < var_152_15 and var_152_15 or var_152_16

					var_152_7.transform.localScale = Vector3.New(var_152_17, var_152_17, 0)
				end

				for iter_152_0, iter_152_1 in pairs(arg_149_1.bgs_) do
					if iter_152_0 ~= "ST15" then
						iter_152_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_152_18 = 2

			if var_152_18 < arg_149_1.time_ and arg_149_1.time_ <= var_152_18 + arg_152_0 then
				local var_152_19 = manager.ui.mainCamera.transform.localPosition
				local var_152_20 = Vector3.New(0, 0, 10) + Vector3.New(var_152_19.x, var_152_19.y, 0)
				local var_152_21 = arg_149_1.bgs_.ST03_blur

				var_152_21.transform.localPosition = var_152_20
				var_152_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_22 = var_152_21:GetComponent("SpriteRenderer")

				if var_152_22 and var_152_22.sprite then
					local var_152_23 = (var_152_21.transform.localPosition - var_152_19).z
					local var_152_24 = manager.ui.mainCameraCom_
					local var_152_25 = 2 * var_152_23 * Mathf.Tan(var_152_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_26 = var_152_25 * var_152_24.aspect
					local var_152_27 = var_152_22.sprite.bounds.size.x
					local var_152_28 = var_152_22.sprite.bounds.size.y
					local var_152_29 = var_152_26 / var_152_27
					local var_152_30 = var_152_25 / var_152_28
					local var_152_31 = var_152_30 < var_152_29 and var_152_29 or var_152_30

					var_152_21.transform.localScale = Vector3.New(var_152_31, var_152_31, 0)
				end

				for iter_152_2, iter_152_3 in pairs(arg_149_1.bgs_) do
					if iter_152_2 ~= "ST03_blur" then
						iter_152_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_152_32 = 9

			if var_152_32 < arg_149_1.time_ and arg_149_1.time_ <= var_152_32 + arg_152_0 then
				local var_152_33 = manager.ui.mainCamera.transform.localPosition
				local var_152_34 = Vector3.New(0, 0, 10) + Vector3.New(var_152_33.x, var_152_33.y, 0)
				local var_152_35 = arg_149_1.bgs_.I05

				var_152_35.transform.localPosition = var_152_34
				var_152_35.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_36 = var_152_35:GetComponent("SpriteRenderer")

				if var_152_36 and var_152_36.sprite then
					local var_152_37 = (var_152_35.transform.localPosition - var_152_33).z
					local var_152_38 = manager.ui.mainCameraCom_
					local var_152_39 = 2 * var_152_37 * Mathf.Tan(var_152_38.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_40 = var_152_39 * var_152_38.aspect
					local var_152_41 = var_152_36.sprite.bounds.size.x
					local var_152_42 = var_152_36.sprite.bounds.size.y
					local var_152_43 = var_152_40 / var_152_41
					local var_152_44 = var_152_39 / var_152_42
					local var_152_45 = var_152_44 < var_152_43 and var_152_43 or var_152_44

					var_152_35.transform.localScale = Vector3.New(var_152_45, var_152_45, 0)
				end

				for iter_152_4, iter_152_5 in pairs(arg_149_1.bgs_) do
					if iter_152_4 ~= "I05" then
						iter_152_5.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_152_46 = 0

			if var_152_46 < arg_149_1.time_ and arg_149_1.time_ <= var_152_46 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_47 = 2

			if var_152_46 <= arg_149_1.time_ and arg_149_1.time_ < var_152_46 + var_152_47 then
				local var_152_48 = (arg_149_1.time_ - var_152_46) / var_152_47
				local var_152_49 = Color.New(0, 0, 0)

				var_152_49.a = Mathf.Lerp(0, 1, var_152_48)
				arg_149_1.mask_.color = var_152_49
			end

			if arg_149_1.time_ >= var_152_46 + var_152_47 and arg_149_1.time_ < var_152_46 + var_152_47 + arg_152_0 then
				local var_152_50 = Color.New(0, 0, 0)

				var_152_50.a = 1
				arg_149_1.mask_.color = var_152_50
			end

			local var_152_51 = 2

			if var_152_51 < arg_149_1.time_ and arg_149_1.time_ <= var_152_51 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_52 = 5

			if var_152_51 <= arg_149_1.time_ and arg_149_1.time_ < var_152_51 + var_152_52 then
				local var_152_53 = (arg_149_1.time_ - var_152_51) / var_152_52
				local var_152_54 = Color.New(1, 1, 1)

				var_152_54.a = Mathf.Lerp(1, 0, var_152_53)
				arg_149_1.mask_.color = var_152_54
			end

			if arg_149_1.time_ >= var_152_51 + var_152_52 and arg_149_1.time_ < var_152_51 + var_152_52 + arg_152_0 then
				local var_152_55 = Color.New(1, 1, 1)
				local var_152_56 = 0

				arg_149_1.mask_.enabled = false
				var_152_55.a = var_152_56
				arg_149_1.mask_.color = var_152_55
			end

			local var_152_57 = 9

			if var_152_57 < arg_149_1.time_ and arg_149_1.time_ <= var_152_57 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_58 = 5

			if var_152_57 <= arg_149_1.time_ and arg_149_1.time_ < var_152_57 + var_152_58 then
				local var_152_59 = (arg_149_1.time_ - var_152_57) / var_152_58
				local var_152_60 = Color.New(1, 1, 1)

				var_152_60.a = Mathf.Lerp(1, 0, var_152_59)
				arg_149_1.mask_.color = var_152_60
			end

			if arg_149_1.time_ >= var_152_57 + var_152_58 and arg_149_1.time_ < var_152_57 + var_152_58 + arg_152_0 then
				local var_152_61 = Color.New(1, 1, 1)
				local var_152_62 = 0

				arg_149_1.mask_.enabled = false
				var_152_61.a = var_152_62
				arg_149_1.mask_.color = var_152_61
			end

			local var_152_63 = 16.2

			if var_152_63 < arg_149_1.time_ and arg_149_1.time_ <= var_152_63 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_64 = 5

			if var_152_63 <= arg_149_1.time_ and arg_149_1.time_ < var_152_63 + var_152_64 then
				local var_152_65 = (arg_149_1.time_ - var_152_63) / var_152_64
				local var_152_66 = Color.New(1, 1, 1)

				var_152_66.a = Mathf.Lerp(1, 0, var_152_65)
				arg_149_1.mask_.color = var_152_66
			end

			if arg_149_1.time_ >= var_152_63 + var_152_64 and arg_149_1.time_ < var_152_63 + var_152_64 + arg_152_0 then
				local var_152_67 = Color.New(1, 1, 1)
				local var_152_68 = 0

				arg_149_1.mask_.enabled = false
				var_152_67.a = var_152_68
				arg_149_1.mask_.color = var_152_67
			end

			local var_152_69 = "ST03_blur"

			if arg_149_1.bgs_[var_152_69] == nil then
				local var_152_70 = Object.Instantiate(arg_149_1.blurPaintGo_)
				local var_152_71 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_152_69)

				var_152_70:GetComponent("SpriteRenderer").sprite = var_152_71
				var_152_70.name = var_152_69
				var_152_70.transform.parent = arg_149_1.stage_.transform
				var_152_70.transform.localPosition = Vector3.New(0, 100, 0)
				arg_149_1.bgs_[var_152_69] = var_152_70
			end

			local var_152_72 = 2
			local var_152_73 = arg_149_1.bgs_[var_152_69]

			if var_152_72 < arg_149_1.time_ and arg_149_1.time_ <= var_152_72 + arg_152_0 then
				local var_152_74 = manager.ui.mainCamera.transform.localPosition
				local var_152_75 = Vector3.New(0, 0, 10) + Vector3.New(var_152_74.x, var_152_74.y, 0)

				var_152_73.transform.localPosition = var_152_75
				var_152_73.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_76 = var_152_73:GetComponent("SpriteRenderer")

				if var_152_76 and var_152_76.sprite then
					local var_152_77 = (var_152_73.transform.localPosition - var_152_74).z
					local var_152_78 = manager.ui.mainCameraCom_
					local var_152_79 = 2 * var_152_77 * Mathf.Tan(var_152_78.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_80 = var_152_79 * var_152_78.aspect
					local var_152_81 = var_152_76.sprite.bounds.size.x
					local var_152_82 = var_152_76.sprite.bounds.size.y
					local var_152_83 = var_152_80 / var_152_81
					local var_152_84 = var_152_79 / var_152_82
					local var_152_85 = var_152_84 < var_152_83 and var_152_83 or var_152_84

					var_152_73.transform.localScale = Vector3.New(var_152_85, var_152_85, 0)
				end
			end

			local var_152_86 = 7

			if var_152_72 <= arg_149_1.time_ and arg_149_1.time_ < var_152_72 + var_152_86 then
				local var_152_87 = (arg_149_1.time_ - var_152_72) / var_152_86
				local var_152_88 = Color.New(1, 1, 1)

				var_152_88.a = Mathf.Lerp(0, 1, var_152_87)

				var_152_73:GetComponent("SpriteRenderer").material:SetColor("_Color", var_152_88)
			end

			local var_152_89 = "I05_blur"

			if arg_149_1.bgs_[var_152_89] == nil then
				local var_152_90 = Object.Instantiate(arg_149_1.blurPaintGo_)
				local var_152_91 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_152_89)

				var_152_90:GetComponent("SpriteRenderer").sprite = var_152_91
				var_152_90.name = var_152_89
				var_152_90.transform.parent = arg_149_1.stage_.transform
				var_152_90.transform.localPosition = Vector3.New(0, 100, 0)
				arg_149_1.bgs_[var_152_89] = var_152_90
			end

			local var_152_92 = 9
			local var_152_93 = arg_149_1.bgs_[var_152_89]

			if var_152_92 < arg_149_1.time_ and arg_149_1.time_ <= var_152_92 + arg_152_0 then
				local var_152_94 = manager.ui.mainCamera.transform.localPosition
				local var_152_95 = Vector3.New(0, 0, 10) + Vector3.New(var_152_94.x, var_152_94.y, 0)

				var_152_93.transform.localPosition = var_152_95
				var_152_93.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_96 = var_152_93:GetComponent("SpriteRenderer")

				if var_152_96 and var_152_96.sprite then
					local var_152_97 = (var_152_93.transform.localPosition - var_152_94).z
					local var_152_98 = manager.ui.mainCameraCom_
					local var_152_99 = 2 * var_152_97 * Mathf.Tan(var_152_98.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_100 = var_152_99 * var_152_98.aspect
					local var_152_101 = var_152_96.sprite.bounds.size.x
					local var_152_102 = var_152_96.sprite.bounds.size.y
					local var_152_103 = var_152_100 / var_152_101
					local var_152_104 = var_152_99 / var_152_102
					local var_152_105 = var_152_104 < var_152_103 and var_152_103 or var_152_104

					var_152_93.transform.localScale = Vector3.New(var_152_105, var_152_105, 0)
				end
			end

			local var_152_106 = 7.2

			if var_152_92 <= arg_149_1.time_ and arg_149_1.time_ < var_152_92 + var_152_106 then
				local var_152_107 = (arg_149_1.time_ - var_152_92) / var_152_106
				local var_152_108 = Color.New(1, 1, 1)

				var_152_108.a = Mathf.Lerp(0, 1, var_152_107)

				var_152_93:GetComponent("SpriteRenderer").material:SetColor("_Color", var_152_108)
			end

			local var_152_109 = "ST15_blur"

			if arg_149_1.bgs_[var_152_109] == nil then
				local var_152_110 = Object.Instantiate(arg_149_1.blurPaintGo_)
				local var_152_111 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_152_109)

				var_152_110:GetComponent("SpriteRenderer").sprite = var_152_111
				var_152_110.name = var_152_109
				var_152_110.transform.parent = arg_149_1.stage_.transform
				var_152_110.transform.localPosition = Vector3.New(0, 100, 0)
				arg_149_1.bgs_[var_152_109] = var_152_110
			end

			local var_152_112 = 16.2
			local var_152_113 = arg_149_1.bgs_[var_152_109]

			if var_152_112 < arg_149_1.time_ and arg_149_1.time_ <= var_152_112 + arg_152_0 then
				local var_152_114 = manager.ui.mainCamera.transform.localPosition
				local var_152_115 = Vector3.New(0, 0, 10) + Vector3.New(var_152_114.x, var_152_114.y, 0)

				var_152_113.transform.localPosition = var_152_115
				var_152_113.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_116 = var_152_113:GetComponent("SpriteRenderer")

				if var_152_116 and var_152_116.sprite then
					local var_152_117 = (var_152_113.transform.localPosition - var_152_114).z
					local var_152_118 = manager.ui.mainCameraCom_
					local var_152_119 = 2 * var_152_117 * Mathf.Tan(var_152_118.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_120 = var_152_119 * var_152_118.aspect
					local var_152_121 = var_152_116.sprite.bounds.size.x
					local var_152_122 = var_152_116.sprite.bounds.size.y
					local var_152_123 = var_152_120 / var_152_121
					local var_152_124 = var_152_119 / var_152_122
					local var_152_125 = var_152_124 < var_152_123 and var_152_123 or var_152_124

					var_152_113.transform.localScale = Vector3.New(var_152_125, var_152_125, 0)
				end
			end

			local var_152_126 = 7

			if var_152_112 <= arg_149_1.time_ and arg_149_1.time_ < var_152_112 + var_152_126 then
				local var_152_127 = (arg_149_1.time_ - var_152_112) / var_152_126
				local var_152_128 = Color.New(1, 1, 1)

				var_152_128.a = Mathf.Lerp(0, 1, var_152_127)

				var_152_113:GetComponent("SpriteRenderer").material:SetColor("_Color", var_152_128)
			end

			local var_152_129 = 0

			if var_152_129 < arg_149_1.time_ and arg_149_1.time_ <= var_152_129 + arg_152_0 then
				arg_149_1.fswbg_:SetActive(true)
				arg_149_1.dialog_:SetActive(false)

				arg_149_1.fswtw_.percent = 0

				local var_152_130 = arg_149_1:GetWordFromCfg(116361034)
				local var_152_131 = arg_149_1:FormatText(var_152_130.content)

				arg_149_1.fswt_.text = var_152_131

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.fswt_)

				arg_149_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_149_1.fswtw_:SetDirty()

				arg_149_1.typewritterCharCountI18N = 0

				SetActive(arg_149_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_149_1:ShowNextGo(false)
			end

			local var_152_132 = 2

			if var_152_132 < arg_149_1.time_ and arg_149_1.time_ <= var_152_132 + arg_152_0 then
				arg_149_1.var_.oldValueTypewriter = arg_149_1.fswtw_.percent

				arg_149_1:ShowNextGo(false)
			end

			local var_152_133 = 2
			local var_152_134 = 0.133333333333333
			local var_152_135 = arg_149_1:GetWordFromCfg(116361034)
			local var_152_136 = arg_149_1:FormatText(var_152_135.content)
			local var_152_137, var_152_138 = arg_149_1:GetPercentByPara(var_152_136, 1)

			if var_152_132 < arg_149_1.time_ and arg_149_1.time_ <= var_152_132 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0

				local var_152_139 = var_152_133 <= 0 and var_152_134 or var_152_134 * ((var_152_138 - arg_149_1.typewritterCharCountI18N) / var_152_133)

				if var_152_139 > 0 and var_152_134 < var_152_139 then
					arg_149_1.talkMaxDuration = var_152_139

					if var_152_139 + var_152_132 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_139 + var_152_132
					end
				end
			end

			local var_152_140 = 0.133333333333333
			local var_152_141 = math.max(var_152_140, arg_149_1.talkMaxDuration)

			if var_152_132 <= arg_149_1.time_ and arg_149_1.time_ < var_152_132 + var_152_141 then
				local var_152_142 = (arg_149_1.time_ - var_152_132) / var_152_141

				arg_149_1.fswtw_.percent = Mathf.Lerp(arg_149_1.var_.oldValueTypewriter, var_152_137, var_152_142)
				arg_149_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_149_1.fswtw_:SetDirty()
			end

			if arg_149_1.time_ >= var_152_132 + var_152_141 and arg_149_1.time_ < var_152_132 + var_152_141 + arg_152_0 then
				arg_149_1.fswtw_.percent = var_152_137

				arg_149_1.fswtw_:SetDirty()
				arg_149_1:ShowNextGo(true)

				arg_149_1.typewritterCharCountI18N = var_152_138
			end

			local var_152_143 = 2

			if var_152_143 < arg_149_1.time_ and arg_149_1.time_ <= var_152_143 + arg_152_0 then
				arg_149_1.allBtn_.enabled = false
			end

			local var_152_144 = 21.2

			if arg_149_1.time_ >= var_152_143 + var_152_144 and arg_149_1.time_ < var_152_143 + var_152_144 + arg_152_0 then
				arg_149_1.allBtn_.enabled = true
			end
		end
	end,
	Play116361035 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 116361035
		arg_153_1.duration_ = 4.694999999999

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play116361036(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = "STwhite"

			if arg_153_1.bgs_[var_156_0] == nil then
				local var_156_1 = Object.Instantiate(arg_153_1.paintGo_)

				var_156_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_156_0)
				var_156_1.name = var_156_0
				var_156_1.transform.parent = arg_153_1.stage_.transform
				var_156_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_153_1.bgs_[var_156_0] = var_156_1
			end

			local var_156_2 = 0

			if var_156_2 < arg_153_1.time_ and arg_153_1.time_ <= var_156_2 + arg_156_0 then
				local var_156_3 = manager.ui.mainCamera.transform.localPosition
				local var_156_4 = Vector3.New(0, 0, 10) + Vector3.New(var_156_3.x, var_156_3.y, 0)
				local var_156_5 = arg_153_1.bgs_.STwhite

				var_156_5.transform.localPosition = var_156_4
				var_156_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_156_6 = var_156_5:GetComponent("SpriteRenderer")

				if var_156_6 and var_156_6.sprite then
					local var_156_7 = (var_156_5.transform.localPosition - var_156_3).z
					local var_156_8 = manager.ui.mainCameraCom_
					local var_156_9 = 2 * var_156_7 * Mathf.Tan(var_156_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_156_10 = var_156_9 * var_156_8.aspect
					local var_156_11 = var_156_6.sprite.bounds.size.x
					local var_156_12 = var_156_6.sprite.bounds.size.y
					local var_156_13 = var_156_10 / var_156_11
					local var_156_14 = var_156_9 / var_156_12
					local var_156_15 = var_156_14 < var_156_13 and var_156_13 or var_156_14

					var_156_5.transform.localScale = Vector3.New(var_156_15, var_156_15, 0)
				end

				for iter_156_0, iter_156_1 in pairs(arg_153_1.bgs_) do
					if iter_156_0 ~= "STwhite" then
						iter_156_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_156_16 = 0

			if var_156_16 < arg_153_1.time_ and arg_153_1.time_ <= var_156_16 + arg_156_0 then
				arg_153_1.mask_.enabled = true
				arg_153_1.mask_.raycastTarget = true

				arg_153_1:SetGaussion(false)
			end

			local var_156_17 = 2

			if var_156_16 <= arg_153_1.time_ and arg_153_1.time_ < var_156_16 + var_156_17 then
				local var_156_18 = (arg_153_1.time_ - var_156_16) / var_156_17
				local var_156_19 = Color.New(0, 0, 0)

				var_156_19.a = Mathf.Lerp(1, 0, var_156_18)
				arg_153_1.mask_.color = var_156_19
			end

			if arg_153_1.time_ >= var_156_16 + var_156_17 and arg_153_1.time_ < var_156_16 + var_156_17 + arg_156_0 then
				local var_156_20 = Color.New(0, 0, 0)
				local var_156_21 = 0

				arg_153_1.mask_.enabled = false
				var_156_20.a = var_156_21
				arg_153_1.mask_.color = var_156_20
			end

			local var_156_22 = 0

			if var_156_22 < arg_153_1.time_ and arg_153_1.time_ <= var_156_22 + arg_156_0 then
				arg_153_1.fswbg_:SetActive(true)
				arg_153_1.dialog_:SetActive(false)

				arg_153_1.fswtw_.percent = 0

				local var_156_23 = arg_153_1:GetWordFromCfg(116361035)
				local var_156_24 = arg_153_1:FormatText(var_156_23.content)

				arg_153_1.fswt_.text = var_156_24

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.fswt_)

				arg_153_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_153_1.fswtw_:SetDirty()

				arg_153_1.typewritterCharCountI18N = 0

				SetActive(arg_153_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_153_1:ShowNextGo(false)
			end

			local var_156_25 = 2

			if var_156_25 < arg_153_1.time_ and arg_153_1.time_ <= var_156_25 + arg_156_0 then
				arg_153_1.var_.oldValueTypewriter = arg_153_1.fswtw_.percent

				arg_153_1:ShowNextGo(false)
			end

			local var_156_26 = 12
			local var_156_27 = 0.8
			local var_156_28 = arg_153_1:GetWordFromCfg(116361035)
			local var_156_29 = arg_153_1:FormatText(var_156_28.content)
			local var_156_30, var_156_31 = arg_153_1:GetPercentByPara(var_156_29, 1)

			if var_156_25 < arg_153_1.time_ and arg_153_1.time_ <= var_156_25 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0

				local var_156_32 = var_156_26 <= 0 and var_156_27 or var_156_27 * ((var_156_31 - arg_153_1.typewritterCharCountI18N) / var_156_26)

				if var_156_32 > 0 and var_156_27 < var_156_32 then
					arg_153_1.talkMaxDuration = var_156_32

					if var_156_32 + var_156_25 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_32 + var_156_25
					end
				end
			end

			local var_156_33 = 0.8
			local var_156_34 = math.max(var_156_33, arg_153_1.talkMaxDuration)

			if var_156_25 <= arg_153_1.time_ and arg_153_1.time_ < var_156_25 + var_156_34 then
				local var_156_35 = (arg_153_1.time_ - var_156_25) / var_156_34

				arg_153_1.fswtw_.percent = Mathf.Lerp(arg_153_1.var_.oldValueTypewriter, var_156_30, var_156_35)
				arg_153_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_153_1.fswtw_:SetDirty()
			end

			if arg_153_1.time_ >= var_156_25 + var_156_34 and arg_153_1.time_ < var_156_25 + var_156_34 + arg_156_0 then
				arg_153_1.fswtw_.percent = var_156_30

				arg_153_1.fswtw_:SetDirty()
				arg_153_1:ShowNextGo(true)

				arg_153_1.typewritterCharCountI18N = var_156_31
			end

			local var_156_36 = 2

			if var_156_36 < arg_153_1.time_ and arg_153_1.time_ <= var_156_36 + arg_156_0 then
				local var_156_37 = arg_153_1.fswbg_.transform:Find("textbox/adapt/content") or arg_153_1.fswbg_.transform:Find("textbox/content")
				local var_156_38 = var_156_37:GetComponent("Text")
				local var_156_39 = var_156_37:GetComponent("RectTransform")

				var_156_38.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_156_39.offsetMin = Vector2.New(0, 0)
				var_156_39.offsetMax = Vector2.New(0, 0)
			end

			local var_156_40 = 2
			local var_156_41 = 2.695
			local var_156_42 = manager.audio:GetVoiceLength("story_v_out_116361", "116361035", "story_v_out_116361.awb") / 1000

			if var_156_42 > 0 and var_156_41 < var_156_42 and var_156_42 + var_156_40 > arg_153_1.duration_ then
				local var_156_43 = var_156_42

				arg_153_1.duration_ = var_156_42 + var_156_40
			end

			if var_156_40 < arg_153_1.time_ and arg_153_1.time_ <= var_156_40 + arg_156_0 then
				local var_156_44 = "play"
				local var_156_45 = "voice"

				arg_153_1:AudioAction(var_156_44, var_156_45, "story_v_out_116361", "116361035", "story_v_out_116361.awb")
			end

			local var_156_46 = 0
			local var_156_47 = 0.666666666666667

			if var_156_46 < arg_153_1.time_ and arg_153_1.time_ <= var_156_46 + arg_156_0 then
				local var_156_48 = "play"
				local var_156_49 = "music"

				arg_153_1:AudioAction(var_156_48, var_156_49, "ui_battle", "ui_battle_stopbgm", "")
			end
		end
	end,
	Play116361036 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 116361036
		arg_157_1.duration_ = 5.092999999999

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play116361037(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 2

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.fswbg_:SetActive(true)
				arg_157_1.dialog_:SetActive(false)

				arg_157_1.fswtw_.percent = 0

				local var_160_1 = arg_157_1:GetWordFromCfg(116361036)
				local var_160_2 = arg_157_1:FormatText(var_160_1.content)

				arg_157_1.fswt_.text = var_160_2

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.fswt_)

				arg_157_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_157_1.fswtw_:SetDirty()

				arg_157_1.typewritterCharCountI18N = 0

				SetActive(arg_157_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_157_1:ShowNextGo(false)
			end

			local var_160_3 = 0

			if var_160_3 < arg_157_1.time_ and arg_157_1.time_ <= var_160_3 + arg_160_0 then
				arg_157_1.fswbg_:SetActive(true)
				arg_157_1.dialog_:SetActive(false)

				arg_157_1.fswtw_.percent = 0

				local var_160_4 = arg_157_1:GetWordFromCfg(116361036)
				local var_160_5 = arg_157_1:FormatText(var_160_4.content)

				arg_157_1.fswt_.text = var_160_5

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.fswt_)

				arg_157_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_157_1.fswtw_:SetDirty()

				arg_157_1.typewritterCharCountI18N = 0

				arg_157_1:ShowNextGo(false)
			end

			local var_160_6 = 0.0166666666666666

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.var_.oldValueTypewriter = arg_157_1.fswtw_.percent

				arg_157_1:ShowNextGo(false)
			end

			local var_160_7 = 10
			local var_160_8 = 0.666666666666667
			local var_160_9 = arg_157_1:GetWordFromCfg(116361036)
			local var_160_10 = arg_157_1:FormatText(var_160_9.content)
			local var_160_11, var_160_12 = arg_157_1:GetPercentByPara(var_160_10, 1)

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0

				local var_160_13 = var_160_7 <= 0 and var_160_8 or var_160_8 * ((var_160_12 - arg_157_1.typewritterCharCountI18N) / var_160_7)

				if var_160_13 > 0 and var_160_8 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_6
					end
				end
			end

			local var_160_14 = 0.666666666666667
			local var_160_15 = math.max(var_160_14, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_15 then
				local var_160_16 = (arg_157_1.time_ - var_160_6) / var_160_15

				arg_157_1.fswtw_.percent = Mathf.Lerp(arg_157_1.var_.oldValueTypewriter, var_160_11, var_160_16)
				arg_157_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_157_1.fswtw_:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_15 and arg_157_1.time_ < var_160_6 + var_160_15 + arg_160_0 then
				arg_157_1.fswtw_.percent = var_160_11

				arg_157_1.fswtw_:SetDirty()
				arg_157_1:ShowNextGo(true)

				arg_157_1.typewritterCharCountI18N = var_160_12
			end

			local var_160_17 = 0

			if var_160_17 < arg_157_1.time_ and arg_157_1.time_ <= var_160_17 + arg_160_0 then
				local var_160_18 = arg_157_1.fswbg_.transform:Find("textbox/adapt/content") or arg_157_1.fswbg_.transform:Find("textbox/content")
				local var_160_19 = var_160_18:GetComponent("Text")
				local var_160_20 = var_160_18:GetComponent("RectTransform")

				var_160_19.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_160_20.offsetMin = Vector2.New(0, 0)
				var_160_20.offsetMax = Vector2.New(0, 0)
			end

			local var_160_21 = 0
			local var_160_22 = 3.093
			local var_160_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361036", "story_v_out_116361.awb") / 1000

			if var_160_23 > 0 and var_160_22 < var_160_23 and var_160_23 + var_160_21 > arg_157_1.duration_ then
				local var_160_24 = var_160_23

				arg_157_1.duration_ = var_160_23 + var_160_21
			end

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 then
				local var_160_25 = "play"
				local var_160_26 = "voice"

				arg_157_1:AudioAction(var_160_25, var_160_26, "story_v_out_116361", "116361036", "story_v_out_116361.awb")
			end

			local var_160_27 = 0

			if var_160_27 < arg_157_1.time_ and arg_157_1.time_ <= var_160_27 + arg_160_0 then
				arg_157_1.allBtn_.enabled = false
			end

			local var_160_28 = 0.683333333333333

			if arg_157_1.time_ >= var_160_27 + var_160_28 and arg_157_1.time_ < var_160_27 + var_160_28 + arg_160_0 then
				arg_157_1.allBtn_.enabled = true
			end
		end
	end,
	Play116361037 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 116361037
		arg_161_1.duration_ = 11.589999999999

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play116361038(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.fswbg_:SetActive(true)
				arg_161_1.dialog_:SetActive(false)

				arg_161_1.fswtw_.percent = 0

				local var_164_1 = arg_161_1:GetWordFromCfg(116361037)
				local var_164_2 = arg_161_1:FormatText(var_164_1.content)

				arg_161_1.fswt_.text = var_164_2

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.fswt_)

				arg_161_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_161_1.fswtw_:SetDirty()

				arg_161_1.typewritterCharCountI18N = 0

				SetActive(arg_161_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_161_1:ShowNextGo(false)
			end

			local var_164_3 = 0

			if var_164_3 < arg_161_1.time_ and arg_161_1.time_ <= var_164_3 + arg_164_0 then
				arg_161_1.var_.oldValueTypewriter = arg_161_1.fswtw_.percent

				arg_161_1:ShowNextGo(false)
			end

			local var_164_4 = 32
			local var_164_5 = 2.13333333333333
			local var_164_6 = arg_161_1:GetWordFromCfg(116361037)
			local var_164_7 = arg_161_1:FormatText(var_164_6.content)
			local var_164_8, var_164_9 = arg_161_1:GetPercentByPara(var_164_7, 1)

			if var_164_3 < arg_161_1.time_ and arg_161_1.time_ <= var_164_3 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0

				local var_164_10 = var_164_4 <= 0 and var_164_5 or var_164_5 * ((var_164_9 - arg_161_1.typewritterCharCountI18N) / var_164_4)

				if var_164_10 > 0 and var_164_5 < var_164_10 then
					arg_161_1.talkMaxDuration = var_164_10

					if var_164_10 + var_164_3 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_10 + var_164_3
					end
				end
			end

			local var_164_11 = 2.13333333333333
			local var_164_12 = math.max(var_164_11, arg_161_1.talkMaxDuration)

			if var_164_3 <= arg_161_1.time_ and arg_161_1.time_ < var_164_3 + var_164_12 then
				local var_164_13 = (arg_161_1.time_ - var_164_3) / var_164_12

				arg_161_1.fswtw_.percent = Mathf.Lerp(arg_161_1.var_.oldValueTypewriter, var_164_8, var_164_13)
				arg_161_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_161_1.fswtw_:SetDirty()
			end

			if arg_161_1.time_ >= var_164_3 + var_164_12 and arg_161_1.time_ < var_164_3 + var_164_12 + arg_164_0 then
				arg_161_1.fswtw_.percent = var_164_8

				arg_161_1.fswtw_:SetDirty()
				arg_161_1:ShowNextGo(true)

				arg_161_1.typewritterCharCountI18N = var_164_9
			end

			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				local var_164_15 = arg_161_1.fswbg_.transform:Find("textbox/adapt/content") or arg_161_1.fswbg_.transform:Find("textbox/content")
				local var_164_16 = var_164_15:GetComponent("Text")
				local var_164_17 = var_164_15:GetComponent("RectTransform")

				var_164_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_164_17.offsetMin = Vector2.New(0, 0)
				var_164_17.offsetMax = Vector2.New(0, 0)
			end

			local var_164_18 = 0
			local var_164_19 = 11.59
			local var_164_20 = manager.audio:GetVoiceLength("story_v_out_116361", "116361037", "story_v_out_116361.awb") / 1000

			if var_164_20 > 0 and var_164_19 < var_164_20 and var_164_20 + var_164_18 > arg_161_1.duration_ then
				local var_164_21 = var_164_20

				arg_161_1.duration_ = var_164_20 + var_164_18
			end

			if var_164_18 < arg_161_1.time_ and arg_161_1.time_ <= var_164_18 + arg_164_0 then
				local var_164_22 = "play"
				local var_164_23 = "voice"

				arg_161_1:AudioAction(var_164_22, var_164_23, "story_v_out_116361", "116361037", "story_v_out_116361.awb")
			end

			local var_164_24 = 0

			if var_164_24 < arg_161_1.time_ and arg_161_1.time_ <= var_164_24 + arg_164_0 then
				arg_161_1.allBtn_.enabled = false
			end

			local var_164_25 = 2.15

			if arg_161_1.time_ >= var_164_24 + var_164_25 and arg_161_1.time_ < var_164_24 + var_164_25 + arg_164_0 then
				arg_161_1.allBtn_.enabled = true
			end
		end
	end,
	Play116361038 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 116361038
		arg_165_1.duration_ = 7.743999999999

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play116361039(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.fswbg_:SetActive(true)
				arg_165_1.dialog_:SetActive(false)

				arg_165_1.fswtw_.percent = 0

				local var_168_1 = arg_165_1:GetWordFromCfg(116361038)
				local var_168_2 = arg_165_1:FormatText(var_168_1.content)

				arg_165_1.fswt_.text = var_168_2

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.fswt_)

				arg_165_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_165_1.fswtw_:SetDirty()

				arg_165_1.typewritterCharCountI18N = 0

				SetActive(arg_165_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_165_1:ShowNextGo(false)
			end

			local var_168_3 = 0.0166666666666666

			if var_168_3 < arg_165_1.time_ and arg_165_1.time_ <= var_168_3 + arg_168_0 then
				arg_165_1.var_.oldValueTypewriter = arg_165_1.fswtw_.percent

				arg_165_1:ShowNextGo(false)
			end

			local var_168_4 = 25
			local var_168_5 = 1.66666666666667
			local var_168_6 = arg_165_1:GetWordFromCfg(116361038)
			local var_168_7 = arg_165_1:FormatText(var_168_6.content)
			local var_168_8, var_168_9 = arg_165_1:GetPercentByPara(var_168_7, 1)

			if var_168_3 < arg_165_1.time_ and arg_165_1.time_ <= var_168_3 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0

				local var_168_10 = var_168_4 <= 0 and var_168_5 or var_168_5 * ((var_168_9 - arg_165_1.typewritterCharCountI18N) / var_168_4)

				if var_168_10 > 0 and var_168_5 < var_168_10 then
					arg_165_1.talkMaxDuration = var_168_10

					if var_168_10 + var_168_3 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_10 + var_168_3
					end
				end
			end

			local var_168_11 = 1.66666666666667
			local var_168_12 = math.max(var_168_11, arg_165_1.talkMaxDuration)

			if var_168_3 <= arg_165_1.time_ and arg_165_1.time_ < var_168_3 + var_168_12 then
				local var_168_13 = (arg_165_1.time_ - var_168_3) / var_168_12

				arg_165_1.fswtw_.percent = Mathf.Lerp(arg_165_1.var_.oldValueTypewriter, var_168_8, var_168_13)
				arg_165_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_165_1.fswtw_:SetDirty()
			end

			if arg_165_1.time_ >= var_168_3 + var_168_12 and arg_165_1.time_ < var_168_3 + var_168_12 + arg_168_0 then
				arg_165_1.fswtw_.percent = var_168_8

				arg_165_1.fswtw_:SetDirty()
				arg_165_1:ShowNextGo(true)

				arg_165_1.typewritterCharCountI18N = var_168_9
			end

			local var_168_14 = 0

			if var_168_14 < arg_165_1.time_ and arg_165_1.time_ <= var_168_14 + arg_168_0 then
				local var_168_15 = arg_165_1.fswbg_.transform:Find("textbox/adapt/content") or arg_165_1.fswbg_.transform:Find("textbox/content")
				local var_168_16 = var_168_15:GetComponent("Text")
				local var_168_17 = var_168_15:GetComponent("RectTransform")

				var_168_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_168_17.offsetMin = Vector2.New(0, 0)
				var_168_17.offsetMax = Vector2.New(0, 0)
			end

			local var_168_18 = 0
			local var_168_19 = 7.744
			local var_168_20 = manager.audio:GetVoiceLength("story_v_out_116361", "116361038", "story_v_out_116361.awb") / 1000

			if var_168_20 > 0 and var_168_19 < var_168_20 and var_168_20 + var_168_18 > arg_165_1.duration_ then
				local var_168_21 = var_168_20

				arg_165_1.duration_ = var_168_20 + var_168_18
			end

			if var_168_18 < arg_165_1.time_ and arg_165_1.time_ <= var_168_18 + arg_168_0 then
				local var_168_22 = "play"
				local var_168_23 = "voice"

				arg_165_1:AudioAction(var_168_22, var_168_23, "story_v_out_116361", "116361038", "story_v_out_116361.awb")
			end

			local var_168_24 = 0

			if var_168_24 < arg_165_1.time_ and arg_165_1.time_ <= var_168_24 + arg_168_0 then
				arg_165_1.allBtn_.enabled = false
			end

			local var_168_25 = 1.68333333333333

			if arg_165_1.time_ >= var_168_24 + var_168_25 and arg_165_1.time_ < var_168_24 + var_168_25 + arg_168_0 then
				arg_165_1.allBtn_.enabled = true
			end
		end
	end,
	Play116361039 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 116361039
		arg_169_1.duration_ = 9.701999999999

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play116361040(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.fswbg_:SetActive(true)
				arg_169_1.dialog_:SetActive(false)

				arg_169_1.fswtw_.percent = 0

				local var_172_1 = arg_169_1:GetWordFromCfg(116361039)
				local var_172_2 = arg_169_1:FormatText(var_172_1.content)

				arg_169_1.fswt_.text = var_172_2

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.fswt_)

				arg_169_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_169_1.fswtw_:SetDirty()

				arg_169_1.typewritterCharCountI18N = 0

				SetActive(arg_169_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_169_1:ShowNextGo(false)
			end

			local var_172_3 = 0.0166666666666666

			if var_172_3 < arg_169_1.time_ and arg_169_1.time_ <= var_172_3 + arg_172_0 then
				arg_169_1.var_.oldValueTypewriter = arg_169_1.fswtw_.percent

				arg_169_1:ShowNextGo(false)
			end

			local var_172_4 = 31
			local var_172_5 = 2.06666666666667
			local var_172_6 = arg_169_1:GetWordFromCfg(116361039)
			local var_172_7 = arg_169_1:FormatText(var_172_6.content)
			local var_172_8, var_172_9 = arg_169_1:GetPercentByPara(var_172_7, 1)

			if var_172_3 < arg_169_1.time_ and arg_169_1.time_ <= var_172_3 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0

				local var_172_10 = var_172_4 <= 0 and var_172_5 or var_172_5 * ((var_172_9 - arg_169_1.typewritterCharCountI18N) / var_172_4)

				if var_172_10 > 0 and var_172_5 < var_172_10 then
					arg_169_1.talkMaxDuration = var_172_10

					if var_172_10 + var_172_3 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_10 + var_172_3
					end
				end
			end

			local var_172_11 = 2.06666666666667
			local var_172_12 = math.max(var_172_11, arg_169_1.talkMaxDuration)

			if var_172_3 <= arg_169_1.time_ and arg_169_1.time_ < var_172_3 + var_172_12 then
				local var_172_13 = (arg_169_1.time_ - var_172_3) / var_172_12

				arg_169_1.fswtw_.percent = Mathf.Lerp(arg_169_1.var_.oldValueTypewriter, var_172_8, var_172_13)
				arg_169_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_169_1.fswtw_:SetDirty()
			end

			if arg_169_1.time_ >= var_172_3 + var_172_12 and arg_169_1.time_ < var_172_3 + var_172_12 + arg_172_0 then
				arg_169_1.fswtw_.percent = var_172_8

				arg_169_1.fswtw_:SetDirty()
				arg_169_1:ShowNextGo(true)

				arg_169_1.typewritterCharCountI18N = var_172_9
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				local var_172_15 = arg_169_1.fswbg_.transform:Find("textbox/adapt/content") or arg_169_1.fswbg_.transform:Find("textbox/content")
				local var_172_16 = var_172_15:GetComponent("Text")
				local var_172_17 = var_172_15:GetComponent("RectTransform")

				var_172_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_172_17.offsetMin = Vector2.New(0, 0)
				var_172_17.offsetMax = Vector2.New(0, 0)
			end

			local var_172_18 = 0
			local var_172_19 = 9.702
			local var_172_20 = manager.audio:GetVoiceLength("story_v_out_116361", "116361039", "story_v_out_116361.awb") / 1000

			if var_172_20 > 0 and var_172_19 < var_172_20 and var_172_20 + var_172_18 > arg_169_1.duration_ then
				local var_172_21 = var_172_20

				arg_169_1.duration_ = var_172_20 + var_172_18
			end

			if var_172_18 < arg_169_1.time_ and arg_169_1.time_ <= var_172_18 + arg_172_0 then
				local var_172_22 = "play"
				local var_172_23 = "voice"

				arg_169_1:AudioAction(var_172_22, var_172_23, "story_v_out_116361", "116361039", "story_v_out_116361.awb")
			end

			local var_172_24 = 0

			if var_172_24 < arg_169_1.time_ and arg_169_1.time_ <= var_172_24 + arg_172_0 then
				arg_169_1.allBtn_.enabled = false
			end

			local var_172_25 = 2.06666666666667

			if arg_169_1.time_ >= var_172_24 + var_172_25 and arg_169_1.time_ < var_172_24 + var_172_25 + arg_172_0 then
				arg_169_1.allBtn_.enabled = true
			end
		end
	end,
	Play116361040 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 116361040
		arg_173_1.duration_ = 14.840999999999

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play116361041(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.fswbg_:SetActive(true)
				arg_173_1.dialog_:SetActive(false)

				arg_173_1.fswtw_.percent = 0

				local var_176_1 = arg_173_1:GetWordFromCfg(116361040)
				local var_176_2 = arg_173_1:FormatText(var_176_1.content)

				arg_173_1.fswt_.text = var_176_2

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.fswt_)

				arg_173_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_173_1.fswtw_:SetDirty()

				arg_173_1.typewritterCharCountI18N = 0

				SetActive(arg_173_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_173_1:ShowNextGo(false)
			end

			local var_176_3 = 0.0166666666666666

			if var_176_3 < arg_173_1.time_ and arg_173_1.time_ <= var_176_3 + arg_176_0 then
				arg_173_1.var_.oldValueTypewriter = arg_173_1.fswtw_.percent

				arg_173_1:ShowNextGo(false)
			end

			local var_176_4 = 49
			local var_176_5 = 3.33333333333333
			local var_176_6 = arg_173_1:GetWordFromCfg(116361040)
			local var_176_7 = arg_173_1:FormatText(var_176_6.content)
			local var_176_8, var_176_9 = arg_173_1:GetPercentByPara(var_176_7, 1)

			if var_176_3 < arg_173_1.time_ and arg_173_1.time_ <= var_176_3 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				local var_176_10 = var_176_4 <= 0 and var_176_5 or var_176_5 * ((var_176_9 - arg_173_1.typewritterCharCountI18N) / var_176_4)

				if var_176_10 > 0 and var_176_5 < var_176_10 then
					arg_173_1.talkMaxDuration = var_176_10

					if var_176_10 + var_176_3 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_10 + var_176_3
					end
				end
			end

			local var_176_11 = 3.33333333333333
			local var_176_12 = math.max(var_176_11, arg_173_1.talkMaxDuration)

			if var_176_3 <= arg_173_1.time_ and arg_173_1.time_ < var_176_3 + var_176_12 then
				local var_176_13 = (arg_173_1.time_ - var_176_3) / var_176_12

				arg_173_1.fswtw_.percent = Mathf.Lerp(arg_173_1.var_.oldValueTypewriter, var_176_8, var_176_13)
				arg_173_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_173_1.fswtw_:SetDirty()
			end

			if arg_173_1.time_ >= var_176_3 + var_176_12 and arg_173_1.time_ < var_176_3 + var_176_12 + arg_176_0 then
				arg_173_1.fswtw_.percent = var_176_8

				arg_173_1.fswtw_:SetDirty()
				arg_173_1:ShowNextGo(true)

				arg_173_1.typewritterCharCountI18N = var_176_9
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				local var_176_15 = arg_173_1.fswbg_.transform:Find("textbox/adapt/content") or arg_173_1.fswbg_.transform:Find("textbox/content")
				local var_176_16 = var_176_15:GetComponent("Text")
				local var_176_17 = var_176_15:GetComponent("RectTransform")

				var_176_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_176_17.offsetMin = Vector2.New(0, 0)
				var_176_17.offsetMax = Vector2.New(0, 0)
			end

			local var_176_18 = 0
			local var_176_19 = 14.841
			local var_176_20 = manager.audio:GetVoiceLength("story_v_out_116361", "116361040", "story_v_out_116361.awb") / 1000

			if var_176_20 > 0 and var_176_19 < var_176_20 and var_176_20 + var_176_18 > arg_173_1.duration_ then
				local var_176_21 = var_176_20

				arg_173_1.duration_ = var_176_20 + var_176_18
			end

			if var_176_18 < arg_173_1.time_ and arg_173_1.time_ <= var_176_18 + arg_176_0 then
				local var_176_22 = "play"
				local var_176_23 = "voice"

				arg_173_1:AudioAction(var_176_22, var_176_23, "story_v_out_116361", "116361040", "story_v_out_116361.awb")
			end

			local var_176_24 = 0

			if var_176_24 < arg_173_1.time_ and arg_173_1.time_ <= var_176_24 + arg_176_0 then
				arg_173_1.allBtn_.enabled = false
			end

			local var_176_25 = 3.35

			if arg_173_1.time_ >= var_176_24 + var_176_25 and arg_173_1.time_ < var_176_24 + var_176_25 + arg_176_0 then
				arg_173_1.allBtn_.enabled = true
			end
		end
	end,
	Play116361041 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 116361041
		arg_177_1.duration_ = 5.433

		local var_177_0 = {
			zh = 5.366,
			ja = 5.433
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
				arg_177_0:Play116361042(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 2

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				local var_180_1 = manager.ui.mainCamera.transform.localPosition
				local var_180_2 = Vector3.New(0, 0, 10) + Vector3.New(var_180_1.x, var_180_1.y, 0)
				local var_180_3 = arg_177_1.bgs_.I07a

				var_180_3.transform.localPosition = var_180_2
				var_180_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_180_4 = var_180_3:GetComponent("SpriteRenderer")

				if var_180_4 and var_180_4.sprite then
					local var_180_5 = (var_180_3.transform.localPosition - var_180_1).z
					local var_180_6 = manager.ui.mainCameraCom_
					local var_180_7 = 2 * var_180_5 * Mathf.Tan(var_180_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_180_8 = var_180_7 * var_180_6.aspect
					local var_180_9 = var_180_4.sprite.bounds.size.x
					local var_180_10 = var_180_4.sprite.bounds.size.y
					local var_180_11 = var_180_8 / var_180_9
					local var_180_12 = var_180_7 / var_180_10
					local var_180_13 = var_180_12 < var_180_11 and var_180_11 or var_180_12

					var_180_3.transform.localScale = Vector3.New(var_180_13, var_180_13, 0)
				end

				for iter_180_0, iter_180_1 in pairs(arg_177_1.bgs_) do
					if iter_180_0 ~= "I07a" then
						iter_180_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 then
				arg_177_1.fswbg_:SetActive(false)
				arg_177_1.dialog_:SetActive(true)
				arg_177_1:ShowNextGo(false)
			end

			local var_180_15 = 4
			local var_180_16 = 0.266666666666667

			if var_180_15 < arg_177_1.time_ and arg_177_1.time_ <= var_180_15 + arg_180_0 then
				local var_180_17 = "play"
				local var_180_18 = "music"

				arg_177_1:AudioAction(var_180_17, var_180_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_180_19 = 4.4
			local var_180_20 = 0.6

			if var_180_19 < arg_177_1.time_ and arg_177_1.time_ <= var_180_19 + arg_180_0 then
				local var_180_21 = "play"
				local var_180_22 = "music"

				arg_177_1:AudioAction(var_180_21, var_180_22, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			local var_180_23 = 0

			if var_180_23 < arg_177_1.time_ and arg_177_1.time_ <= var_180_23 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_24 = 2

			if var_180_23 <= arg_177_1.time_ and arg_177_1.time_ < var_180_23 + var_180_24 then
				local var_180_25 = (arg_177_1.time_ - var_180_23) / var_180_24
				local var_180_26 = Color.New(0, 0, 0)

				var_180_26.a = Mathf.Lerp(0, 1, var_180_25)
				arg_177_1.mask_.color = var_180_26
			end

			if arg_177_1.time_ >= var_180_23 + var_180_24 and arg_177_1.time_ < var_180_23 + var_180_24 + arg_180_0 then
				local var_180_27 = Color.New(0, 0, 0)

				var_180_27.a = 1
				arg_177_1.mask_.color = var_180_27
			end

			local var_180_28 = 2

			if var_180_28 < arg_177_1.time_ and arg_177_1.time_ <= var_180_28 + arg_180_0 then
				arg_177_1.mask_.enabled = true
				arg_177_1.mask_.raycastTarget = true

				arg_177_1:SetGaussion(false)
			end

			local var_180_29 = 2

			if var_180_28 <= arg_177_1.time_ and arg_177_1.time_ < var_180_28 + var_180_29 then
				local var_180_30 = (arg_177_1.time_ - var_180_28) / var_180_29
				local var_180_31 = Color.New(0, 0, 0)

				var_180_31.a = Mathf.Lerp(1, 0, var_180_30)
				arg_177_1.mask_.color = var_180_31
			end

			if arg_177_1.time_ >= var_180_28 + var_180_29 and arg_177_1.time_ < var_180_28 + var_180_29 + arg_180_0 then
				local var_180_32 = Color.New(0, 0, 0)
				local var_180_33 = 0

				arg_177_1.mask_.enabled = false
				var_180_32.a = var_180_33
				arg_177_1.mask_.color = var_180_32
			end

			if arg_177_1.frameCnt_ <= 1 then
				arg_177_1.dialog_:SetActive(false)
			end

			local var_180_34 = 4
			local var_180_35 = 0.125

			if var_180_34 < arg_177_1.time_ and arg_177_1.time_ <= var_180_34 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0

				arg_177_1.dialog_:SetActive(true)

				local var_180_36 = LeanTween.value(arg_177_1.dialog_, 0, 1, 0.3)

				var_180_36:setOnUpdate(LuaHelper.FloatAction(function(arg_181_0)
					arg_177_1.dialogCg_.alpha = arg_181_0
				end))
				var_180_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_177_1.dialog_)
					var_180_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_177_1.duration_ = arg_177_1.duration_ + 0.3

				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_37 = arg_177_1:FormatText(StoryNameCfg[332].name)

				arg_177_1.leftNameTxt_.text = var_180_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_38 = arg_177_1:GetWordFromCfg(116361041)
				local var_180_39 = arg_177_1:FormatText(var_180_38.content)

				arg_177_1.text_.text = var_180_39

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_40 = 5
				local var_180_41 = utf8.len(var_180_39)
				local var_180_42 = var_180_40 <= 0 and var_180_35 or var_180_35 * (var_180_41 / var_180_40)

				if var_180_42 > 0 and var_180_35 < var_180_42 then
					arg_177_1.talkMaxDuration = var_180_42
					var_180_34 = var_180_34 + 0.3

					if var_180_42 + var_180_34 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_42 + var_180_34
					end
				end

				arg_177_1.text_.text = var_180_39
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361041", "story_v_out_116361.awb") ~= 0 then
					local var_180_43 = manager.audio:GetVoiceLength("story_v_out_116361", "116361041", "story_v_out_116361.awb") / 1000

					if var_180_43 + var_180_34 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_43 + var_180_34
					end

					if var_180_38.prefab_name ~= "" and arg_177_1.actors_[var_180_38.prefab_name] ~= nil then
						local var_180_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_38.prefab_name].transform, "story_v_out_116361", "116361041", "story_v_out_116361.awb")

						arg_177_1:RecordAudio("116361041", var_180_44)
						arg_177_1:RecordAudio("116361041", var_180_44)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_116361", "116361041", "story_v_out_116361.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_116361", "116361041", "story_v_out_116361.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_45 = var_180_34 + 0.3
			local var_180_46 = math.max(var_180_35, arg_177_1.talkMaxDuration)

			if var_180_45 <= arg_177_1.time_ and arg_177_1.time_ < var_180_45 + var_180_46 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_45) / var_180_46

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_45 + var_180_46 and arg_177_1.time_ < var_180_45 + var_180_46 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play116361042 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 116361042
		arg_183_1.duration_ = 2.066

		local var_183_0 = {
			zh = 2.066,
			ja = 0.999999999999
		}
		local var_183_1 = manager.audio:GetLocalizationFlag()

		if var_183_0[var_183_1] ~= nil then
			arg_183_1.duration_ = var_183_0[var_183_1]
		end

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play116361043(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.1

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(116361042)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 4
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361042", "story_v_out_116361.awb") ~= 0 then
					local var_186_7 = manager.audio:GetVoiceLength("story_v_out_116361", "116361042", "story_v_out_116361.awb") / 1000

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end

					if var_186_2.prefab_name ~= "" and arg_183_1.actors_[var_186_2.prefab_name] ~= nil then
						local var_186_8 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_2.prefab_name].transform, "story_v_out_116361", "116361042", "story_v_out_116361.awb")

						arg_183_1:RecordAudio("116361042", var_186_8)
						arg_183_1:RecordAudio("116361042", var_186_8)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_116361", "116361042", "story_v_out_116361.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_116361", "116361042", "story_v_out_116361.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_9 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_9 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_9

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_9 and arg_183_1.time_ < var_186_0 + var_186_9 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play116361043 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 116361043
		arg_187_1.duration_ = 4.566

		local var_187_0 = {
			zh = 4.566,
			ja = 3.766
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play116361044(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.425

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[328].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, true)
				arg_187_1.iconController_:SetSelectedState("hero")

				arg_187_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(116361043)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 17
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361043", "story_v_out_116361.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_116361", "116361043", "story_v_out_116361.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_116361", "116361043", "story_v_out_116361.awb")

						arg_187_1:RecordAudio("116361043", var_190_9)
						arg_187_1:RecordAudio("116361043", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_116361", "116361043", "story_v_out_116361.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_116361", "116361043", "story_v_out_116361.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play116361044 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 116361044
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play116361045(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 1.175

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_2 = arg_191_1:GetWordFromCfg(116361044)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 47
				local var_194_5 = utf8.len(var_194_3)
				local var_194_6 = var_194_4 <= 0 and var_194_1 or var_194_1 * (var_194_5 / var_194_4)

				if var_194_6 > 0 and var_194_1 < var_194_6 then
					arg_191_1.talkMaxDuration = var_194_6

					if var_194_6 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_6 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_3
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_7 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_7 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_7

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_7 and arg_191_1.time_ < var_194_0 + var_194_7 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play116361045 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 116361045
		arg_195_1.duration_ = 3.766

		local var_195_0 = {
			zh = 3.7,
			ja = 3.766
		}
		local var_195_1 = manager.audio:GetLocalizationFlag()

		if var_195_0[var_195_1] ~= nil then
			arg_195_1.duration_ = var_195_0[var_195_1]
		end

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play116361046(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.375

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[332].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, true)
				arg_195_1.iconController_:SetSelectedState("hero")

				arg_195_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(116361045)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 15
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361045", "story_v_out_116361.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_116361", "116361045", "story_v_out_116361.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_116361", "116361045", "story_v_out_116361.awb")

						arg_195_1:RecordAudio("116361045", var_198_9)
						arg_195_1:RecordAudio("116361045", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_116361", "116361045", "story_v_out_116361.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_116361", "116361045", "story_v_out_116361.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play116361046 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 116361046
		arg_199_1.duration_ = 2.533

		local var_199_0 = {
			zh = 2.533,
			ja = 2.433
		}
		local var_199_1 = manager.audio:GetLocalizationFlag()

		if var_199_0[var_199_1] ~= nil then
			arg_199_1.duration_ = var_199_0[var_199_1]
		end

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play116361047(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action2_1")
			end

			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_202_2 = arg_199_1.actors_["10032ui_story"]
			local var_202_3 = 0

			if var_202_3 < arg_199_1.time_ and arg_199_1.time_ <= var_202_3 + arg_202_0 and arg_199_1.var_.characterEffect10032ui_story == nil then
				arg_199_1.var_.characterEffect10032ui_story = var_202_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_4 = 0.2

			if var_202_3 <= arg_199_1.time_ and arg_199_1.time_ < var_202_3 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_3) / var_202_4

				if arg_199_1.var_.characterEffect10032ui_story then
					arg_199_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_3 + var_202_4 and arg_199_1.time_ < var_202_3 + var_202_4 + arg_202_0 and arg_199_1.var_.characterEffect10032ui_story then
				arg_199_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_202_6 = arg_199_1.actors_["10032ui_story"].transform
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 then
				arg_199_1.var_.moveOldPos10032ui_story = var_202_6.localPosition
			end

			local var_202_8 = 0.001

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8
				local var_202_10 = Vector3.New(0, -1.1, -5.9)

				var_202_6.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10032ui_story, var_202_10, var_202_9)

				local var_202_11 = manager.ui.mainCamera.transform.position - var_202_6.position

				var_202_6.forward = Vector3.New(var_202_11.x, var_202_11.y, var_202_11.z)

				local var_202_12 = var_202_6.localEulerAngles

				var_202_12.z = 0
				var_202_12.x = 0
				var_202_6.localEulerAngles = var_202_12
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 then
				var_202_6.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_202_13 = manager.ui.mainCamera.transform.position - var_202_6.position

				var_202_6.forward = Vector3.New(var_202_13.x, var_202_13.y, var_202_13.z)

				local var_202_14 = var_202_6.localEulerAngles

				var_202_14.z = 0
				var_202_14.x = 0
				var_202_6.localEulerAngles = var_202_14
			end

			local var_202_15 = 0
			local var_202_16 = 0.3

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_17 = arg_199_1:FormatText(StoryNameCfg[328].name)

				arg_199_1.leftNameTxt_.text = var_202_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_18 = arg_199_1:GetWordFromCfg(116361046)
				local var_202_19 = arg_199_1:FormatText(var_202_18.content)

				arg_199_1.text_.text = var_202_19

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_20 = 12
				local var_202_21 = utf8.len(var_202_19)
				local var_202_22 = var_202_20 <= 0 and var_202_16 or var_202_16 * (var_202_21 / var_202_20)

				if var_202_22 > 0 and var_202_16 < var_202_22 then
					arg_199_1.talkMaxDuration = var_202_22

					if var_202_22 + var_202_15 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_22 + var_202_15
					end
				end

				arg_199_1.text_.text = var_202_19
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361046", "story_v_out_116361.awb") ~= 0 then
					local var_202_23 = manager.audio:GetVoiceLength("story_v_out_116361", "116361046", "story_v_out_116361.awb") / 1000

					if var_202_23 + var_202_15 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_23 + var_202_15
					end

					if var_202_18.prefab_name ~= "" and arg_199_1.actors_[var_202_18.prefab_name] ~= nil then
						local var_202_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_18.prefab_name].transform, "story_v_out_116361", "116361046", "story_v_out_116361.awb")

						arg_199_1:RecordAudio("116361046", var_202_24)
						arg_199_1:RecordAudio("116361046", var_202_24)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_116361", "116361046", "story_v_out_116361.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_116361", "116361046", "story_v_out_116361.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_25 = math.max(var_202_16, arg_199_1.talkMaxDuration)

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_25 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_15) / var_202_25

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_15 + var_202_25 and arg_199_1.time_ < var_202_15 + var_202_25 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play116361047 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 116361047
		arg_203_1.duration_ = 8.7

		local var_203_0 = {
			zh = 8.7,
			ja = 6.933
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play116361048(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10032ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect10032ui_story == nil then
				arg_203_1.var_.characterEffect10032ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect10032ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_203_1.var_.characterEffect10032ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect10032ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_203_1.var_.characterEffect10032ui_story.fillRatio = var_206_5
			end

			local var_206_6 = 0
			local var_206_7 = 0.975

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[332].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, true)
				arg_203_1.iconController_:SetSelectedState("hero")

				arg_203_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(116361047)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 38
				local var_206_12 = utf8.len(var_206_10)
				local var_206_13 = var_206_11 <= 0 and var_206_7 or var_206_7 * (var_206_12 / var_206_11)

				if var_206_13 > 0 and var_206_7 < var_206_13 then
					arg_203_1.talkMaxDuration = var_206_13

					if var_206_13 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_13 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_10
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361047", "story_v_out_116361.awb") ~= 0 then
					local var_206_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361047", "story_v_out_116361.awb") / 1000

					if var_206_14 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_14 + var_206_6
					end

					if var_206_9.prefab_name ~= "" and arg_203_1.actors_[var_206_9.prefab_name] ~= nil then
						local var_206_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_9.prefab_name].transform, "story_v_out_116361", "116361047", "story_v_out_116361.awb")

						arg_203_1:RecordAudio("116361047", var_206_15)
						arg_203_1:RecordAudio("116361047", var_206_15)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_116361", "116361047", "story_v_out_116361.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_116361", "116361047", "story_v_out_116361.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_16 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_16 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_16

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_16 and arg_203_1.time_ < var_206_6 + var_206_16 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play116361048 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 116361048
		arg_207_1.duration_ = 10.366

		local var_207_0 = {
			zh = 6.9,
			ja = 10.366
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play116361049(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_210_1 = arg_207_1.actors_["10032ui_story"]
			local var_210_2 = 0

			if var_210_2 < arg_207_1.time_ and arg_207_1.time_ <= var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect10032ui_story == nil then
				arg_207_1.var_.characterEffect10032ui_story = var_210_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_3 = 0.2

			if var_210_2 <= arg_207_1.time_ and arg_207_1.time_ < var_210_2 + var_210_3 then
				local var_210_4 = (arg_207_1.time_ - var_210_2) / var_210_3

				if arg_207_1.var_.characterEffect10032ui_story then
					arg_207_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_2 + var_210_3 and arg_207_1.time_ < var_210_2 + var_210_3 + arg_210_0 and arg_207_1.var_.characterEffect10032ui_story then
				arg_207_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_210_5 = 0
			local var_210_6 = 0.65

			if var_210_5 < arg_207_1.time_ and arg_207_1.time_ <= var_210_5 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_7 = arg_207_1:FormatText(StoryNameCfg[328].name)

				arg_207_1.leftNameTxt_.text = var_210_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_8 = arg_207_1:GetWordFromCfg(116361048)
				local var_210_9 = arg_207_1:FormatText(var_210_8.content)

				arg_207_1.text_.text = var_210_9

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_10 = 26
				local var_210_11 = utf8.len(var_210_9)
				local var_210_12 = var_210_10 <= 0 and var_210_6 or var_210_6 * (var_210_11 / var_210_10)

				if var_210_12 > 0 and var_210_6 < var_210_12 then
					arg_207_1.talkMaxDuration = var_210_12

					if var_210_12 + var_210_5 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_12 + var_210_5
					end
				end

				arg_207_1.text_.text = var_210_9
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361048", "story_v_out_116361.awb") ~= 0 then
					local var_210_13 = manager.audio:GetVoiceLength("story_v_out_116361", "116361048", "story_v_out_116361.awb") / 1000

					if var_210_13 + var_210_5 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_13 + var_210_5
					end

					if var_210_8.prefab_name ~= "" and arg_207_1.actors_[var_210_8.prefab_name] ~= nil then
						local var_210_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_8.prefab_name].transform, "story_v_out_116361", "116361048", "story_v_out_116361.awb")

						arg_207_1:RecordAudio("116361048", var_210_14)
						arg_207_1:RecordAudio("116361048", var_210_14)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_116361", "116361048", "story_v_out_116361.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_116361", "116361048", "story_v_out_116361.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_15 = math.max(var_210_6, arg_207_1.talkMaxDuration)

			if var_210_5 <= arg_207_1.time_ and arg_207_1.time_ < var_210_5 + var_210_15 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_5) / var_210_15

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_5 + var_210_15 and arg_207_1.time_ < var_210_5 + var_210_15 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play116361049 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 116361049
		arg_211_1.duration_ = 8.566

		local var_211_0 = {
			zh = 8.566,
			ja = 7.2
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play116361050(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10032ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect10032ui_story == nil then
				arg_211_1.var_.characterEffect10032ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect10032ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_211_1.var_.characterEffect10032ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect10032ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_211_1.var_.characterEffect10032ui_story.fillRatio = var_214_5
			end

			local var_214_6 = 0
			local var_214_7 = 0.775

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_8 = arg_211_1:FormatText(StoryNameCfg[332].name)

				arg_211_1.leftNameTxt_.text = var_214_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, true)
				arg_211_1.iconController_:SetSelectedState("hero")

				arg_211_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_9 = arg_211_1:GetWordFromCfg(116361049)
				local var_214_10 = arg_211_1:FormatText(var_214_9.content)

				arg_211_1.text_.text = var_214_10

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_11 = 31
				local var_214_12 = utf8.len(var_214_10)
				local var_214_13 = var_214_11 <= 0 and var_214_7 or var_214_7 * (var_214_12 / var_214_11)

				if var_214_13 > 0 and var_214_7 < var_214_13 then
					arg_211_1.talkMaxDuration = var_214_13

					if var_214_13 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_13 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_10
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361049", "story_v_out_116361.awb") ~= 0 then
					local var_214_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361049", "story_v_out_116361.awb") / 1000

					if var_214_14 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_14 + var_214_6
					end

					if var_214_9.prefab_name ~= "" and arg_211_1.actors_[var_214_9.prefab_name] ~= nil then
						local var_214_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_9.prefab_name].transform, "story_v_out_116361", "116361049", "story_v_out_116361.awb")

						arg_211_1:RecordAudio("116361049", var_214_15)
						arg_211_1:RecordAudio("116361049", var_214_15)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_116361", "116361049", "story_v_out_116361.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_116361", "116361049", "story_v_out_116361.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_16 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_16 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_16

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_16 and arg_211_1.time_ < var_214_6 + var_214_16 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play116361050 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 116361050
		arg_215_1.duration_ = 2.6

		local var_215_0 = {
			zh = 2.6,
			ja = 1.999999999999
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play116361051(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_218_1 = arg_215_1.actors_["10032ui_story"]
			local var_218_2 = 0

			if var_218_2 < arg_215_1.time_ and arg_215_1.time_ <= var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect10032ui_story == nil then
				arg_215_1.var_.characterEffect10032ui_story = var_218_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_3 = 0.2

			if var_218_2 <= arg_215_1.time_ and arg_215_1.time_ < var_218_2 + var_218_3 then
				local var_218_4 = (arg_215_1.time_ - var_218_2) / var_218_3

				if arg_215_1.var_.characterEffect10032ui_story then
					arg_215_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_2 + var_218_3 and arg_215_1.time_ < var_218_2 + var_218_3 + arg_218_0 and arg_215_1.var_.characterEffect10032ui_story then
				arg_215_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_218_5 = 0
			local var_218_6 = 0.275

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_7 = arg_215_1:FormatText(StoryNameCfg[328].name)

				arg_215_1.leftNameTxt_.text = var_218_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_8 = arg_215_1:GetWordFromCfg(116361050)
				local var_218_9 = arg_215_1:FormatText(var_218_8.content)

				arg_215_1.text_.text = var_218_9

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_10 = 11
				local var_218_11 = utf8.len(var_218_9)
				local var_218_12 = var_218_10 <= 0 and var_218_6 or var_218_6 * (var_218_11 / var_218_10)

				if var_218_12 > 0 and var_218_6 < var_218_12 then
					arg_215_1.talkMaxDuration = var_218_12

					if var_218_12 + var_218_5 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_12 + var_218_5
					end
				end

				arg_215_1.text_.text = var_218_9
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361050", "story_v_out_116361.awb") ~= 0 then
					local var_218_13 = manager.audio:GetVoiceLength("story_v_out_116361", "116361050", "story_v_out_116361.awb") / 1000

					if var_218_13 + var_218_5 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_5
					end

					if var_218_8.prefab_name ~= "" and arg_215_1.actors_[var_218_8.prefab_name] ~= nil then
						local var_218_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_8.prefab_name].transform, "story_v_out_116361", "116361050", "story_v_out_116361.awb")

						arg_215_1:RecordAudio("116361050", var_218_14)
						arg_215_1:RecordAudio("116361050", var_218_14)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_116361", "116361050", "story_v_out_116361.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_116361", "116361050", "story_v_out_116361.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_15 = math.max(var_218_6, arg_215_1.talkMaxDuration)

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_15 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_5) / var_218_15

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_5 + var_218_15 and arg_215_1.time_ < var_218_5 + var_218_15 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play116361051 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 116361051
		arg_219_1.duration_ = 7.233

		local var_219_0 = {
			zh = 3.666,
			ja = 7.233
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play116361052(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10032ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect10032ui_story == nil then
				arg_219_1.var_.characterEffect10032ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect10032ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_219_1.var_.characterEffect10032ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect10032ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_219_1.var_.characterEffect10032ui_story.fillRatio = var_222_5
			end

			local var_222_6 = 0
			local var_222_7 = 0.375

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_8 = arg_219_1:FormatText(StoryNameCfg[332].name)

				arg_219_1.leftNameTxt_.text = var_222_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_9 = arg_219_1:GetWordFromCfg(116361051)
				local var_222_10 = arg_219_1:FormatText(var_222_9.content)

				arg_219_1.text_.text = var_222_10

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_11 = 15
				local var_222_12 = utf8.len(var_222_10)
				local var_222_13 = var_222_11 <= 0 and var_222_7 or var_222_7 * (var_222_12 / var_222_11)

				if var_222_13 > 0 and var_222_7 < var_222_13 then
					arg_219_1.talkMaxDuration = var_222_13

					if var_222_13 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_13 + var_222_6
					end
				end

				arg_219_1.text_.text = var_222_10
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361051", "story_v_out_116361.awb") ~= 0 then
					local var_222_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361051", "story_v_out_116361.awb") / 1000

					if var_222_14 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_14 + var_222_6
					end

					if var_222_9.prefab_name ~= "" and arg_219_1.actors_[var_222_9.prefab_name] ~= nil then
						local var_222_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_9.prefab_name].transform, "story_v_out_116361", "116361051", "story_v_out_116361.awb")

						arg_219_1:RecordAudio("116361051", var_222_15)
						arg_219_1:RecordAudio("116361051", var_222_15)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_116361", "116361051", "story_v_out_116361.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_116361", "116361051", "story_v_out_116361.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_16 = math.max(var_222_7, arg_219_1.talkMaxDuration)

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_16 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_6) / var_222_16

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_6 + var_222_16 and arg_219_1.time_ < var_222_6 + var_222_16 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play116361052 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 116361052
		arg_223_1.duration_ = 9.966

		local var_223_0 = {
			zh = 7.666,
			ja = 9.966
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play116361053(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = "10024ui_story"

			if arg_223_1.actors_[var_226_0] == nil then
				local var_226_1 = Object.Instantiate(Asset.Load("Char/" .. var_226_0), arg_223_1.stage_.transform)

				var_226_1.name = var_226_0
				var_226_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_223_1.actors_[var_226_0] = var_226_1

				local var_226_2 = var_226_1:GetComponentInChildren(typeof(CharacterEffect))

				var_226_2.enabled = true

				local var_226_3 = GameObjectTools.GetOrAddComponent(var_226_1, typeof(DynamicBoneHelper))

				if var_226_3 then
					var_226_3:EnableDynamicBone(false)
				end

				arg_223_1:ShowWeapon(var_226_2.transform, false)

				arg_223_1.var_[var_226_0 .. "Animator"] = var_226_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_223_1.var_[var_226_0 .. "Animator"].applyRootMotion = true
				arg_223_1.var_[var_226_0 .. "LipSync"] = var_226_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_226_4 = 0

			if var_226_4 < arg_223_1.time_ and arg_223_1.time_ <= var_226_4 + arg_226_0 then
				arg_223_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 then
				arg_223_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_226_6 = 0
			local var_226_7 = 0.825

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[332].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, true)
				arg_223_1.iconController_:SetSelectedState("hero")

				arg_223_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(116361052)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 33
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361052", "story_v_out_116361.awb") ~= 0 then
					local var_226_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361052", "story_v_out_116361.awb") / 1000

					if var_226_14 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_14 + var_226_6
					end

					if var_226_9.prefab_name ~= "" and arg_223_1.actors_[var_226_9.prefab_name] ~= nil then
						local var_226_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_9.prefab_name].transform, "story_v_out_116361", "116361052", "story_v_out_116361.awb")

						arg_223_1:RecordAudio("116361052", var_226_15)
						arg_223_1:RecordAudio("116361052", var_226_15)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_116361", "116361052", "story_v_out_116361.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_116361", "116361052", "story_v_out_116361.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_16 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_16 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_16

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_16 and arg_223_1.time_ < var_226_6 + var_226_16 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play116361053 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 116361053
		arg_227_1.duration_ = 9.566

		local var_227_0 = {
			zh = 9.566,
			ja = 6.9
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play116361054(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025actionlink/10025action424")
			end

			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_230_2 = arg_227_1.actors_["10032ui_story"]
			local var_230_3 = 0

			if var_230_3 < arg_227_1.time_ and arg_227_1.time_ <= var_230_3 + arg_230_0 and arg_227_1.var_.characterEffect10032ui_story == nil then
				arg_227_1.var_.characterEffect10032ui_story = var_230_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_4 = 0.2

			if var_230_3 <= arg_227_1.time_ and arg_227_1.time_ < var_230_3 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_3) / var_230_4

				if arg_227_1.var_.characterEffect10032ui_story then
					arg_227_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_3 + var_230_4 and arg_227_1.time_ < var_230_3 + var_230_4 + arg_230_0 and arg_227_1.var_.characterEffect10032ui_story then
				arg_227_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_230_6 = 0
			local var_230_7 = 0.85

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[328].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(116361053)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 34
				local var_230_12 = utf8.len(var_230_10)
				local var_230_13 = var_230_11 <= 0 and var_230_7 or var_230_7 * (var_230_12 / var_230_11)

				if var_230_13 > 0 and var_230_7 < var_230_13 then
					arg_227_1.talkMaxDuration = var_230_13

					if var_230_13 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_13 + var_230_6
					end
				end

				arg_227_1.text_.text = var_230_10
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361053", "story_v_out_116361.awb") ~= 0 then
					local var_230_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361053", "story_v_out_116361.awb") / 1000

					if var_230_14 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_6
					end

					if var_230_9.prefab_name ~= "" and arg_227_1.actors_[var_230_9.prefab_name] ~= nil then
						local var_230_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_9.prefab_name].transform, "story_v_out_116361", "116361053", "story_v_out_116361.awb")

						arg_227_1:RecordAudio("116361053", var_230_15)
						arg_227_1:RecordAudio("116361053", var_230_15)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_116361", "116361053", "story_v_out_116361.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_116361", "116361053", "story_v_out_116361.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_16 = math.max(var_230_7, arg_227_1.talkMaxDuration)

			if var_230_6 <= arg_227_1.time_ and arg_227_1.time_ < var_230_6 + var_230_16 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_6) / var_230_16

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_6 + var_230_16 and arg_227_1.time_ < var_230_6 + var_230_16 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play116361054 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 116361054
		arg_231_1.duration_ = 13.1

		local var_231_0 = {
			zh = 10.666,
			ja = 13.1
		}
		local var_231_1 = manager.audio:GetLocalizationFlag()

		if var_231_0[var_231_1] ~= nil then
			arg_231_1.duration_ = var_231_0[var_231_1]
		end

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play116361055(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10032ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect10032ui_story == nil then
				arg_231_1.var_.characterEffect10032ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect10032ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_231_1.var_.characterEffect10032ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect10032ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_231_1.var_.characterEffect10032ui_story.fillRatio = var_234_5
			end

			local var_234_6 = 0
			local var_234_7 = 1.075

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_8 = arg_231_1:FormatText(StoryNameCfg[332].name)

				arg_231_1.leftNameTxt_.text = var_234_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, true)
				arg_231_1.iconController_:SetSelectedState("hero")

				arg_231_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_9 = arg_231_1:GetWordFromCfg(116361054)
				local var_234_10 = arg_231_1:FormatText(var_234_9.content)

				arg_231_1.text_.text = var_234_10

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_11 = 43
				local var_234_12 = utf8.len(var_234_10)
				local var_234_13 = var_234_11 <= 0 and var_234_7 or var_234_7 * (var_234_12 / var_234_11)

				if var_234_13 > 0 and var_234_7 < var_234_13 then
					arg_231_1.talkMaxDuration = var_234_13

					if var_234_13 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_13 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_10
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361054", "story_v_out_116361.awb") ~= 0 then
					local var_234_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361054", "story_v_out_116361.awb") / 1000

					if var_234_14 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_14 + var_234_6
					end

					if var_234_9.prefab_name ~= "" and arg_231_1.actors_[var_234_9.prefab_name] ~= nil then
						local var_234_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_9.prefab_name].transform, "story_v_out_116361", "116361054", "story_v_out_116361.awb")

						arg_231_1:RecordAudio("116361054", var_234_15)
						arg_231_1:RecordAudio("116361054", var_234_15)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_116361", "116361054", "story_v_out_116361.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_116361", "116361054", "story_v_out_116361.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_16 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_16 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_16

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_16 and arg_231_1.time_ < var_234_6 + var_234_16 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play116361055 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 116361055
		arg_235_1.duration_ = 3.566

		local var_235_0 = {
			zh = 2.533,
			ja = 3.566
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play116361056(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.325

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[332].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, true)
				arg_235_1.iconController_:SetSelectedState("hero")

				arg_235_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(116361055)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 13
				local var_238_6 = utf8.len(var_238_4)
				local var_238_7 = var_238_5 <= 0 and var_238_1 or var_238_1 * (var_238_6 / var_238_5)

				if var_238_7 > 0 and var_238_1 < var_238_7 then
					arg_235_1.talkMaxDuration = var_238_7

					if var_238_7 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_7 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_4
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361055", "story_v_out_116361.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_116361", "116361055", "story_v_out_116361.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_116361", "116361055", "story_v_out_116361.awb")

						arg_235_1:RecordAudio("116361055", var_238_9)
						arg_235_1:RecordAudio("116361055", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_116361", "116361055", "story_v_out_116361.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_116361", "116361055", "story_v_out_116361.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_10 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_10 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_10

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_10 and arg_235_1.time_ < var_238_0 + var_238_10 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play116361056 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 116361056
		arg_239_1.duration_ = 3.466

		local var_239_0 = {
			zh = 1.999999999999,
			ja = 3.466
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
				arg_239_0:Play116361057(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_242_1 = arg_239_1.actors_["10032ui_story"]
			local var_242_2 = 0

			if var_242_2 < arg_239_1.time_ and arg_239_1.time_ <= var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect10032ui_story == nil then
				arg_239_1.var_.characterEffect10032ui_story = var_242_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_3 = 0.2

			if var_242_2 <= arg_239_1.time_ and arg_239_1.time_ < var_242_2 + var_242_3 then
				local var_242_4 = (arg_239_1.time_ - var_242_2) / var_242_3

				if arg_239_1.var_.characterEffect10032ui_story then
					arg_239_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_2 + var_242_3 and arg_239_1.time_ < var_242_2 + var_242_3 + arg_242_0 and arg_239_1.var_.characterEffect10032ui_story then
				arg_239_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_242_5 = 0
			local var_242_6 = 0.175

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_7 = arg_239_1:FormatText(StoryNameCfg[328].name)

				arg_239_1.leftNameTxt_.text = var_242_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_8 = arg_239_1:GetWordFromCfg(116361056)
				local var_242_9 = arg_239_1:FormatText(var_242_8.content)

				arg_239_1.text_.text = var_242_9

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_10 = 7
				local var_242_11 = utf8.len(var_242_9)
				local var_242_12 = var_242_10 <= 0 and var_242_6 or var_242_6 * (var_242_11 / var_242_10)

				if var_242_12 > 0 and var_242_6 < var_242_12 then
					arg_239_1.talkMaxDuration = var_242_12

					if var_242_12 + var_242_5 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_12 + var_242_5
					end
				end

				arg_239_1.text_.text = var_242_9
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361056", "story_v_out_116361.awb") ~= 0 then
					local var_242_13 = manager.audio:GetVoiceLength("story_v_out_116361", "116361056", "story_v_out_116361.awb") / 1000

					if var_242_13 + var_242_5 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_5
					end

					if var_242_8.prefab_name ~= "" and arg_239_1.actors_[var_242_8.prefab_name] ~= nil then
						local var_242_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_8.prefab_name].transform, "story_v_out_116361", "116361056", "story_v_out_116361.awb")

						arg_239_1:RecordAudio("116361056", var_242_14)
						arg_239_1:RecordAudio("116361056", var_242_14)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_116361", "116361056", "story_v_out_116361.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_116361", "116361056", "story_v_out_116361.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_15 = math.max(var_242_6, arg_239_1.talkMaxDuration)

			if var_242_5 <= arg_239_1.time_ and arg_239_1.time_ < var_242_5 + var_242_15 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_5) / var_242_15

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_5 + var_242_15 and arg_239_1.time_ < var_242_5 + var_242_15 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play116361057 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 116361057
		arg_243_1.duration_ = 6.7

		local var_243_0 = {
			zh = 6,
			ja = 6.7
		}
		local var_243_1 = manager.audio:GetLocalizationFlag()

		if var_243_0[var_243_1] ~= nil then
			arg_243_1.duration_ = var_243_0[var_243_1]
		end

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play116361058(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["10032ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect10032ui_story == nil then
				arg_243_1.var_.characterEffect10032ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.2

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect10032ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_243_1.var_.characterEffect10032ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect10032ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_243_1.var_.characterEffect10032ui_story.fillRatio = var_246_5
			end

			local var_246_6 = 0
			local var_246_7 = 0.65

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_8 = arg_243_1:FormatText(StoryNameCfg[332].name)

				arg_243_1.leftNameTxt_.text = var_246_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, true)
				arg_243_1.iconController_:SetSelectedState("hero")

				arg_243_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_9 = arg_243_1:GetWordFromCfg(116361057)
				local var_246_10 = arg_243_1:FormatText(var_246_9.content)

				arg_243_1.text_.text = var_246_10

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_11 = 26
				local var_246_12 = utf8.len(var_246_10)
				local var_246_13 = var_246_11 <= 0 and var_246_7 or var_246_7 * (var_246_12 / var_246_11)

				if var_246_13 > 0 and var_246_7 < var_246_13 then
					arg_243_1.talkMaxDuration = var_246_13

					if var_246_13 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_13 + var_246_6
					end
				end

				arg_243_1.text_.text = var_246_10
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361057", "story_v_out_116361.awb") ~= 0 then
					local var_246_14 = manager.audio:GetVoiceLength("story_v_out_116361", "116361057", "story_v_out_116361.awb") / 1000

					if var_246_14 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_14 + var_246_6
					end

					if var_246_9.prefab_name ~= "" and arg_243_1.actors_[var_246_9.prefab_name] ~= nil then
						local var_246_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_9.prefab_name].transform, "story_v_out_116361", "116361057", "story_v_out_116361.awb")

						arg_243_1:RecordAudio("116361057", var_246_15)
						arg_243_1:RecordAudio("116361057", var_246_15)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_116361", "116361057", "story_v_out_116361.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_116361", "116361057", "story_v_out_116361.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_16 = math.max(var_246_7, arg_243_1.talkMaxDuration)

			if var_246_6 <= arg_243_1.time_ and arg_243_1.time_ < var_246_6 + var_246_16 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_6) / var_246_16

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_6 + var_246_16 and arg_243_1.time_ < var_246_6 + var_246_16 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play116361058 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 116361058
		arg_247_1.duration_ = 17.7

		local var_247_0 = {
			zh = 17.7,
			ja = 12.6
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play116361059(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10032ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos10032ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, 100, 0)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10032ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, 100, 0)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = 0
			local var_250_10 = 1.575

			if var_250_9 < arg_247_1.time_ and arg_247_1.time_ <= var_250_9 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_11 = arg_247_1:GetWordFromCfg(116361058)
				local var_250_12 = arg_247_1:FormatText(var_250_11.content)

				arg_247_1.text_.text = var_250_12

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_13 = 63
				local var_250_14 = utf8.len(var_250_12)
				local var_250_15 = var_250_13 <= 0 and var_250_10 or var_250_10 * (var_250_14 / var_250_13)

				if var_250_15 > 0 and var_250_10 < var_250_15 then
					arg_247_1.talkMaxDuration = var_250_15

					if var_250_15 + var_250_9 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_15 + var_250_9
					end
				end

				arg_247_1.text_.text = var_250_12
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361058", "story_v_out_116361.awb") ~= 0 then
					local var_250_16 = manager.audio:GetVoiceLength("story_v_out_116361", "116361058", "story_v_out_116361.awb") / 1000

					if var_250_16 + var_250_9 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_16 + var_250_9
					end

					if var_250_11.prefab_name ~= "" and arg_247_1.actors_[var_250_11.prefab_name] ~= nil then
						local var_250_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_11.prefab_name].transform, "story_v_out_116361", "116361058", "story_v_out_116361.awb")

						arg_247_1:RecordAudio("116361058", var_250_17)
						arg_247_1:RecordAudio("116361058", var_250_17)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_116361", "116361058", "story_v_out_116361.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_116361", "116361058", "story_v_out_116361.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_18 = math.max(var_250_10, arg_247_1.talkMaxDuration)

			if var_250_9 <= arg_247_1.time_ and arg_247_1.time_ < var_250_9 + var_250_18 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_9) / var_250_18

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_9 + var_250_18 and arg_247_1.time_ < var_250_9 + var_250_18 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play116361059 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 116361059
		arg_251_1.duration_ = 11.9

		local var_251_0 = {
			zh = 11.9,
			ja = 4.433
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play116361060(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.7

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_2 = arg_251_1:GetWordFromCfg(116361059)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 28
				local var_254_5 = utf8.len(var_254_3)
				local var_254_6 = var_254_4 <= 0 and var_254_1 or var_254_1 * (var_254_5 / var_254_4)

				if var_254_6 > 0 and var_254_1 < var_254_6 then
					arg_251_1.talkMaxDuration = var_254_6

					if var_254_6 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_6 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_3
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361059", "story_v_out_116361.awb") ~= 0 then
					local var_254_7 = manager.audio:GetVoiceLength("story_v_out_116361", "116361059", "story_v_out_116361.awb") / 1000

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end

					if var_254_2.prefab_name ~= "" and arg_251_1.actors_[var_254_2.prefab_name] ~= nil then
						local var_254_8 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_2.prefab_name].transform, "story_v_out_116361", "116361059", "story_v_out_116361.awb")

						arg_251_1:RecordAudio("116361059", var_254_8)
						arg_251_1:RecordAudio("116361059", var_254_8)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_116361", "116361059", "story_v_out_116361.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_116361", "116361059", "story_v_out_116361.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_9 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_9 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_9

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_9 and arg_251_1.time_ < var_254_0 + var_254_9 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play116361060 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 116361060
		arg_255_1.duration_ = 7.133

		local var_255_0 = {
			zh = 5.266,
			ja = 7.133
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
			arg_255_1.auto_ = false
		end

		function arg_255_1.playNext_(arg_257_0)
			arg_255_1.onStoryFinished_()
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.425

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_2 = arg_255_1:GetWordFromCfg(116361060)
				local var_258_3 = arg_255_1:FormatText(var_258_2.content)

				arg_255_1.text_.text = var_258_3

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_4 = 17
				local var_258_5 = utf8.len(var_258_3)
				local var_258_6 = var_258_4 <= 0 and var_258_1 or var_258_1 * (var_258_5 / var_258_4)

				if var_258_6 > 0 and var_258_1 < var_258_6 then
					arg_255_1.talkMaxDuration = var_258_6

					if var_258_6 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_6 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_3
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116361", "116361060", "story_v_out_116361.awb") ~= 0 then
					local var_258_7 = manager.audio:GetVoiceLength("story_v_out_116361", "116361060", "story_v_out_116361.awb") / 1000

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end

					if var_258_2.prefab_name ~= "" and arg_255_1.actors_[var_258_2.prefab_name] ~= nil then
						local var_258_8 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_2.prefab_name].transform, "story_v_out_116361", "116361060", "story_v_out_116361.awb")

						arg_255_1:RecordAudio("116361060", var_258_8)
						arg_255_1:RecordAudio("116361060", var_258_8)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_116361", "116361060", "story_v_out_116361.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_116361", "116361060", "story_v_out_116361.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_9 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_9 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_9

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_9 and arg_255_1.time_ < var_258_0 + var_258_9 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07a",
		"SofdecAsset/story/story_101161201.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST15",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03_blur",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite"
	},
	voices = {
		"story_v_out_116361.awb"
	},
	skipMarkers = {
		116361001,
		116361005
	}
}
