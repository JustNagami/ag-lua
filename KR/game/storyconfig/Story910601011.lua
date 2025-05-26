return {
	Play910601001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 910601001
		arg_1_1.duration_ = 7.4

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play910601002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "B13"

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
				local var_4_5 = arg_1_1.bgs_.B13

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
					if iter_4_0 ~= "B13" then
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

			local var_4_22 = "1084ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("Char/" .. var_4_22), arg_1_1.stage_.transform)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_22] = var_4_23

				local var_4_24 = var_4_23:GetComponentInChildren(typeof(CharacterEffect))

				var_4_24.enabled = true

				local var_4_25 = GameObjectTools.GetOrAddComponent(var_4_23, typeof(DynamicBoneHelper))

				if var_4_25 then
					var_4_25:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_24.transform, false)

				arg_1_1.var_[var_4_22 .. "Animator"] = var_4_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_22 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_22 .. "LipSync"] = var_4_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_26 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_26.localPosition

				local var_4_28 = "1084ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_28 .. "Animator"].transform, false)
			end

			local var_4_29 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_27) / var_4_29
				local var_4_31 = Vector3.New(0, -0.97, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_31, var_4_30)

				local var_4_32 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_32.x, var_4_32.y, var_4_32.z)

				local var_4_33 = var_4_26.localEulerAngles

				var_4_33.z = 0
				var_4_33.x = 0
				var_4_26.localEulerAngles = var_4_33
			end

			if arg_1_1.time_ >= var_4_27 + var_4_29 and arg_1_1.time_ < var_4_27 + var_4_29 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.97, -6)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_26.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_26.localEulerAngles = var_4_35
			end

			local var_4_36 = arg_1_1.actors_["1084ui_story"]
			local var_4_37 = 2

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.200000002980232

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_4_42 = 0

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.screenFilterGo_:SetActive(true)

				arg_1_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_4_43 = 2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_4_44)
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.screenFilterEffect_.weight = 1
			end

			local var_4_45 = 0
			local var_4_46 = 0.633333333333333

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.825

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_51 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_51:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(910601001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601001", "story_v_out_910601.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_910601", "910601001", "story_v_out_910601.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_910601", "910601001", "story_v_out_910601.awb")

						arg_1_1:RecordAudio("910601001", var_4_59)
						arg_1_1:RecordAudio("910601001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_910601", "910601001", "story_v_out_910601.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_910601", "910601001", "story_v_out_910601.awb")
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
	Play910601002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 910601002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play910601003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1084ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1084ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.65

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(910601002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 26
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
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_14 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_14 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_14

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_14 and arg_7_1.time_ < var_10_6 + var_10_14 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play910601003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 910601003
		arg_11_1.duration_ = 5.033

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play910601004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1011ui_story"

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

			local var_14_4 = arg_11_1.actors_["1011ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1011ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0.7, -0.71, -6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1011ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1011ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story == nil then
				arg_11_1.var_.characterEffect1011ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1011ui_story then
					arg_11_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story then
				arg_11_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_19.localPosition
			end

			local var_14_21 = 0.001

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21
				local var_14_23 = Vector3.New(-0.7, -0.97, -6)

				var_14_19.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_23, var_14_22)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_19.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_19.localEulerAngles = var_14_25
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 then
				var_14_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_14_26 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_26.x, var_14_26.y, var_14_26.z)

				local var_14_27 = var_14_19.localEulerAngles

				var_14_27.z = 0
				var_14_27.x = 0
				var_14_19.localEulerAngles = var_14_27
			end

			local var_14_28 = arg_11_1.actors_["1084ui_story"]
			local var_14_29 = 0

			if var_14_29 < arg_11_1.time_ and arg_11_1.time_ <= var_14_29 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_30 = 0.200000002980232

			if var_14_29 <= arg_11_1.time_ and arg_11_1.time_ < var_14_29 + var_14_30 then
				local var_14_31 = (arg_11_1.time_ - var_14_29) / var_14_30

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_32 = Mathf.Lerp(0, 0.5, var_14_31)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_32
				end
			end

			if arg_11_1.time_ >= var_14_29 + var_14_30 and arg_11_1.time_ < var_14_29 + var_14_30 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_33 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_33
			end

			local var_14_34 = 0

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_2")
			end

			local var_14_35 = 0

			if var_14_35 < arg_11_1.time_ and arg_11_1.time_ <= var_14_35 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_14_36 = 0
			local var_14_37 = 0.725

			if var_14_36 < arg_11_1.time_ and arg_11_1.time_ <= var_14_36 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_38 = arg_11_1:FormatText(StoryNameCfg[37].name)

				arg_11_1.leftNameTxt_.text = var_14_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_39 = arg_11_1:GetWordFromCfg(910601003)
				local var_14_40 = arg_11_1:FormatText(var_14_39.content)

				arg_11_1.text_.text = var_14_40

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_41 = 29
				local var_14_42 = utf8.len(var_14_40)
				local var_14_43 = var_14_41 <= 0 and var_14_37 or var_14_37 * (var_14_42 / var_14_41)

				if var_14_43 > 0 and var_14_37 < var_14_43 then
					arg_11_1.talkMaxDuration = var_14_43

					if var_14_43 + var_14_36 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_43 + var_14_36
					end
				end

				arg_11_1.text_.text = var_14_40
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601003", "story_v_out_910601.awb") ~= 0 then
					local var_14_44 = manager.audio:GetVoiceLength("story_v_out_910601", "910601003", "story_v_out_910601.awb") / 1000

					if var_14_44 + var_14_36 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_44 + var_14_36
					end

					if var_14_39.prefab_name ~= "" and arg_11_1.actors_[var_14_39.prefab_name] ~= nil then
						local var_14_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_39.prefab_name].transform, "story_v_out_910601", "910601003", "story_v_out_910601.awb")

						arg_11_1:RecordAudio("910601003", var_14_45)
						arg_11_1:RecordAudio("910601003", var_14_45)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_910601", "910601003", "story_v_out_910601.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_910601", "910601003", "story_v_out_910601.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_46 = math.max(var_14_37, arg_11_1.talkMaxDuration)

			if var_14_36 <= arg_11_1.time_ and arg_11_1.time_ < var_14_36 + var_14_46 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_36) / var_14_46

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_36 + var_14_46 and arg_11_1.time_ < var_14_36 + var_14_46 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play910601004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 910601004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play910601005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1011ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story == nil then
				arg_15_1.var_.characterEffect1011ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1011ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.65

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(910601004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 26
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
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_14 and arg_15_1.time_ < var_18_6 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play910601005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 910601005
		arg_19_1.duration_ = 7.533

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play910601006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1048ui_story"

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

			local var_22_4 = arg_19_1.actors_["1048ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1048ui_story = var_22_4.localPosition

				local var_22_6 = "1048ui_story"

				arg_19_1:ShowWeapon(arg_19_1.var_[var_22_6 .. "Animator"].transform, false)
			end

			local var_22_7 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_7 then
				local var_22_8 = (arg_19_1.time_ - var_22_5) / var_22_7
				local var_22_9 = Vector3.New(0, -0.8, -6.2)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1048ui_story, var_22_9, var_22_8)

				local var_22_10 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_10.x, var_22_10.y, var_22_10.z)

				local var_22_11 = var_22_4.localEulerAngles

				var_22_11.z = 0
				var_22_11.x = 0
				var_22_4.localEulerAngles = var_22_11
			end

			if arg_19_1.time_ >= var_22_5 + var_22_7 and arg_19_1.time_ < var_22_5 + var_22_7 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_22_12 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_12.x, var_22_12.y, var_22_12.z)

				local var_22_13 = var_22_4.localEulerAngles

				var_22_13.z = 0
				var_22_13.x = 0
				var_22_4.localEulerAngles = var_22_13
			end

			local var_22_14 = arg_19_1.actors_["1048ui_story"]
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect1048ui_story == nil then
				arg_19_1.var_.characterEffect1048ui_story = var_22_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_16 = 0.200000002980232

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16

				if arg_19_1.var_.characterEffect1048ui_story then
					arg_19_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 and arg_19_1.var_.characterEffect1048ui_story then
				arg_19_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_22_19 = 0

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_20 = arg_19_1.actors_["1011ui_story"].transform
			local var_22_21 = 0

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.var_.moveOldPos1011ui_story = var_22_20.localPosition
			end

			local var_22_22 = 0.001

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_22 then
				local var_22_23 = (arg_19_1.time_ - var_22_21) / var_22_22
				local var_22_24 = Vector3.New(0, 100, 0)

				var_22_20.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1011ui_story, var_22_24, var_22_23)

				local var_22_25 = manager.ui.mainCamera.transform.position - var_22_20.position

				var_22_20.forward = Vector3.New(var_22_25.x, var_22_25.y, var_22_25.z)

				local var_22_26 = var_22_20.localEulerAngles

				var_22_26.z = 0
				var_22_26.x = 0
				var_22_20.localEulerAngles = var_22_26
			end

			if arg_19_1.time_ >= var_22_21 + var_22_22 and arg_19_1.time_ < var_22_21 + var_22_22 + arg_22_0 then
				var_22_20.localPosition = Vector3.New(0, 100, 0)

				local var_22_27 = manager.ui.mainCamera.transform.position - var_22_20.position

				var_22_20.forward = Vector3.New(var_22_27.x, var_22_27.y, var_22_27.z)

				local var_22_28 = var_22_20.localEulerAngles

				var_22_28.z = 0
				var_22_28.x = 0
				var_22_20.localEulerAngles = var_22_28
			end

			local var_22_29 = arg_19_1.actors_["1011ui_story"]
			local var_22_30 = 0

			if var_22_30 < arg_19_1.time_ and arg_19_1.time_ <= var_22_30 + arg_22_0 and arg_19_1.var_.characterEffect1011ui_story == nil then
				arg_19_1.var_.characterEffect1011ui_story = var_22_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_31 = 0.200000002980232

			if var_22_30 <= arg_19_1.time_ and arg_19_1.time_ < var_22_30 + var_22_31 then
				local var_22_32 = (arg_19_1.time_ - var_22_30) / var_22_31

				if arg_19_1.var_.characterEffect1011ui_story then
					local var_22_33 = Mathf.Lerp(0, 0.5, var_22_32)

					arg_19_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1011ui_story.fillRatio = var_22_33
				end
			end

			if arg_19_1.time_ >= var_22_30 + var_22_31 and arg_19_1.time_ < var_22_30 + var_22_31 + arg_22_0 and arg_19_1.var_.characterEffect1011ui_story then
				local var_22_34 = 0.5

				arg_19_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1011ui_story.fillRatio = var_22_34
			end

			local var_22_35 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_36 = 0

			if var_22_36 < arg_19_1.time_ and arg_19_1.time_ <= var_22_36 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_35.localPosition
			end

			local var_22_37 = 0.001

			if var_22_36 <= arg_19_1.time_ and arg_19_1.time_ < var_22_36 + var_22_37 then
				local var_22_38 = (arg_19_1.time_ - var_22_36) / var_22_37
				local var_22_39 = Vector3.New(0, 100, 0)

				var_22_35.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_39, var_22_38)

				local var_22_40 = manager.ui.mainCamera.transform.position - var_22_35.position

				var_22_35.forward = Vector3.New(var_22_40.x, var_22_40.y, var_22_40.z)

				local var_22_41 = var_22_35.localEulerAngles

				var_22_41.z = 0
				var_22_41.x = 0
				var_22_35.localEulerAngles = var_22_41
			end

			if arg_19_1.time_ >= var_22_36 + var_22_37 and arg_19_1.time_ < var_22_36 + var_22_37 + arg_22_0 then
				var_22_35.localPosition = Vector3.New(0, 100, 0)

				local var_22_42 = manager.ui.mainCamera.transform.position - var_22_35.position

				var_22_35.forward = Vector3.New(var_22_42.x, var_22_42.y, var_22_42.z)

				local var_22_43 = var_22_35.localEulerAngles

				var_22_43.z = 0
				var_22_43.x = 0
				var_22_35.localEulerAngles = var_22_43
			end

			local var_22_44 = arg_19_1.actors_["1084ui_story"]
			local var_22_45 = 0

			if var_22_45 < arg_19_1.time_ and arg_19_1.time_ <= var_22_45 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_46 = 0.200000002980232

			if var_22_45 <= arg_19_1.time_ and arg_19_1.time_ < var_22_45 + var_22_46 then
				local var_22_47 = (arg_19_1.time_ - var_22_45) / var_22_46

				if arg_19_1.var_.characterEffect1084ui_story then
					local var_22_48 = Mathf.Lerp(0, 0.5, var_22_47)

					arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_48
				end
			end

			if arg_19_1.time_ >= var_22_45 + var_22_46 and arg_19_1.time_ < var_22_45 + var_22_46 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				local var_22_49 = 0.5

				arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_49
			end

			local var_22_50 = 0
			local var_22_51 = 0.875

			if var_22_50 < arg_19_1.time_ and arg_19_1.time_ <= var_22_50 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_52 = arg_19_1:FormatText(StoryNameCfg[8].name)

				arg_19_1.leftNameTxt_.text = var_22_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_53 = arg_19_1:GetWordFromCfg(910601005)
				local var_22_54 = arg_19_1:FormatText(var_22_53.content)

				arg_19_1.text_.text = var_22_54

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_55 = 35
				local var_22_56 = utf8.len(var_22_54)
				local var_22_57 = var_22_55 <= 0 and var_22_51 or var_22_51 * (var_22_56 / var_22_55)

				if var_22_57 > 0 and var_22_51 < var_22_57 then
					arg_19_1.talkMaxDuration = var_22_57

					if var_22_57 + var_22_50 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_57 + var_22_50
					end
				end

				arg_19_1.text_.text = var_22_54
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601005", "story_v_out_910601.awb") ~= 0 then
					local var_22_58 = manager.audio:GetVoiceLength("story_v_out_910601", "910601005", "story_v_out_910601.awb") / 1000

					if var_22_58 + var_22_50 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_58 + var_22_50
					end

					if var_22_53.prefab_name ~= "" and arg_19_1.actors_[var_22_53.prefab_name] ~= nil then
						local var_22_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_53.prefab_name].transform, "story_v_out_910601", "910601005", "story_v_out_910601.awb")

						arg_19_1:RecordAudio("910601005", var_22_59)
						arg_19_1:RecordAudio("910601005", var_22_59)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_910601", "910601005", "story_v_out_910601.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_910601", "910601005", "story_v_out_910601.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_60 = math.max(var_22_51, arg_19_1.talkMaxDuration)

			if var_22_50 <= arg_19_1.time_ and arg_19_1.time_ < var_22_50 + var_22_60 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_50) / var_22_60

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_50 + var_22_60 and arg_19_1.time_ < var_22_50 + var_22_60 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play910601006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 910601006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play910601007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1048ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1048ui_story == nil then
				arg_23_1.var_.characterEffect1048ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1048ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1048ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1048ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1048ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.425

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(910601006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 17
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
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_14 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_14 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_14

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_14 and arg_23_1.time_ < var_26_6 + var_26_14 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play910601007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 910601007
		arg_27_1.duration_ = 9.466

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play910601008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1019ui_story"

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

			local var_30_4 = arg_27_1.actors_["1019ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos1019ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(0.7, -1.08, -5.9)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1019ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = arg_27_1.actors_["1019ui_story"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_15 = 0.200000002980232

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.characterEffect1019ui_story then
					arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_19 = arg_27_1.actors_["1048ui_story"].transform
			local var_30_20 = 0

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.var_.moveOldPos1048ui_story = var_30_19.localPosition
			end

			local var_30_21 = 0.001

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_21 then
				local var_30_22 = (arg_27_1.time_ - var_30_20) / var_30_21
				local var_30_23 = Vector3.New(-0.7, -0.8, -6.2)

				var_30_19.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1048ui_story, var_30_23, var_30_22)

				local var_30_24 = manager.ui.mainCamera.transform.position - var_30_19.position

				var_30_19.forward = Vector3.New(var_30_24.x, var_30_24.y, var_30_24.z)

				local var_30_25 = var_30_19.localEulerAngles

				var_30_25.z = 0
				var_30_25.x = 0
				var_30_19.localEulerAngles = var_30_25
			end

			if arg_27_1.time_ >= var_30_20 + var_30_21 and arg_27_1.time_ < var_30_20 + var_30_21 + arg_30_0 then
				var_30_19.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_30_26 = manager.ui.mainCamera.transform.position - var_30_19.position

				var_30_19.forward = Vector3.New(var_30_26.x, var_30_26.y, var_30_26.z)

				local var_30_27 = var_30_19.localEulerAngles

				var_30_27.z = 0
				var_30_27.x = 0
				var_30_19.localEulerAngles = var_30_27
			end

			local var_30_28 = arg_27_1.actors_["1048ui_story"]
			local var_30_29 = 0

			if var_30_29 < arg_27_1.time_ and arg_27_1.time_ <= var_30_29 + arg_30_0 and arg_27_1.var_.characterEffect1048ui_story == nil then
				arg_27_1.var_.characterEffect1048ui_story = var_30_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_30 = 0.200000002980232

			if var_30_29 <= arg_27_1.time_ and arg_27_1.time_ < var_30_29 + var_30_30 then
				local var_30_31 = (arg_27_1.time_ - var_30_29) / var_30_30

				if arg_27_1.var_.characterEffect1048ui_story then
					local var_30_32 = Mathf.Lerp(0, 0.5, var_30_31)

					arg_27_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1048ui_story.fillRatio = var_30_32
				end
			end

			if arg_27_1.time_ >= var_30_29 + var_30_30 and arg_27_1.time_ < var_30_29 + var_30_30 + arg_30_0 and arg_27_1.var_.characterEffect1048ui_story then
				local var_30_33 = 0.5

				arg_27_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1048ui_story.fillRatio = var_30_33
			end

			local var_30_34 = 0
			local var_30_35 = 1.05

			if var_30_34 < arg_27_1.time_ and arg_27_1.time_ <= var_30_34 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_36 = arg_27_1:FormatText(StoryNameCfg[13].name)

				arg_27_1.leftNameTxt_.text = var_30_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_37 = arg_27_1:GetWordFromCfg(910601007)
				local var_30_38 = arg_27_1:FormatText(var_30_37.content)

				arg_27_1.text_.text = var_30_38

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_39 = 42
				local var_30_40 = utf8.len(var_30_38)
				local var_30_41 = var_30_39 <= 0 and var_30_35 or var_30_35 * (var_30_40 / var_30_39)

				if var_30_41 > 0 and var_30_35 < var_30_41 then
					arg_27_1.talkMaxDuration = var_30_41

					if var_30_41 + var_30_34 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_41 + var_30_34
					end
				end

				arg_27_1.text_.text = var_30_38
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601007", "story_v_out_910601.awb") ~= 0 then
					local var_30_42 = manager.audio:GetVoiceLength("story_v_out_910601", "910601007", "story_v_out_910601.awb") / 1000

					if var_30_42 + var_30_34 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_42 + var_30_34
					end

					if var_30_37.prefab_name ~= "" and arg_27_1.actors_[var_30_37.prefab_name] ~= nil then
						local var_30_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_37.prefab_name].transform, "story_v_out_910601", "910601007", "story_v_out_910601.awb")

						arg_27_1:RecordAudio("910601007", var_30_43)
						arg_27_1:RecordAudio("910601007", var_30_43)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_910601", "910601007", "story_v_out_910601.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_910601", "910601007", "story_v_out_910601.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_44 = math.max(var_30_35, arg_27_1.talkMaxDuration)

			if var_30_34 <= arg_27_1.time_ and arg_27_1.time_ < var_30_34 + var_30_44 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_34) / var_30_44

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_34 + var_30_44 and arg_27_1.time_ < var_30_34 + var_30_44 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play910601008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 910601008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play910601009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1019ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story == nil then
				arg_31_1.var_.characterEffect1019ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1019ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.45

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[7].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(910601008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 18
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_14 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_14 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_14

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_14 and arg_31_1.time_ < var_34_6 + var_34_14 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play910601009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 910601009
		arg_35_1.duration_ = 9

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play910601010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "STwhite"

			if arg_35_1.bgs_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(arg_35_1.paintGo_)

				var_38_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_38_0)
				var_38_1.name = var_38_0
				var_38_1.transform.parent = arg_35_1.stage_.transform
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.bgs_[var_38_0] = var_38_1
			end

			local var_38_2 = 2

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 then
				local var_38_3 = manager.ui.mainCamera.transform.localPosition
				local var_38_4 = Vector3.New(0, 0, 10) + Vector3.New(var_38_3.x, var_38_3.y, 0)
				local var_38_5 = arg_35_1.bgs_.STwhite

				var_38_5.transform.localPosition = var_38_4
				var_38_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_6 = var_38_5:GetComponent("SpriteRenderer")

				if var_38_6 and var_38_6.sprite then
					local var_38_7 = (var_38_5.transform.localPosition - var_38_3).z
					local var_38_8 = manager.ui.mainCameraCom_
					local var_38_9 = 2 * var_38_7 * Mathf.Tan(var_38_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_10 = var_38_9 * var_38_8.aspect
					local var_38_11 = var_38_6.sprite.bounds.size.x
					local var_38_12 = var_38_6.sprite.bounds.size.y
					local var_38_13 = var_38_10 / var_38_11
					local var_38_14 = var_38_9 / var_38_12
					local var_38_15 = var_38_14 < var_38_13 and var_38_13 or var_38_14

					var_38_5.transform.localScale = Vector3.New(var_38_15, var_38_15, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "STwhite" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_17 = 2

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Color.New(0, 0, 0)

				var_38_19.a = Mathf.Lerp(0, 1, var_38_18)
				arg_35_1.mask_.color = var_38_19
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				local var_38_20 = Color.New(0, 0, 0)

				var_38_20.a = 1
				arg_35_1.mask_.color = var_38_20
			end

			local var_38_21 = 2

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_22 = 2

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22
				local var_38_24 = Color.New(0, 0, 0)

				var_38_24.a = Mathf.Lerp(1, 0, var_38_23)
				arg_35_1.mask_.color = var_38_24
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 then
				local var_38_25 = Color.New(0, 0, 0)
				local var_38_26 = 0

				arg_35_1.mask_.enabled = false
				var_38_25.a = var_38_26
				arg_35_1.mask_.color = var_38_25
			end

			local var_38_27 = arg_35_1.actors_["1019ui_story"].transform
			local var_38_28 = 2

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019ui_story = var_38_27.localPosition
			end

			local var_38_29 = 0.001

			if var_38_28 <= arg_35_1.time_ and arg_35_1.time_ < var_38_28 + var_38_29 then
				local var_38_30 = (arg_35_1.time_ - var_38_28) / var_38_29
				local var_38_31 = Vector3.New(0, 100, 0)

				var_38_27.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019ui_story, var_38_31, var_38_30)

				local var_38_32 = manager.ui.mainCamera.transform.position - var_38_27.position

				var_38_27.forward = Vector3.New(var_38_32.x, var_38_32.y, var_38_32.z)

				local var_38_33 = var_38_27.localEulerAngles

				var_38_33.z = 0
				var_38_33.x = 0
				var_38_27.localEulerAngles = var_38_33
			end

			if arg_35_1.time_ >= var_38_28 + var_38_29 and arg_35_1.time_ < var_38_28 + var_38_29 + arg_38_0 then
				var_38_27.localPosition = Vector3.New(0, 100, 0)

				local var_38_34 = manager.ui.mainCamera.transform.position - var_38_27.position

				var_38_27.forward = Vector3.New(var_38_34.x, var_38_34.y, var_38_34.z)

				local var_38_35 = var_38_27.localEulerAngles

				var_38_35.z = 0
				var_38_35.x = 0
				var_38_27.localEulerAngles = var_38_35
			end

			local var_38_36 = arg_35_1.actors_["1019ui_story"]
			local var_38_37 = 2

			if var_38_37 < arg_35_1.time_ and arg_35_1.time_ <= var_38_37 + arg_38_0 and arg_35_1.var_.characterEffect1019ui_story == nil then
				arg_35_1.var_.characterEffect1019ui_story = var_38_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_38 = 0.200000002980232

			if var_38_37 <= arg_35_1.time_ and arg_35_1.time_ < var_38_37 + var_38_38 then
				local var_38_39 = (arg_35_1.time_ - var_38_37) / var_38_38

				if arg_35_1.var_.characterEffect1019ui_story then
					local var_38_40 = Mathf.Lerp(0, 0.5, var_38_39)

					arg_35_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1019ui_story.fillRatio = var_38_40
				end
			end

			if arg_35_1.time_ >= var_38_37 + var_38_38 and arg_35_1.time_ < var_38_37 + var_38_38 + arg_38_0 and arg_35_1.var_.characterEffect1019ui_story then
				local var_38_41 = 0.5

				arg_35_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1019ui_story.fillRatio = var_38_41
			end

			local var_38_42 = arg_35_1.actors_["1048ui_story"].transform
			local var_38_43 = 2

			if var_38_43 < arg_35_1.time_ and arg_35_1.time_ <= var_38_43 + arg_38_0 then
				arg_35_1.var_.moveOldPos1048ui_story = var_38_42.localPosition
			end

			local var_38_44 = 0.001

			if var_38_43 <= arg_35_1.time_ and arg_35_1.time_ < var_38_43 + var_38_44 then
				local var_38_45 = (arg_35_1.time_ - var_38_43) / var_38_44
				local var_38_46 = Vector3.New(0, 100, 0)

				var_38_42.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1048ui_story, var_38_46, var_38_45)

				local var_38_47 = manager.ui.mainCamera.transform.position - var_38_42.position

				var_38_42.forward = Vector3.New(var_38_47.x, var_38_47.y, var_38_47.z)

				local var_38_48 = var_38_42.localEulerAngles

				var_38_48.z = 0
				var_38_48.x = 0
				var_38_42.localEulerAngles = var_38_48
			end

			if arg_35_1.time_ >= var_38_43 + var_38_44 and arg_35_1.time_ < var_38_43 + var_38_44 + arg_38_0 then
				var_38_42.localPosition = Vector3.New(0, 100, 0)

				local var_38_49 = manager.ui.mainCamera.transform.position - var_38_42.position

				var_38_42.forward = Vector3.New(var_38_49.x, var_38_49.y, var_38_49.z)

				local var_38_50 = var_38_42.localEulerAngles

				var_38_50.z = 0
				var_38_50.x = 0
				var_38_42.localEulerAngles = var_38_50
			end

			local var_38_51 = arg_35_1.actors_["1048ui_story"]
			local var_38_52 = 2

			if var_38_52 < arg_35_1.time_ and arg_35_1.time_ <= var_38_52 + arg_38_0 and arg_35_1.var_.characterEffect1048ui_story == nil then
				arg_35_1.var_.characterEffect1048ui_story = var_38_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_53 = 0.200000002980232

			if var_38_52 <= arg_35_1.time_ and arg_35_1.time_ < var_38_52 + var_38_53 then
				local var_38_54 = (arg_35_1.time_ - var_38_52) / var_38_53

				if arg_35_1.var_.characterEffect1048ui_story then
					local var_38_55 = Mathf.Lerp(0, 0.5, var_38_54)

					arg_35_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1048ui_story.fillRatio = var_38_55
				end
			end

			if arg_35_1.time_ >= var_38_52 + var_38_53 and arg_35_1.time_ < var_38_52 + var_38_53 + arg_38_0 and arg_35_1.var_.characterEffect1048ui_story then
				local var_38_56 = 0.5

				arg_35_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1048ui_story.fillRatio = var_38_56
			end

			local var_38_57 = 2

			if var_38_57 < arg_35_1.time_ and arg_35_1.time_ <= var_38_57 + arg_38_0 then
				arg_35_1.screenFilterGo_:SetActive(false)
			end

			local var_38_58 = 0.0166666666666667

			if var_38_57 <= arg_35_1.time_ and arg_35_1.time_ < var_38_57 + var_38_58 then
				local var_38_59 = (arg_35_1.time_ - var_38_57) / var_38_58

				arg_35_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_38_59)
			end

			if arg_35_1.time_ >= var_38_57 + var_38_58 and arg_35_1.time_ < var_38_57 + var_38_58 + arg_38_0 then
				arg_35_1.screenFilterEffect_.weight = 0
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_60 = 4
			local var_38_61 = 0.05

			if var_38_60 < arg_35_1.time_ and arg_35_1.time_ <= var_38_60 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_62 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_62:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_63 = arg_35_1:GetWordFromCfg(910601009)
				local var_38_64 = arg_35_1:FormatText(var_38_63.content)

				arg_35_1.text_.text = var_38_64

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_65 = 2
				local var_38_66 = utf8.len(var_38_64)
				local var_38_67 = var_38_65 <= 0 and var_38_61 or var_38_61 * (var_38_66 / var_38_65)

				if var_38_67 > 0 and var_38_61 < var_38_67 then
					arg_35_1.talkMaxDuration = var_38_67
					var_38_60 = var_38_60 + 0.3

					if var_38_67 + var_38_60 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_67 + var_38_60
					end
				end

				arg_35_1.text_.text = var_38_64
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_68 = var_38_60 + 0.3
			local var_38_69 = math.max(var_38_61, arg_35_1.talkMaxDuration)

			if var_38_68 <= arg_35_1.time_ and arg_35_1.time_ < var_38_68 + var_38_69 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_68) / var_38_69

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_68 + var_38_69 and arg_35_1.time_ < var_38_68 + var_38_69 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play910601010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 910601010
		arg_41_1.duration_ = 9

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play910601011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 2

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				local var_44_1 = manager.ui.mainCamera.transform.localPosition
				local var_44_2 = Vector3.New(0, 0, 10) + Vector3.New(var_44_1.x, var_44_1.y, 0)
				local var_44_3 = arg_41_1.bgs_.B13

				var_44_3.transform.localPosition = var_44_2
				var_44_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_44_4 = var_44_3:GetComponent("SpriteRenderer")

				if var_44_4 and var_44_4.sprite then
					local var_44_5 = (var_44_3.transform.localPosition - var_44_1).z
					local var_44_6 = manager.ui.mainCameraCom_
					local var_44_7 = 2 * var_44_5 * Mathf.Tan(var_44_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_44_8 = var_44_7 * var_44_6.aspect
					local var_44_9 = var_44_4.sprite.bounds.size.x
					local var_44_10 = var_44_4.sprite.bounds.size.y
					local var_44_11 = var_44_8 / var_44_9
					local var_44_12 = var_44_7 / var_44_10
					local var_44_13 = var_44_12 < var_44_11 and var_44_11 or var_44_12

					var_44_3.transform.localScale = Vector3.New(var_44_13, var_44_13, 0)
				end

				for iter_44_0, iter_44_1 in pairs(arg_41_1.bgs_) do
					if iter_44_0 ~= "B13" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = true

				arg_41_1:SetGaussion(false)
			end

			local var_44_15 = 2

			if var_44_14 <= arg_41_1.time_ and arg_41_1.time_ < var_44_14 + var_44_15 then
				local var_44_16 = (arg_41_1.time_ - var_44_14) / var_44_15
				local var_44_17 = Color.New(0, 0, 0)

				var_44_17.a = Mathf.Lerp(0, 1, var_44_16)
				arg_41_1.mask_.color = var_44_17
			end

			if arg_41_1.time_ >= var_44_14 + var_44_15 and arg_41_1.time_ < var_44_14 + var_44_15 + arg_44_0 then
				local var_44_18 = Color.New(0, 0, 0)

				var_44_18.a = 1
				arg_41_1.mask_.color = var_44_18
			end

			local var_44_19 = 2

			if var_44_19 < arg_41_1.time_ and arg_41_1.time_ <= var_44_19 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = true

				arg_41_1:SetGaussion(false)
			end

			local var_44_20 = 2

			if var_44_19 <= arg_41_1.time_ and arg_41_1.time_ < var_44_19 + var_44_20 then
				local var_44_21 = (arg_41_1.time_ - var_44_19) / var_44_20
				local var_44_22 = Color.New(0, 0, 0)

				var_44_22.a = Mathf.Lerp(1, 0, var_44_21)
				arg_41_1.mask_.color = var_44_22
			end

			if arg_41_1.time_ >= var_44_19 + var_44_20 and arg_41_1.time_ < var_44_19 + var_44_20 + arg_44_0 then
				local var_44_23 = Color.New(0, 0, 0)
				local var_44_24 = 0

				arg_41_1.mask_.enabled = false
				var_44_23.a = var_44_24
				arg_41_1.mask_.color = var_44_23
			end

			local var_44_25 = manager.ui.mainCamera.transform
			local var_44_26 = 3.99999999999933

			if var_44_26 < arg_41_1.time_ and arg_41_1.time_ <= var_44_26 + arg_44_0 then
				arg_41_1.var_.shakeOldPos = var_44_25.localPosition
			end

			local var_44_27 = 1.133333333334

			if var_44_26 <= arg_41_1.time_ and arg_41_1.time_ < var_44_26 + var_44_27 then
				local var_44_28 = (arg_41_1.time_ - var_44_26) / 0.066
				local var_44_29, var_44_30 = math.modf(var_44_28)

				var_44_25.localPosition = Vector3.New(var_44_30 * 0.13, var_44_30 * 0.13, var_44_30 * 0.13) + arg_41_1.var_.shakeOldPos
			end

			if arg_41_1.time_ >= var_44_26 + var_44_27 and arg_41_1.time_ < var_44_26 + var_44_27 + arg_44_0 then
				var_44_25.localPosition = arg_41_1.var_.shakeOldPos
			end

			local var_44_31 = 0
			local var_44_32 = 0.633333333333333

			if var_44_31 < arg_41_1.time_ and arg_41_1.time_ <= var_44_31 + arg_44_0 then
				local var_44_33 = "play"
				local var_44_34 = "music"

				arg_41_1:AudioAction(var_44_33, var_44_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_44_35 = 0.8
			local var_44_36 = 1

			if var_44_35 < arg_41_1.time_ and arg_41_1.time_ <= var_44_35 + arg_44_0 then
				local var_44_37 = "play"
				local var_44_38 = "music"

				arg_41_1:AudioAction(var_44_37, var_44_38, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			if arg_41_1.frameCnt_ <= 1 then
				arg_41_1.dialog_:SetActive(false)
			end

			local var_44_39 = 4
			local var_44_40 = 0.3

			if var_44_39 < arg_41_1.time_ and arg_41_1.time_ <= var_44_39 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_41 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_41:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_42 = arg_41_1:FormatText(StoryNameCfg[7].name)

				arg_41_1.leftNameTxt_.text = var_44_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_43 = arg_41_1:GetWordFromCfg(910601010)
				local var_44_44 = arg_41_1:FormatText(var_44_43.content)

				arg_41_1.text_.text = var_44_44

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_45 = 12
				local var_44_46 = utf8.len(var_44_44)
				local var_44_47 = var_44_45 <= 0 and var_44_40 or var_44_40 * (var_44_46 / var_44_45)

				if var_44_47 > 0 and var_44_40 < var_44_47 then
					arg_41_1.talkMaxDuration = var_44_47
					var_44_39 = var_44_39 + 0.3

					if var_44_47 + var_44_39 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_47 + var_44_39
					end
				end

				arg_41_1.text_.text = var_44_44
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_48 = var_44_39 + 0.3
			local var_44_49 = math.max(var_44_40, arg_41_1.talkMaxDuration)

			if var_44_48 <= arg_41_1.time_ and arg_41_1.time_ < var_44_48 + var_44_49 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_48) / var_44_49

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_48 + var_44_49 and arg_41_1.time_ < var_44_48 + var_44_49 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play910601011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 910601011
		arg_47_1.duration_ = 5.766

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play910601012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1084ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1084ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(-0.7, -0.97, -6)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1084ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1084ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1084ui_story then
					arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.775

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(910601011)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 31
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_16 or var_50_16 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_16 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601011", "story_v_out_910601.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601011", "story_v_out_910601.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_910601", "910601011", "story_v_out_910601.awb")

						arg_47_1:RecordAudio("910601011", var_50_24)
						arg_47_1:RecordAudio("910601011", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_910601", "910601011", "story_v_out_910601.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_910601", "910601011", "story_v_out_910601.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_25 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_25 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_25

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_25 and arg_47_1.time_ < var_50_15 + var_50_25 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play910601012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 910601012
		arg_51_1.duration_ = 2.933

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play910601013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1011ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1011ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -0.71, -6)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1011ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1011ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1011ui_story == nil then
				arg_51_1.var_.characterEffect1011ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1011ui_story then
					arg_51_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1011ui_story then
				arg_51_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_15 = arg_51_1.actors_["1084ui_story"].transform
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.var_.moveOldPos1084ui_story = var_54_15.localPosition
			end

			local var_54_17 = 0.001

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Vector3.New(-0.7, -0.97, -6)

				var_54_15.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1084ui_story, var_54_19, var_54_18)

				local var_54_20 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_20.x, var_54_20.y, var_54_20.z)

				local var_54_21 = var_54_15.localEulerAngles

				var_54_21.z = 0
				var_54_21.x = 0
				var_54_15.localEulerAngles = var_54_21
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				var_54_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_54_22 = manager.ui.mainCamera.transform.position - var_54_15.position

				var_54_15.forward = Vector3.New(var_54_22.x, var_54_22.y, var_54_22.z)

				local var_54_23 = var_54_15.localEulerAngles

				var_54_23.z = 0
				var_54_23.x = 0
				var_54_15.localEulerAngles = var_54_23
			end

			local var_54_24 = arg_51_1.actors_["1084ui_story"]
			local var_54_25 = 0

			if var_54_25 < arg_51_1.time_ and arg_51_1.time_ <= var_54_25 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_26 = 0.200000002980232

			if var_54_25 <= arg_51_1.time_ and arg_51_1.time_ < var_54_25 + var_54_26 then
				local var_54_27 = (arg_51_1.time_ - var_54_25) / var_54_26

				if arg_51_1.var_.characterEffect1084ui_story then
					local var_54_28 = Mathf.Lerp(0, 0.5, var_54_27)

					arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_28
				end
			end

			if arg_51_1.time_ >= var_54_25 + var_54_26 and arg_51_1.time_ < var_54_25 + var_54_26 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story then
				local var_54_29 = 0.5

				arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_29
			end

			local var_54_30 = 0
			local var_54_31 = 0.3

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_32 = arg_51_1:FormatText(StoryNameCfg[37].name)

				arg_51_1.leftNameTxt_.text = var_54_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_33 = arg_51_1:GetWordFromCfg(910601012)
				local var_54_34 = arg_51_1:FormatText(var_54_33.content)

				arg_51_1.text_.text = var_54_34

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_35 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601012", "story_v_out_910601.awb") ~= 0 then
					local var_54_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601012", "story_v_out_910601.awb") / 1000

					if var_54_38 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_38 + var_54_30
					end

					if var_54_33.prefab_name ~= "" and arg_51_1.actors_[var_54_33.prefab_name] ~= nil then
						local var_54_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_33.prefab_name].transform, "story_v_out_910601", "910601012", "story_v_out_910601.awb")

						arg_51_1:RecordAudio("910601012", var_54_39)
						arg_51_1:RecordAudio("910601012", var_54_39)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_910601", "910601012", "story_v_out_910601.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_910601", "910601012", "story_v_out_910601.awb")
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
	Play910601013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 910601013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play910601014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1011ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1011ui_story == nil then
				arg_55_1.var_.characterEffect1011ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1011ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1011ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1011ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1011ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 0.65

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(910601013)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 26
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_14 and arg_55_1.time_ < var_58_6 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play910601014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 910601014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play910601015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1011ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1011ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0, 100, 0)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1011ui_story, var_62_4, var_62_3)

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

			local var_62_9 = arg_59_1.actors_["1011ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1011ui_story == nil then
				arg_59_1.var_.characterEffect1011ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1011ui_story then
					local var_62_13 = Mathf.Lerp(0, 0.5, var_62_12)

					arg_59_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1011ui_story.fillRatio = var_62_13
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1011ui_story then
				local var_62_14 = 0.5

				arg_59_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1011ui_story.fillRatio = var_62_14
			end

			local var_62_15 = arg_59_1.actors_["1084ui_story"].transform
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.var_.moveOldPos1084ui_story = var_62_15.localPosition
			end

			local var_62_17 = 0.001

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17
				local var_62_19 = Vector3.New(0, 100, 0)

				var_62_15.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1084ui_story, var_62_19, var_62_18)

				local var_62_20 = manager.ui.mainCamera.transform.position - var_62_15.position

				var_62_15.forward = Vector3.New(var_62_20.x, var_62_20.y, var_62_20.z)

				local var_62_21 = var_62_15.localEulerAngles

				var_62_21.z = 0
				var_62_21.x = 0
				var_62_15.localEulerAngles = var_62_21
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 then
				var_62_15.localPosition = Vector3.New(0, 100, 0)

				local var_62_22 = manager.ui.mainCamera.transform.position - var_62_15.position

				var_62_15.forward = Vector3.New(var_62_22.x, var_62_22.y, var_62_22.z)

				local var_62_23 = var_62_15.localEulerAngles

				var_62_23.z = 0
				var_62_23.x = 0
				var_62_15.localEulerAngles = var_62_23
			end

			local var_62_24 = arg_59_1.actors_["1084ui_story"]
			local var_62_25 = 0

			if var_62_25 < arg_59_1.time_ and arg_59_1.time_ <= var_62_25 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_26 = 0.200000002980232

			if var_62_25 <= arg_59_1.time_ and arg_59_1.time_ < var_62_25 + var_62_26 then
				local var_62_27 = (arg_59_1.time_ - var_62_25) / var_62_26

				if arg_59_1.var_.characterEffect1084ui_story then
					local var_62_28 = Mathf.Lerp(0, 0.5, var_62_27)

					arg_59_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1084ui_story.fillRatio = var_62_28
				end
			end

			if arg_59_1.time_ >= var_62_25 + var_62_26 and arg_59_1.time_ < var_62_25 + var_62_26 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				local var_62_29 = 0.5

				arg_59_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1084ui_story.fillRatio = var_62_29
			end

			local var_62_30 = 0
			local var_62_31 = 1.225

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_32 = arg_59_1:GetWordFromCfg(910601014)
				local var_62_33 = arg_59_1:FormatText(var_62_32.content)

				arg_59_1.text_.text = var_62_33

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_34 = 49
				local var_62_35 = utf8.len(var_62_33)
				local var_62_36 = var_62_34 <= 0 and var_62_31 or var_62_31 * (var_62_35 / var_62_34)

				if var_62_36 > 0 and var_62_31 < var_62_36 then
					arg_59_1.talkMaxDuration = var_62_36

					if var_62_36 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_36 + var_62_30
					end
				end

				arg_59_1.text_.text = var_62_33
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_37 = math.max(var_62_31, arg_59_1.talkMaxDuration)

			if var_62_30 <= arg_59_1.time_ and arg_59_1.time_ < var_62_30 + var_62_37 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_30) / var_62_37

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_30 + var_62_37 and arg_59_1.time_ < var_62_30 + var_62_37 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play910601015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 910601015
		arg_63_1.duration_ = 3.5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play910601016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "1059ui_story"

			if arg_63_1.actors_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(Asset.Load("Char/" .. var_66_0), arg_63_1.stage_.transform)

				var_66_1.name = var_66_0
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_0] = var_66_1

				local var_66_2 = var_66_1:GetComponentInChildren(typeof(CharacterEffect))

				var_66_2.enabled = true

				local var_66_3 = GameObjectTools.GetOrAddComponent(var_66_1, typeof(DynamicBoneHelper))

				if var_66_3 then
					var_66_3:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_2.transform, false)

				arg_63_1.var_[var_66_0 .. "Animator"] = var_66_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_0 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_0 .. "LipSync"] = var_66_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_4 = arg_63_1.actors_["1059ui_story"].transform
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.var_.moveOldPos1059ui_story = var_66_4.localPosition
			end

			local var_66_6 = 0.001

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6
				local var_66_8 = Vector3.New(0, -1.05, -6)

				var_66_4.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1059ui_story, var_66_8, var_66_7)

				local var_66_9 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_9.x, var_66_9.y, var_66_9.z)

				local var_66_10 = var_66_4.localEulerAngles

				var_66_10.z = 0
				var_66_10.x = 0
				var_66_4.localEulerAngles = var_66_10
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 then
				var_66_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_66_11 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_11.x, var_66_11.y, var_66_11.z)

				local var_66_12 = var_66_4.localEulerAngles

				var_66_12.z = 0
				var_66_12.x = 0
				var_66_4.localEulerAngles = var_66_12
			end

			local var_66_13 = arg_63_1.actors_["1059ui_story"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.characterEffect1059ui_story == nil then
				arg_63_1.var_.characterEffect1059ui_story = var_66_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_15 = 0.200000002980232

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.characterEffect1059ui_story then
					arg_63_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.characterEffect1059ui_story then
				arg_63_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_66_17 = 0

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				arg_63_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_66_18 = 0

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_19 = 0
			local var_66_20 = 0.45

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_21 = arg_63_1:FormatText(StoryNameCfg[28].name)

				arg_63_1.leftNameTxt_.text = var_66_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_22 = arg_63_1:GetWordFromCfg(910601015)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 18
				local var_66_25 = utf8.len(var_66_23)
				local var_66_26 = var_66_24 <= 0 and var_66_20 or var_66_20 * (var_66_25 / var_66_24)

				if var_66_26 > 0 and var_66_20 < var_66_26 then
					arg_63_1.talkMaxDuration = var_66_26

					if var_66_26 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_26 + var_66_19
					end
				end

				arg_63_1.text_.text = var_66_23
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601015", "story_v_out_910601.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_910601", "910601015", "story_v_out_910601.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_910601", "910601015", "story_v_out_910601.awb")

						arg_63_1:RecordAudio("910601015", var_66_28)
						arg_63_1:RecordAudio("910601015", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_910601", "910601015", "story_v_out_910601.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_910601", "910601015", "story_v_out_910601.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_29 = math.max(var_66_20, arg_63_1.talkMaxDuration)

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_29 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_19) / var_66_29

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_19 + var_66_29 and arg_63_1.time_ < var_66_19 + var_66_29 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play910601016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 910601016
		arg_67_1.duration_ = 1.999999999999

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play910601017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "1028ui_story"

			if arg_67_1.actors_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(Asset.Load("Char/" .. var_70_0), arg_67_1.stage_.transform)

				var_70_1.name = var_70_0
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_0] = var_70_1

				local var_70_2 = var_70_1:GetComponentInChildren(typeof(CharacterEffect))

				var_70_2.enabled = true

				local var_70_3 = GameObjectTools.GetOrAddComponent(var_70_1, typeof(DynamicBoneHelper))

				if var_70_3 then
					var_70_3:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_2.transform, false)

				arg_67_1.var_[var_70_0 .. "Animator"] = var_70_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_0 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_0 .. "LipSync"] = var_70_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_4 = arg_67_1.actors_["1028ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos1028ui_story = var_70_4.localPosition

				local var_70_6 = "1028ui_story"

				arg_67_1:ShowWeapon(arg_67_1.var_[var_70_6 .. "Animator"].transform, false)
			end

			local var_70_7 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_7 then
				local var_70_8 = (arg_67_1.time_ - var_70_5) / var_70_7
				local var_70_9 = Vector3.New(0, -0.9, -5.9)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1028ui_story, var_70_9, var_70_8)

				local var_70_10 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_10.x, var_70_10.y, var_70_10.z)

				local var_70_11 = var_70_4.localEulerAngles

				var_70_11.z = 0
				var_70_11.x = 0
				var_70_4.localEulerAngles = var_70_11
			end

			if arg_67_1.time_ >= var_70_5 + var_70_7 and arg_67_1.time_ < var_70_5 + var_70_7 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_70_12 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_12.x, var_70_12.y, var_70_12.z)

				local var_70_13 = var_70_4.localEulerAngles

				var_70_13.z = 0
				var_70_13.x = 0
				var_70_4.localEulerAngles = var_70_13
			end

			local var_70_14 = arg_67_1.actors_["1028ui_story"]
			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 and arg_67_1.var_.characterEffect1028ui_story == nil then
				arg_67_1.var_.characterEffect1028ui_story = var_70_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_16 = 0.200000002980232

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_16 then
				local var_70_17 = (arg_67_1.time_ - var_70_15) / var_70_16

				if arg_67_1.var_.characterEffect1028ui_story then
					arg_67_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_15 + var_70_16 and arg_67_1.time_ < var_70_15 + var_70_16 + arg_70_0 and arg_67_1.var_.characterEffect1028ui_story then
				arg_67_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_70_19 = 0

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_70_20 = arg_67_1.actors_["1059ui_story"].transform
			local var_70_21 = 0

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.var_.moveOldPos1059ui_story = var_70_20.localPosition
			end

			local var_70_22 = 0.001

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22
				local var_70_24 = Vector3.New(0, 100, 0)

				var_70_20.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1059ui_story, var_70_24, var_70_23)

				local var_70_25 = manager.ui.mainCamera.transform.position - var_70_20.position

				var_70_20.forward = Vector3.New(var_70_25.x, var_70_25.y, var_70_25.z)

				local var_70_26 = var_70_20.localEulerAngles

				var_70_26.z = 0
				var_70_26.x = 0
				var_70_20.localEulerAngles = var_70_26
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 then
				var_70_20.localPosition = Vector3.New(0, 100, 0)

				local var_70_27 = manager.ui.mainCamera.transform.position - var_70_20.position

				var_70_20.forward = Vector3.New(var_70_27.x, var_70_27.y, var_70_27.z)

				local var_70_28 = var_70_20.localEulerAngles

				var_70_28.z = 0
				var_70_28.x = 0
				var_70_20.localEulerAngles = var_70_28
			end

			local var_70_29 = arg_67_1.actors_["1059ui_story"]
			local var_70_30 = 0

			if var_70_30 < arg_67_1.time_ and arg_67_1.time_ <= var_70_30 + arg_70_0 and arg_67_1.var_.characterEffect1059ui_story == nil then
				arg_67_1.var_.characterEffect1059ui_story = var_70_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_31 = 0.200000002980232

			if var_70_30 <= arg_67_1.time_ and arg_67_1.time_ < var_70_30 + var_70_31 then
				local var_70_32 = (arg_67_1.time_ - var_70_30) / var_70_31

				if arg_67_1.var_.characterEffect1059ui_story then
					local var_70_33 = Mathf.Lerp(0, 0.5, var_70_32)

					arg_67_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1059ui_story.fillRatio = var_70_33
				end
			end

			if arg_67_1.time_ >= var_70_30 + var_70_31 and arg_67_1.time_ < var_70_30 + var_70_31 + arg_70_0 and arg_67_1.var_.characterEffect1059ui_story then
				local var_70_34 = 0.5

				arg_67_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1059ui_story.fillRatio = var_70_34
			end

			local var_70_35 = 0
			local var_70_36 = 0.225

			if var_70_35 < arg_67_1.time_ and arg_67_1.time_ <= var_70_35 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_37 = arg_67_1:FormatText(StoryNameCfg[327].name)

				arg_67_1.leftNameTxt_.text = var_70_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_38 = arg_67_1:GetWordFromCfg(910601016)
				local var_70_39 = arg_67_1:FormatText(var_70_38.content)

				arg_67_1.text_.text = var_70_39

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_40 = 9
				local var_70_41 = utf8.len(var_70_39)
				local var_70_42 = var_70_40 <= 0 and var_70_36 or var_70_36 * (var_70_41 / var_70_40)

				if var_70_42 > 0 and var_70_36 < var_70_42 then
					arg_67_1.talkMaxDuration = var_70_42

					if var_70_42 + var_70_35 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_42 + var_70_35
					end
				end

				arg_67_1.text_.text = var_70_39
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601016", "story_v_out_910601.awb") ~= 0 then
					local var_70_43 = manager.audio:GetVoiceLength("story_v_out_910601", "910601016", "story_v_out_910601.awb") / 1000

					if var_70_43 + var_70_35 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_43 + var_70_35
					end

					if var_70_38.prefab_name ~= "" and arg_67_1.actors_[var_70_38.prefab_name] ~= nil then
						local var_70_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_38.prefab_name].transform, "story_v_out_910601", "910601016", "story_v_out_910601.awb")

						arg_67_1:RecordAudio("910601016", var_70_44)
						arg_67_1:RecordAudio("910601016", var_70_44)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_910601", "910601016", "story_v_out_910601.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_910601", "910601016", "story_v_out_910601.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_45 = math.max(var_70_36, arg_67_1.talkMaxDuration)

			if var_70_35 <= arg_67_1.time_ and arg_67_1.time_ < var_70_35 + var_70_45 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_35) / var_70_45

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_35 + var_70_45 and arg_67_1.time_ < var_70_35 + var_70_45 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play910601017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 910601017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play910601018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1028ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1028ui_story == nil then
				arg_71_1.var_.characterEffect1028ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1028ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1028ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1028ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1028ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_74_7 = arg_71_1.actors_["1028ui_story"].transform
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 then
				arg_71_1.var_.moveOldPos1028ui_story = var_74_7.localPosition
			end

			local var_74_9 = 0.001

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9
				local var_74_11 = Vector3.New(0, 100, 0)

				var_74_7.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1028ui_story, var_74_11, var_74_10)

				local var_74_12 = manager.ui.mainCamera.transform.position - var_74_7.position

				var_74_7.forward = Vector3.New(var_74_12.x, var_74_12.y, var_74_12.z)

				local var_74_13 = var_74_7.localEulerAngles

				var_74_13.z = 0
				var_74_13.x = 0
				var_74_7.localEulerAngles = var_74_13
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 then
				var_74_7.localPosition = Vector3.New(0, 100, 0)

				local var_74_14 = manager.ui.mainCamera.transform.position - var_74_7.position

				var_74_7.forward = Vector3.New(var_74_14.x, var_74_14.y, var_74_14.z)

				local var_74_15 = var_74_7.localEulerAngles

				var_74_15.z = 0
				var_74_15.x = 0
				var_74_7.localEulerAngles = var_74_15
			end

			local var_74_16 = 0
			local var_74_17 = 1.3

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_18 = arg_71_1:GetWordFromCfg(910601017)
				local var_74_19 = arg_71_1:FormatText(var_74_18.content)

				arg_71_1.text_.text = var_74_19

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_20 = 52
				local var_74_21 = utf8.len(var_74_19)
				local var_74_22 = var_74_20 <= 0 and var_74_17 or var_74_17 * (var_74_21 / var_74_20)

				if var_74_22 > 0 and var_74_17 < var_74_22 then
					arg_71_1.talkMaxDuration = var_74_22

					if var_74_22 + var_74_16 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_22 + var_74_16
					end
				end

				arg_71_1.text_.text = var_74_19
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_23 = math.max(var_74_17, arg_71_1.talkMaxDuration)

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_23 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_16) / var_74_23

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_16 + var_74_23 and arg_71_1.time_ < var_74_16 + var_74_23 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play910601018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 910601018
		arg_75_1.duration_ = 3.4

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play910601019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1028ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1028ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -0.9, -5.9)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1028ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1028ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1028ui_story == nil then
				arg_75_1.var_.characterEffect1028ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1028ui_story then
					arg_75_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1028ui_story then
				arg_75_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_2")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_78_15 = 0
			local var_78_16 = 0.5

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_17 = arg_75_1:FormatText(StoryNameCfg[327].name)

				arg_75_1.leftNameTxt_.text = var_78_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_18 = arg_75_1:GetWordFromCfg(910601018)
				local var_78_19 = arg_75_1:FormatText(var_78_18.content)

				arg_75_1.text_.text = var_78_19

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_20 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601018", "story_v_out_910601.awb") ~= 0 then
					local var_78_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601018", "story_v_out_910601.awb") / 1000

					if var_78_23 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_23 + var_78_15
					end

					if var_78_18.prefab_name ~= "" and arg_75_1.actors_[var_78_18.prefab_name] ~= nil then
						local var_78_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_18.prefab_name].transform, "story_v_out_910601", "910601018", "story_v_out_910601.awb")

						arg_75_1:RecordAudio("910601018", var_78_24)
						arg_75_1:RecordAudio("910601018", var_78_24)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_910601", "910601018", "story_v_out_910601.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_910601", "910601018", "story_v_out_910601.awb")
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
	Play910601019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 910601019
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play910601020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1028ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1028ui_story == nil then
				arg_79_1.var_.characterEffect1028ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1028ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1028ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1028ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1028ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.075

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

				local var_82_9 = arg_79_1:GetWordFromCfg(910601019)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 3
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
	Play910601020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 910601020
		arg_83_1.duration_ = 7.9

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play910601021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1059ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1059ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, -1.05, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1059ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1059ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story == nil then
				arg_83_1.var_.characterEffect1059ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1059ui_story then
					arg_83_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story then
				arg_83_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_86_15 = arg_83_1.actors_["1028ui_story"].transform
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.var_.moveOldPos1028ui_story = var_86_15.localPosition
			end

			local var_86_17 = 0.001

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17
				local var_86_19 = Vector3.New(0, 100, 0)

				var_86_15.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1028ui_story, var_86_19, var_86_18)

				local var_86_20 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_20.x, var_86_20.y, var_86_20.z)

				local var_86_21 = var_86_15.localEulerAngles

				var_86_21.z = 0
				var_86_21.x = 0
				var_86_15.localEulerAngles = var_86_21
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				var_86_15.localPosition = Vector3.New(0, 100, 0)

				local var_86_22 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_22.x, var_86_22.y, var_86_22.z)

				local var_86_23 = var_86_15.localEulerAngles

				var_86_23.z = 0
				var_86_23.x = 0
				var_86_15.localEulerAngles = var_86_23
			end

			local var_86_24 = arg_83_1.actors_["1028ui_story"]
			local var_86_25 = 0

			if var_86_25 < arg_83_1.time_ and arg_83_1.time_ <= var_86_25 + arg_86_0 and arg_83_1.var_.characterEffect1028ui_story == nil then
				arg_83_1.var_.characterEffect1028ui_story = var_86_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_26 = 0.200000002980232

			if var_86_25 <= arg_83_1.time_ and arg_83_1.time_ < var_86_25 + var_86_26 then
				local var_86_27 = (arg_83_1.time_ - var_86_25) / var_86_26

				if arg_83_1.var_.characterEffect1028ui_story then
					local var_86_28 = Mathf.Lerp(0, 0.5, var_86_27)

					arg_83_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1028ui_story.fillRatio = var_86_28
				end
			end

			if arg_83_1.time_ >= var_86_25 + var_86_26 and arg_83_1.time_ < var_86_25 + var_86_26 + arg_86_0 and arg_83_1.var_.characterEffect1028ui_story then
				local var_86_29 = 0.5

				arg_83_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1028ui_story.fillRatio = var_86_29
			end

			local var_86_30 = 0
			local var_86_31 = 0.875

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_32 = arg_83_1:FormatText(StoryNameCfg[28].name)

				arg_83_1.leftNameTxt_.text = var_86_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_33 = arg_83_1:GetWordFromCfg(910601020)
				local var_86_34 = arg_83_1:FormatText(var_86_33.content)

				arg_83_1.text_.text = var_86_34

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_35 = 35
				local var_86_36 = utf8.len(var_86_34)
				local var_86_37 = var_86_35 <= 0 and var_86_31 or var_86_31 * (var_86_36 / var_86_35)

				if var_86_37 > 0 and var_86_31 < var_86_37 then
					arg_83_1.talkMaxDuration = var_86_37

					if var_86_37 + var_86_30 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_37 + var_86_30
					end
				end

				arg_83_1.text_.text = var_86_34
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601020", "story_v_out_910601.awb") ~= 0 then
					local var_86_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601020", "story_v_out_910601.awb") / 1000

					if var_86_38 + var_86_30 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_38 + var_86_30
					end

					if var_86_33.prefab_name ~= "" and arg_83_1.actors_[var_86_33.prefab_name] ~= nil then
						local var_86_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_33.prefab_name].transform, "story_v_out_910601", "910601020", "story_v_out_910601.awb")

						arg_83_1:RecordAudio("910601020", var_86_39)
						arg_83_1:RecordAudio("910601020", var_86_39)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_910601", "910601020", "story_v_out_910601.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_910601", "910601020", "story_v_out_910601.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_40 = math.max(var_86_31, arg_83_1.talkMaxDuration)

			if var_86_30 <= arg_83_1.time_ and arg_83_1.time_ < var_86_30 + var_86_40 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_30) / var_86_40

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_30 + var_86_40 and arg_83_1.time_ < var_86_30 + var_86_40 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play910601021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 910601021
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play910601022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1059ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1059ui_story == nil then
				arg_87_1.var_.characterEffect1059ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

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
			local var_90_7 = 0.675

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

				local var_90_9 = arg_87_1:GetWordFromCfg(910601021)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 27
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
	Play910601022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 910601022
		arg_91_1.duration_ = 2.566

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play910601023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1048ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1048ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -0.8, -6.2)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1048ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1048ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1048ui_story == nil then
				arg_91_1.var_.characterEffect1048ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1048ui_story then
					arg_91_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1048ui_story then
				arg_91_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_94_15 = arg_91_1.actors_["1059ui_story"].transform
			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 then
				arg_91_1.var_.moveOldPos1059ui_story = var_94_15.localPosition
			end

			local var_94_17 = 0.001

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17
				local var_94_19 = Vector3.New(0, 100, 0)

				var_94_15.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1059ui_story, var_94_19, var_94_18)

				local var_94_20 = manager.ui.mainCamera.transform.position - var_94_15.position

				var_94_15.forward = Vector3.New(var_94_20.x, var_94_20.y, var_94_20.z)

				local var_94_21 = var_94_15.localEulerAngles

				var_94_21.z = 0
				var_94_21.x = 0
				var_94_15.localEulerAngles = var_94_21
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 then
				var_94_15.localPosition = Vector3.New(0, 100, 0)

				local var_94_22 = manager.ui.mainCamera.transform.position - var_94_15.position

				var_94_15.forward = Vector3.New(var_94_22.x, var_94_22.y, var_94_22.z)

				local var_94_23 = var_94_15.localEulerAngles

				var_94_23.z = 0
				var_94_23.x = 0
				var_94_15.localEulerAngles = var_94_23
			end

			local var_94_24 = arg_91_1.actors_["1059ui_story"]
			local var_94_25 = 0

			if var_94_25 < arg_91_1.time_ and arg_91_1.time_ <= var_94_25 + arg_94_0 and arg_91_1.var_.characterEffect1059ui_story == nil then
				arg_91_1.var_.characterEffect1059ui_story = var_94_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_26 = 0.200000002980232

			if var_94_25 <= arg_91_1.time_ and arg_91_1.time_ < var_94_25 + var_94_26 then
				local var_94_27 = (arg_91_1.time_ - var_94_25) / var_94_26

				if arg_91_1.var_.characterEffect1059ui_story then
					local var_94_28 = Mathf.Lerp(0, 0.5, var_94_27)

					arg_91_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1059ui_story.fillRatio = var_94_28
				end
			end

			if arg_91_1.time_ >= var_94_25 + var_94_26 and arg_91_1.time_ < var_94_25 + var_94_26 + arg_94_0 and arg_91_1.var_.characterEffect1059ui_story then
				local var_94_29 = 0.5

				arg_91_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1059ui_story.fillRatio = var_94_29
			end

			local var_94_30 = 0
			local var_94_31 = 0.225

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_32 = arg_91_1:FormatText(StoryNameCfg[8].name)

				arg_91_1.leftNameTxt_.text = var_94_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_33 = arg_91_1:GetWordFromCfg(910601022)
				local var_94_34 = arg_91_1:FormatText(var_94_33.content)

				arg_91_1.text_.text = var_94_34

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_35 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601022", "story_v_out_910601.awb") ~= 0 then
					local var_94_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601022", "story_v_out_910601.awb") / 1000

					if var_94_38 + var_94_30 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_38 + var_94_30
					end

					if var_94_33.prefab_name ~= "" and arg_91_1.actors_[var_94_33.prefab_name] ~= nil then
						local var_94_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_33.prefab_name].transform, "story_v_out_910601", "910601022", "story_v_out_910601.awb")

						arg_91_1:RecordAudio("910601022", var_94_39)
						arg_91_1:RecordAudio("910601022", var_94_39)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_910601", "910601022", "story_v_out_910601.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_910601", "910601022", "story_v_out_910601.awb")
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
	Play910601023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 910601023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play910601024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1048ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1048ui_story == nil then
				arg_95_1.var_.characterEffect1048ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1048ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1048ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1048ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1048ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.15

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[7].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(910601023)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 6
				local var_98_12 = utf8.len(var_98_10)
				local var_98_13 = var_98_11 <= 0 and var_98_7 or var_98_7 * (var_98_12 / var_98_11)

				if var_98_13 > 0 and var_98_7 < var_98_13 then
					arg_95_1.talkMaxDuration = var_98_13

					if var_98_13 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_13 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_10
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_14 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_14 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_14

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_14 and arg_95_1.time_ < var_98_6 + var_98_14 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play910601024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 910601024
		arg_99_1.duration_ = 6.3

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play910601025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1059ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1059ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.05, -6)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1059ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1059ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1059ui_story == nil then
				arg_99_1.var_.characterEffect1059ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1059ui_story then
					arg_99_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1059ui_story then
				arg_99_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action7_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = arg_99_1.actors_["1048ui_story"].transform
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1.var_.moveOldPos1048ui_story = var_102_15.localPosition
			end

			local var_102_17 = 0.001

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17
				local var_102_19 = Vector3.New(0, 100, 0)

				var_102_15.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1048ui_story, var_102_19, var_102_18)

				local var_102_20 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_20.x, var_102_20.y, var_102_20.z)

				local var_102_21 = var_102_15.localEulerAngles

				var_102_21.z = 0
				var_102_21.x = 0
				var_102_15.localEulerAngles = var_102_21
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 then
				var_102_15.localPosition = Vector3.New(0, 100, 0)

				local var_102_22 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_22.x, var_102_22.y, var_102_22.z)

				local var_102_23 = var_102_15.localEulerAngles

				var_102_23.z = 0
				var_102_23.x = 0
				var_102_15.localEulerAngles = var_102_23
			end

			local var_102_24 = arg_99_1.actors_["1048ui_story"]
			local var_102_25 = 0

			if var_102_25 < arg_99_1.time_ and arg_99_1.time_ <= var_102_25 + arg_102_0 and arg_99_1.var_.characterEffect1048ui_story == nil then
				arg_99_1.var_.characterEffect1048ui_story = var_102_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_26 = 0.200000002980232

			if var_102_25 <= arg_99_1.time_ and arg_99_1.time_ < var_102_25 + var_102_26 then
				local var_102_27 = (arg_99_1.time_ - var_102_25) / var_102_26

				if arg_99_1.var_.characterEffect1048ui_story then
					local var_102_28 = Mathf.Lerp(0, 0.5, var_102_27)

					arg_99_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1048ui_story.fillRatio = var_102_28
				end
			end

			if arg_99_1.time_ >= var_102_25 + var_102_26 and arg_99_1.time_ < var_102_25 + var_102_26 + arg_102_0 and arg_99_1.var_.characterEffect1048ui_story then
				local var_102_29 = 0.5

				arg_99_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1048ui_story.fillRatio = var_102_29
			end

			local var_102_30 = 0
			local var_102_31 = 0.675

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[28].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(910601024)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 27
				local var_102_36 = utf8.len(var_102_34)
				local var_102_37 = var_102_35 <= 0 and var_102_31 or var_102_31 * (var_102_36 / var_102_35)

				if var_102_37 > 0 and var_102_31 < var_102_37 then
					arg_99_1.talkMaxDuration = var_102_37

					if var_102_37 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_37 + var_102_30
					end
				end

				arg_99_1.text_.text = var_102_34
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601024", "story_v_out_910601.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601024", "story_v_out_910601.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_out_910601", "910601024", "story_v_out_910601.awb")

						arg_99_1:RecordAudio("910601024", var_102_39)
						arg_99_1:RecordAudio("910601024", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_910601", "910601024", "story_v_out_910601.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_910601", "910601024", "story_v_out_910601.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_40 = math.max(var_102_31, arg_99_1.talkMaxDuration)

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_40 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_30) / var_102_40

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_30 + var_102_40 and arg_99_1.time_ < var_102_30 + var_102_40 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play910601025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 910601025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play910601026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1059ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1059ui_story == nil then
				arg_103_1.var_.characterEffect1059ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1059ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1059ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1059ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1059ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.05

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[7].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(910601025)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 2
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
	Play910601026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 910601026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play910601027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.7

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(910601026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 28
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
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_8 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_8 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_8

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_8 and arg_107_1.time_ < var_110_0 + var_110_8 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play910601027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 910601027
		arg_111_1.duration_ = 2.566

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play910601028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1028ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1028ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(0, -0.9, -5.9)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1028ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1028ui_story"]
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1028ui_story == nil then
				arg_111_1.var_.characterEffect1028ui_story = var_114_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_11 = 0.200000002980232

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11

				if arg_111_1.var_.characterEffect1028ui_story then
					arg_111_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect1028ui_story then
				arg_111_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_114_13 = 0

			if var_114_13 < arg_111_1.time_ and arg_111_1.time_ <= var_114_13 + arg_114_0 then
				arg_111_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_114_15 = arg_111_1.actors_["1059ui_story"].transform
			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.var_.moveOldPos1059ui_story = var_114_15.localPosition
			end

			local var_114_17 = 0.001

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Vector3.New(0, 100, 0)

				var_114_15.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1059ui_story, var_114_19, var_114_18)

				local var_114_20 = manager.ui.mainCamera.transform.position - var_114_15.position

				var_114_15.forward = Vector3.New(var_114_20.x, var_114_20.y, var_114_20.z)

				local var_114_21 = var_114_15.localEulerAngles

				var_114_21.z = 0
				var_114_21.x = 0
				var_114_15.localEulerAngles = var_114_21
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				var_114_15.localPosition = Vector3.New(0, 100, 0)

				local var_114_22 = manager.ui.mainCamera.transform.position - var_114_15.position

				var_114_15.forward = Vector3.New(var_114_22.x, var_114_22.y, var_114_22.z)

				local var_114_23 = var_114_15.localEulerAngles

				var_114_23.z = 0
				var_114_23.x = 0
				var_114_15.localEulerAngles = var_114_23
			end

			local var_114_24 = arg_111_1.actors_["1059ui_story"]
			local var_114_25 = 0

			if var_114_25 < arg_111_1.time_ and arg_111_1.time_ <= var_114_25 + arg_114_0 and arg_111_1.var_.characterEffect1059ui_story == nil then
				arg_111_1.var_.characterEffect1059ui_story = var_114_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_26 = 0.200000002980232

			if var_114_25 <= arg_111_1.time_ and arg_111_1.time_ < var_114_25 + var_114_26 then
				local var_114_27 = (arg_111_1.time_ - var_114_25) / var_114_26

				if arg_111_1.var_.characterEffect1059ui_story then
					local var_114_28 = Mathf.Lerp(0, 0.5, var_114_27)

					arg_111_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1059ui_story.fillRatio = var_114_28
				end
			end

			if arg_111_1.time_ >= var_114_25 + var_114_26 and arg_111_1.time_ < var_114_25 + var_114_26 + arg_114_0 and arg_111_1.var_.characterEffect1059ui_story then
				local var_114_29 = 0.5

				arg_111_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1059ui_story.fillRatio = var_114_29
			end

			local var_114_30 = 0
			local var_114_31 = 0.2

			if var_114_30 < arg_111_1.time_ and arg_111_1.time_ <= var_114_30 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_32 = arg_111_1:FormatText(StoryNameCfg[327].name)

				arg_111_1.leftNameTxt_.text = var_114_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_33 = arg_111_1:GetWordFromCfg(910601027)
				local var_114_34 = arg_111_1:FormatText(var_114_33.content)

				arg_111_1.text_.text = var_114_34

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_35 = 8
				local var_114_36 = utf8.len(var_114_34)
				local var_114_37 = var_114_35 <= 0 and var_114_31 or var_114_31 * (var_114_36 / var_114_35)

				if var_114_37 > 0 and var_114_31 < var_114_37 then
					arg_111_1.talkMaxDuration = var_114_37

					if var_114_37 + var_114_30 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_37 + var_114_30
					end
				end

				arg_111_1.text_.text = var_114_34
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601027", "story_v_out_910601.awb") ~= 0 then
					local var_114_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601027", "story_v_out_910601.awb") / 1000

					if var_114_38 + var_114_30 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_38 + var_114_30
					end

					if var_114_33.prefab_name ~= "" and arg_111_1.actors_[var_114_33.prefab_name] ~= nil then
						local var_114_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_33.prefab_name].transform, "story_v_out_910601", "910601027", "story_v_out_910601.awb")

						arg_111_1:RecordAudio("910601027", var_114_39)
						arg_111_1:RecordAudio("910601027", var_114_39)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_910601", "910601027", "story_v_out_910601.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_910601", "910601027", "story_v_out_910601.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_40 = math.max(var_114_31, arg_111_1.talkMaxDuration)

			if var_114_30 <= arg_111_1.time_ and arg_111_1.time_ < var_114_30 + var_114_40 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_30) / var_114_40

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_30 + var_114_40 and arg_111_1.time_ < var_114_30 + var_114_40 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play910601028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 910601028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play910601029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1028ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1028ui_story == nil then
				arg_115_1.var_.characterEffect1028ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1028ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1028ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1028ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1028ui_story.fillRatio = var_118_5
			end

			local var_118_6 = arg_115_1.actors_["1028ui_story"].transform
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 then
				arg_115_1.var_.moveOldPos1028ui_story = var_118_6.localPosition
			end

			local var_118_8 = 0.001

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_8 then
				local var_118_9 = (arg_115_1.time_ - var_118_7) / var_118_8
				local var_118_10 = Vector3.New(0, 100, 0)

				var_118_6.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1028ui_story, var_118_10, var_118_9)

				local var_118_11 = manager.ui.mainCamera.transform.position - var_118_6.position

				var_118_6.forward = Vector3.New(var_118_11.x, var_118_11.y, var_118_11.z)

				local var_118_12 = var_118_6.localEulerAngles

				var_118_12.z = 0
				var_118_12.x = 0
				var_118_6.localEulerAngles = var_118_12
			end

			if arg_115_1.time_ >= var_118_7 + var_118_8 and arg_115_1.time_ < var_118_7 + var_118_8 + arg_118_0 then
				var_118_6.localPosition = Vector3.New(0, 100, 0)

				local var_118_13 = manager.ui.mainCamera.transform.position - var_118_6.position

				var_118_6.forward = Vector3.New(var_118_13.x, var_118_13.y, var_118_13.z)

				local var_118_14 = var_118_6.localEulerAngles

				var_118_14.z = 0
				var_118_14.x = 0
				var_118_6.localEulerAngles = var_118_14
			end

			local var_118_15 = 0
			local var_118_16 = 0.75

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_17 = arg_115_1:GetWordFromCfg(910601028)
				local var_118_18 = arg_115_1:FormatText(var_118_17.content)

				arg_115_1.text_.text = var_118_18

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_19 = 30
				local var_118_20 = utf8.len(var_118_18)
				local var_118_21 = var_118_19 <= 0 and var_118_16 or var_118_16 * (var_118_20 / var_118_19)

				if var_118_21 > 0 and var_118_16 < var_118_21 then
					arg_115_1.talkMaxDuration = var_118_21

					if var_118_21 + var_118_15 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_21 + var_118_15
					end
				end

				arg_115_1.text_.text = var_118_18
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_22 = math.max(var_118_16, arg_115_1.talkMaxDuration)

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_22 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_15) / var_118_22

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_15 + var_118_22 and arg_115_1.time_ < var_118_15 + var_118_22 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play910601029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 910601029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play910601030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1.125

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_2 = arg_119_1:GetWordFromCfg(910601029)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 45
				local var_122_5 = utf8.len(var_122_3)
				local var_122_6 = var_122_4 <= 0 and var_122_1 or var_122_1 * (var_122_5 / var_122_4)

				if var_122_6 > 0 and var_122_1 < var_122_6 then
					arg_119_1.talkMaxDuration = var_122_6

					if var_122_6 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_6 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_3
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_7 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_7 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_7

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_7 and arg_119_1.time_ < var_122_0 + var_122_7 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play910601030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 910601030
		arg_123_1.duration_ = 3.733

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play910601031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1028ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1028ui_story = var_126_0.localPosition

				local var_126_2 = "1028ui_story"

				arg_123_1:ShowWeapon(arg_123_1.var_[var_126_2 .. "Animator"].transform, false)
			end

			local var_126_3 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_3 then
				local var_126_4 = (arg_123_1.time_ - var_126_1) / var_126_3
				local var_126_5 = Vector3.New(0, -0.9, -5.9)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1028ui_story, var_126_5, var_126_4)

				local var_126_6 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_6.x, var_126_6.y, var_126_6.z)

				local var_126_7 = var_126_0.localEulerAngles

				var_126_7.z = 0
				var_126_7.x = 0
				var_126_0.localEulerAngles = var_126_7
			end

			if arg_123_1.time_ >= var_126_1 + var_126_3 and arg_123_1.time_ < var_126_1 + var_126_3 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_126_8 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_8.x, var_126_8.y, var_126_8.z)

				local var_126_9 = var_126_0.localEulerAngles

				var_126_9.z = 0
				var_126_9.x = 0
				var_126_0.localEulerAngles = var_126_9
			end

			local var_126_10 = arg_123_1.actors_["1028ui_story"]
			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1028ui_story == nil then
				arg_123_1.var_.characterEffect1028ui_story = var_126_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_12 = 0.200000002980232

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_12 then
				local var_126_13 = (arg_123_1.time_ - var_126_11) / var_126_12

				if arg_123_1.var_.characterEffect1028ui_story then
					arg_123_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_11 + var_126_12 and arg_123_1.time_ < var_126_11 + var_126_12 + arg_126_0 and arg_123_1.var_.characterEffect1028ui_story then
				arg_123_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_1")
			end

			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_126_16 = arg_123_1.actors_["1059ui_story"].transform
			local var_126_17 = 0

			if var_126_17 < arg_123_1.time_ and arg_123_1.time_ <= var_126_17 + arg_126_0 then
				arg_123_1.var_.moveOldPos1059ui_story = var_126_16.localPosition
			end

			local var_126_18 = 0.001

			if var_126_17 <= arg_123_1.time_ and arg_123_1.time_ < var_126_17 + var_126_18 then
				local var_126_19 = (arg_123_1.time_ - var_126_17) / var_126_18
				local var_126_20 = Vector3.New(0, 100, 0)

				var_126_16.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1059ui_story, var_126_20, var_126_19)

				local var_126_21 = manager.ui.mainCamera.transform.position - var_126_16.position

				var_126_16.forward = Vector3.New(var_126_21.x, var_126_21.y, var_126_21.z)

				local var_126_22 = var_126_16.localEulerAngles

				var_126_22.z = 0
				var_126_22.x = 0
				var_126_16.localEulerAngles = var_126_22
			end

			if arg_123_1.time_ >= var_126_17 + var_126_18 and arg_123_1.time_ < var_126_17 + var_126_18 + arg_126_0 then
				var_126_16.localPosition = Vector3.New(0, 100, 0)

				local var_126_23 = manager.ui.mainCamera.transform.position - var_126_16.position

				var_126_16.forward = Vector3.New(var_126_23.x, var_126_23.y, var_126_23.z)

				local var_126_24 = var_126_16.localEulerAngles

				var_126_24.z = 0
				var_126_24.x = 0
				var_126_16.localEulerAngles = var_126_24
			end

			local var_126_25 = arg_123_1.actors_["1059ui_story"]
			local var_126_26 = 0

			if var_126_26 < arg_123_1.time_ and arg_123_1.time_ <= var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1059ui_story == nil then
				arg_123_1.var_.characterEffect1059ui_story = var_126_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_27 = 0.200000002980232

			if var_126_26 <= arg_123_1.time_ and arg_123_1.time_ < var_126_26 + var_126_27 then
				local var_126_28 = (arg_123_1.time_ - var_126_26) / var_126_27

				if arg_123_1.var_.characterEffect1059ui_story then
					local var_126_29 = Mathf.Lerp(0, 0.5, var_126_28)

					arg_123_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1059ui_story.fillRatio = var_126_29
				end
			end

			if arg_123_1.time_ >= var_126_26 + var_126_27 and arg_123_1.time_ < var_126_26 + var_126_27 + arg_126_0 and arg_123_1.var_.characterEffect1059ui_story then
				local var_126_30 = 0.5

				arg_123_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1059ui_story.fillRatio = var_126_30
			end

			local var_126_31 = 0

			if var_126_31 < arg_123_1.time_ and arg_123_1.time_ <= var_126_31 + arg_126_0 then
				arg_123_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_126_32 = 0

			if var_126_32 < arg_123_1.time_ and arg_123_1.time_ <= var_126_32 + arg_126_0 then
				arg_123_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_33 = arg_123_1.actors_["1048ui_story"].transform
			local var_126_34 = 0

			if var_126_34 < arg_123_1.time_ and arg_123_1.time_ <= var_126_34 + arg_126_0 then
				arg_123_1.var_.moveOldPos1048ui_story = var_126_33.localPosition
			end

			local var_126_35 = 0.001

			if var_126_34 <= arg_123_1.time_ and arg_123_1.time_ < var_126_34 + var_126_35 then
				local var_126_36 = (arg_123_1.time_ - var_126_34) / var_126_35
				local var_126_37 = Vector3.New(0, 100, 0)

				var_126_33.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1048ui_story, var_126_37, var_126_36)

				local var_126_38 = manager.ui.mainCamera.transform.position - var_126_33.position

				var_126_33.forward = Vector3.New(var_126_38.x, var_126_38.y, var_126_38.z)

				local var_126_39 = var_126_33.localEulerAngles

				var_126_39.z = 0
				var_126_39.x = 0
				var_126_33.localEulerAngles = var_126_39
			end

			if arg_123_1.time_ >= var_126_34 + var_126_35 and arg_123_1.time_ < var_126_34 + var_126_35 + arg_126_0 then
				var_126_33.localPosition = Vector3.New(0, 100, 0)

				local var_126_40 = manager.ui.mainCamera.transform.position - var_126_33.position

				var_126_33.forward = Vector3.New(var_126_40.x, var_126_40.y, var_126_40.z)

				local var_126_41 = var_126_33.localEulerAngles

				var_126_41.z = 0
				var_126_41.x = 0
				var_126_33.localEulerAngles = var_126_41
			end

			local var_126_42 = arg_123_1.actors_["1048ui_story"]
			local var_126_43 = 0

			if var_126_43 < arg_123_1.time_ and arg_123_1.time_ <= var_126_43 + arg_126_0 and arg_123_1.var_.characterEffect1048ui_story == nil then
				arg_123_1.var_.characterEffect1048ui_story = var_126_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_44 = 0.200000002980232

			if var_126_43 <= arg_123_1.time_ and arg_123_1.time_ < var_126_43 + var_126_44 then
				local var_126_45 = (arg_123_1.time_ - var_126_43) / var_126_44

				if arg_123_1.var_.characterEffect1048ui_story then
					local var_126_46 = Mathf.Lerp(0, 0.5, var_126_45)

					arg_123_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1048ui_story.fillRatio = var_126_46
				end
			end

			if arg_123_1.time_ >= var_126_43 + var_126_44 and arg_123_1.time_ < var_126_43 + var_126_44 + arg_126_0 and arg_123_1.var_.characterEffect1048ui_story then
				local var_126_47 = 0.5

				arg_123_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1048ui_story.fillRatio = var_126_47
			end

			local var_126_48 = 0
			local var_126_49 = 0.25

			if var_126_48 < arg_123_1.time_ and arg_123_1.time_ <= var_126_48 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_50 = arg_123_1:FormatText(StoryNameCfg[327].name)

				arg_123_1.leftNameTxt_.text = var_126_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_51 = arg_123_1:GetWordFromCfg(910601030)
				local var_126_52 = arg_123_1:FormatText(var_126_51.content)

				arg_123_1.text_.text = var_126_52

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_53 = 10
				local var_126_54 = utf8.len(var_126_52)
				local var_126_55 = var_126_53 <= 0 and var_126_49 or var_126_49 * (var_126_54 / var_126_53)

				if var_126_55 > 0 and var_126_49 < var_126_55 then
					arg_123_1.talkMaxDuration = var_126_55

					if var_126_55 + var_126_48 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_55 + var_126_48
					end
				end

				arg_123_1.text_.text = var_126_52
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601030", "story_v_out_910601.awb") ~= 0 then
					local var_126_56 = manager.audio:GetVoiceLength("story_v_out_910601", "910601030", "story_v_out_910601.awb") / 1000

					if var_126_56 + var_126_48 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_56 + var_126_48
					end

					if var_126_51.prefab_name ~= "" and arg_123_1.actors_[var_126_51.prefab_name] ~= nil then
						local var_126_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_51.prefab_name].transform, "story_v_out_910601", "910601030", "story_v_out_910601.awb")

						arg_123_1:RecordAudio("910601030", var_126_57)
						arg_123_1:RecordAudio("910601030", var_126_57)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_910601", "910601030", "story_v_out_910601.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_910601", "910601030", "story_v_out_910601.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_58 = math.max(var_126_49, arg_123_1.talkMaxDuration)

			if var_126_48 <= arg_123_1.time_ and arg_123_1.time_ < var_126_48 + var_126_58 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_48) / var_126_58

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_48 + var_126_58 and arg_123_1.time_ < var_126_48 + var_126_58 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play910601031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 910601031
		arg_127_1.duration_ = 3.566

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play910601032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1028ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1028ui_story == nil then
				arg_127_1.var_.characterEffect1028ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1028ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1028ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1028ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1028ui_story.fillRatio = var_130_5
			end

			local var_130_6 = arg_127_1.actors_["1059ui_story"].transform
			local var_130_7 = 0

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 then
				arg_127_1.var_.moveOldPos1059ui_story = var_130_6.localPosition
			end

			local var_130_8 = 0.001

			if var_130_7 <= arg_127_1.time_ and arg_127_1.time_ < var_130_7 + var_130_8 then
				local var_130_9 = (arg_127_1.time_ - var_130_7) / var_130_8
				local var_130_10 = Vector3.New(-0.7, -1.05, -6)

				var_130_6.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1059ui_story, var_130_10, var_130_9)

				local var_130_11 = manager.ui.mainCamera.transform.position - var_130_6.position

				var_130_6.forward = Vector3.New(var_130_11.x, var_130_11.y, var_130_11.z)

				local var_130_12 = var_130_6.localEulerAngles

				var_130_12.z = 0
				var_130_12.x = 0
				var_130_6.localEulerAngles = var_130_12
			end

			if arg_127_1.time_ >= var_130_7 + var_130_8 and arg_127_1.time_ < var_130_7 + var_130_8 + arg_130_0 then
				var_130_6.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_130_13 = manager.ui.mainCamera.transform.position - var_130_6.position

				var_130_6.forward = Vector3.New(var_130_13.x, var_130_13.y, var_130_13.z)

				local var_130_14 = var_130_6.localEulerAngles

				var_130_14.z = 0
				var_130_14.x = 0
				var_130_6.localEulerAngles = var_130_14
			end

			local var_130_15 = arg_127_1.actors_["1059ui_story"]
			local var_130_16 = 0

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 and arg_127_1.var_.characterEffect1059ui_story == nil then
				arg_127_1.var_.characterEffect1059ui_story = var_130_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_17 = 0.200000002980232

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_17 then
				local var_130_18 = (arg_127_1.time_ - var_130_16) / var_130_17

				if arg_127_1.var_.characterEffect1059ui_story then
					arg_127_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_16 + var_130_17 and arg_127_1.time_ < var_130_16 + var_130_17 + arg_130_0 and arg_127_1.var_.characterEffect1059ui_story then
				arg_127_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_130_19 = 0

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_130_20 = 0

			if var_130_20 < arg_127_1.time_ and arg_127_1.time_ <= var_130_20 + arg_130_0 then
				arg_127_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_21 = arg_127_1.actors_["1048ui_story"].transform
			local var_130_22 = 0

			if var_130_22 < arg_127_1.time_ and arg_127_1.time_ <= var_130_22 + arg_130_0 then
				arg_127_1.var_.moveOldPos1048ui_story = var_130_21.localPosition

				local var_130_23 = "1048ui_story"

				arg_127_1:ShowWeapon(arg_127_1.var_[var_130_23 .. "Animator"].transform, false)
			end

			local var_130_24 = 0.001

			if var_130_22 <= arg_127_1.time_ and arg_127_1.time_ < var_130_22 + var_130_24 then
				local var_130_25 = (arg_127_1.time_ - var_130_22) / var_130_24
				local var_130_26 = Vector3.New(0.7, -0.8, -6.2)

				var_130_21.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1048ui_story, var_130_26, var_130_25)

				local var_130_27 = manager.ui.mainCamera.transform.position - var_130_21.position

				var_130_21.forward = Vector3.New(var_130_27.x, var_130_27.y, var_130_27.z)

				local var_130_28 = var_130_21.localEulerAngles

				var_130_28.z = 0
				var_130_28.x = 0
				var_130_21.localEulerAngles = var_130_28
			end

			if arg_127_1.time_ >= var_130_22 + var_130_24 and arg_127_1.time_ < var_130_22 + var_130_24 + arg_130_0 then
				var_130_21.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_130_29 = manager.ui.mainCamera.transform.position - var_130_21.position

				var_130_21.forward = Vector3.New(var_130_29.x, var_130_29.y, var_130_29.z)

				local var_130_30 = var_130_21.localEulerAngles

				var_130_30.z = 0
				var_130_30.x = 0
				var_130_21.localEulerAngles = var_130_30
			end

			local var_130_31 = arg_127_1.actors_["1048ui_story"]
			local var_130_32 = 0

			if var_130_32 < arg_127_1.time_ and arg_127_1.time_ <= var_130_32 + arg_130_0 and arg_127_1.var_.characterEffect1048ui_story == nil then
				arg_127_1.var_.characterEffect1048ui_story = var_130_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_33 = 0.200000002980232

			if var_130_32 <= arg_127_1.time_ and arg_127_1.time_ < var_130_32 + var_130_33 then
				local var_130_34 = (arg_127_1.time_ - var_130_32) / var_130_33

				if arg_127_1.var_.characterEffect1048ui_story then
					arg_127_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_32 + var_130_33 and arg_127_1.time_ < var_130_32 + var_130_33 + arg_130_0 and arg_127_1.var_.characterEffect1048ui_story then
				arg_127_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_130_35 = 0

			if var_130_35 < arg_127_1.time_ and arg_127_1.time_ <= var_130_35 + arg_130_0 then
				arg_127_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_130_36 = 0

			if var_130_36 < arg_127_1.time_ and arg_127_1.time_ <= var_130_36 + arg_130_0 then
				arg_127_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_130_37 = arg_127_1.actors_["1028ui_story"].transform
			local var_130_38 = 0

			if var_130_38 < arg_127_1.time_ and arg_127_1.time_ <= var_130_38 + arg_130_0 then
				arg_127_1.var_.moveOldPos1028ui_story = var_130_37.localPosition

				local var_130_39 = "1028ui_story"

				arg_127_1:ShowWeapon(arg_127_1.var_[var_130_39 .. "Animator"].transform, false)
			end

			local var_130_40 = 0.001

			if var_130_38 <= arg_127_1.time_ and arg_127_1.time_ < var_130_38 + var_130_40 then
				local var_130_41 = (arg_127_1.time_ - var_130_38) / var_130_40
				local var_130_42 = Vector3.New(0, 100, 0)

				var_130_37.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1028ui_story, var_130_42, var_130_41)

				local var_130_43 = manager.ui.mainCamera.transform.position - var_130_37.position

				var_130_37.forward = Vector3.New(var_130_43.x, var_130_43.y, var_130_43.z)

				local var_130_44 = var_130_37.localEulerAngles

				var_130_44.z = 0
				var_130_44.x = 0
				var_130_37.localEulerAngles = var_130_44
			end

			if arg_127_1.time_ >= var_130_38 + var_130_40 and arg_127_1.time_ < var_130_38 + var_130_40 + arg_130_0 then
				var_130_37.localPosition = Vector3.New(0, 100, 0)

				local var_130_45 = manager.ui.mainCamera.transform.position - var_130_37.position

				var_130_37.forward = Vector3.New(var_130_45.x, var_130_45.y, var_130_45.z)

				local var_130_46 = var_130_37.localEulerAngles

				var_130_46.z = 0
				var_130_46.x = 0
				var_130_37.localEulerAngles = var_130_46
			end

			local var_130_47 = 0
			local var_130_48 = 0.225

			if var_130_47 < arg_127_1.time_ and arg_127_1.time_ <= var_130_47 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_49 = arg_127_1:FormatText(StoryNameCfg[335].name)

				arg_127_1.leftNameTxt_.text = var_130_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_50 = arg_127_1:GetWordFromCfg(910601031)
				local var_130_51 = arg_127_1:FormatText(var_130_50.content)

				arg_127_1.text_.text = var_130_51

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_52 = 9
				local var_130_53 = utf8.len(var_130_51)
				local var_130_54 = var_130_52 <= 0 and var_130_48 or var_130_48 * (var_130_53 / var_130_52)

				if var_130_54 > 0 and var_130_48 < var_130_54 then
					arg_127_1.talkMaxDuration = var_130_54

					if var_130_54 + var_130_47 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_54 + var_130_47
					end
				end

				arg_127_1.text_.text = var_130_51
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601031", "story_v_out_910601.awb") ~= 0 then
					local var_130_55 = manager.audio:GetVoiceLength("story_v_out_910601", "910601031", "story_v_out_910601.awb") / 1000

					if var_130_55 + var_130_47 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_55 + var_130_47
					end

					if var_130_50.prefab_name ~= "" and arg_127_1.actors_[var_130_50.prefab_name] ~= nil then
						local var_130_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_50.prefab_name].transform, "story_v_out_910601", "910601031", "story_v_out_910601.awb")

						arg_127_1:RecordAudio("910601031", var_130_56)
						arg_127_1:RecordAudio("910601031", var_130_56)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_910601", "910601031", "story_v_out_910601.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_910601", "910601031", "story_v_out_910601.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_57 = math.max(var_130_48, arg_127_1.talkMaxDuration)

			if var_130_47 <= arg_127_1.time_ and arg_127_1.time_ < var_130_47 + var_130_57 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_47) / var_130_57

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_47 + var_130_57 and arg_127_1.time_ < var_130_47 + var_130_57 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play910601032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 910601032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play910601033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1048ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1048ui_story == nil then
				arg_131_1.var_.characterEffect1048ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1048ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1048ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1048ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1048ui_story.fillRatio = var_134_5
			end

			local var_134_6 = arg_131_1.actors_["1059ui_story"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 and arg_131_1.var_.characterEffect1059ui_story == nil then
				arg_131_1.var_.characterEffect1059ui_story = var_134_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_8 = 0.200000002980232

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_8 then
				local var_134_9 = (arg_131_1.time_ - var_134_7) / var_134_8

				if arg_131_1.var_.characterEffect1059ui_story then
					local var_134_10 = Mathf.Lerp(0, 0.5, var_134_9)

					arg_131_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1059ui_story.fillRatio = var_134_10
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_8 and arg_131_1.time_ < var_134_7 + var_134_8 + arg_134_0 and arg_131_1.var_.characterEffect1059ui_story then
				local var_134_11 = 0.5

				arg_131_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1059ui_story.fillRatio = var_134_11
			end

			local var_134_12 = 0
			local var_134_13 = 0.35

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_14 = arg_131_1:FormatText(StoryNameCfg[7].name)

				arg_131_1.leftNameTxt_.text = var_134_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_15 = arg_131_1:GetWordFromCfg(910601032)
				local var_134_16 = arg_131_1:FormatText(var_134_15.content)

				arg_131_1.text_.text = var_134_16

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_17 = 14
				local var_134_18 = utf8.len(var_134_16)
				local var_134_19 = var_134_17 <= 0 and var_134_13 or var_134_13 * (var_134_18 / var_134_17)

				if var_134_19 > 0 and var_134_13 < var_134_19 then
					arg_131_1.talkMaxDuration = var_134_19

					if var_134_19 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_19 + var_134_12
					end
				end

				arg_131_1.text_.text = var_134_16
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_20 = math.max(var_134_13, arg_131_1.talkMaxDuration)

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_20 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_12) / var_134_20

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_12 + var_134_20 and arg_131_1.time_ < var_134_12 + var_134_20 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play910601033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 910601033
		arg_135_1.duration_ = 4.233

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play910601034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1084ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1084ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, -0.97, -6)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1084ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1084ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story == nil then
				arg_135_1.var_.characterEffect1084ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1084ui_story then
					arg_135_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story then
				arg_135_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_138_15 = arg_135_1.actors_["1028ui_story"].transform
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1.var_.moveOldPos1028ui_story = var_138_15.localPosition
			end

			local var_138_17 = 0.001

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17
				local var_138_19 = Vector3.New(0, 100, 0)

				var_138_15.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1028ui_story, var_138_19, var_138_18)

				local var_138_20 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_20.x, var_138_20.y, var_138_20.z)

				local var_138_21 = var_138_15.localEulerAngles

				var_138_21.z = 0
				var_138_21.x = 0
				var_138_15.localEulerAngles = var_138_21
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 then
				var_138_15.localPosition = Vector3.New(0, 100, 0)

				local var_138_22 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_22.x, var_138_22.y, var_138_22.z)

				local var_138_23 = var_138_15.localEulerAngles

				var_138_23.z = 0
				var_138_23.x = 0
				var_138_15.localEulerAngles = var_138_23
			end

			local var_138_24 = arg_135_1.actors_["1028ui_story"]
			local var_138_25 = 0

			if var_138_25 < arg_135_1.time_ and arg_135_1.time_ <= var_138_25 + arg_138_0 and arg_135_1.var_.characterEffect1028ui_story == nil then
				arg_135_1.var_.characterEffect1028ui_story = var_138_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_26 = 0.200000002980232

			if var_138_25 <= arg_135_1.time_ and arg_135_1.time_ < var_138_25 + var_138_26 then
				local var_138_27 = (arg_135_1.time_ - var_138_25) / var_138_26

				if arg_135_1.var_.characterEffect1028ui_story then
					local var_138_28 = Mathf.Lerp(0, 0.5, var_138_27)

					arg_135_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1028ui_story.fillRatio = var_138_28
				end
			end

			if arg_135_1.time_ >= var_138_25 + var_138_26 and arg_135_1.time_ < var_138_25 + var_138_26 + arg_138_0 and arg_135_1.var_.characterEffect1028ui_story then
				local var_138_29 = 0.5

				arg_135_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1028ui_story.fillRatio = var_138_29
			end

			local var_138_30 = arg_135_1.actors_["1059ui_story"].transform
			local var_138_31 = 0

			if var_138_31 < arg_135_1.time_ and arg_135_1.time_ <= var_138_31 + arg_138_0 then
				arg_135_1.var_.moveOldPos1059ui_story = var_138_30.localPosition
			end

			local var_138_32 = 0.001

			if var_138_31 <= arg_135_1.time_ and arg_135_1.time_ < var_138_31 + var_138_32 then
				local var_138_33 = (arg_135_1.time_ - var_138_31) / var_138_32
				local var_138_34 = Vector3.New(0, 100, 0)

				var_138_30.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1059ui_story, var_138_34, var_138_33)

				local var_138_35 = manager.ui.mainCamera.transform.position - var_138_30.position

				var_138_30.forward = Vector3.New(var_138_35.x, var_138_35.y, var_138_35.z)

				local var_138_36 = var_138_30.localEulerAngles

				var_138_36.z = 0
				var_138_36.x = 0
				var_138_30.localEulerAngles = var_138_36
			end

			if arg_135_1.time_ >= var_138_31 + var_138_32 and arg_135_1.time_ < var_138_31 + var_138_32 + arg_138_0 then
				var_138_30.localPosition = Vector3.New(0, 100, 0)

				local var_138_37 = manager.ui.mainCamera.transform.position - var_138_30.position

				var_138_30.forward = Vector3.New(var_138_37.x, var_138_37.y, var_138_37.z)

				local var_138_38 = var_138_30.localEulerAngles

				var_138_38.z = 0
				var_138_38.x = 0
				var_138_30.localEulerAngles = var_138_38
			end

			local var_138_39 = arg_135_1.actors_["1048ui_story"].transform
			local var_138_40 = 0

			if var_138_40 < arg_135_1.time_ and arg_135_1.time_ <= var_138_40 + arg_138_0 then
				arg_135_1.var_.moveOldPos1048ui_story = var_138_39.localPosition
			end

			local var_138_41 = 0.001

			if var_138_40 <= arg_135_1.time_ and arg_135_1.time_ < var_138_40 + var_138_41 then
				local var_138_42 = (arg_135_1.time_ - var_138_40) / var_138_41
				local var_138_43 = Vector3.New(0, 100, 0)

				var_138_39.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1048ui_story, var_138_43, var_138_42)

				local var_138_44 = manager.ui.mainCamera.transform.position - var_138_39.position

				var_138_39.forward = Vector3.New(var_138_44.x, var_138_44.y, var_138_44.z)

				local var_138_45 = var_138_39.localEulerAngles

				var_138_45.z = 0
				var_138_45.x = 0
				var_138_39.localEulerAngles = var_138_45
			end

			if arg_135_1.time_ >= var_138_40 + var_138_41 and arg_135_1.time_ < var_138_40 + var_138_41 + arg_138_0 then
				var_138_39.localPosition = Vector3.New(0, 100, 0)

				local var_138_46 = manager.ui.mainCamera.transform.position - var_138_39.position

				var_138_39.forward = Vector3.New(var_138_46.x, var_138_46.y, var_138_46.z)

				local var_138_47 = var_138_39.localEulerAngles

				var_138_47.z = 0
				var_138_47.x = 0
				var_138_39.localEulerAngles = var_138_47
			end

			local var_138_48 = 0
			local var_138_49 = 0.5

			if var_138_48 < arg_135_1.time_ and arg_135_1.time_ <= var_138_48 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_50 = arg_135_1:FormatText(StoryNameCfg[6].name)

				arg_135_1.leftNameTxt_.text = var_138_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_51 = arg_135_1:GetWordFromCfg(910601033)
				local var_138_52 = arg_135_1:FormatText(var_138_51.content)

				arg_135_1.text_.text = var_138_52

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_53 = 20
				local var_138_54 = utf8.len(var_138_52)
				local var_138_55 = var_138_53 <= 0 and var_138_49 or var_138_49 * (var_138_54 / var_138_53)

				if var_138_55 > 0 and var_138_49 < var_138_55 then
					arg_135_1.talkMaxDuration = var_138_55

					if var_138_55 + var_138_48 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_55 + var_138_48
					end
				end

				arg_135_1.text_.text = var_138_52
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601033", "story_v_out_910601.awb") ~= 0 then
					local var_138_56 = manager.audio:GetVoiceLength("story_v_out_910601", "910601033", "story_v_out_910601.awb") / 1000

					if var_138_56 + var_138_48 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_56 + var_138_48
					end

					if var_138_51.prefab_name ~= "" and arg_135_1.actors_[var_138_51.prefab_name] ~= nil then
						local var_138_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_51.prefab_name].transform, "story_v_out_910601", "910601033", "story_v_out_910601.awb")

						arg_135_1:RecordAudio("910601033", var_138_57)
						arg_135_1:RecordAudio("910601033", var_138_57)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_910601", "910601033", "story_v_out_910601.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_910601", "910601033", "story_v_out_910601.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_58 = math.max(var_138_49, arg_135_1.talkMaxDuration)

			if var_138_48 <= arg_135_1.time_ and arg_135_1.time_ < var_138_48 + var_138_58 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_48) / var_138_58

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_48 + var_138_58 and arg_135_1.time_ < var_138_48 + var_138_58 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play910601034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 910601034
		arg_139_1.duration_ = 7.033

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play910601035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_142_2 = 0
			local var_142_3 = 0.925

			if var_142_2 < arg_139_1.time_ and arg_139_1.time_ <= var_142_2 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_4 = arg_139_1:FormatText(StoryNameCfg[6].name)

				arg_139_1.leftNameTxt_.text = var_142_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_5 = arg_139_1:GetWordFromCfg(910601034)
				local var_142_6 = arg_139_1:FormatText(var_142_5.content)

				arg_139_1.text_.text = var_142_6

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_7 = 37
				local var_142_8 = utf8.len(var_142_6)
				local var_142_9 = var_142_7 <= 0 and var_142_3 or var_142_3 * (var_142_8 / var_142_7)

				if var_142_9 > 0 and var_142_3 < var_142_9 then
					arg_139_1.talkMaxDuration = var_142_9

					if var_142_9 + var_142_2 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_9 + var_142_2
					end
				end

				arg_139_1.text_.text = var_142_6
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601034", "story_v_out_910601.awb") ~= 0 then
					local var_142_10 = manager.audio:GetVoiceLength("story_v_out_910601", "910601034", "story_v_out_910601.awb") / 1000

					if var_142_10 + var_142_2 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_10 + var_142_2
					end

					if var_142_5.prefab_name ~= "" and arg_139_1.actors_[var_142_5.prefab_name] ~= nil then
						local var_142_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_5.prefab_name].transform, "story_v_out_910601", "910601034", "story_v_out_910601.awb")

						arg_139_1:RecordAudio("910601034", var_142_11)
						arg_139_1:RecordAudio("910601034", var_142_11)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_910601", "910601034", "story_v_out_910601.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_910601", "910601034", "story_v_out_910601.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_12 = math.max(var_142_3, arg_139_1.talkMaxDuration)

			if var_142_2 <= arg_139_1.time_ and arg_139_1.time_ < var_142_2 + var_142_12 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_2) / var_142_12

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_2 + var_142_12 and arg_139_1.time_ < var_142_2 + var_142_12 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play910601035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 910601035
		arg_143_1.duration_ = 7.366

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play910601036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_146_2 = 0
			local var_146_3 = 1.025

			if var_146_2 < arg_143_1.time_ and arg_143_1.time_ <= var_146_2 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_4 = arg_143_1:FormatText(StoryNameCfg[6].name)

				arg_143_1.leftNameTxt_.text = var_146_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_5 = arg_143_1:GetWordFromCfg(910601035)
				local var_146_6 = arg_143_1:FormatText(var_146_5.content)

				arg_143_1.text_.text = var_146_6

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_7 = 41
				local var_146_8 = utf8.len(var_146_6)
				local var_146_9 = var_146_7 <= 0 and var_146_3 or var_146_3 * (var_146_8 / var_146_7)

				if var_146_9 > 0 and var_146_3 < var_146_9 then
					arg_143_1.talkMaxDuration = var_146_9

					if var_146_9 + var_146_2 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_9 + var_146_2
					end
				end

				arg_143_1.text_.text = var_146_6
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601035", "story_v_out_910601.awb") ~= 0 then
					local var_146_10 = manager.audio:GetVoiceLength("story_v_out_910601", "910601035", "story_v_out_910601.awb") / 1000

					if var_146_10 + var_146_2 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_10 + var_146_2
					end

					if var_146_5.prefab_name ~= "" and arg_143_1.actors_[var_146_5.prefab_name] ~= nil then
						local var_146_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_5.prefab_name].transform, "story_v_out_910601", "910601035", "story_v_out_910601.awb")

						arg_143_1:RecordAudio("910601035", var_146_11)
						arg_143_1:RecordAudio("910601035", var_146_11)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_910601", "910601035", "story_v_out_910601.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_910601", "910601035", "story_v_out_910601.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_12 = math.max(var_146_3, arg_143_1.talkMaxDuration)

			if var_146_2 <= arg_143_1.time_ and arg_143_1.time_ < var_146_2 + var_146_12 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_2) / var_146_12

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_2 + var_146_12 and arg_143_1.time_ < var_146_2 + var_146_12 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play910601036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 910601036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play910601037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1084ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1084ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0, 100, 0)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1084ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0, 100, 0)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = 0
			local var_150_10 = 0.5

			if var_150_9 < arg_147_1.time_ and arg_147_1.time_ <= var_150_9 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_11 = arg_147_1:GetWordFromCfg(910601036)
				local var_150_12 = arg_147_1:FormatText(var_150_11.content)

				arg_147_1.text_.text = var_150_12

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_13 = 20
				local var_150_14 = utf8.len(var_150_12)
				local var_150_15 = var_150_13 <= 0 and var_150_10 or var_150_10 * (var_150_14 / var_150_13)

				if var_150_15 > 0 and var_150_10 < var_150_15 then
					arg_147_1.talkMaxDuration = var_150_15

					if var_150_15 + var_150_9 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_15 + var_150_9
					end
				end

				arg_147_1.text_.text = var_150_12
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_16 = math.max(var_150_10, arg_147_1.talkMaxDuration)

			if var_150_9 <= arg_147_1.time_ and arg_147_1.time_ < var_150_9 + var_150_16 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_9) / var_150_16

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_9 + var_150_16 and arg_147_1.time_ < var_150_9 + var_150_16 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play910601037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 910601037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play910601038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = manager.ui.mainCamera.transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.shakeOldPos = var_154_0.localPosition
			end

			local var_154_2 = 0.6

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / 0.066
				local var_154_4, var_154_5 = math.modf(var_154_3)

				var_154_0.localPosition = Vector3.New(var_154_5 * 0.13, var_154_5 * 0.13, var_154_5 * 0.13) + arg_151_1.var_.shakeOldPos
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = arg_151_1.var_.shakeOldPos
			end

			local var_154_6 = 0

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1.allBtn_.enabled = false
			end

			local var_154_7 = 0.6

			if arg_151_1.time_ >= var_154_6 + var_154_7 and arg_151_1.time_ < var_154_6 + var_154_7 + arg_154_0 then
				arg_151_1.allBtn_.enabled = true
			end

			local var_154_8 = 0
			local var_154_9 = 0.225

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_10 = arg_151_1:FormatText(StoryNameCfg[7].name)

				arg_151_1.leftNameTxt_.text = var_154_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_11 = arg_151_1:GetWordFromCfg(910601037)
				local var_154_12 = arg_151_1:FormatText(var_154_11.content)

				arg_151_1.text_.text = var_154_12

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_13 = 9
				local var_154_14 = utf8.len(var_154_12)
				local var_154_15 = var_154_13 <= 0 and var_154_9 or var_154_9 * (var_154_14 / var_154_13)

				if var_154_15 > 0 and var_154_9 < var_154_15 then
					arg_151_1.talkMaxDuration = var_154_15

					if var_154_15 + var_154_8 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_15 + var_154_8
					end
				end

				arg_151_1.text_.text = var_154_12
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_16 = math.max(var_154_9, arg_151_1.talkMaxDuration)

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_16 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_8) / var_154_16

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_8 + var_154_16 and arg_151_1.time_ < var_154_8 + var_154_16 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play910601038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 910601038
		arg_155_1.duration_ = 4.833

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play910601039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1011ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1011ui_story = var_158_0.localPosition

				local var_158_2 = "1011ui_story"

				arg_155_1:ShowWeapon(arg_155_1.var_[var_158_2 .. "Animator"].transform, false)
			end

			local var_158_3 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_3 then
				local var_158_4 = (arg_155_1.time_ - var_158_1) / var_158_3
				local var_158_5 = Vector3.New(0, -0.71, -6)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1011ui_story, var_158_5, var_158_4)

				local var_158_6 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_6.x, var_158_6.y, var_158_6.z)

				local var_158_7 = var_158_0.localEulerAngles

				var_158_7.z = 0
				var_158_7.x = 0
				var_158_0.localEulerAngles = var_158_7
			end

			if arg_155_1.time_ >= var_158_1 + var_158_3 and arg_155_1.time_ < var_158_1 + var_158_3 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_158_8 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_8.x, var_158_8.y, var_158_8.z)

				local var_158_9 = var_158_0.localEulerAngles

				var_158_9.z = 0
				var_158_9.x = 0
				var_158_0.localEulerAngles = var_158_9
			end

			local var_158_10 = arg_155_1.actors_["1011ui_story"]
			local var_158_11 = 0

			if var_158_11 < arg_155_1.time_ and arg_155_1.time_ <= var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect1011ui_story == nil then
				arg_155_1.var_.characterEffect1011ui_story = var_158_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_12 = 0.200000002980232

			if var_158_11 <= arg_155_1.time_ and arg_155_1.time_ < var_158_11 + var_158_12 then
				local var_158_13 = (arg_155_1.time_ - var_158_11) / var_158_12

				if arg_155_1.var_.characterEffect1011ui_story then
					arg_155_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_11 + var_158_12 and arg_155_1.time_ < var_158_11 + var_158_12 + arg_158_0 and arg_155_1.var_.characterEffect1011ui_story then
				arg_155_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_158_15 = 0

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_158_16 = 0
			local var_158_17 = 0.6

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_18 = arg_155_1:FormatText(StoryNameCfg[37].name)

				arg_155_1.leftNameTxt_.text = var_158_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_19 = arg_155_1:GetWordFromCfg(910601038)
				local var_158_20 = arg_155_1:FormatText(var_158_19.content)

				arg_155_1.text_.text = var_158_20

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_21 = 24
				local var_158_22 = utf8.len(var_158_20)
				local var_158_23 = var_158_21 <= 0 and var_158_17 or var_158_17 * (var_158_22 / var_158_21)

				if var_158_23 > 0 and var_158_17 < var_158_23 then
					arg_155_1.talkMaxDuration = var_158_23

					if var_158_23 + var_158_16 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_23 + var_158_16
					end
				end

				arg_155_1.text_.text = var_158_20
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601038", "story_v_out_910601.awb") ~= 0 then
					local var_158_24 = manager.audio:GetVoiceLength("story_v_out_910601", "910601038", "story_v_out_910601.awb") / 1000

					if var_158_24 + var_158_16 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_24 + var_158_16
					end

					if var_158_19.prefab_name ~= "" and arg_155_1.actors_[var_158_19.prefab_name] ~= nil then
						local var_158_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_19.prefab_name].transform, "story_v_out_910601", "910601038", "story_v_out_910601.awb")

						arg_155_1:RecordAudio("910601038", var_158_25)
						arg_155_1:RecordAudio("910601038", var_158_25)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_910601", "910601038", "story_v_out_910601.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_910601", "910601038", "story_v_out_910601.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_26 = math.max(var_158_17, arg_155_1.talkMaxDuration)

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_26 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_16) / var_158_26

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_16 + var_158_26 and arg_155_1.time_ < var_158_16 + var_158_26 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play910601039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 910601039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play910601040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1011ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1011ui_story == nil then
				arg_159_1.var_.characterEffect1011ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1011ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1011ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1011ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1011ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.4

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_8 = arg_159_1:FormatText(StoryNameCfg[7].name)

				arg_159_1.leftNameTxt_.text = var_162_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_9 = arg_159_1:GetWordFromCfg(910601039)
				local var_162_10 = arg_159_1:FormatText(var_162_9.content)

				arg_159_1.text_.text = var_162_10

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_11 = 16
				local var_162_12 = utf8.len(var_162_10)
				local var_162_13 = var_162_11 <= 0 and var_162_7 or var_162_7 * (var_162_12 / var_162_11)

				if var_162_13 > 0 and var_162_7 < var_162_13 then
					arg_159_1.talkMaxDuration = var_162_13

					if var_162_13 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_13 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_10
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_14 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_14 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_14

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_14 and arg_159_1.time_ < var_162_6 + var_162_14 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play910601040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 910601040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play910601041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.675

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[7].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(910601040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 27
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_8 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_8 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_8

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_8 and arg_163_1.time_ < var_166_0 + var_166_8 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play910601041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 910601041
		arg_167_1.duration_ = 1.999999999999

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play910601042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1011ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1011ui_story = var_170_0.localPosition

				local var_170_2 = "1011ui_story"

				arg_167_1:ShowWeapon(arg_167_1.var_[var_170_2 .. "Animator"].transform, false)
			end

			local var_170_3 = 0.1

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_3 then
				local var_170_4 = (arg_167_1.time_ - var_170_1) / var_170_3
				local var_170_5 = Vector3.New(0.7, -0.71, -6)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1011ui_story, var_170_5, var_170_4)

				local var_170_6 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_6.x, var_170_6.y, var_170_6.z)

				local var_170_7 = var_170_0.localEulerAngles

				var_170_7.z = 0
				var_170_7.x = 0
				var_170_0.localEulerAngles = var_170_7
			end

			if arg_167_1.time_ >= var_170_1 + var_170_3 and arg_167_1.time_ < var_170_1 + var_170_3 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_170_8 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_8.x, var_170_8.y, var_170_8.z)

				local var_170_9 = var_170_0.localEulerAngles

				var_170_9.z = 0
				var_170_9.x = 0
				var_170_0.localEulerAngles = var_170_9
			end

			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_170_11 = 0

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_170_12 = arg_167_1.actors_["1084ui_story"].transform
			local var_170_13 = 0

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1.var_.moveOldPos1084ui_story = var_170_12.localPosition
			end

			local var_170_14 = 0.001

			if var_170_13 <= arg_167_1.time_ and arg_167_1.time_ < var_170_13 + var_170_14 then
				local var_170_15 = (arg_167_1.time_ - var_170_13) / var_170_14
				local var_170_16 = Vector3.New(-0.7, -0.97, -6)

				var_170_12.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1084ui_story, var_170_16, var_170_15)

				local var_170_17 = manager.ui.mainCamera.transform.position - var_170_12.position

				var_170_12.forward = Vector3.New(var_170_17.x, var_170_17.y, var_170_17.z)

				local var_170_18 = var_170_12.localEulerAngles

				var_170_18.z = 0
				var_170_18.x = 0
				var_170_12.localEulerAngles = var_170_18
			end

			if arg_167_1.time_ >= var_170_13 + var_170_14 and arg_167_1.time_ < var_170_13 + var_170_14 + arg_170_0 then
				var_170_12.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_170_19 = manager.ui.mainCamera.transform.position - var_170_12.position

				var_170_12.forward = Vector3.New(var_170_19.x, var_170_19.y, var_170_19.z)

				local var_170_20 = var_170_12.localEulerAngles

				var_170_20.z = 0
				var_170_20.x = 0
				var_170_12.localEulerAngles = var_170_20
			end

			local var_170_21 = arg_167_1.actors_["1084ui_story"]
			local var_170_22 = 0

			if var_170_22 < arg_167_1.time_ and arg_167_1.time_ <= var_170_22 + arg_170_0 and arg_167_1.var_.characterEffect1084ui_story == nil then
				arg_167_1.var_.characterEffect1084ui_story = var_170_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_23 = 0.200000002980232

			if var_170_22 <= arg_167_1.time_ and arg_167_1.time_ < var_170_22 + var_170_23 then
				local var_170_24 = (arg_167_1.time_ - var_170_22) / var_170_23

				if arg_167_1.var_.characterEffect1084ui_story then
					local var_170_25 = Mathf.Lerp(0, 0.5, var_170_24)

					arg_167_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1084ui_story.fillRatio = var_170_25
				end
			end

			if arg_167_1.time_ >= var_170_22 + var_170_23 and arg_167_1.time_ < var_170_22 + var_170_23 + arg_170_0 and arg_167_1.var_.characterEffect1084ui_story then
				local var_170_26 = 0.5

				arg_167_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1084ui_story.fillRatio = var_170_26
			end

			local var_170_27 = 0

			if var_170_27 < arg_167_1.time_ and arg_167_1.time_ <= var_170_27 + arg_170_0 then
				arg_167_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action446")
			end

			local var_170_28 = 0

			if var_170_28 < arg_167_1.time_ and arg_167_1.time_ <= var_170_28 + arg_170_0 then
				arg_167_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_170_29 = 0
			local var_170_30 = 0.05

			if var_170_29 < arg_167_1.time_ and arg_167_1.time_ <= var_170_29 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_31 = arg_167_1:FormatText(StoryNameCfg[661].name)

				arg_167_1.leftNameTxt_.text = var_170_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_32 = arg_167_1:GetWordFromCfg(910601041)
				local var_170_33 = arg_167_1:FormatText(var_170_32.content)

				arg_167_1.text_.text = var_170_33

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_34 = 2
				local var_170_35 = utf8.len(var_170_33)
				local var_170_36 = var_170_34 <= 0 and var_170_30 or var_170_30 * (var_170_35 / var_170_34)

				if var_170_36 > 0 and var_170_30 < var_170_36 then
					arg_167_1.talkMaxDuration = var_170_36

					if var_170_36 + var_170_29 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_36 + var_170_29
					end
				end

				arg_167_1.text_.text = var_170_33
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601041", "story_v_out_910601.awb") ~= 0 then
					local var_170_37 = manager.audio:GetVoiceLength("story_v_out_910601", "910601041", "story_v_out_910601.awb") / 1000

					if var_170_37 + var_170_29 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_37 + var_170_29
					end

					if var_170_32.prefab_name ~= "" and arg_167_1.actors_[var_170_32.prefab_name] ~= nil then
						local var_170_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_32.prefab_name].transform, "story_v_out_910601", "910601041", "story_v_out_910601.awb")

						arg_167_1:RecordAudio("910601041", var_170_38)
						arg_167_1:RecordAudio("910601041", var_170_38)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_910601", "910601041", "story_v_out_910601.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_910601", "910601041", "story_v_out_910601.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_39 = math.max(var_170_30, arg_167_1.talkMaxDuration)

			if var_170_29 <= arg_167_1.time_ and arg_167_1.time_ < var_170_29 + var_170_39 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_29) / var_170_39

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_29 + var_170_39 and arg_167_1.time_ < var_170_29 + var_170_39 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play910601042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 910601042
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play910601043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.45

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[7].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(910601042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 18
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_8 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_8 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_8

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_8 and arg_171_1.time_ < var_174_0 + var_174_8 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play910601043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 910601043
		arg_175_1.duration_ = 5.466

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play910601044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1084ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1084ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(-0.7, -0.97, -6)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1084ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1084ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1084ui_story == nil then
				arg_175_1.var_.characterEffect1084ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1084ui_story then
					arg_175_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1084ui_story then
				arg_175_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_178_13 = 0

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action474")
			end

			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				arg_175_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_178_15 = 0
			local var_178_16 = 0.55

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_17 = arg_175_1:FormatText(StoryNameCfg[6].name)

				arg_175_1.leftNameTxt_.text = var_178_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_18 = arg_175_1:GetWordFromCfg(910601043)
				local var_178_19 = arg_175_1:FormatText(var_178_18.content)

				arg_175_1.text_.text = var_178_19

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_20 = 22
				local var_178_21 = utf8.len(var_178_19)
				local var_178_22 = var_178_20 <= 0 and var_178_16 or var_178_16 * (var_178_21 / var_178_20)

				if var_178_22 > 0 and var_178_16 < var_178_22 then
					arg_175_1.talkMaxDuration = var_178_22

					if var_178_22 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_22 + var_178_15
					end
				end

				arg_175_1.text_.text = var_178_19
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601043", "story_v_out_910601.awb") ~= 0 then
					local var_178_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601043", "story_v_out_910601.awb") / 1000

					if var_178_23 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_23 + var_178_15
					end

					if var_178_18.prefab_name ~= "" and arg_175_1.actors_[var_178_18.prefab_name] ~= nil then
						local var_178_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_18.prefab_name].transform, "story_v_out_910601", "910601043", "story_v_out_910601.awb")

						arg_175_1:RecordAudio("910601043", var_178_24)
						arg_175_1:RecordAudio("910601043", var_178_24)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_910601", "910601043", "story_v_out_910601.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_910601", "910601043", "story_v_out_910601.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_25 = math.max(var_178_16, arg_175_1.talkMaxDuration)

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_25 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_15) / var_178_25

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_15 + var_178_25 and arg_175_1.time_ < var_178_15 + var_178_25 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play910601044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 910601044
		arg_179_1.duration_ = 2.6

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play910601045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1011ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1011ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0.7, -0.71, -6)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1011ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1011ui_story"]
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1011ui_story == nil then
				arg_179_1.var_.characterEffect1011ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.200000002980232

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1011ui_story then
					arg_179_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1011ui_story then
				arg_179_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_182_13 = 0

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action462")
			end

			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				arg_179_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_15 = arg_179_1.actors_["1084ui_story"]
			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story == nil then
				arg_179_1.var_.characterEffect1084ui_story = var_182_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_17 = 0.200000002980232

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17

				if arg_179_1.var_.characterEffect1084ui_story then
					local var_182_19 = Mathf.Lerp(0, 0.5, var_182_18)

					arg_179_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1084ui_story.fillRatio = var_182_19
				end
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story then
				local var_182_20 = 0.5

				arg_179_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1084ui_story.fillRatio = var_182_20
			end

			local var_182_21 = 0
			local var_182_22 = 0.325

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_23 = arg_179_1:FormatText(StoryNameCfg[37].name)

				arg_179_1.leftNameTxt_.text = var_182_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_24 = arg_179_1:GetWordFromCfg(910601044)
				local var_182_25 = arg_179_1:FormatText(var_182_24.content)

				arg_179_1.text_.text = var_182_25

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_26 = 13
				local var_182_27 = utf8.len(var_182_25)
				local var_182_28 = var_182_26 <= 0 and var_182_22 or var_182_22 * (var_182_27 / var_182_26)

				if var_182_28 > 0 and var_182_22 < var_182_28 then
					arg_179_1.talkMaxDuration = var_182_28

					if var_182_28 + var_182_21 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_28 + var_182_21
					end
				end

				arg_179_1.text_.text = var_182_25
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601044", "story_v_out_910601.awb") ~= 0 then
					local var_182_29 = manager.audio:GetVoiceLength("story_v_out_910601", "910601044", "story_v_out_910601.awb") / 1000

					if var_182_29 + var_182_21 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_29 + var_182_21
					end

					if var_182_24.prefab_name ~= "" and arg_179_1.actors_[var_182_24.prefab_name] ~= nil then
						local var_182_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_24.prefab_name].transform, "story_v_out_910601", "910601044", "story_v_out_910601.awb")

						arg_179_1:RecordAudio("910601044", var_182_30)
						arg_179_1:RecordAudio("910601044", var_182_30)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_910601", "910601044", "story_v_out_910601.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_910601", "910601044", "story_v_out_910601.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_31 = math.max(var_182_22, arg_179_1.talkMaxDuration)

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_31 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_21) / var_182_31

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_21 + var_182_31 and arg_179_1.time_ < var_182_21 + var_182_31 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play910601045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 910601045
		arg_183_1.duration_ = 4.1

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play910601046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1084ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1084ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(-0.7, -0.97, -6)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1084ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["1084ui_story"]
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story == nil then
				arg_183_1.var_.characterEffect1084ui_story = var_186_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_11 = 0.200000002980232

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11

				if arg_183_1.var_.characterEffect1084ui_story then
					arg_183_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story then
				arg_183_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action447")
			end

			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 then
				arg_183_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_15 = arg_183_1.actors_["1011ui_story"]
			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 and arg_183_1.var_.characterEffect1011ui_story == nil then
				arg_183_1.var_.characterEffect1011ui_story = var_186_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_17 = 0.200000002980232

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17

				if arg_183_1.var_.characterEffect1011ui_story then
					local var_186_19 = Mathf.Lerp(0, 0.5, var_186_18)

					arg_183_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1011ui_story.fillRatio = var_186_19
				end
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 and arg_183_1.var_.characterEffect1011ui_story then
				local var_186_20 = 0.5

				arg_183_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1011ui_story.fillRatio = var_186_20
			end

			local var_186_21 = 0
			local var_186_22 = 0.525

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_23 = arg_183_1:FormatText(StoryNameCfg[6].name)

				arg_183_1.leftNameTxt_.text = var_186_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_24 = arg_183_1:GetWordFromCfg(910601045)
				local var_186_25 = arg_183_1:FormatText(var_186_24.content)

				arg_183_1.text_.text = var_186_25

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_26 = 21
				local var_186_27 = utf8.len(var_186_25)
				local var_186_28 = var_186_26 <= 0 and var_186_22 or var_186_22 * (var_186_27 / var_186_26)

				if var_186_28 > 0 and var_186_22 < var_186_28 then
					arg_183_1.talkMaxDuration = var_186_28

					if var_186_28 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_28 + var_186_21
					end
				end

				arg_183_1.text_.text = var_186_25
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601045", "story_v_out_910601.awb") ~= 0 then
					local var_186_29 = manager.audio:GetVoiceLength("story_v_out_910601", "910601045", "story_v_out_910601.awb") / 1000

					if var_186_29 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_29 + var_186_21
					end

					if var_186_24.prefab_name ~= "" and arg_183_1.actors_[var_186_24.prefab_name] ~= nil then
						local var_186_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_24.prefab_name].transform, "story_v_out_910601", "910601045", "story_v_out_910601.awb")

						arg_183_1:RecordAudio("910601045", var_186_30)
						arg_183_1:RecordAudio("910601045", var_186_30)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_910601", "910601045", "story_v_out_910601.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_910601", "910601045", "story_v_out_910601.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_31 = math.max(var_186_22, arg_183_1.talkMaxDuration)

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_31 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_21) / var_186_31

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_21 + var_186_31 and arg_183_1.time_ < var_186_21 + var_186_31 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play910601046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 910601046
		arg_187_1.duration_ = 5.3

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play910601047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1084ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1084ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(-0.7, -0.97, -6)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1084ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1084ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1084ui_story == nil then
				arg_187_1.var_.characterEffect1084ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1084ui_story then
					arg_187_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1084ui_story then
				arg_187_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_190_15 = 0
			local var_190_16 = 0.725

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_17 = arg_187_1:FormatText(StoryNameCfg[6].name)

				arg_187_1.leftNameTxt_.text = var_190_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_18 = arg_187_1:GetWordFromCfg(910601046)
				local var_190_19 = arg_187_1:FormatText(var_190_18.content)

				arg_187_1.text_.text = var_190_19

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_20 = 29
				local var_190_21 = utf8.len(var_190_19)
				local var_190_22 = var_190_20 <= 0 and var_190_16 or var_190_16 * (var_190_21 / var_190_20)

				if var_190_22 > 0 and var_190_16 < var_190_22 then
					arg_187_1.talkMaxDuration = var_190_22

					if var_190_22 + var_190_15 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_22 + var_190_15
					end
				end

				arg_187_1.text_.text = var_190_19
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601046", "story_v_out_910601.awb") ~= 0 then
					local var_190_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601046", "story_v_out_910601.awb") / 1000

					if var_190_23 + var_190_15 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_23 + var_190_15
					end

					if var_190_18.prefab_name ~= "" and arg_187_1.actors_[var_190_18.prefab_name] ~= nil then
						local var_190_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_18.prefab_name].transform, "story_v_out_910601", "910601046", "story_v_out_910601.awb")

						arg_187_1:RecordAudio("910601046", var_190_24)
						arg_187_1:RecordAudio("910601046", var_190_24)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_910601", "910601046", "story_v_out_910601.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_910601", "910601046", "story_v_out_910601.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_25 = math.max(var_190_16, arg_187_1.talkMaxDuration)

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_25 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_15) / var_190_25

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_15 + var_190_25 and arg_187_1.time_ < var_190_15 + var_190_25 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play910601047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 910601047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play910601048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1084ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story == nil then
				arg_191_1.var_.characterEffect1084ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1084ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1084ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1084ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.125

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(910601047)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 5
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play910601048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 910601048
		arg_195_1.duration_ = 5.266

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play910601049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1084ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1084ui_story == nil then
				arg_195_1.var_.characterEffect1084ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1084ui_story then
					arg_195_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1084ui_story then
				arg_195_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_198_4 = 0

			if var_198_4 < arg_195_1.time_ and arg_195_1.time_ <= var_198_4 + arg_198_0 then
				arg_195_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_198_5 = 0
			local var_198_6 = 0.65

			if var_198_5 < arg_195_1.time_ and arg_195_1.time_ <= var_198_5 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_7 = arg_195_1:FormatText(StoryNameCfg[6].name)

				arg_195_1.leftNameTxt_.text = var_198_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_8 = arg_195_1:GetWordFromCfg(910601048)
				local var_198_9 = arg_195_1:FormatText(var_198_8.content)

				arg_195_1.text_.text = var_198_9

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_10 = 26
				local var_198_11 = utf8.len(var_198_9)
				local var_198_12 = var_198_10 <= 0 and var_198_6 or var_198_6 * (var_198_11 / var_198_10)

				if var_198_12 > 0 and var_198_6 < var_198_12 then
					arg_195_1.talkMaxDuration = var_198_12

					if var_198_12 + var_198_5 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_12 + var_198_5
					end
				end

				arg_195_1.text_.text = var_198_9
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601048", "story_v_out_910601.awb") ~= 0 then
					local var_198_13 = manager.audio:GetVoiceLength("story_v_out_910601", "910601048", "story_v_out_910601.awb") / 1000

					if var_198_13 + var_198_5 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_13 + var_198_5
					end

					if var_198_8.prefab_name ~= "" and arg_195_1.actors_[var_198_8.prefab_name] ~= nil then
						local var_198_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_8.prefab_name].transform, "story_v_out_910601", "910601048", "story_v_out_910601.awb")

						arg_195_1:RecordAudio("910601048", var_198_14)
						arg_195_1:RecordAudio("910601048", var_198_14)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_910601", "910601048", "story_v_out_910601.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_910601", "910601048", "story_v_out_910601.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_15 = math.max(var_198_6, arg_195_1.talkMaxDuration)

			if var_198_5 <= arg_195_1.time_ and arg_195_1.time_ < var_198_5 + var_198_15 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_5) / var_198_15

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_5 + var_198_15 and arg_195_1.time_ < var_198_5 + var_198_15 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play910601049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 910601049
		arg_199_1.duration_ = 4.233

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play910601050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action426")
			end

			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_202_2 = arg_199_1.actors_["1011ui_story"]
			local var_202_3 = 0

			if var_202_3 < arg_199_1.time_ and arg_199_1.time_ <= var_202_3 + arg_202_0 and arg_199_1.var_.characterEffect1011ui_story == nil then
				arg_199_1.var_.characterEffect1011ui_story = var_202_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_4 = 0.200000002980232

			if var_202_3 <= arg_199_1.time_ and arg_199_1.time_ < var_202_3 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_3) / var_202_4

				if arg_199_1.var_.characterEffect1011ui_story then
					arg_199_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_3 + var_202_4 and arg_199_1.time_ < var_202_3 + var_202_4 + arg_202_0 and arg_199_1.var_.characterEffect1011ui_story then
				arg_199_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_202_6 = arg_199_1.actors_["1084ui_story"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.characterEffect1084ui_story == nil then
				arg_199_1.var_.characterEffect1084ui_story = var_202_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_8 = 0.200000002980232

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.characterEffect1084ui_story then
					local var_202_10 = Mathf.Lerp(0, 0.5, var_202_9)

					arg_199_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1084ui_story.fillRatio = var_202_10
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.characterEffect1084ui_story then
				local var_202_11 = 0.5

				arg_199_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1084ui_story.fillRatio = var_202_11
			end

			local var_202_12 = 0
			local var_202_13 = 0.475

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[37].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(910601049)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 19
				local var_202_18 = utf8.len(var_202_16)
				local var_202_19 = var_202_17 <= 0 and var_202_13 or var_202_13 * (var_202_18 / var_202_17)

				if var_202_19 > 0 and var_202_13 < var_202_19 then
					arg_199_1.talkMaxDuration = var_202_19

					if var_202_19 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_19 + var_202_12
					end
				end

				arg_199_1.text_.text = var_202_16
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601049", "story_v_out_910601.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_910601", "910601049", "story_v_out_910601.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_910601", "910601049", "story_v_out_910601.awb")

						arg_199_1:RecordAudio("910601049", var_202_21)
						arg_199_1:RecordAudio("910601049", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_910601", "910601049", "story_v_out_910601.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_910601", "910601049", "story_v_out_910601.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_13, arg_199_1.talkMaxDuration)

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_12) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_12 + var_202_22 and arg_199_1.time_ < var_202_12 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play910601050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 910601050
		arg_203_1.duration_ = 6.233

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play910601051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1048ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1048ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, -0.8, -6.2)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1048ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["1048ui_story"]
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 and arg_203_1.var_.characterEffect1048ui_story == nil then
				arg_203_1.var_.characterEffect1048ui_story = var_206_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_11 = 0.200000002980232

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11

				if arg_203_1.var_.characterEffect1048ui_story then
					arg_203_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 and arg_203_1.var_.characterEffect1048ui_story then
				arg_203_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action7_1")
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_206_15 = arg_203_1.actors_["1011ui_story"].transform
			local var_206_16 = 0

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 then
				arg_203_1.var_.moveOldPos1011ui_story = var_206_15.localPosition
			end

			local var_206_17 = 0.001

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_17 then
				local var_206_18 = (arg_203_1.time_ - var_206_16) / var_206_17
				local var_206_19 = Vector3.New(0, 100, 0)

				var_206_15.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1011ui_story, var_206_19, var_206_18)

				local var_206_20 = manager.ui.mainCamera.transform.position - var_206_15.position

				var_206_15.forward = Vector3.New(var_206_20.x, var_206_20.y, var_206_20.z)

				local var_206_21 = var_206_15.localEulerAngles

				var_206_21.z = 0
				var_206_21.x = 0
				var_206_15.localEulerAngles = var_206_21
			end

			if arg_203_1.time_ >= var_206_16 + var_206_17 and arg_203_1.time_ < var_206_16 + var_206_17 + arg_206_0 then
				var_206_15.localPosition = Vector3.New(0, 100, 0)

				local var_206_22 = manager.ui.mainCamera.transform.position - var_206_15.position

				var_206_15.forward = Vector3.New(var_206_22.x, var_206_22.y, var_206_22.z)

				local var_206_23 = var_206_15.localEulerAngles

				var_206_23.z = 0
				var_206_23.x = 0
				var_206_15.localEulerAngles = var_206_23
			end

			local var_206_24 = arg_203_1.actors_["1011ui_story"]
			local var_206_25 = 0

			if var_206_25 < arg_203_1.time_ and arg_203_1.time_ <= var_206_25 + arg_206_0 and arg_203_1.var_.characterEffect1011ui_story == nil then
				arg_203_1.var_.characterEffect1011ui_story = var_206_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_26 = 0.200000002980232

			if var_206_25 <= arg_203_1.time_ and arg_203_1.time_ < var_206_25 + var_206_26 then
				local var_206_27 = (arg_203_1.time_ - var_206_25) / var_206_26

				if arg_203_1.var_.characterEffect1011ui_story then
					local var_206_28 = Mathf.Lerp(0, 0.5, var_206_27)

					arg_203_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1011ui_story.fillRatio = var_206_28
				end
			end

			if arg_203_1.time_ >= var_206_25 + var_206_26 and arg_203_1.time_ < var_206_25 + var_206_26 + arg_206_0 and arg_203_1.var_.characterEffect1011ui_story then
				local var_206_29 = 0.5

				arg_203_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1011ui_story.fillRatio = var_206_29
			end

			local var_206_30 = arg_203_1.actors_["1084ui_story"].transform
			local var_206_31 = 0

			if var_206_31 < arg_203_1.time_ and arg_203_1.time_ <= var_206_31 + arg_206_0 then
				arg_203_1.var_.moveOldPos1084ui_story = var_206_30.localPosition
			end

			local var_206_32 = 0.001

			if var_206_31 <= arg_203_1.time_ and arg_203_1.time_ < var_206_31 + var_206_32 then
				local var_206_33 = (arg_203_1.time_ - var_206_31) / var_206_32
				local var_206_34 = Vector3.New(0, 100, 0)

				var_206_30.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1084ui_story, var_206_34, var_206_33)

				local var_206_35 = manager.ui.mainCamera.transform.position - var_206_30.position

				var_206_30.forward = Vector3.New(var_206_35.x, var_206_35.y, var_206_35.z)

				local var_206_36 = var_206_30.localEulerAngles

				var_206_36.z = 0
				var_206_36.x = 0
				var_206_30.localEulerAngles = var_206_36
			end

			if arg_203_1.time_ >= var_206_31 + var_206_32 and arg_203_1.time_ < var_206_31 + var_206_32 + arg_206_0 then
				var_206_30.localPosition = Vector3.New(0, 100, 0)

				local var_206_37 = manager.ui.mainCamera.transform.position - var_206_30.position

				var_206_30.forward = Vector3.New(var_206_37.x, var_206_37.y, var_206_37.z)

				local var_206_38 = var_206_30.localEulerAngles

				var_206_38.z = 0
				var_206_38.x = 0
				var_206_30.localEulerAngles = var_206_38
			end

			local var_206_39 = arg_203_1.actors_["1084ui_story"]
			local var_206_40 = 0

			if var_206_40 < arg_203_1.time_ and arg_203_1.time_ <= var_206_40 + arg_206_0 and arg_203_1.var_.characterEffect1084ui_story == nil then
				arg_203_1.var_.characterEffect1084ui_story = var_206_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_41 = 0.200000002980232

			if var_206_40 <= arg_203_1.time_ and arg_203_1.time_ < var_206_40 + var_206_41 then
				local var_206_42 = (arg_203_1.time_ - var_206_40) / var_206_41

				if arg_203_1.var_.characterEffect1084ui_story then
					local var_206_43 = Mathf.Lerp(0, 0.5, var_206_42)

					arg_203_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1084ui_story.fillRatio = var_206_43
				end
			end

			if arg_203_1.time_ >= var_206_40 + var_206_41 and arg_203_1.time_ < var_206_40 + var_206_41 + arg_206_0 and arg_203_1.var_.characterEffect1084ui_story then
				local var_206_44 = 0.5

				arg_203_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1084ui_story.fillRatio = var_206_44
			end

			local var_206_45 = 0
			local var_206_46 = 0.55

			if var_206_45 < arg_203_1.time_ and arg_203_1.time_ <= var_206_45 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_47 = arg_203_1:FormatText(StoryNameCfg[8].name)

				arg_203_1.leftNameTxt_.text = var_206_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_48 = arg_203_1:GetWordFromCfg(910601050)
				local var_206_49 = arg_203_1:FormatText(var_206_48.content)

				arg_203_1.text_.text = var_206_49

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_50 = 22
				local var_206_51 = utf8.len(var_206_49)
				local var_206_52 = var_206_50 <= 0 and var_206_46 or var_206_46 * (var_206_51 / var_206_50)

				if var_206_52 > 0 and var_206_46 < var_206_52 then
					arg_203_1.talkMaxDuration = var_206_52

					if var_206_52 + var_206_45 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_52 + var_206_45
					end
				end

				arg_203_1.text_.text = var_206_49
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601050", "story_v_out_910601.awb") ~= 0 then
					local var_206_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601050", "story_v_out_910601.awb") / 1000

					if var_206_53 + var_206_45 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_53 + var_206_45
					end

					if var_206_48.prefab_name ~= "" and arg_203_1.actors_[var_206_48.prefab_name] ~= nil then
						local var_206_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_48.prefab_name].transform, "story_v_out_910601", "910601050", "story_v_out_910601.awb")

						arg_203_1:RecordAudio("910601050", var_206_54)
						arg_203_1:RecordAudio("910601050", var_206_54)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_910601", "910601050", "story_v_out_910601.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_910601", "910601050", "story_v_out_910601.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_55 = math.max(var_206_46, arg_203_1.talkMaxDuration)

			if var_206_45 <= arg_203_1.time_ and arg_203_1.time_ < var_206_45 + var_206_55 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_45) / var_206_55

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_45 + var_206_55 and arg_203_1.time_ < var_206_45 + var_206_55 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play910601051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 910601051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play910601052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1048ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1048ui_story == nil then
				arg_207_1.var_.characterEffect1048ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1048ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1048ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1048ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1048ui_story.fillRatio = var_210_5
			end

			local var_210_6 = arg_207_1.actors_["1048ui_story"].transform
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 then
				arg_207_1.var_.moveOldPos1048ui_story = var_210_6.localPosition
			end

			local var_210_8 = 0.001

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8
				local var_210_10 = Vector3.New(0, 100, 0)

				var_210_6.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1048ui_story, var_210_10, var_210_9)

				local var_210_11 = manager.ui.mainCamera.transform.position - var_210_6.position

				var_210_6.forward = Vector3.New(var_210_11.x, var_210_11.y, var_210_11.z)

				local var_210_12 = var_210_6.localEulerAngles

				var_210_12.z = 0
				var_210_12.x = 0
				var_210_6.localEulerAngles = var_210_12
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 then
				var_210_6.localPosition = Vector3.New(0, 100, 0)

				local var_210_13 = manager.ui.mainCamera.transform.position - var_210_6.position

				var_210_6.forward = Vector3.New(var_210_13.x, var_210_13.y, var_210_13.z)

				local var_210_14 = var_210_6.localEulerAngles

				var_210_14.z = 0
				var_210_14.x = 0
				var_210_6.localEulerAngles = var_210_14
			end

			local var_210_15 = 0
			local var_210_16 = 0.525

			if var_210_15 < arg_207_1.time_ and arg_207_1.time_ <= var_210_15 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_17 = arg_207_1:GetWordFromCfg(910601051)
				local var_210_18 = arg_207_1:FormatText(var_210_17.content)

				arg_207_1.text_.text = var_210_18

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_19 = 21
				local var_210_20 = utf8.len(var_210_18)
				local var_210_21 = var_210_19 <= 0 and var_210_16 or var_210_16 * (var_210_20 / var_210_19)

				if var_210_21 > 0 and var_210_16 < var_210_21 then
					arg_207_1.talkMaxDuration = var_210_21

					if var_210_21 + var_210_15 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_21 + var_210_15
					end
				end

				arg_207_1.text_.text = var_210_18
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_22 = math.max(var_210_16, arg_207_1.talkMaxDuration)

			if var_210_15 <= arg_207_1.time_ and arg_207_1.time_ < var_210_15 + var_210_22 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_15) / var_210_22

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_15 + var_210_22 and arg_207_1.time_ < var_210_15 + var_210_22 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play910601052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 910601052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play910601053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[7].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(910601052)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 40
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_8 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_8 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_8

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_8 and arg_211_1.time_ < var_214_0 + var_214_8 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play910601053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 910601053
		arg_215_1.duration_ = 3.3

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play910601054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1028ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1028ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(0, -0.9, -5.9)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1028ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["1028ui_story"]
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 and arg_215_1.var_.characterEffect1028ui_story == nil then
				arg_215_1.var_.characterEffect1028ui_story = var_218_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_11 = 0.2

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11

				if arg_215_1.var_.characterEffect1028ui_story then
					arg_215_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 and arg_215_1.var_.characterEffect1028ui_story then
				arg_215_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_218_13 = 0

			if var_218_13 < arg_215_1.time_ and arg_215_1.time_ <= var_218_13 + arg_218_0 then
				arg_215_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_218_14 = 0

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 then
				arg_215_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_218_15 = 0
			local var_218_16 = 0.4

			if var_218_15 < arg_215_1.time_ and arg_215_1.time_ <= var_218_15 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_17 = arg_215_1:FormatText(StoryNameCfg[327].name)

				arg_215_1.leftNameTxt_.text = var_218_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_18 = arg_215_1:GetWordFromCfg(910601053)
				local var_218_19 = arg_215_1:FormatText(var_218_18.content)

				arg_215_1.text_.text = var_218_19

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_20 = 16
				local var_218_21 = utf8.len(var_218_19)
				local var_218_22 = var_218_20 <= 0 and var_218_16 or var_218_16 * (var_218_21 / var_218_20)

				if var_218_22 > 0 and var_218_16 < var_218_22 then
					arg_215_1.talkMaxDuration = var_218_22

					if var_218_22 + var_218_15 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_22 + var_218_15
					end
				end

				arg_215_1.text_.text = var_218_19
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601053", "story_v_out_910601.awb") ~= 0 then
					local var_218_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601053", "story_v_out_910601.awb") / 1000

					if var_218_23 + var_218_15 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_23 + var_218_15
					end

					if var_218_18.prefab_name ~= "" and arg_215_1.actors_[var_218_18.prefab_name] ~= nil then
						local var_218_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_18.prefab_name].transform, "story_v_out_910601", "910601053", "story_v_out_910601.awb")

						arg_215_1:RecordAudio("910601053", var_218_24)
						arg_215_1:RecordAudio("910601053", var_218_24)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_910601", "910601053", "story_v_out_910601.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_910601", "910601053", "story_v_out_910601.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_25 = math.max(var_218_16, arg_215_1.talkMaxDuration)

			if var_218_15 <= arg_215_1.time_ and arg_215_1.time_ < var_218_15 + var_218_25 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_15) / var_218_25

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_15 + var_218_25 and arg_215_1.time_ < var_218_15 + var_218_25 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play910601054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 910601054
		arg_219_1.duration_ = 4.666

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play910601055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1059ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1059ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(0, -1.05, -6)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1059ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1059ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1059ui_story == nil then
				arg_219_1.var_.characterEffect1059ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1059ui_story then
					arg_219_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect1059ui_story then
				arg_219_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_222_15 = arg_219_1.actors_["1028ui_story"].transform
			local var_222_16 = 0

			if var_222_16 < arg_219_1.time_ and arg_219_1.time_ <= var_222_16 + arg_222_0 then
				arg_219_1.var_.moveOldPos1028ui_story = var_222_15.localPosition
			end

			local var_222_17 = 0.001

			if var_222_16 <= arg_219_1.time_ and arg_219_1.time_ < var_222_16 + var_222_17 then
				local var_222_18 = (arg_219_1.time_ - var_222_16) / var_222_17
				local var_222_19 = Vector3.New(0, 100, 0)

				var_222_15.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1028ui_story, var_222_19, var_222_18)

				local var_222_20 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_20.x, var_222_20.y, var_222_20.z)

				local var_222_21 = var_222_15.localEulerAngles

				var_222_21.z = 0
				var_222_21.x = 0
				var_222_15.localEulerAngles = var_222_21
			end

			if arg_219_1.time_ >= var_222_16 + var_222_17 and arg_219_1.time_ < var_222_16 + var_222_17 + arg_222_0 then
				var_222_15.localPosition = Vector3.New(0, 100, 0)

				local var_222_22 = manager.ui.mainCamera.transform.position - var_222_15.position

				var_222_15.forward = Vector3.New(var_222_22.x, var_222_22.y, var_222_22.z)

				local var_222_23 = var_222_15.localEulerAngles

				var_222_23.z = 0
				var_222_23.x = 0
				var_222_15.localEulerAngles = var_222_23
			end

			local var_222_24 = arg_219_1.actors_["1028ui_story"]
			local var_222_25 = 0

			if var_222_25 < arg_219_1.time_ and arg_219_1.time_ <= var_222_25 + arg_222_0 and arg_219_1.var_.characterEffect1028ui_story == nil then
				arg_219_1.var_.characterEffect1028ui_story = var_222_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_26 = 0.200000002980232

			if var_222_25 <= arg_219_1.time_ and arg_219_1.time_ < var_222_25 + var_222_26 then
				local var_222_27 = (arg_219_1.time_ - var_222_25) / var_222_26

				if arg_219_1.var_.characterEffect1028ui_story then
					local var_222_28 = Mathf.Lerp(0, 0.5, var_222_27)

					arg_219_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1028ui_story.fillRatio = var_222_28
				end
			end

			if arg_219_1.time_ >= var_222_25 + var_222_26 and arg_219_1.time_ < var_222_25 + var_222_26 + arg_222_0 and arg_219_1.var_.characterEffect1028ui_story then
				local var_222_29 = 0.5

				arg_219_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1028ui_story.fillRatio = var_222_29
			end

			local var_222_30 = arg_219_1.actors_["1048ui_story"].transform
			local var_222_31 = 0

			if var_222_31 < arg_219_1.time_ and arg_219_1.time_ <= var_222_31 + arg_222_0 then
				arg_219_1.var_.moveOldPos1048ui_story = var_222_30.localPosition
			end

			local var_222_32 = 0.001

			if var_222_31 <= arg_219_1.time_ and arg_219_1.time_ < var_222_31 + var_222_32 then
				local var_222_33 = (arg_219_1.time_ - var_222_31) / var_222_32
				local var_222_34 = Vector3.New(0, 100, 0)

				var_222_30.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1048ui_story, var_222_34, var_222_33)

				local var_222_35 = manager.ui.mainCamera.transform.position - var_222_30.position

				var_222_30.forward = Vector3.New(var_222_35.x, var_222_35.y, var_222_35.z)

				local var_222_36 = var_222_30.localEulerAngles

				var_222_36.z = 0
				var_222_36.x = 0
				var_222_30.localEulerAngles = var_222_36
			end

			if arg_219_1.time_ >= var_222_31 + var_222_32 and arg_219_1.time_ < var_222_31 + var_222_32 + arg_222_0 then
				var_222_30.localPosition = Vector3.New(0, 100, 0)

				local var_222_37 = manager.ui.mainCamera.transform.position - var_222_30.position

				var_222_30.forward = Vector3.New(var_222_37.x, var_222_37.y, var_222_37.z)

				local var_222_38 = var_222_30.localEulerAngles

				var_222_38.z = 0
				var_222_38.x = 0
				var_222_30.localEulerAngles = var_222_38
			end

			local var_222_39 = arg_219_1.actors_["1048ui_story"]
			local var_222_40 = 0

			if var_222_40 < arg_219_1.time_ and arg_219_1.time_ <= var_222_40 + arg_222_0 and arg_219_1.var_.characterEffect1048ui_story == nil then
				arg_219_1.var_.characterEffect1048ui_story = var_222_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_41 = 0.200000002980232

			if var_222_40 <= arg_219_1.time_ and arg_219_1.time_ < var_222_40 + var_222_41 then
				local var_222_42 = (arg_219_1.time_ - var_222_40) / var_222_41

				if arg_219_1.var_.characterEffect1048ui_story then
					local var_222_43 = Mathf.Lerp(0, 0.5, var_222_42)

					arg_219_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1048ui_story.fillRatio = var_222_43
				end
			end

			if arg_219_1.time_ >= var_222_40 + var_222_41 and arg_219_1.time_ < var_222_40 + var_222_41 + arg_222_0 and arg_219_1.var_.characterEffect1048ui_story then
				local var_222_44 = 0.5

				arg_219_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1048ui_story.fillRatio = var_222_44
			end

			local var_222_45 = 0
			local var_222_46 = 0.45

			if var_222_45 < arg_219_1.time_ and arg_219_1.time_ <= var_222_45 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_47 = arg_219_1:FormatText(StoryNameCfg[28].name)

				arg_219_1.leftNameTxt_.text = var_222_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_48 = arg_219_1:GetWordFromCfg(910601054)
				local var_222_49 = arg_219_1:FormatText(var_222_48.content)

				arg_219_1.text_.text = var_222_49

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_50 = 18
				local var_222_51 = utf8.len(var_222_49)
				local var_222_52 = var_222_50 <= 0 and var_222_46 or var_222_46 * (var_222_51 / var_222_50)

				if var_222_52 > 0 and var_222_46 < var_222_52 then
					arg_219_1.talkMaxDuration = var_222_52

					if var_222_52 + var_222_45 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_52 + var_222_45
					end
				end

				arg_219_1.text_.text = var_222_49
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601054", "story_v_out_910601.awb") ~= 0 then
					local var_222_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601054", "story_v_out_910601.awb") / 1000

					if var_222_53 + var_222_45 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_53 + var_222_45
					end

					if var_222_48.prefab_name ~= "" and arg_219_1.actors_[var_222_48.prefab_name] ~= nil then
						local var_222_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_48.prefab_name].transform, "story_v_out_910601", "910601054", "story_v_out_910601.awb")

						arg_219_1:RecordAudio("910601054", var_222_54)
						arg_219_1:RecordAudio("910601054", var_222_54)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_910601", "910601054", "story_v_out_910601.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_910601", "910601054", "story_v_out_910601.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_55 = math.max(var_222_46, arg_219_1.talkMaxDuration)

			if var_222_45 <= arg_219_1.time_ and arg_219_1.time_ < var_222_45 + var_222_55 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_45) / var_222_55

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_45 + var_222_55 and arg_219_1.time_ < var_222_45 + var_222_55 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play910601055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 910601055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play910601056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1059ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1059ui_story == nil then
				arg_223_1.var_.characterEffect1059ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1059ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1059ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1059ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1059ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.375

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[7].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(910601055)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 15
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
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_14 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_14 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_14

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_14 and arg_223_1.time_ < var_226_6 + var_226_14 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play910601056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 910601056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play910601057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1059ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1059ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, 100, 0)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1059ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, 100, 0)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = 0
			local var_230_10 = 1.075

			if var_230_9 < arg_227_1.time_ and arg_227_1.time_ <= var_230_9 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_11 = arg_227_1:FormatText(StoryNameCfg[7].name)

				arg_227_1.leftNameTxt_.text = var_230_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_12 = arg_227_1:GetWordFromCfg(910601056)
				local var_230_13 = arg_227_1:FormatText(var_230_12.content)

				arg_227_1.text_.text = var_230_13

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_14 = 43
				local var_230_15 = utf8.len(var_230_13)
				local var_230_16 = var_230_14 <= 0 and var_230_10 or var_230_10 * (var_230_15 / var_230_14)

				if var_230_16 > 0 and var_230_10 < var_230_16 then
					arg_227_1.talkMaxDuration = var_230_16

					if var_230_16 + var_230_9 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_16 + var_230_9
					end
				end

				arg_227_1.text_.text = var_230_13
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_17 = math.max(var_230_10, arg_227_1.talkMaxDuration)

			if var_230_9 <= arg_227_1.time_ and arg_227_1.time_ < var_230_9 + var_230_17 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_9) / var_230_17

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_9 + var_230_17 and arg_227_1.time_ < var_230_9 + var_230_17 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play910601057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 910601057
		arg_231_1.duration_ = 5.733

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play910601058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1048ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1048ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, -0.8, -6.2)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1048ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1048ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1048ui_story == nil then
				arg_231_1.var_.characterEffect1048ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1048ui_story then
					arg_231_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1048ui_story then
				arg_231_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_234_13 = 0

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_234_15 = 0
			local var_234_16 = 0.6

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_17 = arg_231_1:FormatText(StoryNameCfg[8].name)

				arg_231_1.leftNameTxt_.text = var_234_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_18 = arg_231_1:GetWordFromCfg(910601057)
				local var_234_19 = arg_231_1:FormatText(var_234_18.content)

				arg_231_1.text_.text = var_234_19

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_20 = 24
				local var_234_21 = utf8.len(var_234_19)
				local var_234_22 = var_234_20 <= 0 and var_234_16 or var_234_16 * (var_234_21 / var_234_20)

				if var_234_22 > 0 and var_234_16 < var_234_22 then
					arg_231_1.talkMaxDuration = var_234_22

					if var_234_22 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_22 + var_234_15
					end
				end

				arg_231_1.text_.text = var_234_19
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601057", "story_v_out_910601.awb") ~= 0 then
					local var_234_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601057", "story_v_out_910601.awb") / 1000

					if var_234_23 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_23 + var_234_15
					end

					if var_234_18.prefab_name ~= "" and arg_231_1.actors_[var_234_18.prefab_name] ~= nil then
						local var_234_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_18.prefab_name].transform, "story_v_out_910601", "910601057", "story_v_out_910601.awb")

						arg_231_1:RecordAudio("910601057", var_234_24)
						arg_231_1:RecordAudio("910601057", var_234_24)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_910601", "910601057", "story_v_out_910601.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_910601", "910601057", "story_v_out_910601.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_25 = math.max(var_234_16, arg_231_1.talkMaxDuration)

			if var_234_15 <= arg_231_1.time_ and arg_231_1.time_ < var_234_15 + var_234_25 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_15) / var_234_25

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_15 + var_234_25 and arg_231_1.time_ < var_234_15 + var_234_25 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play910601058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 910601058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play910601059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1048ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1048ui_story == nil then
				arg_235_1.var_.characterEffect1048ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1048ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1048ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1048ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1048ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 0.4

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_8 = arg_235_1:GetWordFromCfg(910601058)
				local var_238_9 = arg_235_1:FormatText(var_238_8.content)

				arg_235_1.text_.text = var_238_9

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_10 = 16
				local var_238_11 = utf8.len(var_238_9)
				local var_238_12 = var_238_10 <= 0 and var_238_7 or var_238_7 * (var_238_11 / var_238_10)

				if var_238_12 > 0 and var_238_7 < var_238_12 then
					arg_235_1.talkMaxDuration = var_238_12

					if var_238_12 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_12 + var_238_6
					end
				end

				arg_235_1.text_.text = var_238_9
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_13 = math.max(var_238_7, arg_235_1.talkMaxDuration)

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_13 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_6) / var_238_13

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_6 + var_238_13 and arg_235_1.time_ < var_238_6 + var_238_13 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play910601059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 910601059
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play910601060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.275

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(910601059)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 11
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_8 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_8 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_8

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_8 and arg_239_1.time_ < var_242_0 + var_242_8 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play910601060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 910601060
		arg_243_1.duration_ = 7.733

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play910601061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1048ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1048ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(0, -0.8, -6.2)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1048ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["1048ui_story"]
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 and arg_243_1.var_.characterEffect1048ui_story == nil then
				arg_243_1.var_.characterEffect1048ui_story = var_246_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_11 = 0.200000002980232

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11

				if arg_243_1.var_.characterEffect1048ui_story then
					arg_243_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 and arg_243_1.var_.characterEffect1048ui_story then
				arg_243_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_246_13 = 0

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_246_14 = 0
			local var_246_15 = 0.95

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_16 = arg_243_1:FormatText(StoryNameCfg[8].name)

				arg_243_1.leftNameTxt_.text = var_246_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_17 = arg_243_1:GetWordFromCfg(910601060)
				local var_246_18 = arg_243_1:FormatText(var_246_17.content)

				arg_243_1.text_.text = var_246_18

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_19 = 38
				local var_246_20 = utf8.len(var_246_18)
				local var_246_21 = var_246_19 <= 0 and var_246_15 or var_246_15 * (var_246_20 / var_246_19)

				if var_246_21 > 0 and var_246_15 < var_246_21 then
					arg_243_1.talkMaxDuration = var_246_21

					if var_246_21 + var_246_14 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_21 + var_246_14
					end
				end

				arg_243_1.text_.text = var_246_18
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601060", "story_v_out_910601.awb") ~= 0 then
					local var_246_22 = manager.audio:GetVoiceLength("story_v_out_910601", "910601060", "story_v_out_910601.awb") / 1000

					if var_246_22 + var_246_14 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_22 + var_246_14
					end

					if var_246_17.prefab_name ~= "" and arg_243_1.actors_[var_246_17.prefab_name] ~= nil then
						local var_246_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_17.prefab_name].transform, "story_v_out_910601", "910601060", "story_v_out_910601.awb")

						arg_243_1:RecordAudio("910601060", var_246_23)
						arg_243_1:RecordAudio("910601060", var_246_23)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_910601", "910601060", "story_v_out_910601.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_910601", "910601060", "story_v_out_910601.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_24 = math.max(var_246_15, arg_243_1.talkMaxDuration)

			if var_246_14 <= arg_243_1.time_ and arg_243_1.time_ < var_246_14 + var_246_24 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_14) / var_246_24

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_14 + var_246_24 and arg_243_1.time_ < var_246_14 + var_246_24 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play910601061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 910601061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play910601062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1048ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1048ui_story == nil then
				arg_247_1.var_.characterEffect1048ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1048ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1048ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1048ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1048ui_story.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 0.55

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_8 = arg_247_1:GetWordFromCfg(910601061)
				local var_250_9 = arg_247_1:FormatText(var_250_8.content)

				arg_247_1.text_.text = var_250_9

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_10 = 22
				local var_250_11 = utf8.len(var_250_9)
				local var_250_12 = var_250_10 <= 0 and var_250_7 or var_250_7 * (var_250_11 / var_250_10)

				if var_250_12 > 0 and var_250_7 < var_250_12 then
					arg_247_1.talkMaxDuration = var_250_12

					if var_250_12 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_9
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_13 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_13 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_13

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_13 and arg_247_1.time_ < var_250_6 + var_250_13 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play910601062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 910601062
		arg_251_1.duration_ = 2.466

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play910601063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1048ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1048ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0, -0.8, -6.2)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1048ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1048ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.characterEffect1048ui_story == nil then
				arg_251_1.var_.characterEffect1048ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect1048ui_story then
					arg_251_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect1048ui_story then
				arg_251_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action453")
			end

			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				arg_251_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_254_15 = 0
			local var_254_16 = 0.275

			if var_254_15 < arg_251_1.time_ and arg_251_1.time_ <= var_254_15 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_17 = arg_251_1:FormatText(StoryNameCfg[8].name)

				arg_251_1.leftNameTxt_.text = var_254_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_18 = arg_251_1:GetWordFromCfg(910601062)
				local var_254_19 = arg_251_1:FormatText(var_254_18.content)

				arg_251_1.text_.text = var_254_19

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_20 = 11
				local var_254_21 = utf8.len(var_254_19)
				local var_254_22 = var_254_20 <= 0 and var_254_16 or var_254_16 * (var_254_21 / var_254_20)

				if var_254_22 > 0 and var_254_16 < var_254_22 then
					arg_251_1.talkMaxDuration = var_254_22

					if var_254_22 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_22 + var_254_15
					end
				end

				arg_251_1.text_.text = var_254_19
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601062", "story_v_out_910601.awb") ~= 0 then
					local var_254_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601062", "story_v_out_910601.awb") / 1000

					if var_254_23 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_23 + var_254_15
					end

					if var_254_18.prefab_name ~= "" and arg_251_1.actors_[var_254_18.prefab_name] ~= nil then
						local var_254_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_18.prefab_name].transform, "story_v_out_910601", "910601062", "story_v_out_910601.awb")

						arg_251_1:RecordAudio("910601062", var_254_24)
						arg_251_1:RecordAudio("910601062", var_254_24)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_910601", "910601062", "story_v_out_910601.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_910601", "910601062", "story_v_out_910601.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_25 = math.max(var_254_16, arg_251_1.talkMaxDuration)

			if var_254_15 <= arg_251_1.time_ and arg_251_1.time_ < var_254_15 + var_254_25 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_15) / var_254_25

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_15 + var_254_25 and arg_251_1.time_ < var_254_15 + var_254_25 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play910601063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 910601063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play910601064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1048ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1048ui_story == nil then
				arg_255_1.var_.characterEffect1048ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1048ui_story then
					local var_258_4 = Mathf.Lerp(0, 0.5, var_258_3)

					arg_255_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1048ui_story.fillRatio = var_258_4
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1048ui_story then
				local var_258_5 = 0.5

				arg_255_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1048ui_story.fillRatio = var_258_5
			end

			local var_258_6 = 0
			local var_258_7 = 0.05

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_8 = arg_255_1:FormatText(StoryNameCfg[7].name)

				arg_255_1.leftNameTxt_.text = var_258_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(910601063)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 2
				local var_258_12 = utf8.len(var_258_10)
				local var_258_13 = var_258_11 <= 0 and var_258_7 or var_258_7 * (var_258_12 / var_258_11)

				if var_258_13 > 0 and var_258_7 < var_258_13 then
					arg_255_1.talkMaxDuration = var_258_13

					if var_258_13 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_6
					end
				end

				arg_255_1.text_.text = var_258_10
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_14 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_14 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_14

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_14 and arg_255_1.time_ < var_258_6 + var_258_14 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play910601064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 910601064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play910601065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.4

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[7].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(910601064)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 16
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_8 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_8 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_8

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_8 and arg_259_1.time_ < var_262_0 + var_262_8 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play910601065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 910601065
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play910601066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.725

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_2 = arg_263_1:GetWordFromCfg(910601065)
				local var_266_3 = arg_263_1:FormatText(var_266_2.content)

				arg_263_1.text_.text = var_266_3

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_4 = 29
				local var_266_5 = utf8.len(var_266_3)
				local var_266_6 = var_266_4 <= 0 and var_266_1 or var_266_1 * (var_266_5 / var_266_4)

				if var_266_6 > 0 and var_266_1 < var_266_6 then
					arg_263_1.talkMaxDuration = var_266_6

					if var_266_6 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_6 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_3
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_7 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_7 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_7

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_7 and arg_263_1.time_ < var_266_0 + var_266_7 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play910601066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 910601066
		arg_267_1.duration_ = 6.8

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play910601067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1028ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1028ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0.7, -0.9, -5.9)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1028ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = arg_267_1.actors_["1028ui_story"]
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 and arg_267_1.var_.characterEffect1028ui_story == nil then
				arg_267_1.var_.characterEffect1028ui_story = var_270_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_11 = 0.200000002980232

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11

				if arg_267_1.var_.characterEffect1028ui_story then
					arg_267_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 and arg_267_1.var_.characterEffect1028ui_story then
				arg_267_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_270_13 = 0

			if var_270_13 < arg_267_1.time_ and arg_267_1.time_ <= var_270_13 + arg_270_0 then
				arg_267_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				arg_267_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_270_15 = arg_267_1.actors_["1048ui_story"].transform
			local var_270_16 = 0

			if var_270_16 < arg_267_1.time_ and arg_267_1.time_ <= var_270_16 + arg_270_0 then
				arg_267_1.var_.moveOldPos1048ui_story = var_270_15.localPosition
			end

			local var_270_17 = 0.001

			if var_270_16 <= arg_267_1.time_ and arg_267_1.time_ < var_270_16 + var_270_17 then
				local var_270_18 = (arg_267_1.time_ - var_270_16) / var_270_17
				local var_270_19 = Vector3.New(-0.7, -0.8, -6.2)

				var_270_15.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1048ui_story, var_270_19, var_270_18)

				local var_270_20 = manager.ui.mainCamera.transform.position - var_270_15.position

				var_270_15.forward = Vector3.New(var_270_20.x, var_270_20.y, var_270_20.z)

				local var_270_21 = var_270_15.localEulerAngles

				var_270_21.z = 0
				var_270_21.x = 0
				var_270_15.localEulerAngles = var_270_21
			end

			if arg_267_1.time_ >= var_270_16 + var_270_17 and arg_267_1.time_ < var_270_16 + var_270_17 + arg_270_0 then
				var_270_15.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_270_22 = manager.ui.mainCamera.transform.position - var_270_15.position

				var_270_15.forward = Vector3.New(var_270_22.x, var_270_22.y, var_270_22.z)

				local var_270_23 = var_270_15.localEulerAngles

				var_270_23.z = 0
				var_270_23.x = 0
				var_270_15.localEulerAngles = var_270_23
			end

			local var_270_24 = arg_267_1.actors_["1048ui_story"]
			local var_270_25 = 0

			if var_270_25 < arg_267_1.time_ and arg_267_1.time_ <= var_270_25 + arg_270_0 and arg_267_1.var_.characterEffect1048ui_story == nil then
				arg_267_1.var_.characterEffect1048ui_story = var_270_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_26 = 0.200000002980232

			if var_270_25 <= arg_267_1.time_ and arg_267_1.time_ < var_270_25 + var_270_26 then
				local var_270_27 = (arg_267_1.time_ - var_270_25) / var_270_26

				if arg_267_1.var_.characterEffect1048ui_story then
					local var_270_28 = Mathf.Lerp(0, 0.5, var_270_27)

					arg_267_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1048ui_story.fillRatio = var_270_28
				end
			end

			if arg_267_1.time_ >= var_270_25 + var_270_26 and arg_267_1.time_ < var_270_25 + var_270_26 + arg_270_0 and arg_267_1.var_.characterEffect1048ui_story then
				local var_270_29 = 0.5

				arg_267_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1048ui_story.fillRatio = var_270_29
			end

			local var_270_30 = 0

			if var_270_30 < arg_267_1.time_ and arg_267_1.time_ <= var_270_30 + arg_270_0 then
				arg_267_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_2")
			end

			local var_270_31 = 0
			local var_270_32 = 0.625

			if var_270_31 < arg_267_1.time_ and arg_267_1.time_ <= var_270_31 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_33 = arg_267_1:FormatText(StoryNameCfg[327].name)

				arg_267_1.leftNameTxt_.text = var_270_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_34 = arg_267_1:GetWordFromCfg(910601066)
				local var_270_35 = arg_267_1:FormatText(var_270_34.content)

				arg_267_1.text_.text = var_270_35

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_36 = 25
				local var_270_37 = utf8.len(var_270_35)
				local var_270_38 = var_270_36 <= 0 and var_270_32 or var_270_32 * (var_270_37 / var_270_36)

				if var_270_38 > 0 and var_270_32 < var_270_38 then
					arg_267_1.talkMaxDuration = var_270_38

					if var_270_38 + var_270_31 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_38 + var_270_31
					end
				end

				arg_267_1.text_.text = var_270_35
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601066", "story_v_out_910601.awb") ~= 0 then
					local var_270_39 = manager.audio:GetVoiceLength("story_v_out_910601", "910601066", "story_v_out_910601.awb") / 1000

					if var_270_39 + var_270_31 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_39 + var_270_31
					end

					if var_270_34.prefab_name ~= "" and arg_267_1.actors_[var_270_34.prefab_name] ~= nil then
						local var_270_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_34.prefab_name].transform, "story_v_out_910601", "910601066", "story_v_out_910601.awb")

						arg_267_1:RecordAudio("910601066", var_270_40)
						arg_267_1:RecordAudio("910601066", var_270_40)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_910601", "910601066", "story_v_out_910601.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_910601", "910601066", "story_v_out_910601.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_41 = math.max(var_270_32, arg_267_1.talkMaxDuration)

			if var_270_31 <= arg_267_1.time_ and arg_267_1.time_ < var_270_31 + var_270_41 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_31) / var_270_41

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_31 + var_270_41 and arg_267_1.time_ < var_270_31 + var_270_41 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play910601067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 910601067
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play910601068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1028ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1028ui_story == nil then
				arg_271_1.var_.characterEffect1028ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.200000002980232

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1028ui_story then
					local var_274_4 = Mathf.Lerp(0, 0.5, var_274_3)

					arg_271_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1028ui_story.fillRatio = var_274_4
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1028ui_story then
				local var_274_5 = 0.5

				arg_271_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1028ui_story.fillRatio = var_274_5
			end

			local var_274_6 = 0
			local var_274_7 = 1.325

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_8 = arg_271_1:GetWordFromCfg(910601067)
				local var_274_9 = arg_271_1:FormatText(var_274_8.content)

				arg_271_1.text_.text = var_274_9

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_10 = 53
				local var_274_11 = utf8.len(var_274_9)
				local var_274_12 = var_274_10 <= 0 and var_274_7 or var_274_7 * (var_274_11 / var_274_10)

				if var_274_12 > 0 and var_274_7 < var_274_12 then
					arg_271_1.talkMaxDuration = var_274_12

					if var_274_12 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_12 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_9
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_13 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_13 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_13

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_13 and arg_271_1.time_ < var_274_6 + var_274_13 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play910601068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 910601068
		arg_275_1.duration_ = 0.999999999999

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"

			SetActive(arg_275_1.choicesGo_, true)

			for iter_276_0, iter_276_1 in ipairs(arg_275_1.choices_) do
				local var_276_0 = iter_276_0 <= 2

				SetActive(iter_276_1.go, var_276_0)
			end

			arg_275_1.choices_[1].txt.text = arg_275_1:FormatText(StoryChoiceCfg[692].name)
			arg_275_1.choices_[2].txt.text = arg_275_1:FormatText(StoryChoiceCfg[693].name)
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play910601069(arg_275_1)
			end

			if arg_277_0 == 2 then
				arg_275_0:Play910601072(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.allBtn_.enabled = false
			end

			local var_278_1 = 0.5

			if arg_275_1.time_ >= var_278_0 + var_278_1 and arg_275_1.time_ < var_278_0 + var_278_1 + arg_278_0 then
				arg_275_1.allBtn_.enabled = true
			end

			local var_278_2 = arg_275_1.actors_["1028ui_story"].transform
			local var_278_3 = 0

			if var_278_3 < arg_275_1.time_ and arg_275_1.time_ <= var_278_3 + arg_278_0 then
				arg_275_1.var_.moveOldPos1028ui_story = var_278_2.localPosition
			end

			local var_278_4 = 0.001

			if var_278_3 <= arg_275_1.time_ and arg_275_1.time_ < var_278_3 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_3) / var_278_4
				local var_278_6 = Vector3.New(0, 100, 0)

				var_278_2.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1028ui_story, var_278_6, var_278_5)

				local var_278_7 = manager.ui.mainCamera.transform.position - var_278_2.position

				var_278_2.forward = Vector3.New(var_278_7.x, var_278_7.y, var_278_7.z)

				local var_278_8 = var_278_2.localEulerAngles

				var_278_8.z = 0
				var_278_8.x = 0
				var_278_2.localEulerAngles = var_278_8
			end

			if arg_275_1.time_ >= var_278_3 + var_278_4 and arg_275_1.time_ < var_278_3 + var_278_4 + arg_278_0 then
				var_278_2.localPosition = Vector3.New(0, 100, 0)

				local var_278_9 = manager.ui.mainCamera.transform.position - var_278_2.position

				var_278_2.forward = Vector3.New(var_278_9.x, var_278_9.y, var_278_9.z)

				local var_278_10 = var_278_2.localEulerAngles

				var_278_10.z = 0
				var_278_10.x = 0
				var_278_2.localEulerAngles = var_278_10
			end

			local var_278_11 = arg_275_1.actors_["1048ui_story"].transform
			local var_278_12 = 0

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.var_.moveOldPos1048ui_story = var_278_11.localPosition
			end

			local var_278_13 = 0.001

			if var_278_12 <= arg_275_1.time_ and arg_275_1.time_ < var_278_12 + var_278_13 then
				local var_278_14 = (arg_275_1.time_ - var_278_12) / var_278_13
				local var_278_15 = Vector3.New(0, 100, 0)

				var_278_11.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1048ui_story, var_278_15, var_278_14)

				local var_278_16 = manager.ui.mainCamera.transform.position - var_278_11.position

				var_278_11.forward = Vector3.New(var_278_16.x, var_278_16.y, var_278_16.z)

				local var_278_17 = var_278_11.localEulerAngles

				var_278_17.z = 0
				var_278_17.x = 0
				var_278_11.localEulerAngles = var_278_17
			end

			if arg_275_1.time_ >= var_278_12 + var_278_13 and arg_275_1.time_ < var_278_12 + var_278_13 + arg_278_0 then
				var_278_11.localPosition = Vector3.New(0, 100, 0)

				local var_278_18 = manager.ui.mainCamera.transform.position - var_278_11.position

				var_278_11.forward = Vector3.New(var_278_18.x, var_278_18.y, var_278_18.z)

				local var_278_19 = var_278_11.localEulerAngles

				var_278_19.z = 0
				var_278_19.x = 0
				var_278_11.localEulerAngles = var_278_19
			end
		end
	end,
	Play910601069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 910601069
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play910601070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.25

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[7].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(910601069)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 10
				local var_282_6 = utf8.len(var_282_4)
				local var_282_7 = var_282_5 <= 0 and var_282_1 or var_282_1 * (var_282_6 / var_282_5)

				if var_282_7 > 0 and var_282_1 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_4
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_8 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_8 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_8

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_8 and arg_279_1.time_ < var_282_0 + var_282_8 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play910601070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 910601070
		arg_283_1.duration_ = 4.466

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play910601071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1048ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1048ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(-0.7, -0.8, -6.2)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1048ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = arg_283_1.actors_["1048ui_story"]
			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 and arg_283_1.var_.characterEffect1048ui_story == nil then
				arg_283_1.var_.characterEffect1048ui_story = var_286_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_11 = 0.200000002980232

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_11 then
				local var_286_12 = (arg_283_1.time_ - var_286_10) / var_286_11

				if arg_283_1.var_.characterEffect1048ui_story then
					arg_283_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_10 + var_286_11 and arg_283_1.time_ < var_286_10 + var_286_11 + arg_286_0 and arg_283_1.var_.characterEffect1048ui_story then
				arg_283_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_286_13 = 0

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action4_1")
			end

			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 then
				arg_283_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_286_15 = 0
			local var_286_16 = 0.45

			if var_286_15 < arg_283_1.time_ and arg_283_1.time_ <= var_286_15 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_17 = arg_283_1:FormatText(StoryNameCfg[8].name)

				arg_283_1.leftNameTxt_.text = var_286_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_18 = arg_283_1:GetWordFromCfg(910601070)
				local var_286_19 = arg_283_1:FormatText(var_286_18.content)

				arg_283_1.text_.text = var_286_19

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_20 = 18
				local var_286_21 = utf8.len(var_286_19)
				local var_286_22 = var_286_20 <= 0 and var_286_16 or var_286_16 * (var_286_21 / var_286_20)

				if var_286_22 > 0 and var_286_16 < var_286_22 then
					arg_283_1.talkMaxDuration = var_286_22

					if var_286_22 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_22 + var_286_15
					end
				end

				arg_283_1.text_.text = var_286_19
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601070", "story_v_out_910601.awb") ~= 0 then
					local var_286_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601070", "story_v_out_910601.awb") / 1000

					if var_286_23 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_23 + var_286_15
					end

					if var_286_18.prefab_name ~= "" and arg_283_1.actors_[var_286_18.prefab_name] ~= nil then
						local var_286_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_18.prefab_name].transform, "story_v_out_910601", "910601070", "story_v_out_910601.awb")

						arg_283_1:RecordAudio("910601070", var_286_24)
						arg_283_1:RecordAudio("910601070", var_286_24)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_910601", "910601070", "story_v_out_910601.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_910601", "910601070", "story_v_out_910601.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_25 = math.max(var_286_16, arg_283_1.talkMaxDuration)

			if var_286_15 <= arg_283_1.time_ and arg_283_1.time_ < var_286_15 + var_286_25 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_15) / var_286_25

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_15 + var_286_25 and arg_283_1.time_ < var_286_15 + var_286_25 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play910601071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 910601071
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play910601075(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1048ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1048ui_story == nil then
				arg_287_1.var_.characterEffect1048ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.200000002980232

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1048ui_story then
					local var_290_4 = Mathf.Lerp(0, 0.5, var_290_3)

					arg_287_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1048ui_story.fillRatio = var_290_4
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1048ui_story then
				local var_290_5 = 0.5

				arg_287_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1048ui_story.fillRatio = var_290_5
			end

			local var_290_6 = 0
			local var_290_7 = 0.5

			if var_290_6 < arg_287_1.time_ and arg_287_1.time_ <= var_290_6 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_8 = arg_287_1:FormatText(StoryNameCfg[7].name)

				arg_287_1.leftNameTxt_.text = var_290_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_9 = arg_287_1:GetWordFromCfg(910601071)
				local var_290_10 = arg_287_1:FormatText(var_290_9.content)

				arg_287_1.text_.text = var_290_10

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_11 = 20
				local var_290_12 = utf8.len(var_290_10)
				local var_290_13 = var_290_11 <= 0 and var_290_7 or var_290_7 * (var_290_12 / var_290_11)

				if var_290_13 > 0 and var_290_7 < var_290_13 then
					arg_287_1.talkMaxDuration = var_290_13

					if var_290_13 + var_290_6 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_13 + var_290_6
					end
				end

				arg_287_1.text_.text = var_290_10
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_14 = math.max(var_290_7, arg_287_1.talkMaxDuration)

			if var_290_6 <= arg_287_1.time_ and arg_287_1.time_ < var_290_6 + var_290_14 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_6) / var_290_14

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_6 + var_290_14 and arg_287_1.time_ < var_290_6 + var_290_14 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play910601075 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 910601075
		arg_291_1.duration_ = 2.333

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play910601076(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1028ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1028ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0.7, -0.9, -5.9)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1028ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1028ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1028ui_story == nil then
				arg_291_1.var_.characterEffect1028ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1028ui_story then
					arg_291_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1028ui_story then
				arg_291_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_294_13 = 0

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_294_15 = 0
			local var_294_16 = 0.2

			if var_294_15 < arg_291_1.time_ and arg_291_1.time_ <= var_294_15 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_17 = arg_291_1:FormatText(StoryNameCfg[327].name)

				arg_291_1.leftNameTxt_.text = var_294_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_18 = arg_291_1:GetWordFromCfg(910601075)
				local var_294_19 = arg_291_1:FormatText(var_294_18.content)

				arg_291_1.text_.text = var_294_19

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_20 = 8
				local var_294_21 = utf8.len(var_294_19)
				local var_294_22 = var_294_20 <= 0 and var_294_16 or var_294_16 * (var_294_21 / var_294_20)

				if var_294_22 > 0 and var_294_16 < var_294_22 then
					arg_291_1.talkMaxDuration = var_294_22

					if var_294_22 + var_294_15 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_22 + var_294_15
					end
				end

				arg_291_1.text_.text = var_294_19
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601075", "story_v_out_910601.awb") ~= 0 then
					local var_294_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601075", "story_v_out_910601.awb") / 1000

					if var_294_23 + var_294_15 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_23 + var_294_15
					end

					if var_294_18.prefab_name ~= "" and arg_291_1.actors_[var_294_18.prefab_name] ~= nil then
						local var_294_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_18.prefab_name].transform, "story_v_out_910601", "910601075", "story_v_out_910601.awb")

						arg_291_1:RecordAudio("910601075", var_294_24)
						arg_291_1:RecordAudio("910601075", var_294_24)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_910601", "910601075", "story_v_out_910601.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_910601", "910601075", "story_v_out_910601.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_25 = math.max(var_294_16, arg_291_1.talkMaxDuration)

			if var_294_15 <= arg_291_1.time_ and arg_291_1.time_ < var_294_15 + var_294_25 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_15) / var_294_25

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_15 + var_294_25 and arg_291_1.time_ < var_294_15 + var_294_25 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play910601076 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 910601076
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play910601077(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1028ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1028ui_story == nil then
				arg_295_1.var_.characterEffect1028ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1028ui_story then
					local var_298_4 = Mathf.Lerp(0, 0.5, var_298_3)

					arg_295_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1028ui_story.fillRatio = var_298_4
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1028ui_story then
				local var_298_5 = 0.5

				arg_295_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1028ui_story.fillRatio = var_298_5
			end

			local var_298_6 = arg_295_1.actors_["1048ui_story"].transform
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 then
				arg_295_1.var_.moveOldPos1048ui_story = var_298_6.localPosition
			end

			local var_298_8 = 0.001

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8
				local var_298_10 = Vector3.New(0, 100, 0)

				var_298_6.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1048ui_story, var_298_10, var_298_9)

				local var_298_11 = manager.ui.mainCamera.transform.position - var_298_6.position

				var_298_6.forward = Vector3.New(var_298_11.x, var_298_11.y, var_298_11.z)

				local var_298_12 = var_298_6.localEulerAngles

				var_298_12.z = 0
				var_298_12.x = 0
				var_298_6.localEulerAngles = var_298_12
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 then
				var_298_6.localPosition = Vector3.New(0, 100, 0)

				local var_298_13 = manager.ui.mainCamera.transform.position - var_298_6.position

				var_298_6.forward = Vector3.New(var_298_13.x, var_298_13.y, var_298_13.z)

				local var_298_14 = var_298_6.localEulerAngles

				var_298_14.z = 0
				var_298_14.x = 0
				var_298_6.localEulerAngles = var_298_14
			end

			local var_298_15 = arg_295_1.actors_["1028ui_story"].transform
			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 then
				arg_295_1.var_.moveOldPos1028ui_story = var_298_15.localPosition
			end

			local var_298_17 = 0.001

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17
				local var_298_19 = Vector3.New(0, 100, 0)

				var_298_15.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1028ui_story, var_298_19, var_298_18)

				local var_298_20 = manager.ui.mainCamera.transform.position - var_298_15.position

				var_298_15.forward = Vector3.New(var_298_20.x, var_298_20.y, var_298_20.z)

				local var_298_21 = var_298_15.localEulerAngles

				var_298_21.z = 0
				var_298_21.x = 0
				var_298_15.localEulerAngles = var_298_21
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 then
				var_298_15.localPosition = Vector3.New(0, 100, 0)

				local var_298_22 = manager.ui.mainCamera.transform.position - var_298_15.position

				var_298_15.forward = Vector3.New(var_298_22.x, var_298_22.y, var_298_22.z)

				local var_298_23 = var_298_15.localEulerAngles

				var_298_23.z = 0
				var_298_23.x = 0
				var_298_15.localEulerAngles = var_298_23
			end

			local var_298_24 = 0
			local var_298_25 = 0.725

			if var_298_24 < arg_295_1.time_ and arg_295_1.time_ <= var_298_24 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_26 = arg_295_1:GetWordFromCfg(910601076)
				local var_298_27 = arg_295_1:FormatText(var_298_26.content)

				arg_295_1.text_.text = var_298_27

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_28 = 29
				local var_298_29 = utf8.len(var_298_27)
				local var_298_30 = var_298_28 <= 0 and var_298_25 or var_298_25 * (var_298_29 / var_298_28)

				if var_298_30 > 0 and var_298_25 < var_298_30 then
					arg_295_1.talkMaxDuration = var_298_30

					if var_298_30 + var_298_24 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_30 + var_298_24
					end
				end

				arg_295_1.text_.text = var_298_27
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_31 = math.max(var_298_25, arg_295_1.talkMaxDuration)

			if var_298_24 <= arg_295_1.time_ and arg_295_1.time_ < var_298_24 + var_298_31 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_24) / var_298_31

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_24 + var_298_31 and arg_295_1.time_ < var_298_24 + var_298_31 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play910601077 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 910601077
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play910601078(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.375

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[7].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(910601077)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 15
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_8 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_8 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_8

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_8 and arg_299_1.time_ < var_302_0 + var_302_8 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play910601078 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 910601078
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play910601079(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.7

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_2 = arg_303_1:GetWordFromCfg(910601078)
				local var_306_3 = arg_303_1:FormatText(var_306_2.content)

				arg_303_1.text_.text = var_306_3

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_4 = 28
				local var_306_5 = utf8.len(var_306_3)
				local var_306_6 = var_306_4 <= 0 and var_306_1 or var_306_1 * (var_306_5 / var_306_4)

				if var_306_6 > 0 and var_306_1 < var_306_6 then
					arg_303_1.talkMaxDuration = var_306_6

					if var_306_6 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_6 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_3
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_7 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_7 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_7

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_7 and arg_303_1.time_ < var_306_0 + var_306_7 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play910601079 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 910601079
		arg_307_1.duration_ = 3.533

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play910601080(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1084ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1084ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, -0.97, -6)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1084ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = arg_307_1.actors_["1084ui_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and arg_307_1.var_.characterEffect1084ui_story == nil then
				arg_307_1.var_.characterEffect1084ui_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect1084ui_story then
					arg_307_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect1084ui_story then
				arg_307_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_310_13 = 0

			if var_310_13 < arg_307_1.time_ and arg_307_1.time_ <= var_310_13 + arg_310_0 then
				arg_307_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_310_14 = 0

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 then
				arg_307_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_310_15 = arg_307_1.actors_["1028ui_story"].transform
			local var_310_16 = 0

			if var_310_16 < arg_307_1.time_ and arg_307_1.time_ <= var_310_16 + arg_310_0 then
				arg_307_1.var_.moveOldPos1028ui_story = var_310_15.localPosition
			end

			local var_310_17 = 0.001

			if var_310_16 <= arg_307_1.time_ and arg_307_1.time_ < var_310_16 + var_310_17 then
				local var_310_18 = (arg_307_1.time_ - var_310_16) / var_310_17
				local var_310_19 = Vector3.New(0, 100, 0)

				var_310_15.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1028ui_story, var_310_19, var_310_18)

				local var_310_20 = manager.ui.mainCamera.transform.position - var_310_15.position

				var_310_15.forward = Vector3.New(var_310_20.x, var_310_20.y, var_310_20.z)

				local var_310_21 = var_310_15.localEulerAngles

				var_310_21.z = 0
				var_310_21.x = 0
				var_310_15.localEulerAngles = var_310_21
			end

			if arg_307_1.time_ >= var_310_16 + var_310_17 and arg_307_1.time_ < var_310_16 + var_310_17 + arg_310_0 then
				var_310_15.localPosition = Vector3.New(0, 100, 0)

				local var_310_22 = manager.ui.mainCamera.transform.position - var_310_15.position

				var_310_15.forward = Vector3.New(var_310_22.x, var_310_22.y, var_310_22.z)

				local var_310_23 = var_310_15.localEulerAngles

				var_310_23.z = 0
				var_310_23.x = 0
				var_310_15.localEulerAngles = var_310_23
			end

			local var_310_24 = arg_307_1.actors_["1028ui_story"]
			local var_310_25 = 0

			if var_310_25 < arg_307_1.time_ and arg_307_1.time_ <= var_310_25 + arg_310_0 and arg_307_1.var_.characterEffect1028ui_story == nil then
				arg_307_1.var_.characterEffect1028ui_story = var_310_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_26 = 0.200000002980232

			if var_310_25 <= arg_307_1.time_ and arg_307_1.time_ < var_310_25 + var_310_26 then
				local var_310_27 = (arg_307_1.time_ - var_310_25) / var_310_26

				if arg_307_1.var_.characterEffect1028ui_story then
					local var_310_28 = Mathf.Lerp(0, 0.5, var_310_27)

					arg_307_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1028ui_story.fillRatio = var_310_28
				end
			end

			if arg_307_1.time_ >= var_310_25 + var_310_26 and arg_307_1.time_ < var_310_25 + var_310_26 + arg_310_0 and arg_307_1.var_.characterEffect1028ui_story then
				local var_310_29 = 0.5

				arg_307_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1028ui_story.fillRatio = var_310_29
			end

			local var_310_30 = arg_307_1.actors_["1048ui_story"].transform
			local var_310_31 = 0

			if var_310_31 < arg_307_1.time_ and arg_307_1.time_ <= var_310_31 + arg_310_0 then
				arg_307_1.var_.moveOldPos1048ui_story = var_310_30.localPosition
			end

			local var_310_32 = 0.001

			if var_310_31 <= arg_307_1.time_ and arg_307_1.time_ < var_310_31 + var_310_32 then
				local var_310_33 = (arg_307_1.time_ - var_310_31) / var_310_32
				local var_310_34 = Vector3.New(0, 100, 0)

				var_310_30.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1048ui_story, var_310_34, var_310_33)

				local var_310_35 = manager.ui.mainCamera.transform.position - var_310_30.position

				var_310_30.forward = Vector3.New(var_310_35.x, var_310_35.y, var_310_35.z)

				local var_310_36 = var_310_30.localEulerAngles

				var_310_36.z = 0
				var_310_36.x = 0
				var_310_30.localEulerAngles = var_310_36
			end

			if arg_307_1.time_ >= var_310_31 + var_310_32 and arg_307_1.time_ < var_310_31 + var_310_32 + arg_310_0 then
				var_310_30.localPosition = Vector3.New(0, 100, 0)

				local var_310_37 = manager.ui.mainCamera.transform.position - var_310_30.position

				var_310_30.forward = Vector3.New(var_310_37.x, var_310_37.y, var_310_37.z)

				local var_310_38 = var_310_30.localEulerAngles

				var_310_38.z = 0
				var_310_38.x = 0
				var_310_30.localEulerAngles = var_310_38
			end

			local var_310_39 = arg_307_1.actors_["1048ui_story"]
			local var_310_40 = 0

			if var_310_40 < arg_307_1.time_ and arg_307_1.time_ <= var_310_40 + arg_310_0 and arg_307_1.var_.characterEffect1048ui_story == nil then
				arg_307_1.var_.characterEffect1048ui_story = var_310_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_41 = 0.200000002980232

			if var_310_40 <= arg_307_1.time_ and arg_307_1.time_ < var_310_40 + var_310_41 then
				local var_310_42 = (arg_307_1.time_ - var_310_40) / var_310_41

				if arg_307_1.var_.characterEffect1048ui_story then
					local var_310_43 = Mathf.Lerp(0, 0.5, var_310_42)

					arg_307_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1048ui_story.fillRatio = var_310_43
				end
			end

			if arg_307_1.time_ >= var_310_40 + var_310_41 and arg_307_1.time_ < var_310_40 + var_310_41 + arg_310_0 and arg_307_1.var_.characterEffect1048ui_story then
				local var_310_44 = 0.5

				arg_307_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1048ui_story.fillRatio = var_310_44
			end

			local var_310_45 = 0
			local var_310_46 = 0.125

			if var_310_45 < arg_307_1.time_ and arg_307_1.time_ <= var_310_45 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_47 = arg_307_1:FormatText(StoryNameCfg[6].name)

				arg_307_1.leftNameTxt_.text = var_310_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_48 = arg_307_1:GetWordFromCfg(910601079)
				local var_310_49 = arg_307_1:FormatText(var_310_48.content)

				arg_307_1.text_.text = var_310_49

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_50 = 5
				local var_310_51 = utf8.len(var_310_49)
				local var_310_52 = var_310_50 <= 0 and var_310_46 or var_310_46 * (var_310_51 / var_310_50)

				if var_310_52 > 0 and var_310_46 < var_310_52 then
					arg_307_1.talkMaxDuration = var_310_52

					if var_310_52 + var_310_45 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_52 + var_310_45
					end
				end

				arg_307_1.text_.text = var_310_49
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601079", "story_v_out_910601.awb") ~= 0 then
					local var_310_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601079", "story_v_out_910601.awb") / 1000

					if var_310_53 + var_310_45 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_53 + var_310_45
					end

					if var_310_48.prefab_name ~= "" and arg_307_1.actors_[var_310_48.prefab_name] ~= nil then
						local var_310_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_48.prefab_name].transform, "story_v_out_910601", "910601079", "story_v_out_910601.awb")

						arg_307_1:RecordAudio("910601079", var_310_54)
						arg_307_1:RecordAudio("910601079", var_310_54)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_910601", "910601079", "story_v_out_910601.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_910601", "910601079", "story_v_out_910601.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_55 = math.max(var_310_46, arg_307_1.talkMaxDuration)

			if var_310_45 <= arg_307_1.time_ and arg_307_1.time_ < var_310_45 + var_310_55 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_45) / var_310_55

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_45 + var_310_55 and arg_307_1.time_ < var_310_45 + var_310_55 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play910601080 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 910601080
		arg_311_1.duration_ = 9.133

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play910601081(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1048ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos1048ui_story = var_314_0.localPosition
			end

			local var_314_2 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2
				local var_314_4 = Vector3.New(0.7, -0.8, -6.2)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1048ui_story, var_314_4, var_314_3)

				local var_314_5 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_5.x, var_314_5.y, var_314_5.z)

				local var_314_6 = var_314_0.localEulerAngles

				var_314_6.z = 0
				var_314_6.x = 0
				var_314_0.localEulerAngles = var_314_6
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_314_7 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_7.x, var_314_7.y, var_314_7.z)

				local var_314_8 = var_314_0.localEulerAngles

				var_314_8.z = 0
				var_314_8.x = 0
				var_314_0.localEulerAngles = var_314_8
			end

			local var_314_9 = arg_311_1.actors_["1048ui_story"]
			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 and arg_311_1.var_.characterEffect1048ui_story == nil then
				arg_311_1.var_.characterEffect1048ui_story = var_314_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_11 = 0.200000002980232

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_11 then
				local var_314_12 = (arg_311_1.time_ - var_314_10) / var_314_11

				if arg_311_1.var_.characterEffect1048ui_story then
					arg_311_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_10 + var_314_11 and arg_311_1.time_ < var_314_10 + var_314_11 + arg_314_0 and arg_311_1.var_.characterEffect1048ui_story then
				arg_311_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_314_13 = 0

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_314_15 = arg_311_1.actors_["1084ui_story"].transform
			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.var_.moveOldPos1084ui_story = var_314_15.localPosition
			end

			local var_314_17 = 0.001

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Vector3.New(-0.7, -0.97, -6)

				var_314_15.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1084ui_story, var_314_19, var_314_18)

				local var_314_20 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_20.x, var_314_20.y, var_314_20.z)

				local var_314_21 = var_314_15.localEulerAngles

				var_314_21.z = 0
				var_314_21.x = 0
				var_314_15.localEulerAngles = var_314_21
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				var_314_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_314_22 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_22.x, var_314_22.y, var_314_22.z)

				local var_314_23 = var_314_15.localEulerAngles

				var_314_23.z = 0
				var_314_23.x = 0
				var_314_15.localEulerAngles = var_314_23
			end

			local var_314_24 = arg_311_1.actors_["1084ui_story"]
			local var_314_25 = 0

			if var_314_25 < arg_311_1.time_ and arg_311_1.time_ <= var_314_25 + arg_314_0 and arg_311_1.var_.characterEffect1084ui_story == nil then
				arg_311_1.var_.characterEffect1084ui_story = var_314_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_26 = 0.200000002980232

			if var_314_25 <= arg_311_1.time_ and arg_311_1.time_ < var_314_25 + var_314_26 then
				local var_314_27 = (arg_311_1.time_ - var_314_25) / var_314_26

				if arg_311_1.var_.characterEffect1084ui_story then
					local var_314_28 = Mathf.Lerp(0, 0.5, var_314_27)

					arg_311_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1084ui_story.fillRatio = var_314_28
				end
			end

			if arg_311_1.time_ >= var_314_25 + var_314_26 and arg_311_1.time_ < var_314_25 + var_314_26 + arg_314_0 and arg_311_1.var_.characterEffect1084ui_story then
				local var_314_29 = 0.5

				arg_311_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1084ui_story.fillRatio = var_314_29
			end

			local var_314_30 = 0
			local var_314_31 = 0.9

			if var_314_30 < arg_311_1.time_ and arg_311_1.time_ <= var_314_30 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_32 = arg_311_1:FormatText(StoryNameCfg[8].name)

				arg_311_1.leftNameTxt_.text = var_314_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_33 = arg_311_1:GetWordFromCfg(910601080)
				local var_314_34 = arg_311_1:FormatText(var_314_33.content)

				arg_311_1.text_.text = var_314_34

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_35 = 36
				local var_314_36 = utf8.len(var_314_34)
				local var_314_37 = var_314_35 <= 0 and var_314_31 or var_314_31 * (var_314_36 / var_314_35)

				if var_314_37 > 0 and var_314_31 < var_314_37 then
					arg_311_1.talkMaxDuration = var_314_37

					if var_314_37 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_37 + var_314_30
					end
				end

				arg_311_1.text_.text = var_314_34
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601080", "story_v_out_910601.awb") ~= 0 then
					local var_314_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601080", "story_v_out_910601.awb") / 1000

					if var_314_38 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_38 + var_314_30
					end

					if var_314_33.prefab_name ~= "" and arg_311_1.actors_[var_314_33.prefab_name] ~= nil then
						local var_314_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_33.prefab_name].transform, "story_v_out_910601", "910601080", "story_v_out_910601.awb")

						arg_311_1:RecordAudio("910601080", var_314_39)
						arg_311_1:RecordAudio("910601080", var_314_39)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_910601", "910601080", "story_v_out_910601.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_910601", "910601080", "story_v_out_910601.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_40 = math.max(var_314_31, arg_311_1.talkMaxDuration)

			if var_314_30 <= arg_311_1.time_ and arg_311_1.time_ < var_314_30 + var_314_40 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_30) / var_314_40

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_30 + var_314_40 and arg_311_1.time_ < var_314_30 + var_314_40 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play910601081 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 910601081
		arg_315_1.duration_ = 7.4

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play910601082(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1011ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1011ui_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(0, -0.71, -6)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1011ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["1011ui_story"]
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 and arg_315_1.var_.characterEffect1011ui_story == nil then
				arg_315_1.var_.characterEffect1011ui_story = var_318_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_11 = 0.200000002980232

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11

				if arg_315_1.var_.characterEffect1011ui_story then
					arg_315_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 and arg_315_1.var_.characterEffect1011ui_story then
				arg_315_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_318_13 = 0

			if var_318_13 < arg_315_1.time_ and arg_315_1.time_ <= var_318_13 + arg_318_0 then
				arg_315_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_318_14 = 0

			if var_318_14 < arg_315_1.time_ and arg_315_1.time_ <= var_318_14 + arg_318_0 then
				arg_315_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_15 = arg_315_1.actors_["1048ui_story"].transform
			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.var_.moveOldPos1048ui_story = var_318_15.localPosition
			end

			local var_318_17 = 0.001

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Vector3.New(0, 100, 0)

				var_318_15.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1048ui_story, var_318_19, var_318_18)

				local var_318_20 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_20.x, var_318_20.y, var_318_20.z)

				local var_318_21 = var_318_15.localEulerAngles

				var_318_21.z = 0
				var_318_21.x = 0
				var_318_15.localEulerAngles = var_318_21
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				var_318_15.localPosition = Vector3.New(0, 100, 0)

				local var_318_22 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_22.x, var_318_22.y, var_318_22.z)

				local var_318_23 = var_318_15.localEulerAngles

				var_318_23.z = 0
				var_318_23.x = 0
				var_318_15.localEulerAngles = var_318_23
			end

			local var_318_24 = arg_315_1.actors_["1048ui_story"]
			local var_318_25 = 0

			if var_318_25 < arg_315_1.time_ and arg_315_1.time_ <= var_318_25 + arg_318_0 and arg_315_1.var_.characterEffect1048ui_story == nil then
				arg_315_1.var_.characterEffect1048ui_story = var_318_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_26 = 0.200000002980232

			if var_318_25 <= arg_315_1.time_ and arg_315_1.time_ < var_318_25 + var_318_26 then
				local var_318_27 = (arg_315_1.time_ - var_318_25) / var_318_26

				if arg_315_1.var_.characterEffect1048ui_story then
					local var_318_28 = Mathf.Lerp(0, 0.5, var_318_27)

					arg_315_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1048ui_story.fillRatio = var_318_28
				end
			end

			if arg_315_1.time_ >= var_318_25 + var_318_26 and arg_315_1.time_ < var_318_25 + var_318_26 + arg_318_0 and arg_315_1.var_.characterEffect1048ui_story then
				local var_318_29 = 0.5

				arg_315_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1048ui_story.fillRatio = var_318_29
			end

			local var_318_30 = arg_315_1.actors_["1084ui_story"].transform
			local var_318_31 = 0

			if var_318_31 < arg_315_1.time_ and arg_315_1.time_ <= var_318_31 + arg_318_0 then
				arg_315_1.var_.moveOldPos1084ui_story = var_318_30.localPosition
			end

			local var_318_32 = 0.001

			if var_318_31 <= arg_315_1.time_ and arg_315_1.time_ < var_318_31 + var_318_32 then
				local var_318_33 = (arg_315_1.time_ - var_318_31) / var_318_32
				local var_318_34 = Vector3.New(0, 100, 0)

				var_318_30.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1084ui_story, var_318_34, var_318_33)

				local var_318_35 = manager.ui.mainCamera.transform.position - var_318_30.position

				var_318_30.forward = Vector3.New(var_318_35.x, var_318_35.y, var_318_35.z)

				local var_318_36 = var_318_30.localEulerAngles

				var_318_36.z = 0
				var_318_36.x = 0
				var_318_30.localEulerAngles = var_318_36
			end

			if arg_315_1.time_ >= var_318_31 + var_318_32 and arg_315_1.time_ < var_318_31 + var_318_32 + arg_318_0 then
				var_318_30.localPosition = Vector3.New(0, 100, 0)

				local var_318_37 = manager.ui.mainCamera.transform.position - var_318_30.position

				var_318_30.forward = Vector3.New(var_318_37.x, var_318_37.y, var_318_37.z)

				local var_318_38 = var_318_30.localEulerAngles

				var_318_38.z = 0
				var_318_38.x = 0
				var_318_30.localEulerAngles = var_318_38
			end

			local var_318_39 = arg_315_1.actors_["1084ui_story"]
			local var_318_40 = 0

			if var_318_40 < arg_315_1.time_ and arg_315_1.time_ <= var_318_40 + arg_318_0 and arg_315_1.var_.characterEffect1084ui_story == nil then
				arg_315_1.var_.characterEffect1084ui_story = var_318_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_41 = 0.200000002980232

			if var_318_40 <= arg_315_1.time_ and arg_315_1.time_ < var_318_40 + var_318_41 then
				local var_318_42 = (arg_315_1.time_ - var_318_40) / var_318_41

				if arg_315_1.var_.characterEffect1084ui_story then
					local var_318_43 = Mathf.Lerp(0, 0.5, var_318_42)

					arg_315_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1084ui_story.fillRatio = var_318_43
				end
			end

			if arg_315_1.time_ >= var_318_40 + var_318_41 and arg_315_1.time_ < var_318_40 + var_318_41 + arg_318_0 and arg_315_1.var_.characterEffect1084ui_story then
				local var_318_44 = 0.5

				arg_315_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1084ui_story.fillRatio = var_318_44
			end

			local var_318_45 = 0
			local var_318_46 = 1

			if var_318_45 < arg_315_1.time_ and arg_315_1.time_ <= var_318_45 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_47 = arg_315_1:FormatText(StoryNameCfg[37].name)

				arg_315_1.leftNameTxt_.text = var_318_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_48 = arg_315_1:GetWordFromCfg(910601081)
				local var_318_49 = arg_315_1:FormatText(var_318_48.content)

				arg_315_1.text_.text = var_318_49

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_50 = 40
				local var_318_51 = utf8.len(var_318_49)
				local var_318_52 = var_318_50 <= 0 and var_318_46 or var_318_46 * (var_318_51 / var_318_50)

				if var_318_52 > 0 and var_318_46 < var_318_52 then
					arg_315_1.talkMaxDuration = var_318_52

					if var_318_52 + var_318_45 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_52 + var_318_45
					end
				end

				arg_315_1.text_.text = var_318_49
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601081", "story_v_out_910601.awb") ~= 0 then
					local var_318_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601081", "story_v_out_910601.awb") / 1000

					if var_318_53 + var_318_45 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_53 + var_318_45
					end

					if var_318_48.prefab_name ~= "" and arg_315_1.actors_[var_318_48.prefab_name] ~= nil then
						local var_318_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_48.prefab_name].transform, "story_v_out_910601", "910601081", "story_v_out_910601.awb")

						arg_315_1:RecordAudio("910601081", var_318_54)
						arg_315_1:RecordAudio("910601081", var_318_54)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_910601", "910601081", "story_v_out_910601.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_910601", "910601081", "story_v_out_910601.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_55 = math.max(var_318_46, arg_315_1.talkMaxDuration)

			if var_318_45 <= arg_315_1.time_ and arg_315_1.time_ < var_318_45 + var_318_55 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_45) / var_318_55

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_45 + var_318_55 and arg_315_1.time_ < var_318_45 + var_318_55 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play910601082 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 910601082
		arg_319_1.duration_ = 10.7

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play910601083(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1059ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1059ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0, -1.05, -6)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1059ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["1059ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect1059ui_story == nil then
				arg_319_1.var_.characterEffect1059ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect1059ui_story then
					arg_319_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect1059ui_story then
				arg_319_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_322_15 = arg_319_1.actors_["1011ui_story"].transform
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 then
				arg_319_1.var_.moveOldPos1011ui_story = var_322_15.localPosition
			end

			local var_322_17 = 0.001

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17
				local var_322_19 = Vector3.New(0, 100, 0)

				var_322_15.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1011ui_story, var_322_19, var_322_18)

				local var_322_20 = manager.ui.mainCamera.transform.position - var_322_15.position

				var_322_15.forward = Vector3.New(var_322_20.x, var_322_20.y, var_322_20.z)

				local var_322_21 = var_322_15.localEulerAngles

				var_322_21.z = 0
				var_322_21.x = 0
				var_322_15.localEulerAngles = var_322_21
			end

			if arg_319_1.time_ >= var_322_16 + var_322_17 and arg_319_1.time_ < var_322_16 + var_322_17 + arg_322_0 then
				var_322_15.localPosition = Vector3.New(0, 100, 0)

				local var_322_22 = manager.ui.mainCamera.transform.position - var_322_15.position

				var_322_15.forward = Vector3.New(var_322_22.x, var_322_22.y, var_322_22.z)

				local var_322_23 = var_322_15.localEulerAngles

				var_322_23.z = 0
				var_322_23.x = 0
				var_322_15.localEulerAngles = var_322_23
			end

			local var_322_24 = arg_319_1.actors_["1011ui_story"]
			local var_322_25 = 0

			if var_322_25 < arg_319_1.time_ and arg_319_1.time_ <= var_322_25 + arg_322_0 and arg_319_1.var_.characterEffect1011ui_story == nil then
				arg_319_1.var_.characterEffect1011ui_story = var_322_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_26 = 0.200000002980232

			if var_322_25 <= arg_319_1.time_ and arg_319_1.time_ < var_322_25 + var_322_26 then
				local var_322_27 = (arg_319_1.time_ - var_322_25) / var_322_26

				if arg_319_1.var_.characterEffect1011ui_story then
					local var_322_28 = Mathf.Lerp(0, 0.5, var_322_27)

					arg_319_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1011ui_story.fillRatio = var_322_28
				end
			end

			if arg_319_1.time_ >= var_322_25 + var_322_26 and arg_319_1.time_ < var_322_25 + var_322_26 + arg_322_0 and arg_319_1.var_.characterEffect1011ui_story then
				local var_322_29 = 0.5

				arg_319_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1011ui_story.fillRatio = var_322_29
			end

			local var_322_30 = 0
			local var_322_31 = 1.25

			if var_322_30 < arg_319_1.time_ and arg_319_1.time_ <= var_322_30 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_32 = arg_319_1:FormatText(StoryNameCfg[28].name)

				arg_319_1.leftNameTxt_.text = var_322_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_33 = arg_319_1:GetWordFromCfg(910601082)
				local var_322_34 = arg_319_1:FormatText(var_322_33.content)

				arg_319_1.text_.text = var_322_34

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_35 = 50
				local var_322_36 = utf8.len(var_322_34)
				local var_322_37 = var_322_35 <= 0 and var_322_31 or var_322_31 * (var_322_36 / var_322_35)

				if var_322_37 > 0 and var_322_31 < var_322_37 then
					arg_319_1.talkMaxDuration = var_322_37

					if var_322_37 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_37 + var_322_30
					end
				end

				arg_319_1.text_.text = var_322_34
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601082", "story_v_out_910601.awb") ~= 0 then
					local var_322_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601082", "story_v_out_910601.awb") / 1000

					if var_322_38 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_38 + var_322_30
					end

					if var_322_33.prefab_name ~= "" and arg_319_1.actors_[var_322_33.prefab_name] ~= nil then
						local var_322_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_33.prefab_name].transform, "story_v_out_910601", "910601082", "story_v_out_910601.awb")

						arg_319_1:RecordAudio("910601082", var_322_39)
						arg_319_1:RecordAudio("910601082", var_322_39)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_910601", "910601082", "story_v_out_910601.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_910601", "910601082", "story_v_out_910601.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_40 = math.max(var_322_31, arg_319_1.talkMaxDuration)

			if var_322_30 <= arg_319_1.time_ and arg_319_1.time_ < var_322_30 + var_322_40 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_30) / var_322_40

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_30 + var_322_40 and arg_319_1.time_ < var_322_30 + var_322_40 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play910601083 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 910601083
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play910601084(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1059ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1059ui_story == nil then
				arg_323_1.var_.characterEffect1059ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.200000002980232

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1059ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1059ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1059ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1059ui_story.fillRatio = var_326_5
			end

			local var_326_6 = 0
			local var_326_7 = 0.35

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_8 = arg_323_1:FormatText(StoryNameCfg[7].name)

				arg_323_1.leftNameTxt_.text = var_326_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_9 = arg_323_1:GetWordFromCfg(910601083)
				local var_326_10 = arg_323_1:FormatText(var_326_9.content)

				arg_323_1.text_.text = var_326_10

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_11 = 14
				local var_326_12 = utf8.len(var_326_10)
				local var_326_13 = var_326_11 <= 0 and var_326_7 or var_326_7 * (var_326_12 / var_326_11)

				if var_326_13 > 0 and var_326_7 < var_326_13 then
					arg_323_1.talkMaxDuration = var_326_13

					if var_326_13 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_13 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_10
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_14 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_14 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_14

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_14 and arg_323_1.time_ < var_326_6 + var_326_14 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play910601084 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 910601084
		arg_327_1.duration_ = 9.2

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play910601085(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1084ui_story"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1084ui_story = var_330_0.localPosition
			end

			local var_330_2 = 0.001

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2
				local var_330_4 = Vector3.New(0, -0.97, -6)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1084ui_story, var_330_4, var_330_3)

				local var_330_5 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_5.x, var_330_5.y, var_330_5.z)

				local var_330_6 = var_330_0.localEulerAngles

				var_330_6.z = 0
				var_330_6.x = 0
				var_330_0.localEulerAngles = var_330_6
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_330_7 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_7.x, var_330_7.y, var_330_7.z)

				local var_330_8 = var_330_0.localEulerAngles

				var_330_8.z = 0
				var_330_8.x = 0
				var_330_0.localEulerAngles = var_330_8
			end

			local var_330_9 = arg_327_1.actors_["1084ui_story"]
			local var_330_10 = 0

			if var_330_10 < arg_327_1.time_ and arg_327_1.time_ <= var_330_10 + arg_330_0 and arg_327_1.var_.characterEffect1084ui_story == nil then
				arg_327_1.var_.characterEffect1084ui_story = var_330_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_11 = 0.200000002980232

			if var_330_10 <= arg_327_1.time_ and arg_327_1.time_ < var_330_10 + var_330_11 then
				local var_330_12 = (arg_327_1.time_ - var_330_10) / var_330_11

				if arg_327_1.var_.characterEffect1084ui_story then
					arg_327_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_10 + var_330_11 and arg_327_1.time_ < var_330_10 + var_330_11 + arg_330_0 and arg_327_1.var_.characterEffect1084ui_story then
				arg_327_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_330_13 = 0

			if var_330_13 < arg_327_1.time_ and arg_327_1.time_ <= var_330_13 + arg_330_0 then
				arg_327_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_330_14 = 0

			if var_330_14 < arg_327_1.time_ and arg_327_1.time_ <= var_330_14 + arg_330_0 then
				arg_327_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_330_15 = arg_327_1.actors_["1059ui_story"].transform
			local var_330_16 = 0

			if var_330_16 < arg_327_1.time_ and arg_327_1.time_ <= var_330_16 + arg_330_0 then
				arg_327_1.var_.moveOldPos1059ui_story = var_330_15.localPosition
			end

			local var_330_17 = 0.001

			if var_330_16 <= arg_327_1.time_ and arg_327_1.time_ < var_330_16 + var_330_17 then
				local var_330_18 = (arg_327_1.time_ - var_330_16) / var_330_17
				local var_330_19 = Vector3.New(0, 100, 0)

				var_330_15.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1059ui_story, var_330_19, var_330_18)

				local var_330_20 = manager.ui.mainCamera.transform.position - var_330_15.position

				var_330_15.forward = Vector3.New(var_330_20.x, var_330_20.y, var_330_20.z)

				local var_330_21 = var_330_15.localEulerAngles

				var_330_21.z = 0
				var_330_21.x = 0
				var_330_15.localEulerAngles = var_330_21
			end

			if arg_327_1.time_ >= var_330_16 + var_330_17 and arg_327_1.time_ < var_330_16 + var_330_17 + arg_330_0 then
				var_330_15.localPosition = Vector3.New(0, 100, 0)

				local var_330_22 = manager.ui.mainCamera.transform.position - var_330_15.position

				var_330_15.forward = Vector3.New(var_330_22.x, var_330_22.y, var_330_22.z)

				local var_330_23 = var_330_15.localEulerAngles

				var_330_23.z = 0
				var_330_23.x = 0
				var_330_15.localEulerAngles = var_330_23
			end

			local var_330_24 = arg_327_1.actors_["1059ui_story"]
			local var_330_25 = 0

			if var_330_25 < arg_327_1.time_ and arg_327_1.time_ <= var_330_25 + arg_330_0 and arg_327_1.var_.characterEffect1059ui_story == nil then
				arg_327_1.var_.characterEffect1059ui_story = var_330_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_26 = 0.200000002980232

			if var_330_25 <= arg_327_1.time_ and arg_327_1.time_ < var_330_25 + var_330_26 then
				local var_330_27 = (arg_327_1.time_ - var_330_25) / var_330_26

				if arg_327_1.var_.characterEffect1059ui_story then
					local var_330_28 = Mathf.Lerp(0, 0.5, var_330_27)

					arg_327_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1059ui_story.fillRatio = var_330_28
				end
			end

			if arg_327_1.time_ >= var_330_25 + var_330_26 and arg_327_1.time_ < var_330_25 + var_330_26 + arg_330_0 and arg_327_1.var_.characterEffect1059ui_story then
				local var_330_29 = 0.5

				arg_327_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1059ui_story.fillRatio = var_330_29
			end

			local var_330_30 = 0
			local var_330_31 = 1.175

			if var_330_30 < arg_327_1.time_ and arg_327_1.time_ <= var_330_30 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_32 = arg_327_1:FormatText(StoryNameCfg[6].name)

				arg_327_1.leftNameTxt_.text = var_330_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_33 = arg_327_1:GetWordFromCfg(910601084)
				local var_330_34 = arg_327_1:FormatText(var_330_33.content)

				arg_327_1.text_.text = var_330_34

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_35 = 47
				local var_330_36 = utf8.len(var_330_34)
				local var_330_37 = var_330_35 <= 0 and var_330_31 or var_330_31 * (var_330_36 / var_330_35)

				if var_330_37 > 0 and var_330_31 < var_330_37 then
					arg_327_1.talkMaxDuration = var_330_37

					if var_330_37 + var_330_30 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_37 + var_330_30
					end
				end

				arg_327_1.text_.text = var_330_34
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601084", "story_v_out_910601.awb") ~= 0 then
					local var_330_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601084", "story_v_out_910601.awb") / 1000

					if var_330_38 + var_330_30 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_38 + var_330_30
					end

					if var_330_33.prefab_name ~= "" and arg_327_1.actors_[var_330_33.prefab_name] ~= nil then
						local var_330_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_33.prefab_name].transform, "story_v_out_910601", "910601084", "story_v_out_910601.awb")

						arg_327_1:RecordAudio("910601084", var_330_39)
						arg_327_1:RecordAudio("910601084", var_330_39)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_910601", "910601084", "story_v_out_910601.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_910601", "910601084", "story_v_out_910601.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_40 = math.max(var_330_31, arg_327_1.talkMaxDuration)

			if var_330_30 <= arg_327_1.time_ and arg_327_1.time_ < var_330_30 + var_330_40 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_30) / var_330_40

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_30 + var_330_40 and arg_327_1.time_ < var_330_30 + var_330_40 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play910601085 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 910601085
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play910601086(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1084ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1084ui_story == nil then
				arg_331_1.var_.characterEffect1084ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1084ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1084ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1084ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1084ui_story.fillRatio = var_334_5
			end

			local var_334_6 = 0
			local var_334_7 = 0.675

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(910601085)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 25
				local var_334_12 = utf8.len(var_334_10)
				local var_334_13 = var_334_11 <= 0 and var_334_7 or var_334_7 * (var_334_12 / var_334_11)

				if var_334_13 > 0 and var_334_7 < var_334_13 then
					arg_331_1.talkMaxDuration = var_334_13

					if var_334_13 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_13 + var_334_6
					end
				end

				arg_331_1.text_.text = var_334_10
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_14 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_14 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_14

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_14 and arg_331_1.time_ < var_334_6 + var_334_14 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play910601086 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 910601086
		arg_335_1.duration_ = 1.999999999999

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play910601087(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = "1184ui_story"

			if arg_335_1.actors_[var_338_0] == nil then
				local var_338_1 = Object.Instantiate(Asset.Load("Char/" .. var_338_0), arg_335_1.stage_.transform)

				var_338_1.name = var_338_0
				var_338_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_335_1.actors_[var_338_0] = var_338_1

				local var_338_2 = var_338_1:GetComponentInChildren(typeof(CharacterEffect))

				var_338_2.enabled = true

				local var_338_3 = GameObjectTools.GetOrAddComponent(var_338_1, typeof(DynamicBoneHelper))

				if var_338_3 then
					var_338_3:EnableDynamicBone(false)
				end

				arg_335_1:ShowWeapon(var_338_2.transform, false)

				arg_335_1.var_[var_338_0 .. "Animator"] = var_338_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_335_1.var_[var_338_0 .. "Animator"].applyRootMotion = true
				arg_335_1.var_[var_338_0 .. "LipSync"] = var_338_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_338_4 = arg_335_1.actors_["1184ui_story"].transform
			local var_338_5 = 0

			if var_338_5 < arg_335_1.time_ and arg_335_1.time_ <= var_338_5 + arg_338_0 then
				arg_335_1.var_.moveOldPos1184ui_story = var_338_4.localPosition
			end

			local var_338_6 = 0.001

			if var_338_5 <= arg_335_1.time_ and arg_335_1.time_ < var_338_5 + var_338_6 then
				local var_338_7 = (arg_335_1.time_ - var_338_5) / var_338_6
				local var_338_8 = Vector3.New(0, -0.97, -6)

				var_338_4.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1184ui_story, var_338_8, var_338_7)

				local var_338_9 = manager.ui.mainCamera.transform.position - var_338_4.position

				var_338_4.forward = Vector3.New(var_338_9.x, var_338_9.y, var_338_9.z)

				local var_338_10 = var_338_4.localEulerAngles

				var_338_10.z = 0
				var_338_10.x = 0
				var_338_4.localEulerAngles = var_338_10
			end

			if arg_335_1.time_ >= var_338_5 + var_338_6 and arg_335_1.time_ < var_338_5 + var_338_6 + arg_338_0 then
				var_338_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_338_11 = manager.ui.mainCamera.transform.position - var_338_4.position

				var_338_4.forward = Vector3.New(var_338_11.x, var_338_11.y, var_338_11.z)

				local var_338_12 = var_338_4.localEulerAngles

				var_338_12.z = 0
				var_338_12.x = 0
				var_338_4.localEulerAngles = var_338_12
			end

			local var_338_13 = arg_335_1.actors_["1084ui_story"]
			local var_338_14 = 0

			if var_338_14 < arg_335_1.time_ and arg_335_1.time_ <= var_338_14 + arg_338_0 and arg_335_1.var_.characterEffect1084ui_story == nil then
				arg_335_1.var_.characterEffect1084ui_story = var_338_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_15 = 0.200000002980232

			if var_338_14 <= arg_335_1.time_ and arg_335_1.time_ < var_338_14 + var_338_15 then
				local var_338_16 = (arg_335_1.time_ - var_338_14) / var_338_15

				if arg_335_1.var_.characterEffect1084ui_story then
					arg_335_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_14 + var_338_15 and arg_335_1.time_ < var_338_14 + var_338_15 + arg_338_0 and arg_335_1.var_.characterEffect1084ui_story then
				arg_335_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_338_17 = 0

			if var_338_17 < arg_335_1.time_ and arg_335_1.time_ <= var_338_17 + arg_338_0 then
				arg_335_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4212")
			end

			local var_338_18 = 0

			if var_338_18 < arg_335_1.time_ and arg_335_1.time_ <= var_338_18 + arg_338_0 then
				arg_335_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_338_19 = arg_335_1.actors_["1084ui_story"].transform
			local var_338_20 = 0

			if var_338_20 < arg_335_1.time_ and arg_335_1.time_ <= var_338_20 + arg_338_0 then
				arg_335_1.var_.moveOldPos1084ui_story = var_338_19.localPosition
			end

			local var_338_21 = 0.001

			if var_338_20 <= arg_335_1.time_ and arg_335_1.time_ < var_338_20 + var_338_21 then
				local var_338_22 = (arg_335_1.time_ - var_338_20) / var_338_21
				local var_338_23 = Vector3.New(0, 100, 0)

				var_338_19.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1084ui_story, var_338_23, var_338_22)

				local var_338_24 = manager.ui.mainCamera.transform.position - var_338_19.position

				var_338_19.forward = Vector3.New(var_338_24.x, var_338_24.y, var_338_24.z)

				local var_338_25 = var_338_19.localEulerAngles

				var_338_25.z = 0
				var_338_25.x = 0
				var_338_19.localEulerAngles = var_338_25
			end

			if arg_335_1.time_ >= var_338_20 + var_338_21 and arg_335_1.time_ < var_338_20 + var_338_21 + arg_338_0 then
				var_338_19.localPosition = Vector3.New(0, 100, 0)

				local var_338_26 = manager.ui.mainCamera.transform.position - var_338_19.position

				var_338_19.forward = Vector3.New(var_338_26.x, var_338_26.y, var_338_26.z)

				local var_338_27 = var_338_19.localEulerAngles

				var_338_27.z = 0
				var_338_27.x = 0
				var_338_19.localEulerAngles = var_338_27
			end

			local var_338_28 = 0
			local var_338_29 = 0.1

			if var_338_28 < arg_335_1.time_ and arg_335_1.time_ <= var_338_28 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_30 = arg_335_1:FormatText(StoryNameCfg[6].name)

				arg_335_1.leftNameTxt_.text = var_338_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_31 = arg_335_1:GetWordFromCfg(910601086)
				local var_338_32 = arg_335_1:FormatText(var_338_31.content)

				arg_335_1.text_.text = var_338_32

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_33 = 4
				local var_338_34 = utf8.len(var_338_32)
				local var_338_35 = var_338_33 <= 0 and var_338_29 or var_338_29 * (var_338_34 / var_338_33)

				if var_338_35 > 0 and var_338_29 < var_338_35 then
					arg_335_1.talkMaxDuration = var_338_35

					if var_338_35 + var_338_28 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_35 + var_338_28
					end
				end

				arg_335_1.text_.text = var_338_32
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601086", "story_v_out_910601.awb") ~= 0 then
					local var_338_36 = manager.audio:GetVoiceLength("story_v_out_910601", "910601086", "story_v_out_910601.awb") / 1000

					if var_338_36 + var_338_28 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_36 + var_338_28
					end

					if var_338_31.prefab_name ~= "" and arg_335_1.actors_[var_338_31.prefab_name] ~= nil then
						local var_338_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_31.prefab_name].transform, "story_v_out_910601", "910601086", "story_v_out_910601.awb")

						arg_335_1:RecordAudio("910601086", var_338_37)
						arg_335_1:RecordAudio("910601086", var_338_37)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_910601", "910601086", "story_v_out_910601.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_910601", "910601086", "story_v_out_910601.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_38 = math.max(var_338_29, arg_335_1.talkMaxDuration)

			if var_338_28 <= arg_335_1.time_ and arg_335_1.time_ < var_338_28 + var_338_38 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_28) / var_338_38

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_28 + var_338_38 and arg_335_1.time_ < var_338_28 + var_338_38 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play910601087 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 910601087
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play910601088(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1184ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect1184ui_story == nil then
				arg_339_1.var_.characterEffect1184ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.200000002980232

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect1184ui_story then
					local var_342_4 = Mathf.Lerp(0, 0.5, var_342_3)

					arg_339_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1184ui_story.fillRatio = var_342_4
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1184ui_story then
				local var_342_5 = 0.5

				arg_339_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1184ui_story.fillRatio = var_342_5
			end

			local var_342_6 = arg_339_1.actors_["1184ui_story"].transform
			local var_342_7 = 0

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 then
				arg_339_1.var_.moveOldPos1184ui_story = var_342_6.localPosition
			end

			local var_342_8 = 0.001

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_8 then
				local var_342_9 = (arg_339_1.time_ - var_342_7) / var_342_8
				local var_342_10 = Vector3.New(0, 100, 0)

				var_342_6.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1184ui_story, var_342_10, var_342_9)

				local var_342_11 = manager.ui.mainCamera.transform.position - var_342_6.position

				var_342_6.forward = Vector3.New(var_342_11.x, var_342_11.y, var_342_11.z)

				local var_342_12 = var_342_6.localEulerAngles

				var_342_12.z = 0
				var_342_12.x = 0
				var_342_6.localEulerAngles = var_342_12
			end

			if arg_339_1.time_ >= var_342_7 + var_342_8 and arg_339_1.time_ < var_342_7 + var_342_8 + arg_342_0 then
				var_342_6.localPosition = Vector3.New(0, 100, 0)

				local var_342_13 = manager.ui.mainCamera.transform.position - var_342_6.position

				var_342_6.forward = Vector3.New(var_342_13.x, var_342_13.y, var_342_13.z)

				local var_342_14 = var_342_6.localEulerAngles

				var_342_14.z = 0
				var_342_14.x = 0
				var_342_6.localEulerAngles = var_342_14
			end

			local var_342_15 = 0
			local var_342_16 = 0.375

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[7].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(910601087)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 15
				local var_342_21 = utf8.len(var_342_19)
				local var_342_22 = var_342_20 <= 0 and var_342_16 or var_342_16 * (var_342_21 / var_342_20)

				if var_342_22 > 0 and var_342_16 < var_342_22 then
					arg_339_1.talkMaxDuration = var_342_22

					if var_342_22 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_15
					end
				end

				arg_339_1.text_.text = var_342_19
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_23 = math.max(var_342_16, arg_339_1.talkMaxDuration)

			if var_342_15 <= arg_339_1.time_ and arg_339_1.time_ < var_342_15 + var_342_23 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_15) / var_342_23

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_15 + var_342_23 and arg_339_1.time_ < var_342_15 + var_342_23 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play910601088 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 910601088
		arg_343_1.duration_ = 2.9

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play910601089(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1084ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1084ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(0, -0.97, -6)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1084ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = arg_343_1.actors_["1084ui_story"]
			local var_346_10 = 0

			if var_346_10 < arg_343_1.time_ and arg_343_1.time_ <= var_346_10 + arg_346_0 and arg_343_1.var_.characterEffect1084ui_story == nil then
				arg_343_1.var_.characterEffect1084ui_story = var_346_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_11 = 0.200000002980232

			if var_346_10 <= arg_343_1.time_ and arg_343_1.time_ < var_346_10 + var_346_11 then
				local var_346_12 = (arg_343_1.time_ - var_346_10) / var_346_11

				if arg_343_1.var_.characterEffect1084ui_story then
					arg_343_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_10 + var_346_11 and arg_343_1.time_ < var_346_10 + var_346_11 + arg_346_0 and arg_343_1.var_.characterEffect1084ui_story then
				arg_343_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_346_13 = 0

			if var_346_13 < arg_343_1.time_ and arg_343_1.time_ <= var_346_13 + arg_346_0 then
				arg_343_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_346_15 = 0
			local var_346_16 = 0.375

			if var_346_15 < arg_343_1.time_ and arg_343_1.time_ <= var_346_15 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_17 = arg_343_1:FormatText(StoryNameCfg[6].name)

				arg_343_1.leftNameTxt_.text = var_346_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_18 = arg_343_1:GetWordFromCfg(910601088)
				local var_346_19 = arg_343_1:FormatText(var_346_18.content)

				arg_343_1.text_.text = var_346_19

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_20 = 15
				local var_346_21 = utf8.len(var_346_19)
				local var_346_22 = var_346_20 <= 0 and var_346_16 or var_346_16 * (var_346_21 / var_346_20)

				if var_346_22 > 0 and var_346_16 < var_346_22 then
					arg_343_1.talkMaxDuration = var_346_22

					if var_346_22 + var_346_15 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_22 + var_346_15
					end
				end

				arg_343_1.text_.text = var_346_19
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601088", "story_v_out_910601.awb") ~= 0 then
					local var_346_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601088", "story_v_out_910601.awb") / 1000

					if var_346_23 + var_346_15 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_23 + var_346_15
					end

					if var_346_18.prefab_name ~= "" and arg_343_1.actors_[var_346_18.prefab_name] ~= nil then
						local var_346_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_18.prefab_name].transform, "story_v_out_910601", "910601088", "story_v_out_910601.awb")

						arg_343_1:RecordAudio("910601088", var_346_24)
						arg_343_1:RecordAudio("910601088", var_346_24)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_910601", "910601088", "story_v_out_910601.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_910601", "910601088", "story_v_out_910601.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_25 = math.max(var_346_16, arg_343_1.talkMaxDuration)

			if var_346_15 <= arg_343_1.time_ and arg_343_1.time_ < var_346_15 + var_346_25 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_15) / var_346_25

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_15 + var_346_25 and arg_343_1.time_ < var_346_15 + var_346_25 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play910601089 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 910601089
		arg_347_1.duration_ = 13.166

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play910601090(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1084ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1084ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, -0.97, -6)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1084ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = arg_347_1.actors_["1084ui_story"]
			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 and arg_347_1.var_.characterEffect1084ui_story == nil then
				arg_347_1.var_.characterEffect1084ui_story = var_350_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_11 = 0.200000002980232

			if var_350_10 <= arg_347_1.time_ and arg_347_1.time_ < var_350_10 + var_350_11 then
				local var_350_12 = (arg_347_1.time_ - var_350_10) / var_350_11

				if arg_347_1.var_.characterEffect1084ui_story then
					arg_347_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_10 + var_350_11 and arg_347_1.time_ < var_350_10 + var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect1084ui_story then
				arg_347_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_350_13 = 0

			if var_350_13 < arg_347_1.time_ and arg_347_1.time_ <= var_350_13 + arg_350_0 then
				arg_347_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_350_14 = 0

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				arg_347_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_350_15 = 0
			local var_350_16 = 1.3

			if var_350_15 < arg_347_1.time_ and arg_347_1.time_ <= var_350_15 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_17 = arg_347_1:FormatText(StoryNameCfg[6].name)

				arg_347_1.leftNameTxt_.text = var_350_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_18 = arg_347_1:GetWordFromCfg(910601089)
				local var_350_19 = arg_347_1:FormatText(var_350_18.content)

				arg_347_1.text_.text = var_350_19

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_20 = 52
				local var_350_21 = utf8.len(var_350_19)
				local var_350_22 = var_350_20 <= 0 and var_350_16 or var_350_16 * (var_350_21 / var_350_20)

				if var_350_22 > 0 and var_350_16 < var_350_22 then
					arg_347_1.talkMaxDuration = var_350_22

					if var_350_22 + var_350_15 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_22 + var_350_15
					end
				end

				arg_347_1.text_.text = var_350_19
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601089", "story_v_out_910601.awb") ~= 0 then
					local var_350_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601089", "story_v_out_910601.awb") / 1000

					if var_350_23 + var_350_15 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_23 + var_350_15
					end

					if var_350_18.prefab_name ~= "" and arg_347_1.actors_[var_350_18.prefab_name] ~= nil then
						local var_350_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_18.prefab_name].transform, "story_v_out_910601", "910601089", "story_v_out_910601.awb")

						arg_347_1:RecordAudio("910601089", var_350_24)
						arg_347_1:RecordAudio("910601089", var_350_24)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_910601", "910601089", "story_v_out_910601.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_910601", "910601089", "story_v_out_910601.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_25 = math.max(var_350_16, arg_347_1.talkMaxDuration)

			if var_350_15 <= arg_347_1.time_ and arg_347_1.time_ < var_350_15 + var_350_25 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_15) / var_350_25

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_15 + var_350_25 and arg_347_1.time_ < var_350_15 + var_350_25 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play910601090 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 910601090
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play910601091(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1084ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect1084ui_story == nil then
				arg_351_1.var_.characterEffect1084ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.200000002980232

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect1084ui_story then
					local var_354_4 = Mathf.Lerp(0, 0.5, var_354_3)

					arg_351_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1084ui_story.fillRatio = var_354_4
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect1084ui_story then
				local var_354_5 = 0.5

				arg_351_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1084ui_story.fillRatio = var_354_5
			end

			local var_354_6 = 0
			local var_354_7 = 0.425

			if var_354_6 < arg_351_1.time_ and arg_351_1.time_ <= var_354_6 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_8 = arg_351_1:FormatText(StoryNameCfg[7].name)

				arg_351_1.leftNameTxt_.text = var_354_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_9 = arg_351_1:GetWordFromCfg(910601090)
				local var_354_10 = arg_351_1:FormatText(var_354_9.content)

				arg_351_1.text_.text = var_354_10

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_11 = 17
				local var_354_12 = utf8.len(var_354_10)
				local var_354_13 = var_354_11 <= 0 and var_354_7 or var_354_7 * (var_354_12 / var_354_11)

				if var_354_13 > 0 and var_354_7 < var_354_13 then
					arg_351_1.talkMaxDuration = var_354_13

					if var_354_13 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_13 + var_354_6
					end
				end

				arg_351_1.text_.text = var_354_10
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_14 = math.max(var_354_7, arg_351_1.talkMaxDuration)

			if var_354_6 <= arg_351_1.time_ and arg_351_1.time_ < var_354_6 + var_354_14 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_6) / var_354_14

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_6 + var_354_14 and arg_351_1.time_ < var_354_6 + var_354_14 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play910601091 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 910601091
		arg_355_1.duration_ = 6.833

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play910601092(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1084ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1084ui_story == nil then
				arg_355_1.var_.characterEffect1084ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1084ui_story then
					arg_355_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1084ui_story then
				arg_355_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_358_4 = 0
			local var_358_5 = 0.65

			if var_358_4 < arg_355_1.time_ and arg_355_1.time_ <= var_358_4 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_6 = arg_355_1:FormatText(StoryNameCfg[6].name)

				arg_355_1.leftNameTxt_.text = var_358_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_7 = arg_355_1:GetWordFromCfg(910601091)
				local var_358_8 = arg_355_1:FormatText(var_358_7.content)

				arg_355_1.text_.text = var_358_8

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_9 = 26
				local var_358_10 = utf8.len(var_358_8)
				local var_358_11 = var_358_9 <= 0 and var_358_5 or var_358_5 * (var_358_10 / var_358_9)

				if var_358_11 > 0 and var_358_5 < var_358_11 then
					arg_355_1.talkMaxDuration = var_358_11

					if var_358_11 + var_358_4 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_11 + var_358_4
					end
				end

				arg_355_1.text_.text = var_358_8
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601091", "story_v_out_910601.awb") ~= 0 then
					local var_358_12 = manager.audio:GetVoiceLength("story_v_out_910601", "910601091", "story_v_out_910601.awb") / 1000

					if var_358_12 + var_358_4 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_12 + var_358_4
					end

					if var_358_7.prefab_name ~= "" and arg_355_1.actors_[var_358_7.prefab_name] ~= nil then
						local var_358_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_7.prefab_name].transform, "story_v_out_910601", "910601091", "story_v_out_910601.awb")

						arg_355_1:RecordAudio("910601091", var_358_13)
						arg_355_1:RecordAudio("910601091", var_358_13)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_910601", "910601091", "story_v_out_910601.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_910601", "910601091", "story_v_out_910601.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_14 = math.max(var_358_5, arg_355_1.talkMaxDuration)

			if var_358_4 <= arg_355_1.time_ and arg_355_1.time_ < var_358_4 + var_358_14 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_4) / var_358_14

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_4 + var_358_14 and arg_355_1.time_ < var_358_4 + var_358_14 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play910601092 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 910601092
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play910601093(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1084ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1084ui_story == nil then
				arg_359_1.var_.characterEffect1084ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.200000002980232

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1084ui_story then
					local var_362_4 = Mathf.Lerp(0, 0.5, var_362_3)

					arg_359_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1084ui_story.fillRatio = var_362_4
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1084ui_story then
				local var_362_5 = 0.5

				arg_359_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1084ui_story.fillRatio = var_362_5
			end

			local var_362_6 = 0
			local var_362_7 = 0.5

			if var_362_6 < arg_359_1.time_ and arg_359_1.time_ <= var_362_6 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_8 = arg_359_1:FormatText(StoryNameCfg[7].name)

				arg_359_1.leftNameTxt_.text = var_362_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_9 = arg_359_1:GetWordFromCfg(910601092)
				local var_362_10 = arg_359_1:FormatText(var_362_9.content)

				arg_359_1.text_.text = var_362_10

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_11 = 20
				local var_362_12 = utf8.len(var_362_10)
				local var_362_13 = var_362_11 <= 0 and var_362_7 or var_362_7 * (var_362_12 / var_362_11)

				if var_362_13 > 0 and var_362_7 < var_362_13 then
					arg_359_1.talkMaxDuration = var_362_13

					if var_362_13 + var_362_6 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_13 + var_362_6
					end
				end

				arg_359_1.text_.text = var_362_10
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_14 = math.max(var_362_7, arg_359_1.talkMaxDuration)

			if var_362_6 <= arg_359_1.time_ and arg_359_1.time_ < var_362_6 + var_362_14 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_6) / var_362_14

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_6 + var_362_14 and arg_359_1.time_ < var_362_6 + var_362_14 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play910601093 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 910601093
		arg_363_1.duration_ = 4.633

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play910601094(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1084ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1084ui_story == nil then
				arg_363_1.var_.characterEffect1084ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1084ui_story then
					arg_363_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1084ui_story then
				arg_363_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_366_4 = 0

			if var_366_4 < arg_363_1.time_ and arg_363_1.time_ <= var_366_4 + arg_366_0 then
				arg_363_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action475")
			end

			local var_366_5 = 0

			if var_366_5 < arg_363_1.time_ and arg_363_1.time_ <= var_366_5 + arg_366_0 then
				arg_363_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_366_6 = 0
			local var_366_7 = 0.45

			if var_366_6 < arg_363_1.time_ and arg_363_1.time_ <= var_366_6 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_8 = arg_363_1:FormatText(StoryNameCfg[6].name)

				arg_363_1.leftNameTxt_.text = var_366_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_9 = arg_363_1:GetWordFromCfg(910601093)
				local var_366_10 = arg_363_1:FormatText(var_366_9.content)

				arg_363_1.text_.text = var_366_10

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_11 = 18
				local var_366_12 = utf8.len(var_366_10)
				local var_366_13 = var_366_11 <= 0 and var_366_7 or var_366_7 * (var_366_12 / var_366_11)

				if var_366_13 > 0 and var_366_7 < var_366_13 then
					arg_363_1.talkMaxDuration = var_366_13

					if var_366_13 + var_366_6 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_13 + var_366_6
					end
				end

				arg_363_1.text_.text = var_366_10
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601093", "story_v_out_910601.awb") ~= 0 then
					local var_366_14 = manager.audio:GetVoiceLength("story_v_out_910601", "910601093", "story_v_out_910601.awb") / 1000

					if var_366_14 + var_366_6 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_14 + var_366_6
					end

					if var_366_9.prefab_name ~= "" and arg_363_1.actors_[var_366_9.prefab_name] ~= nil then
						local var_366_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_9.prefab_name].transform, "story_v_out_910601", "910601093", "story_v_out_910601.awb")

						arg_363_1:RecordAudio("910601093", var_366_15)
						arg_363_1:RecordAudio("910601093", var_366_15)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_910601", "910601093", "story_v_out_910601.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_910601", "910601093", "story_v_out_910601.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_16 = math.max(var_366_7, arg_363_1.talkMaxDuration)

			if var_366_6 <= arg_363_1.time_ and arg_363_1.time_ < var_366_6 + var_366_16 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_6) / var_366_16

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_6 + var_366_16 and arg_363_1.time_ < var_366_6 + var_366_16 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play910601094 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 910601094
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play910601095(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1084ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.characterEffect1084ui_story == nil then
				arg_367_1.var_.characterEffect1084ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.200000002980232

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1084ui_story then
					local var_370_4 = Mathf.Lerp(0, 0.5, var_370_3)

					arg_367_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1084ui_story.fillRatio = var_370_4
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.characterEffect1084ui_story then
				local var_370_5 = 0.5

				arg_367_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1084ui_story.fillRatio = var_370_5
			end

			local var_370_6 = 0

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_370_7 = 0
			local var_370_8 = 0.625

			if var_370_7 < arg_367_1.time_ and arg_367_1.time_ <= var_370_7 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_9 = arg_367_1:FormatText(StoryNameCfg[7].name)

				arg_367_1.leftNameTxt_.text = var_370_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_10 = arg_367_1:GetWordFromCfg(910601094)
				local var_370_11 = arg_367_1:FormatText(var_370_10.content)

				arg_367_1.text_.text = var_370_11

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_12 = 25
				local var_370_13 = utf8.len(var_370_11)
				local var_370_14 = var_370_12 <= 0 and var_370_8 or var_370_8 * (var_370_13 / var_370_12)

				if var_370_14 > 0 and var_370_8 < var_370_14 then
					arg_367_1.talkMaxDuration = var_370_14

					if var_370_14 + var_370_7 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_14 + var_370_7
					end
				end

				arg_367_1.text_.text = var_370_11
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_15 = math.max(var_370_8, arg_367_1.talkMaxDuration)

			if var_370_7 <= arg_367_1.time_ and arg_367_1.time_ < var_370_7 + var_370_15 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_7) / var_370_15

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_7 + var_370_15 and arg_367_1.time_ < var_370_7 + var_370_15 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play910601095 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 910601095
		arg_371_1.duration_ = 3.833

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play910601096(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1011ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1011ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0.7, -0.71, -6)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1011ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = arg_371_1.actors_["1011ui_story"]
			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 and arg_371_1.var_.characterEffect1011ui_story == nil then
				arg_371_1.var_.characterEffect1011ui_story = var_374_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_11 = 0.200000002980232

			if var_374_10 <= arg_371_1.time_ and arg_371_1.time_ < var_374_10 + var_374_11 then
				local var_374_12 = (arg_371_1.time_ - var_374_10) / var_374_11

				if arg_371_1.var_.characterEffect1011ui_story then
					arg_371_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_10 + var_374_11 and arg_371_1.time_ < var_374_10 + var_374_11 + arg_374_0 and arg_371_1.var_.characterEffect1011ui_story then
				arg_371_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_374_13 = 0

			if var_374_13 < arg_371_1.time_ and arg_371_1.time_ <= var_374_13 + arg_374_0 then
				arg_371_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_374_14 = 0

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 then
				arg_371_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_374_15 = arg_371_1.actors_["1084ui_story"].transform
			local var_374_16 = 0

			if var_374_16 < arg_371_1.time_ and arg_371_1.time_ <= var_374_16 + arg_374_0 then
				arg_371_1.var_.moveOldPos1084ui_story = var_374_15.localPosition
			end

			local var_374_17 = 0.001

			if var_374_16 <= arg_371_1.time_ and arg_371_1.time_ < var_374_16 + var_374_17 then
				local var_374_18 = (arg_371_1.time_ - var_374_16) / var_374_17
				local var_374_19 = Vector3.New(-0.7, -0.97, -6)

				var_374_15.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1084ui_story, var_374_19, var_374_18)

				local var_374_20 = manager.ui.mainCamera.transform.position - var_374_15.position

				var_374_15.forward = Vector3.New(var_374_20.x, var_374_20.y, var_374_20.z)

				local var_374_21 = var_374_15.localEulerAngles

				var_374_21.z = 0
				var_374_21.x = 0
				var_374_15.localEulerAngles = var_374_21
			end

			if arg_371_1.time_ >= var_374_16 + var_374_17 and arg_371_1.time_ < var_374_16 + var_374_17 + arg_374_0 then
				var_374_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_374_22 = manager.ui.mainCamera.transform.position - var_374_15.position

				var_374_15.forward = Vector3.New(var_374_22.x, var_374_22.y, var_374_22.z)

				local var_374_23 = var_374_15.localEulerAngles

				var_374_23.z = 0
				var_374_23.x = 0
				var_374_15.localEulerAngles = var_374_23
			end

			local var_374_24 = arg_371_1.actors_["1084ui_story"]
			local var_374_25 = 0

			if var_374_25 < arg_371_1.time_ and arg_371_1.time_ <= var_374_25 + arg_374_0 and arg_371_1.var_.characterEffect1084ui_story == nil then
				arg_371_1.var_.characterEffect1084ui_story = var_374_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_26 = 0.200000002980232

			if var_374_25 <= arg_371_1.time_ and arg_371_1.time_ < var_374_25 + var_374_26 then
				local var_374_27 = (arg_371_1.time_ - var_374_25) / var_374_26

				if arg_371_1.var_.characterEffect1084ui_story then
					local var_374_28 = Mathf.Lerp(0, 0.5, var_374_27)

					arg_371_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_371_1.var_.characterEffect1084ui_story.fillRatio = var_374_28
				end
			end

			if arg_371_1.time_ >= var_374_25 + var_374_26 and arg_371_1.time_ < var_374_25 + var_374_26 + arg_374_0 and arg_371_1.var_.characterEffect1084ui_story then
				local var_374_29 = 0.5

				arg_371_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_371_1.var_.characterEffect1084ui_story.fillRatio = var_374_29
			end

			local var_374_30 = 0
			local var_374_31 = 0.425

			if var_374_30 < arg_371_1.time_ and arg_371_1.time_ <= var_374_30 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_32 = arg_371_1:FormatText(StoryNameCfg[37].name)

				arg_371_1.leftNameTxt_.text = var_374_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_33 = arg_371_1:GetWordFromCfg(910601095)
				local var_374_34 = arg_371_1:FormatText(var_374_33.content)

				arg_371_1.text_.text = var_374_34

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_35 = 17
				local var_374_36 = utf8.len(var_374_34)
				local var_374_37 = var_374_35 <= 0 and var_374_31 or var_374_31 * (var_374_36 / var_374_35)

				if var_374_37 > 0 and var_374_31 < var_374_37 then
					arg_371_1.talkMaxDuration = var_374_37

					if var_374_37 + var_374_30 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_37 + var_374_30
					end
				end

				arg_371_1.text_.text = var_374_34
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601095", "story_v_out_910601.awb") ~= 0 then
					local var_374_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601095", "story_v_out_910601.awb") / 1000

					if var_374_38 + var_374_30 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_38 + var_374_30
					end

					if var_374_33.prefab_name ~= "" and arg_371_1.actors_[var_374_33.prefab_name] ~= nil then
						local var_374_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_33.prefab_name].transform, "story_v_out_910601", "910601095", "story_v_out_910601.awb")

						arg_371_1:RecordAudio("910601095", var_374_39)
						arg_371_1:RecordAudio("910601095", var_374_39)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_910601", "910601095", "story_v_out_910601.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_910601", "910601095", "story_v_out_910601.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_40 = math.max(var_374_31, arg_371_1.talkMaxDuration)

			if var_374_30 <= arg_371_1.time_ and arg_371_1.time_ < var_374_30 + var_374_40 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_30) / var_374_40

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_30 + var_374_40 and arg_371_1.time_ < var_374_30 + var_374_40 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play910601096 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 910601096
		arg_375_1.duration_ = 4.3

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play910601097(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1084ui_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1084ui_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(-0.7, -0.97, -6)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1084ui_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["1084ui_story"]
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 and arg_375_1.var_.characterEffect1084ui_story == nil then
				arg_375_1.var_.characterEffect1084ui_story = var_378_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_11 = 0.200000002980232

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11

				if arg_375_1.var_.characterEffect1084ui_story then
					arg_375_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 and arg_375_1.var_.characterEffect1084ui_story then
				arg_375_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_378_13 = 0

			if var_378_13 < arg_375_1.time_ and arg_375_1.time_ <= var_378_13 + arg_378_0 then
				arg_375_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_378_15 = arg_375_1.actors_["1011ui_story"]
			local var_378_16 = 0

			if var_378_16 < arg_375_1.time_ and arg_375_1.time_ <= var_378_16 + arg_378_0 and arg_375_1.var_.characterEffect1011ui_story == nil then
				arg_375_1.var_.characterEffect1011ui_story = var_378_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_17 = 0.200000002980232

			if var_378_16 <= arg_375_1.time_ and arg_375_1.time_ < var_378_16 + var_378_17 then
				local var_378_18 = (arg_375_1.time_ - var_378_16) / var_378_17

				if arg_375_1.var_.characterEffect1011ui_story then
					local var_378_19 = Mathf.Lerp(0, 0.5, var_378_18)

					arg_375_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1011ui_story.fillRatio = var_378_19
				end
			end

			if arg_375_1.time_ >= var_378_16 + var_378_17 and arg_375_1.time_ < var_378_16 + var_378_17 + arg_378_0 and arg_375_1.var_.characterEffect1011ui_story then
				local var_378_20 = 0.5

				arg_375_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1011ui_story.fillRatio = var_378_20
			end

			local var_378_21 = 0
			local var_378_22 = 0.475

			if var_378_21 < arg_375_1.time_ and arg_375_1.time_ <= var_378_21 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_23 = arg_375_1:FormatText(StoryNameCfg[6].name)

				arg_375_1.leftNameTxt_.text = var_378_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_24 = arg_375_1:GetWordFromCfg(910601096)
				local var_378_25 = arg_375_1:FormatText(var_378_24.content)

				arg_375_1.text_.text = var_378_25

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_26 = 19
				local var_378_27 = utf8.len(var_378_25)
				local var_378_28 = var_378_26 <= 0 and var_378_22 or var_378_22 * (var_378_27 / var_378_26)

				if var_378_28 > 0 and var_378_22 < var_378_28 then
					arg_375_1.talkMaxDuration = var_378_28

					if var_378_28 + var_378_21 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_28 + var_378_21
					end
				end

				arg_375_1.text_.text = var_378_25
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601096", "story_v_out_910601.awb") ~= 0 then
					local var_378_29 = manager.audio:GetVoiceLength("story_v_out_910601", "910601096", "story_v_out_910601.awb") / 1000

					if var_378_29 + var_378_21 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_29 + var_378_21
					end

					if var_378_24.prefab_name ~= "" and arg_375_1.actors_[var_378_24.prefab_name] ~= nil then
						local var_378_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_24.prefab_name].transform, "story_v_out_910601", "910601096", "story_v_out_910601.awb")

						arg_375_1:RecordAudio("910601096", var_378_30)
						arg_375_1:RecordAudio("910601096", var_378_30)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_910601", "910601096", "story_v_out_910601.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_910601", "910601096", "story_v_out_910601.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_31 = math.max(var_378_22, arg_375_1.talkMaxDuration)

			if var_378_21 <= arg_375_1.time_ and arg_375_1.time_ < var_378_21 + var_378_31 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_21) / var_378_31

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_21 + var_378_31 and arg_375_1.time_ < var_378_21 + var_378_31 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play910601097 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 910601097
		arg_379_1.duration_ = 9

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play910601098(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 2

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				local var_382_1 = manager.ui.mainCamera.transform.localPosition
				local var_382_2 = Vector3.New(0, 0, 10) + Vector3.New(var_382_1.x, var_382_1.y, 0)
				local var_382_3 = arg_379_1.bgs_.STwhite

				var_382_3.transform.localPosition = var_382_2
				var_382_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_382_4 = var_382_3:GetComponent("SpriteRenderer")

				if var_382_4 and var_382_4.sprite then
					local var_382_5 = (var_382_3.transform.localPosition - var_382_1).z
					local var_382_6 = manager.ui.mainCameraCom_
					local var_382_7 = 2 * var_382_5 * Mathf.Tan(var_382_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_382_8 = var_382_7 * var_382_6.aspect
					local var_382_9 = var_382_4.sprite.bounds.size.x
					local var_382_10 = var_382_4.sprite.bounds.size.y
					local var_382_11 = var_382_8 / var_382_9
					local var_382_12 = var_382_7 / var_382_10
					local var_382_13 = var_382_12 < var_382_11 and var_382_11 or var_382_12

					var_382_3.transform.localScale = Vector3.New(var_382_13, var_382_13, 0)
				end

				for iter_382_0, iter_382_1 in pairs(arg_379_1.bgs_) do
					if iter_382_0 ~= "STwhite" then
						iter_382_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_382_14 = 0

			if var_382_14 < arg_379_1.time_ and arg_379_1.time_ <= var_382_14 + arg_382_0 then
				arg_379_1.mask_.enabled = true
				arg_379_1.mask_.raycastTarget = true

				arg_379_1:SetGaussion(false)
			end

			local var_382_15 = 2

			if var_382_14 <= arg_379_1.time_ and arg_379_1.time_ < var_382_14 + var_382_15 then
				local var_382_16 = (arg_379_1.time_ - var_382_14) / var_382_15
				local var_382_17 = Color.New(0, 0, 0)

				var_382_17.a = Mathf.Lerp(0, 1, var_382_16)
				arg_379_1.mask_.color = var_382_17
			end

			if arg_379_1.time_ >= var_382_14 + var_382_15 and arg_379_1.time_ < var_382_14 + var_382_15 + arg_382_0 then
				local var_382_18 = Color.New(0, 0, 0)

				var_382_18.a = 1
				arg_379_1.mask_.color = var_382_18
			end

			local var_382_19 = 2

			if var_382_19 < arg_379_1.time_ and arg_379_1.time_ <= var_382_19 + arg_382_0 then
				arg_379_1.mask_.enabled = true
				arg_379_1.mask_.raycastTarget = true

				arg_379_1:SetGaussion(false)
			end

			local var_382_20 = 2

			if var_382_19 <= arg_379_1.time_ and arg_379_1.time_ < var_382_19 + var_382_20 then
				local var_382_21 = (arg_379_1.time_ - var_382_19) / var_382_20
				local var_382_22 = Color.New(0, 0, 0)

				var_382_22.a = Mathf.Lerp(1, 0, var_382_21)
				arg_379_1.mask_.color = var_382_22
			end

			if arg_379_1.time_ >= var_382_19 + var_382_20 and arg_379_1.time_ < var_382_19 + var_382_20 + arg_382_0 then
				local var_382_23 = Color.New(0, 0, 0)
				local var_382_24 = 0

				arg_379_1.mask_.enabled = false
				var_382_23.a = var_382_24
				arg_379_1.mask_.color = var_382_23
			end

			local var_382_25 = arg_379_1.actors_["1011ui_story"].transform
			local var_382_26 = 2

			if var_382_26 < arg_379_1.time_ and arg_379_1.time_ <= var_382_26 + arg_382_0 then
				arg_379_1.var_.moveOldPos1011ui_story = var_382_25.localPosition
			end

			local var_382_27 = 0.001

			if var_382_26 <= arg_379_1.time_ and arg_379_1.time_ < var_382_26 + var_382_27 then
				local var_382_28 = (arg_379_1.time_ - var_382_26) / var_382_27
				local var_382_29 = Vector3.New(0, 100, 0)

				var_382_25.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1011ui_story, var_382_29, var_382_28)

				local var_382_30 = manager.ui.mainCamera.transform.position - var_382_25.position

				var_382_25.forward = Vector3.New(var_382_30.x, var_382_30.y, var_382_30.z)

				local var_382_31 = var_382_25.localEulerAngles

				var_382_31.z = 0
				var_382_31.x = 0
				var_382_25.localEulerAngles = var_382_31
			end

			if arg_379_1.time_ >= var_382_26 + var_382_27 and arg_379_1.time_ < var_382_26 + var_382_27 + arg_382_0 then
				var_382_25.localPosition = Vector3.New(0, 100, 0)

				local var_382_32 = manager.ui.mainCamera.transform.position - var_382_25.position

				var_382_25.forward = Vector3.New(var_382_32.x, var_382_32.y, var_382_32.z)

				local var_382_33 = var_382_25.localEulerAngles

				var_382_33.z = 0
				var_382_33.x = 0
				var_382_25.localEulerAngles = var_382_33
			end

			local var_382_34 = arg_379_1.actors_["1011ui_story"]
			local var_382_35 = 2

			if var_382_35 < arg_379_1.time_ and arg_379_1.time_ <= var_382_35 + arg_382_0 and arg_379_1.var_.characterEffect1011ui_story == nil then
				arg_379_1.var_.characterEffect1011ui_story = var_382_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_36 = 0.200000002980232

			if var_382_35 <= arg_379_1.time_ and arg_379_1.time_ < var_382_35 + var_382_36 then
				local var_382_37 = (arg_379_1.time_ - var_382_35) / var_382_36

				if arg_379_1.var_.characterEffect1011ui_story then
					local var_382_38 = Mathf.Lerp(0, 0.5, var_382_37)

					arg_379_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_379_1.var_.characterEffect1011ui_story.fillRatio = var_382_38
				end
			end

			if arg_379_1.time_ >= var_382_35 + var_382_36 and arg_379_1.time_ < var_382_35 + var_382_36 + arg_382_0 and arg_379_1.var_.characterEffect1011ui_story then
				local var_382_39 = 0.5

				arg_379_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_379_1.var_.characterEffect1011ui_story.fillRatio = var_382_39
			end

			local var_382_40 = arg_379_1.actors_["1084ui_story"].transform
			local var_382_41 = 2

			if var_382_41 < arg_379_1.time_ and arg_379_1.time_ <= var_382_41 + arg_382_0 then
				arg_379_1.var_.moveOldPos1084ui_story = var_382_40.localPosition
			end

			local var_382_42 = 0.001

			if var_382_41 <= arg_379_1.time_ and arg_379_1.time_ < var_382_41 + var_382_42 then
				local var_382_43 = (arg_379_1.time_ - var_382_41) / var_382_42
				local var_382_44 = Vector3.New(0, 100, 0)

				var_382_40.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1084ui_story, var_382_44, var_382_43)

				local var_382_45 = manager.ui.mainCamera.transform.position - var_382_40.position

				var_382_40.forward = Vector3.New(var_382_45.x, var_382_45.y, var_382_45.z)

				local var_382_46 = var_382_40.localEulerAngles

				var_382_46.z = 0
				var_382_46.x = 0
				var_382_40.localEulerAngles = var_382_46
			end

			if arg_379_1.time_ >= var_382_41 + var_382_42 and arg_379_1.time_ < var_382_41 + var_382_42 + arg_382_0 then
				var_382_40.localPosition = Vector3.New(0, 100, 0)

				local var_382_47 = manager.ui.mainCamera.transform.position - var_382_40.position

				var_382_40.forward = Vector3.New(var_382_47.x, var_382_47.y, var_382_47.z)

				local var_382_48 = var_382_40.localEulerAngles

				var_382_48.z = 0
				var_382_48.x = 0
				var_382_40.localEulerAngles = var_382_48
			end

			local var_382_49 = arg_379_1.actors_["1084ui_story"]
			local var_382_50 = 2

			if var_382_50 < arg_379_1.time_ and arg_379_1.time_ <= var_382_50 + arg_382_0 and arg_379_1.var_.characterEffect1084ui_story == nil then
				arg_379_1.var_.characterEffect1084ui_story = var_382_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_51 = 0.200000002980232

			if var_382_50 <= arg_379_1.time_ and arg_379_1.time_ < var_382_50 + var_382_51 then
				local var_382_52 = (arg_379_1.time_ - var_382_50) / var_382_51

				if arg_379_1.var_.characterEffect1084ui_story then
					local var_382_53 = Mathf.Lerp(0, 0.5, var_382_52)

					arg_379_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_379_1.var_.characterEffect1084ui_story.fillRatio = var_382_53
				end
			end

			if arg_379_1.time_ >= var_382_50 + var_382_51 and arg_379_1.time_ < var_382_50 + var_382_51 + arg_382_0 and arg_379_1.var_.characterEffect1084ui_story then
				local var_382_54 = 0.5

				arg_379_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_379_1.var_.characterEffect1084ui_story.fillRatio = var_382_54
			end

			if arg_379_1.frameCnt_ <= 1 then
				arg_379_1.dialog_:SetActive(false)
			end

			local var_382_55 = 4
			local var_382_56 = 0.05

			if var_382_55 < arg_379_1.time_ and arg_379_1.time_ <= var_382_55 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0

				arg_379_1.dialog_:SetActive(true)

				local var_382_57 = LeanTween.value(arg_379_1.dialog_, 0, 1, 0.3)

				var_382_57:setOnUpdate(LuaHelper.FloatAction(function(arg_383_0)
					arg_379_1.dialogCg_.alpha = arg_383_0
				end))
				var_382_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_379_1.dialog_)
					var_382_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_379_1.duration_ = arg_379_1.duration_ + 0.3

				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_58 = arg_379_1:GetWordFromCfg(910601097)
				local var_382_59 = arg_379_1:FormatText(var_382_58.content)

				arg_379_1.text_.text = var_382_59

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_60 = 2
				local var_382_61 = utf8.len(var_382_59)
				local var_382_62 = var_382_60 <= 0 and var_382_56 or var_382_56 * (var_382_61 / var_382_60)

				if var_382_62 > 0 and var_382_56 < var_382_62 then
					arg_379_1.talkMaxDuration = var_382_62
					var_382_55 = var_382_55 + 0.3

					if var_382_62 + var_382_55 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_62 + var_382_55
					end
				end

				arg_379_1.text_.text = var_382_59
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_63 = var_382_55 + 0.3
			local var_382_64 = math.max(var_382_56, arg_379_1.talkMaxDuration)

			if var_382_63 <= arg_379_1.time_ and arg_379_1.time_ < var_382_63 + var_382_64 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_63) / var_382_64

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_63 + var_382_64 and arg_379_1.time_ < var_382_63 + var_382_64 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play910601098 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 910601098
		arg_385_1.duration_ = 9

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play910601099(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = "ST60"

			if arg_385_1.bgs_[var_388_0] == nil then
				local var_388_1 = Object.Instantiate(arg_385_1.paintGo_)

				var_388_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_388_0)
				var_388_1.name = var_388_0
				var_388_1.transform.parent = arg_385_1.stage_.transform
				var_388_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_385_1.bgs_[var_388_0] = var_388_1
			end

			local var_388_2 = 2

			if var_388_2 < arg_385_1.time_ and arg_385_1.time_ <= var_388_2 + arg_388_0 then
				local var_388_3 = manager.ui.mainCamera.transform.localPosition
				local var_388_4 = Vector3.New(0, 0, 10) + Vector3.New(var_388_3.x, var_388_3.y, 0)
				local var_388_5 = arg_385_1.bgs_.ST60

				var_388_5.transform.localPosition = var_388_4
				var_388_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_388_6 = var_388_5:GetComponent("SpriteRenderer")

				if var_388_6 and var_388_6.sprite then
					local var_388_7 = (var_388_5.transform.localPosition - var_388_3).z
					local var_388_8 = manager.ui.mainCameraCom_
					local var_388_9 = 2 * var_388_7 * Mathf.Tan(var_388_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_388_10 = var_388_9 * var_388_8.aspect
					local var_388_11 = var_388_6.sprite.bounds.size.x
					local var_388_12 = var_388_6.sprite.bounds.size.y
					local var_388_13 = var_388_10 / var_388_11
					local var_388_14 = var_388_9 / var_388_12
					local var_388_15 = var_388_14 < var_388_13 and var_388_13 or var_388_14

					var_388_5.transform.localScale = Vector3.New(var_388_15, var_388_15, 0)
				end

				for iter_388_0, iter_388_1 in pairs(arg_385_1.bgs_) do
					if iter_388_0 ~= "ST60" then
						iter_388_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_388_16 = 0

			if var_388_16 < arg_385_1.time_ and arg_385_1.time_ <= var_388_16 + arg_388_0 then
				arg_385_1.mask_.enabled = true
				arg_385_1.mask_.raycastTarget = true

				arg_385_1:SetGaussion(false)
			end

			local var_388_17 = 2

			if var_388_16 <= arg_385_1.time_ and arg_385_1.time_ < var_388_16 + var_388_17 then
				local var_388_18 = (arg_385_1.time_ - var_388_16) / var_388_17
				local var_388_19 = Color.New(0, 0, 0)

				var_388_19.a = Mathf.Lerp(0, 1, var_388_18)
				arg_385_1.mask_.color = var_388_19
			end

			if arg_385_1.time_ >= var_388_16 + var_388_17 and arg_385_1.time_ < var_388_16 + var_388_17 + arg_388_0 then
				local var_388_20 = Color.New(0, 0, 0)

				var_388_20.a = 1
				arg_385_1.mask_.color = var_388_20
			end

			local var_388_21 = 2

			if var_388_21 < arg_385_1.time_ and arg_385_1.time_ <= var_388_21 + arg_388_0 then
				arg_385_1.mask_.enabled = true
				arg_385_1.mask_.raycastTarget = true

				arg_385_1:SetGaussion(false)
			end

			local var_388_22 = 2

			if var_388_21 <= arg_385_1.time_ and arg_385_1.time_ < var_388_21 + var_388_22 then
				local var_388_23 = (arg_385_1.time_ - var_388_21) / var_388_22
				local var_388_24 = Color.New(0, 0, 0)

				var_388_24.a = Mathf.Lerp(1, 0, var_388_23)
				arg_385_1.mask_.color = var_388_24
			end

			if arg_385_1.time_ >= var_388_21 + var_388_22 and arg_385_1.time_ < var_388_21 + var_388_22 + arg_388_0 then
				local var_388_25 = Color.New(0, 0, 0)
				local var_388_26 = 0

				arg_385_1.mask_.enabled = false
				var_388_25.a = var_388_26
				arg_385_1.mask_.color = var_388_25
			end

			if arg_385_1.frameCnt_ <= 1 then
				arg_385_1.dialog_:SetActive(false)
			end

			local var_388_27 = 4
			local var_388_28 = 1.225

			if var_388_27 < arg_385_1.time_ and arg_385_1.time_ <= var_388_27 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0

				arg_385_1.dialog_:SetActive(true)

				local var_388_29 = LeanTween.value(arg_385_1.dialog_, 0, 1, 0.3)

				var_388_29:setOnUpdate(LuaHelper.FloatAction(function(arg_389_0)
					arg_385_1.dialogCg_.alpha = arg_389_0
				end))
				var_388_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_385_1.dialog_)
					var_388_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_385_1.duration_ = arg_385_1.duration_ + 0.3

				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_30 = arg_385_1:GetWordFromCfg(910601098)
				local var_388_31 = arg_385_1:FormatText(var_388_30.content)

				arg_385_1.text_.text = var_388_31

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_32 = 49
				local var_388_33 = utf8.len(var_388_31)
				local var_388_34 = var_388_32 <= 0 and var_388_28 or var_388_28 * (var_388_33 / var_388_32)

				if var_388_34 > 0 and var_388_28 < var_388_34 then
					arg_385_1.talkMaxDuration = var_388_34
					var_388_27 = var_388_27 + 0.3

					if var_388_34 + var_388_27 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_34 + var_388_27
					end
				end

				arg_385_1.text_.text = var_388_31
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_35 = var_388_27 + 0.3
			local var_388_36 = math.max(var_388_28, arg_385_1.talkMaxDuration)

			if var_388_35 <= arg_385_1.time_ and arg_385_1.time_ < var_388_35 + var_388_36 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_35) / var_388_36

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_35 + var_388_36 and arg_385_1.time_ < var_388_35 + var_388_36 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play910601099 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 910601099
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play910601100(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0
			local var_394_1 = 0.5

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_2 = arg_391_1:FormatText(StoryNameCfg[7].name)

				arg_391_1.leftNameTxt_.text = var_394_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_3 = arg_391_1:GetWordFromCfg(910601099)
				local var_394_4 = arg_391_1:FormatText(var_394_3.content)

				arg_391_1.text_.text = var_394_4

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_5 = 20
				local var_394_6 = utf8.len(var_394_4)
				local var_394_7 = var_394_5 <= 0 and var_394_1 or var_394_1 * (var_394_6 / var_394_5)

				if var_394_7 > 0 and var_394_1 < var_394_7 then
					arg_391_1.talkMaxDuration = var_394_7

					if var_394_7 + var_394_0 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_7 + var_394_0
					end
				end

				arg_391_1.text_.text = var_394_4
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_8 = math.max(var_394_1, arg_391_1.talkMaxDuration)

			if var_394_0 <= arg_391_1.time_ and arg_391_1.time_ < var_394_0 + var_394_8 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_0) / var_394_8

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_0 + var_394_8 and arg_391_1.time_ < var_394_0 + var_394_8 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play910601100 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 910601100
		arg_395_1.duration_ = 1.999999999999

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play910601101(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 0

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				arg_395_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_398_2 = arg_395_1.actors_["1084ui_story"]
			local var_398_3 = 0

			if var_398_3 < arg_395_1.time_ and arg_395_1.time_ <= var_398_3 + arg_398_0 and arg_395_1.var_.characterEffect1084ui_story == nil then
				arg_395_1.var_.characterEffect1084ui_story = var_398_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_4 = 0.200000002980232

			if var_398_3 <= arg_395_1.time_ and arg_395_1.time_ < var_398_3 + var_398_4 then
				local var_398_5 = (arg_395_1.time_ - var_398_3) / var_398_4

				if arg_395_1.var_.characterEffect1084ui_story then
					arg_395_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_395_1.time_ >= var_398_3 + var_398_4 and arg_395_1.time_ < var_398_3 + var_398_4 + arg_398_0 and arg_395_1.var_.characterEffect1084ui_story then
				arg_395_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_398_6 = arg_395_1.actors_["1084ui_story"].transform
			local var_398_7 = 0

			if var_398_7 < arg_395_1.time_ and arg_395_1.time_ <= var_398_7 + arg_398_0 then
				arg_395_1.var_.moveOldPos1084ui_story = var_398_6.localPosition
			end

			local var_398_8 = 0.001

			if var_398_7 <= arg_395_1.time_ and arg_395_1.time_ < var_398_7 + var_398_8 then
				local var_398_9 = (arg_395_1.time_ - var_398_7) / var_398_8
				local var_398_10 = Vector3.New(0, -0.97, -6)

				var_398_6.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1084ui_story, var_398_10, var_398_9)

				local var_398_11 = manager.ui.mainCamera.transform.position - var_398_6.position

				var_398_6.forward = Vector3.New(var_398_11.x, var_398_11.y, var_398_11.z)

				local var_398_12 = var_398_6.localEulerAngles

				var_398_12.z = 0
				var_398_12.x = 0
				var_398_6.localEulerAngles = var_398_12
			end

			if arg_395_1.time_ >= var_398_7 + var_398_8 and arg_395_1.time_ < var_398_7 + var_398_8 + arg_398_0 then
				var_398_6.localPosition = Vector3.New(0, -0.97, -6)

				local var_398_13 = manager.ui.mainCamera.transform.position - var_398_6.position

				var_398_6.forward = Vector3.New(var_398_13.x, var_398_13.y, var_398_13.z)

				local var_398_14 = var_398_6.localEulerAngles

				var_398_14.z = 0
				var_398_14.x = 0
				var_398_6.localEulerAngles = var_398_14
			end

			local var_398_15 = 0
			local var_398_16 = 0.2

			if var_398_15 < arg_395_1.time_ and arg_395_1.time_ <= var_398_15 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_17 = arg_395_1:FormatText(StoryNameCfg[6].name)

				arg_395_1.leftNameTxt_.text = var_398_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_18 = arg_395_1:GetWordFromCfg(910601100)
				local var_398_19 = arg_395_1:FormatText(var_398_18.content)

				arg_395_1.text_.text = var_398_19

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_20 = 8
				local var_398_21 = utf8.len(var_398_19)
				local var_398_22 = var_398_20 <= 0 and var_398_16 or var_398_16 * (var_398_21 / var_398_20)

				if var_398_22 > 0 and var_398_16 < var_398_22 then
					arg_395_1.talkMaxDuration = var_398_22

					if var_398_22 + var_398_15 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_22 + var_398_15
					end
				end

				arg_395_1.text_.text = var_398_19
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601100", "story_v_out_910601.awb") ~= 0 then
					local var_398_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601100", "story_v_out_910601.awb") / 1000

					if var_398_23 + var_398_15 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_23 + var_398_15
					end

					if var_398_18.prefab_name ~= "" and arg_395_1.actors_[var_398_18.prefab_name] ~= nil then
						local var_398_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_18.prefab_name].transform, "story_v_out_910601", "910601100", "story_v_out_910601.awb")

						arg_395_1:RecordAudio("910601100", var_398_24)
						arg_395_1:RecordAudio("910601100", var_398_24)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_910601", "910601100", "story_v_out_910601.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_910601", "910601100", "story_v_out_910601.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_25 = math.max(var_398_16, arg_395_1.talkMaxDuration)

			if var_398_15 <= arg_395_1.time_ and arg_395_1.time_ < var_398_15 + var_398_25 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_15) / var_398_25

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_15 + var_398_25 and arg_395_1.time_ < var_398_15 + var_398_25 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play910601101 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 910601101
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play910601102(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1084ui_story"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and arg_399_1.var_.characterEffect1084ui_story == nil then
				arg_399_1.var_.characterEffect1084ui_story = var_402_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_2 = 0.200000002980232

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.characterEffect1084ui_story then
					local var_402_4 = Mathf.Lerp(0, 0.5, var_402_3)

					arg_399_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_399_1.var_.characterEffect1084ui_story.fillRatio = var_402_4
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and arg_399_1.var_.characterEffect1084ui_story then
				local var_402_5 = 0.5

				arg_399_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_399_1.var_.characterEffect1084ui_story.fillRatio = var_402_5
			end

			local var_402_6 = 0
			local var_402_7 = 0.575

			if var_402_6 < arg_399_1.time_ and arg_399_1.time_ <= var_402_6 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_8 = arg_399_1:FormatText(StoryNameCfg[7].name)

				arg_399_1.leftNameTxt_.text = var_402_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_9 = arg_399_1:GetWordFromCfg(910601101)
				local var_402_10 = arg_399_1:FormatText(var_402_9.content)

				arg_399_1.text_.text = var_402_10

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_11 = 23
				local var_402_12 = utf8.len(var_402_10)
				local var_402_13 = var_402_11 <= 0 and var_402_7 or var_402_7 * (var_402_12 / var_402_11)

				if var_402_13 > 0 and var_402_7 < var_402_13 then
					arg_399_1.talkMaxDuration = var_402_13

					if var_402_13 + var_402_6 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_13 + var_402_6
					end
				end

				arg_399_1.text_.text = var_402_10
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_14 = math.max(var_402_7, arg_399_1.talkMaxDuration)

			if var_402_6 <= arg_399_1.time_ and arg_399_1.time_ < var_402_6 + var_402_14 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_6) / var_402_14

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_6 + var_402_14 and arg_399_1.time_ < var_402_6 + var_402_14 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play910601102 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 910601102
		arg_403_1.duration_ = 7.766

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play910601103(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1084ui_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos1084ui_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(0, 100, 0)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1084ui_story, var_406_4, var_406_3)

				local var_406_5 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_5.x, var_406_5.y, var_406_5.z)

				local var_406_6 = var_406_0.localEulerAngles

				var_406_6.z = 0
				var_406_6.x = 0
				var_406_0.localEulerAngles = var_406_6
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(0, 100, 0)

				local var_406_7 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_7.x, var_406_7.y, var_406_7.z)

				local var_406_8 = var_406_0.localEulerAngles

				var_406_8.z = 0
				var_406_8.x = 0
				var_406_0.localEulerAngles = var_406_8
			end

			local var_406_9 = "1027ui_story"

			if arg_403_1.actors_[var_406_9] == nil then
				local var_406_10 = Object.Instantiate(Asset.Load("Char/" .. var_406_9), arg_403_1.stage_.transform)

				var_406_10.name = var_406_9
				var_406_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_403_1.actors_[var_406_9] = var_406_10

				local var_406_11 = var_406_10:GetComponentInChildren(typeof(CharacterEffect))

				var_406_11.enabled = true

				local var_406_12 = GameObjectTools.GetOrAddComponent(var_406_10, typeof(DynamicBoneHelper))

				if var_406_12 then
					var_406_12:EnableDynamicBone(false)
				end

				arg_403_1:ShowWeapon(var_406_11.transform, false)

				arg_403_1.var_[var_406_9 .. "Animator"] = var_406_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_403_1.var_[var_406_9 .. "Animator"].applyRootMotion = true
				arg_403_1.var_[var_406_9 .. "LipSync"] = var_406_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_406_13 = arg_403_1.actors_["1027ui_story"]
			local var_406_14 = 0

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 and arg_403_1.var_.characterEffect1027ui_story == nil then
				arg_403_1.var_.characterEffect1027ui_story = var_406_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_15 = 0.200000002980232

			if var_406_14 <= arg_403_1.time_ and arg_403_1.time_ < var_406_14 + var_406_15 then
				local var_406_16 = (arg_403_1.time_ - var_406_14) / var_406_15

				if arg_403_1.var_.characterEffect1027ui_story then
					arg_403_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_403_1.time_ >= var_406_14 + var_406_15 and arg_403_1.time_ < var_406_14 + var_406_15 + arg_406_0 and arg_403_1.var_.characterEffect1027ui_story then
				arg_403_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_406_17 = "1080ui_story"

			if arg_403_1.actors_[var_406_17] == nil then
				local var_406_18 = Object.Instantiate(Asset.Load("Char/" .. var_406_17), arg_403_1.stage_.transform)

				var_406_18.name = var_406_17
				var_406_18.transform.localPosition = Vector3.New(0, 100, 0)
				arg_403_1.actors_[var_406_17] = var_406_18

				local var_406_19 = var_406_18:GetComponentInChildren(typeof(CharacterEffect))

				var_406_19.enabled = true

				local var_406_20 = GameObjectTools.GetOrAddComponent(var_406_18, typeof(DynamicBoneHelper))

				if var_406_20 then
					var_406_20:EnableDynamicBone(false)
				end

				arg_403_1:ShowWeapon(var_406_19.transform, false)

				arg_403_1.var_[var_406_17 .. "Animator"] = var_406_19.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_403_1.var_[var_406_17 .. "Animator"].applyRootMotion = true
				arg_403_1.var_[var_406_17 .. "LipSync"] = var_406_19.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_406_21 = 0

			if var_406_21 < arg_403_1.time_ and arg_403_1.time_ <= var_406_21 + arg_406_0 then
				arg_403_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_406_22 = 0

			if var_406_22 < arg_403_1.time_ and arg_403_1.time_ <= var_406_22 + arg_406_0 then
				arg_403_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_406_23 = arg_403_1.actors_["1080ui_story"]
			local var_406_24 = 0

			if var_406_24 < arg_403_1.time_ and arg_403_1.time_ <= var_406_24 + arg_406_0 and arg_403_1.var_.characterEffect1080ui_story == nil then
				arg_403_1.var_.characterEffect1080ui_story = var_406_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_25 = 0.200000002980232

			if var_406_24 <= arg_403_1.time_ and arg_403_1.time_ < var_406_24 + var_406_25 then
				local var_406_26 = (arg_403_1.time_ - var_406_24) / var_406_25

				if arg_403_1.var_.characterEffect1080ui_story then
					local var_406_27 = Mathf.Lerp(0, 0.5, var_406_26)

					arg_403_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1080ui_story.fillRatio = var_406_27
				end
			end

			if arg_403_1.time_ >= var_406_24 + var_406_25 and arg_403_1.time_ < var_406_24 + var_406_25 + arg_406_0 and arg_403_1.var_.characterEffect1080ui_story then
				local var_406_28 = 0.5

				arg_403_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1080ui_story.fillRatio = var_406_28
			end

			local var_406_29 = 0

			if var_406_29 < arg_403_1.time_ and arg_403_1.time_ <= var_406_29 + arg_406_0 then
				arg_403_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_406_30 = 0

			if var_406_30 < arg_403_1.time_ and arg_403_1.time_ <= var_406_30 + arg_406_0 then
				arg_403_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_406_31 = arg_403_1.actors_["1027ui_story"].transform
			local var_406_32 = 0

			if var_406_32 < arg_403_1.time_ and arg_403_1.time_ <= var_406_32 + arg_406_0 then
				arg_403_1.var_.moveOldPos1027ui_story = var_406_31.localPosition
			end

			local var_406_33 = 0.001

			if var_406_32 <= arg_403_1.time_ and arg_403_1.time_ < var_406_32 + var_406_33 then
				local var_406_34 = (arg_403_1.time_ - var_406_32) / var_406_33
				local var_406_35 = Vector3.New(0.7, -0.81, -5.8)

				var_406_31.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1027ui_story, var_406_35, var_406_34)

				local var_406_36 = manager.ui.mainCamera.transform.position - var_406_31.position

				var_406_31.forward = Vector3.New(var_406_36.x, var_406_36.y, var_406_36.z)

				local var_406_37 = var_406_31.localEulerAngles

				var_406_37.z = 0
				var_406_37.x = 0
				var_406_31.localEulerAngles = var_406_37
			end

			if arg_403_1.time_ >= var_406_32 + var_406_33 and arg_403_1.time_ < var_406_32 + var_406_33 + arg_406_0 then
				var_406_31.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_406_38 = manager.ui.mainCamera.transform.position - var_406_31.position

				var_406_31.forward = Vector3.New(var_406_38.x, var_406_38.y, var_406_38.z)

				local var_406_39 = var_406_31.localEulerAngles

				var_406_39.z = 0
				var_406_39.x = 0
				var_406_31.localEulerAngles = var_406_39
			end

			local var_406_40 = arg_403_1.actors_["1080ui_story"].transform
			local var_406_41 = 0

			if var_406_41 < arg_403_1.time_ and arg_403_1.time_ <= var_406_41 + arg_406_0 then
				arg_403_1.var_.moveOldPos1080ui_story = var_406_40.localPosition

				local var_406_42 = "1080ui_story"

				arg_403_1:ShowWeapon(arg_403_1.var_[var_406_42 .. "Animator"].transform, false)
			end

			local var_406_43 = 0.001

			if var_406_41 <= arg_403_1.time_ and arg_403_1.time_ < var_406_41 + var_406_43 then
				local var_406_44 = (arg_403_1.time_ - var_406_41) / var_406_43
				local var_406_45 = Vector3.New(-0.7, -1.01, -6.05)

				var_406_40.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1080ui_story, var_406_45, var_406_44)

				local var_406_46 = manager.ui.mainCamera.transform.position - var_406_40.position

				var_406_40.forward = Vector3.New(var_406_46.x, var_406_46.y, var_406_46.z)

				local var_406_47 = var_406_40.localEulerAngles

				var_406_47.z = 0
				var_406_47.x = 0
				var_406_40.localEulerAngles = var_406_47
			end

			if arg_403_1.time_ >= var_406_41 + var_406_43 and arg_403_1.time_ < var_406_41 + var_406_43 + arg_406_0 then
				var_406_40.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_406_48 = manager.ui.mainCamera.transform.position - var_406_40.position

				var_406_40.forward = Vector3.New(var_406_48.x, var_406_48.y, var_406_48.z)

				local var_406_49 = var_406_40.localEulerAngles

				var_406_49.z = 0
				var_406_49.x = 0
				var_406_40.localEulerAngles = var_406_49
			end

			local var_406_50 = 0
			local var_406_51 = 0.825

			if var_406_50 < arg_403_1.time_ and arg_403_1.time_ <= var_406_50 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_52 = arg_403_1:FormatText(StoryNameCfg[56].name)

				arg_403_1.leftNameTxt_.text = var_406_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_53 = arg_403_1:GetWordFromCfg(910601102)
				local var_406_54 = arg_403_1:FormatText(var_406_53.content)

				arg_403_1.text_.text = var_406_54

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_55 = 33
				local var_406_56 = utf8.len(var_406_54)
				local var_406_57 = var_406_55 <= 0 and var_406_51 or var_406_51 * (var_406_56 / var_406_55)

				if var_406_57 > 0 and var_406_51 < var_406_57 then
					arg_403_1.talkMaxDuration = var_406_57

					if var_406_57 + var_406_50 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_57 + var_406_50
					end
				end

				arg_403_1.text_.text = var_406_54
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601102", "story_v_out_910601.awb") ~= 0 then
					local var_406_58 = manager.audio:GetVoiceLength("story_v_out_910601", "910601102", "story_v_out_910601.awb") / 1000

					if var_406_58 + var_406_50 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_58 + var_406_50
					end

					if var_406_53.prefab_name ~= "" and arg_403_1.actors_[var_406_53.prefab_name] ~= nil then
						local var_406_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_53.prefab_name].transform, "story_v_out_910601", "910601102", "story_v_out_910601.awb")

						arg_403_1:RecordAudio("910601102", var_406_59)
						arg_403_1:RecordAudio("910601102", var_406_59)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_910601", "910601102", "story_v_out_910601.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_910601", "910601102", "story_v_out_910601.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_60 = math.max(var_406_51, arg_403_1.talkMaxDuration)

			if var_406_50 <= arg_403_1.time_ and arg_403_1.time_ < var_406_50 + var_406_60 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_50) / var_406_60

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_50 + var_406_60 and arg_403_1.time_ < var_406_50 + var_406_60 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play910601103 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 910601103
		arg_407_1.duration_ = 2.733

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play910601104(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1080ui_story"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.characterEffect1080ui_story == nil then
				arg_407_1.var_.characterEffect1080ui_story = var_410_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_2 = 0.200000002980232

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.characterEffect1080ui_story then
					arg_407_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.characterEffect1080ui_story then
				arg_407_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_410_4 = arg_407_1.actors_["1027ui_story"]
			local var_410_5 = 0

			if var_410_5 < arg_407_1.time_ and arg_407_1.time_ <= var_410_5 + arg_410_0 and arg_407_1.var_.characterEffect1027ui_story == nil then
				arg_407_1.var_.characterEffect1027ui_story = var_410_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_6 = 0.200000002980232

			if var_410_5 <= arg_407_1.time_ and arg_407_1.time_ < var_410_5 + var_410_6 then
				local var_410_7 = (arg_407_1.time_ - var_410_5) / var_410_6

				if arg_407_1.var_.characterEffect1027ui_story then
					local var_410_8 = Mathf.Lerp(0, 0.5, var_410_7)

					arg_407_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1027ui_story.fillRatio = var_410_8
				end
			end

			if arg_407_1.time_ >= var_410_5 + var_410_6 and arg_407_1.time_ < var_410_5 + var_410_6 + arg_410_0 and arg_407_1.var_.characterEffect1027ui_story then
				local var_410_9 = 0.5

				arg_407_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1027ui_story.fillRatio = var_410_9
			end

			local var_410_10 = 0
			local var_410_11 = 0.275

			if var_410_10 < arg_407_1.time_ and arg_407_1.time_ <= var_410_10 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_12 = arg_407_1:FormatText(StoryNameCfg[55].name)

				arg_407_1.leftNameTxt_.text = var_410_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_13 = arg_407_1:GetWordFromCfg(910601103)
				local var_410_14 = arg_407_1:FormatText(var_410_13.content)

				arg_407_1.text_.text = var_410_14

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_15 = 11
				local var_410_16 = utf8.len(var_410_14)
				local var_410_17 = var_410_15 <= 0 and var_410_11 or var_410_11 * (var_410_16 / var_410_15)

				if var_410_17 > 0 and var_410_11 < var_410_17 then
					arg_407_1.talkMaxDuration = var_410_17

					if var_410_17 + var_410_10 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_17 + var_410_10
					end
				end

				arg_407_1.text_.text = var_410_14
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601103", "story_v_out_910601.awb") ~= 0 then
					local var_410_18 = manager.audio:GetVoiceLength("story_v_out_910601", "910601103", "story_v_out_910601.awb") / 1000

					if var_410_18 + var_410_10 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_18 + var_410_10
					end

					if var_410_13.prefab_name ~= "" and arg_407_1.actors_[var_410_13.prefab_name] ~= nil then
						local var_410_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_13.prefab_name].transform, "story_v_out_910601", "910601103", "story_v_out_910601.awb")

						arg_407_1:RecordAudio("910601103", var_410_19)
						arg_407_1:RecordAudio("910601103", var_410_19)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_910601", "910601103", "story_v_out_910601.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_910601", "910601103", "story_v_out_910601.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_20 = math.max(var_410_11, arg_407_1.talkMaxDuration)

			if var_410_10 <= arg_407_1.time_ and arg_407_1.time_ < var_410_10 + var_410_20 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_10) / var_410_20

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_10 + var_410_20 and arg_407_1.time_ < var_410_10 + var_410_20 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play910601104 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 910601104
		arg_411_1.duration_ = 3.066

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play910601105(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1027ui_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos1027ui_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(0, 100, 0)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1027ui_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(0, 100, 0)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = arg_411_1.actors_["1080ui_story"].transform
			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 then
				arg_411_1.var_.moveOldPos1080ui_story = var_414_9.localPosition

				local var_414_11 = "1080ui_story"

				arg_411_1:ShowWeapon(arg_411_1.var_[var_414_11 .. "Animator"].transform, false)
			end

			local var_414_12 = 0.001

			if var_414_10 <= arg_411_1.time_ and arg_411_1.time_ < var_414_10 + var_414_12 then
				local var_414_13 = (arg_411_1.time_ - var_414_10) / var_414_12
				local var_414_14 = Vector3.New(0, 100, 0)

				var_414_9.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1080ui_story, var_414_14, var_414_13)

				local var_414_15 = manager.ui.mainCamera.transform.position - var_414_9.position

				var_414_9.forward = Vector3.New(var_414_15.x, var_414_15.y, var_414_15.z)

				local var_414_16 = var_414_9.localEulerAngles

				var_414_16.z = 0
				var_414_16.x = 0
				var_414_9.localEulerAngles = var_414_16
			end

			if arg_411_1.time_ >= var_414_10 + var_414_12 and arg_411_1.time_ < var_414_10 + var_414_12 + arg_414_0 then
				var_414_9.localPosition = Vector3.New(0, 100, 0)

				local var_414_17 = manager.ui.mainCamera.transform.position - var_414_9.position

				var_414_9.forward = Vector3.New(var_414_17.x, var_414_17.y, var_414_17.z)

				local var_414_18 = var_414_9.localEulerAngles

				var_414_18.z = 0
				var_414_18.x = 0
				var_414_9.localEulerAngles = var_414_18
			end

			local var_414_19 = arg_411_1.actors_["1059ui_story"].transform
			local var_414_20 = 0

			if var_414_20 < arg_411_1.time_ and arg_411_1.time_ <= var_414_20 + arg_414_0 then
				arg_411_1.var_.moveOldPos1059ui_story = var_414_19.localPosition
			end

			local var_414_21 = 0.001

			if var_414_20 <= arg_411_1.time_ and arg_411_1.time_ < var_414_20 + var_414_21 then
				local var_414_22 = (arg_411_1.time_ - var_414_20) / var_414_21
				local var_414_23 = Vector3.New(0, -1.05, -6)

				var_414_19.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1059ui_story, var_414_23, var_414_22)

				local var_414_24 = manager.ui.mainCamera.transform.position - var_414_19.position

				var_414_19.forward = Vector3.New(var_414_24.x, var_414_24.y, var_414_24.z)

				local var_414_25 = var_414_19.localEulerAngles

				var_414_25.z = 0
				var_414_25.x = 0
				var_414_19.localEulerAngles = var_414_25
			end

			if arg_411_1.time_ >= var_414_20 + var_414_21 and arg_411_1.time_ < var_414_20 + var_414_21 + arg_414_0 then
				var_414_19.localPosition = Vector3.New(0, -1.05, -6)

				local var_414_26 = manager.ui.mainCamera.transform.position - var_414_19.position

				var_414_19.forward = Vector3.New(var_414_26.x, var_414_26.y, var_414_26.z)

				local var_414_27 = var_414_19.localEulerAngles

				var_414_27.z = 0
				var_414_27.x = 0
				var_414_19.localEulerAngles = var_414_27
			end

			local var_414_28 = 0

			if var_414_28 < arg_411_1.time_ and arg_411_1.time_ <= var_414_28 + arg_414_0 then
				arg_411_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_414_29 = 0

			if var_414_29 < arg_411_1.time_ and arg_411_1.time_ <= var_414_29 + arg_414_0 then
				arg_411_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_414_30 = arg_411_1.actors_["1059ui_story"]
			local var_414_31 = 0

			if var_414_31 < arg_411_1.time_ and arg_411_1.time_ <= var_414_31 + arg_414_0 and arg_411_1.var_.characterEffect1059ui_story == nil then
				arg_411_1.var_.characterEffect1059ui_story = var_414_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_32 = 0.200000002980232

			if var_414_31 <= arg_411_1.time_ and arg_411_1.time_ < var_414_31 + var_414_32 then
				local var_414_33 = (arg_411_1.time_ - var_414_31) / var_414_32

				if arg_411_1.var_.characterEffect1059ui_story then
					arg_411_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_31 + var_414_32 and arg_411_1.time_ < var_414_31 + var_414_32 + arg_414_0 and arg_411_1.var_.characterEffect1059ui_story then
				arg_411_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_414_34 = 0
			local var_414_35 = 0.425

			if var_414_34 < arg_411_1.time_ and arg_411_1.time_ <= var_414_34 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_36 = arg_411_1:FormatText(StoryNameCfg[28].name)

				arg_411_1.leftNameTxt_.text = var_414_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_37 = arg_411_1:GetWordFromCfg(910601104)
				local var_414_38 = arg_411_1:FormatText(var_414_37.content)

				arg_411_1.text_.text = var_414_38

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_39 = 17
				local var_414_40 = utf8.len(var_414_38)
				local var_414_41 = var_414_39 <= 0 and var_414_35 or var_414_35 * (var_414_40 / var_414_39)

				if var_414_41 > 0 and var_414_35 < var_414_41 then
					arg_411_1.talkMaxDuration = var_414_41

					if var_414_41 + var_414_34 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_41 + var_414_34
					end
				end

				arg_411_1.text_.text = var_414_38
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601104", "story_v_out_910601.awb") ~= 0 then
					local var_414_42 = manager.audio:GetVoiceLength("story_v_out_910601", "910601104", "story_v_out_910601.awb") / 1000

					if var_414_42 + var_414_34 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_42 + var_414_34
					end

					if var_414_37.prefab_name ~= "" and arg_411_1.actors_[var_414_37.prefab_name] ~= nil then
						local var_414_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_37.prefab_name].transform, "story_v_out_910601", "910601104", "story_v_out_910601.awb")

						arg_411_1:RecordAudio("910601104", var_414_43)
						arg_411_1:RecordAudio("910601104", var_414_43)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_910601", "910601104", "story_v_out_910601.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_910601", "910601104", "story_v_out_910601.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_44 = math.max(var_414_35, arg_411_1.talkMaxDuration)

			if var_414_34 <= arg_411_1.time_ and arg_411_1.time_ < var_414_34 + var_414_44 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_34) / var_414_44

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_34 + var_414_44 and arg_411_1.time_ < var_414_34 + var_414_44 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play910601105 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 910601105
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play910601106(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1059ui_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and arg_415_1.var_.characterEffect1059ui_story == nil then
				arg_415_1.var_.characterEffect1059ui_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.200000002980232

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect1059ui_story then
					local var_418_4 = Mathf.Lerp(0, 0.5, var_418_3)

					arg_415_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_415_1.var_.characterEffect1059ui_story.fillRatio = var_418_4
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and arg_415_1.var_.characterEffect1059ui_story then
				local var_418_5 = 0.5

				arg_415_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_415_1.var_.characterEffect1059ui_story.fillRatio = var_418_5
			end

			local var_418_6 = 0
			local var_418_7 = 0.35

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_8 = arg_415_1:FormatText(StoryNameCfg[7].name)

				arg_415_1.leftNameTxt_.text = var_418_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_9 = arg_415_1:GetWordFromCfg(910601105)
				local var_418_10 = arg_415_1:FormatText(var_418_9.content)

				arg_415_1.text_.text = var_418_10

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_11 = 14
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
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_14 = math.max(var_418_7, arg_415_1.talkMaxDuration)

			if var_418_6 <= arg_415_1.time_ and arg_415_1.time_ < var_418_6 + var_418_14 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_6) / var_418_14

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_6 + var_418_14 and arg_415_1.time_ < var_418_6 + var_418_14 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play910601106 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 910601106
		arg_419_1.duration_ = 7.866

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play910601107(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1059ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.characterEffect1059ui_story == nil then
				arg_419_1.var_.characterEffect1059ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.200000002980232

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect1059ui_story then
					arg_419_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.characterEffect1059ui_story then
				arg_419_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_422_4 = 0
			local var_422_5 = 0.775

			if var_422_4 < arg_419_1.time_ and arg_419_1.time_ <= var_422_4 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_6 = arg_419_1:FormatText(StoryNameCfg[28].name)

				arg_419_1.leftNameTxt_.text = var_422_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_7 = arg_419_1:GetWordFromCfg(910601106)
				local var_422_8 = arg_419_1:FormatText(var_422_7.content)

				arg_419_1.text_.text = var_422_8

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_9 = 31
				local var_422_10 = utf8.len(var_422_8)
				local var_422_11 = var_422_9 <= 0 and var_422_5 or var_422_5 * (var_422_10 / var_422_9)

				if var_422_11 > 0 and var_422_5 < var_422_11 then
					arg_419_1.talkMaxDuration = var_422_11

					if var_422_11 + var_422_4 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_11 + var_422_4
					end
				end

				arg_419_1.text_.text = var_422_8
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601106", "story_v_out_910601.awb") ~= 0 then
					local var_422_12 = manager.audio:GetVoiceLength("story_v_out_910601", "910601106", "story_v_out_910601.awb") / 1000

					if var_422_12 + var_422_4 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_12 + var_422_4
					end

					if var_422_7.prefab_name ~= "" and arg_419_1.actors_[var_422_7.prefab_name] ~= nil then
						local var_422_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_7.prefab_name].transform, "story_v_out_910601", "910601106", "story_v_out_910601.awb")

						arg_419_1:RecordAudio("910601106", var_422_13)
						arg_419_1:RecordAudio("910601106", var_422_13)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_910601", "910601106", "story_v_out_910601.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_910601", "910601106", "story_v_out_910601.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_14 = math.max(var_422_5, arg_419_1.talkMaxDuration)

			if var_422_4 <= arg_419_1.time_ and arg_419_1.time_ < var_422_4 + var_422_14 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_4) / var_422_14

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_4 + var_422_14 and arg_419_1.time_ < var_422_4 + var_422_14 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play910601107 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 910601107
		arg_423_1.duration_ = 6.466

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play910601108(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 then
				arg_423_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_426_2 = 0
			local var_426_3 = 0.8

			if var_426_2 < arg_423_1.time_ and arg_423_1.time_ <= var_426_2 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_4 = arg_423_1:FormatText(StoryNameCfg[28].name)

				arg_423_1.leftNameTxt_.text = var_426_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_5 = arg_423_1:GetWordFromCfg(910601107)
				local var_426_6 = arg_423_1:FormatText(var_426_5.content)

				arg_423_1.text_.text = var_426_6

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_7 = 32
				local var_426_8 = utf8.len(var_426_6)
				local var_426_9 = var_426_7 <= 0 and var_426_3 or var_426_3 * (var_426_8 / var_426_7)

				if var_426_9 > 0 and var_426_3 < var_426_9 then
					arg_423_1.talkMaxDuration = var_426_9

					if var_426_9 + var_426_2 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_9 + var_426_2
					end
				end

				arg_423_1.text_.text = var_426_6
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601107", "story_v_out_910601.awb") ~= 0 then
					local var_426_10 = manager.audio:GetVoiceLength("story_v_out_910601", "910601107", "story_v_out_910601.awb") / 1000

					if var_426_10 + var_426_2 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_10 + var_426_2
					end

					if var_426_5.prefab_name ~= "" and arg_423_1.actors_[var_426_5.prefab_name] ~= nil then
						local var_426_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_5.prefab_name].transform, "story_v_out_910601", "910601107", "story_v_out_910601.awb")

						arg_423_1:RecordAudio("910601107", var_426_11)
						arg_423_1:RecordAudio("910601107", var_426_11)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_910601", "910601107", "story_v_out_910601.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_910601", "910601107", "story_v_out_910601.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_12 = math.max(var_426_3, arg_423_1.talkMaxDuration)

			if var_426_2 <= arg_423_1.time_ and arg_423_1.time_ < var_426_2 + var_426_12 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_2) / var_426_12

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_2 + var_426_12 and arg_423_1.time_ < var_426_2 + var_426_12 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play910601108 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 910601108
		arg_427_1.duration_ = 4.6

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play910601109(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["1059ui_story"].transform
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 then
				arg_427_1.var_.moveOldPos1059ui_story = var_430_0.localPosition
			end

			local var_430_2 = 0.001

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2
				local var_430_4 = Vector3.New(0, 100, 0)

				var_430_0.localPosition = Vector3.Lerp(arg_427_1.var_.moveOldPos1059ui_story, var_430_4, var_430_3)

				local var_430_5 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_5.x, var_430_5.y, var_430_5.z)

				local var_430_6 = var_430_0.localEulerAngles

				var_430_6.z = 0
				var_430_6.x = 0
				var_430_0.localEulerAngles = var_430_6
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 then
				var_430_0.localPosition = Vector3.New(0, 100, 0)

				local var_430_7 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_7.x, var_430_7.y, var_430_7.z)

				local var_430_8 = var_430_0.localEulerAngles

				var_430_8.z = 0
				var_430_8.x = 0
				var_430_0.localEulerAngles = var_430_8
			end

			local var_430_9 = arg_427_1.actors_["1048ui_story"].transform
			local var_430_10 = 0

			if var_430_10 < arg_427_1.time_ and arg_427_1.time_ <= var_430_10 + arg_430_0 then
				arg_427_1.var_.moveOldPos1048ui_story = var_430_9.localPosition
			end

			local var_430_11 = 0.001

			if var_430_10 <= arg_427_1.time_ and arg_427_1.time_ < var_430_10 + var_430_11 then
				local var_430_12 = (arg_427_1.time_ - var_430_10) / var_430_11
				local var_430_13 = Vector3.New(0, -0.8, -6.2)

				var_430_9.localPosition = Vector3.Lerp(arg_427_1.var_.moveOldPos1048ui_story, var_430_13, var_430_12)

				local var_430_14 = manager.ui.mainCamera.transform.position - var_430_9.position

				var_430_9.forward = Vector3.New(var_430_14.x, var_430_14.y, var_430_14.z)

				local var_430_15 = var_430_9.localEulerAngles

				var_430_15.z = 0
				var_430_15.x = 0
				var_430_9.localEulerAngles = var_430_15
			end

			if arg_427_1.time_ >= var_430_10 + var_430_11 and arg_427_1.time_ < var_430_10 + var_430_11 + arg_430_0 then
				var_430_9.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_430_16 = manager.ui.mainCamera.transform.position - var_430_9.position

				var_430_9.forward = Vector3.New(var_430_16.x, var_430_16.y, var_430_16.z)

				local var_430_17 = var_430_9.localEulerAngles

				var_430_17.z = 0
				var_430_17.x = 0
				var_430_9.localEulerAngles = var_430_17
			end

			local var_430_18 = 0

			if var_430_18 < arg_427_1.time_ and arg_427_1.time_ <= var_430_18 + arg_430_0 then
				arg_427_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_430_19 = 0

			if var_430_19 < arg_427_1.time_ and arg_427_1.time_ <= var_430_19 + arg_430_0 then
				arg_427_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_430_20 = arg_427_1.actors_["1048ui_story"]
			local var_430_21 = 0

			if var_430_21 < arg_427_1.time_ and arg_427_1.time_ <= var_430_21 + arg_430_0 and arg_427_1.var_.characterEffect1048ui_story == nil then
				arg_427_1.var_.characterEffect1048ui_story = var_430_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_22 = 0.200000002980232

			if var_430_21 <= arg_427_1.time_ and arg_427_1.time_ < var_430_21 + var_430_22 then
				local var_430_23 = (arg_427_1.time_ - var_430_21) / var_430_22

				if arg_427_1.var_.characterEffect1048ui_story then
					arg_427_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_427_1.time_ >= var_430_21 + var_430_22 and arg_427_1.time_ < var_430_21 + var_430_22 + arg_430_0 and arg_427_1.var_.characterEffect1048ui_story then
				arg_427_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_430_24 = 0
			local var_430_25 = 0.45

			if var_430_24 < arg_427_1.time_ and arg_427_1.time_ <= var_430_24 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_26 = arg_427_1:FormatText(StoryNameCfg[8].name)

				arg_427_1.leftNameTxt_.text = var_430_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_27 = arg_427_1:GetWordFromCfg(910601108)
				local var_430_28 = arg_427_1:FormatText(var_430_27.content)

				arg_427_1.text_.text = var_430_28

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_29 = 18
				local var_430_30 = utf8.len(var_430_28)
				local var_430_31 = var_430_29 <= 0 and var_430_25 or var_430_25 * (var_430_30 / var_430_29)

				if var_430_31 > 0 and var_430_25 < var_430_31 then
					arg_427_1.talkMaxDuration = var_430_31

					if var_430_31 + var_430_24 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_31 + var_430_24
					end
				end

				arg_427_1.text_.text = var_430_28
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601108", "story_v_out_910601.awb") ~= 0 then
					local var_430_32 = manager.audio:GetVoiceLength("story_v_out_910601", "910601108", "story_v_out_910601.awb") / 1000

					if var_430_32 + var_430_24 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_32 + var_430_24
					end

					if var_430_27.prefab_name ~= "" and arg_427_1.actors_[var_430_27.prefab_name] ~= nil then
						local var_430_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_27.prefab_name].transform, "story_v_out_910601", "910601108", "story_v_out_910601.awb")

						arg_427_1:RecordAudio("910601108", var_430_33)
						arg_427_1:RecordAudio("910601108", var_430_33)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_910601", "910601108", "story_v_out_910601.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_910601", "910601108", "story_v_out_910601.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_34 = math.max(var_430_25, arg_427_1.talkMaxDuration)

			if var_430_24 <= arg_427_1.time_ and arg_427_1.time_ < var_430_24 + var_430_34 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_24) / var_430_34

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_24 + var_430_34 and arg_427_1.time_ < var_430_24 + var_430_34 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play910601109 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 910601109
		arg_431_1.duration_ = 2.666

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play910601110(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1048ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos1048ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, 100, 0)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1048ui_story, var_434_4, var_434_3)

				local var_434_5 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_5.x, var_434_5.y, var_434_5.z)

				local var_434_6 = var_434_0.localEulerAngles

				var_434_6.z = 0
				var_434_6.x = 0
				var_434_0.localEulerAngles = var_434_6
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = Vector3.New(0, 100, 0)

				local var_434_7 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_7.x, var_434_7.y, var_434_7.z)

				local var_434_8 = var_434_0.localEulerAngles

				var_434_8.z = 0
				var_434_8.x = 0
				var_434_0.localEulerAngles = var_434_8
			end

			local var_434_9 = arg_431_1.actors_["1084ui_story"].transform
			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 then
				arg_431_1.var_.moveOldPos1084ui_story = var_434_9.localPosition
			end

			local var_434_11 = 0.001

			if var_434_10 <= arg_431_1.time_ and arg_431_1.time_ < var_434_10 + var_434_11 then
				local var_434_12 = (arg_431_1.time_ - var_434_10) / var_434_11
				local var_434_13 = Vector3.New(0, -0.97, -6)

				var_434_9.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1084ui_story, var_434_13, var_434_12)

				local var_434_14 = manager.ui.mainCamera.transform.position - var_434_9.position

				var_434_9.forward = Vector3.New(var_434_14.x, var_434_14.y, var_434_14.z)

				local var_434_15 = var_434_9.localEulerAngles

				var_434_15.z = 0
				var_434_15.x = 0
				var_434_9.localEulerAngles = var_434_15
			end

			if arg_431_1.time_ >= var_434_10 + var_434_11 and arg_431_1.time_ < var_434_10 + var_434_11 + arg_434_0 then
				var_434_9.localPosition = Vector3.New(0, -0.97, -6)

				local var_434_16 = manager.ui.mainCamera.transform.position - var_434_9.position

				var_434_9.forward = Vector3.New(var_434_16.x, var_434_16.y, var_434_16.z)

				local var_434_17 = var_434_9.localEulerAngles

				var_434_17.z = 0
				var_434_17.x = 0
				var_434_9.localEulerAngles = var_434_17
			end

			local var_434_18 = 0

			if var_434_18 < arg_431_1.time_ and arg_431_1.time_ <= var_434_18 + arg_434_0 then
				arg_431_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_434_19 = 0

			if var_434_19 < arg_431_1.time_ and arg_431_1.time_ <= var_434_19 + arg_434_0 then
				arg_431_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_434_20 = arg_431_1.actors_["1084ui_story"]
			local var_434_21 = 0

			if var_434_21 < arg_431_1.time_ and arg_431_1.time_ <= var_434_21 + arg_434_0 and arg_431_1.var_.characterEffect1084ui_story == nil then
				arg_431_1.var_.characterEffect1084ui_story = var_434_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_22 = 0.200000002980232

			if var_434_21 <= arg_431_1.time_ and arg_431_1.time_ < var_434_21 + var_434_22 then
				local var_434_23 = (arg_431_1.time_ - var_434_21) / var_434_22

				if arg_431_1.var_.characterEffect1084ui_story then
					arg_431_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_21 + var_434_22 and arg_431_1.time_ < var_434_21 + var_434_22 + arg_434_0 and arg_431_1.var_.characterEffect1084ui_story then
				arg_431_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_434_24 = 0
			local var_434_25 = 0.633333333333333

			if var_434_24 < arg_431_1.time_ and arg_431_1.time_ <= var_434_24 + arg_434_0 then
				local var_434_26 = "play"
				local var_434_27 = "music"

				arg_431_1:AudioAction(var_434_26, var_434_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_434_28 = 0
			local var_434_29 = 0.175

			if var_434_28 < arg_431_1.time_ and arg_431_1.time_ <= var_434_28 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_30 = arg_431_1:FormatText(StoryNameCfg[6].name)

				arg_431_1.leftNameTxt_.text = var_434_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_31 = arg_431_1:GetWordFromCfg(910601109)
				local var_434_32 = arg_431_1:FormatText(var_434_31.content)

				arg_431_1.text_.text = var_434_32

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_33 = 7
				local var_434_34 = utf8.len(var_434_32)
				local var_434_35 = var_434_33 <= 0 and var_434_29 or var_434_29 * (var_434_34 / var_434_33)

				if var_434_35 > 0 and var_434_29 < var_434_35 then
					arg_431_1.talkMaxDuration = var_434_35

					if var_434_35 + var_434_28 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_35 + var_434_28
					end
				end

				arg_431_1.text_.text = var_434_32
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601109", "story_v_out_910601.awb") ~= 0 then
					local var_434_36 = manager.audio:GetVoiceLength("story_v_out_910601", "910601109", "story_v_out_910601.awb") / 1000

					if var_434_36 + var_434_28 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_36 + var_434_28
					end

					if var_434_31.prefab_name ~= "" and arg_431_1.actors_[var_434_31.prefab_name] ~= nil then
						local var_434_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_31.prefab_name].transform, "story_v_out_910601", "910601109", "story_v_out_910601.awb")

						arg_431_1:RecordAudio("910601109", var_434_37)
						arg_431_1:RecordAudio("910601109", var_434_37)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_910601", "910601109", "story_v_out_910601.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_910601", "910601109", "story_v_out_910601.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_38 = math.max(var_434_29, arg_431_1.talkMaxDuration)

			if var_434_28 <= arg_431_1.time_ and arg_431_1.time_ < var_434_28 + var_434_38 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_28) / var_434_38

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_28 + var_434_38 and arg_431_1.time_ < var_434_28 + var_434_38 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play910601110 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 910601110
		arg_435_1.duration_ = 1.999999999999

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play910601111(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1084ui_story"].transform
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 then
				arg_435_1.var_.moveOldPos1084ui_story = var_438_0.localPosition
			end

			local var_438_2 = 0.001

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2
				local var_438_4 = Vector3.New(0, 100, 0)

				var_438_0.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1084ui_story, var_438_4, var_438_3)

				local var_438_5 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_5.x, var_438_5.y, var_438_5.z)

				local var_438_6 = var_438_0.localEulerAngles

				var_438_6.z = 0
				var_438_6.x = 0
				var_438_0.localEulerAngles = var_438_6
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 then
				var_438_0.localPosition = Vector3.New(0, 100, 0)

				local var_438_7 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_7.x, var_438_7.y, var_438_7.z)

				local var_438_8 = var_438_0.localEulerAngles

				var_438_8.z = 0
				var_438_8.x = 0
				var_438_0.localEulerAngles = var_438_8
			end

			local var_438_9 = arg_435_1.actors_["1011ui_story"].transform
			local var_438_10 = 0

			if var_438_10 < arg_435_1.time_ and arg_435_1.time_ <= var_438_10 + arg_438_0 then
				arg_435_1.var_.moveOldPos1011ui_story = var_438_9.localPosition
			end

			local var_438_11 = 0.001

			if var_438_10 <= arg_435_1.time_ and arg_435_1.time_ < var_438_10 + var_438_11 then
				local var_438_12 = (arg_435_1.time_ - var_438_10) / var_438_11
				local var_438_13 = Vector3.New(0, -0.71, -6)

				var_438_9.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1011ui_story, var_438_13, var_438_12)

				local var_438_14 = manager.ui.mainCamera.transform.position - var_438_9.position

				var_438_9.forward = Vector3.New(var_438_14.x, var_438_14.y, var_438_14.z)

				local var_438_15 = var_438_9.localEulerAngles

				var_438_15.z = 0
				var_438_15.x = 0
				var_438_9.localEulerAngles = var_438_15
			end

			if arg_435_1.time_ >= var_438_10 + var_438_11 and arg_435_1.time_ < var_438_10 + var_438_11 + arg_438_0 then
				var_438_9.localPosition = Vector3.New(0, -0.71, -6)

				local var_438_16 = manager.ui.mainCamera.transform.position - var_438_9.position

				var_438_9.forward = Vector3.New(var_438_16.x, var_438_16.y, var_438_16.z)

				local var_438_17 = var_438_9.localEulerAngles

				var_438_17.z = 0
				var_438_17.x = 0
				var_438_9.localEulerAngles = var_438_17
			end

			local var_438_18 = arg_435_1.actors_["1011ui_story"]
			local var_438_19 = 0

			if var_438_19 < arg_435_1.time_ and arg_435_1.time_ <= var_438_19 + arg_438_0 and arg_435_1.var_.characterEffect1011ui_story == nil then
				arg_435_1.var_.characterEffect1011ui_story = var_438_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_20 = 0.200000002980232

			if var_438_19 <= arg_435_1.time_ and arg_435_1.time_ < var_438_19 + var_438_20 then
				local var_438_21 = (arg_435_1.time_ - var_438_19) / var_438_20

				if arg_435_1.var_.characterEffect1011ui_story then
					arg_435_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_435_1.time_ >= var_438_19 + var_438_20 and arg_435_1.time_ < var_438_19 + var_438_20 + arg_438_0 and arg_435_1.var_.characterEffect1011ui_story then
				arg_435_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_438_22 = 0

			if var_438_22 < arg_435_1.time_ and arg_435_1.time_ <= var_438_22 + arg_438_0 then
				arg_435_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_438_23 = 0

			if var_438_23 < arg_435_1.time_ and arg_435_1.time_ <= var_438_23 + arg_438_0 then
				arg_435_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_438_24 = 0
			local var_438_25 = 0.225

			if var_438_24 < arg_435_1.time_ and arg_435_1.time_ <= var_438_24 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_26 = arg_435_1:FormatText(StoryNameCfg[37].name)

				arg_435_1.leftNameTxt_.text = var_438_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_27 = arg_435_1:GetWordFromCfg(910601110)
				local var_438_28 = arg_435_1:FormatText(var_438_27.content)

				arg_435_1.text_.text = var_438_28

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_29 = 9
				local var_438_30 = utf8.len(var_438_28)
				local var_438_31 = var_438_29 <= 0 and var_438_25 or var_438_25 * (var_438_30 / var_438_29)

				if var_438_31 > 0 and var_438_25 < var_438_31 then
					arg_435_1.talkMaxDuration = var_438_31

					if var_438_31 + var_438_24 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_31 + var_438_24
					end
				end

				arg_435_1.text_.text = var_438_28
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601110", "story_v_out_910601.awb") ~= 0 then
					local var_438_32 = manager.audio:GetVoiceLength("story_v_out_910601", "910601110", "story_v_out_910601.awb") / 1000

					if var_438_32 + var_438_24 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_32 + var_438_24
					end

					if var_438_27.prefab_name ~= "" and arg_435_1.actors_[var_438_27.prefab_name] ~= nil then
						local var_438_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_27.prefab_name].transform, "story_v_out_910601", "910601110", "story_v_out_910601.awb")

						arg_435_1:RecordAudio("910601110", var_438_33)
						arg_435_1:RecordAudio("910601110", var_438_33)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_910601", "910601110", "story_v_out_910601.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_910601", "910601110", "story_v_out_910601.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_34 = math.max(var_438_25, arg_435_1.talkMaxDuration)

			if var_438_24 <= arg_435_1.time_ and arg_435_1.time_ < var_438_24 + var_438_34 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_24) / var_438_34

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_24 + var_438_34 and arg_435_1.time_ < var_438_24 + var_438_34 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play910601111 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 910601111
		arg_439_1.duration_ = 1.8

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play910601112(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1011ui_story"].transform
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.var_.moveOldPos1011ui_story = var_442_0.localPosition
			end

			local var_442_2 = 0.001

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2
				local var_442_4 = Vector3.New(0, 100, 0)

				var_442_0.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1011ui_story, var_442_4, var_442_3)

				local var_442_5 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_5.x, var_442_5.y, var_442_5.z)

				local var_442_6 = var_442_0.localEulerAngles

				var_442_6.z = 0
				var_442_6.x = 0
				var_442_0.localEulerAngles = var_442_6
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 then
				var_442_0.localPosition = Vector3.New(0, 100, 0)

				local var_442_7 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_7.x, var_442_7.y, var_442_7.z)

				local var_442_8 = var_442_0.localEulerAngles

				var_442_8.z = 0
				var_442_8.x = 0
				var_442_0.localEulerAngles = var_442_8
			end

			local var_442_9 = 0
			local var_442_10 = 0.375

			if var_442_9 < arg_439_1.time_ and arg_439_1.time_ <= var_442_9 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_11 = arg_439_1:FormatText(StoryNameCfg[330].name)

				arg_439_1.leftNameTxt_.text = var_442_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_12 = arg_439_1:GetWordFromCfg(910601111)
				local var_442_13 = arg_439_1:FormatText(var_442_12.content)

				arg_439_1.text_.text = var_442_13

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_14 = 15
				local var_442_15 = utf8.len(var_442_13)
				local var_442_16 = var_442_14 <= 0 and var_442_10 or var_442_10 * (var_442_15 / var_442_14)

				if var_442_16 > 0 and var_442_10 < var_442_16 then
					arg_439_1.talkMaxDuration = var_442_16

					if var_442_16 + var_442_9 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_16 + var_442_9
					end
				end

				arg_439_1.text_.text = var_442_13
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601111", "story_v_out_910601.awb") ~= 0 then
					local var_442_17 = manager.audio:GetVoiceLength("story_v_out_910601", "910601111", "story_v_out_910601.awb") / 1000

					if var_442_17 + var_442_9 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_17 + var_442_9
					end

					if var_442_12.prefab_name ~= "" and arg_439_1.actors_[var_442_12.prefab_name] ~= nil then
						local var_442_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_12.prefab_name].transform, "story_v_out_910601", "910601111", "story_v_out_910601.awb")

						arg_439_1:RecordAudio("910601111", var_442_18)
						arg_439_1:RecordAudio("910601111", var_442_18)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_910601", "910601111", "story_v_out_910601.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_910601", "910601111", "story_v_out_910601.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_19 = math.max(var_442_10, arg_439_1.talkMaxDuration)

			if var_442_9 <= arg_439_1.time_ and arg_439_1.time_ < var_442_9 + var_442_19 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_9) / var_442_19

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_9 + var_442_19 and arg_439_1.time_ < var_442_9 + var_442_19 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play910601112 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 910601112
		arg_443_1.duration_ = 39.166666666666

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play910601121(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				SetActive(arg_443_1.dialog_, false)
				SetActive(arg_443_1.allBtn_.gameObject, false)
				arg_443_1.hideBtnsController_:SetSelectedIndex(1)
				arg_443_1:StopAllVoice()

				arg_443_1.marker = "dontskip1"

				manager.video:Play("SofdecAsset/story/story_9106010.usm", function(arg_447_0)
					if arg_443_1.state_ == "playing" then
						arg_443_1:JumpToEnd()
					end

					if arg_443_1.playNext_ and not arg_443_1.auto_ then
						arg_443_1.playNext_(1)
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_448_0)
					if arg_448_0 then
						arg_443_1.state_ = "pause"
					else
						arg_443_1.state_ = "playing"
					end
				end)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_446_1 = 39.1666666666667

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_1 then
				-- block empty
			end

			if arg_443_1.time_ >= var_446_0 + var_446_1 and arg_443_1.time_ < var_446_0 + var_446_1 + arg_446_0 then
				arg_443_1.marker = ""
			end
		end
	end,
	Play910601121 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 910601121
		arg_449_1.duration_ = 9

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play910601122(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 2

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				local var_452_1 = manager.ui.mainCamera.transform.localPosition
				local var_452_2 = Vector3.New(0, 0, 10) + Vector3.New(var_452_1.x, var_452_1.y, 0)
				local var_452_3 = arg_449_1.bgs_.ST60

				var_452_3.transform.localPosition = var_452_2
				var_452_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_452_4 = var_452_3:GetComponent("SpriteRenderer")

				if var_452_4 and var_452_4.sprite then
					local var_452_5 = (var_452_3.transform.localPosition - var_452_1).z
					local var_452_6 = manager.ui.mainCameraCom_
					local var_452_7 = 2 * var_452_5 * Mathf.Tan(var_452_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_452_8 = var_452_7 * var_452_6.aspect
					local var_452_9 = var_452_4.sprite.bounds.size.x
					local var_452_10 = var_452_4.sprite.bounds.size.y
					local var_452_11 = var_452_8 / var_452_9
					local var_452_12 = var_452_7 / var_452_10
					local var_452_13 = var_452_12 < var_452_11 and var_452_11 or var_452_12

					var_452_3.transform.localScale = Vector3.New(var_452_13, var_452_13, 0)
				end

				for iter_452_0, iter_452_1 in pairs(arg_449_1.bgs_) do
					if iter_452_0 ~= "ST60" then
						iter_452_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_452_14 = 0

			if var_452_14 < arg_449_1.time_ and arg_449_1.time_ <= var_452_14 + arg_452_0 then
				arg_449_1.mask_.enabled = true
				arg_449_1.mask_.raycastTarget = true

				arg_449_1:SetGaussion(false)
			end

			local var_452_15 = 2

			if var_452_14 <= arg_449_1.time_ and arg_449_1.time_ < var_452_14 + var_452_15 then
				local var_452_16 = (arg_449_1.time_ - var_452_14) / var_452_15
				local var_452_17 = Color.New(1, 1, 1)

				var_452_17.a = Mathf.Lerp(0, 1, var_452_16)
				arg_449_1.mask_.color = var_452_17
			end

			if arg_449_1.time_ >= var_452_14 + var_452_15 and arg_449_1.time_ < var_452_14 + var_452_15 + arg_452_0 then
				local var_452_18 = Color.New(1, 1, 1)

				var_452_18.a = 1
				arg_449_1.mask_.color = var_452_18
			end

			local var_452_19 = 2

			if var_452_19 < arg_449_1.time_ and arg_449_1.time_ <= var_452_19 + arg_452_0 then
				arg_449_1.mask_.enabled = true
				arg_449_1.mask_.raycastTarget = true

				arg_449_1:SetGaussion(false)
			end

			local var_452_20 = 2

			if var_452_19 <= arg_449_1.time_ and arg_449_1.time_ < var_452_19 + var_452_20 then
				local var_452_21 = (arg_449_1.time_ - var_452_19) / var_452_20
				local var_452_22 = Color.New(1, 1, 1)

				var_452_22.a = Mathf.Lerp(1, 0, var_452_21)
				arg_449_1.mask_.color = var_452_22
			end

			if arg_449_1.time_ >= var_452_19 + var_452_20 and arg_449_1.time_ < var_452_19 + var_452_20 + arg_452_0 then
				local var_452_23 = Color.New(1, 1, 1)
				local var_452_24 = 0

				arg_449_1.mask_.enabled = false
				var_452_23.a = var_452_24
				arg_449_1.mask_.color = var_452_23
			end

			local var_452_25 = 2

			if var_452_25 < arg_449_1.time_ and arg_449_1.time_ <= var_452_25 + arg_452_0 then
				SetActive(arg_449_1.dialog_, true)
				SetActive(arg_449_1.allBtn_.gameObject, true)
				arg_449_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_452_26 = 2

			if var_452_25 <= arg_449_1.time_ and arg_449_1.time_ < var_452_25 + var_452_26 then
				-- block empty
			end

			if arg_449_1.time_ >= var_452_25 + var_452_26 and arg_449_1.time_ < var_452_25 + var_452_26 + arg_452_0 then
				arg_449_1.marker = ""
			end

			if arg_449_1.frameCnt_ <= 1 then
				arg_449_1.dialog_:SetActive(false)
			end

			local var_452_27 = 4
			local var_452_28 = 0.075

			if var_452_27 < arg_449_1.time_ and arg_449_1.time_ <= var_452_27 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0

				arg_449_1.dialog_:SetActive(true)

				local var_452_29 = LeanTween.value(arg_449_1.dialog_, 0, 1, 0.3)

				var_452_29:setOnUpdate(LuaHelper.FloatAction(function(arg_453_0)
					arg_449_1.dialogCg_.alpha = arg_453_0
				end))
				var_452_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_449_1.dialog_)
					var_452_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_449_1.duration_ = arg_449_1.duration_ + 0.3

				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_30 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_31 = arg_449_1:GetWordFromCfg(910601121)
				local var_452_32 = arg_449_1:FormatText(var_452_31.content)

				arg_449_1.text_.text = var_452_32

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_33 = 3
				local var_452_34 = utf8.len(var_452_32)
				local var_452_35 = var_452_33 <= 0 and var_452_28 or var_452_28 * (var_452_34 / var_452_33)

				if var_452_35 > 0 and var_452_28 < var_452_35 then
					arg_449_1.talkMaxDuration = var_452_35
					var_452_27 = var_452_27 + 0.3

					if var_452_35 + var_452_27 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_35 + var_452_27
					end
				end

				arg_449_1.text_.text = var_452_32
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_36 = var_452_27 + 0.3
			local var_452_37 = math.max(var_452_28, arg_449_1.talkMaxDuration)

			if var_452_36 <= arg_449_1.time_ and arg_449_1.time_ < var_452_36 + var_452_37 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_36) / var_452_37

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_36 + var_452_37 and arg_449_1.time_ < var_452_36 + var_452_37 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play910601122 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 910601122
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play910601123(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.325

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[7].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_3 = arg_455_1:GetWordFromCfg(910601122)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 13
				local var_458_6 = utf8.len(var_458_4)
				local var_458_7 = var_458_5 <= 0 and var_458_1 or var_458_1 * (var_458_6 / var_458_5)

				if var_458_7 > 0 and var_458_1 < var_458_7 then
					arg_455_1.talkMaxDuration = var_458_7

					if var_458_7 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_7 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_4
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_8 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_8 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_8

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_8 and arg_455_1.time_ < var_458_0 + var_458_8 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play910601123 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 910601123
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play910601124(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 0.75

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, false)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_2 = arg_459_1:GetWordFromCfg(910601123)
				local var_462_3 = arg_459_1:FormatText(var_462_2.content)

				arg_459_1.text_.text = var_462_3

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_4 = 30
				local var_462_5 = utf8.len(var_462_3)
				local var_462_6 = var_462_4 <= 0 and var_462_1 or var_462_1 * (var_462_5 / var_462_4)

				if var_462_6 > 0 and var_462_1 < var_462_6 then
					arg_459_1.talkMaxDuration = var_462_6

					if var_462_6 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_6 + var_462_0
					end
				end

				arg_459_1.text_.text = var_462_3
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_7 = math.max(var_462_1, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_7 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_0) / var_462_7

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_7 and arg_459_1.time_ < var_462_0 + var_462_7 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play910601124 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 910601124
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play910601125(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 0.7

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_2 = arg_463_1:FormatText(StoryNameCfg[7].name)

				arg_463_1.leftNameTxt_.text = var_466_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(910601124)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 28
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_1 or var_466_1 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_1 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_8 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_8 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_8

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_8 and arg_463_1.time_ < var_466_0 + var_466_8 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play910601125 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 910601125
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play910601126(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.633333333333333

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				local var_470_2 = "play"
				local var_470_3 = "music"

				arg_467_1:AudioAction(var_470_2, var_470_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_470_4 = 0.8
			local var_470_5 = 1

			if var_470_4 < arg_467_1.time_ and arg_467_1.time_ <= var_470_4 + arg_470_0 then
				local var_470_6 = "play"
				local var_470_7 = "music"

				arg_467_1:AudioAction(var_470_6, var_470_7, "bgm_side_daily07", "bgm_side_daily07", "bgm_side_daily07.awb")
			end

			local var_470_8 = 0
			local var_470_9 = 0.625

			if var_470_8 < arg_467_1.time_ and arg_467_1.time_ <= var_470_8 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_10 = arg_467_1:FormatText(StoryNameCfg[7].name)

				arg_467_1.leftNameTxt_.text = var_470_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_11 = arg_467_1:GetWordFromCfg(910601125)
				local var_470_12 = arg_467_1:FormatText(var_470_11.content)

				arg_467_1.text_.text = var_470_12

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_13 = 25
				local var_470_14 = utf8.len(var_470_12)
				local var_470_15 = var_470_13 <= 0 and var_470_9 or var_470_9 * (var_470_14 / var_470_13)

				if var_470_15 > 0 and var_470_9 < var_470_15 then
					arg_467_1.talkMaxDuration = var_470_15

					if var_470_15 + var_470_8 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_15 + var_470_8
					end
				end

				arg_467_1.text_.text = var_470_12
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_16 = math.max(var_470_9, arg_467_1.talkMaxDuration)

			if var_470_8 <= arg_467_1.time_ and arg_467_1.time_ < var_470_8 + var_470_16 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_8) / var_470_16

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_8 + var_470_16 and arg_467_1.time_ < var_470_8 + var_470_16 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play910601126 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 910601126
		arg_471_1.duration_ = 4

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play910601127(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1011ui_story"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos1011ui_story = var_474_0.localPosition
			end

			local var_474_2 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0, -0.71, -6)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1011ui_story, var_474_4, var_474_3)

				local var_474_5 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_5.x, var_474_5.y, var_474_5.z)

				local var_474_6 = var_474_0.localEulerAngles

				var_474_6.z = 0
				var_474_6.x = 0
				var_474_0.localEulerAngles = var_474_6
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_474_7 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_7.x, var_474_7.y, var_474_7.z)

				local var_474_8 = var_474_0.localEulerAngles

				var_474_8.z = 0
				var_474_8.x = 0
				var_474_0.localEulerAngles = var_474_8
			end

			local var_474_9 = arg_471_1.actors_["1011ui_story"]
			local var_474_10 = 0

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 and arg_471_1.var_.characterEffect1011ui_story == nil then
				arg_471_1.var_.characterEffect1011ui_story = var_474_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_11 = 0.200000002980232

			if var_474_10 <= arg_471_1.time_ and arg_471_1.time_ < var_474_10 + var_474_11 then
				local var_474_12 = (arg_471_1.time_ - var_474_10) / var_474_11

				if arg_471_1.var_.characterEffect1011ui_story then
					arg_471_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_10 + var_474_11 and arg_471_1.time_ < var_474_10 + var_474_11 + arg_474_0 and arg_471_1.var_.characterEffect1011ui_story then
				arg_471_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_474_13 = 0

			if var_474_13 < arg_471_1.time_ and arg_471_1.time_ <= var_474_13 + arg_474_0 then
				arg_471_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_474_14 = 0

			if var_474_14 < arg_471_1.time_ and arg_471_1.time_ <= var_474_14 + arg_474_0 then
				arg_471_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_474_15 = 0
			local var_474_16 = 0.325

			if var_474_15 < arg_471_1.time_ and arg_471_1.time_ <= var_474_15 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_17 = arg_471_1:FormatText(StoryNameCfg[37].name)

				arg_471_1.leftNameTxt_.text = var_474_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_18 = arg_471_1:GetWordFromCfg(910601126)
				local var_474_19 = arg_471_1:FormatText(var_474_18.content)

				arg_471_1.text_.text = var_474_19

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_20 = 13
				local var_474_21 = utf8.len(var_474_19)
				local var_474_22 = var_474_20 <= 0 and var_474_16 or var_474_16 * (var_474_21 / var_474_20)

				if var_474_22 > 0 and var_474_16 < var_474_22 then
					arg_471_1.talkMaxDuration = var_474_22

					if var_474_22 + var_474_15 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_22 + var_474_15
					end
				end

				arg_471_1.text_.text = var_474_19
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601126", "story_v_out_910601.awb") ~= 0 then
					local var_474_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601126", "story_v_out_910601.awb") / 1000

					if var_474_23 + var_474_15 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_23 + var_474_15
					end

					if var_474_18.prefab_name ~= "" and arg_471_1.actors_[var_474_18.prefab_name] ~= nil then
						local var_474_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_18.prefab_name].transform, "story_v_out_910601", "910601126", "story_v_out_910601.awb")

						arg_471_1:RecordAudio("910601126", var_474_24)
						arg_471_1:RecordAudio("910601126", var_474_24)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_910601", "910601126", "story_v_out_910601.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_910601", "910601126", "story_v_out_910601.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_25 = math.max(var_474_16, arg_471_1.talkMaxDuration)

			if var_474_15 <= arg_471_1.time_ and arg_471_1.time_ < var_474_15 + var_474_25 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_15) / var_474_25

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_15 + var_474_25 and arg_471_1.time_ < var_474_15 + var_474_25 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play910601127 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 910601127
		arg_475_1.duration_ = 2.5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play910601128(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1011ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos1011ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, 100, 0)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1011ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, 100, 0)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = arg_475_1.actors_["1084ui_story"].transform
			local var_478_10 = 0

			if var_478_10 < arg_475_1.time_ and arg_475_1.time_ <= var_478_10 + arg_478_0 then
				arg_475_1.var_.moveOldPos1084ui_story = var_478_9.localPosition
			end

			local var_478_11 = 0.001

			if var_478_10 <= arg_475_1.time_ and arg_475_1.time_ < var_478_10 + var_478_11 then
				local var_478_12 = (arg_475_1.time_ - var_478_10) / var_478_11
				local var_478_13 = Vector3.New(0, -0.97, -6)

				var_478_9.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1084ui_story, var_478_13, var_478_12)

				local var_478_14 = manager.ui.mainCamera.transform.position - var_478_9.position

				var_478_9.forward = Vector3.New(var_478_14.x, var_478_14.y, var_478_14.z)

				local var_478_15 = var_478_9.localEulerAngles

				var_478_15.z = 0
				var_478_15.x = 0
				var_478_9.localEulerAngles = var_478_15
			end

			if arg_475_1.time_ >= var_478_10 + var_478_11 and arg_475_1.time_ < var_478_10 + var_478_11 + arg_478_0 then
				var_478_9.localPosition = Vector3.New(0, -0.97, -6)

				local var_478_16 = manager.ui.mainCamera.transform.position - var_478_9.position

				var_478_9.forward = Vector3.New(var_478_16.x, var_478_16.y, var_478_16.z)

				local var_478_17 = var_478_9.localEulerAngles

				var_478_17.z = 0
				var_478_17.x = 0
				var_478_9.localEulerAngles = var_478_17
			end

			local var_478_18 = 0

			if var_478_18 < arg_475_1.time_ and arg_475_1.time_ <= var_478_18 + arg_478_0 then
				arg_475_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_478_19 = 0

			if var_478_19 < arg_475_1.time_ and arg_475_1.time_ <= var_478_19 + arg_478_0 then
				arg_475_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_478_20 = arg_475_1.actors_["1084ui_story"]
			local var_478_21 = 0

			if var_478_21 < arg_475_1.time_ and arg_475_1.time_ <= var_478_21 + arg_478_0 and arg_475_1.var_.characterEffect1084ui_story == nil then
				arg_475_1.var_.characterEffect1084ui_story = var_478_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_22 = 0.200000002980232

			if var_478_21 <= arg_475_1.time_ and arg_475_1.time_ < var_478_21 + var_478_22 then
				local var_478_23 = (arg_475_1.time_ - var_478_21) / var_478_22

				if arg_475_1.var_.characterEffect1084ui_story then
					arg_475_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_21 + var_478_22 and arg_475_1.time_ < var_478_21 + var_478_22 + arg_478_0 and arg_475_1.var_.characterEffect1084ui_story then
				arg_475_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_478_24 = 0
			local var_478_25 = 0.35

			if var_478_24 < arg_475_1.time_ and arg_475_1.time_ <= var_478_24 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_26 = arg_475_1:FormatText(StoryNameCfg[6].name)

				arg_475_1.leftNameTxt_.text = var_478_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_27 = arg_475_1:GetWordFromCfg(910601127)
				local var_478_28 = arg_475_1:FormatText(var_478_27.content)

				arg_475_1.text_.text = var_478_28

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_29 = 14
				local var_478_30 = utf8.len(var_478_28)
				local var_478_31 = var_478_29 <= 0 and var_478_25 or var_478_25 * (var_478_30 / var_478_29)

				if var_478_31 > 0 and var_478_25 < var_478_31 then
					arg_475_1.talkMaxDuration = var_478_31

					if var_478_31 + var_478_24 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_31 + var_478_24
					end
				end

				arg_475_1.text_.text = var_478_28
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601127", "story_v_out_910601.awb") ~= 0 then
					local var_478_32 = manager.audio:GetVoiceLength("story_v_out_910601", "910601127", "story_v_out_910601.awb") / 1000

					if var_478_32 + var_478_24 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_32 + var_478_24
					end

					if var_478_27.prefab_name ~= "" and arg_475_1.actors_[var_478_27.prefab_name] ~= nil then
						local var_478_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_27.prefab_name].transform, "story_v_out_910601", "910601127", "story_v_out_910601.awb")

						arg_475_1:RecordAudio("910601127", var_478_33)
						arg_475_1:RecordAudio("910601127", var_478_33)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_910601", "910601127", "story_v_out_910601.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_910601", "910601127", "story_v_out_910601.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_34 = math.max(var_478_25, arg_475_1.talkMaxDuration)

			if var_478_24 <= arg_475_1.time_ and arg_475_1.time_ < var_478_24 + var_478_34 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_24) / var_478_34

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_24 + var_478_34 and arg_475_1.time_ < var_478_24 + var_478_34 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play910601128 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 910601128
		arg_479_1.duration_ = 4

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play910601129(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["1084ui_story"]
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 and arg_479_1.var_.characterEffect1084ui_story == nil then
				arg_479_1.var_.characterEffect1084ui_story = var_482_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_2 = 0.200000002980232

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2

				if arg_479_1.var_.characterEffect1084ui_story then
					arg_479_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 and arg_479_1.var_.characterEffect1084ui_story then
				arg_479_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_482_4 = 0

			if var_482_4 < arg_479_1.time_ and arg_479_1.time_ <= var_482_4 + arg_482_0 then
				arg_479_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_482_5 = 0

			if var_482_5 < arg_479_1.time_ and arg_479_1.time_ <= var_482_5 + arg_482_0 then
				arg_479_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_482_6 = 0
			local var_482_7 = 0.525

			if var_482_6 < arg_479_1.time_ and arg_479_1.time_ <= var_482_6 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_8 = arg_479_1:FormatText(StoryNameCfg[6].name)

				arg_479_1.leftNameTxt_.text = var_482_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_9 = arg_479_1:GetWordFromCfg(910601128)
				local var_482_10 = arg_479_1:FormatText(var_482_9.content)

				arg_479_1.text_.text = var_482_10

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_11 = 21
				local var_482_12 = utf8.len(var_482_10)
				local var_482_13 = var_482_11 <= 0 and var_482_7 or var_482_7 * (var_482_12 / var_482_11)

				if var_482_13 > 0 and var_482_7 < var_482_13 then
					arg_479_1.talkMaxDuration = var_482_13

					if var_482_13 + var_482_6 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_13 + var_482_6
					end
				end

				arg_479_1.text_.text = var_482_10
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601128", "story_v_out_910601.awb") ~= 0 then
					local var_482_14 = manager.audio:GetVoiceLength("story_v_out_910601", "910601128", "story_v_out_910601.awb") / 1000

					if var_482_14 + var_482_6 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_14 + var_482_6
					end

					if var_482_9.prefab_name ~= "" and arg_479_1.actors_[var_482_9.prefab_name] ~= nil then
						local var_482_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_9.prefab_name].transform, "story_v_out_910601", "910601128", "story_v_out_910601.awb")

						arg_479_1:RecordAudio("910601128", var_482_15)
						arg_479_1:RecordAudio("910601128", var_482_15)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_910601", "910601128", "story_v_out_910601.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_910601", "910601128", "story_v_out_910601.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_16 = math.max(var_482_7, arg_479_1.talkMaxDuration)

			if var_482_6 <= arg_479_1.time_ and arg_479_1.time_ < var_482_6 + var_482_16 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_6) / var_482_16

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_6 + var_482_16 and arg_479_1.time_ < var_482_6 + var_482_16 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play910601129 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 910601129
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play910601130(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1084ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect1084ui_story == nil then
				arg_483_1.var_.characterEffect1084ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.200000002980232

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect1084ui_story then
					local var_486_4 = Mathf.Lerp(0, 0.5, var_486_3)

					arg_483_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1084ui_story.fillRatio = var_486_4
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect1084ui_story then
				local var_486_5 = 0.5

				arg_483_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1084ui_story.fillRatio = var_486_5
			end

			local var_486_6 = 0
			local var_486_7 = 1.3

			if var_486_6 < arg_483_1.time_ and arg_483_1.time_ <= var_486_6 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_8 = arg_483_1:GetWordFromCfg(910601129)
				local var_486_9 = arg_483_1:FormatText(var_486_8.content)

				arg_483_1.text_.text = var_486_9

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_10 = 52
				local var_486_11 = utf8.len(var_486_9)
				local var_486_12 = var_486_10 <= 0 and var_486_7 or var_486_7 * (var_486_11 / var_486_10)

				if var_486_12 > 0 and var_486_7 < var_486_12 then
					arg_483_1.talkMaxDuration = var_486_12

					if var_486_12 + var_486_6 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_12 + var_486_6
					end
				end

				arg_483_1.text_.text = var_486_9
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_13 = math.max(var_486_7, arg_483_1.talkMaxDuration)

			if var_486_6 <= arg_483_1.time_ and arg_483_1.time_ < var_486_6 + var_486_13 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_6) / var_486_13

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_6 + var_486_13 and arg_483_1.time_ < var_486_6 + var_486_13 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play910601130 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 910601130
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play910601131(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1084ui_story"].transform
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 then
				arg_487_1.var_.moveOldPos1084ui_story = var_490_0.localPosition
			end

			local var_490_2 = 0.001

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2
				local var_490_4 = Vector3.New(0, -0.97, -6)

				var_490_0.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos1084ui_story, var_490_4, var_490_3)

				local var_490_5 = manager.ui.mainCamera.transform.position - var_490_0.position

				var_490_0.forward = Vector3.New(var_490_5.x, var_490_5.y, var_490_5.z)

				local var_490_6 = var_490_0.localEulerAngles

				var_490_6.z = 0
				var_490_6.x = 0
				var_490_0.localEulerAngles = var_490_6
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 then
				var_490_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_490_7 = manager.ui.mainCamera.transform.position - var_490_0.position

				var_490_0.forward = Vector3.New(var_490_7.x, var_490_7.y, var_490_7.z)

				local var_490_8 = var_490_0.localEulerAngles

				var_490_8.z = 0
				var_490_8.x = 0
				var_490_0.localEulerAngles = var_490_8
			end

			local var_490_9 = arg_487_1.actors_["1084ui_story"]
			local var_490_10 = 0

			if var_490_10 < arg_487_1.time_ and arg_487_1.time_ <= var_490_10 + arg_490_0 and arg_487_1.var_.characterEffect1084ui_story == nil then
				arg_487_1.var_.characterEffect1084ui_story = var_490_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_11 = 0.200000002980232

			if var_490_10 <= arg_487_1.time_ and arg_487_1.time_ < var_490_10 + var_490_11 then
				local var_490_12 = (arg_487_1.time_ - var_490_10) / var_490_11

				if arg_487_1.var_.characterEffect1084ui_story then
					local var_490_13 = Mathf.Lerp(0, 0.5, var_490_12)

					arg_487_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1084ui_story.fillRatio = var_490_13
				end
			end

			if arg_487_1.time_ >= var_490_10 + var_490_11 and arg_487_1.time_ < var_490_10 + var_490_11 + arg_490_0 and arg_487_1.var_.characterEffect1084ui_story then
				local var_490_14 = 0.5

				arg_487_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1084ui_story.fillRatio = var_490_14
			end

			local var_490_15 = 0
			local var_490_16 = 0.75

			if var_490_15 < arg_487_1.time_ and arg_487_1.time_ <= var_490_15 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_17 = arg_487_1:FormatText(StoryNameCfg[7].name)

				arg_487_1.leftNameTxt_.text = var_490_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_18 = arg_487_1:GetWordFromCfg(910601130)
				local var_490_19 = arg_487_1:FormatText(var_490_18.content)

				arg_487_1.text_.text = var_490_19

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_20 = 30
				local var_490_21 = utf8.len(var_490_19)
				local var_490_22 = var_490_20 <= 0 and var_490_16 or var_490_16 * (var_490_21 / var_490_20)

				if var_490_22 > 0 and var_490_16 < var_490_22 then
					arg_487_1.talkMaxDuration = var_490_22

					if var_490_22 + var_490_15 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_22 + var_490_15
					end
				end

				arg_487_1.text_.text = var_490_19
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_23 = math.max(var_490_16, arg_487_1.talkMaxDuration)

			if var_490_15 <= arg_487_1.time_ and arg_487_1.time_ < var_490_15 + var_490_23 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_15) / var_490_23

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_15 + var_490_23 and arg_487_1.time_ < var_490_15 + var_490_23 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play910601131 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 910601131
		arg_491_1.duration_ = 7.833

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play910601132(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_494_1 = arg_491_1.actors_["1084ui_story"]
			local var_494_2 = 0

			if var_494_2 < arg_491_1.time_ and arg_491_1.time_ <= var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1084ui_story == nil then
				arg_491_1.var_.characterEffect1084ui_story = var_494_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_3 = 0.200000002980232

			if var_494_2 <= arg_491_1.time_ and arg_491_1.time_ < var_494_2 + var_494_3 then
				local var_494_4 = (arg_491_1.time_ - var_494_2) / var_494_3

				if arg_491_1.var_.characterEffect1084ui_story then
					arg_491_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_2 + var_494_3 and arg_491_1.time_ < var_494_2 + var_494_3 + arg_494_0 and arg_491_1.var_.characterEffect1084ui_story then
				arg_491_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_494_5 = 0
			local var_494_6 = 0.95

			if var_494_5 < arg_491_1.time_ and arg_491_1.time_ <= var_494_5 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_7 = arg_491_1:FormatText(StoryNameCfg[6].name)

				arg_491_1.leftNameTxt_.text = var_494_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_8 = arg_491_1:GetWordFromCfg(910601131)
				local var_494_9 = arg_491_1:FormatText(var_494_8.content)

				arg_491_1.text_.text = var_494_9

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_10 = 38
				local var_494_11 = utf8.len(var_494_9)
				local var_494_12 = var_494_10 <= 0 and var_494_6 or var_494_6 * (var_494_11 / var_494_10)

				if var_494_12 > 0 and var_494_6 < var_494_12 then
					arg_491_1.talkMaxDuration = var_494_12

					if var_494_12 + var_494_5 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_12 + var_494_5
					end
				end

				arg_491_1.text_.text = var_494_9
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601131", "story_v_out_910601.awb") ~= 0 then
					local var_494_13 = manager.audio:GetVoiceLength("story_v_out_910601", "910601131", "story_v_out_910601.awb") / 1000

					if var_494_13 + var_494_5 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_13 + var_494_5
					end

					if var_494_8.prefab_name ~= "" and arg_491_1.actors_[var_494_8.prefab_name] ~= nil then
						local var_494_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_8.prefab_name].transform, "story_v_out_910601", "910601131", "story_v_out_910601.awb")

						arg_491_1:RecordAudio("910601131", var_494_14)
						arg_491_1:RecordAudio("910601131", var_494_14)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_910601", "910601131", "story_v_out_910601.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_910601", "910601131", "story_v_out_910601.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_15 = math.max(var_494_6, arg_491_1.talkMaxDuration)

			if var_494_5 <= arg_491_1.time_ and arg_491_1.time_ < var_494_5 + var_494_15 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_5) / var_494_15

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_5 + var_494_15 and arg_491_1.time_ < var_494_5 + var_494_15 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play910601132 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 910601132
		arg_495_1.duration_ = 2.033

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play910601133(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1084ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1084ui_story == nil then
				arg_495_1.var_.characterEffect1084ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.200000002980232

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1084ui_story then
					arg_495_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1084ui_story then
				arg_495_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_498_4 = 0
			local var_498_5 = 0.175

			if var_498_4 < arg_495_1.time_ and arg_495_1.time_ <= var_498_4 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_6 = arg_495_1:FormatText(StoryNameCfg[6].name)

				arg_495_1.leftNameTxt_.text = var_498_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_7 = arg_495_1:GetWordFromCfg(910601132)
				local var_498_8 = arg_495_1:FormatText(var_498_7.content)

				arg_495_1.text_.text = var_498_8

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_9 = 7
				local var_498_10 = utf8.len(var_498_8)
				local var_498_11 = var_498_9 <= 0 and var_498_5 or var_498_5 * (var_498_10 / var_498_9)

				if var_498_11 > 0 and var_498_5 < var_498_11 then
					arg_495_1.talkMaxDuration = var_498_11

					if var_498_11 + var_498_4 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_11 + var_498_4
					end
				end

				arg_495_1.text_.text = var_498_8
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601132", "story_v_out_910601.awb") ~= 0 then
					local var_498_12 = manager.audio:GetVoiceLength("story_v_out_910601", "910601132", "story_v_out_910601.awb") / 1000

					if var_498_12 + var_498_4 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_12 + var_498_4
					end

					if var_498_7.prefab_name ~= "" and arg_495_1.actors_[var_498_7.prefab_name] ~= nil then
						local var_498_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_7.prefab_name].transform, "story_v_out_910601", "910601132", "story_v_out_910601.awb")

						arg_495_1:RecordAudio("910601132", var_498_13)
						arg_495_1:RecordAudio("910601132", var_498_13)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_910601", "910601132", "story_v_out_910601.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_910601", "910601132", "story_v_out_910601.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_14 = math.max(var_498_5, arg_495_1.talkMaxDuration)

			if var_498_4 <= arg_495_1.time_ and arg_495_1.time_ < var_498_4 + var_498_14 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_4) / var_498_14

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_4 + var_498_14 and arg_495_1.time_ < var_498_4 + var_498_14 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play910601133 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 910601133
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play910601134(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1084ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1084ui_story == nil then
				arg_499_1.var_.characterEffect1084ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.200000002980232

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1084ui_story then
					local var_502_4 = Mathf.Lerp(0, 0.5, var_502_3)

					arg_499_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1084ui_story.fillRatio = var_502_4
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1084ui_story then
				local var_502_5 = 0.5

				arg_499_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1084ui_story.fillRatio = var_502_5
			end

			local var_502_6 = 0
			local var_502_7 = 0.775

			if var_502_6 < arg_499_1.time_ and arg_499_1.time_ <= var_502_6 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_8 = arg_499_1:GetWordFromCfg(910601133)
				local var_502_9 = arg_499_1:FormatText(var_502_8.content)

				arg_499_1.text_.text = var_502_9

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_10 = 31
				local var_502_11 = utf8.len(var_502_9)
				local var_502_12 = var_502_10 <= 0 and var_502_7 or var_502_7 * (var_502_11 / var_502_10)

				if var_502_12 > 0 and var_502_7 < var_502_12 then
					arg_499_1.talkMaxDuration = var_502_12

					if var_502_12 + var_502_6 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_12 + var_502_6
					end
				end

				arg_499_1.text_.text = var_502_9
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_13 = math.max(var_502_7, arg_499_1.talkMaxDuration)

			if var_502_6 <= arg_499_1.time_ and arg_499_1.time_ < var_502_6 + var_502_13 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_6) / var_502_13

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_6 + var_502_13 and arg_499_1.time_ < var_502_6 + var_502_13 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play910601134 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 910601134
		arg_503_1.duration_ = 6.233

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play910601135(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1048ui_story"].transform
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 then
				arg_503_1.var_.moveOldPos1048ui_story = var_506_0.localPosition
			end

			local var_506_2 = 0.001

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2
				local var_506_4 = Vector3.New(0, -0.8, -6.2)

				var_506_0.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos1048ui_story, var_506_4, var_506_3)

				local var_506_5 = manager.ui.mainCamera.transform.position - var_506_0.position

				var_506_0.forward = Vector3.New(var_506_5.x, var_506_5.y, var_506_5.z)

				local var_506_6 = var_506_0.localEulerAngles

				var_506_6.z = 0
				var_506_6.x = 0
				var_506_0.localEulerAngles = var_506_6
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 then
				var_506_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_506_7 = manager.ui.mainCamera.transform.position - var_506_0.position

				var_506_0.forward = Vector3.New(var_506_7.x, var_506_7.y, var_506_7.z)

				local var_506_8 = var_506_0.localEulerAngles

				var_506_8.z = 0
				var_506_8.x = 0
				var_506_0.localEulerAngles = var_506_8
			end

			local var_506_9 = arg_503_1.actors_["1048ui_story"]
			local var_506_10 = 0

			if var_506_10 < arg_503_1.time_ and arg_503_1.time_ <= var_506_10 + arg_506_0 and arg_503_1.var_.characterEffect1048ui_story == nil then
				arg_503_1.var_.characterEffect1048ui_story = var_506_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_11 = 0.200000002980232

			if var_506_10 <= arg_503_1.time_ and arg_503_1.time_ < var_506_10 + var_506_11 then
				local var_506_12 = (arg_503_1.time_ - var_506_10) / var_506_11

				if arg_503_1.var_.characterEffect1048ui_story then
					arg_503_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_503_1.time_ >= var_506_10 + var_506_11 and arg_503_1.time_ < var_506_10 + var_506_11 + arg_506_0 and arg_503_1.var_.characterEffect1048ui_story then
				arg_503_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_506_13 = 0

			if var_506_13 < arg_503_1.time_ and arg_503_1.time_ <= var_506_13 + arg_506_0 then
				arg_503_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_506_14 = 0

			if var_506_14 < arg_503_1.time_ and arg_503_1.time_ <= var_506_14 + arg_506_0 then
				arg_503_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_506_15 = arg_503_1.actors_["1084ui_story"].transform
			local var_506_16 = 0

			if var_506_16 < arg_503_1.time_ and arg_503_1.time_ <= var_506_16 + arg_506_0 then
				arg_503_1.var_.moveOldPos1084ui_story = var_506_15.localPosition
			end

			local var_506_17 = 0.001

			if var_506_16 <= arg_503_1.time_ and arg_503_1.time_ < var_506_16 + var_506_17 then
				local var_506_18 = (arg_503_1.time_ - var_506_16) / var_506_17
				local var_506_19 = Vector3.New(0, 100, 0)

				var_506_15.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos1084ui_story, var_506_19, var_506_18)

				local var_506_20 = manager.ui.mainCamera.transform.position - var_506_15.position

				var_506_15.forward = Vector3.New(var_506_20.x, var_506_20.y, var_506_20.z)

				local var_506_21 = var_506_15.localEulerAngles

				var_506_21.z = 0
				var_506_21.x = 0
				var_506_15.localEulerAngles = var_506_21
			end

			if arg_503_1.time_ >= var_506_16 + var_506_17 and arg_503_1.time_ < var_506_16 + var_506_17 + arg_506_0 then
				var_506_15.localPosition = Vector3.New(0, 100, 0)

				local var_506_22 = manager.ui.mainCamera.transform.position - var_506_15.position

				var_506_15.forward = Vector3.New(var_506_22.x, var_506_22.y, var_506_22.z)

				local var_506_23 = var_506_15.localEulerAngles

				var_506_23.z = 0
				var_506_23.x = 0
				var_506_15.localEulerAngles = var_506_23
			end

			local var_506_24 = arg_503_1.actors_["1084ui_story"]
			local var_506_25 = 0

			if var_506_25 < arg_503_1.time_ and arg_503_1.time_ <= var_506_25 + arg_506_0 and arg_503_1.var_.characterEffect1084ui_story == nil then
				arg_503_1.var_.characterEffect1084ui_story = var_506_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_26 = 0.200000002980232

			if var_506_25 <= arg_503_1.time_ and arg_503_1.time_ < var_506_25 + var_506_26 then
				local var_506_27 = (arg_503_1.time_ - var_506_25) / var_506_26

				if arg_503_1.var_.characterEffect1084ui_story then
					local var_506_28 = Mathf.Lerp(0, 0.5, var_506_27)

					arg_503_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_503_1.var_.characterEffect1084ui_story.fillRatio = var_506_28
				end
			end

			if arg_503_1.time_ >= var_506_25 + var_506_26 and arg_503_1.time_ < var_506_25 + var_506_26 + arg_506_0 and arg_503_1.var_.characterEffect1084ui_story then
				local var_506_29 = 0.5

				arg_503_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_503_1.var_.characterEffect1084ui_story.fillRatio = var_506_29
			end

			local var_506_30 = 0
			local var_506_31 = 0.8

			if var_506_30 < arg_503_1.time_ and arg_503_1.time_ <= var_506_30 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_32 = arg_503_1:FormatText(StoryNameCfg[8].name)

				arg_503_1.leftNameTxt_.text = var_506_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_33 = arg_503_1:GetWordFromCfg(910601134)
				local var_506_34 = arg_503_1:FormatText(var_506_33.content)

				arg_503_1.text_.text = var_506_34

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_35 = 32
				local var_506_36 = utf8.len(var_506_34)
				local var_506_37 = var_506_35 <= 0 and var_506_31 or var_506_31 * (var_506_36 / var_506_35)

				if var_506_37 > 0 and var_506_31 < var_506_37 then
					arg_503_1.talkMaxDuration = var_506_37

					if var_506_37 + var_506_30 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_37 + var_506_30
					end
				end

				arg_503_1.text_.text = var_506_34
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601134", "story_v_out_910601.awb") ~= 0 then
					local var_506_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601134", "story_v_out_910601.awb") / 1000

					if var_506_38 + var_506_30 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_38 + var_506_30
					end

					if var_506_33.prefab_name ~= "" and arg_503_1.actors_[var_506_33.prefab_name] ~= nil then
						local var_506_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_33.prefab_name].transform, "story_v_out_910601", "910601134", "story_v_out_910601.awb")

						arg_503_1:RecordAudio("910601134", var_506_39)
						arg_503_1:RecordAudio("910601134", var_506_39)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_910601", "910601134", "story_v_out_910601.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_910601", "910601134", "story_v_out_910601.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_40 = math.max(var_506_31, arg_503_1.talkMaxDuration)

			if var_506_30 <= arg_503_1.time_ and arg_503_1.time_ < var_506_30 + var_506_40 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_30) / var_506_40

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_30 + var_506_40 and arg_503_1.time_ < var_506_30 + var_506_40 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play910601135 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 910601135
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play910601136(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1048ui_story"]
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 and arg_507_1.var_.characterEffect1048ui_story == nil then
				arg_507_1.var_.characterEffect1048ui_story = var_510_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_2 = 0.200000002980232

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2

				if arg_507_1.var_.characterEffect1048ui_story then
					local var_510_4 = Mathf.Lerp(0, 0.5, var_510_3)

					arg_507_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_507_1.var_.characterEffect1048ui_story.fillRatio = var_510_4
				end
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 and arg_507_1.var_.characterEffect1048ui_story then
				local var_510_5 = 0.5

				arg_507_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_507_1.var_.characterEffect1048ui_story.fillRatio = var_510_5
			end

			local var_510_6 = 0
			local var_510_7 = 0.15

			if var_510_6 < arg_507_1.time_ and arg_507_1.time_ <= var_510_6 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_8 = arg_507_1:FormatText(StoryNameCfg[7].name)

				arg_507_1.leftNameTxt_.text = var_510_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_9 = arg_507_1:GetWordFromCfg(910601135)
				local var_510_10 = arg_507_1:FormatText(var_510_9.content)

				arg_507_1.text_.text = var_510_10

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_11 = 6
				local var_510_12 = utf8.len(var_510_10)
				local var_510_13 = var_510_11 <= 0 and var_510_7 or var_510_7 * (var_510_12 / var_510_11)

				if var_510_13 > 0 and var_510_7 < var_510_13 then
					arg_507_1.talkMaxDuration = var_510_13

					if var_510_13 + var_510_6 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_13 + var_510_6
					end
				end

				arg_507_1.text_.text = var_510_10
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_14 = math.max(var_510_7, arg_507_1.talkMaxDuration)

			if var_510_6 <= arg_507_1.time_ and arg_507_1.time_ < var_510_6 + var_510_14 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_6) / var_510_14

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_6 + var_510_14 and arg_507_1.time_ < var_510_6 + var_510_14 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play910601136 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 910601136
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play910601137(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1048ui_story"].transform
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1.var_.moveOldPos1048ui_story = var_514_0.localPosition
			end

			local var_514_2 = 0.001

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2
				local var_514_4 = Vector3.New(0, 100, 0)

				var_514_0.localPosition = Vector3.Lerp(arg_511_1.var_.moveOldPos1048ui_story, var_514_4, var_514_3)

				local var_514_5 = manager.ui.mainCamera.transform.position - var_514_0.position

				var_514_0.forward = Vector3.New(var_514_5.x, var_514_5.y, var_514_5.z)

				local var_514_6 = var_514_0.localEulerAngles

				var_514_6.z = 0
				var_514_6.x = 0
				var_514_0.localEulerAngles = var_514_6
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 then
				var_514_0.localPosition = Vector3.New(0, 100, 0)

				local var_514_7 = manager.ui.mainCamera.transform.position - var_514_0.position

				var_514_0.forward = Vector3.New(var_514_7.x, var_514_7.y, var_514_7.z)

				local var_514_8 = var_514_0.localEulerAngles

				var_514_8.z = 0
				var_514_8.x = 0
				var_514_0.localEulerAngles = var_514_8
			end

			local var_514_9 = 0
			local var_514_10 = 0.125

			if var_514_9 < arg_511_1.time_ and arg_511_1.time_ <= var_514_9 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, false)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_11 = arg_511_1:GetWordFromCfg(910601136)
				local var_514_12 = arg_511_1:FormatText(var_514_11.content)

				arg_511_1.text_.text = var_514_12

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_13 = 5
				local var_514_14 = utf8.len(var_514_12)
				local var_514_15 = var_514_13 <= 0 and var_514_10 or var_514_10 * (var_514_14 / var_514_13)

				if var_514_15 > 0 and var_514_10 < var_514_15 then
					arg_511_1.talkMaxDuration = var_514_15

					if var_514_15 + var_514_9 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_15 + var_514_9
					end
				end

				arg_511_1.text_.text = var_514_12
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_16 = math.max(var_514_10, arg_511_1.talkMaxDuration)

			if var_514_9 <= arg_511_1.time_ and arg_511_1.time_ < var_514_9 + var_514_16 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_9) / var_514_16

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_9 + var_514_16 and arg_511_1.time_ < var_514_9 + var_514_16 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play910601137 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 910601137
		arg_515_1.duration_ = 6.666

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play910601138(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1084ui_story"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos1084ui_story = var_518_0.localPosition
			end

			local var_518_2 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2
				local var_518_4 = Vector3.New(0, -0.97, -6)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1084ui_story, var_518_4, var_518_3)

				local var_518_5 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_5.x, var_518_5.y, var_518_5.z)

				local var_518_6 = var_518_0.localEulerAngles

				var_518_6.z = 0
				var_518_6.x = 0
				var_518_0.localEulerAngles = var_518_6
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_518_7 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_7.x, var_518_7.y, var_518_7.z)

				local var_518_8 = var_518_0.localEulerAngles

				var_518_8.z = 0
				var_518_8.x = 0
				var_518_0.localEulerAngles = var_518_8
			end

			local var_518_9 = arg_515_1.actors_["1084ui_story"]
			local var_518_10 = 0

			if var_518_10 < arg_515_1.time_ and arg_515_1.time_ <= var_518_10 + arg_518_0 and arg_515_1.var_.characterEffect1084ui_story == nil then
				arg_515_1.var_.characterEffect1084ui_story = var_518_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_11 = 0.200000002980232

			if var_518_10 <= arg_515_1.time_ and arg_515_1.time_ < var_518_10 + var_518_11 then
				local var_518_12 = (arg_515_1.time_ - var_518_10) / var_518_11

				if arg_515_1.var_.characterEffect1084ui_story then
					arg_515_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_515_1.time_ >= var_518_10 + var_518_11 and arg_515_1.time_ < var_518_10 + var_518_11 + arg_518_0 and arg_515_1.var_.characterEffect1084ui_story then
				arg_515_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_518_13 = 0

			if var_518_13 < arg_515_1.time_ and arg_515_1.time_ <= var_518_13 + arg_518_0 then
				arg_515_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_518_14 = 0

			if var_518_14 < arg_515_1.time_ and arg_515_1.time_ <= var_518_14 + arg_518_0 then
				arg_515_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_518_15 = 0
			local var_518_16 = 0.7

			if var_518_15 < arg_515_1.time_ and arg_515_1.time_ <= var_518_15 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_17 = arg_515_1:FormatText(StoryNameCfg[6].name)

				arg_515_1.leftNameTxt_.text = var_518_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_18 = arg_515_1:GetWordFromCfg(910601137)
				local var_518_19 = arg_515_1:FormatText(var_518_18.content)

				arg_515_1.text_.text = var_518_19

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_20 = 28
				local var_518_21 = utf8.len(var_518_19)
				local var_518_22 = var_518_20 <= 0 and var_518_16 or var_518_16 * (var_518_21 / var_518_20)

				if var_518_22 > 0 and var_518_16 < var_518_22 then
					arg_515_1.talkMaxDuration = var_518_22

					if var_518_22 + var_518_15 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_22 + var_518_15
					end
				end

				arg_515_1.text_.text = var_518_19
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601137", "story_v_out_910601.awb") ~= 0 then
					local var_518_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601137", "story_v_out_910601.awb") / 1000

					if var_518_23 + var_518_15 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_23 + var_518_15
					end

					if var_518_18.prefab_name ~= "" and arg_515_1.actors_[var_518_18.prefab_name] ~= nil then
						local var_518_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_18.prefab_name].transform, "story_v_out_910601", "910601137", "story_v_out_910601.awb")

						arg_515_1:RecordAudio("910601137", var_518_24)
						arg_515_1:RecordAudio("910601137", var_518_24)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_910601", "910601137", "story_v_out_910601.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_910601", "910601137", "story_v_out_910601.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_25 = math.max(var_518_16, arg_515_1.talkMaxDuration)

			if var_518_15 <= arg_515_1.time_ and arg_515_1.time_ < var_518_15 + var_518_25 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_15) / var_518_25

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_15 + var_518_25 and arg_515_1.time_ < var_518_15 + var_518_25 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play910601138 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 910601138
		arg_519_1.duration_ = 5

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play910601139(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["1084ui_story"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and arg_519_1.var_.characterEffect1084ui_story == nil then
				arg_519_1.var_.characterEffect1084ui_story = var_522_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_2 = 0.200000002980232

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.characterEffect1084ui_story then
					local var_522_4 = Mathf.Lerp(0, 0.5, var_522_3)

					arg_519_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_519_1.var_.characterEffect1084ui_story.fillRatio = var_522_4
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and arg_519_1.var_.characterEffect1084ui_story then
				local var_522_5 = 0.5

				arg_519_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_519_1.var_.characterEffect1084ui_story.fillRatio = var_522_5
			end

			local var_522_6 = 0
			local var_522_7 = 0.35

			if var_522_6 < arg_519_1.time_ and arg_519_1.time_ <= var_522_6 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_8 = arg_519_1:FormatText(StoryNameCfg[7].name)

				arg_519_1.leftNameTxt_.text = var_522_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_9 = arg_519_1:GetWordFromCfg(910601138)
				local var_522_10 = arg_519_1:FormatText(var_522_9.content)

				arg_519_1.text_.text = var_522_10

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_11 = 14
				local var_522_12 = utf8.len(var_522_10)
				local var_522_13 = var_522_11 <= 0 and var_522_7 or var_522_7 * (var_522_12 / var_522_11)

				if var_522_13 > 0 and var_522_7 < var_522_13 then
					arg_519_1.talkMaxDuration = var_522_13

					if var_522_13 + var_522_6 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_13 + var_522_6
					end
				end

				arg_519_1.text_.text = var_522_10
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)
				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_14 = math.max(var_522_7, arg_519_1.talkMaxDuration)

			if var_522_6 <= arg_519_1.time_ and arg_519_1.time_ < var_522_6 + var_522_14 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_6) / var_522_14

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_6 + var_522_14 and arg_519_1.time_ < var_522_6 + var_522_14 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play910601139 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 910601139
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play910601140(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1084ui_story"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and arg_523_1.var_.characterEffect1084ui_story == nil then
				arg_523_1.var_.characterEffect1084ui_story = var_526_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_526_2 = 0.200000002980232

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.characterEffect1084ui_story then
					local var_526_4 = Mathf.Lerp(0, 0.5, var_526_3)

					arg_523_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_523_1.var_.characterEffect1084ui_story.fillRatio = var_526_4
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and arg_523_1.var_.characterEffect1084ui_story then
				local var_526_5 = 0.5

				arg_523_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_523_1.var_.characterEffect1084ui_story.fillRatio = var_526_5
			end

			local var_526_6 = 0
			local var_526_7 = 0.575

			if var_526_6 < arg_523_1.time_ and arg_523_1.time_ <= var_526_6 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_8 = arg_523_1:FormatText(StoryNameCfg[7].name)

				arg_523_1.leftNameTxt_.text = var_526_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_9 = arg_523_1:GetWordFromCfg(910601139)
				local var_526_10 = arg_523_1:FormatText(var_526_9.content)

				arg_523_1.text_.text = var_526_10

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_11 = 21
				local var_526_12 = utf8.len(var_526_10)
				local var_526_13 = var_526_11 <= 0 and var_526_7 or var_526_7 * (var_526_12 / var_526_11)

				if var_526_13 > 0 and var_526_7 < var_526_13 then
					arg_523_1.talkMaxDuration = var_526_13

					if var_526_13 + var_526_6 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_13 + var_526_6
					end
				end

				arg_523_1.text_.text = var_526_10
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_14 = math.max(var_526_7, arg_523_1.talkMaxDuration)

			if var_526_6 <= arg_523_1.time_ and arg_523_1.time_ < var_526_6 + var_526_14 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_6) / var_526_14

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_6 + var_526_14 and arg_523_1.time_ < var_526_6 + var_526_14 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play910601140 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 910601140
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play910601141(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 0.35

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_2 = arg_527_1:FormatText(StoryNameCfg[7].name)

				arg_527_1.leftNameTxt_.text = var_530_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_3 = arg_527_1:GetWordFromCfg(910601140)
				local var_530_4 = arg_527_1:FormatText(var_530_3.content)

				arg_527_1.text_.text = var_530_4

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_5 = 14
				local var_530_6 = utf8.len(var_530_4)
				local var_530_7 = var_530_5 <= 0 and var_530_1 or var_530_1 * (var_530_6 / var_530_5)

				if var_530_7 > 0 and var_530_1 < var_530_7 then
					arg_527_1.talkMaxDuration = var_530_7

					if var_530_7 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_7 + var_530_0
					end
				end

				arg_527_1.text_.text = var_530_4
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_8 = math.max(var_530_1, arg_527_1.talkMaxDuration)

			if var_530_0 <= arg_527_1.time_ and arg_527_1.time_ < var_530_0 + var_530_8 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_0) / var_530_8

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_0 + var_530_8 and arg_527_1.time_ < var_530_0 + var_530_8 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play910601141 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 910601141
		arg_531_1.duration_ = 1.999999999999

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play910601142(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1084ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.characterEffect1084ui_story == nil then
				arg_531_1.var_.characterEffect1084ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.200000002980232

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1084ui_story then
					local var_534_4 = Mathf.Lerp(0, 0.5, var_534_3)

					arg_531_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_531_1.var_.characterEffect1084ui_story.fillRatio = var_534_4
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.characterEffect1084ui_story then
				local var_534_5 = 0.5

				arg_531_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_531_1.var_.characterEffect1084ui_story.fillRatio = var_534_5
			end

			local var_534_6 = 0

			if var_534_6 < arg_531_1.time_ and arg_531_1.time_ <= var_534_6 + arg_534_0 then
				arg_531_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_534_7 = 0
			local var_534_8 = 0.05

			if var_534_7 < arg_531_1.time_ and arg_531_1.time_ <= var_534_7 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_9 = arg_531_1:FormatText(StoryNameCfg[6].name)

				arg_531_1.leftNameTxt_.text = var_534_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_10 = arg_531_1:GetWordFromCfg(910601141)
				local var_534_11 = arg_531_1:FormatText(var_534_10.content)

				arg_531_1.text_.text = var_534_11

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_12 = 2
				local var_534_13 = utf8.len(var_534_11)
				local var_534_14 = var_534_12 <= 0 and var_534_8 or var_534_8 * (var_534_13 / var_534_12)

				if var_534_14 > 0 and var_534_8 < var_534_14 then
					arg_531_1.talkMaxDuration = var_534_14

					if var_534_14 + var_534_7 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_14 + var_534_7
					end
				end

				arg_531_1.text_.text = var_534_11
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601141", "story_v_out_910601.awb") ~= 0 then
					local var_534_15 = manager.audio:GetVoiceLength("story_v_out_910601", "910601141", "story_v_out_910601.awb") / 1000

					if var_534_15 + var_534_7 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_15 + var_534_7
					end

					if var_534_10.prefab_name ~= "" and arg_531_1.actors_[var_534_10.prefab_name] ~= nil then
						local var_534_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_10.prefab_name].transform, "story_v_out_910601", "910601141", "story_v_out_910601.awb")

						arg_531_1:RecordAudio("910601141", var_534_16)
						arg_531_1:RecordAudio("910601141", var_534_16)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_910601", "910601141", "story_v_out_910601.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_910601", "910601141", "story_v_out_910601.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_17 = math.max(var_534_8, arg_531_1.talkMaxDuration)

			if var_534_7 <= arg_531_1.time_ and arg_531_1.time_ < var_534_7 + var_534_17 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_7) / var_534_17

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_7 + var_534_17 and arg_531_1.time_ < var_534_7 + var_534_17 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play910601142 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 910601142
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play910601143(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1084ui_story"].transform
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				arg_535_1.var_.moveOldPos1084ui_story = var_538_0.localPosition
			end

			local var_538_2 = 0.001

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2
				local var_538_4 = Vector3.New(0, 100, 0)

				var_538_0.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos1084ui_story, var_538_4, var_538_3)

				local var_538_5 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_5.x, var_538_5.y, var_538_5.z)

				local var_538_6 = var_538_0.localEulerAngles

				var_538_6.z = 0
				var_538_6.x = 0
				var_538_0.localEulerAngles = var_538_6
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 then
				var_538_0.localPosition = Vector3.New(0, 100, 0)

				local var_538_7 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_7.x, var_538_7.y, var_538_7.z)

				local var_538_8 = var_538_0.localEulerAngles

				var_538_8.z = 0
				var_538_8.x = 0
				var_538_0.localEulerAngles = var_538_8
			end

			local var_538_9 = 0
			local var_538_10 = 1.35

			if var_538_9 < arg_535_1.time_ and arg_535_1.time_ <= var_538_9 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, false)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_11 = arg_535_1:GetWordFromCfg(910601142)
				local var_538_12 = arg_535_1:FormatText(var_538_11.content)

				arg_535_1.text_.text = var_538_12

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_13 = 54
				local var_538_14 = utf8.len(var_538_12)
				local var_538_15 = var_538_13 <= 0 and var_538_10 or var_538_10 * (var_538_14 / var_538_13)

				if var_538_15 > 0 and var_538_10 < var_538_15 then
					arg_535_1.talkMaxDuration = var_538_15

					if var_538_15 + var_538_9 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_15 + var_538_9
					end
				end

				arg_535_1.text_.text = var_538_12
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_16 = math.max(var_538_10, arg_535_1.talkMaxDuration)

			if var_538_9 <= arg_535_1.time_ and arg_535_1.time_ < var_538_9 + var_538_16 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_9) / var_538_16

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_9 + var_538_16 and arg_535_1.time_ < var_538_9 + var_538_16 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play910601143 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 910601143
		arg_539_1.duration_ = 4.833

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play910601144(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1084ui_story"].transform
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1.var_.moveOldPos1084ui_story = var_542_0.localPosition
			end

			local var_542_2 = 0.001

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2
				local var_542_4 = Vector3.New(0, -0.97, -6)

				var_542_0.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1084ui_story, var_542_4, var_542_3)

				local var_542_5 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_5.x, var_542_5.y, var_542_5.z)

				local var_542_6 = var_542_0.localEulerAngles

				var_542_6.z = 0
				var_542_6.x = 0
				var_542_0.localEulerAngles = var_542_6
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 then
				var_542_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_542_7 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_7.x, var_542_7.y, var_542_7.z)

				local var_542_8 = var_542_0.localEulerAngles

				var_542_8.z = 0
				var_542_8.x = 0
				var_542_0.localEulerAngles = var_542_8
			end

			local var_542_9 = 0

			if var_542_9 < arg_539_1.time_ and arg_539_1.time_ <= var_542_9 + arg_542_0 then
				arg_539_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_542_10 = 0

			if var_542_10 < arg_539_1.time_ and arg_539_1.time_ <= var_542_10 + arg_542_0 then
				arg_539_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_542_11 = arg_539_1.actors_["1084ui_story"]
			local var_542_12 = 0

			if var_542_12 < arg_539_1.time_ and arg_539_1.time_ <= var_542_12 + arg_542_0 and arg_539_1.var_.characterEffect1084ui_story == nil then
				arg_539_1.var_.characterEffect1084ui_story = var_542_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_13 = 0.200000002980232

			if var_542_12 <= arg_539_1.time_ and arg_539_1.time_ < var_542_12 + var_542_13 then
				local var_542_14 = (arg_539_1.time_ - var_542_12) / var_542_13

				if arg_539_1.var_.characterEffect1084ui_story then
					arg_539_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_12 + var_542_13 and arg_539_1.time_ < var_542_12 + var_542_13 + arg_542_0 and arg_539_1.var_.characterEffect1084ui_story then
				arg_539_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_542_15 = 0
			local var_542_16 = 0.5

			if var_542_15 < arg_539_1.time_ and arg_539_1.time_ <= var_542_15 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_17 = arg_539_1:FormatText(StoryNameCfg[6].name)

				arg_539_1.leftNameTxt_.text = var_542_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_18 = arg_539_1:GetWordFromCfg(910601143)
				local var_542_19 = arg_539_1:FormatText(var_542_18.content)

				arg_539_1.text_.text = var_542_19

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_20 = 20
				local var_542_21 = utf8.len(var_542_19)
				local var_542_22 = var_542_20 <= 0 and var_542_16 or var_542_16 * (var_542_21 / var_542_20)

				if var_542_22 > 0 and var_542_16 < var_542_22 then
					arg_539_1.talkMaxDuration = var_542_22

					if var_542_22 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_22 + var_542_15
					end
				end

				arg_539_1.text_.text = var_542_19
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601143", "story_v_out_910601.awb") ~= 0 then
					local var_542_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601143", "story_v_out_910601.awb") / 1000

					if var_542_23 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_23 + var_542_15
					end

					if var_542_18.prefab_name ~= "" and arg_539_1.actors_[var_542_18.prefab_name] ~= nil then
						local var_542_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_18.prefab_name].transform, "story_v_out_910601", "910601143", "story_v_out_910601.awb")

						arg_539_1:RecordAudio("910601143", var_542_24)
						arg_539_1:RecordAudio("910601143", var_542_24)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_910601", "910601143", "story_v_out_910601.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_910601", "910601143", "story_v_out_910601.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_25 = math.max(var_542_16, arg_539_1.talkMaxDuration)

			if var_542_15 <= arg_539_1.time_ and arg_539_1.time_ < var_542_15 + var_542_25 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_15) / var_542_25

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_15 + var_542_25 and arg_539_1.time_ < var_542_15 + var_542_25 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play910601144 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 910601144
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play910601145(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1084ui_story"]
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 and arg_543_1.var_.characterEffect1084ui_story == nil then
				arg_543_1.var_.characterEffect1084ui_story = var_546_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_2 = 0.200000002980232

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2

				if arg_543_1.var_.characterEffect1084ui_story then
					local var_546_4 = Mathf.Lerp(0, 0.5, var_546_3)

					arg_543_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_543_1.var_.characterEffect1084ui_story.fillRatio = var_546_4
				end
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 and arg_543_1.var_.characterEffect1084ui_story then
				local var_546_5 = 0.5

				arg_543_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_543_1.var_.characterEffect1084ui_story.fillRatio = var_546_5
			end

			local var_546_6 = 0
			local var_546_7 = 0.175

			if var_546_6 < arg_543_1.time_ and arg_543_1.time_ <= var_546_6 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_8 = arg_543_1:FormatText(StoryNameCfg[7].name)

				arg_543_1.leftNameTxt_.text = var_546_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_9 = arg_543_1:GetWordFromCfg(910601144)
				local var_546_10 = arg_543_1:FormatText(var_546_9.content)

				arg_543_1.text_.text = var_546_10

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_11 = 7
				local var_546_12 = utf8.len(var_546_10)
				local var_546_13 = var_546_11 <= 0 and var_546_7 or var_546_7 * (var_546_12 / var_546_11)

				if var_546_13 > 0 and var_546_7 < var_546_13 then
					arg_543_1.talkMaxDuration = var_546_13

					if var_546_13 + var_546_6 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_13 + var_546_6
					end
				end

				arg_543_1.text_.text = var_546_10
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_14 = math.max(var_546_7, arg_543_1.talkMaxDuration)

			if var_546_6 <= arg_543_1.time_ and arg_543_1.time_ < var_546_6 + var_546_14 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_6) / var_546_14

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_6 + var_546_14 and arg_543_1.time_ < var_546_6 + var_546_14 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play910601145 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 910601145
		arg_547_1.duration_ = 3.1

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play910601146(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["1011ui_story"].transform
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 then
				arg_547_1.var_.moveOldPos1011ui_story = var_550_0.localPosition
			end

			local var_550_2 = 0.001

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2
				local var_550_4 = Vector3.New(0.7, -0.71, -6)

				var_550_0.localPosition = Vector3.Lerp(arg_547_1.var_.moveOldPos1011ui_story, var_550_4, var_550_3)

				local var_550_5 = manager.ui.mainCamera.transform.position - var_550_0.position

				var_550_0.forward = Vector3.New(var_550_5.x, var_550_5.y, var_550_5.z)

				local var_550_6 = var_550_0.localEulerAngles

				var_550_6.z = 0
				var_550_6.x = 0
				var_550_0.localEulerAngles = var_550_6
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 then
				var_550_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_550_7 = manager.ui.mainCamera.transform.position - var_550_0.position

				var_550_0.forward = Vector3.New(var_550_7.x, var_550_7.y, var_550_7.z)

				local var_550_8 = var_550_0.localEulerAngles

				var_550_8.z = 0
				var_550_8.x = 0
				var_550_0.localEulerAngles = var_550_8
			end

			local var_550_9 = arg_547_1.actors_["1011ui_story"]
			local var_550_10 = 0

			if var_550_10 < arg_547_1.time_ and arg_547_1.time_ <= var_550_10 + arg_550_0 and arg_547_1.var_.characterEffect1011ui_story == nil then
				arg_547_1.var_.characterEffect1011ui_story = var_550_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_11 = 0.200000002980232

			if var_550_10 <= arg_547_1.time_ and arg_547_1.time_ < var_550_10 + var_550_11 then
				local var_550_12 = (arg_547_1.time_ - var_550_10) / var_550_11

				if arg_547_1.var_.characterEffect1011ui_story then
					arg_547_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_547_1.time_ >= var_550_10 + var_550_11 and arg_547_1.time_ < var_550_10 + var_550_11 + arg_550_0 and arg_547_1.var_.characterEffect1011ui_story then
				arg_547_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_550_13 = 0

			if var_550_13 < arg_547_1.time_ and arg_547_1.time_ <= var_550_13 + arg_550_0 then
				arg_547_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_1")
			end

			local var_550_14 = 0

			if var_550_14 < arg_547_1.time_ and arg_547_1.time_ <= var_550_14 + arg_550_0 then
				arg_547_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_550_15 = arg_547_1.actors_["1084ui_story"].transform
			local var_550_16 = 0

			if var_550_16 < arg_547_1.time_ and arg_547_1.time_ <= var_550_16 + arg_550_0 then
				arg_547_1.var_.moveOldPos1084ui_story = var_550_15.localPosition
			end

			local var_550_17 = 0.001

			if var_550_16 <= arg_547_1.time_ and arg_547_1.time_ < var_550_16 + var_550_17 then
				local var_550_18 = (arg_547_1.time_ - var_550_16) / var_550_17
				local var_550_19 = Vector3.New(-0.7, -0.97, -6)

				var_550_15.localPosition = Vector3.Lerp(arg_547_1.var_.moveOldPos1084ui_story, var_550_19, var_550_18)

				local var_550_20 = manager.ui.mainCamera.transform.position - var_550_15.position

				var_550_15.forward = Vector3.New(var_550_20.x, var_550_20.y, var_550_20.z)

				local var_550_21 = var_550_15.localEulerAngles

				var_550_21.z = 0
				var_550_21.x = 0
				var_550_15.localEulerAngles = var_550_21
			end

			if arg_547_1.time_ >= var_550_16 + var_550_17 and arg_547_1.time_ < var_550_16 + var_550_17 + arg_550_0 then
				var_550_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_550_22 = manager.ui.mainCamera.transform.position - var_550_15.position

				var_550_15.forward = Vector3.New(var_550_22.x, var_550_22.y, var_550_22.z)

				local var_550_23 = var_550_15.localEulerAngles

				var_550_23.z = 0
				var_550_23.x = 0
				var_550_15.localEulerAngles = var_550_23
			end

			local var_550_24 = arg_547_1.actors_["1084ui_story"]
			local var_550_25 = 0

			if var_550_25 < arg_547_1.time_ and arg_547_1.time_ <= var_550_25 + arg_550_0 and arg_547_1.var_.characterEffect1084ui_story == nil then
				arg_547_1.var_.characterEffect1084ui_story = var_550_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_26 = 0.200000002980232

			if var_550_25 <= arg_547_1.time_ and arg_547_1.time_ < var_550_25 + var_550_26 then
				local var_550_27 = (arg_547_1.time_ - var_550_25) / var_550_26

				if arg_547_1.var_.characterEffect1084ui_story then
					local var_550_28 = Mathf.Lerp(0, 0.5, var_550_27)

					arg_547_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_547_1.var_.characterEffect1084ui_story.fillRatio = var_550_28
				end
			end

			if arg_547_1.time_ >= var_550_25 + var_550_26 and arg_547_1.time_ < var_550_25 + var_550_26 + arg_550_0 and arg_547_1.var_.characterEffect1084ui_story then
				local var_550_29 = 0.5

				arg_547_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_547_1.var_.characterEffect1084ui_story.fillRatio = var_550_29
			end

			local var_550_30 = 0
			local var_550_31 = 0.3

			if var_550_30 < arg_547_1.time_ and arg_547_1.time_ <= var_550_30 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_32 = arg_547_1:FormatText(StoryNameCfg[37].name)

				arg_547_1.leftNameTxt_.text = var_550_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_33 = arg_547_1:GetWordFromCfg(910601145)
				local var_550_34 = arg_547_1:FormatText(var_550_33.content)

				arg_547_1.text_.text = var_550_34

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_35 = 12
				local var_550_36 = utf8.len(var_550_34)
				local var_550_37 = var_550_35 <= 0 and var_550_31 or var_550_31 * (var_550_36 / var_550_35)

				if var_550_37 > 0 and var_550_31 < var_550_37 then
					arg_547_1.talkMaxDuration = var_550_37

					if var_550_37 + var_550_30 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_37 + var_550_30
					end
				end

				arg_547_1.text_.text = var_550_34
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601145", "story_v_out_910601.awb") ~= 0 then
					local var_550_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601145", "story_v_out_910601.awb") / 1000

					if var_550_38 + var_550_30 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_38 + var_550_30
					end

					if var_550_33.prefab_name ~= "" and arg_547_1.actors_[var_550_33.prefab_name] ~= nil then
						local var_550_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_33.prefab_name].transform, "story_v_out_910601", "910601145", "story_v_out_910601.awb")

						arg_547_1:RecordAudio("910601145", var_550_39)
						arg_547_1:RecordAudio("910601145", var_550_39)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_910601", "910601145", "story_v_out_910601.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_910601", "910601145", "story_v_out_910601.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_40 = math.max(var_550_31, arg_547_1.talkMaxDuration)

			if var_550_30 <= arg_547_1.time_ and arg_547_1.time_ < var_550_30 + var_550_40 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_30) / var_550_40

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_30 + var_550_40 and arg_547_1.time_ < var_550_30 + var_550_40 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play910601146 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 910601146
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play910601147(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1011ui_story"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and arg_551_1.var_.characterEffect1011ui_story == nil then
				arg_551_1.var_.characterEffect1011ui_story = var_554_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_2 = 0.200000002980232

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.characterEffect1011ui_story then
					local var_554_4 = Mathf.Lerp(0, 0.5, var_554_3)

					arg_551_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_551_1.var_.characterEffect1011ui_story.fillRatio = var_554_4
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and arg_551_1.var_.characterEffect1011ui_story then
				local var_554_5 = 0.5

				arg_551_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_551_1.var_.characterEffect1011ui_story.fillRatio = var_554_5
			end

			local var_554_6 = arg_551_1.actors_["1084ui_story"].transform
			local var_554_7 = 0

			if var_554_7 < arg_551_1.time_ and arg_551_1.time_ <= var_554_7 + arg_554_0 then
				arg_551_1.var_.moveOldPos1084ui_story = var_554_6.localPosition
			end

			local var_554_8 = 0.001

			if var_554_7 <= arg_551_1.time_ and arg_551_1.time_ < var_554_7 + var_554_8 then
				local var_554_9 = (arg_551_1.time_ - var_554_7) / var_554_8
				local var_554_10 = Vector3.New(0, 100, 0)

				var_554_6.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1084ui_story, var_554_10, var_554_9)

				local var_554_11 = manager.ui.mainCamera.transform.position - var_554_6.position

				var_554_6.forward = Vector3.New(var_554_11.x, var_554_11.y, var_554_11.z)

				local var_554_12 = var_554_6.localEulerAngles

				var_554_12.z = 0
				var_554_12.x = 0
				var_554_6.localEulerAngles = var_554_12
			end

			if arg_551_1.time_ >= var_554_7 + var_554_8 and arg_551_1.time_ < var_554_7 + var_554_8 + arg_554_0 then
				var_554_6.localPosition = Vector3.New(0, 100, 0)

				local var_554_13 = manager.ui.mainCamera.transform.position - var_554_6.position

				var_554_6.forward = Vector3.New(var_554_13.x, var_554_13.y, var_554_13.z)

				local var_554_14 = var_554_6.localEulerAngles

				var_554_14.z = 0
				var_554_14.x = 0
				var_554_6.localEulerAngles = var_554_14
			end

			local var_554_15 = arg_551_1.actors_["1011ui_story"].transform
			local var_554_16 = 0

			if var_554_16 < arg_551_1.time_ and arg_551_1.time_ <= var_554_16 + arg_554_0 then
				arg_551_1.var_.moveOldPos1011ui_story = var_554_15.localPosition
			end

			local var_554_17 = 0.001

			if var_554_16 <= arg_551_1.time_ and arg_551_1.time_ < var_554_16 + var_554_17 then
				local var_554_18 = (arg_551_1.time_ - var_554_16) / var_554_17
				local var_554_19 = Vector3.New(0, 100, 0)

				var_554_15.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1011ui_story, var_554_19, var_554_18)

				local var_554_20 = manager.ui.mainCamera.transform.position - var_554_15.position

				var_554_15.forward = Vector3.New(var_554_20.x, var_554_20.y, var_554_20.z)

				local var_554_21 = var_554_15.localEulerAngles

				var_554_21.z = 0
				var_554_21.x = 0
				var_554_15.localEulerAngles = var_554_21
			end

			if arg_551_1.time_ >= var_554_16 + var_554_17 and arg_551_1.time_ < var_554_16 + var_554_17 + arg_554_0 then
				var_554_15.localPosition = Vector3.New(0, 100, 0)

				local var_554_22 = manager.ui.mainCamera.transform.position - var_554_15.position

				var_554_15.forward = Vector3.New(var_554_22.x, var_554_22.y, var_554_22.z)

				local var_554_23 = var_554_15.localEulerAngles

				var_554_23.z = 0
				var_554_23.x = 0
				var_554_15.localEulerAngles = var_554_23
			end

			local var_554_24 = 0
			local var_554_25 = 0.9

			if var_554_24 < arg_551_1.time_ and arg_551_1.time_ <= var_554_24 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_26 = arg_551_1:GetWordFromCfg(910601146)
				local var_554_27 = arg_551_1:FormatText(var_554_26.content)

				arg_551_1.text_.text = var_554_27

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_28 = 36
				local var_554_29 = utf8.len(var_554_27)
				local var_554_30 = var_554_28 <= 0 and var_554_25 or var_554_25 * (var_554_29 / var_554_28)

				if var_554_30 > 0 and var_554_25 < var_554_30 then
					arg_551_1.talkMaxDuration = var_554_30

					if var_554_30 + var_554_24 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_30 + var_554_24
					end
				end

				arg_551_1.text_.text = var_554_27
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_31 = math.max(var_554_25, arg_551_1.talkMaxDuration)

			if var_554_24 <= arg_551_1.time_ and arg_551_1.time_ < var_554_24 + var_554_31 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_24) / var_554_31

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_24 + var_554_31 and arg_551_1.time_ < var_554_24 + var_554_31 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play910601147 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 910601147
		arg_555_1.duration_ = 14.166

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play910601148(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1011ui_story"].transform
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 then
				arg_555_1.var_.moveOldPos1011ui_story = var_558_0.localPosition
			end

			local var_558_2 = 0.001

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2
				local var_558_4 = Vector3.New(0, -0.71, -6)

				var_558_0.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos1011ui_story, var_558_4, var_558_3)

				local var_558_5 = manager.ui.mainCamera.transform.position - var_558_0.position

				var_558_0.forward = Vector3.New(var_558_5.x, var_558_5.y, var_558_5.z)

				local var_558_6 = var_558_0.localEulerAngles

				var_558_6.z = 0
				var_558_6.x = 0
				var_558_0.localEulerAngles = var_558_6
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 then
				var_558_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_558_7 = manager.ui.mainCamera.transform.position - var_558_0.position

				var_558_0.forward = Vector3.New(var_558_7.x, var_558_7.y, var_558_7.z)

				local var_558_8 = var_558_0.localEulerAngles

				var_558_8.z = 0
				var_558_8.x = 0
				var_558_0.localEulerAngles = var_558_8
			end

			local var_558_9 = arg_555_1.actors_["1011ui_story"]
			local var_558_10 = 0

			if var_558_10 < arg_555_1.time_ and arg_555_1.time_ <= var_558_10 + arg_558_0 and arg_555_1.var_.characterEffect1011ui_story == nil then
				arg_555_1.var_.characterEffect1011ui_story = var_558_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_11 = 0.200000002980232

			if var_558_10 <= arg_555_1.time_ and arg_555_1.time_ < var_558_10 + var_558_11 then
				local var_558_12 = (arg_555_1.time_ - var_558_10) / var_558_11

				if arg_555_1.var_.characterEffect1011ui_story then
					arg_555_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_555_1.time_ >= var_558_10 + var_558_11 and arg_555_1.time_ < var_558_10 + var_558_11 + arg_558_0 and arg_555_1.var_.characterEffect1011ui_story then
				arg_555_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_558_13 = 0

			if var_558_13 < arg_555_1.time_ and arg_555_1.time_ <= var_558_13 + arg_558_0 then
				arg_555_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_558_14 = 0

			if var_558_14 < arg_555_1.time_ and arg_555_1.time_ <= var_558_14 + arg_558_0 then
				arg_555_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_558_15 = 0
			local var_558_16 = 1.525

			if var_558_15 < arg_555_1.time_ and arg_555_1.time_ <= var_558_15 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_17 = arg_555_1:FormatText(StoryNameCfg[37].name)

				arg_555_1.leftNameTxt_.text = var_558_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_18 = arg_555_1:GetWordFromCfg(910601147)
				local var_558_19 = arg_555_1:FormatText(var_558_18.content)

				arg_555_1.text_.text = var_558_19

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_20 = 61
				local var_558_21 = utf8.len(var_558_19)
				local var_558_22 = var_558_20 <= 0 and var_558_16 or var_558_16 * (var_558_21 / var_558_20)

				if var_558_22 > 0 and var_558_16 < var_558_22 then
					arg_555_1.talkMaxDuration = var_558_22

					if var_558_22 + var_558_15 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_22 + var_558_15
					end
				end

				arg_555_1.text_.text = var_558_19
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601147", "story_v_out_910601.awb") ~= 0 then
					local var_558_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601147", "story_v_out_910601.awb") / 1000

					if var_558_23 + var_558_15 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_23 + var_558_15
					end

					if var_558_18.prefab_name ~= "" and arg_555_1.actors_[var_558_18.prefab_name] ~= nil then
						local var_558_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_18.prefab_name].transform, "story_v_out_910601", "910601147", "story_v_out_910601.awb")

						arg_555_1:RecordAudio("910601147", var_558_24)
						arg_555_1:RecordAudio("910601147", var_558_24)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_910601", "910601147", "story_v_out_910601.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_910601", "910601147", "story_v_out_910601.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_25 = math.max(var_558_16, arg_555_1.talkMaxDuration)

			if var_558_15 <= arg_555_1.time_ and arg_555_1.time_ < var_558_15 + var_558_25 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_15) / var_558_25

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_15 + var_558_25 and arg_555_1.time_ < var_558_15 + var_558_25 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play910601148 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 910601148
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play910601149(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1011ui_story"]
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 and arg_559_1.var_.characterEffect1011ui_story == nil then
				arg_559_1.var_.characterEffect1011ui_story = var_562_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_2 = 0.200000002980232

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2

				if arg_559_1.var_.characterEffect1011ui_story then
					local var_562_4 = Mathf.Lerp(0, 0.5, var_562_3)

					arg_559_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_559_1.var_.characterEffect1011ui_story.fillRatio = var_562_4
				end
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 and arg_559_1.var_.characterEffect1011ui_story then
				local var_562_5 = 0.5

				arg_559_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_559_1.var_.characterEffect1011ui_story.fillRatio = var_562_5
			end

			local var_562_6 = 0
			local var_562_7 = 0.3

			if var_562_6 < arg_559_1.time_ and arg_559_1.time_ <= var_562_6 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_8 = arg_559_1:FormatText(StoryNameCfg[7].name)

				arg_559_1.leftNameTxt_.text = var_562_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_9 = arg_559_1:GetWordFromCfg(910601148)
				local var_562_10 = arg_559_1:FormatText(var_562_9.content)

				arg_559_1.text_.text = var_562_10

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_11 = 12
				local var_562_12 = utf8.len(var_562_10)
				local var_562_13 = var_562_11 <= 0 and var_562_7 or var_562_7 * (var_562_12 / var_562_11)

				if var_562_13 > 0 and var_562_7 < var_562_13 then
					arg_559_1.talkMaxDuration = var_562_13

					if var_562_13 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_13 + var_562_6
					end
				end

				arg_559_1.text_.text = var_562_10
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_14 = math.max(var_562_7, arg_559_1.talkMaxDuration)

			if var_562_6 <= arg_559_1.time_ and arg_559_1.time_ < var_562_6 + var_562_14 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_6) / var_562_14

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_6 + var_562_14 and arg_559_1.time_ < var_562_6 + var_562_14 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play910601149 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 910601149
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play910601150(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1011ui_story"].transform
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 then
				arg_563_1.var_.moveOldPos1011ui_story = var_566_0.localPosition
			end

			local var_566_2 = 0.001

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2
				local var_566_4 = Vector3.New(0, 100, 0)

				var_566_0.localPosition = Vector3.Lerp(arg_563_1.var_.moveOldPos1011ui_story, var_566_4, var_566_3)

				local var_566_5 = manager.ui.mainCamera.transform.position - var_566_0.position

				var_566_0.forward = Vector3.New(var_566_5.x, var_566_5.y, var_566_5.z)

				local var_566_6 = var_566_0.localEulerAngles

				var_566_6.z = 0
				var_566_6.x = 0
				var_566_0.localEulerAngles = var_566_6
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 then
				var_566_0.localPosition = Vector3.New(0, 100, 0)

				local var_566_7 = manager.ui.mainCamera.transform.position - var_566_0.position

				var_566_0.forward = Vector3.New(var_566_7.x, var_566_7.y, var_566_7.z)

				local var_566_8 = var_566_0.localEulerAngles

				var_566_8.z = 0
				var_566_8.x = 0
				var_566_0.localEulerAngles = var_566_8
			end

			local var_566_9 = 0
			local var_566_10 = 0.525

			if var_566_9 < arg_563_1.time_ and arg_563_1.time_ <= var_566_9 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_11 = arg_563_1:GetWordFromCfg(910601149)
				local var_566_12 = arg_563_1:FormatText(var_566_11.content)

				arg_563_1.text_.text = var_566_12

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_13 = 21
				local var_566_14 = utf8.len(var_566_12)
				local var_566_15 = var_566_13 <= 0 and var_566_10 or var_566_10 * (var_566_14 / var_566_13)

				if var_566_15 > 0 and var_566_10 < var_566_15 then
					arg_563_1.talkMaxDuration = var_566_15

					if var_566_15 + var_566_9 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_15 + var_566_9
					end
				end

				arg_563_1.text_.text = var_566_12
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_16 = math.max(var_566_10, arg_563_1.talkMaxDuration)

			if var_566_9 <= arg_563_1.time_ and arg_563_1.time_ < var_566_9 + var_566_16 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_9) / var_566_16

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_9 + var_566_16 and arg_563_1.time_ < var_566_9 + var_566_16 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play910601150 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 910601150
		arg_567_1.duration_ = 6.733

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play910601151(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["1028ui_story"].transform
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 then
				arg_567_1.var_.moveOldPos1028ui_story = var_570_0.localPosition
			end

			local var_570_2 = 0.001

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2
				local var_570_4 = Vector3.New(0, -0.9, -5.9)

				var_570_0.localPosition = Vector3.Lerp(arg_567_1.var_.moveOldPos1028ui_story, var_570_4, var_570_3)

				local var_570_5 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_5.x, var_570_5.y, var_570_5.z)

				local var_570_6 = var_570_0.localEulerAngles

				var_570_6.z = 0
				var_570_6.x = 0
				var_570_0.localEulerAngles = var_570_6
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 then
				var_570_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_570_7 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_7.x, var_570_7.y, var_570_7.z)

				local var_570_8 = var_570_0.localEulerAngles

				var_570_8.z = 0
				var_570_8.x = 0
				var_570_0.localEulerAngles = var_570_8
			end

			local var_570_9 = arg_567_1.actors_["1028ui_story"]
			local var_570_10 = 0

			if var_570_10 < arg_567_1.time_ and arg_567_1.time_ <= var_570_10 + arg_570_0 and arg_567_1.var_.characterEffect1028ui_story == nil then
				arg_567_1.var_.characterEffect1028ui_story = var_570_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_570_11 = 0.200000002980232

			if var_570_10 <= arg_567_1.time_ and arg_567_1.time_ < var_570_10 + var_570_11 then
				local var_570_12 = (arg_567_1.time_ - var_570_10) / var_570_11

				if arg_567_1.var_.characterEffect1028ui_story then
					arg_567_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_567_1.time_ >= var_570_10 + var_570_11 and arg_567_1.time_ < var_570_10 + var_570_11 + arg_570_0 and arg_567_1.var_.characterEffect1028ui_story then
				arg_567_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_570_13 = 0

			if var_570_13 < arg_567_1.time_ and arg_567_1.time_ <= var_570_13 + arg_570_0 then
				arg_567_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action3_1")
			end

			local var_570_14 = 0

			if var_570_14 < arg_567_1.time_ and arg_567_1.time_ <= var_570_14 + arg_570_0 then
				arg_567_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_570_15 = arg_567_1.actors_["1084ui_story"].transform
			local var_570_16 = 0

			if var_570_16 < arg_567_1.time_ and arg_567_1.time_ <= var_570_16 + arg_570_0 then
				arg_567_1.var_.moveOldPos1084ui_story = var_570_15.localPosition
			end

			local var_570_17 = 0.001

			if var_570_16 <= arg_567_1.time_ and arg_567_1.time_ < var_570_16 + var_570_17 then
				local var_570_18 = (arg_567_1.time_ - var_570_16) / var_570_17
				local var_570_19 = Vector3.New(0, 100, 0)

				var_570_15.localPosition = Vector3.Lerp(arg_567_1.var_.moveOldPos1084ui_story, var_570_19, var_570_18)

				local var_570_20 = manager.ui.mainCamera.transform.position - var_570_15.position

				var_570_15.forward = Vector3.New(var_570_20.x, var_570_20.y, var_570_20.z)

				local var_570_21 = var_570_15.localEulerAngles

				var_570_21.z = 0
				var_570_21.x = 0
				var_570_15.localEulerAngles = var_570_21
			end

			if arg_567_1.time_ >= var_570_16 + var_570_17 and arg_567_1.time_ < var_570_16 + var_570_17 + arg_570_0 then
				var_570_15.localPosition = Vector3.New(0, 100, 0)

				local var_570_22 = manager.ui.mainCamera.transform.position - var_570_15.position

				var_570_15.forward = Vector3.New(var_570_22.x, var_570_22.y, var_570_22.z)

				local var_570_23 = var_570_15.localEulerAngles

				var_570_23.z = 0
				var_570_23.x = 0
				var_570_15.localEulerAngles = var_570_23
			end

			local var_570_24 = arg_567_1.actors_["1084ui_story"]
			local var_570_25 = 0

			if var_570_25 < arg_567_1.time_ and arg_567_1.time_ <= var_570_25 + arg_570_0 and arg_567_1.var_.characterEffect1084ui_story == nil then
				arg_567_1.var_.characterEffect1084ui_story = var_570_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_570_26 = 0.200000002980232

			if var_570_25 <= arg_567_1.time_ and arg_567_1.time_ < var_570_25 + var_570_26 then
				local var_570_27 = (arg_567_1.time_ - var_570_25) / var_570_26

				if arg_567_1.var_.characterEffect1084ui_story then
					local var_570_28 = Mathf.Lerp(0, 0.5, var_570_27)

					arg_567_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_567_1.var_.characterEffect1084ui_story.fillRatio = var_570_28
				end
			end

			if arg_567_1.time_ >= var_570_25 + var_570_26 and arg_567_1.time_ < var_570_25 + var_570_26 + arg_570_0 and arg_567_1.var_.characterEffect1084ui_story then
				local var_570_29 = 0.5

				arg_567_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_567_1.var_.characterEffect1084ui_story.fillRatio = var_570_29
			end

			local var_570_30 = 0
			local var_570_31 = 0.6

			if var_570_30 < arg_567_1.time_ and arg_567_1.time_ <= var_570_30 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_32 = arg_567_1:FormatText(StoryNameCfg[327].name)

				arg_567_1.leftNameTxt_.text = var_570_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_33 = arg_567_1:GetWordFromCfg(910601150)
				local var_570_34 = arg_567_1:FormatText(var_570_33.content)

				arg_567_1.text_.text = var_570_34

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_35 = 24
				local var_570_36 = utf8.len(var_570_34)
				local var_570_37 = var_570_35 <= 0 and var_570_31 or var_570_31 * (var_570_36 / var_570_35)

				if var_570_37 > 0 and var_570_31 < var_570_37 then
					arg_567_1.talkMaxDuration = var_570_37

					if var_570_37 + var_570_30 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_37 + var_570_30
					end
				end

				arg_567_1.text_.text = var_570_34
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601150", "story_v_out_910601.awb") ~= 0 then
					local var_570_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601150", "story_v_out_910601.awb") / 1000

					if var_570_38 + var_570_30 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_38 + var_570_30
					end

					if var_570_33.prefab_name ~= "" and arg_567_1.actors_[var_570_33.prefab_name] ~= nil then
						local var_570_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_33.prefab_name].transform, "story_v_out_910601", "910601150", "story_v_out_910601.awb")

						arg_567_1:RecordAudio("910601150", var_570_39)
						arg_567_1:RecordAudio("910601150", var_570_39)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_out_910601", "910601150", "story_v_out_910601.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_out_910601", "910601150", "story_v_out_910601.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_40 = math.max(var_570_31, arg_567_1.talkMaxDuration)

			if var_570_30 <= arg_567_1.time_ and arg_567_1.time_ < var_570_30 + var_570_40 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_30) / var_570_40

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_30 + var_570_40 and arg_567_1.time_ < var_570_30 + var_570_40 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play910601151 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 910601151
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play910601152(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1028ui_story"]
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 and arg_571_1.var_.characterEffect1028ui_story == nil then
				arg_571_1.var_.characterEffect1028ui_story = var_574_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_2 = 0.200000002980232

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2

				if arg_571_1.var_.characterEffect1028ui_story then
					local var_574_4 = Mathf.Lerp(0, 0.5, var_574_3)

					arg_571_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_571_1.var_.characterEffect1028ui_story.fillRatio = var_574_4
				end
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 and arg_571_1.var_.characterEffect1028ui_story then
				local var_574_5 = 0.5

				arg_571_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_571_1.var_.characterEffect1028ui_story.fillRatio = var_574_5
			end

			local var_574_6 = 0
			local var_574_7 = 0.55

			if var_574_6 < arg_571_1.time_ and arg_571_1.time_ <= var_574_6 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_8 = arg_571_1:FormatText(StoryNameCfg[7].name)

				arg_571_1.leftNameTxt_.text = var_574_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_9 = arg_571_1:GetWordFromCfg(910601151)
				local var_574_10 = arg_571_1:FormatText(var_574_9.content)

				arg_571_1.text_.text = var_574_10

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_11 = 22
				local var_574_12 = utf8.len(var_574_10)
				local var_574_13 = var_574_11 <= 0 and var_574_7 or var_574_7 * (var_574_12 / var_574_11)

				if var_574_13 > 0 and var_574_7 < var_574_13 then
					arg_571_1.talkMaxDuration = var_574_13

					if var_574_13 + var_574_6 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_13 + var_574_6
					end
				end

				arg_571_1.text_.text = var_574_10
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_14 = math.max(var_574_7, arg_571_1.talkMaxDuration)

			if var_574_6 <= arg_571_1.time_ and arg_571_1.time_ < var_574_6 + var_574_14 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_6) / var_574_14

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_6 + var_574_14 and arg_571_1.time_ < var_574_6 + var_574_14 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play910601152 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 910601152
		arg_575_1.duration_ = 6.4

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play910601153(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1028ui_story"]
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 and arg_575_1.var_.characterEffect1028ui_story == nil then
				arg_575_1.var_.characterEffect1028ui_story = var_578_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_2 = 0.200000002980232

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2

				if arg_575_1.var_.characterEffect1028ui_story then
					arg_575_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 and arg_575_1.var_.characterEffect1028ui_story then
				arg_575_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_578_4 = 0

			if var_578_4 < arg_575_1.time_ and arg_575_1.time_ <= var_578_4 + arg_578_0 then
				arg_575_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action434")
			end

			local var_578_5 = 0

			if var_578_5 < arg_575_1.time_ and arg_575_1.time_ <= var_578_5 + arg_578_0 then
				arg_575_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_578_6 = 0
			local var_578_7 = 0.8

			if var_578_6 < arg_575_1.time_ and arg_575_1.time_ <= var_578_6 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_8 = arg_575_1:FormatText(StoryNameCfg[327].name)

				arg_575_1.leftNameTxt_.text = var_578_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_9 = arg_575_1:GetWordFromCfg(910601152)
				local var_578_10 = arg_575_1:FormatText(var_578_9.content)

				arg_575_1.text_.text = var_578_10

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_11 = 32
				local var_578_12 = utf8.len(var_578_10)
				local var_578_13 = var_578_11 <= 0 and var_578_7 or var_578_7 * (var_578_12 / var_578_11)

				if var_578_13 > 0 and var_578_7 < var_578_13 then
					arg_575_1.talkMaxDuration = var_578_13

					if var_578_13 + var_578_6 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_13 + var_578_6
					end
				end

				arg_575_1.text_.text = var_578_10
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601152", "story_v_out_910601.awb") ~= 0 then
					local var_578_14 = manager.audio:GetVoiceLength("story_v_out_910601", "910601152", "story_v_out_910601.awb") / 1000

					if var_578_14 + var_578_6 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_14 + var_578_6
					end

					if var_578_9.prefab_name ~= "" and arg_575_1.actors_[var_578_9.prefab_name] ~= nil then
						local var_578_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_575_1.actors_[var_578_9.prefab_name].transform, "story_v_out_910601", "910601152", "story_v_out_910601.awb")

						arg_575_1:RecordAudio("910601152", var_578_15)
						arg_575_1:RecordAudio("910601152", var_578_15)
					else
						arg_575_1:AudioAction("play", "voice", "story_v_out_910601", "910601152", "story_v_out_910601.awb")
					end

					arg_575_1:RecordHistoryTalkVoice("story_v_out_910601", "910601152", "story_v_out_910601.awb")
				end

				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_16 = math.max(var_578_7, arg_575_1.talkMaxDuration)

			if var_578_6 <= arg_575_1.time_ and arg_575_1.time_ < var_578_6 + var_578_16 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_6) / var_578_16

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_6 + var_578_16 and arg_575_1.time_ < var_578_6 + var_578_16 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play910601153 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 910601153
		arg_579_1.duration_ = 8.833

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play910601154(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1048ui_story"].transform
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 then
				arg_579_1.var_.moveOldPos1048ui_story = var_582_0.localPosition
			end

			local var_582_2 = 0.001

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2
				local var_582_4 = Vector3.New(0.7, -0.8, -6.2)

				var_582_0.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos1048ui_story, var_582_4, var_582_3)

				local var_582_5 = manager.ui.mainCamera.transform.position - var_582_0.position

				var_582_0.forward = Vector3.New(var_582_5.x, var_582_5.y, var_582_5.z)

				local var_582_6 = var_582_0.localEulerAngles

				var_582_6.z = 0
				var_582_6.x = 0
				var_582_0.localEulerAngles = var_582_6
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 then
				var_582_0.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_582_7 = manager.ui.mainCamera.transform.position - var_582_0.position

				var_582_0.forward = Vector3.New(var_582_7.x, var_582_7.y, var_582_7.z)

				local var_582_8 = var_582_0.localEulerAngles

				var_582_8.z = 0
				var_582_8.x = 0
				var_582_0.localEulerAngles = var_582_8
			end

			local var_582_9 = arg_579_1.actors_["1048ui_story"]
			local var_582_10 = 0

			if var_582_10 < arg_579_1.time_ and arg_579_1.time_ <= var_582_10 + arg_582_0 and arg_579_1.var_.characterEffect1048ui_story == nil then
				arg_579_1.var_.characterEffect1048ui_story = var_582_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_11 = 0.200000002980232

			if var_582_10 <= arg_579_1.time_ and arg_579_1.time_ < var_582_10 + var_582_11 then
				local var_582_12 = (arg_579_1.time_ - var_582_10) / var_582_11

				if arg_579_1.var_.characterEffect1048ui_story then
					arg_579_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_10 + var_582_11 and arg_579_1.time_ < var_582_10 + var_582_11 + arg_582_0 and arg_579_1.var_.characterEffect1048ui_story then
				arg_579_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_582_13 = 0

			if var_582_13 < arg_579_1.time_ and arg_579_1.time_ <= var_582_13 + arg_582_0 then
				arg_579_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action6_1")
			end

			local var_582_14 = 0

			if var_582_14 < arg_579_1.time_ and arg_579_1.time_ <= var_582_14 + arg_582_0 then
				arg_579_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_582_15 = arg_579_1.actors_["1028ui_story"].transform
			local var_582_16 = 0

			if var_582_16 < arg_579_1.time_ and arg_579_1.time_ <= var_582_16 + arg_582_0 then
				arg_579_1.var_.moveOldPos1028ui_story = var_582_15.localPosition
			end

			local var_582_17 = 0.001

			if var_582_16 <= arg_579_1.time_ and arg_579_1.time_ < var_582_16 + var_582_17 then
				local var_582_18 = (arg_579_1.time_ - var_582_16) / var_582_17
				local var_582_19 = Vector3.New(-0.7, -0.9, -5.9)

				var_582_15.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos1028ui_story, var_582_19, var_582_18)

				local var_582_20 = manager.ui.mainCamera.transform.position - var_582_15.position

				var_582_15.forward = Vector3.New(var_582_20.x, var_582_20.y, var_582_20.z)

				local var_582_21 = var_582_15.localEulerAngles

				var_582_21.z = 0
				var_582_21.x = 0
				var_582_15.localEulerAngles = var_582_21
			end

			if arg_579_1.time_ >= var_582_16 + var_582_17 and arg_579_1.time_ < var_582_16 + var_582_17 + arg_582_0 then
				var_582_15.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_582_22 = manager.ui.mainCamera.transform.position - var_582_15.position

				var_582_15.forward = Vector3.New(var_582_22.x, var_582_22.y, var_582_22.z)

				local var_582_23 = var_582_15.localEulerAngles

				var_582_23.z = 0
				var_582_23.x = 0
				var_582_15.localEulerAngles = var_582_23
			end

			local var_582_24 = arg_579_1.actors_["1028ui_story"]
			local var_582_25 = 0

			if var_582_25 < arg_579_1.time_ and arg_579_1.time_ <= var_582_25 + arg_582_0 and arg_579_1.var_.characterEffect1028ui_story == nil then
				arg_579_1.var_.characterEffect1028ui_story = var_582_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_26 = 0.200000002980232

			if var_582_25 <= arg_579_1.time_ and arg_579_1.time_ < var_582_25 + var_582_26 then
				local var_582_27 = (arg_579_1.time_ - var_582_25) / var_582_26

				if arg_579_1.var_.characterEffect1028ui_story then
					local var_582_28 = Mathf.Lerp(0, 0.5, var_582_27)

					arg_579_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_579_1.var_.characterEffect1028ui_story.fillRatio = var_582_28
				end
			end

			if arg_579_1.time_ >= var_582_25 + var_582_26 and arg_579_1.time_ < var_582_25 + var_582_26 + arg_582_0 and arg_579_1.var_.characterEffect1028ui_story then
				local var_582_29 = 0.5

				arg_579_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_579_1.var_.characterEffect1028ui_story.fillRatio = var_582_29
			end

			local var_582_30 = 0

			if var_582_30 < arg_579_1.time_ and arg_579_1.time_ <= var_582_30 + arg_582_0 then
				arg_579_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_2")
			end

			local var_582_31 = 0
			local var_582_32 = 0.95

			if var_582_31 < arg_579_1.time_ and arg_579_1.time_ <= var_582_31 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_33 = arg_579_1:FormatText(StoryNameCfg[8].name)

				arg_579_1.leftNameTxt_.text = var_582_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_34 = arg_579_1:GetWordFromCfg(910601153)
				local var_582_35 = arg_579_1:FormatText(var_582_34.content)

				arg_579_1.text_.text = var_582_35

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_36 = 38
				local var_582_37 = utf8.len(var_582_35)
				local var_582_38 = var_582_36 <= 0 and var_582_32 or var_582_32 * (var_582_37 / var_582_36)

				if var_582_38 > 0 and var_582_32 < var_582_38 then
					arg_579_1.talkMaxDuration = var_582_38

					if var_582_38 + var_582_31 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_38 + var_582_31
					end
				end

				arg_579_1.text_.text = var_582_35
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601153", "story_v_out_910601.awb") ~= 0 then
					local var_582_39 = manager.audio:GetVoiceLength("story_v_out_910601", "910601153", "story_v_out_910601.awb") / 1000

					if var_582_39 + var_582_31 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_39 + var_582_31
					end

					if var_582_34.prefab_name ~= "" and arg_579_1.actors_[var_582_34.prefab_name] ~= nil then
						local var_582_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_34.prefab_name].transform, "story_v_out_910601", "910601153", "story_v_out_910601.awb")

						arg_579_1:RecordAudio("910601153", var_582_40)
						arg_579_1:RecordAudio("910601153", var_582_40)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_out_910601", "910601153", "story_v_out_910601.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_out_910601", "910601153", "story_v_out_910601.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_41 = math.max(var_582_32, arg_579_1.talkMaxDuration)

			if var_582_31 <= arg_579_1.time_ and arg_579_1.time_ < var_582_31 + var_582_41 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_31) / var_582_41

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_31 + var_582_41 and arg_579_1.time_ < var_582_31 + var_582_41 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play910601154 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 910601154
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play910601155(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1048ui_story"]
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 and arg_583_1.var_.characterEffect1048ui_story == nil then
				arg_583_1.var_.characterEffect1048ui_story = var_586_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_2 = 0.200000002980232

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2

				if arg_583_1.var_.characterEffect1048ui_story then
					local var_586_4 = Mathf.Lerp(0, 0.5, var_586_3)

					arg_583_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_583_1.var_.characterEffect1048ui_story.fillRatio = var_586_4
				end
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 and arg_583_1.var_.characterEffect1048ui_story then
				local var_586_5 = 0.5

				arg_583_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_583_1.var_.characterEffect1048ui_story.fillRatio = var_586_5
			end

			local var_586_6 = 0
			local var_586_7 = 0.525

			if var_586_6 < arg_583_1.time_ and arg_583_1.time_ <= var_586_6 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_8 = arg_583_1:FormatText(StoryNameCfg[7].name)

				arg_583_1.leftNameTxt_.text = var_586_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_9 = arg_583_1:GetWordFromCfg(910601154)
				local var_586_10 = arg_583_1:FormatText(var_586_9.content)

				arg_583_1.text_.text = var_586_10

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_11 = 21
				local var_586_12 = utf8.len(var_586_10)
				local var_586_13 = var_586_11 <= 0 and var_586_7 or var_586_7 * (var_586_12 / var_586_11)

				if var_586_13 > 0 and var_586_7 < var_586_13 then
					arg_583_1.talkMaxDuration = var_586_13

					if var_586_13 + var_586_6 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_13 + var_586_6
					end
				end

				arg_583_1.text_.text = var_586_10
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_14 = math.max(var_586_7, arg_583_1.talkMaxDuration)

			if var_586_6 <= arg_583_1.time_ and arg_583_1.time_ < var_586_6 + var_586_14 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_6) / var_586_14

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_6 + var_586_14 and arg_583_1.time_ < var_586_6 + var_586_14 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play910601155 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 910601155
		arg_587_1.duration_ = 8.975

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play910601156(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = "XH0201"

			if arg_587_1.bgs_[var_590_0] == nil then
				local var_590_1 = Object.Instantiate(arg_587_1.paintGo_)

				var_590_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_590_0)
				var_590_1.name = var_590_0
				var_590_1.transform.parent = arg_587_1.stage_.transform
				var_590_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_587_1.bgs_[var_590_0] = var_590_1
			end

			local var_590_2 = 2

			if var_590_2 < arg_587_1.time_ and arg_587_1.time_ <= var_590_2 + arg_590_0 then
				local var_590_3 = manager.ui.mainCamera.transform.localPosition
				local var_590_4 = Vector3.New(0, 0, 10) + Vector3.New(var_590_3.x, var_590_3.y, 0)
				local var_590_5 = arg_587_1.bgs_.XH0201

				var_590_5.transform.localPosition = var_590_4
				var_590_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_590_6 = var_590_5:GetComponent("SpriteRenderer")

				if var_590_6 and var_590_6.sprite then
					local var_590_7 = (var_590_5.transform.localPosition - var_590_3).z
					local var_590_8 = manager.ui.mainCameraCom_
					local var_590_9 = 2 * var_590_7 * Mathf.Tan(var_590_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_590_10 = var_590_9 * var_590_8.aspect
					local var_590_11 = var_590_6.sprite.bounds.size.x
					local var_590_12 = var_590_6.sprite.bounds.size.y
					local var_590_13 = var_590_10 / var_590_11
					local var_590_14 = var_590_9 / var_590_12
					local var_590_15 = var_590_14 < var_590_13 and var_590_13 or var_590_14

					var_590_5.transform.localScale = Vector3.New(var_590_15, var_590_15, 0)
				end

				for iter_590_0, iter_590_1 in pairs(arg_587_1.bgs_) do
					if iter_590_0 ~= "XH0201" then
						iter_590_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_590_16 = 0

			if var_590_16 < arg_587_1.time_ and arg_587_1.time_ <= var_590_16 + arg_590_0 then
				arg_587_1.mask_.enabled = true
				arg_587_1.mask_.raycastTarget = true

				arg_587_1:SetGaussion(false)
			end

			local var_590_17 = 2

			if var_590_16 <= arg_587_1.time_ and arg_587_1.time_ < var_590_16 + var_590_17 then
				local var_590_18 = (arg_587_1.time_ - var_590_16) / var_590_17
				local var_590_19 = Color.New(1, 0.9764151, 0.9764151)

				var_590_19.a = Mathf.Lerp(0, 1, var_590_18)
				arg_587_1.mask_.color = var_590_19
			end

			if arg_587_1.time_ >= var_590_16 + var_590_17 and arg_587_1.time_ < var_590_16 + var_590_17 + arg_590_0 then
				local var_590_20 = Color.New(1, 0.9764151, 0.9764151)

				var_590_20.a = 1
				arg_587_1.mask_.color = var_590_20
			end

			local var_590_21 = 2

			if var_590_21 < arg_587_1.time_ and arg_587_1.time_ <= var_590_21 + arg_590_0 then
				arg_587_1.mask_.enabled = true
				arg_587_1.mask_.raycastTarget = true

				arg_587_1:SetGaussion(false)
			end

			local var_590_22 = 2

			if var_590_21 <= arg_587_1.time_ and arg_587_1.time_ < var_590_21 + var_590_22 then
				local var_590_23 = (arg_587_1.time_ - var_590_21) / var_590_22
				local var_590_24 = Color.New(1, 0.9764151, 0.9764151)

				var_590_24.a = Mathf.Lerp(1, 0, var_590_23)
				arg_587_1.mask_.color = var_590_24
			end

			if arg_587_1.time_ >= var_590_21 + var_590_22 and arg_587_1.time_ < var_590_21 + var_590_22 + arg_590_0 then
				local var_590_25 = Color.New(1, 0.9764151, 0.9764151)
				local var_590_26 = 0

				arg_587_1.mask_.enabled = false
				var_590_25.a = var_590_26
				arg_587_1.mask_.color = var_590_25
			end

			local var_590_27 = arg_587_1.actors_["1048ui_story"].transform
			local var_590_28 = 0

			if var_590_28 < arg_587_1.time_ and arg_587_1.time_ <= var_590_28 + arg_590_0 then
				arg_587_1.var_.moveOldPos1048ui_story = var_590_27.localPosition
			end

			local var_590_29 = 0.001

			if var_590_28 <= arg_587_1.time_ and arg_587_1.time_ < var_590_28 + var_590_29 then
				local var_590_30 = (arg_587_1.time_ - var_590_28) / var_590_29
				local var_590_31 = Vector3.New(0, 100, 0)

				var_590_27.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos1048ui_story, var_590_31, var_590_30)

				local var_590_32 = manager.ui.mainCamera.transform.position - var_590_27.position

				var_590_27.forward = Vector3.New(var_590_32.x, var_590_32.y, var_590_32.z)

				local var_590_33 = var_590_27.localEulerAngles

				var_590_33.z = 0
				var_590_33.x = 0
				var_590_27.localEulerAngles = var_590_33
			end

			if arg_587_1.time_ >= var_590_28 + var_590_29 and arg_587_1.time_ < var_590_28 + var_590_29 + arg_590_0 then
				var_590_27.localPosition = Vector3.New(0, 100, 0)

				local var_590_34 = manager.ui.mainCamera.transform.position - var_590_27.position

				var_590_27.forward = Vector3.New(var_590_34.x, var_590_34.y, var_590_34.z)

				local var_590_35 = var_590_27.localEulerAngles

				var_590_35.z = 0
				var_590_35.x = 0
				var_590_27.localEulerAngles = var_590_35
			end

			local var_590_36 = arg_587_1.actors_["1048ui_story"]
			local var_590_37 = 0

			if var_590_37 < arg_587_1.time_ and arg_587_1.time_ <= var_590_37 + arg_590_0 and arg_587_1.var_.characterEffect1048ui_story == nil then
				arg_587_1.var_.characterEffect1048ui_story = var_590_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_38 = 0.034000001847744

			if var_590_37 <= arg_587_1.time_ and arg_587_1.time_ < var_590_37 + var_590_38 then
				local var_590_39 = (arg_587_1.time_ - var_590_37) / var_590_38

				if arg_587_1.var_.characterEffect1048ui_story then
					local var_590_40 = Mathf.Lerp(0, 0.5, var_590_39)

					arg_587_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_587_1.var_.characterEffect1048ui_story.fillRatio = var_590_40
				end
			end

			if arg_587_1.time_ >= var_590_37 + var_590_38 and arg_587_1.time_ < var_590_37 + var_590_38 + arg_590_0 and arg_587_1.var_.characterEffect1048ui_story then
				local var_590_41 = 0.5

				arg_587_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_587_1.var_.characterEffect1048ui_story.fillRatio = var_590_41
			end

			local var_590_42 = arg_587_1.actors_["1028ui_story"].transform
			local var_590_43 = 0

			if var_590_43 < arg_587_1.time_ and arg_587_1.time_ <= var_590_43 + arg_590_0 then
				arg_587_1.var_.moveOldPos1028ui_story = var_590_42.localPosition
			end

			local var_590_44 = 0.001

			if var_590_43 <= arg_587_1.time_ and arg_587_1.time_ < var_590_43 + var_590_44 then
				local var_590_45 = (arg_587_1.time_ - var_590_43) / var_590_44
				local var_590_46 = Vector3.New(0, 100, 0)

				var_590_42.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos1028ui_story, var_590_46, var_590_45)

				local var_590_47 = manager.ui.mainCamera.transform.position - var_590_42.position

				var_590_42.forward = Vector3.New(var_590_47.x, var_590_47.y, var_590_47.z)

				local var_590_48 = var_590_42.localEulerAngles

				var_590_48.z = 0
				var_590_48.x = 0
				var_590_42.localEulerAngles = var_590_48
			end

			if arg_587_1.time_ >= var_590_43 + var_590_44 and arg_587_1.time_ < var_590_43 + var_590_44 + arg_590_0 then
				var_590_42.localPosition = Vector3.New(0, 100, 0)

				local var_590_49 = manager.ui.mainCamera.transform.position - var_590_42.position

				var_590_42.forward = Vector3.New(var_590_49.x, var_590_49.y, var_590_49.z)

				local var_590_50 = var_590_42.localEulerAngles

				var_590_50.z = 0
				var_590_50.x = 0
				var_590_42.localEulerAngles = var_590_50
			end

			local var_590_51 = arg_587_1.actors_["1028ui_story"]
			local var_590_52 = 0

			if var_590_52 < arg_587_1.time_ and arg_587_1.time_ <= var_590_52 + arg_590_0 and arg_587_1.var_.characterEffect1028ui_story == nil then
				arg_587_1.var_.characterEffect1028ui_story = var_590_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_53 = 0.034000001847744

			if var_590_52 <= arg_587_1.time_ and arg_587_1.time_ < var_590_52 + var_590_53 then
				local var_590_54 = (arg_587_1.time_ - var_590_52) / var_590_53

				if arg_587_1.var_.characterEffect1028ui_story then
					local var_590_55 = Mathf.Lerp(0, 0.5, var_590_54)

					arg_587_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_587_1.var_.characterEffect1028ui_story.fillRatio = var_590_55
				end
			end

			if arg_587_1.time_ >= var_590_52 + var_590_53 and arg_587_1.time_ < var_590_52 + var_590_53 + arg_590_0 and arg_587_1.var_.characterEffect1028ui_story then
				local var_590_56 = 0.5

				arg_587_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_587_1.var_.characterEffect1028ui_story.fillRatio = var_590_56
			end

			if arg_587_1.frameCnt_ <= 1 then
				arg_587_1.dialog_:SetActive(false)
			end

			local var_590_57 = 3.975
			local var_590_58 = 1.025

			if var_590_57 < arg_587_1.time_ and arg_587_1.time_ <= var_590_57 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0

				arg_587_1.dialog_:SetActive(true)

				local var_590_59 = LeanTween.value(arg_587_1.dialog_, 0, 1, 0.3)

				var_590_59:setOnUpdate(LuaHelper.FloatAction(function(arg_591_0)
					arg_587_1.dialogCg_.alpha = arg_591_0
				end))
				var_590_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_587_1.dialog_)
					var_590_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_587_1.duration_ = arg_587_1.duration_ + 0.3

				SetActive(arg_587_1.leftNameGo_, false)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_60 = arg_587_1:GetWordFromCfg(910601155)
				local var_590_61 = arg_587_1:FormatText(var_590_60.content)

				arg_587_1.text_.text = var_590_61

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_62 = 41
				local var_590_63 = utf8.len(var_590_61)
				local var_590_64 = var_590_62 <= 0 and var_590_58 or var_590_58 * (var_590_63 / var_590_62)

				if var_590_64 > 0 and var_590_58 < var_590_64 then
					arg_587_1.talkMaxDuration = var_590_64
					var_590_57 = var_590_57 + 0.3

					if var_590_64 + var_590_57 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_64 + var_590_57
					end
				end

				arg_587_1.text_.text = var_590_61
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)
				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_65 = var_590_57 + 0.3
			local var_590_66 = math.max(var_590_58, arg_587_1.talkMaxDuration)

			if var_590_65 <= arg_587_1.time_ and arg_587_1.time_ < var_590_65 + var_590_66 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_65) / var_590_66

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_65 + var_590_66 and arg_587_1.time_ < var_590_65 + var_590_66 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play910601156 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 910601156
		arg_593_1.duration_ = 8.975

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play910601157(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = "R1102"

			if arg_593_1.bgs_[var_596_0] == nil then
				local var_596_1 = Object.Instantiate(arg_593_1.paintGo_)

				var_596_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_596_0)
				var_596_1.name = var_596_0
				var_596_1.transform.parent = arg_593_1.stage_.transform
				var_596_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_593_1.bgs_[var_596_0] = var_596_1
			end

			local var_596_2 = 2

			if var_596_2 < arg_593_1.time_ and arg_593_1.time_ <= var_596_2 + arg_596_0 then
				local var_596_3 = manager.ui.mainCamera.transform.localPosition
				local var_596_4 = Vector3.New(0, 0, 10) + Vector3.New(var_596_3.x, var_596_3.y, 0)
				local var_596_5 = arg_593_1.bgs_.R1102

				var_596_5.transform.localPosition = var_596_4
				var_596_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_596_6 = var_596_5:GetComponent("SpriteRenderer")

				if var_596_6 and var_596_6.sprite then
					local var_596_7 = (var_596_5.transform.localPosition - var_596_3).z
					local var_596_8 = manager.ui.mainCameraCom_
					local var_596_9 = 2 * var_596_7 * Mathf.Tan(var_596_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_596_10 = var_596_9 * var_596_8.aspect
					local var_596_11 = var_596_6.sprite.bounds.size.x
					local var_596_12 = var_596_6.sprite.bounds.size.y
					local var_596_13 = var_596_10 / var_596_11
					local var_596_14 = var_596_9 / var_596_12
					local var_596_15 = var_596_14 < var_596_13 and var_596_13 or var_596_14

					var_596_5.transform.localScale = Vector3.New(var_596_15, var_596_15, 0)
				end

				for iter_596_0, iter_596_1 in pairs(arg_593_1.bgs_) do
					if iter_596_0 ~= "R1102" then
						iter_596_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_596_16 = 0

			if var_596_16 < arg_593_1.time_ and arg_593_1.time_ <= var_596_16 + arg_596_0 then
				arg_593_1.mask_.enabled = true
				arg_593_1.mask_.raycastTarget = true

				arg_593_1:SetGaussion(false)
			end

			local var_596_17 = 2

			if var_596_16 <= arg_593_1.time_ and arg_593_1.time_ < var_596_16 + var_596_17 then
				local var_596_18 = (arg_593_1.time_ - var_596_16) / var_596_17
				local var_596_19 = Color.New(1, 0.9764151, 0.9764151)

				var_596_19.a = Mathf.Lerp(0, 1, var_596_18)
				arg_593_1.mask_.color = var_596_19
			end

			if arg_593_1.time_ >= var_596_16 + var_596_17 and arg_593_1.time_ < var_596_16 + var_596_17 + arg_596_0 then
				local var_596_20 = Color.New(1, 0.9764151, 0.9764151)

				var_596_20.a = 1
				arg_593_1.mask_.color = var_596_20
			end

			local var_596_21 = 2

			if var_596_21 < arg_593_1.time_ and arg_593_1.time_ <= var_596_21 + arg_596_0 then
				arg_593_1.mask_.enabled = true
				arg_593_1.mask_.raycastTarget = true

				arg_593_1:SetGaussion(false)
			end

			local var_596_22 = 2

			if var_596_21 <= arg_593_1.time_ and arg_593_1.time_ < var_596_21 + var_596_22 then
				local var_596_23 = (arg_593_1.time_ - var_596_21) / var_596_22
				local var_596_24 = Color.New(1, 0.9764151, 0.9764151)

				var_596_24.a = Mathf.Lerp(1, 0, var_596_23)
				arg_593_1.mask_.color = var_596_24
			end

			if arg_593_1.time_ >= var_596_21 + var_596_22 and arg_593_1.time_ < var_596_21 + var_596_22 + arg_596_0 then
				local var_596_25 = Color.New(1, 0.9764151, 0.9764151)
				local var_596_26 = 0

				arg_593_1.mask_.enabled = false
				var_596_25.a = var_596_26
				arg_593_1.mask_.color = var_596_25
			end

			if arg_593_1.frameCnt_ <= 1 then
				arg_593_1.dialog_:SetActive(false)
			end

			local var_596_27 = 3.975
			local var_596_28 = 0.725

			if var_596_27 < arg_593_1.time_ and arg_593_1.time_ <= var_596_27 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0

				arg_593_1.dialog_:SetActive(true)

				local var_596_29 = LeanTween.value(arg_593_1.dialog_, 0, 1, 0.3)

				var_596_29:setOnUpdate(LuaHelper.FloatAction(function(arg_597_0)
					arg_593_1.dialogCg_.alpha = arg_597_0
				end))
				var_596_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_593_1.dialog_)
					var_596_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_593_1.duration_ = arg_593_1.duration_ + 0.3

				SetActive(arg_593_1.leftNameGo_, false)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_30 = arg_593_1:GetWordFromCfg(910601156)
				local var_596_31 = arg_593_1:FormatText(var_596_30.content)

				arg_593_1.text_.text = var_596_31

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_32 = 29
				local var_596_33 = utf8.len(var_596_31)
				local var_596_34 = var_596_32 <= 0 and var_596_28 or var_596_28 * (var_596_33 / var_596_32)

				if var_596_34 > 0 and var_596_28 < var_596_34 then
					arg_593_1.talkMaxDuration = var_596_34
					var_596_27 = var_596_27 + 0.3

					if var_596_34 + var_596_27 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_34 + var_596_27
					end
				end

				arg_593_1.text_.text = var_596_31
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)
				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_35 = var_596_27 + 0.3
			local var_596_36 = math.max(var_596_28, arg_593_1.talkMaxDuration)

			if var_596_35 <= arg_593_1.time_ and arg_593_1.time_ < var_596_35 + var_596_36 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_35) / var_596_36

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_35 + var_596_36 and arg_593_1.time_ < var_596_35 + var_596_36 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play910601157 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 910601157
		arg_599_1.duration_ = 9

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play910601158(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.mask_.enabled = true
				arg_599_1.mask_.raycastTarget = true

				arg_599_1:SetGaussion(false)
			end

			local var_602_1 = 2

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_1 then
				local var_602_2 = (arg_599_1.time_ - var_602_0) / var_602_1
				local var_602_3 = Color.New(1, 0.9764151, 0.9764151)

				var_602_3.a = Mathf.Lerp(0, 1, var_602_2)
				arg_599_1.mask_.color = var_602_3
			end

			if arg_599_1.time_ >= var_602_0 + var_602_1 and arg_599_1.time_ < var_602_0 + var_602_1 + arg_602_0 then
				local var_602_4 = Color.New(1, 0.9764151, 0.9764151)

				var_602_4.a = 1
				arg_599_1.mask_.color = var_602_4
			end

			local var_602_5 = 2

			if var_602_5 < arg_599_1.time_ and arg_599_1.time_ <= var_602_5 + arg_602_0 then
				arg_599_1.mask_.enabled = true
				arg_599_1.mask_.raycastTarget = true

				arg_599_1:SetGaussion(false)
			end

			local var_602_6 = 2

			if var_602_5 <= arg_599_1.time_ and arg_599_1.time_ < var_602_5 + var_602_6 then
				local var_602_7 = (arg_599_1.time_ - var_602_5) / var_602_6
				local var_602_8 = Color.New(1, 0.9764151, 0.9764151)

				var_602_8.a = Mathf.Lerp(1, 0, var_602_7)
				arg_599_1.mask_.color = var_602_8
			end

			if arg_599_1.time_ >= var_602_5 + var_602_6 and arg_599_1.time_ < var_602_5 + var_602_6 + arg_602_0 then
				local var_602_9 = Color.New(1, 0.9764151, 0.9764151)
				local var_602_10 = 0

				arg_599_1.mask_.enabled = false
				var_602_9.a = var_602_10
				arg_599_1.mask_.color = var_602_9
			end

			local var_602_11 = "R2802"

			if arg_599_1.bgs_[var_602_11] == nil then
				local var_602_12 = Object.Instantiate(arg_599_1.paintGo_)

				var_602_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_602_11)
				var_602_12.name = var_602_11
				var_602_12.transform.parent = arg_599_1.stage_.transform
				var_602_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_599_1.bgs_[var_602_11] = var_602_12
			end

			local var_602_13 = 2

			if var_602_13 < arg_599_1.time_ and arg_599_1.time_ <= var_602_13 + arg_602_0 then
				local var_602_14 = manager.ui.mainCamera.transform.localPosition
				local var_602_15 = Vector3.New(0, 0, 10) + Vector3.New(var_602_14.x, var_602_14.y, 0)
				local var_602_16 = arg_599_1.bgs_.R2802

				var_602_16.transform.localPosition = var_602_15
				var_602_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_602_17 = var_602_16:GetComponent("SpriteRenderer")

				if var_602_17 and var_602_17.sprite then
					local var_602_18 = (var_602_16.transform.localPosition - var_602_14).z
					local var_602_19 = manager.ui.mainCameraCom_
					local var_602_20 = 2 * var_602_18 * Mathf.Tan(var_602_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_602_21 = var_602_20 * var_602_19.aspect
					local var_602_22 = var_602_17.sprite.bounds.size.x
					local var_602_23 = var_602_17.sprite.bounds.size.y
					local var_602_24 = var_602_21 / var_602_22
					local var_602_25 = var_602_20 / var_602_23
					local var_602_26 = var_602_25 < var_602_24 and var_602_24 or var_602_25

					var_602_16.transform.localScale = Vector3.New(var_602_26, var_602_26, 0)
				end

				for iter_602_0, iter_602_1 in pairs(arg_599_1.bgs_) do
					if iter_602_0 ~= "R2802" then
						iter_602_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_599_1.frameCnt_ <= 1 then
				arg_599_1.dialog_:SetActive(false)
			end

			local var_602_27 = 4
			local var_602_28 = 0.8

			if var_602_27 < arg_599_1.time_ and arg_599_1.time_ <= var_602_27 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0

				arg_599_1.dialog_:SetActive(true)

				local var_602_29 = LeanTween.value(arg_599_1.dialog_, 0, 1, 0.3)

				var_602_29:setOnUpdate(LuaHelper.FloatAction(function(arg_603_0)
					arg_599_1.dialogCg_.alpha = arg_603_0
				end))
				var_602_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_599_1.dialog_)
					var_602_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_599_1.duration_ = arg_599_1.duration_ + 0.3

				SetActive(arg_599_1.leftNameGo_, false)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_30 = arg_599_1:GetWordFromCfg(910601157)
				local var_602_31 = arg_599_1:FormatText(var_602_30.content)

				arg_599_1.text_.text = var_602_31

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_32 = 32
				local var_602_33 = utf8.len(var_602_31)
				local var_602_34 = var_602_32 <= 0 and var_602_28 or var_602_28 * (var_602_33 / var_602_32)

				if var_602_34 > 0 and var_602_28 < var_602_34 then
					arg_599_1.talkMaxDuration = var_602_34
					var_602_27 = var_602_27 + 0.3

					if var_602_34 + var_602_27 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_34 + var_602_27
					end
				end

				arg_599_1.text_.text = var_602_31
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_35 = var_602_27 + 0.3
			local var_602_36 = math.max(var_602_28, arg_599_1.talkMaxDuration)

			if var_602_35 <= arg_599_1.time_ and arg_599_1.time_ < var_602_35 + var_602_36 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_35) / var_602_36

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_35 + var_602_36 and arg_599_1.time_ < var_602_35 + var_602_36 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play910601158 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 910601158
		arg_605_1.duration_ = 8.975

		SetActive(arg_605_1.tipsGo_, false)

		function arg_605_1.onSingleLineFinish_()
			arg_605_1.onSingleLineUpdate_ = nil
			arg_605_1.onSingleLineFinish_ = nil
			arg_605_1.state_ = "waiting"
		end

		function arg_605_1.playNext_(arg_607_0)
			if arg_607_0 == 1 then
				arg_605_0:Play910601159(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = 0

			if var_608_0 < arg_605_1.time_ and arg_605_1.time_ <= var_608_0 + arg_608_0 then
				arg_605_1.mask_.enabled = true
				arg_605_1.mask_.raycastTarget = true

				arg_605_1:SetGaussion(false)
			end

			local var_608_1 = 2

			if var_608_0 <= arg_605_1.time_ and arg_605_1.time_ < var_608_0 + var_608_1 then
				local var_608_2 = (arg_605_1.time_ - var_608_0) / var_608_1
				local var_608_3 = Color.New(1, 0.9764151, 0.9764151)

				var_608_3.a = Mathf.Lerp(0, 1, var_608_2)
				arg_605_1.mask_.color = var_608_3
			end

			if arg_605_1.time_ >= var_608_0 + var_608_1 and arg_605_1.time_ < var_608_0 + var_608_1 + arg_608_0 then
				local var_608_4 = Color.New(1, 0.9764151, 0.9764151)

				var_608_4.a = 1
				arg_605_1.mask_.color = var_608_4
			end

			local var_608_5 = 2

			if var_608_5 < arg_605_1.time_ and arg_605_1.time_ <= var_608_5 + arg_608_0 then
				arg_605_1.mask_.enabled = true
				arg_605_1.mask_.raycastTarget = true

				arg_605_1:SetGaussion(false)
			end

			local var_608_6 = 2

			if var_608_5 <= arg_605_1.time_ and arg_605_1.time_ < var_608_5 + var_608_6 then
				local var_608_7 = (arg_605_1.time_ - var_608_5) / var_608_6
				local var_608_8 = Color.New(1, 0.9764151, 0.9764151)

				var_608_8.a = Mathf.Lerp(1, 0, var_608_7)
				arg_605_1.mask_.color = var_608_8
			end

			if arg_605_1.time_ >= var_608_5 + var_608_6 and arg_605_1.time_ < var_608_5 + var_608_6 + arg_608_0 then
				local var_608_9 = Color.New(1, 0.9764151, 0.9764151)
				local var_608_10 = 0

				arg_605_1.mask_.enabled = false
				var_608_9.a = var_608_10
				arg_605_1.mask_.color = var_608_9
			end

			local var_608_11 = "R4802"

			if arg_605_1.bgs_[var_608_11] == nil then
				local var_608_12 = Object.Instantiate(arg_605_1.paintGo_)

				var_608_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_608_11)
				var_608_12.name = var_608_11
				var_608_12.transform.parent = arg_605_1.stage_.transform
				var_608_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_605_1.bgs_[var_608_11] = var_608_12
			end

			local var_608_13 = 2

			if var_608_13 < arg_605_1.time_ and arg_605_1.time_ <= var_608_13 + arg_608_0 then
				local var_608_14 = manager.ui.mainCamera.transform.localPosition
				local var_608_15 = Vector3.New(0, 0, 10) + Vector3.New(var_608_14.x, var_608_14.y, 0)
				local var_608_16 = arg_605_1.bgs_.R4802

				var_608_16.transform.localPosition = var_608_15
				var_608_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_608_17 = var_608_16:GetComponent("SpriteRenderer")

				if var_608_17 and var_608_17.sprite then
					local var_608_18 = (var_608_16.transform.localPosition - var_608_14).z
					local var_608_19 = manager.ui.mainCameraCom_
					local var_608_20 = 2 * var_608_18 * Mathf.Tan(var_608_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_608_21 = var_608_20 * var_608_19.aspect
					local var_608_22 = var_608_17.sprite.bounds.size.x
					local var_608_23 = var_608_17.sprite.bounds.size.y
					local var_608_24 = var_608_21 / var_608_22
					local var_608_25 = var_608_20 / var_608_23
					local var_608_26 = var_608_25 < var_608_24 and var_608_24 or var_608_25

					var_608_16.transform.localScale = Vector3.New(var_608_26, var_608_26, 0)
				end

				for iter_608_0, iter_608_1 in pairs(arg_605_1.bgs_) do
					if iter_608_0 ~= "R4802" then
						iter_608_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_605_1.frameCnt_ <= 1 then
				arg_605_1.dialog_:SetActive(false)
			end

			local var_608_27 = 3.975
			local var_608_28 = 0.35

			if var_608_27 < arg_605_1.time_ and arg_605_1.time_ <= var_608_27 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0

				arg_605_1.dialog_:SetActive(true)

				local var_608_29 = LeanTween.value(arg_605_1.dialog_, 0, 1, 0.3)

				var_608_29:setOnUpdate(LuaHelper.FloatAction(function(arg_609_0)
					arg_605_1.dialogCg_.alpha = arg_609_0
				end))
				var_608_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_605_1.dialog_)
					var_608_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_605_1.duration_ = arg_605_1.duration_ + 0.3

				SetActive(arg_605_1.leftNameGo_, false)

				arg_605_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_605_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_605_1:RecordName(arg_605_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_605_1.iconTrs_.gameObject, false)
				arg_605_1.callingController_:SetSelectedState("normal")

				local var_608_30 = arg_605_1:GetWordFromCfg(910601158)
				local var_608_31 = arg_605_1:FormatText(var_608_30.content)

				arg_605_1.text_.text = var_608_31

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.text_)

				local var_608_32 = 14
				local var_608_33 = utf8.len(var_608_31)
				local var_608_34 = var_608_32 <= 0 and var_608_28 or var_608_28 * (var_608_33 / var_608_32)

				if var_608_34 > 0 and var_608_28 < var_608_34 then
					arg_605_1.talkMaxDuration = var_608_34
					var_608_27 = var_608_27 + 0.3

					if var_608_34 + var_608_27 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_34 + var_608_27
					end
				end

				arg_605_1.text_.text = var_608_31
				arg_605_1.typewritter.percent = 0

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(false)
				arg_605_1:RecordContent(arg_605_1.text_.text)
			end

			local var_608_35 = var_608_27 + 0.3
			local var_608_36 = math.max(var_608_28, arg_605_1.talkMaxDuration)

			if var_608_35 <= arg_605_1.time_ and arg_605_1.time_ < var_608_35 + var_608_36 then
				arg_605_1.typewritter.percent = (arg_605_1.time_ - var_608_35) / var_608_36

				arg_605_1.typewritter:SetDirty()
			end

			if arg_605_1.time_ >= var_608_35 + var_608_36 and arg_605_1.time_ < var_608_35 + var_608_36 + arg_608_0 then
				arg_605_1.typewritter.percent = 1

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(true)
			end
		end
	end,
	Play910601159 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 910601159
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play910601160(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 0.75

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0

				arg_611_1.dialog_:SetActive(true)

				local var_614_2 = LeanTween.value(arg_611_1.dialog_, 0, 1, 0.3)

				var_614_2:setOnUpdate(LuaHelper.FloatAction(function(arg_615_0)
					arg_611_1.dialogCg_.alpha = arg_615_0
				end))
				var_614_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_611_1.dialog_)
					var_614_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_611_1.duration_ = arg_611_1.duration_ + 0.3

				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_3 = arg_611_1:GetWordFromCfg(910601159)
				local var_614_4 = arg_611_1:FormatText(var_614_3.content)

				arg_611_1.text_.text = var_614_4

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_5 = 30
				local var_614_6 = utf8.len(var_614_4)
				local var_614_7 = var_614_5 <= 0 and var_614_1 or var_614_1 * (var_614_6 / var_614_5)

				if var_614_7 > 0 and var_614_1 < var_614_7 then
					arg_611_1.talkMaxDuration = var_614_7
					var_614_0 = var_614_0 + 0.3

					if var_614_7 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_7 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_4
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_8 = var_614_0 + 0.3
			local var_614_9 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_8 <= arg_611_1.time_ and arg_611_1.time_ < var_614_8 + var_614_9 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_8) / var_614_9

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_8 + var_614_9 and arg_611_1.time_ < var_614_8 + var_614_9 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play910601160 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 910601160
		arg_617_1.duration_ = 9

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play910601161(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = 0

			if var_620_0 < arg_617_1.time_ and arg_617_1.time_ <= var_620_0 + arg_620_0 then
				arg_617_1.mask_.enabled = true
				arg_617_1.mask_.raycastTarget = true

				arg_617_1:SetGaussion(false)
			end

			local var_620_1 = 2

			if var_620_0 <= arg_617_1.time_ and arg_617_1.time_ < var_620_0 + var_620_1 then
				local var_620_2 = (arg_617_1.time_ - var_620_0) / var_620_1
				local var_620_3 = Color.New(0, 0, 0)

				var_620_3.a = Mathf.Lerp(0, 1, var_620_2)
				arg_617_1.mask_.color = var_620_3
			end

			if arg_617_1.time_ >= var_620_0 + var_620_1 and arg_617_1.time_ < var_620_0 + var_620_1 + arg_620_0 then
				local var_620_4 = Color.New(0, 0, 0)

				var_620_4.a = 1
				arg_617_1.mask_.color = var_620_4
			end

			local var_620_5 = 2

			if var_620_5 < arg_617_1.time_ and arg_617_1.time_ <= var_620_5 + arg_620_0 then
				arg_617_1.mask_.enabled = true
				arg_617_1.mask_.raycastTarget = true

				arg_617_1:SetGaussion(false)
			end

			local var_620_6 = 2

			if var_620_5 <= arg_617_1.time_ and arg_617_1.time_ < var_620_5 + var_620_6 then
				local var_620_7 = (arg_617_1.time_ - var_620_5) / var_620_6
				local var_620_8 = Color.New(0, 0, 0)

				var_620_8.a = Mathf.Lerp(1, 0, var_620_7)
				arg_617_1.mask_.color = var_620_8
			end

			if arg_617_1.time_ >= var_620_5 + var_620_6 and arg_617_1.time_ < var_620_5 + var_620_6 + arg_620_0 then
				local var_620_9 = Color.New(0, 0, 0)
				local var_620_10 = 0

				arg_617_1.mask_.enabled = false
				var_620_9.a = var_620_10
				arg_617_1.mask_.color = var_620_9
			end

			local var_620_11 = 2

			if var_620_11 < arg_617_1.time_ and arg_617_1.time_ <= var_620_11 + arg_620_0 then
				local var_620_12 = manager.ui.mainCamera.transform.localPosition
				local var_620_13 = Vector3.New(0, 0, 10) + Vector3.New(var_620_12.x, var_620_12.y, 0)
				local var_620_14 = arg_617_1.bgs_.ST60

				var_620_14.transform.localPosition = var_620_13
				var_620_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_620_15 = var_620_14:GetComponent("SpriteRenderer")

				if var_620_15 and var_620_15.sprite then
					local var_620_16 = (var_620_14.transform.localPosition - var_620_12).z
					local var_620_17 = manager.ui.mainCameraCom_
					local var_620_18 = 2 * var_620_16 * Mathf.Tan(var_620_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_620_19 = var_620_18 * var_620_17.aspect
					local var_620_20 = var_620_15.sprite.bounds.size.x
					local var_620_21 = var_620_15.sprite.bounds.size.y
					local var_620_22 = var_620_19 / var_620_20
					local var_620_23 = var_620_18 / var_620_21
					local var_620_24 = var_620_23 < var_620_22 and var_620_22 or var_620_23

					var_620_14.transform.localScale = Vector3.New(var_620_24, var_620_24, 0)
				end

				for iter_620_0, iter_620_1 in pairs(arg_617_1.bgs_) do
					if iter_620_0 ~= "ST60" then
						iter_620_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_617_1.frameCnt_ <= 1 then
				arg_617_1.dialog_:SetActive(false)
			end

			local var_620_25 = 4
			local var_620_26 = 0.125

			if var_620_25 < arg_617_1.time_ and arg_617_1.time_ <= var_620_25 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0

				arg_617_1.dialog_:SetActive(true)

				local var_620_27 = LeanTween.value(arg_617_1.dialog_, 0, 1, 0.3)

				var_620_27:setOnUpdate(LuaHelper.FloatAction(function(arg_621_0)
					arg_617_1.dialogCg_.alpha = arg_621_0
				end))
				var_620_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_617_1.dialog_)
					var_620_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_617_1.duration_ = arg_617_1.duration_ + 0.3

				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_28 = arg_617_1:FormatText(StoryNameCfg[7].name)

				arg_617_1.leftNameTxt_.text = var_620_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_29 = arg_617_1:GetWordFromCfg(910601160)
				local var_620_30 = arg_617_1:FormatText(var_620_29.content)

				arg_617_1.text_.text = var_620_30

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_31 = 5
				local var_620_32 = utf8.len(var_620_30)
				local var_620_33 = var_620_31 <= 0 and var_620_26 or var_620_26 * (var_620_32 / var_620_31)

				if var_620_33 > 0 and var_620_26 < var_620_33 then
					arg_617_1.talkMaxDuration = var_620_33
					var_620_25 = var_620_25 + 0.3

					if var_620_33 + var_620_25 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_33 + var_620_25
					end
				end

				arg_617_1.text_.text = var_620_30
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)
				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_34 = var_620_25 + 0.3
			local var_620_35 = math.max(var_620_26, arg_617_1.talkMaxDuration)

			if var_620_34 <= arg_617_1.time_ and arg_617_1.time_ < var_620_34 + var_620_35 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_34) / var_620_35

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_34 + var_620_35 and arg_617_1.time_ < var_620_34 + var_620_35 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play910601161 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 910601161
		arg_623_1.duration_ = 3.999999999999

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
			arg_623_1.auto_ = false
		end

		function arg_623_1.playNext_(arg_625_0)
			arg_623_1.onStoryFinished_()
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1011ui_story"].transform
			local var_626_1 = 2

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 then
				arg_623_1.var_.moveOldPos1011ui_story = var_626_0.localPosition
			end

			local var_626_2 = 0.001

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2
				local var_626_4 = Vector3.New(0.7, -0.71, -6)

				var_626_0.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1011ui_story, var_626_4, var_626_3)

				local var_626_5 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_5.x, var_626_5.y, var_626_5.z)

				local var_626_6 = var_626_0.localEulerAngles

				var_626_6.z = 0
				var_626_6.x = 0
				var_626_0.localEulerAngles = var_626_6
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 then
				var_626_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_626_7 = manager.ui.mainCamera.transform.position - var_626_0.position

				var_626_0.forward = Vector3.New(var_626_7.x, var_626_7.y, var_626_7.z)

				local var_626_8 = var_626_0.localEulerAngles

				var_626_8.z = 0
				var_626_8.x = 0
				var_626_0.localEulerAngles = var_626_8
			end

			local var_626_9 = arg_623_1.actors_["1011ui_story"]
			local var_626_10 = 2

			if var_626_10 < arg_623_1.time_ and arg_623_1.time_ <= var_626_10 + arg_626_0 and arg_623_1.var_.characterEffect1011ui_story == nil then
				arg_623_1.var_.characterEffect1011ui_story = var_626_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_11 = 0.200000002980232

			if var_626_10 <= arg_623_1.time_ and arg_623_1.time_ < var_626_10 + var_626_11 then
				local var_626_12 = (arg_623_1.time_ - var_626_10) / var_626_11

				if arg_623_1.var_.characterEffect1011ui_story then
					arg_623_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_10 + var_626_11 and arg_623_1.time_ < var_626_10 + var_626_11 + arg_626_0 and arg_623_1.var_.characterEffect1011ui_story then
				arg_623_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_626_13 = 2

			if var_626_13 < arg_623_1.time_ and arg_623_1.time_ <= var_626_13 + arg_626_0 then
				arg_623_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_1")
			end

			local var_626_14 = 2

			if var_626_14 < arg_623_1.time_ and arg_623_1.time_ <= var_626_14 + arg_626_0 then
				arg_623_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_626_15 = arg_623_1.actors_["1084ui_story"].transform
			local var_626_16 = 2

			if var_626_16 < arg_623_1.time_ and arg_623_1.time_ <= var_626_16 + arg_626_0 then
				arg_623_1.var_.moveOldPos1084ui_story = var_626_15.localPosition
			end

			local var_626_17 = 0.001

			if var_626_16 <= arg_623_1.time_ and arg_623_1.time_ < var_626_16 + var_626_17 then
				local var_626_18 = (arg_623_1.time_ - var_626_16) / var_626_17
				local var_626_19 = Vector3.New(0, -0.97, -6)

				var_626_15.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1084ui_story, var_626_19, var_626_18)

				local var_626_20 = manager.ui.mainCamera.transform.position - var_626_15.position

				var_626_15.forward = Vector3.New(var_626_20.x, var_626_20.y, var_626_20.z)

				local var_626_21 = var_626_15.localEulerAngles

				var_626_21.z = 0
				var_626_21.x = 0
				var_626_15.localEulerAngles = var_626_21
			end

			if arg_623_1.time_ >= var_626_16 + var_626_17 and arg_623_1.time_ < var_626_16 + var_626_17 + arg_626_0 then
				var_626_15.localPosition = Vector3.New(0, -0.97, -6)

				local var_626_22 = manager.ui.mainCamera.transform.position - var_626_15.position

				var_626_15.forward = Vector3.New(var_626_22.x, var_626_22.y, var_626_22.z)

				local var_626_23 = var_626_15.localEulerAngles

				var_626_23.z = 0
				var_626_23.x = 0
				var_626_15.localEulerAngles = var_626_23
			end

			local var_626_24 = arg_623_1.actors_["1084ui_story"].transform
			local var_626_25 = 2

			if var_626_25 < arg_623_1.time_ and arg_623_1.time_ <= var_626_25 + arg_626_0 then
				arg_623_1.var_.moveOldPos1084ui_story = var_626_24.localPosition
			end

			local var_626_26 = 0.001

			if var_626_25 <= arg_623_1.time_ and arg_623_1.time_ < var_626_25 + var_626_26 then
				local var_626_27 = (arg_623_1.time_ - var_626_25) / var_626_26
				local var_626_28 = Vector3.New(0, -0.97, -6)

				var_626_24.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1084ui_story, var_626_28, var_626_27)

				local var_626_29 = manager.ui.mainCamera.transform.position - var_626_24.position

				var_626_24.forward = Vector3.New(var_626_29.x, var_626_29.y, var_626_29.z)

				local var_626_30 = var_626_24.localEulerAngles

				var_626_30.z = 0
				var_626_30.x = 0
				var_626_24.localEulerAngles = var_626_30
			end

			if arg_623_1.time_ >= var_626_25 + var_626_26 and arg_623_1.time_ < var_626_25 + var_626_26 + arg_626_0 then
				var_626_24.localPosition = Vector3.New(0, -0.97, -6)

				local var_626_31 = manager.ui.mainCamera.transform.position - var_626_24.position

				var_626_24.forward = Vector3.New(var_626_31.x, var_626_31.y, var_626_31.z)

				local var_626_32 = var_626_24.localEulerAngles

				var_626_32.z = 0
				var_626_32.x = 0
				var_626_24.localEulerAngles = var_626_32
			end

			local var_626_33 = 2

			if var_626_33 < arg_623_1.time_ and arg_623_1.time_ <= var_626_33 + arg_626_0 then
				arg_623_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_626_34 = 2

			if var_626_34 < arg_623_1.time_ and arg_623_1.time_ <= var_626_34 + arg_626_0 then
				arg_623_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_626_35 = arg_623_1.actors_["1084ui_story"]
			local var_626_36 = 2

			if var_626_36 < arg_623_1.time_ and arg_623_1.time_ <= var_626_36 + arg_626_0 and arg_623_1.var_.characterEffect1084ui_story == nil then
				arg_623_1.var_.characterEffect1084ui_story = var_626_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_37 = 0.200000002980232

			if var_626_36 <= arg_623_1.time_ and arg_623_1.time_ < var_626_36 + var_626_37 then
				local var_626_38 = (arg_623_1.time_ - var_626_36) / var_626_37

				if arg_623_1.var_.characterEffect1084ui_story then
					arg_623_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_36 + var_626_37 and arg_623_1.time_ < var_626_36 + var_626_37 + arg_626_0 and arg_623_1.var_.characterEffect1084ui_story then
				arg_623_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_626_39 = arg_623_1.actors_["1028ui_story"].transform
			local var_626_40 = 2

			if var_626_40 < arg_623_1.time_ and arg_623_1.time_ <= var_626_40 + arg_626_0 then
				arg_623_1.var_.moveOldPos1028ui_story = var_626_39.localPosition
			end

			local var_626_41 = 0.001

			if var_626_40 <= arg_623_1.time_ and arg_623_1.time_ < var_626_40 + var_626_41 then
				local var_626_42 = (arg_623_1.time_ - var_626_40) / var_626_41
				local var_626_43 = Vector3.New(-0.7, -0.9, -5.9)

				var_626_39.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1028ui_story, var_626_43, var_626_42)

				local var_626_44 = manager.ui.mainCamera.transform.position - var_626_39.position

				var_626_39.forward = Vector3.New(var_626_44.x, var_626_44.y, var_626_44.z)

				local var_626_45 = var_626_39.localEulerAngles

				var_626_45.z = 0
				var_626_45.x = 0
				var_626_39.localEulerAngles = var_626_45
			end

			if arg_623_1.time_ >= var_626_40 + var_626_41 and arg_623_1.time_ < var_626_40 + var_626_41 + arg_626_0 then
				var_626_39.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_626_46 = manager.ui.mainCamera.transform.position - var_626_39.position

				var_626_39.forward = Vector3.New(var_626_46.x, var_626_46.y, var_626_46.z)

				local var_626_47 = var_626_39.localEulerAngles

				var_626_47.z = 0
				var_626_47.x = 0
				var_626_39.localEulerAngles = var_626_47
			end

			local var_626_48 = arg_623_1.actors_["1028ui_story"]
			local var_626_49 = 2

			if var_626_49 < arg_623_1.time_ and arg_623_1.time_ <= var_626_49 + arg_626_0 and arg_623_1.var_.characterEffect1028ui_story == nil then
				arg_623_1.var_.characterEffect1028ui_story = var_626_48:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_50 = 0.200000002980232

			if var_626_49 <= arg_623_1.time_ and arg_623_1.time_ < var_626_49 + var_626_50 then
				local var_626_51 = (arg_623_1.time_ - var_626_49) / var_626_50

				if arg_623_1.var_.characterEffect1028ui_story then
					arg_623_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_49 + var_626_50 and arg_623_1.time_ < var_626_49 + var_626_50 + arg_626_0 and arg_623_1.var_.characterEffect1028ui_story then
				arg_623_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_626_52 = 2

			if var_626_52 < arg_623_1.time_ and arg_623_1.time_ <= var_626_52 + arg_626_0 then
				arg_623_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_626_53 = 2

			if var_626_53 < arg_623_1.time_ and arg_623_1.time_ <= var_626_53 + arg_626_0 then
				arg_623_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_626_54 = 2

			if var_626_54 < arg_623_1.time_ and arg_623_1.time_ <= var_626_54 + arg_626_0 then
				arg_623_1.mask_.enabled = true
				arg_623_1.mask_.raycastTarget = true

				arg_623_1:SetGaussion(false)
			end

			local var_626_55 = 0.034000001847744

			if var_626_54 <= arg_623_1.time_ and arg_623_1.time_ < var_626_54 + var_626_55 then
				local var_626_56 = (arg_623_1.time_ - var_626_54) / var_626_55
				local var_626_57 = Color.New(1, 1, 1)

				var_626_57.a = Mathf.Lerp(1, 0, var_626_56)
				arg_623_1.mask_.color = var_626_57
			end

			if arg_623_1.time_ >= var_626_54 + var_626_55 and arg_623_1.time_ < var_626_54 + var_626_55 + arg_626_0 then
				local var_626_58 = Color.New(1, 1, 1)
				local var_626_59 = 0

				arg_623_1.mask_.enabled = false
				var_626_58.a = var_626_59
				arg_623_1.mask_.color = var_626_58
			end

			local var_626_60 = 0

			if var_626_60 < arg_623_1.time_ and arg_623_1.time_ <= var_626_60 + arg_626_0 then
				arg_623_1.mask_.enabled = true
				arg_623_1.mask_.raycastTarget = true

				arg_623_1:SetGaussion(false)
			end

			local var_626_61 = 1

			if var_626_60 <= arg_623_1.time_ and arg_623_1.time_ < var_626_60 + var_626_61 then
				local var_626_62 = (arg_623_1.time_ - var_626_60) / var_626_61
				local var_626_63 = Color.New(1, 1, 1)

				var_626_63.a = Mathf.Lerp(0, 1, var_626_62)
				arg_623_1.mask_.color = var_626_63
			end

			if arg_623_1.time_ >= var_626_60 + var_626_61 and arg_623_1.time_ < var_626_60 + var_626_61 + arg_626_0 then
				local var_626_64 = Color.New(1, 1, 1)

				var_626_64.a = 1
				arg_623_1.mask_.color = var_626_64
			end

			local var_626_65 = 1

			if var_626_65 < arg_623_1.time_ and arg_623_1.time_ <= var_626_65 + arg_626_0 then
				arg_623_1.mask_.enabled = true
				arg_623_1.mask_.raycastTarget = true

				arg_623_1:SetGaussion(false)
			end

			local var_626_66 = 1.20000000298023

			if var_626_65 <= arg_623_1.time_ and arg_623_1.time_ < var_626_65 + var_626_66 then
				local var_626_67 = (arg_623_1.time_ - var_626_65) / var_626_66
				local var_626_68 = Color.New(1, 1, 1)

				var_626_68.a = Mathf.Lerp(1, 0, var_626_67)
				arg_623_1.mask_.color = var_626_68
			end

			if arg_623_1.time_ >= var_626_65 + var_626_66 and arg_623_1.time_ < var_626_65 + var_626_66 + arg_626_0 then
				local var_626_69 = Color.New(1, 1, 1)
				local var_626_70 = 0

				arg_623_1.mask_.enabled = false
				var_626_69.a = var_626_70
				arg_623_1.mask_.color = var_626_69
			end

			local var_626_71 = 1

			if var_626_71 < arg_623_1.time_ and arg_623_1.time_ <= var_626_71 + arg_626_0 then
				local var_626_72 = manager.ui.mainCamera.transform.localPosition
				local var_626_73 = Vector3.New(0, 0, 10) + Vector3.New(var_626_72.x, var_626_72.y, 0)
				local var_626_74 = arg_623_1.bgs_.ST60

				var_626_74.transform.localPosition = var_626_73
				var_626_74.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_626_75 = var_626_74:GetComponent("SpriteRenderer")

				if var_626_75 and var_626_75.sprite then
					local var_626_76 = (var_626_74.transform.localPosition - var_626_72).z
					local var_626_77 = manager.ui.mainCameraCom_
					local var_626_78 = 2 * var_626_76 * Mathf.Tan(var_626_77.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_626_79 = var_626_78 * var_626_77.aspect
					local var_626_80 = var_626_75.sprite.bounds.size.x
					local var_626_81 = var_626_75.sprite.bounds.size.y
					local var_626_82 = var_626_79 / var_626_80
					local var_626_83 = var_626_78 / var_626_81
					local var_626_84 = var_626_83 < var_626_82 and var_626_82 or var_626_83

					var_626_74.transform.localScale = Vector3.New(var_626_84, var_626_84, 0)
				end

				for iter_626_0, iter_626_1 in pairs(arg_623_1.bgs_) do
					if iter_626_0 ~= "ST60" then
						iter_626_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_623_1.frameCnt_ <= 1 then
				arg_623_1.dialog_:SetActive(false)
			end

			local var_626_85 = 2
			local var_626_86 = 0.6

			if var_626_85 < arg_623_1.time_ and arg_623_1.time_ <= var_626_85 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0

				arg_623_1.dialog_:SetActive(true)

				local var_626_87 = LeanTween.value(arg_623_1.dialog_, 0, 1, 0.3)

				var_626_87:setOnUpdate(LuaHelper.FloatAction(function(arg_627_0)
					arg_623_1.dialogCg_.alpha = arg_627_0
				end))
				var_626_87:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_623_1.dialog_)
					var_626_87:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_623_1.duration_ = arg_623_1.duration_ + 0.3

				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_88 = arg_623_1:FormatText(StoryNameCfg[330].name)

				arg_623_1.leftNameTxt_.text = var_626_88

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_89 = arg_623_1:GetWordFromCfg(910601161)
				local var_626_90 = arg_623_1:FormatText(var_626_89.content)

				arg_623_1.text_.text = var_626_90

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_91 = 5
				local var_626_92 = utf8.len(var_626_90)
				local var_626_93 = var_626_91 <= 0 and var_626_86 or var_626_86 * (var_626_92 / var_626_91)

				if var_626_93 > 0 and var_626_86 < var_626_93 then
					arg_623_1.talkMaxDuration = var_626_93
					var_626_85 = var_626_85 + 0.3

					if var_626_93 + var_626_85 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_93 + var_626_85
					end
				end

				arg_623_1.text_.text = var_626_90
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601161", "story_v_out_910601.awb") ~= 0 then
					local var_626_94 = manager.audio:GetVoiceLength("story_v_out_910601", "910601161", "story_v_out_910601.awb") / 1000

					if var_626_94 + var_626_85 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_94 + var_626_85
					end

					if var_626_89.prefab_name ~= "" and arg_623_1.actors_[var_626_89.prefab_name] ~= nil then
						local var_626_95 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_89.prefab_name].transform, "story_v_out_910601", "910601161", "story_v_out_910601.awb")

						arg_623_1:RecordAudio("910601161", var_626_95)
						arg_623_1:RecordAudio("910601161", var_626_95)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_910601", "910601161", "story_v_out_910601.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_910601", "910601161", "story_v_out_910601.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_96 = var_626_85 + 0.3
			local var_626_97 = math.max(var_626_86, arg_623_1.talkMaxDuration)

			if var_626_96 <= arg_623_1.time_ and arg_623_1.time_ < var_626_96 + var_626_97 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_96) / var_626_97

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_96 + var_626_97 and arg_623_1.time_ < var_626_96 + var_626_97 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play910601072 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 910601072
		arg_629_1.duration_ = 1.999999999999

		SetActive(arg_629_1.tipsGo_, false)

		function arg_629_1.onSingleLineFinish_()
			arg_629_1.onSingleLineUpdate_ = nil
			arg_629_1.onSingleLineFinish_ = nil
			arg_629_1.state_ = "waiting"
		end

		function arg_629_1.playNext_(arg_631_0)
			if arg_631_0 == 1 then
				arg_629_0:Play910601073(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = arg_629_1.actors_["1028ui_story"].transform
			local var_632_1 = 0

			if var_632_1 < arg_629_1.time_ and arg_629_1.time_ <= var_632_1 + arg_632_0 then
				arg_629_1.var_.moveOldPos1028ui_story = var_632_0.localPosition
			end

			local var_632_2 = 0.001

			if var_632_1 <= arg_629_1.time_ and arg_629_1.time_ < var_632_1 + var_632_2 then
				local var_632_3 = (arg_629_1.time_ - var_632_1) / var_632_2
				local var_632_4 = Vector3.New(0.7, -0.9, -5.9)

				var_632_0.localPosition = Vector3.Lerp(arg_629_1.var_.moveOldPos1028ui_story, var_632_4, var_632_3)

				local var_632_5 = manager.ui.mainCamera.transform.position - var_632_0.position

				var_632_0.forward = Vector3.New(var_632_5.x, var_632_5.y, var_632_5.z)

				local var_632_6 = var_632_0.localEulerAngles

				var_632_6.z = 0
				var_632_6.x = 0
				var_632_0.localEulerAngles = var_632_6
			end

			if arg_629_1.time_ >= var_632_1 + var_632_2 and arg_629_1.time_ < var_632_1 + var_632_2 + arg_632_0 then
				var_632_0.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_632_7 = manager.ui.mainCamera.transform.position - var_632_0.position

				var_632_0.forward = Vector3.New(var_632_7.x, var_632_7.y, var_632_7.z)

				local var_632_8 = var_632_0.localEulerAngles

				var_632_8.z = 0
				var_632_8.x = 0
				var_632_0.localEulerAngles = var_632_8
			end

			local var_632_9 = arg_629_1.actors_["1028ui_story"]
			local var_632_10 = 0

			if var_632_10 < arg_629_1.time_ and arg_629_1.time_ <= var_632_10 + arg_632_0 and arg_629_1.var_.characterEffect1028ui_story == nil then
				arg_629_1.var_.characterEffect1028ui_story = var_632_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_632_11 = 0.200000002980232

			if var_632_10 <= arg_629_1.time_ and arg_629_1.time_ < var_632_10 + var_632_11 then
				local var_632_12 = (arg_629_1.time_ - var_632_10) / var_632_11

				if arg_629_1.var_.characterEffect1028ui_story then
					arg_629_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_629_1.time_ >= var_632_10 + var_632_11 and arg_629_1.time_ < var_632_10 + var_632_11 + arg_632_0 and arg_629_1.var_.characterEffect1028ui_story then
				arg_629_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_632_13 = 0

			if var_632_13 < arg_629_1.time_ and arg_629_1.time_ <= var_632_13 + arg_632_0 then
				arg_629_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_632_14 = 0

			if var_632_14 < arg_629_1.time_ and arg_629_1.time_ <= var_632_14 + arg_632_0 then
				arg_629_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_632_15 = 0
			local var_632_16 = 0.125

			if var_632_15 < arg_629_1.time_ and arg_629_1.time_ <= var_632_15 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0
				arg_629_1.dialogCg_.alpha = 1

				arg_629_1.dialog_:SetActive(true)
				SetActive(arg_629_1.leftNameGo_, true)

				local var_632_17 = arg_629_1:FormatText(StoryNameCfg[327].name)

				arg_629_1.leftNameTxt_.text = var_632_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_629_1.leftNameTxt_.transform)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1.leftNameTxt_.text)
				SetActive(arg_629_1.iconTrs_.gameObject, false)
				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_18 = arg_629_1:GetWordFromCfg(910601072)
				local var_632_19 = arg_629_1:FormatText(var_632_18.content)

				arg_629_1.text_.text = var_632_19

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_20 = 5
				local var_632_21 = utf8.len(var_632_19)
				local var_632_22 = var_632_20 <= 0 and var_632_16 or var_632_16 * (var_632_21 / var_632_20)

				if var_632_22 > 0 and var_632_16 < var_632_22 then
					arg_629_1.talkMaxDuration = var_632_22

					if var_632_22 + var_632_15 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_22 + var_632_15
					end
				end

				arg_629_1.text_.text = var_632_19
				arg_629_1.typewritter.percent = 0

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601072", "story_v_out_910601.awb") ~= 0 then
					local var_632_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601072", "story_v_out_910601.awb") / 1000

					if var_632_23 + var_632_15 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_23 + var_632_15
					end

					if var_632_18.prefab_name ~= "" and arg_629_1.actors_[var_632_18.prefab_name] ~= nil then
						local var_632_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_629_1.actors_[var_632_18.prefab_name].transform, "story_v_out_910601", "910601072", "story_v_out_910601.awb")

						arg_629_1:RecordAudio("910601072", var_632_24)
						arg_629_1:RecordAudio("910601072", var_632_24)
					else
						arg_629_1:AudioAction("play", "voice", "story_v_out_910601", "910601072", "story_v_out_910601.awb")
					end

					arg_629_1:RecordHistoryTalkVoice("story_v_out_910601", "910601072", "story_v_out_910601.awb")
				end

				arg_629_1:RecordContent(arg_629_1.text_.text)
			end

			local var_632_25 = math.max(var_632_16, arg_629_1.talkMaxDuration)

			if var_632_15 <= arg_629_1.time_ and arg_629_1.time_ < var_632_15 + var_632_25 then
				arg_629_1.typewritter.percent = (arg_629_1.time_ - var_632_15) / var_632_25

				arg_629_1.typewritter:SetDirty()
			end

			if arg_629_1.time_ >= var_632_15 + var_632_25 and arg_629_1.time_ < var_632_15 + var_632_25 + arg_632_0 then
				arg_629_1.typewritter.percent = 1

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(true)
			end
		end
	end,
	Play910601073 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 910601073
		arg_633_1.duration_ = 5

		SetActive(arg_633_1.tipsGo_, false)

		function arg_633_1.onSingleLineFinish_()
			arg_633_1.onSingleLineUpdate_ = nil
			arg_633_1.onSingleLineFinish_ = nil
			arg_633_1.state_ = "waiting"
		end

		function arg_633_1.playNext_(arg_635_0)
			if arg_635_0 == 1 then
				arg_633_0:Play910601074(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = arg_633_1.actors_["1028ui_story"]
			local var_636_1 = 0

			if var_636_1 < arg_633_1.time_ and arg_633_1.time_ <= var_636_1 + arg_636_0 and arg_633_1.var_.characterEffect1028ui_story == nil then
				arg_633_1.var_.characterEffect1028ui_story = var_636_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_636_2 = 0.200000002980232

			if var_636_1 <= arg_633_1.time_ and arg_633_1.time_ < var_636_1 + var_636_2 then
				local var_636_3 = (arg_633_1.time_ - var_636_1) / var_636_2

				if arg_633_1.var_.characterEffect1028ui_story then
					local var_636_4 = Mathf.Lerp(0, 0.5, var_636_3)

					arg_633_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_633_1.var_.characterEffect1028ui_story.fillRatio = var_636_4
				end
			end

			if arg_633_1.time_ >= var_636_1 + var_636_2 and arg_633_1.time_ < var_636_1 + var_636_2 + arg_636_0 and arg_633_1.var_.characterEffect1028ui_story then
				local var_636_5 = 0.5

				arg_633_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_633_1.var_.characterEffect1028ui_story.fillRatio = var_636_5
			end

			local var_636_6 = 0
			local var_636_7 = 1.125

			if var_636_6 < arg_633_1.time_ and arg_633_1.time_ <= var_636_6 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0
				arg_633_1.dialogCg_.alpha = 1

				arg_633_1.dialog_:SetActive(true)
				SetActive(arg_633_1.leftNameGo_, false)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_633_1.iconTrs_.gameObject, false)
				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_8 = arg_633_1:GetWordFromCfg(910601073)
				local var_636_9 = arg_633_1:FormatText(var_636_8.content)

				arg_633_1.text_.text = var_636_9

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_10 = 45
				local var_636_11 = utf8.len(var_636_9)
				local var_636_12 = var_636_10 <= 0 and var_636_7 or var_636_7 * (var_636_11 / var_636_10)

				if var_636_12 > 0 and var_636_7 < var_636_12 then
					arg_633_1.talkMaxDuration = var_636_12

					if var_636_12 + var_636_6 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_12 + var_636_6
					end
				end

				arg_633_1.text_.text = var_636_9
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)
				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_13 = math.max(var_636_7, arg_633_1.talkMaxDuration)

			if var_636_6 <= arg_633_1.time_ and arg_633_1.time_ < var_636_6 + var_636_13 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_6) / var_636_13

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_6 + var_636_13 and arg_633_1.time_ < var_636_6 + var_636_13 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play910601074 = function(arg_637_0, arg_637_1)
		arg_637_1.time_ = 0
		arg_637_1.frameCnt_ = 0
		arg_637_1.state_ = "playing"
		arg_637_1.curTalkId_ = 910601074
		arg_637_1.duration_ = 5

		SetActive(arg_637_1.tipsGo_, false)

		function arg_637_1.onSingleLineFinish_()
			arg_637_1.onSingleLineUpdate_ = nil
			arg_637_1.onSingleLineFinish_ = nil
			arg_637_1.state_ = "waiting"
		end

		function arg_637_1.playNext_(arg_639_0)
			if arg_639_0 == 1 then
				arg_637_0:Play910601075(arg_637_1)
			end
		end

		function arg_637_1.onSingleLineUpdate_(arg_640_0)
			local var_640_0 = 0
			local var_640_1 = 0.575

			if var_640_0 < arg_637_1.time_ and arg_637_1.time_ <= var_640_0 + arg_640_0 then
				arg_637_1.talkMaxDuration = 0
				arg_637_1.dialogCg_.alpha = 1

				arg_637_1.dialog_:SetActive(true)
				SetActive(arg_637_1.leftNameGo_, true)

				local var_640_2 = arg_637_1:FormatText(StoryNameCfg[7].name)

				arg_637_1.leftNameTxt_.text = var_640_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_637_1.leftNameTxt_.transform)

				arg_637_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_637_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_637_1:RecordName(arg_637_1.leftNameTxt_.text)
				SetActive(arg_637_1.iconTrs_.gameObject, false)
				arg_637_1.callingController_:SetSelectedState("normal")

				local var_640_3 = arg_637_1:GetWordFromCfg(910601074)
				local var_640_4 = arg_637_1:FormatText(var_640_3.content)

				arg_637_1.text_.text = var_640_4

				LuaForUtil.ClearLinePrefixSymbol(arg_637_1.text_)

				local var_640_5 = 23
				local var_640_6 = utf8.len(var_640_4)
				local var_640_7 = var_640_5 <= 0 and var_640_1 or var_640_1 * (var_640_6 / var_640_5)

				if var_640_7 > 0 and var_640_1 < var_640_7 then
					arg_637_1.talkMaxDuration = var_640_7

					if var_640_7 + var_640_0 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_7 + var_640_0
					end
				end

				arg_637_1.text_.text = var_640_4
				arg_637_1.typewritter.percent = 0

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(false)
				arg_637_1:RecordContent(arg_637_1.text_.text)
			end

			local var_640_8 = math.max(var_640_1, arg_637_1.talkMaxDuration)

			if var_640_0 <= arg_637_1.time_ and arg_637_1.time_ < var_640_0 + var_640_8 then
				arg_637_1.typewritter.percent = (arg_637_1.time_ - var_640_0) / var_640_8

				arg_637_1.typewritter:SetDirty()
			end

			if arg_637_1.time_ >= var_640_0 + var_640_8 and arg_637_1.time_ < var_640_0 + var_640_8 + arg_640_0 then
				arg_637_1.typewritter.percent = 1

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST60",
		"SofdecAsset/story/story_9106010.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0201",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R1102",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R2802",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R4802"
	},
	voices = {
		"story_v_out_910601.awb"
	},
	skipMarkers = {
		910601112
	}
}
