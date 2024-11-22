return {
	Play121501001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 121501001
		arg_1_1.duration_ = 12.8

		local var_1_0 = {
			ja = 9.533,
			ko = 12.8,
			zh = 12.8
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
				arg_1_0:Play121501002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST18a"

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
				local var_4_5 = arg_1_1.bgs_.ST18a

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
					if iter_4_0 ~= "ST18a" then
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
			local var_4_23 = 0.2

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.266666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.8

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[319].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(121501001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 32
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501001", "story_v_out_121501.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_121501", "121501001", "story_v_out_121501.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_121501", "121501001", "story_v_out_121501.awb")

						arg_1_1:RecordAudio("121501001", var_4_40)
						arg_1_1:RecordAudio("121501001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_121501", "121501001", "story_v_out_121501.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_121501", "121501001", "story_v_out_121501.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_41 = var_4_30 + 0.3
			local var_4_42 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_41) / var_4_42

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play121501002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 121501002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play121501003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.35

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

				local var_10_2 = arg_7_1:GetWordFromCfg(121501002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 54
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
	Play121501003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 121501003
		arg_11_1.duration_ = 2.866

		local var_11_0 = {
			ja = 2.266666666666,
			ko = 2.866,
			zh = 2.866
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
				arg_11_0:Play121501004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1033ui_story"

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

			local var_14_4 = arg_11_1.actors_["1033ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1033ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(-0.7, -0.9, -6.35)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1033ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(-0.7, -0.9, -6.35)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1033ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1033ui_story == nil then
				arg_11_1.var_.characterEffect1033ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1033ui_story then
					arg_11_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1033ui_story then
				arg_11_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action3_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_14_19 = "1029ui_story"

			if arg_11_1.actors_[var_14_19] == nil then
				local var_14_20 = Object.Instantiate(Asset.Load("Char/" .. var_14_19), arg_11_1.stage_.transform)

				var_14_20.name = var_14_19
				var_14_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_19] = var_14_20

				local var_14_21 = var_14_20:GetComponentInChildren(typeof(CharacterEffect))

				var_14_21.enabled = true

				local var_14_22 = GameObjectTools.GetOrAddComponent(var_14_20, typeof(DynamicBoneHelper))

				if var_14_22 then
					var_14_22:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_21.transform, false)

				arg_11_1.var_[var_14_19 .. "Animator"] = var_14_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_19 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_19 .. "LipSync"] = var_14_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_23 = arg_11_1.actors_["1029ui_story"].transform
			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.var_.moveOldPos1029ui_story = var_14_23.localPosition
			end

			local var_14_25 = 0.001

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_25 then
				local var_14_26 = (arg_11_1.time_ - var_14_24) / var_14_25
				local var_14_27 = Vector3.New(0.7, -1.09, -6.2)

				var_14_23.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1029ui_story, var_14_27, var_14_26)

				local var_14_28 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_28.x, var_14_28.y, var_14_28.z)

				local var_14_29 = var_14_23.localEulerAngles

				var_14_29.z = 0
				var_14_29.x = 0
				var_14_23.localEulerAngles = var_14_29
			end

			if arg_11_1.time_ >= var_14_24 + var_14_25 and arg_11_1.time_ < var_14_24 + var_14_25 + arg_14_0 then
				var_14_23.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_14_30 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_30.x, var_14_30.y, var_14_30.z)

				local var_14_31 = var_14_23.localEulerAngles

				var_14_31.z = 0
				var_14_31.x = 0
				var_14_23.localEulerAngles = var_14_31
			end

			local var_14_32 = arg_11_1.actors_["1029ui_story"]
			local var_14_33 = 0

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 and arg_11_1.var_.characterEffect1029ui_story == nil then
				arg_11_1.var_.characterEffect1029ui_story = var_14_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_34 = 0.200000002980232

			if var_14_33 <= arg_11_1.time_ and arg_11_1.time_ < var_14_33 + var_14_34 then
				local var_14_35 = (arg_11_1.time_ - var_14_33) / var_14_34

				if arg_11_1.var_.characterEffect1029ui_story then
					local var_14_36 = Mathf.Lerp(0, 0.5, var_14_35)

					arg_11_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1029ui_story.fillRatio = var_14_36
				end
			end

			if arg_11_1.time_ >= var_14_33 + var_14_34 and arg_11_1.time_ < var_14_33 + var_14_34 + arg_14_0 and arg_11_1.var_.characterEffect1029ui_story then
				local var_14_37 = 0.5

				arg_11_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1029ui_story.fillRatio = var_14_37
			end

			local var_14_38 = 0
			local var_14_39 = 0.275

			if var_14_38 < arg_11_1.time_ and arg_11_1.time_ <= var_14_38 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_40 = arg_11_1:FormatText(StoryNameCfg[236].name)

				arg_11_1.leftNameTxt_.text = var_14_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_41 = arg_11_1:GetWordFromCfg(121501003)
				local var_14_42 = arg_11_1:FormatText(var_14_41.content)

				arg_11_1.text_.text = var_14_42

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_43 = 11
				local var_14_44 = utf8.len(var_14_42)
				local var_14_45 = var_14_43 <= 0 and var_14_39 or var_14_39 * (var_14_44 / var_14_43)

				if var_14_45 > 0 and var_14_39 < var_14_45 then
					arg_11_1.talkMaxDuration = var_14_45

					if var_14_45 + var_14_38 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_45 + var_14_38
					end
				end

				arg_11_1.text_.text = var_14_42
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501003", "story_v_out_121501.awb") ~= 0 then
					local var_14_46 = manager.audio:GetVoiceLength("story_v_out_121501", "121501003", "story_v_out_121501.awb") / 1000

					if var_14_46 + var_14_38 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_46 + var_14_38
					end

					if var_14_41.prefab_name ~= "" and arg_11_1.actors_[var_14_41.prefab_name] ~= nil then
						local var_14_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_41.prefab_name].transform, "story_v_out_121501", "121501003", "story_v_out_121501.awb")

						arg_11_1:RecordAudio("121501003", var_14_47)
						arg_11_1:RecordAudio("121501003", var_14_47)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_121501", "121501003", "story_v_out_121501.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_121501", "121501003", "story_v_out_121501.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_48 = math.max(var_14_39, arg_11_1.talkMaxDuration)

			if var_14_38 <= arg_11_1.time_ and arg_11_1.time_ < var_14_38 + var_14_48 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_38) / var_14_48

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_38 + var_14_48 and arg_11_1.time_ < var_14_38 + var_14_48 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play121501004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 121501004
		arg_15_1.duration_ = 5.933

		local var_15_0 = {
			ja = 5.933,
			ko = 5.433,
			zh = 5.433
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
				arg_15_0:Play121501005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1033ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1033ui_story == nil then
				arg_15_1.var_.characterEffect1033ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1033ui_story then
					arg_15_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1033ui_story then
				arg_15_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_18_5 = 0
			local var_18_6 = 0.725

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_7 = arg_15_1:FormatText(StoryNameCfg[236].name)

				arg_15_1.leftNameTxt_.text = var_18_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_8 = arg_15_1:GetWordFromCfg(121501004)
				local var_18_9 = arg_15_1:FormatText(var_18_8.content)

				arg_15_1.text_.text = var_18_9

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_10 = 29
				local var_18_11 = utf8.len(var_18_9)
				local var_18_12 = var_18_10 <= 0 and var_18_6 or var_18_6 * (var_18_11 / var_18_10)

				if var_18_12 > 0 and var_18_6 < var_18_12 then
					arg_15_1.talkMaxDuration = var_18_12

					if var_18_12 + var_18_5 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_12 + var_18_5
					end
				end

				arg_15_1.text_.text = var_18_9
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501004", "story_v_out_121501.awb") ~= 0 then
					local var_18_13 = manager.audio:GetVoiceLength("story_v_out_121501", "121501004", "story_v_out_121501.awb") / 1000

					if var_18_13 + var_18_5 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_5
					end

					if var_18_8.prefab_name ~= "" and arg_15_1.actors_[var_18_8.prefab_name] ~= nil then
						local var_18_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_8.prefab_name].transform, "story_v_out_121501", "121501004", "story_v_out_121501.awb")

						arg_15_1:RecordAudio("121501004", var_18_14)
						arg_15_1:RecordAudio("121501004", var_18_14)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_121501", "121501004", "story_v_out_121501.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_121501", "121501004", "story_v_out_121501.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_15 = math.max(var_18_6, arg_15_1.talkMaxDuration)

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_15 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_5) / var_18_15

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_5 + var_18_15 and arg_15_1.time_ < var_18_5 + var_18_15 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play121501005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 121501005
		arg_19_1.duration_ = 3.2

		local var_19_0 = {
			ja = 3.2,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_19_0:Play121501006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1029ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1029ui_story == nil then
				arg_19_1.var_.characterEffect1029ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1029ui_story then
					arg_19_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1029ui_story then
				arg_19_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_6 = arg_19_1.actors_["1033ui_story"]
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 and arg_19_1.var_.characterEffect1033ui_story == nil then
				arg_19_1.var_.characterEffect1033ui_story = var_22_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_8 = 0.200000002980232

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8

				if arg_19_1.var_.characterEffect1033ui_story then
					local var_22_10 = Mathf.Lerp(0, 0.5, var_22_9)

					arg_19_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1033ui_story.fillRatio = var_22_10
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.characterEffect1033ui_story then
				local var_22_11 = 0.5

				arg_19_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1033ui_story.fillRatio = var_22_11
			end

			local var_22_12 = 0
			local var_22_13 = 0.225

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[319].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(121501005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 9
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_13 or var_22_13 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_13 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19

					if var_22_19 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_12
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501005", "story_v_out_121501.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501005", "story_v_out_121501.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_121501", "121501005", "story_v_out_121501.awb")

						arg_19_1:RecordAudio("121501005", var_22_21)
						arg_19_1:RecordAudio("121501005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_121501", "121501005", "story_v_out_121501.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_121501", "121501005", "story_v_out_121501.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_13, arg_19_1.talkMaxDuration)

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_12) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_12 + var_22_22 and arg_19_1.time_ < var_22_12 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play121501006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 121501006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play121501007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1033ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1033ui_story == nil then
				arg_23_1.var_.characterEffect1033ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1033ui_story then
					arg_23_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1033ui_story then
				arg_23_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_5 = arg_23_1.actors_["1029ui_story"]
			local var_26_6 = 0

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1029ui_story == nil then
				arg_23_1.var_.characterEffect1029ui_story = var_26_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_7 = 0.200000002980232

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_7 then
				local var_26_8 = (arg_23_1.time_ - var_26_6) / var_26_7

				if arg_23_1.var_.characterEffect1029ui_story then
					local var_26_9 = Mathf.Lerp(0, 0.5, var_26_8)

					arg_23_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1029ui_story.fillRatio = var_26_9
				end
			end

			if arg_23_1.time_ >= var_26_6 + var_26_7 and arg_23_1.time_ < var_26_6 + var_26_7 + arg_26_0 and arg_23_1.var_.characterEffect1029ui_story then
				local var_26_10 = 0.5

				arg_23_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1029ui_story.fillRatio = var_26_10
			end

			local var_26_11 = 0
			local var_26_12 = 0.1

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_13 = arg_23_1:FormatText(StoryNameCfg[236].name)

				arg_23_1.leftNameTxt_.text = var_26_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_14 = arg_23_1:GetWordFromCfg(121501006)
				local var_26_15 = arg_23_1:FormatText(var_26_14.content)

				arg_23_1.text_.text = var_26_15

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_16 = 4
				local var_26_17 = utf8.len(var_26_15)
				local var_26_18 = var_26_16 <= 0 and var_26_12 or var_26_12 * (var_26_17 / var_26_16)

				if var_26_18 > 0 and var_26_12 < var_26_18 then
					arg_23_1.talkMaxDuration = var_26_18

					if var_26_18 + var_26_11 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_11
					end
				end

				arg_23_1.text_.text = var_26_15
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501006", "story_v_out_121501.awb") ~= 0 then
					local var_26_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501006", "story_v_out_121501.awb") / 1000

					if var_26_19 + var_26_11 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_11
					end

					if var_26_14.prefab_name ~= "" and arg_23_1.actors_[var_26_14.prefab_name] ~= nil then
						local var_26_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_14.prefab_name].transform, "story_v_out_121501", "121501006", "story_v_out_121501.awb")

						arg_23_1:RecordAudio("121501006", var_26_20)
						arg_23_1:RecordAudio("121501006", var_26_20)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_121501", "121501006", "story_v_out_121501.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_121501", "121501006", "story_v_out_121501.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_21 = math.max(var_26_12, arg_23_1.talkMaxDuration)

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_21 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_11) / var_26_21

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_11 + var_26_21 and arg_23_1.time_ < var_26_11 + var_26_21 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play121501007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 121501007
		arg_27_1.duration_ = 9.4

		local var_27_0 = {
			ja = 9.4,
			ko = 5.366,
			zh = 5.366
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
				arg_27_0:Play121501008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1029ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1029ui_story == nil then
				arg_27_1.var_.characterEffect1029ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1029ui_story then
					arg_27_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1029ui_story then
				arg_27_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_5 = arg_27_1.actors_["1033ui_story"]
			local var_30_6 = 0

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1033ui_story == nil then
				arg_27_1.var_.characterEffect1033ui_story = var_30_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_7 = 0.200000002980232

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_7 then
				local var_30_8 = (arg_27_1.time_ - var_30_6) / var_30_7

				if arg_27_1.var_.characterEffect1033ui_story then
					local var_30_9 = Mathf.Lerp(0, 0.5, var_30_8)

					arg_27_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1033ui_story.fillRatio = var_30_9
				end
			end

			if arg_27_1.time_ >= var_30_6 + var_30_7 and arg_27_1.time_ < var_30_6 + var_30_7 + arg_30_0 and arg_27_1.var_.characterEffect1033ui_story then
				local var_30_10 = 0.5

				arg_27_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1033ui_story.fillRatio = var_30_10
			end

			local var_30_11 = 0
			local var_30_12 = 0.625

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_13 = arg_27_1:FormatText(StoryNameCfg[319].name)

				arg_27_1.leftNameTxt_.text = var_30_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_14 = arg_27_1:GetWordFromCfg(121501007)
				local var_30_15 = arg_27_1:FormatText(var_30_14.content)

				arg_27_1.text_.text = var_30_15

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_16 = 25
				local var_30_17 = utf8.len(var_30_15)
				local var_30_18 = var_30_16 <= 0 and var_30_12 or var_30_12 * (var_30_17 / var_30_16)

				if var_30_18 > 0 and var_30_12 < var_30_18 then
					arg_27_1.talkMaxDuration = var_30_18

					if var_30_18 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_11
					end
				end

				arg_27_1.text_.text = var_30_15
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501007", "story_v_out_121501.awb") ~= 0 then
					local var_30_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501007", "story_v_out_121501.awb") / 1000

					if var_30_19 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_11
					end

					if var_30_14.prefab_name ~= "" and arg_27_1.actors_[var_30_14.prefab_name] ~= nil then
						local var_30_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_14.prefab_name].transform, "story_v_out_121501", "121501007", "story_v_out_121501.awb")

						arg_27_1:RecordAudio("121501007", var_30_20)
						arg_27_1:RecordAudio("121501007", var_30_20)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_121501", "121501007", "story_v_out_121501.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_121501", "121501007", "story_v_out_121501.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_21 = math.max(var_30_12, arg_27_1.talkMaxDuration)

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_21 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_11) / var_30_21

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_11 + var_30_21 and arg_27_1.time_ < var_30_11 + var_30_21 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play121501008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 121501008
		arg_31_1.duration_ = 14.233

		local var_31_0 = {
			ja = 14.233,
			ko = 8.566,
			zh = 8.566
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
				arg_31_0:Play121501009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1029ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1029ui_story == nil then
				arg_31_1.var_.characterEffect1029ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1029ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1029ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1029ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1029ui_story.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["1033ui_story"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.characterEffect1033ui_story == nil then
				arg_31_1.var_.characterEffect1033ui_story = var_34_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_8 = 0.200000002980232

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.characterEffect1033ui_story then
					arg_31_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect1033ui_story then
				arg_31_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_34_10 = 0
			local var_34_11 = 0.975

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_12 = arg_31_1:FormatText(StoryNameCfg[236].name)

				arg_31_1.leftNameTxt_.text = var_34_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_13 = arg_31_1:GetWordFromCfg(121501008)
				local var_34_14 = arg_31_1:FormatText(var_34_13.content)

				arg_31_1.text_.text = var_34_14

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_15 = 39
				local var_34_16 = utf8.len(var_34_14)
				local var_34_17 = var_34_15 <= 0 and var_34_11 or var_34_11 * (var_34_16 / var_34_15)

				if var_34_17 > 0 and var_34_11 < var_34_17 then
					arg_31_1.talkMaxDuration = var_34_17

					if var_34_17 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_17 + var_34_10
					end
				end

				arg_31_1.text_.text = var_34_14
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501008", "story_v_out_121501.awb") ~= 0 then
					local var_34_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501008", "story_v_out_121501.awb") / 1000

					if var_34_18 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_10
					end

					if var_34_13.prefab_name ~= "" and arg_31_1.actors_[var_34_13.prefab_name] ~= nil then
						local var_34_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_13.prefab_name].transform, "story_v_out_121501", "121501008", "story_v_out_121501.awb")

						arg_31_1:RecordAudio("121501008", var_34_19)
						arg_31_1:RecordAudio("121501008", var_34_19)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_121501", "121501008", "story_v_out_121501.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_121501", "121501008", "story_v_out_121501.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_20 = math.max(var_34_11, arg_31_1.talkMaxDuration)

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_20 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_10) / var_34_20

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_10 + var_34_20 and arg_31_1.time_ < var_34_10 + var_34_20 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play121501009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 121501009
		arg_35_1.duration_ = 9.233

		local var_35_0 = {
			ja = 9.233,
			ko = 4.833,
			zh = 4.833
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
				arg_35_0:Play121501010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.45

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[236].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(121501009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 18
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_1 or var_38_1 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_1 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501009", "story_v_out_121501.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501009", "story_v_out_121501.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_121501", "121501009", "story_v_out_121501.awb")

						arg_35_1:RecordAudio("121501009", var_38_9)
						arg_35_1:RecordAudio("121501009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_121501", "121501009", "story_v_out_121501.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_121501", "121501009", "story_v_out_121501.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play121501010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 121501010
		arg_39_1.duration_ = 8.966

		local var_39_0 = {
			ja = 8.966,
			ko = 6.5,
			zh = 6.5
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
				arg_39_0:Play121501011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1029ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1029ui_story == nil then
				arg_39_1.var_.characterEffect1029ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1029ui_story then
					arg_39_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1029ui_story then
				arg_39_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1033ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1033ui_story == nil then
				arg_39_1.var_.characterEffect1033ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.200000002980232

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1033ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1033ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1033ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1033ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0
			local var_42_11 = 0.875

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_12 = arg_39_1:FormatText(StoryNameCfg[319].name)

				arg_39_1.leftNameTxt_.text = var_42_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_13 = arg_39_1:GetWordFromCfg(121501010)
				local var_42_14 = arg_39_1:FormatText(var_42_13.content)

				arg_39_1.text_.text = var_42_14

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_15 = 35
				local var_42_16 = utf8.len(var_42_14)
				local var_42_17 = var_42_15 <= 0 and var_42_11 or var_42_11 * (var_42_16 / var_42_15)

				if var_42_17 > 0 and var_42_11 < var_42_17 then
					arg_39_1.talkMaxDuration = var_42_17

					if var_42_17 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_17 + var_42_10
					end
				end

				arg_39_1.text_.text = var_42_14
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501010", "story_v_out_121501.awb") ~= 0 then
					local var_42_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501010", "story_v_out_121501.awb") / 1000

					if var_42_18 + var_42_10 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_10
					end

					if var_42_13.prefab_name ~= "" and arg_39_1.actors_[var_42_13.prefab_name] ~= nil then
						local var_42_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_13.prefab_name].transform, "story_v_out_121501", "121501010", "story_v_out_121501.awb")

						arg_39_1:RecordAudio("121501010", var_42_19)
						arg_39_1:RecordAudio("121501010", var_42_19)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_121501", "121501010", "story_v_out_121501.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_121501", "121501010", "story_v_out_121501.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_20 = math.max(var_42_11, arg_39_1.talkMaxDuration)

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_20 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_10) / var_42_20

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_10 + var_42_20 and arg_39_1.time_ < var_42_10 + var_42_20 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play121501011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 121501011
		arg_43_1.duration_ = 8.5

		local var_43_0 = {
			ja = 8.5,
			ko = 3.433,
			zh = 3.433
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
				arg_43_0:Play121501012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action442")
			end

			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_2 = 0
			local var_46_3 = 0.375

			if var_46_2 < arg_43_1.time_ and arg_43_1.time_ <= var_46_2 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_4 = arg_43_1:FormatText(StoryNameCfg[319].name)

				arg_43_1.leftNameTxt_.text = var_46_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_5 = arg_43_1:GetWordFromCfg(121501011)
				local var_46_6 = arg_43_1:FormatText(var_46_5.content)

				arg_43_1.text_.text = var_46_6

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_7 = 15
				local var_46_8 = utf8.len(var_46_6)
				local var_46_9 = var_46_7 <= 0 and var_46_3 or var_46_3 * (var_46_8 / var_46_7)

				if var_46_9 > 0 and var_46_3 < var_46_9 then
					arg_43_1.talkMaxDuration = var_46_9

					if var_46_9 + var_46_2 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_9 + var_46_2
					end
				end

				arg_43_1.text_.text = var_46_6
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501011", "story_v_out_121501.awb") ~= 0 then
					local var_46_10 = manager.audio:GetVoiceLength("story_v_out_121501", "121501011", "story_v_out_121501.awb") / 1000

					if var_46_10 + var_46_2 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_10 + var_46_2
					end

					if var_46_5.prefab_name ~= "" and arg_43_1.actors_[var_46_5.prefab_name] ~= nil then
						local var_46_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_5.prefab_name].transform, "story_v_out_121501", "121501011", "story_v_out_121501.awb")

						arg_43_1:RecordAudio("121501011", var_46_11)
						arg_43_1:RecordAudio("121501011", var_46_11)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_121501", "121501011", "story_v_out_121501.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_121501", "121501011", "story_v_out_121501.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_12 = math.max(var_46_3, arg_43_1.talkMaxDuration)

			if var_46_2 <= arg_43_1.time_ and arg_43_1.time_ < var_46_2 + var_46_12 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_2) / var_46_12

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_2 + var_46_12 and arg_43_1.time_ < var_46_2 + var_46_12 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play121501012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 121501012
		arg_47_1.duration_ = 10.833

		local var_47_0 = {
			ja = 10.833,
			ko = 9.6,
			zh = 9.6
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
				arg_47_0:Play121501013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1033ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1033ui_story == nil then
				arg_47_1.var_.characterEffect1033ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1033ui_story then
					arg_47_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1033ui_story then
				arg_47_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033actionlink/1033action438")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_6 = arg_47_1.actors_["1029ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1029ui_story == nil then
				arg_47_1.var_.characterEffect1029ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1029ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1029ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1029ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1029ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 1.1

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[236].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(121501012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 44
				local var_50_18 = utf8.len(var_50_16)
				local var_50_19 = var_50_17 <= 0 and var_50_13 or var_50_13 * (var_50_18 / var_50_17)

				if var_50_19 > 0 and var_50_13 < var_50_19 then
					arg_47_1.talkMaxDuration = var_50_19

					if var_50_19 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_12
					end
				end

				arg_47_1.text_.text = var_50_16
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501012", "story_v_out_121501.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501012", "story_v_out_121501.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_121501", "121501012", "story_v_out_121501.awb")

						arg_47_1:RecordAudio("121501012", var_50_21)
						arg_47_1:RecordAudio("121501012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_121501", "121501012", "story_v_out_121501.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_121501", "121501012", "story_v_out_121501.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_22 = math.max(var_50_13, arg_47_1.talkMaxDuration)

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_22 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_12) / var_50_22

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_12 + var_50_22 and arg_47_1.time_ < var_50_12 + var_50_22 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play121501013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 121501013
		arg_51_1.duration_ = 10.333

		local var_51_0 = {
			ja = 10.333,
			ko = 9.6,
			zh = 9.6
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
				arg_51_0:Play121501014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1033ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1033ui_story == nil then
				arg_51_1.var_.characterEffect1033ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1033ui_story then
					arg_51_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1033ui_story then
				arg_51_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_54_4 = 0

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_54_5 = 0
			local var_54_6 = 1.2

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_7 = arg_51_1:FormatText(StoryNameCfg[236].name)

				arg_51_1.leftNameTxt_.text = var_54_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_8 = arg_51_1:GetWordFromCfg(121501013)
				local var_54_9 = arg_51_1:FormatText(var_54_8.content)

				arg_51_1.text_.text = var_54_9

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_10 = 49
				local var_54_11 = utf8.len(var_54_9)
				local var_54_12 = var_54_10 <= 0 and var_54_6 or var_54_6 * (var_54_11 / var_54_10)

				if var_54_12 > 0 and var_54_6 < var_54_12 then
					arg_51_1.talkMaxDuration = var_54_12

					if var_54_12 + var_54_5 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_5
					end
				end

				arg_51_1.text_.text = var_54_9
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501013", "story_v_out_121501.awb") ~= 0 then
					local var_54_13 = manager.audio:GetVoiceLength("story_v_out_121501", "121501013", "story_v_out_121501.awb") / 1000

					if var_54_13 + var_54_5 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_13 + var_54_5
					end

					if var_54_8.prefab_name ~= "" and arg_51_1.actors_[var_54_8.prefab_name] ~= nil then
						local var_54_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_8.prefab_name].transform, "story_v_out_121501", "121501013", "story_v_out_121501.awb")

						arg_51_1:RecordAudio("121501013", var_54_14)
						arg_51_1:RecordAudio("121501013", var_54_14)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_121501", "121501013", "story_v_out_121501.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_121501", "121501013", "story_v_out_121501.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_15 = math.max(var_54_6, arg_51_1.talkMaxDuration)

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_15 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_5) / var_54_15

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_5 + var_54_15 and arg_51_1.time_ < var_54_5 + var_54_15 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play121501014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 121501014
		arg_55_1.duration_ = 11.833

		local var_55_0 = {
			ja = 11.833,
			ko = 8.1,
			zh = 8.1
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
				arg_55_0:Play121501015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1033ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1033ui_story == nil then
				arg_55_1.var_.characterEffect1033ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1033ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1033ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1033ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1033ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_2")
			end

			local var_58_7 = arg_55_1.actors_["1029ui_story"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story == nil then
				arg_55_1.var_.characterEffect1029ui_story = var_58_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_9 = 0.200000002980232

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.characterEffect1029ui_story then
					arg_55_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story then
				arg_55_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_58_11 = 0
			local var_58_12 = 0.875

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_13 = arg_55_1:FormatText(StoryNameCfg[319].name)

				arg_55_1.leftNameTxt_.text = var_58_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_14 = arg_55_1:GetWordFromCfg(121501014)
				local var_58_15 = arg_55_1:FormatText(var_58_14.content)

				arg_55_1.text_.text = var_58_15

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_16 = 35
				local var_58_17 = utf8.len(var_58_15)
				local var_58_18 = var_58_16 <= 0 and var_58_12 or var_58_12 * (var_58_17 / var_58_16)

				if var_58_18 > 0 and var_58_12 < var_58_18 then
					arg_55_1.talkMaxDuration = var_58_18

					if var_58_18 + var_58_11 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_11
					end
				end

				arg_55_1.text_.text = var_58_15
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501014", "story_v_out_121501.awb") ~= 0 then
					local var_58_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501014", "story_v_out_121501.awb") / 1000

					if var_58_19 + var_58_11 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_11
					end

					if var_58_14.prefab_name ~= "" and arg_55_1.actors_[var_58_14.prefab_name] ~= nil then
						local var_58_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_14.prefab_name].transform, "story_v_out_121501", "121501014", "story_v_out_121501.awb")

						arg_55_1:RecordAudio("121501014", var_58_20)
						arg_55_1:RecordAudio("121501014", var_58_20)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_121501", "121501014", "story_v_out_121501.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_121501", "121501014", "story_v_out_121501.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_21 = math.max(var_58_12, arg_55_1.talkMaxDuration)

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_21 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_11) / var_58_21

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_11 + var_58_21 and arg_55_1.time_ < var_58_11 + var_58_21 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play121501015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 121501015
		arg_59_1.duration_ = 15.966

		local var_59_0 = {
			ja = 15.966,
			ko = 10.7,
			zh = 10.7
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
				arg_59_0:Play121501016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033actionlink/1033action482")
			end

			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_2 = arg_59_1.actors_["1029ui_story"]
			local var_62_3 = 0

			if var_62_3 < arg_59_1.time_ and arg_59_1.time_ <= var_62_3 + arg_62_0 and arg_59_1.var_.characterEffect1029ui_story == nil then
				arg_59_1.var_.characterEffect1029ui_story = var_62_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_4 = 0.200000002980232

			if var_62_3 <= arg_59_1.time_ and arg_59_1.time_ < var_62_3 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_3) / var_62_4

				if arg_59_1.var_.characterEffect1029ui_story then
					local var_62_6 = Mathf.Lerp(0, 0.5, var_62_5)

					arg_59_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1029ui_story.fillRatio = var_62_6
				end
			end

			if arg_59_1.time_ >= var_62_3 + var_62_4 and arg_59_1.time_ < var_62_3 + var_62_4 + arg_62_0 and arg_59_1.var_.characterEffect1029ui_story then
				local var_62_7 = 0.5

				arg_59_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1029ui_story.fillRatio = var_62_7
			end

			local var_62_8 = arg_59_1.actors_["1033ui_story"]
			local var_62_9 = 0

			if var_62_9 < arg_59_1.time_ and arg_59_1.time_ <= var_62_9 + arg_62_0 and arg_59_1.var_.characterEffect1033ui_story == nil then
				arg_59_1.var_.characterEffect1033ui_story = var_62_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_10 = 0.200000002980232

			if var_62_9 <= arg_59_1.time_ and arg_59_1.time_ < var_62_9 + var_62_10 then
				local var_62_11 = (arg_59_1.time_ - var_62_9) / var_62_10

				if arg_59_1.var_.characterEffect1033ui_story then
					arg_59_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_9 + var_62_10 and arg_59_1.time_ < var_62_9 + var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1033ui_story then
				arg_59_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_62_12 = 0
			local var_62_13 = 1.45

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[236].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(121501015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 58
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501015", "story_v_out_121501.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501015", "story_v_out_121501.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_121501", "121501015", "story_v_out_121501.awb")

						arg_59_1:RecordAudio("121501015", var_62_21)
						arg_59_1:RecordAudio("121501015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_121501", "121501015", "story_v_out_121501.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_121501", "121501015", "story_v_out_121501.awb")
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
	Play121501016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 121501016
		arg_63_1.duration_ = 12.333

		local var_63_0 = {
			ja = 12.333,
			ko = 11.166,
			zh = 11.166
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
				arg_63_0:Play121501017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1.175

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[236].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(121501016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 47
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501016", "story_v_out_121501.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501016", "story_v_out_121501.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_121501", "121501016", "story_v_out_121501.awb")

						arg_63_1:RecordAudio("121501016", var_66_9)
						arg_63_1:RecordAudio("121501016", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_121501", "121501016", "story_v_out_121501.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_121501", "121501016", "story_v_out_121501.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play121501017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 121501017
		arg_67_1.duration_ = 11.2

		local var_67_0 = {
			ja = 11.2,
			ko = 8.3,
			zh = 8.3
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
				arg_67_0:Play121501018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_2 = arg_67_1.actors_["1029ui_story"]
			local var_70_3 = 0

			if var_70_3 < arg_67_1.time_ and arg_67_1.time_ <= var_70_3 + arg_70_0 and arg_67_1.var_.characterEffect1029ui_story == nil then
				arg_67_1.var_.characterEffect1029ui_story = var_70_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_4 = 0.200000002980232

			if var_70_3 <= arg_67_1.time_ and arg_67_1.time_ < var_70_3 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_3) / var_70_4

				if arg_67_1.var_.characterEffect1029ui_story then
					arg_67_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_3 + var_70_4 and arg_67_1.time_ < var_70_3 + var_70_4 + arg_70_0 and arg_67_1.var_.characterEffect1029ui_story then
				arg_67_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_70_6 = arg_67_1.actors_["1033ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect1033ui_story == nil then
				arg_67_1.var_.characterEffect1033ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect1033ui_story then
					local var_70_10 = Mathf.Lerp(0, 0.5, var_70_9)

					arg_67_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1033ui_story.fillRatio = var_70_10
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect1033ui_story then
				local var_70_11 = 0.5

				arg_67_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1033ui_story.fillRatio = var_70_11
			end

			local var_70_12 = 0
			local var_70_13 = 1.05

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[319].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(121501017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501017", "story_v_out_121501.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501017", "story_v_out_121501.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_121501", "121501017", "story_v_out_121501.awb")

						arg_67_1:RecordAudio("121501017", var_70_21)
						arg_67_1:RecordAudio("121501017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_121501", "121501017", "story_v_out_121501.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_121501", "121501017", "story_v_out_121501.awb")
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
	Play121501018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 121501018
		arg_71_1.duration_ = 11.5

		local var_71_0 = {
			ja = 11.5,
			ko = 7.433,
			zh = 7.433
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
				arg_71_0:Play121501019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_74_1 = arg_71_1.actors_["1029ui_story"]
			local var_74_2 = 0

			if var_74_2 < arg_71_1.time_ and arg_71_1.time_ <= var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1029ui_story == nil then
				arg_71_1.var_.characterEffect1029ui_story = var_74_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_3 = 0.200000002980232

			if var_74_2 <= arg_71_1.time_ and arg_71_1.time_ < var_74_2 + var_74_3 then
				local var_74_4 = (arg_71_1.time_ - var_74_2) / var_74_3

				if arg_71_1.var_.characterEffect1029ui_story then
					local var_74_5 = Mathf.Lerp(0, 0.5, var_74_4)

					arg_71_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1029ui_story.fillRatio = var_74_5
				end
			end

			if arg_71_1.time_ >= var_74_2 + var_74_3 and arg_71_1.time_ < var_74_2 + var_74_3 + arg_74_0 and arg_71_1.var_.characterEffect1029ui_story then
				local var_74_6 = 0.5

				arg_71_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1029ui_story.fillRatio = var_74_6
			end

			local var_74_7 = arg_71_1.actors_["1033ui_story"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect1033ui_story == nil then
				arg_71_1.var_.characterEffect1033ui_story = var_74_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_9 = 0.200000002980232

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.characterEffect1033ui_story then
					arg_71_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.characterEffect1033ui_story then
				arg_71_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_74_11 = 0
			local var_74_12 = 0.825

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_13 = arg_71_1:FormatText(StoryNameCfg[236].name)

				arg_71_1.leftNameTxt_.text = var_74_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_14 = arg_71_1:GetWordFromCfg(121501018)
				local var_74_15 = arg_71_1:FormatText(var_74_14.content)

				arg_71_1.text_.text = var_74_15

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_16 = 33
				local var_74_17 = utf8.len(var_74_15)
				local var_74_18 = var_74_16 <= 0 and var_74_12 or var_74_12 * (var_74_17 / var_74_16)

				if var_74_18 > 0 and var_74_12 < var_74_18 then
					arg_71_1.talkMaxDuration = var_74_18

					if var_74_18 + var_74_11 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_11
					end
				end

				arg_71_1.text_.text = var_74_15
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501018", "story_v_out_121501.awb") ~= 0 then
					local var_74_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501018", "story_v_out_121501.awb") / 1000

					if var_74_19 + var_74_11 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_11
					end

					if var_74_14.prefab_name ~= "" and arg_71_1.actors_[var_74_14.prefab_name] ~= nil then
						local var_74_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_14.prefab_name].transform, "story_v_out_121501", "121501018", "story_v_out_121501.awb")

						arg_71_1:RecordAudio("121501018", var_74_20)
						arg_71_1:RecordAudio("121501018", var_74_20)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_121501", "121501018", "story_v_out_121501.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_121501", "121501018", "story_v_out_121501.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_21 = math.max(var_74_12, arg_71_1.talkMaxDuration)

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_21 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_11) / var_74_21

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_11 + var_74_21 and arg_71_1.time_ < var_74_11 + var_74_21 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play121501019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 121501019
		arg_75_1.duration_ = 7.199999999998

		local var_75_0 = {
			ja = 7.199999999998,
			ko = 6.932999999998,
			zh = 6.932999999998
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
				arg_75_0:Play121501020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "ST12"

			if arg_75_1.bgs_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(arg_75_1.paintGo_)

				var_78_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_78_0)
				var_78_1.name = var_78_0
				var_78_1.transform.parent = arg_75_1.stage_.transform
				var_78_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.bgs_[var_78_0] = var_78_1
			end

			local var_78_2 = 1.999999999999

			if var_78_2 < arg_75_1.time_ and arg_75_1.time_ <= var_78_2 + arg_78_0 then
				local var_78_3 = manager.ui.mainCamera.transform.localPosition
				local var_78_4 = Vector3.New(0, 0, 10) + Vector3.New(var_78_3.x, var_78_3.y, 0)
				local var_78_5 = arg_75_1.bgs_.ST12

				var_78_5.transform.localPosition = var_78_4
				var_78_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_78_6 = var_78_5:GetComponent("SpriteRenderer")

				if var_78_6 and var_78_6.sprite then
					local var_78_7 = (var_78_5.transform.localPosition - var_78_3).z
					local var_78_8 = manager.ui.mainCameraCom_
					local var_78_9 = 2 * var_78_7 * Mathf.Tan(var_78_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_78_10 = var_78_9 * var_78_8.aspect
					local var_78_11 = var_78_6.sprite.bounds.size.x
					local var_78_12 = var_78_6.sprite.bounds.size.y
					local var_78_13 = var_78_10 / var_78_11
					local var_78_14 = var_78_9 / var_78_12
					local var_78_15 = var_78_14 < var_78_13 and var_78_13 or var_78_14

					var_78_5.transform.localScale = Vector3.New(var_78_15, var_78_15, 0)
				end

				for iter_78_0, iter_78_1 in pairs(arg_75_1.bgs_) do
					if iter_78_0 ~= "ST12" then
						iter_78_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_17 = 2

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Color.New(0, 0, 0)

				var_78_19.a = Mathf.Lerp(0, 1, var_78_18)
				arg_75_1.mask_.color = var_78_19
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				local var_78_20 = Color.New(0, 0, 0)

				var_78_20.a = 1
				arg_75_1.mask_.color = var_78_20
			end

			local var_78_21 = 2.00000000298023

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_22 = 2

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_21) / var_78_22
				local var_78_24 = Color.New(0, 0, 0)

				var_78_24.a = Mathf.Lerp(1, 0, var_78_23)
				arg_75_1.mask_.color = var_78_24
			end

			if arg_75_1.time_ >= var_78_21 + var_78_22 and arg_75_1.time_ < var_78_21 + var_78_22 + arg_78_0 then
				local var_78_25 = Color.New(0, 0, 0)
				local var_78_26 = 0

				arg_75_1.mask_.enabled = false
				var_78_25.a = var_78_26
				arg_75_1.mask_.color = var_78_25
			end

			local var_78_27 = arg_75_1.actors_["1033ui_story"].transform
			local var_78_28 = 1.96599999815226

			if var_78_28 < arg_75_1.time_ and arg_75_1.time_ <= var_78_28 + arg_78_0 then
				arg_75_1.var_.moveOldPos1033ui_story = var_78_27.localPosition
			end

			local var_78_29 = 0.001

			if var_78_28 <= arg_75_1.time_ and arg_75_1.time_ < var_78_28 + var_78_29 then
				local var_78_30 = (arg_75_1.time_ - var_78_28) / var_78_29
				local var_78_31 = Vector3.New(0, 100, 0)

				var_78_27.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1033ui_story, var_78_31, var_78_30)

				local var_78_32 = manager.ui.mainCamera.transform.position - var_78_27.position

				var_78_27.forward = Vector3.New(var_78_32.x, var_78_32.y, var_78_32.z)

				local var_78_33 = var_78_27.localEulerAngles

				var_78_33.z = 0
				var_78_33.x = 0
				var_78_27.localEulerAngles = var_78_33
			end

			if arg_75_1.time_ >= var_78_28 + var_78_29 and arg_75_1.time_ < var_78_28 + var_78_29 + arg_78_0 then
				var_78_27.localPosition = Vector3.New(0, 100, 0)

				local var_78_34 = manager.ui.mainCamera.transform.position - var_78_27.position

				var_78_27.forward = Vector3.New(var_78_34.x, var_78_34.y, var_78_34.z)

				local var_78_35 = var_78_27.localEulerAngles

				var_78_35.z = 0
				var_78_35.x = 0
				var_78_27.localEulerAngles = var_78_35
			end

			local var_78_36 = arg_75_1.actors_["1033ui_story"]
			local var_78_37 = 1.96599999815226

			if var_78_37 < arg_75_1.time_ and arg_75_1.time_ <= var_78_37 + arg_78_0 and arg_75_1.var_.characterEffect1033ui_story == nil then
				arg_75_1.var_.characterEffect1033ui_story = var_78_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_38 = 0.034000001847744

			if var_78_37 <= arg_75_1.time_ and arg_75_1.time_ < var_78_37 + var_78_38 then
				local var_78_39 = (arg_75_1.time_ - var_78_37) / var_78_38

				if arg_75_1.var_.characterEffect1033ui_story then
					local var_78_40 = Mathf.Lerp(0, 0.5, var_78_39)

					arg_75_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1033ui_story.fillRatio = var_78_40
				end
			end

			if arg_75_1.time_ >= var_78_37 + var_78_38 and arg_75_1.time_ < var_78_37 + var_78_38 + arg_78_0 and arg_75_1.var_.characterEffect1033ui_story then
				local var_78_41 = 0.5

				arg_75_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1033ui_story.fillRatio = var_78_41
			end

			local var_78_42 = arg_75_1.actors_["1029ui_story"].transform
			local var_78_43 = 1.96599999815226

			if var_78_43 < arg_75_1.time_ and arg_75_1.time_ <= var_78_43 + arg_78_0 then
				arg_75_1.var_.moveOldPos1029ui_story = var_78_42.localPosition
			end

			local var_78_44 = 0.001

			if var_78_43 <= arg_75_1.time_ and arg_75_1.time_ < var_78_43 + var_78_44 then
				local var_78_45 = (arg_75_1.time_ - var_78_43) / var_78_44
				local var_78_46 = Vector3.New(0, 100, 0)

				var_78_42.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1029ui_story, var_78_46, var_78_45)

				local var_78_47 = manager.ui.mainCamera.transform.position - var_78_42.position

				var_78_42.forward = Vector3.New(var_78_47.x, var_78_47.y, var_78_47.z)

				local var_78_48 = var_78_42.localEulerAngles

				var_78_48.z = 0
				var_78_48.x = 0
				var_78_42.localEulerAngles = var_78_48
			end

			if arg_75_1.time_ >= var_78_43 + var_78_44 and arg_75_1.time_ < var_78_43 + var_78_44 + arg_78_0 then
				var_78_42.localPosition = Vector3.New(0, 100, 0)

				local var_78_49 = manager.ui.mainCamera.transform.position - var_78_42.position

				var_78_42.forward = Vector3.New(var_78_49.x, var_78_49.y, var_78_49.z)

				local var_78_50 = var_78_42.localEulerAngles

				var_78_50.z = 0
				var_78_50.x = 0
				var_78_42.localEulerAngles = var_78_50
			end

			local var_78_51 = arg_75_1.actors_["1029ui_story"]
			local var_78_52 = 1.96599999815226

			if var_78_52 < arg_75_1.time_ and arg_75_1.time_ <= var_78_52 + arg_78_0 and arg_75_1.var_.characterEffect1029ui_story == nil then
				arg_75_1.var_.characterEffect1029ui_story = var_78_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_53 = 0.034000001847744

			if var_78_52 <= arg_75_1.time_ and arg_75_1.time_ < var_78_52 + var_78_53 then
				local var_78_54 = (arg_75_1.time_ - var_78_52) / var_78_53

				if arg_75_1.var_.characterEffect1029ui_story then
					local var_78_55 = Mathf.Lerp(0, 0.5, var_78_54)

					arg_75_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1029ui_story.fillRatio = var_78_55
				end
			end

			if arg_75_1.time_ >= var_78_52 + var_78_53 and arg_75_1.time_ < var_78_52 + var_78_53 + arg_78_0 and arg_75_1.var_.characterEffect1029ui_story then
				local var_78_56 = 0.5

				arg_75_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1029ui_story.fillRatio = var_78_56
			end

			local var_78_57 = "1019ui_story"

			if arg_75_1.actors_[var_78_57] == nil then
				local var_78_58 = Object.Instantiate(Asset.Load("Char/" .. var_78_57), arg_75_1.stage_.transform)

				var_78_58.name = var_78_57
				var_78_58.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.actors_[var_78_57] = var_78_58

				local var_78_59 = var_78_58:GetComponentInChildren(typeof(CharacterEffect))

				var_78_59.enabled = true

				local var_78_60 = GameObjectTools.GetOrAddComponent(var_78_58, typeof(DynamicBoneHelper))

				if var_78_60 then
					var_78_60:EnableDynamicBone(false)
				end

				arg_75_1:ShowWeapon(var_78_59.transform, false)

				arg_75_1.var_[var_78_57 .. "Animator"] = var_78_59.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_75_1.var_[var_78_57 .. "Animator"].applyRootMotion = true
				arg_75_1.var_[var_78_57 .. "LipSync"] = var_78_59.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_78_61 = arg_75_1.actors_["1019ui_story"].transform
			local var_78_62 = 3.8

			if var_78_62 < arg_75_1.time_ and arg_75_1.time_ <= var_78_62 + arg_78_0 then
				arg_75_1.var_.moveOldPos1019ui_story = var_78_61.localPosition
			end

			local var_78_63 = 0.001

			if var_78_62 <= arg_75_1.time_ and arg_75_1.time_ < var_78_62 + var_78_63 then
				local var_78_64 = (arg_75_1.time_ - var_78_62) / var_78_63
				local var_78_65 = Vector3.New(0, -1.08, -5.9)

				var_78_61.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1019ui_story, var_78_65, var_78_64)

				local var_78_66 = manager.ui.mainCamera.transform.position - var_78_61.position

				var_78_61.forward = Vector3.New(var_78_66.x, var_78_66.y, var_78_66.z)

				local var_78_67 = var_78_61.localEulerAngles

				var_78_67.z = 0
				var_78_67.x = 0
				var_78_61.localEulerAngles = var_78_67
			end

			if arg_75_1.time_ >= var_78_62 + var_78_63 and arg_75_1.time_ < var_78_62 + var_78_63 + arg_78_0 then
				var_78_61.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_78_68 = manager.ui.mainCamera.transform.position - var_78_61.position

				var_78_61.forward = Vector3.New(var_78_68.x, var_78_68.y, var_78_68.z)

				local var_78_69 = var_78_61.localEulerAngles

				var_78_69.z = 0
				var_78_69.x = 0
				var_78_61.localEulerAngles = var_78_69
			end

			local var_78_70 = arg_75_1.actors_["1019ui_story"]
			local var_78_71 = 3.8

			if var_78_71 < arg_75_1.time_ and arg_75_1.time_ <= var_78_71 + arg_78_0 and arg_75_1.var_.characterEffect1019ui_story == nil then
				arg_75_1.var_.characterEffect1019ui_story = var_78_70:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_72 = 0.200000002980232

			if var_78_71 <= arg_75_1.time_ and arg_75_1.time_ < var_78_71 + var_78_72 then
				local var_78_73 = (arg_75_1.time_ - var_78_71) / var_78_72

				if arg_75_1.var_.characterEffect1019ui_story then
					arg_75_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_71 + var_78_72 and arg_75_1.time_ < var_78_71 + var_78_72 + arg_78_0 and arg_75_1.var_.characterEffect1019ui_story then
				arg_75_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_78_74 = 3.8

			if var_78_74 < arg_75_1.time_ and arg_75_1.time_ <= var_78_74 + arg_78_0 then
				arg_75_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_78_75 = 3.8

			if var_78_75 < arg_75_1.time_ and arg_75_1.time_ <= var_78_75 + arg_78_0 then
				arg_75_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			if arg_75_1.frameCnt_ <= 1 then
				arg_75_1.dialog_:SetActive(false)
			end

			local var_78_76 = 3.999999999998
			local var_78_77 = 0.4

			if var_78_76 < arg_75_1.time_ and arg_75_1.time_ <= var_78_76 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				arg_75_1.dialog_:SetActive(true)

				local var_78_78 = LeanTween.value(arg_75_1.dialog_, 0, 1, 0.3)

				var_78_78:setOnUpdate(LuaHelper.FloatAction(function(arg_79_0)
					arg_75_1.dialogCg_.alpha = arg_79_0
				end))
				var_78_78:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_75_1.dialog_)
					var_78_78:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_75_1.duration_ = arg_75_1.duration_ + 0.3

				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_79 = arg_75_1:FormatText(StoryNameCfg[13].name)

				arg_75_1.leftNameTxt_.text = var_78_79

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_80 = arg_75_1:GetWordFromCfg(121501019)
				local var_78_81 = arg_75_1:FormatText(var_78_80.content)

				arg_75_1.text_.text = var_78_81

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_82 = 16
				local var_78_83 = utf8.len(var_78_81)
				local var_78_84 = var_78_82 <= 0 and var_78_77 or var_78_77 * (var_78_83 / var_78_82)

				if var_78_84 > 0 and var_78_77 < var_78_84 then
					arg_75_1.talkMaxDuration = var_78_84
					var_78_76 = var_78_76 + 0.3

					if var_78_84 + var_78_76 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_84 + var_78_76
					end
				end

				arg_75_1.text_.text = var_78_81
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501019", "story_v_out_121501.awb") ~= 0 then
					local var_78_85 = manager.audio:GetVoiceLength("story_v_out_121501", "121501019", "story_v_out_121501.awb") / 1000

					if var_78_85 + var_78_76 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_85 + var_78_76
					end

					if var_78_80.prefab_name ~= "" and arg_75_1.actors_[var_78_80.prefab_name] ~= nil then
						local var_78_86 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_80.prefab_name].transform, "story_v_out_121501", "121501019", "story_v_out_121501.awb")

						arg_75_1:RecordAudio("121501019", var_78_86)
						arg_75_1:RecordAudio("121501019", var_78_86)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_121501", "121501019", "story_v_out_121501.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_121501", "121501019", "story_v_out_121501.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_87 = var_78_76 + 0.3
			local var_78_88 = math.max(var_78_77, arg_75_1.talkMaxDuration)

			if var_78_87 <= arg_75_1.time_ and arg_75_1.time_ < var_78_87 + var_78_88 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_87) / var_78_88

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_87 + var_78_88 and arg_75_1.time_ < var_78_87 + var_78_88 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play121501020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 121501020
		arg_81_1.duration_ = 11.033

		local var_81_0 = {
			ja = 11.033,
			ko = 9.9,
			zh = 9.9
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play121501021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_84_1 = 0
			local var_84_2 = 1.225

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_3 = arg_81_1:FormatText(StoryNameCfg[13].name)

				arg_81_1.leftNameTxt_.text = var_84_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_4 = arg_81_1:GetWordFromCfg(121501020)
				local var_84_5 = arg_81_1:FormatText(var_84_4.content)

				arg_81_1.text_.text = var_84_5

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_6 = 49
				local var_84_7 = utf8.len(var_84_5)
				local var_84_8 = var_84_6 <= 0 and var_84_2 or var_84_2 * (var_84_7 / var_84_6)

				if var_84_8 > 0 and var_84_2 < var_84_8 then
					arg_81_1.talkMaxDuration = var_84_8

					if var_84_8 + var_84_1 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_1
					end
				end

				arg_81_1.text_.text = var_84_5
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501020", "story_v_out_121501.awb") ~= 0 then
					local var_84_9 = manager.audio:GetVoiceLength("story_v_out_121501", "121501020", "story_v_out_121501.awb") / 1000

					if var_84_9 + var_84_1 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_9 + var_84_1
					end

					if var_84_4.prefab_name ~= "" and arg_81_1.actors_[var_84_4.prefab_name] ~= nil then
						local var_84_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_4.prefab_name].transform, "story_v_out_121501", "121501020", "story_v_out_121501.awb")

						arg_81_1:RecordAudio("121501020", var_84_10)
						arg_81_1:RecordAudio("121501020", var_84_10)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_121501", "121501020", "story_v_out_121501.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_121501", "121501020", "story_v_out_121501.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_11 = math.max(var_84_2, arg_81_1.talkMaxDuration)

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_11 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_1) / var_84_11

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_1 + var_84_11 and arg_81_1.time_ < var_84_1 + var_84_11 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play121501021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 121501021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play121501022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1019ui_story"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos1019ui_story = var_88_0.localPosition
			end

			local var_88_2 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2
				local var_88_4 = Vector3.New(0, 100, 0)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1019ui_story, var_88_4, var_88_3)

				local var_88_5 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_5.x, var_88_5.y, var_88_5.z)

				local var_88_6 = var_88_0.localEulerAngles

				var_88_6.z = 0
				var_88_6.x = 0
				var_88_0.localEulerAngles = var_88_6
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(0, 100, 0)

				local var_88_7 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_7.x, var_88_7.y, var_88_7.z)

				local var_88_8 = var_88_0.localEulerAngles

				var_88_8.z = 0
				var_88_8.x = 0
				var_88_0.localEulerAngles = var_88_8
			end

			local var_88_9 = arg_85_1.actors_["1019ui_story"]
			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 and arg_85_1.var_.characterEffect1019ui_story == nil then
				arg_85_1.var_.characterEffect1019ui_story = var_88_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_11 = 0.200000002980232

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_10) / var_88_11

				if arg_85_1.var_.characterEffect1019ui_story then
					local var_88_13 = Mathf.Lerp(0, 0.5, var_88_12)

					arg_85_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1019ui_story.fillRatio = var_88_13
				end
			end

			if arg_85_1.time_ >= var_88_10 + var_88_11 and arg_85_1.time_ < var_88_10 + var_88_11 + arg_88_0 and arg_85_1.var_.characterEffect1019ui_story then
				local var_88_14 = 0.5

				arg_85_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1019ui_story.fillRatio = var_88_14
			end

			local var_88_15 = 0
			local var_88_16 = 1.625

			if var_88_15 < arg_85_1.time_ and arg_85_1.time_ <= var_88_15 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_17 = arg_85_1:GetWordFromCfg(121501021)
				local var_88_18 = arg_85_1:FormatText(var_88_17.content)

				arg_85_1.text_.text = var_88_18

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_19 = 65
				local var_88_20 = utf8.len(var_88_18)
				local var_88_21 = var_88_19 <= 0 and var_88_16 or var_88_16 * (var_88_20 / var_88_19)

				if var_88_21 > 0 and var_88_16 < var_88_21 then
					arg_85_1.talkMaxDuration = var_88_21

					if var_88_21 + var_88_15 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_21 + var_88_15
					end
				end

				arg_85_1.text_.text = var_88_18
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_22 = math.max(var_88_16, arg_85_1.talkMaxDuration)

			if var_88_15 <= arg_85_1.time_ and arg_85_1.time_ < var_88_15 + var_88_22 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_15) / var_88_22

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_15 + var_88_22 and arg_85_1.time_ < var_88_15 + var_88_22 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play121501022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 121501022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play121501023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.925

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

				local var_92_2 = arg_89_1:GetWordFromCfg(121501022)
				local var_92_3 = arg_89_1:FormatText(var_92_2.content)

				arg_89_1.text_.text = var_92_3

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_4 = 37
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
	Play121501023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 121501023
		arg_93_1.duration_ = 2.1

		local var_93_0 = {
			ja = 2.1,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_93_0:Play121501024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1019ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1019ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1019ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["1019ui_story"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story == nil then
				arg_93_1.var_.characterEffect1019ui_story = var_96_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_11 = 0.200000002980232

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.characterEffect1019ui_story then
					arg_93_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story then
				arg_93_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_96_13 = 0

			if var_96_13 < arg_93_1.time_ and arg_93_1.time_ <= var_96_13 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_96_15 = arg_93_1.actors_["1029ui_story"].transform
			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 then
				arg_93_1.var_.moveOldPos1029ui_story = var_96_15.localPosition
			end

			local var_96_17 = 0.001

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_17 then
				local var_96_18 = (arg_93_1.time_ - var_96_16) / var_96_17
				local var_96_19 = Vector3.New(0.7, -1.09, -6.2)

				var_96_15.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1029ui_story, var_96_19, var_96_18)

				local var_96_20 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_20.x, var_96_20.y, var_96_20.z)

				local var_96_21 = var_96_15.localEulerAngles

				var_96_21.z = 0
				var_96_21.x = 0
				var_96_15.localEulerAngles = var_96_21
			end

			if arg_93_1.time_ >= var_96_16 + var_96_17 and arg_93_1.time_ < var_96_16 + var_96_17 + arg_96_0 then
				var_96_15.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_96_22 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_22.x, var_96_22.y, var_96_22.z)

				local var_96_23 = var_96_15.localEulerAngles

				var_96_23.z = 0
				var_96_23.x = 0
				var_96_15.localEulerAngles = var_96_23
			end

			local var_96_24 = arg_93_1.actors_["1029ui_story"]
			local var_96_25 = 0

			if var_96_25 < arg_93_1.time_ and arg_93_1.time_ <= var_96_25 + arg_96_0 and arg_93_1.var_.characterEffect1029ui_story == nil then
				arg_93_1.var_.characterEffect1029ui_story = var_96_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_26 = 0.200000002980232

			if var_96_25 <= arg_93_1.time_ and arg_93_1.time_ < var_96_25 + var_96_26 then
				local var_96_27 = (arg_93_1.time_ - var_96_25) / var_96_26

				if arg_93_1.var_.characterEffect1029ui_story then
					local var_96_28 = Mathf.Lerp(0, 0.5, var_96_27)

					arg_93_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1029ui_story.fillRatio = var_96_28
				end
			end

			if arg_93_1.time_ >= var_96_25 + var_96_26 and arg_93_1.time_ < var_96_25 + var_96_26 + arg_96_0 and arg_93_1.var_.characterEffect1029ui_story then
				local var_96_29 = 0.5

				arg_93_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1029ui_story.fillRatio = var_96_29
			end

			local var_96_30 = 0
			local var_96_31 = 0.15

			if var_96_30 < arg_93_1.time_ and arg_93_1.time_ <= var_96_30 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_32 = arg_93_1:FormatText(StoryNameCfg[13].name)

				arg_93_1.leftNameTxt_.text = var_96_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_33 = arg_93_1:GetWordFromCfg(121501023)
				local var_96_34 = arg_93_1:FormatText(var_96_33.content)

				arg_93_1.text_.text = var_96_34

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_35 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501023", "story_v_out_121501.awb") ~= 0 then
					local var_96_38 = manager.audio:GetVoiceLength("story_v_out_121501", "121501023", "story_v_out_121501.awb") / 1000

					if var_96_38 + var_96_30 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_38 + var_96_30
					end

					if var_96_33.prefab_name ~= "" and arg_93_1.actors_[var_96_33.prefab_name] ~= nil then
						local var_96_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_33.prefab_name].transform, "story_v_out_121501", "121501023", "story_v_out_121501.awb")

						arg_93_1:RecordAudio("121501023", var_96_39)
						arg_93_1:RecordAudio("121501023", var_96_39)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_121501", "121501023", "story_v_out_121501.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_121501", "121501023", "story_v_out_121501.awb")
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
	Play121501024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 121501024
		arg_97_1.duration_ = 11.366

		local var_97_0 = {
			ja = 6.2,
			ko = 11.366,
			zh = 11.366
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
				arg_97_0:Play121501025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1019ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story == nil then
				arg_97_1.var_.characterEffect1019ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1019ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1019ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1019ui_story.fillRatio = var_100_5
			end

			local var_100_6 = arg_97_1.actors_["1029ui_story"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 and arg_97_1.var_.characterEffect1029ui_story == nil then
				arg_97_1.var_.characterEffect1029ui_story = var_100_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_8 = 0.200000002980232

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8

				if arg_97_1.var_.characterEffect1029ui_story then
					arg_97_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 and arg_97_1.var_.characterEffect1029ui_story then
				arg_97_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_100_10 = 0
			local var_100_11 = 1.075

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_12 = arg_97_1:FormatText(StoryNameCfg[319].name)

				arg_97_1.leftNameTxt_.text = var_100_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_13 = arg_97_1:GetWordFromCfg(121501024)
				local var_100_14 = arg_97_1:FormatText(var_100_13.content)

				arg_97_1.text_.text = var_100_14

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_15 = 43
				local var_100_16 = utf8.len(var_100_14)
				local var_100_17 = var_100_15 <= 0 and var_100_11 or var_100_11 * (var_100_16 / var_100_15)

				if var_100_17 > 0 and var_100_11 < var_100_17 then
					arg_97_1.talkMaxDuration = var_100_17

					if var_100_17 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_17 + var_100_10
					end
				end

				arg_97_1.text_.text = var_100_14
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501024", "story_v_out_121501.awb") ~= 0 then
					local var_100_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501024", "story_v_out_121501.awb") / 1000

					if var_100_18 + var_100_10 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_10
					end

					if var_100_13.prefab_name ~= "" and arg_97_1.actors_[var_100_13.prefab_name] ~= nil then
						local var_100_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_13.prefab_name].transform, "story_v_out_121501", "121501024", "story_v_out_121501.awb")

						arg_97_1:RecordAudio("121501024", var_100_19)
						arg_97_1:RecordAudio("121501024", var_100_19)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_121501", "121501024", "story_v_out_121501.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_121501", "121501024", "story_v_out_121501.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_20 = math.max(var_100_11, arg_97_1.talkMaxDuration)

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_20 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_10) / var_100_20

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_10 + var_100_20 and arg_97_1.time_ < var_100_10 + var_100_20 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play121501025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 121501025
		arg_101_1.duration_ = 6.933

		local var_101_0 = {
			ja = 6.933,
			ko = 6.566,
			zh = 6.566
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
				arg_101_0:Play121501026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1019ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1019ui_story == nil then
				arg_101_1.var_.characterEffect1019ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1019ui_story then
					arg_101_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1019ui_story then
				arg_101_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_104_4 = arg_101_1.actors_["1029ui_story"]
			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 and arg_101_1.var_.characterEffect1029ui_story == nil then
				arg_101_1.var_.characterEffect1029ui_story = var_104_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_6 = 0.200000002980232

			if var_104_5 <= arg_101_1.time_ and arg_101_1.time_ < var_104_5 + var_104_6 then
				local var_104_7 = (arg_101_1.time_ - var_104_5) / var_104_6

				if arg_101_1.var_.characterEffect1029ui_story then
					local var_104_8 = Mathf.Lerp(0, 0.5, var_104_7)

					arg_101_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1029ui_story.fillRatio = var_104_8
				end
			end

			if arg_101_1.time_ >= var_104_5 + var_104_6 and arg_101_1.time_ < var_104_5 + var_104_6 + arg_104_0 and arg_101_1.var_.characterEffect1029ui_story then
				local var_104_9 = 0.5

				arg_101_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1029ui_story.fillRatio = var_104_9
			end

			local var_104_10 = 0
			local var_104_11 = 0.8

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_12 = arg_101_1:FormatText(StoryNameCfg[13].name)

				arg_101_1.leftNameTxt_.text = var_104_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_13 = arg_101_1:GetWordFromCfg(121501025)
				local var_104_14 = arg_101_1:FormatText(var_104_13.content)

				arg_101_1.text_.text = var_104_14

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_15 = 32
				local var_104_16 = utf8.len(var_104_14)
				local var_104_17 = var_104_15 <= 0 and var_104_11 or var_104_11 * (var_104_16 / var_104_15)

				if var_104_17 > 0 and var_104_11 < var_104_17 then
					arg_101_1.talkMaxDuration = var_104_17

					if var_104_17 + var_104_10 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_17 + var_104_10
					end
				end

				arg_101_1.text_.text = var_104_14
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501025", "story_v_out_121501.awb") ~= 0 then
					local var_104_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501025", "story_v_out_121501.awb") / 1000

					if var_104_18 + var_104_10 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_18 + var_104_10
					end

					if var_104_13.prefab_name ~= "" and arg_101_1.actors_[var_104_13.prefab_name] ~= nil then
						local var_104_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_13.prefab_name].transform, "story_v_out_121501", "121501025", "story_v_out_121501.awb")

						arg_101_1:RecordAudio("121501025", var_104_19)
						arg_101_1:RecordAudio("121501025", var_104_19)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_121501", "121501025", "story_v_out_121501.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_121501", "121501025", "story_v_out_121501.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_20 = math.max(var_104_11, arg_101_1.talkMaxDuration)

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_20 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_10) / var_104_20

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_10 + var_104_20 and arg_101_1.time_ < var_104_10 + var_104_20 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play121501026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 121501026
		arg_105_1.duration_ = 5.7

		local var_105_0 = {
			ja = 5.133,
			ko = 5.7,
			zh = 5.7
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
				arg_105_0:Play121501027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1019ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1019ui_story == nil then
				arg_105_1.var_.characterEffect1019ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1019ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1019ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1019ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1019ui_story.fillRatio = var_108_5
			end

			local var_108_6 = arg_105_1.actors_["1029ui_story"]
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 and arg_105_1.var_.characterEffect1029ui_story == nil then
				arg_105_1.var_.characterEffect1029ui_story = var_108_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_8 = 0.200000002980232

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_8 then
				local var_108_9 = (arg_105_1.time_ - var_108_7) / var_108_8

				if arg_105_1.var_.characterEffect1029ui_story then
					arg_105_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_7 + var_108_8 and arg_105_1.time_ < var_108_7 + var_108_8 + arg_108_0 and arg_105_1.var_.characterEffect1029ui_story then
				arg_105_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_108_10 = 0
			local var_108_11 = 0.575

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_12 = arg_105_1:FormatText(StoryNameCfg[319].name)

				arg_105_1.leftNameTxt_.text = var_108_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_13 = arg_105_1:GetWordFromCfg(121501026)
				local var_108_14 = arg_105_1:FormatText(var_108_13.content)

				arg_105_1.text_.text = var_108_14

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_15 = 23
				local var_108_16 = utf8.len(var_108_14)
				local var_108_17 = var_108_15 <= 0 and var_108_11 or var_108_11 * (var_108_16 / var_108_15)

				if var_108_17 > 0 and var_108_11 < var_108_17 then
					arg_105_1.talkMaxDuration = var_108_17

					if var_108_17 + var_108_10 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_17 + var_108_10
					end
				end

				arg_105_1.text_.text = var_108_14
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501026", "story_v_out_121501.awb") ~= 0 then
					local var_108_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501026", "story_v_out_121501.awb") / 1000

					if var_108_18 + var_108_10 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_18 + var_108_10
					end

					if var_108_13.prefab_name ~= "" and arg_105_1.actors_[var_108_13.prefab_name] ~= nil then
						local var_108_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_13.prefab_name].transform, "story_v_out_121501", "121501026", "story_v_out_121501.awb")

						arg_105_1:RecordAudio("121501026", var_108_19)
						arg_105_1:RecordAudio("121501026", var_108_19)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_121501", "121501026", "story_v_out_121501.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_121501", "121501026", "story_v_out_121501.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_20 = math.max(var_108_11, arg_105_1.talkMaxDuration)

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_20 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_10) / var_108_20

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_10 + var_108_20 and arg_105_1.time_ < var_108_10 + var_108_20 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play121501027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 121501027
		arg_109_1.duration_ = 4.666

		local var_109_0 = {
			ja = 4.666,
			ko = 2.233,
			zh = 2.233
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
				arg_109_0:Play121501028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1019ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1019ui_story == nil then
				arg_109_1.var_.characterEffect1019ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1019ui_story then
					arg_109_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1019ui_story then
				arg_109_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_112_4 = 0

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 then
				arg_109_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_112_6 = arg_109_1.actors_["1029ui_story"]
			local var_112_7 = 0

			if var_112_7 < arg_109_1.time_ and arg_109_1.time_ <= var_112_7 + arg_112_0 and arg_109_1.var_.characterEffect1029ui_story == nil then
				arg_109_1.var_.characterEffect1029ui_story = var_112_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_8 = 0.200000002980232

			if var_112_7 <= arg_109_1.time_ and arg_109_1.time_ < var_112_7 + var_112_8 then
				local var_112_9 = (arg_109_1.time_ - var_112_7) / var_112_8

				if arg_109_1.var_.characterEffect1029ui_story then
					local var_112_10 = Mathf.Lerp(0, 0.5, var_112_9)

					arg_109_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1029ui_story.fillRatio = var_112_10
				end
			end

			if arg_109_1.time_ >= var_112_7 + var_112_8 and arg_109_1.time_ < var_112_7 + var_112_8 + arg_112_0 and arg_109_1.var_.characterEffect1029ui_story then
				local var_112_11 = 0.5

				arg_109_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1029ui_story.fillRatio = var_112_11
			end

			local var_112_12 = 0
			local var_112_13 = 0.35

			if var_112_12 < arg_109_1.time_ and arg_109_1.time_ <= var_112_12 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_14 = arg_109_1:FormatText(StoryNameCfg[13].name)

				arg_109_1.leftNameTxt_.text = var_112_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_15 = arg_109_1:GetWordFromCfg(121501027)
				local var_112_16 = arg_109_1:FormatText(var_112_15.content)

				arg_109_1.text_.text = var_112_16

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_17 = 14
				local var_112_18 = utf8.len(var_112_16)
				local var_112_19 = var_112_17 <= 0 and var_112_13 or var_112_13 * (var_112_18 / var_112_17)

				if var_112_19 > 0 and var_112_13 < var_112_19 then
					arg_109_1.talkMaxDuration = var_112_19

					if var_112_19 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_12
					end
				end

				arg_109_1.text_.text = var_112_16
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501027", "story_v_out_121501.awb") ~= 0 then
					local var_112_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501027", "story_v_out_121501.awb") / 1000

					if var_112_20 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_20 + var_112_12
					end

					if var_112_15.prefab_name ~= "" and arg_109_1.actors_[var_112_15.prefab_name] ~= nil then
						local var_112_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_15.prefab_name].transform, "story_v_out_121501", "121501027", "story_v_out_121501.awb")

						arg_109_1:RecordAudio("121501027", var_112_21)
						arg_109_1:RecordAudio("121501027", var_112_21)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_121501", "121501027", "story_v_out_121501.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_121501", "121501027", "story_v_out_121501.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_22 = math.max(var_112_13, arg_109_1.talkMaxDuration)

			if var_112_12 <= arg_109_1.time_ and arg_109_1.time_ < var_112_12 + var_112_22 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_12) / var_112_22

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_12 + var_112_22 and arg_109_1.time_ < var_112_12 + var_112_22 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play121501028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 121501028
		arg_113_1.duration_ = 11.3

		local var_113_0 = {
			ja = 4.833,
			ko = 11.3,
			zh = 11.3
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
				arg_113_0:Play121501029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1029ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1029ui_story == nil then
				arg_113_1.var_.characterEffect1029ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1029ui_story then
					arg_113_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1029ui_story then
				arg_113_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_1")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_116_6 = arg_113_1.actors_["1019ui_story"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 and arg_113_1.var_.characterEffect1019ui_story == nil then
				arg_113_1.var_.characterEffect1019ui_story = var_116_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_8 = 0.200000002980232

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8

				if arg_113_1.var_.characterEffect1019ui_story then
					local var_116_10 = Mathf.Lerp(0, 0.5, var_116_9)

					arg_113_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1019ui_story.fillRatio = var_116_10
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 and arg_113_1.var_.characterEffect1019ui_story then
				local var_116_11 = 0.5

				arg_113_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1019ui_story.fillRatio = var_116_11
			end

			local var_116_12 = 0
			local var_116_13 = 0.975

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[319].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(121501028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 39
				local var_116_18 = utf8.len(var_116_16)
				local var_116_19 = var_116_17 <= 0 and var_116_13 or var_116_13 * (var_116_18 / var_116_17)

				if var_116_19 > 0 and var_116_13 < var_116_19 then
					arg_113_1.talkMaxDuration = var_116_19

					if var_116_19 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_16
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501028", "story_v_out_121501.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501028", "story_v_out_121501.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_121501", "121501028", "story_v_out_121501.awb")

						arg_113_1:RecordAudio("121501028", var_116_21)
						arg_113_1:RecordAudio("121501028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_121501", "121501028", "story_v_out_121501.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_121501", "121501028", "story_v_out_121501.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_22 and arg_113_1.time_ < var_116_12 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play121501029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 121501029
		arg_117_1.duration_ = 8.633

		local var_117_0 = {
			ja = 8.2,
			ko = 8.633,
			zh = 8.633
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play121501030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1019ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story == nil then
				arg_117_1.var_.characterEffect1019ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1019ui_story then
					arg_117_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story then
				arg_117_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_120_4 = 0

			if var_120_4 < arg_117_1.time_ and arg_117_1.time_ <= var_120_4 + arg_120_0 then
				arg_117_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action457")
			end

			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_120_6 = arg_117_1.actors_["1029ui_story"]
			local var_120_7 = 0

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 and arg_117_1.var_.characterEffect1029ui_story == nil then
				arg_117_1.var_.characterEffect1029ui_story = var_120_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_8 = 0.200000002980232

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_8 then
				local var_120_9 = (arg_117_1.time_ - var_120_7) / var_120_8

				if arg_117_1.var_.characterEffect1029ui_story then
					local var_120_10 = Mathf.Lerp(0, 0.5, var_120_9)

					arg_117_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1029ui_story.fillRatio = var_120_10
				end
			end

			if arg_117_1.time_ >= var_120_7 + var_120_8 and arg_117_1.time_ < var_120_7 + var_120_8 + arg_120_0 and arg_117_1.var_.characterEffect1029ui_story then
				local var_120_11 = 0.5

				arg_117_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1029ui_story.fillRatio = var_120_11
			end

			local var_120_12 = 0
			local var_120_13 = 0.8

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_14 = arg_117_1:FormatText(StoryNameCfg[13].name)

				arg_117_1.leftNameTxt_.text = var_120_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_15 = arg_117_1:GetWordFromCfg(121501029)
				local var_120_16 = arg_117_1:FormatText(var_120_15.content)

				arg_117_1.text_.text = var_120_16

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_17 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501029", "story_v_out_121501.awb") ~= 0 then
					local var_120_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501029", "story_v_out_121501.awb") / 1000

					if var_120_20 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_12
					end

					if var_120_15.prefab_name ~= "" and arg_117_1.actors_[var_120_15.prefab_name] ~= nil then
						local var_120_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_15.prefab_name].transform, "story_v_out_121501", "121501029", "story_v_out_121501.awb")

						arg_117_1:RecordAudio("121501029", var_120_21)
						arg_117_1:RecordAudio("121501029", var_120_21)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_121501", "121501029", "story_v_out_121501.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_121501", "121501029", "story_v_out_121501.awb")
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
	Play121501030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 121501030
		arg_121_1.duration_ = 7.666

		local var_121_0 = {
			ja = 7.666,
			ko = 5.733,
			zh = 5.733
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
				arg_121_0:Play121501031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action475")
			end

			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_2 = 0
			local var_124_3 = 0.8

			if var_124_2 < arg_121_1.time_ and arg_121_1.time_ <= var_124_2 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_4 = arg_121_1:FormatText(StoryNameCfg[13].name)

				arg_121_1.leftNameTxt_.text = var_124_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_5 = arg_121_1:GetWordFromCfg(121501030)
				local var_124_6 = arg_121_1:FormatText(var_124_5.content)

				arg_121_1.text_.text = var_124_6

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_7 = 32
				local var_124_8 = utf8.len(var_124_6)
				local var_124_9 = var_124_7 <= 0 and var_124_3 or var_124_3 * (var_124_8 / var_124_7)

				if var_124_9 > 0 and var_124_3 < var_124_9 then
					arg_121_1.talkMaxDuration = var_124_9

					if var_124_9 + var_124_2 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_9 + var_124_2
					end
				end

				arg_121_1.text_.text = var_124_6
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501030", "story_v_out_121501.awb") ~= 0 then
					local var_124_10 = manager.audio:GetVoiceLength("story_v_out_121501", "121501030", "story_v_out_121501.awb") / 1000

					if var_124_10 + var_124_2 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_10 + var_124_2
					end

					if var_124_5.prefab_name ~= "" and arg_121_1.actors_[var_124_5.prefab_name] ~= nil then
						local var_124_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_5.prefab_name].transform, "story_v_out_121501", "121501030", "story_v_out_121501.awb")

						arg_121_1:RecordAudio("121501030", var_124_11)
						arg_121_1:RecordAudio("121501030", var_124_11)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_121501", "121501030", "story_v_out_121501.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_121501", "121501030", "story_v_out_121501.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_12 = math.max(var_124_3, arg_121_1.talkMaxDuration)

			if var_124_2 <= arg_121_1.time_ and arg_121_1.time_ < var_124_2 + var_124_12 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_2) / var_124_12

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_2 + var_124_12 and arg_121_1.time_ < var_124_2 + var_124_12 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play121501031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 121501031
		arg_125_1.duration_ = 2.833

		local var_125_0 = {
			ja = 1.466,
			ko = 2.833,
			zh = 2.833
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
				arg_125_0:Play121501032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1019ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1019ui_story == nil then
				arg_125_1.var_.characterEffect1019ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1019ui_story then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1019ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1019ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1019ui_story.fillRatio = var_128_5
			end

			local var_128_6 = arg_125_1.actors_["1029ui_story"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect1029ui_story == nil then
				arg_125_1.var_.characterEffect1029ui_story = var_128_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_8 = 0.200000002980232

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.characterEffect1029ui_story then
					arg_125_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.characterEffect1029ui_story then
				arg_125_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_128_10 = 0
			local var_128_11 = 0.175

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_12 = arg_125_1:FormatText(StoryNameCfg[319].name)

				arg_125_1.leftNameTxt_.text = var_128_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_13 = arg_125_1:GetWordFromCfg(121501031)
				local var_128_14 = arg_125_1:FormatText(var_128_13.content)

				arg_125_1.text_.text = var_128_14

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_15 = 7
				local var_128_16 = utf8.len(var_128_14)
				local var_128_17 = var_128_15 <= 0 and var_128_11 or var_128_11 * (var_128_16 / var_128_15)

				if var_128_17 > 0 and var_128_11 < var_128_17 then
					arg_125_1.talkMaxDuration = var_128_17

					if var_128_17 + var_128_10 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_17 + var_128_10
					end
				end

				arg_125_1.text_.text = var_128_14
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501031", "story_v_out_121501.awb") ~= 0 then
					local var_128_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501031", "story_v_out_121501.awb") / 1000

					if var_128_18 + var_128_10 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_18 + var_128_10
					end

					if var_128_13.prefab_name ~= "" and arg_125_1.actors_[var_128_13.prefab_name] ~= nil then
						local var_128_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_13.prefab_name].transform, "story_v_out_121501", "121501031", "story_v_out_121501.awb")

						arg_125_1:RecordAudio("121501031", var_128_19)
						arg_125_1:RecordAudio("121501031", var_128_19)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_121501", "121501031", "story_v_out_121501.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_121501", "121501031", "story_v_out_121501.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_20 = math.max(var_128_11, arg_125_1.talkMaxDuration)

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_20 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_10) / var_128_20

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_10 + var_128_20 and arg_125_1.time_ < var_128_10 + var_128_20 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play121501032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 121501032
		arg_129_1.duration_ = 14.933

		local var_129_0 = {
			ja = 14.933,
			ko = 11.6,
			zh = 11.6
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
				arg_129_0:Play121501033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1019ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1019ui_story == nil then
				arg_129_1.var_.characterEffect1019ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1019ui_story then
					arg_129_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1019ui_story then
				arg_129_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_132_4 = arg_129_1.actors_["1029ui_story"]
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 and arg_129_1.var_.characterEffect1029ui_story == nil then
				arg_129_1.var_.characterEffect1029ui_story = var_132_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_6 = 0.200000002980232

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6

				if arg_129_1.var_.characterEffect1029ui_story then
					local var_132_8 = Mathf.Lerp(0, 0.5, var_132_7)

					arg_129_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1029ui_story.fillRatio = var_132_8
				end
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 and arg_129_1.var_.characterEffect1029ui_story then
				local var_132_9 = 0.5

				arg_129_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1029ui_story.fillRatio = var_132_9
			end

			local var_132_10 = 0
			local var_132_11 = 1.25

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_12 = arg_129_1:FormatText(StoryNameCfg[13].name)

				arg_129_1.leftNameTxt_.text = var_132_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_13 = arg_129_1:GetWordFromCfg(121501032)
				local var_132_14 = arg_129_1:FormatText(var_132_13.content)

				arg_129_1.text_.text = var_132_14

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_15 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501032", "story_v_out_121501.awb") ~= 0 then
					local var_132_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501032", "story_v_out_121501.awb") / 1000

					if var_132_18 + var_132_10 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_18 + var_132_10
					end

					if var_132_13.prefab_name ~= "" and arg_129_1.actors_[var_132_13.prefab_name] ~= nil then
						local var_132_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_13.prefab_name].transform, "story_v_out_121501", "121501032", "story_v_out_121501.awb")

						arg_129_1:RecordAudio("121501032", var_132_19)
						arg_129_1:RecordAudio("121501032", var_132_19)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_121501", "121501032", "story_v_out_121501.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_121501", "121501032", "story_v_out_121501.awb")
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
	Play121501033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 121501033
		arg_133_1.duration_ = 10.3

		local var_133_0 = {
			ja = 10.3,
			ko = 9.966,
			zh = 9.966
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
				arg_133_0:Play121501034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1.2

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[13].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(121501033)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 48
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501033", "story_v_out_121501.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501033", "story_v_out_121501.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_121501", "121501033", "story_v_out_121501.awb")

						arg_133_1:RecordAudio("121501033", var_136_9)
						arg_133_1:RecordAudio("121501033", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_121501", "121501033", "story_v_out_121501.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_121501", "121501033", "story_v_out_121501.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play121501034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 121501034
		arg_137_1.duration_ = 7.566

		local var_137_0 = {
			ja = 7.566,
			ko = 6.7,
			zh = 6.7
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
				arg_137_0:Play121501035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_2")
			end

			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_2 = arg_137_1.actors_["1019ui_story"]
			local var_140_3 = 0

			if var_140_3 < arg_137_1.time_ and arg_137_1.time_ <= var_140_3 + arg_140_0 and arg_137_1.var_.characterEffect1019ui_story == nil then
				arg_137_1.var_.characterEffect1019ui_story = var_140_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_4 = 0.200000002980232

			if var_140_3 <= arg_137_1.time_ and arg_137_1.time_ < var_140_3 + var_140_4 then
				local var_140_5 = (arg_137_1.time_ - var_140_3) / var_140_4

				if arg_137_1.var_.characterEffect1019ui_story then
					local var_140_6 = Mathf.Lerp(0, 0.5, var_140_5)

					arg_137_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1019ui_story.fillRatio = var_140_6
				end
			end

			if arg_137_1.time_ >= var_140_3 + var_140_4 and arg_137_1.time_ < var_140_3 + var_140_4 + arg_140_0 and arg_137_1.var_.characterEffect1019ui_story then
				local var_140_7 = 0.5

				arg_137_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1019ui_story.fillRatio = var_140_7
			end

			local var_140_8 = arg_137_1.actors_["1029ui_story"]
			local var_140_9 = 0

			if var_140_9 < arg_137_1.time_ and arg_137_1.time_ <= var_140_9 + arg_140_0 and arg_137_1.var_.characterEffect1029ui_story == nil then
				arg_137_1.var_.characterEffect1029ui_story = var_140_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_10 = 0.200000002980232

			if var_140_9 <= arg_137_1.time_ and arg_137_1.time_ < var_140_9 + var_140_10 then
				local var_140_11 = (arg_137_1.time_ - var_140_9) / var_140_10

				if arg_137_1.var_.characterEffect1029ui_story then
					arg_137_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_9 + var_140_10 and arg_137_1.time_ < var_140_9 + var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect1029ui_story then
				arg_137_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_140_12 = 0
			local var_140_13 = 0.6

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[319].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(121501034)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 24
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501034", "story_v_out_121501.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501034", "story_v_out_121501.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_121501", "121501034", "story_v_out_121501.awb")

						arg_137_1:RecordAudio("121501034", var_140_21)
						arg_137_1:RecordAudio("121501034", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_121501", "121501034", "story_v_out_121501.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_121501", "121501034", "story_v_out_121501.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_22 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_22 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_22

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_22 and arg_137_1.time_ < var_140_12 + var_140_22 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play121501035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 121501035
		arg_141_1.duration_ = 11.1

		local var_141_0 = {
			ja = 11.1,
			ko = 9.5,
			zh = 9.5
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
				arg_141_0:Play121501036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1019ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1019ui_story == nil then
				arg_141_1.var_.characterEffect1019ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1019ui_story then
					arg_141_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1019ui_story then
				arg_141_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_144_5 = arg_141_1.actors_["1029ui_story"]
			local var_144_6 = 0

			if var_144_6 < arg_141_1.time_ and arg_141_1.time_ <= var_144_6 + arg_144_0 and arg_141_1.var_.characterEffect1029ui_story == nil then
				arg_141_1.var_.characterEffect1029ui_story = var_144_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_7 = 0.200000002980232

			if var_144_6 <= arg_141_1.time_ and arg_141_1.time_ < var_144_6 + var_144_7 then
				local var_144_8 = (arg_141_1.time_ - var_144_6) / var_144_7

				if arg_141_1.var_.characterEffect1029ui_story then
					local var_144_9 = Mathf.Lerp(0, 0.5, var_144_8)

					arg_141_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1029ui_story.fillRatio = var_144_9
				end
			end

			if arg_141_1.time_ >= var_144_6 + var_144_7 and arg_141_1.time_ < var_144_6 + var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect1029ui_story then
				local var_144_10 = 0.5

				arg_141_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1029ui_story.fillRatio = var_144_10
			end

			local var_144_11 = 0
			local var_144_12 = 0.85

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_13 = arg_141_1:FormatText(StoryNameCfg[13].name)

				arg_141_1.leftNameTxt_.text = var_144_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_14 = arg_141_1:GetWordFromCfg(121501035)
				local var_144_15 = arg_141_1:FormatText(var_144_14.content)

				arg_141_1.text_.text = var_144_15

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_16 = 34
				local var_144_17 = utf8.len(var_144_15)
				local var_144_18 = var_144_16 <= 0 and var_144_12 or var_144_12 * (var_144_17 / var_144_16)

				if var_144_18 > 0 and var_144_12 < var_144_18 then
					arg_141_1.talkMaxDuration = var_144_18

					if var_144_18 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_18 + var_144_11
					end
				end

				arg_141_1.text_.text = var_144_15
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501035", "story_v_out_121501.awb") ~= 0 then
					local var_144_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501035", "story_v_out_121501.awb") / 1000

					if var_144_19 + var_144_11 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_11
					end

					if var_144_14.prefab_name ~= "" and arg_141_1.actors_[var_144_14.prefab_name] ~= nil then
						local var_144_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_14.prefab_name].transform, "story_v_out_121501", "121501035", "story_v_out_121501.awb")

						arg_141_1:RecordAudio("121501035", var_144_20)
						arg_141_1:RecordAudio("121501035", var_144_20)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_121501", "121501035", "story_v_out_121501.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_121501", "121501035", "story_v_out_121501.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_21 = math.max(var_144_12, arg_141_1.talkMaxDuration)

			if var_144_11 <= arg_141_1.time_ and arg_141_1.time_ < var_144_11 + var_144_21 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_11) / var_144_21

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_11 + var_144_21 and arg_141_1.time_ < var_144_11 + var_144_21 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play121501036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 121501036
		arg_145_1.duration_ = 5.966

		local var_145_0 = {
			ja = 5.966,
			ko = 3.033,
			zh = 3.033
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
				arg_145_0:Play121501037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1029ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1029ui_story == nil then
				arg_145_1.var_.characterEffect1029ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1029ui_story then
					arg_145_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1029ui_story then
				arg_145_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_148_4 = 0

			if var_148_4 < arg_145_1.time_ and arg_145_1.time_ <= var_148_4 + arg_148_0 then
				arg_145_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 then
				arg_145_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_148_6 = arg_145_1.actors_["1019ui_story"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect1019ui_story == nil then
				arg_145_1.var_.characterEffect1019ui_story = var_148_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_8 = 0.200000002980232

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.characterEffect1019ui_story then
					local var_148_10 = Mathf.Lerp(0, 0.5, var_148_9)

					arg_145_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1019ui_story.fillRatio = var_148_10
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.characterEffect1019ui_story then
				local var_148_11 = 0.5

				arg_145_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1019ui_story.fillRatio = var_148_11
			end

			local var_148_12 = 0
			local var_148_13 = 0.425

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[319].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(121501036)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 17
				local var_148_18 = utf8.len(var_148_16)
				local var_148_19 = var_148_17 <= 0 and var_148_13 or var_148_13 * (var_148_18 / var_148_17)

				if var_148_19 > 0 and var_148_13 < var_148_19 then
					arg_145_1.talkMaxDuration = var_148_19

					if var_148_19 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_12
					end
				end

				arg_145_1.text_.text = var_148_16
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501036", "story_v_out_121501.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501036", "story_v_out_121501.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_out_121501", "121501036", "story_v_out_121501.awb")

						arg_145_1:RecordAudio("121501036", var_148_21)
						arg_145_1:RecordAudio("121501036", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_121501", "121501036", "story_v_out_121501.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_121501", "121501036", "story_v_out_121501.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_22 = math.max(var_148_13, arg_145_1.talkMaxDuration)

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_22 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_12) / var_148_22

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_12 + var_148_22 and arg_145_1.time_ < var_148_12 + var_148_22 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play121501037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 121501037
		arg_149_1.duration_ = 5.666

		local var_149_0 = {
			ja = 3.566,
			ko = 5.666,
			zh = 5.666
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
				arg_149_0:Play121501038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1019ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1019ui_story == nil then
				arg_149_1.var_.characterEffect1019ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1019ui_story then
					arg_149_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1019ui_story then
				arg_149_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_152_4 = 0

			if var_152_4 < arg_149_1.time_ and arg_149_1.time_ <= var_152_4 + arg_152_0 then
				arg_149_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 then
				arg_149_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_6 = arg_149_1.actors_["1029ui_story"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect1029ui_story == nil then
				arg_149_1.var_.characterEffect1029ui_story = var_152_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_8 = 0.200000002980232

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8

				if arg_149_1.var_.characterEffect1029ui_story then
					local var_152_10 = Mathf.Lerp(0, 0.5, var_152_9)

					arg_149_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1029ui_story.fillRatio = var_152_10
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 and arg_149_1.var_.characterEffect1029ui_story then
				local var_152_11 = 0.5

				arg_149_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1029ui_story.fillRatio = var_152_11
			end

			local var_152_12 = 0
			local var_152_13 = 0.75

			if var_152_12 < arg_149_1.time_ and arg_149_1.time_ <= var_152_12 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_14 = arg_149_1:FormatText(StoryNameCfg[13].name)

				arg_149_1.leftNameTxt_.text = var_152_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_15 = arg_149_1:GetWordFromCfg(121501037)
				local var_152_16 = arg_149_1:FormatText(var_152_15.content)

				arg_149_1.text_.text = var_152_16

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_17 = 30
				local var_152_18 = utf8.len(var_152_16)
				local var_152_19 = var_152_17 <= 0 and var_152_13 or var_152_13 * (var_152_18 / var_152_17)

				if var_152_19 > 0 and var_152_13 < var_152_19 then
					arg_149_1.talkMaxDuration = var_152_19

					if var_152_19 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_12
					end
				end

				arg_149_1.text_.text = var_152_16
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501037", "story_v_out_121501.awb") ~= 0 then
					local var_152_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501037", "story_v_out_121501.awb") / 1000

					if var_152_20 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_20 + var_152_12
					end

					if var_152_15.prefab_name ~= "" and arg_149_1.actors_[var_152_15.prefab_name] ~= nil then
						local var_152_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_15.prefab_name].transform, "story_v_out_121501", "121501037", "story_v_out_121501.awb")

						arg_149_1:RecordAudio("121501037", var_152_21)
						arg_149_1:RecordAudio("121501037", var_152_21)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_121501", "121501037", "story_v_out_121501.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_121501", "121501037", "story_v_out_121501.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_22 = math.max(var_152_13, arg_149_1.talkMaxDuration)

			if var_152_12 <= arg_149_1.time_ and arg_149_1.time_ < var_152_12 + var_152_22 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_12) / var_152_22

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_12 + var_152_22 and arg_149_1.time_ < var_152_12 + var_152_22 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play121501038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 121501038
		arg_153_1.duration_ = 4.1

		local var_153_0 = {
			ja = 4.1,
			ko = 3.333,
			zh = 3.333
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play121501039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1029ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1029ui_story == nil then
				arg_153_1.var_.characterEffect1029ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1029ui_story then
					arg_153_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1029ui_story then
				arg_153_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_156_4 = 0

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 then
				arg_153_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_156_6 = arg_153_1.actors_["1019ui_story"]
			local var_156_7 = 0

			if var_156_7 < arg_153_1.time_ and arg_153_1.time_ <= var_156_7 + arg_156_0 and arg_153_1.var_.characterEffect1019ui_story == nil then
				arg_153_1.var_.characterEffect1019ui_story = var_156_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_8 = 0.200000002980232

			if var_156_7 <= arg_153_1.time_ and arg_153_1.time_ < var_156_7 + var_156_8 then
				local var_156_9 = (arg_153_1.time_ - var_156_7) / var_156_8

				if arg_153_1.var_.characterEffect1019ui_story then
					local var_156_10 = Mathf.Lerp(0, 0.5, var_156_9)

					arg_153_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1019ui_story.fillRatio = var_156_10
				end
			end

			if arg_153_1.time_ >= var_156_7 + var_156_8 and arg_153_1.time_ < var_156_7 + var_156_8 + arg_156_0 and arg_153_1.var_.characterEffect1019ui_story then
				local var_156_11 = 0.5

				arg_153_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1019ui_story.fillRatio = var_156_11
			end

			local var_156_12 = 0
			local var_156_13 = 0.25

			if var_156_12 < arg_153_1.time_ and arg_153_1.time_ <= var_156_12 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_14 = arg_153_1:FormatText(StoryNameCfg[319].name)

				arg_153_1.leftNameTxt_.text = var_156_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_15 = arg_153_1:GetWordFromCfg(121501038)
				local var_156_16 = arg_153_1:FormatText(var_156_15.content)

				arg_153_1.text_.text = var_156_16

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_17 = 10
				local var_156_18 = utf8.len(var_156_16)
				local var_156_19 = var_156_17 <= 0 and var_156_13 or var_156_13 * (var_156_18 / var_156_17)

				if var_156_19 > 0 and var_156_13 < var_156_19 then
					arg_153_1.talkMaxDuration = var_156_19

					if var_156_19 + var_156_12 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_12
					end
				end

				arg_153_1.text_.text = var_156_16
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501038", "story_v_out_121501.awb") ~= 0 then
					local var_156_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501038", "story_v_out_121501.awb") / 1000

					if var_156_20 + var_156_12 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_12
					end

					if var_156_15.prefab_name ~= "" and arg_153_1.actors_[var_156_15.prefab_name] ~= nil then
						local var_156_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_15.prefab_name].transform, "story_v_out_121501", "121501038", "story_v_out_121501.awb")

						arg_153_1:RecordAudio("121501038", var_156_21)
						arg_153_1:RecordAudio("121501038", var_156_21)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_121501", "121501038", "story_v_out_121501.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_121501", "121501038", "story_v_out_121501.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_22 = math.max(var_156_13, arg_153_1.talkMaxDuration)

			if var_156_12 <= arg_153_1.time_ and arg_153_1.time_ < var_156_12 + var_156_22 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_12) / var_156_22

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_12 + var_156_22 and arg_153_1.time_ < var_156_12 + var_156_22 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play121501039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 121501039
		arg_157_1.duration_ = 12.633

		local var_157_0 = {
			ja = 12.633,
			ko = 3.833,
			zh = 3.833
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
				arg_157_0:Play121501040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1019ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1019ui_story == nil then
				arg_157_1.var_.characterEffect1019ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1019ui_story then
					arg_157_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1019ui_story then
				arg_157_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_160_4 = 0

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_2")
			end

			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 then
				arg_157_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_160_6 = arg_157_1.actors_["1029ui_story"]
			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 and arg_157_1.var_.characterEffect1029ui_story == nil then
				arg_157_1.var_.characterEffect1029ui_story = var_160_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_8 = 0.200000002980232

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_8 then
				local var_160_9 = (arg_157_1.time_ - var_160_7) / var_160_8

				if arg_157_1.var_.characterEffect1029ui_story then
					local var_160_10 = Mathf.Lerp(0, 0.5, var_160_9)

					arg_157_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1029ui_story.fillRatio = var_160_10
				end
			end

			if arg_157_1.time_ >= var_160_7 + var_160_8 and arg_157_1.time_ < var_160_7 + var_160_8 + arg_160_0 and arg_157_1.var_.characterEffect1029ui_story then
				local var_160_11 = 0.5

				arg_157_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1029ui_story.fillRatio = var_160_11
			end

			local var_160_12 = 0
			local var_160_13 = 0.5

			if var_160_12 < arg_157_1.time_ and arg_157_1.time_ <= var_160_12 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_14 = arg_157_1:FormatText(StoryNameCfg[13].name)

				arg_157_1.leftNameTxt_.text = var_160_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_15 = arg_157_1:GetWordFromCfg(121501039)
				local var_160_16 = arg_157_1:FormatText(var_160_15.content)

				arg_157_1.text_.text = var_160_16

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_17 = 20
				local var_160_18 = utf8.len(var_160_16)
				local var_160_19 = var_160_17 <= 0 and var_160_13 or var_160_13 * (var_160_18 / var_160_17)

				if var_160_19 > 0 and var_160_13 < var_160_19 then
					arg_157_1.talkMaxDuration = var_160_19

					if var_160_19 + var_160_12 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_19 + var_160_12
					end
				end

				arg_157_1.text_.text = var_160_16
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501039", "story_v_out_121501.awb") ~= 0 then
					local var_160_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501039", "story_v_out_121501.awb") / 1000

					if var_160_20 + var_160_12 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_20 + var_160_12
					end

					if var_160_15.prefab_name ~= "" and arg_157_1.actors_[var_160_15.prefab_name] ~= nil then
						local var_160_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_15.prefab_name].transform, "story_v_out_121501", "121501039", "story_v_out_121501.awb")

						arg_157_1:RecordAudio("121501039", var_160_21)
						arg_157_1:RecordAudio("121501039", var_160_21)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_121501", "121501039", "story_v_out_121501.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_121501", "121501039", "story_v_out_121501.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_22 = math.max(var_160_13, arg_157_1.talkMaxDuration)

			if var_160_12 <= arg_157_1.time_ and arg_157_1.time_ < var_160_12 + var_160_22 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_12) / var_160_22

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_12 + var_160_22 and arg_157_1.time_ < var_160_12 + var_160_22 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play121501040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 121501040
		arg_161_1.duration_ = 6.833

		local var_161_0 = {
			ja = 6.1,
			ko = 6.833,
			zh = 6.833
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
				arg_161_0:Play121501041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1019ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1019ui_story == nil then
				arg_161_1.var_.characterEffect1019ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1019ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1019ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1019ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1019ui_story.fillRatio = var_164_5
			end

			local var_164_6 = arg_161_1.actors_["1029ui_story"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 and arg_161_1.var_.characterEffect1029ui_story == nil then
				arg_161_1.var_.characterEffect1029ui_story = var_164_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_8 = 0.200000002980232

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_8 then
				local var_164_9 = (arg_161_1.time_ - var_164_7) / var_164_8

				if arg_161_1.var_.characterEffect1029ui_story then
					arg_161_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_8 and arg_161_1.time_ < var_164_7 + var_164_8 + arg_164_0 and arg_161_1.var_.characterEffect1029ui_story then
				arg_161_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_164_10 = 0
			local var_164_11 = 0.825

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_12 = arg_161_1:FormatText(StoryNameCfg[319].name)

				arg_161_1.leftNameTxt_.text = var_164_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_13 = arg_161_1:GetWordFromCfg(121501040)
				local var_164_14 = arg_161_1:FormatText(var_164_13.content)

				arg_161_1.text_.text = var_164_14

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_15 = 33
				local var_164_16 = utf8.len(var_164_14)
				local var_164_17 = var_164_15 <= 0 and var_164_11 or var_164_11 * (var_164_16 / var_164_15)

				if var_164_17 > 0 and var_164_11 < var_164_17 then
					arg_161_1.talkMaxDuration = var_164_17

					if var_164_17 + var_164_10 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_17 + var_164_10
					end
				end

				arg_161_1.text_.text = var_164_14
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501040", "story_v_out_121501.awb") ~= 0 then
					local var_164_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501040", "story_v_out_121501.awb") / 1000

					if var_164_18 + var_164_10 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_18 + var_164_10
					end

					if var_164_13.prefab_name ~= "" and arg_161_1.actors_[var_164_13.prefab_name] ~= nil then
						local var_164_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_13.prefab_name].transform, "story_v_out_121501", "121501040", "story_v_out_121501.awb")

						arg_161_1:RecordAudio("121501040", var_164_19)
						arg_161_1:RecordAudio("121501040", var_164_19)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_121501", "121501040", "story_v_out_121501.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_121501", "121501040", "story_v_out_121501.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_20 = math.max(var_164_11, arg_161_1.talkMaxDuration)

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_20 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_10) / var_164_20

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_10 + var_164_20 and arg_161_1.time_ < var_164_10 + var_164_20 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play121501041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 121501041
		arg_165_1.duration_ = 6.1

		local var_165_0 = {
			ja = 6.1,
			ko = 6.099999999999,
			zh = 6.099999999999
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
				arg_165_0:Play121501042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = "I05a"

			if arg_165_1.bgs_[var_168_0] == nil then
				local var_168_1 = Object.Instantiate(arg_165_1.paintGo_)

				var_168_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_168_0)
				var_168_1.name = var_168_0
				var_168_1.transform.parent = arg_165_1.stage_.transform
				var_168_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_165_1.bgs_[var_168_0] = var_168_1
			end

			local var_168_2 = 2

			if var_168_2 < arg_165_1.time_ and arg_165_1.time_ <= var_168_2 + arg_168_0 then
				local var_168_3 = manager.ui.mainCamera.transform.localPosition
				local var_168_4 = Vector3.New(0, 0, 10) + Vector3.New(var_168_3.x, var_168_3.y, 0)
				local var_168_5 = arg_165_1.bgs_.I05a

				var_168_5.transform.localPosition = var_168_4
				var_168_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_168_6 = var_168_5:GetComponent("SpriteRenderer")

				if var_168_6 and var_168_6.sprite then
					local var_168_7 = (var_168_5.transform.localPosition - var_168_3).z
					local var_168_8 = manager.ui.mainCameraCom_
					local var_168_9 = 2 * var_168_7 * Mathf.Tan(var_168_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_168_10 = var_168_9 * var_168_8.aspect
					local var_168_11 = var_168_6.sprite.bounds.size.x
					local var_168_12 = var_168_6.sprite.bounds.size.y
					local var_168_13 = var_168_10 / var_168_11
					local var_168_14 = var_168_9 / var_168_12
					local var_168_15 = var_168_14 < var_168_13 and var_168_13 or var_168_14

					var_168_5.transform.localScale = Vector3.New(var_168_15, var_168_15, 0)
				end

				for iter_168_0, iter_168_1 in pairs(arg_165_1.bgs_) do
					if iter_168_0 ~= "I05a" then
						iter_168_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_168_16 = 2

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_17 = 2

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17
				local var_168_19 = Color.New(0, 0, 0)

				var_168_19.a = Mathf.Lerp(1, 0, var_168_18)
				arg_165_1.mask_.color = var_168_19
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 then
				local var_168_20 = Color.New(0, 0, 0)
				local var_168_21 = 0

				arg_165_1.mask_.enabled = false
				var_168_20.a = var_168_21
				arg_165_1.mask_.color = var_168_20
			end

			local var_168_22 = 0

			if var_168_22 < arg_165_1.time_ and arg_165_1.time_ <= var_168_22 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_23 = 2

			if var_168_22 <= arg_165_1.time_ and arg_165_1.time_ < var_168_22 + var_168_23 then
				local var_168_24 = (arg_165_1.time_ - var_168_22) / var_168_23
				local var_168_25 = Color.New(0, 0, 0)

				var_168_25.a = Mathf.Lerp(0, 1, var_168_24)
				arg_165_1.mask_.color = var_168_25
			end

			if arg_165_1.time_ >= var_168_22 + var_168_23 and arg_165_1.time_ < var_168_22 + var_168_23 + arg_168_0 then
				local var_168_26 = Color.New(0, 0, 0)

				var_168_26.a = 1
				arg_165_1.mask_.color = var_168_26
			end

			local var_168_27 = arg_165_1.actors_["1019ui_story"].transform
			local var_168_28 = 1.96599999815226

			if var_168_28 < arg_165_1.time_ and arg_165_1.time_ <= var_168_28 + arg_168_0 then
				arg_165_1.var_.moveOldPos1019ui_story = var_168_27.localPosition
			end

			local var_168_29 = 0.001

			if var_168_28 <= arg_165_1.time_ and arg_165_1.time_ < var_168_28 + var_168_29 then
				local var_168_30 = (arg_165_1.time_ - var_168_28) / var_168_29
				local var_168_31 = Vector3.New(0, 100, 0)

				var_168_27.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1019ui_story, var_168_31, var_168_30)

				local var_168_32 = manager.ui.mainCamera.transform.position - var_168_27.position

				var_168_27.forward = Vector3.New(var_168_32.x, var_168_32.y, var_168_32.z)

				local var_168_33 = var_168_27.localEulerAngles

				var_168_33.z = 0
				var_168_33.x = 0
				var_168_27.localEulerAngles = var_168_33
			end

			if arg_165_1.time_ >= var_168_28 + var_168_29 and arg_165_1.time_ < var_168_28 + var_168_29 + arg_168_0 then
				var_168_27.localPosition = Vector3.New(0, 100, 0)

				local var_168_34 = manager.ui.mainCamera.transform.position - var_168_27.position

				var_168_27.forward = Vector3.New(var_168_34.x, var_168_34.y, var_168_34.z)

				local var_168_35 = var_168_27.localEulerAngles

				var_168_35.z = 0
				var_168_35.x = 0
				var_168_27.localEulerAngles = var_168_35
			end

			local var_168_36 = arg_165_1.actors_["1019ui_story"]
			local var_168_37 = 1.96599999815226

			if var_168_37 < arg_165_1.time_ and arg_165_1.time_ <= var_168_37 + arg_168_0 and arg_165_1.var_.characterEffect1019ui_story == nil then
				arg_165_1.var_.characterEffect1019ui_story = var_168_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_38 = 0.034000001847744

			if var_168_37 <= arg_165_1.time_ and arg_165_1.time_ < var_168_37 + var_168_38 then
				local var_168_39 = (arg_165_1.time_ - var_168_37) / var_168_38

				if arg_165_1.var_.characterEffect1019ui_story then
					local var_168_40 = Mathf.Lerp(0, 0.5, var_168_39)

					arg_165_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1019ui_story.fillRatio = var_168_40
				end
			end

			if arg_165_1.time_ >= var_168_37 + var_168_38 and arg_165_1.time_ < var_168_37 + var_168_38 + arg_168_0 and arg_165_1.var_.characterEffect1019ui_story then
				local var_168_41 = 0.5

				arg_165_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1019ui_story.fillRatio = var_168_41
			end

			local var_168_42 = arg_165_1.actors_["1029ui_story"].transform
			local var_168_43 = 1.96599999815226

			if var_168_43 < arg_165_1.time_ and arg_165_1.time_ <= var_168_43 + arg_168_0 then
				arg_165_1.var_.moveOldPos1029ui_story = var_168_42.localPosition
			end

			local var_168_44 = 0.001

			if var_168_43 <= arg_165_1.time_ and arg_165_1.time_ < var_168_43 + var_168_44 then
				local var_168_45 = (arg_165_1.time_ - var_168_43) / var_168_44
				local var_168_46 = Vector3.New(0, 100, 0)

				var_168_42.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1029ui_story, var_168_46, var_168_45)

				local var_168_47 = manager.ui.mainCamera.transform.position - var_168_42.position

				var_168_42.forward = Vector3.New(var_168_47.x, var_168_47.y, var_168_47.z)

				local var_168_48 = var_168_42.localEulerAngles

				var_168_48.z = 0
				var_168_48.x = 0
				var_168_42.localEulerAngles = var_168_48
			end

			if arg_165_1.time_ >= var_168_43 + var_168_44 and arg_165_1.time_ < var_168_43 + var_168_44 + arg_168_0 then
				var_168_42.localPosition = Vector3.New(0, 100, 0)

				local var_168_49 = manager.ui.mainCamera.transform.position - var_168_42.position

				var_168_42.forward = Vector3.New(var_168_49.x, var_168_49.y, var_168_49.z)

				local var_168_50 = var_168_42.localEulerAngles

				var_168_50.z = 0
				var_168_50.x = 0
				var_168_42.localEulerAngles = var_168_50
			end

			local var_168_51 = arg_165_1.actors_["1029ui_story"]
			local var_168_52 = 1.96599999815226

			if var_168_52 < arg_165_1.time_ and arg_165_1.time_ <= var_168_52 + arg_168_0 and arg_165_1.var_.characterEffect1029ui_story == nil then
				arg_165_1.var_.characterEffect1029ui_story = var_168_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_53 = 0.034000001847744

			if var_168_52 <= arg_165_1.time_ and arg_165_1.time_ < var_168_52 + var_168_53 then
				local var_168_54 = (arg_165_1.time_ - var_168_52) / var_168_53

				if arg_165_1.var_.characterEffect1029ui_story then
					arg_165_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_52 + var_168_53 and arg_165_1.time_ < var_168_52 + var_168_53 + arg_168_0 and arg_165_1.var_.characterEffect1029ui_story then
				arg_165_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_168_55 = 3.8

			if var_168_55 < arg_165_1.time_ and arg_165_1.time_ <= var_168_55 + arg_168_0 then
				arg_165_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_168_56 = 3.8

			if var_168_56 < arg_165_1.time_ and arg_165_1.time_ <= var_168_56 + arg_168_0 then
				arg_165_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_168_57 = arg_165_1.actors_["1029ui_story"].transform
			local var_168_58 = 3.8

			if var_168_58 < arg_165_1.time_ and arg_165_1.time_ <= var_168_58 + arg_168_0 then
				arg_165_1.var_.moveOldPos1029ui_story = var_168_57.localPosition
			end

			local var_168_59 = 0.001

			if var_168_58 <= arg_165_1.time_ and arg_165_1.time_ < var_168_58 + var_168_59 then
				local var_168_60 = (arg_165_1.time_ - var_168_58) / var_168_59
				local var_168_61 = Vector3.New(0, -1.09, -6.2)

				var_168_57.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1029ui_story, var_168_61, var_168_60)

				local var_168_62 = manager.ui.mainCamera.transform.position - var_168_57.position

				var_168_57.forward = Vector3.New(var_168_62.x, var_168_62.y, var_168_62.z)

				local var_168_63 = var_168_57.localEulerAngles

				var_168_63.z = 0
				var_168_63.x = 0
				var_168_57.localEulerAngles = var_168_63
			end

			if arg_165_1.time_ >= var_168_58 + var_168_59 and arg_165_1.time_ < var_168_58 + var_168_59 + arg_168_0 then
				var_168_57.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_168_64 = manager.ui.mainCamera.transform.position - var_168_57.position

				var_168_57.forward = Vector3.New(var_168_64.x, var_168_64.y, var_168_64.z)

				local var_168_65 = var_168_57.localEulerAngles

				var_168_65.z = 0
				var_168_65.x = 0
				var_168_57.localEulerAngles = var_168_65
			end

			local var_168_66 = arg_165_1.actors_["1029ui_story"]
			local var_168_67 = 3.8

			if var_168_67 < arg_165_1.time_ and arg_165_1.time_ <= var_168_67 + arg_168_0 and arg_165_1.var_.characterEffect1029ui_story == nil then
				arg_165_1.var_.characterEffect1029ui_story = var_168_66:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_68 = 0.200000002980232

			if var_168_67 <= arg_165_1.time_ and arg_165_1.time_ < var_168_67 + var_168_68 then
				local var_168_69 = (arg_165_1.time_ - var_168_67) / var_168_68

				if arg_165_1.var_.characterEffect1029ui_story then
					arg_165_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_67 + var_168_68 and arg_165_1.time_ < var_168_67 + var_168_68 + arg_168_0 and arg_165_1.var_.characterEffect1029ui_story then
				arg_165_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			if arg_165_1.frameCnt_ <= 1 then
				arg_165_1.dialog_:SetActive(false)
			end

			local var_168_70 = 4
			local var_168_71 = 0.175

			if var_168_70 < arg_165_1.time_ and arg_165_1.time_ <= var_168_70 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0

				arg_165_1.dialog_:SetActive(true)

				local var_168_72 = LeanTween.value(arg_165_1.dialog_, 0, 1, 0.3)

				var_168_72:setOnUpdate(LuaHelper.FloatAction(function(arg_169_0)
					arg_165_1.dialogCg_.alpha = arg_169_0
				end))
				var_168_72:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_165_1.dialog_)
					var_168_72:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_165_1.duration_ = arg_165_1.duration_ + 0.3

				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_73 = arg_165_1:FormatText(StoryNameCfg[319].name)

				arg_165_1.leftNameTxt_.text = var_168_73

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_74 = arg_165_1:GetWordFromCfg(121501041)
				local var_168_75 = arg_165_1:FormatText(var_168_74.content)

				arg_165_1.text_.text = var_168_75

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_76 = 7
				local var_168_77 = utf8.len(var_168_75)
				local var_168_78 = var_168_76 <= 0 and var_168_71 or var_168_71 * (var_168_77 / var_168_76)

				if var_168_78 > 0 and var_168_71 < var_168_78 then
					arg_165_1.talkMaxDuration = var_168_78
					var_168_70 = var_168_70 + 0.3

					if var_168_78 + var_168_70 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_78 + var_168_70
					end
				end

				arg_165_1.text_.text = var_168_75
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501041", "story_v_out_121501.awb") ~= 0 then
					local var_168_79 = manager.audio:GetVoiceLength("story_v_out_121501", "121501041", "story_v_out_121501.awb") / 1000

					if var_168_79 + var_168_70 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_79 + var_168_70
					end

					if var_168_74.prefab_name ~= "" and arg_165_1.actors_[var_168_74.prefab_name] ~= nil then
						local var_168_80 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_74.prefab_name].transform, "story_v_out_121501", "121501041", "story_v_out_121501.awb")

						arg_165_1:RecordAudio("121501041", var_168_80)
						arg_165_1:RecordAudio("121501041", var_168_80)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_121501", "121501041", "story_v_out_121501.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_121501", "121501041", "story_v_out_121501.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_81 = var_168_70 + 0.3
			local var_168_82 = math.max(var_168_71, arg_165_1.talkMaxDuration)

			if var_168_81 <= arg_165_1.time_ and arg_165_1.time_ < var_168_81 + var_168_82 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_81) / var_168_82

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_81 + var_168_82 and arg_165_1.time_ < var_168_81 + var_168_82 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play121501042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 121501042
		arg_171_1.duration_ = 6.633

		local var_171_0 = {
			ja = 6.633,
			ko = 4.733,
			zh = 4.733
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play121501043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.475

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[319].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(121501042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501042", "story_v_out_121501.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501042", "story_v_out_121501.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_121501", "121501042", "story_v_out_121501.awb")

						arg_171_1:RecordAudio("121501042", var_174_9)
						arg_171_1:RecordAudio("121501042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_121501", "121501042", "story_v_out_121501.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_121501", "121501042", "story_v_out_121501.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play121501043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 121501043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play121501044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1029ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1029ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, 100, 0)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1029ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, 100, 0)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1029ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1029ui_story == nil then
				arg_175_1.var_.characterEffect1029ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1029ui_story then
					local var_178_13 = Mathf.Lerp(0, 0.5, var_178_12)

					arg_175_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1029ui_story.fillRatio = var_178_13
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1029ui_story then
				local var_178_14 = 0.5

				arg_175_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1029ui_story.fillRatio = var_178_14
			end

			local var_178_15 = 0
			local var_178_16 = 0.75

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_17 = arg_175_1:GetWordFromCfg(121501043)
				local var_178_18 = arg_175_1:FormatText(var_178_17.content)

				arg_175_1.text_.text = var_178_18

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_19 = 30
				local var_178_20 = utf8.len(var_178_18)
				local var_178_21 = var_178_19 <= 0 and var_178_16 or var_178_16 * (var_178_20 / var_178_19)

				if var_178_21 > 0 and var_178_16 < var_178_21 then
					arg_175_1.talkMaxDuration = var_178_21

					if var_178_21 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_21 + var_178_15
					end
				end

				arg_175_1.text_.text = var_178_18
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_22 = math.max(var_178_16, arg_175_1.talkMaxDuration)

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_22 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_15) / var_178_22

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_15 + var_178_22 and arg_175_1.time_ < var_178_15 + var_178_22 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play121501044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 121501044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play121501045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.425

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_2 = arg_179_1:GetWordFromCfg(121501044)
				local var_182_3 = arg_179_1:FormatText(var_182_2.content)

				arg_179_1.text_.text = var_182_3

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_4 = 57
				local var_182_5 = utf8.len(var_182_3)
				local var_182_6 = var_182_4 <= 0 and var_182_1 or var_182_1 * (var_182_5 / var_182_4)

				if var_182_6 > 0 and var_182_1 < var_182_6 then
					arg_179_1.talkMaxDuration = var_182_6

					if var_182_6 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_6 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_3
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_7 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_7 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_7

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_7 and arg_179_1.time_ < var_182_0 + var_182_7 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play121501045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 121501045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play121501046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 1.3

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

				local var_186_2 = arg_183_1:GetWordFromCfg(121501045)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 52
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
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play121501046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 121501046
		arg_187_1.duration_ = 2.9

		local var_187_0 = {
			ja = 2.9,
			ko = 2.833,
			zh = 2.833
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
				arg_187_0:Play121501047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1029ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1029ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(-0.7, -1.09, -6.2)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1029ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-0.7, -1.09, -6.2)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1029ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1029ui_story == nil then
				arg_187_1.var_.characterEffect1029ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1029ui_story then
					arg_187_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1029ui_story then
				arg_187_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_190_15 = "10014ui_story"

			if arg_187_1.actors_[var_190_15] == nil then
				local var_190_16 = Object.Instantiate(Asset.Load("Char/" .. var_190_15), arg_187_1.stage_.transform)

				var_190_16.name = var_190_15
				var_190_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_187_1.actors_[var_190_15] = var_190_16

				local var_190_17 = var_190_16:GetComponentInChildren(typeof(CharacterEffect))

				var_190_17.enabled = true

				local var_190_18 = GameObjectTools.GetOrAddComponent(var_190_16, typeof(DynamicBoneHelper))

				if var_190_18 then
					var_190_18:EnableDynamicBone(false)
				end

				arg_187_1:ShowWeapon(var_190_17.transform, false)

				arg_187_1.var_[var_190_15 .. "Animator"] = var_190_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_187_1.var_[var_190_15 .. "Animator"].applyRootMotion = true
				arg_187_1.var_[var_190_15 .. "LipSync"] = var_190_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_190_19 = arg_187_1.actors_["10014ui_story"].transform
			local var_190_20 = 0

			if var_190_20 < arg_187_1.time_ and arg_187_1.time_ <= var_190_20 + arg_190_0 then
				arg_187_1.var_.moveOldPos10014ui_story = var_190_19.localPosition
			end

			local var_190_21 = 0.001

			if var_190_20 <= arg_187_1.time_ and arg_187_1.time_ < var_190_20 + var_190_21 then
				local var_190_22 = (arg_187_1.time_ - var_190_20) / var_190_21
				local var_190_23 = Vector3.New(0.7, -1.06, -6.2)

				var_190_19.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10014ui_story, var_190_23, var_190_22)

				local var_190_24 = manager.ui.mainCamera.transform.position - var_190_19.position

				var_190_19.forward = Vector3.New(var_190_24.x, var_190_24.y, var_190_24.z)

				local var_190_25 = var_190_19.localEulerAngles

				var_190_25.z = 0
				var_190_25.x = 0
				var_190_19.localEulerAngles = var_190_25
			end

			if arg_187_1.time_ >= var_190_20 + var_190_21 and arg_187_1.time_ < var_190_20 + var_190_21 + arg_190_0 then
				var_190_19.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_190_26 = manager.ui.mainCamera.transform.position - var_190_19.position

				var_190_19.forward = Vector3.New(var_190_26.x, var_190_26.y, var_190_26.z)

				local var_190_27 = var_190_19.localEulerAngles

				var_190_27.z = 0
				var_190_27.x = 0
				var_190_19.localEulerAngles = var_190_27
			end

			local var_190_28 = arg_187_1.actors_["10014ui_story"]
			local var_190_29 = 0

			if var_190_29 < arg_187_1.time_ and arg_187_1.time_ <= var_190_29 + arg_190_0 and arg_187_1.var_.characterEffect10014ui_story == nil then
				arg_187_1.var_.characterEffect10014ui_story = var_190_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_30 = 0.200000002980232

			if var_190_29 <= arg_187_1.time_ and arg_187_1.time_ < var_190_29 + var_190_30 then
				local var_190_31 = (arg_187_1.time_ - var_190_29) / var_190_30

				if arg_187_1.var_.characterEffect10014ui_story then
					local var_190_32 = Mathf.Lerp(0, 0.5, var_190_31)

					arg_187_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_187_1.var_.characterEffect10014ui_story.fillRatio = var_190_32
				end
			end

			if arg_187_1.time_ >= var_190_29 + var_190_30 and arg_187_1.time_ < var_190_29 + var_190_30 + arg_190_0 and arg_187_1.var_.characterEffect10014ui_story then
				local var_190_33 = 0.5

				arg_187_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_187_1.var_.characterEffect10014ui_story.fillRatio = var_190_33
			end

			local var_190_34 = 0

			if var_190_34 < arg_187_1.time_ and arg_187_1.time_ <= var_190_34 + arg_190_0 then
				arg_187_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_190_35 = 0
			local var_190_36 = 0.175

			if var_190_35 < arg_187_1.time_ and arg_187_1.time_ <= var_190_35 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_37 = arg_187_1:FormatText(StoryNameCfg[319].name)

				arg_187_1.leftNameTxt_.text = var_190_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_38 = arg_187_1:GetWordFromCfg(121501046)
				local var_190_39 = arg_187_1:FormatText(var_190_38.content)

				arg_187_1.text_.text = var_190_39

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_40 = 7
				local var_190_41 = utf8.len(var_190_39)
				local var_190_42 = var_190_40 <= 0 and var_190_36 or var_190_36 * (var_190_41 / var_190_40)

				if var_190_42 > 0 and var_190_36 < var_190_42 then
					arg_187_1.talkMaxDuration = var_190_42

					if var_190_42 + var_190_35 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_42 + var_190_35
					end
				end

				arg_187_1.text_.text = var_190_39
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501046", "story_v_out_121501.awb") ~= 0 then
					local var_190_43 = manager.audio:GetVoiceLength("story_v_out_121501", "121501046", "story_v_out_121501.awb") / 1000

					if var_190_43 + var_190_35 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_43 + var_190_35
					end

					if var_190_38.prefab_name ~= "" and arg_187_1.actors_[var_190_38.prefab_name] ~= nil then
						local var_190_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_38.prefab_name].transform, "story_v_out_121501", "121501046", "story_v_out_121501.awb")

						arg_187_1:RecordAudio("121501046", var_190_44)
						arg_187_1:RecordAudio("121501046", var_190_44)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_121501", "121501046", "story_v_out_121501.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_121501", "121501046", "story_v_out_121501.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_45 = math.max(var_190_36, arg_187_1.talkMaxDuration)

			if var_190_35 <= arg_187_1.time_ and arg_187_1.time_ < var_190_35 + var_190_45 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_35) / var_190_45

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_35 + var_190_45 and arg_187_1.time_ < var_190_35 + var_190_45 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play121501047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 121501047
		arg_191_1.duration_ = 6.033

		local var_191_0 = {
			ja = 6.033,
			ko = 5.9,
			zh = 5.9
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play121501048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10014ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect10014ui_story == nil then
				arg_191_1.var_.characterEffect10014ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect10014ui_story then
					arg_191_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect10014ui_story then
				arg_191_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_194_4 = 0

			if var_194_4 < arg_191_1.time_ and arg_191_1.time_ <= var_194_4 + arg_194_0 then
				arg_191_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action5_1")
			end

			local var_194_5 = 0

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 then
				arg_191_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_194_6 = arg_191_1.actors_["1029ui_story"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.characterEffect1029ui_story == nil then
				arg_191_1.var_.characterEffect1029ui_story = var_194_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_8 = 0.200000002980232

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.characterEffect1029ui_story then
					local var_194_10 = Mathf.Lerp(0, 0.5, var_194_9)

					arg_191_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1029ui_story.fillRatio = var_194_10
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.characterEffect1029ui_story then
				local var_194_11 = 0.5

				arg_191_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1029ui_story.fillRatio = var_194_11
			end

			local var_194_12 = 0
			local var_194_13 = 0.725

			if var_194_12 < arg_191_1.time_ and arg_191_1.time_ <= var_194_12 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_14 = arg_191_1:FormatText(StoryNameCfg[264].name)

				arg_191_1.leftNameTxt_.text = var_194_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_15 = arg_191_1:GetWordFromCfg(121501047)
				local var_194_16 = arg_191_1:FormatText(var_194_15.content)

				arg_191_1.text_.text = var_194_16

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_17 = 29
				local var_194_18 = utf8.len(var_194_16)
				local var_194_19 = var_194_17 <= 0 and var_194_13 or var_194_13 * (var_194_18 / var_194_17)

				if var_194_19 > 0 and var_194_13 < var_194_19 then
					arg_191_1.talkMaxDuration = var_194_19

					if var_194_19 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_19 + var_194_12
					end
				end

				arg_191_1.text_.text = var_194_16
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501047", "story_v_out_121501.awb") ~= 0 then
					local var_194_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501047", "story_v_out_121501.awb") / 1000

					if var_194_20 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_12
					end

					if var_194_15.prefab_name ~= "" and arg_191_1.actors_[var_194_15.prefab_name] ~= nil then
						local var_194_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_15.prefab_name].transform, "story_v_out_121501", "121501047", "story_v_out_121501.awb")

						arg_191_1:RecordAudio("121501047", var_194_21)
						arg_191_1:RecordAudio("121501047", var_194_21)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_121501", "121501047", "story_v_out_121501.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_121501", "121501047", "story_v_out_121501.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_22 = math.max(var_194_13, arg_191_1.talkMaxDuration)

			if var_194_12 <= arg_191_1.time_ and arg_191_1.time_ < var_194_12 + var_194_22 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_12) / var_194_22

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_12 + var_194_22 and arg_191_1.time_ < var_194_12 + var_194_22 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play121501048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 121501048
		arg_195_1.duration_ = 3.866

		local var_195_0 = {
			ja = 3.866,
			ko = 2.633,
			zh = 2.633
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
				arg_195_0:Play121501049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10014ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect10014ui_story == nil then
				arg_195_1.var_.characterEffect10014ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect10014ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_195_1.var_.characterEffect10014ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect10014ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_195_1.var_.characterEffect10014ui_story.fillRatio = var_198_5
			end

			local var_198_6 = arg_195_1.actors_["1029ui_story"]
			local var_198_7 = 0

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 and arg_195_1.var_.characterEffect1029ui_story == nil then
				arg_195_1.var_.characterEffect1029ui_story = var_198_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_8 = 0.200000002980232

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_8 then
				local var_198_9 = (arg_195_1.time_ - var_198_7) / var_198_8

				if arg_195_1.var_.characterEffect1029ui_story then
					arg_195_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_7 + var_198_8 and arg_195_1.time_ < var_198_7 + var_198_8 + arg_198_0 and arg_195_1.var_.characterEffect1029ui_story then
				arg_195_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_198_10 = 0
			local var_198_11 = 0.35

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_12 = arg_195_1:FormatText(StoryNameCfg[319].name)

				arg_195_1.leftNameTxt_.text = var_198_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_13 = arg_195_1:GetWordFromCfg(121501048)
				local var_198_14 = arg_195_1:FormatText(var_198_13.content)

				arg_195_1.text_.text = var_198_14

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_15 = 14
				local var_198_16 = utf8.len(var_198_14)
				local var_198_17 = var_198_15 <= 0 and var_198_11 or var_198_11 * (var_198_16 / var_198_15)

				if var_198_17 > 0 and var_198_11 < var_198_17 then
					arg_195_1.talkMaxDuration = var_198_17

					if var_198_17 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_17 + var_198_10
					end
				end

				arg_195_1.text_.text = var_198_14
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501048", "story_v_out_121501.awb") ~= 0 then
					local var_198_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501048", "story_v_out_121501.awb") / 1000

					if var_198_18 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_18 + var_198_10
					end

					if var_198_13.prefab_name ~= "" and arg_195_1.actors_[var_198_13.prefab_name] ~= nil then
						local var_198_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_13.prefab_name].transform, "story_v_out_121501", "121501048", "story_v_out_121501.awb")

						arg_195_1:RecordAudio("121501048", var_198_19)
						arg_195_1:RecordAudio("121501048", var_198_19)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_121501", "121501048", "story_v_out_121501.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_121501", "121501048", "story_v_out_121501.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_20 = math.max(var_198_11, arg_195_1.talkMaxDuration)

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_20 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_10) / var_198_20

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_10 + var_198_20 and arg_195_1.time_ < var_198_10 + var_198_20 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play121501049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 121501049
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play121501050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_202_1 = 0
			local var_202_2 = 1.125

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(121501049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 45
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_2 or var_202_2 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_2 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_1 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_1
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_8 = math.max(var_202_2, arg_199_1.talkMaxDuration)

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_8 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_1) / var_202_8

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_1 + var_202_8 and arg_199_1.time_ < var_202_1 + var_202_8 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play121501050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 121501050
		arg_203_1.duration_ = 10.133

		local var_203_0 = {
			ja = 10.133,
			ko = 6.9,
			zh = 6.9
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
				arg_203_0:Play121501051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014actionlink/10014action454")
			end

			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_206_2 = arg_203_1.actors_["10014ui_story"]
			local var_206_3 = 0

			if var_206_3 < arg_203_1.time_ and arg_203_1.time_ <= var_206_3 + arg_206_0 and arg_203_1.var_.characterEffect10014ui_story == nil then
				arg_203_1.var_.characterEffect10014ui_story = var_206_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_4 = 0.200000002980232

			if var_206_3 <= arg_203_1.time_ and arg_203_1.time_ < var_206_3 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_3) / var_206_4

				if arg_203_1.var_.characterEffect10014ui_story then
					arg_203_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_3 + var_206_4 and arg_203_1.time_ < var_206_3 + var_206_4 + arg_206_0 and arg_203_1.var_.characterEffect10014ui_story then
				arg_203_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_206_6 = 0
			local var_206_7 = 0.775

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[264].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(121501050)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501050", "story_v_out_121501.awb") ~= 0 then
					local var_206_14 = manager.audio:GetVoiceLength("story_v_out_121501", "121501050", "story_v_out_121501.awb") / 1000

					if var_206_14 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_14 + var_206_6
					end

					if var_206_9.prefab_name ~= "" and arg_203_1.actors_[var_206_9.prefab_name] ~= nil then
						local var_206_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_9.prefab_name].transform, "story_v_out_121501", "121501050", "story_v_out_121501.awb")

						arg_203_1:RecordAudio("121501050", var_206_15)
						arg_203_1:RecordAudio("121501050", var_206_15)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_121501", "121501050", "story_v_out_121501.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_121501", "121501050", "story_v_out_121501.awb")
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
	Play121501051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 121501051
		arg_207_1.duration_ = 5.866

		local var_207_0 = {
			ja = 4.866,
			ko = 5.866,
			zh = 5.866
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
				arg_207_0:Play121501052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1029ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1029ui_story == nil then
				arg_207_1.var_.characterEffect1029ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1029ui_story then
					arg_207_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1029ui_story then
				arg_207_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_210_4 = 0

			if var_210_4 < arg_207_1.time_ and arg_207_1.time_ <= var_210_4 + arg_210_0 then
				arg_207_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_210_5 = 0

			if var_210_5 < arg_207_1.time_ and arg_207_1.time_ <= var_210_5 + arg_210_0 then
				arg_207_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_210_6 = arg_207_1.actors_["10014ui_story"]
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 and arg_207_1.var_.characterEffect10014ui_story == nil then
				arg_207_1.var_.characterEffect10014ui_story = var_210_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_8 = 0.200000002980232

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8

				if arg_207_1.var_.characterEffect10014ui_story then
					local var_210_10 = Mathf.Lerp(0, 0.5, var_210_9)

					arg_207_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_207_1.var_.characterEffect10014ui_story.fillRatio = var_210_10
				end
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 and arg_207_1.var_.characterEffect10014ui_story then
				local var_210_11 = 0.5

				arg_207_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_207_1.var_.characterEffect10014ui_story.fillRatio = var_210_11
			end

			local var_210_12 = 0
			local var_210_13 = 0.625

			if var_210_12 < arg_207_1.time_ and arg_207_1.time_ <= var_210_12 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_14 = arg_207_1:FormatText(StoryNameCfg[319].name)

				arg_207_1.leftNameTxt_.text = var_210_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(121501051)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 25
				local var_210_18 = utf8.len(var_210_16)
				local var_210_19 = var_210_17 <= 0 and var_210_13 or var_210_13 * (var_210_18 / var_210_17)

				if var_210_19 > 0 and var_210_13 < var_210_19 then
					arg_207_1.talkMaxDuration = var_210_19

					if var_210_19 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_19 + var_210_12
					end
				end

				arg_207_1.text_.text = var_210_16
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501051", "story_v_out_121501.awb") ~= 0 then
					local var_210_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501051", "story_v_out_121501.awb") / 1000

					if var_210_20 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_12
					end

					if var_210_15.prefab_name ~= "" and arg_207_1.actors_[var_210_15.prefab_name] ~= nil then
						local var_210_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_15.prefab_name].transform, "story_v_out_121501", "121501051", "story_v_out_121501.awb")

						arg_207_1:RecordAudio("121501051", var_210_21)
						arg_207_1:RecordAudio("121501051", var_210_21)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_121501", "121501051", "story_v_out_121501.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_121501", "121501051", "story_v_out_121501.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_22 = math.max(var_210_13, arg_207_1.talkMaxDuration)

			if var_210_12 <= arg_207_1.time_ and arg_207_1.time_ < var_210_12 + var_210_22 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_12) / var_210_22

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_12 + var_210_22 and arg_207_1.time_ < var_210_12 + var_210_22 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play121501052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 121501052
		arg_211_1.duration_ = 4.633

		local var_211_0 = {
			ja = 4.633,
			ko = 4.533,
			zh = 4.533
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
				arg_211_0:Play121501053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_214_1 = 0
			local var_214_2 = 0.4

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_3 = arg_211_1:FormatText(StoryNameCfg[319].name)

				arg_211_1.leftNameTxt_.text = var_214_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_4 = arg_211_1:GetWordFromCfg(121501052)
				local var_214_5 = arg_211_1:FormatText(var_214_4.content)

				arg_211_1.text_.text = var_214_5

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_6 = 16
				local var_214_7 = utf8.len(var_214_5)
				local var_214_8 = var_214_6 <= 0 and var_214_2 or var_214_2 * (var_214_7 / var_214_6)

				if var_214_8 > 0 and var_214_2 < var_214_8 then
					arg_211_1.talkMaxDuration = var_214_8

					if var_214_8 + var_214_1 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_1
					end
				end

				arg_211_1.text_.text = var_214_5
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501052", "story_v_out_121501.awb") ~= 0 then
					local var_214_9 = manager.audio:GetVoiceLength("story_v_out_121501", "121501052", "story_v_out_121501.awb") / 1000

					if var_214_9 + var_214_1 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_9 + var_214_1
					end

					if var_214_4.prefab_name ~= "" and arg_211_1.actors_[var_214_4.prefab_name] ~= nil then
						local var_214_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_4.prefab_name].transform, "story_v_out_121501", "121501052", "story_v_out_121501.awb")

						arg_211_1:RecordAudio("121501052", var_214_10)
						arg_211_1:RecordAudio("121501052", var_214_10)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_121501", "121501052", "story_v_out_121501.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_121501", "121501052", "story_v_out_121501.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_11 = math.max(var_214_2, arg_211_1.talkMaxDuration)

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_11 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_1) / var_214_11

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_1 + var_214_11 and arg_211_1.time_ < var_214_1 + var_214_11 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play121501053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 121501053
		arg_215_1.duration_ = 4.3

		local var_215_0 = {
			ja = 4.3,
			ko = 3.966,
			zh = 3.966
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
				arg_215_0:Play121501054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10014ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect10014ui_story == nil then
				arg_215_1.var_.characterEffect10014ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect10014ui_story then
					arg_215_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect10014ui_story then
				arg_215_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_218_4 = 0

			if var_218_4 < arg_215_1.time_ and arg_215_1.time_ <= var_218_4 + arg_218_0 then
				arg_215_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014actionlink/10014action442")
			end

			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 then
				arg_215_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_218_6 = arg_215_1.actors_["1029ui_story"]
			local var_218_7 = 0

			if var_218_7 < arg_215_1.time_ and arg_215_1.time_ <= var_218_7 + arg_218_0 and arg_215_1.var_.characterEffect1029ui_story == nil then
				arg_215_1.var_.characterEffect1029ui_story = var_218_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_8 = 0.200000002980232

			if var_218_7 <= arg_215_1.time_ and arg_215_1.time_ < var_218_7 + var_218_8 then
				local var_218_9 = (arg_215_1.time_ - var_218_7) / var_218_8

				if arg_215_1.var_.characterEffect1029ui_story then
					local var_218_10 = Mathf.Lerp(0, 0.5, var_218_9)

					arg_215_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1029ui_story.fillRatio = var_218_10
				end
			end

			if arg_215_1.time_ >= var_218_7 + var_218_8 and arg_215_1.time_ < var_218_7 + var_218_8 + arg_218_0 and arg_215_1.var_.characterEffect1029ui_story then
				local var_218_11 = 0.5

				arg_215_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1029ui_story.fillRatio = var_218_11
			end

			local var_218_12 = 0
			local var_218_13 = 0.45

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_14 = arg_215_1:FormatText(StoryNameCfg[264].name)

				arg_215_1.leftNameTxt_.text = var_218_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_15 = arg_215_1:GetWordFromCfg(121501053)
				local var_218_16 = arg_215_1:FormatText(var_218_15.content)

				arg_215_1.text_.text = var_218_16

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_17 = 18
				local var_218_18 = utf8.len(var_218_16)
				local var_218_19 = var_218_17 <= 0 and var_218_13 or var_218_13 * (var_218_18 / var_218_17)

				if var_218_19 > 0 and var_218_13 < var_218_19 then
					arg_215_1.talkMaxDuration = var_218_19

					if var_218_19 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_19 + var_218_12
					end
				end

				arg_215_1.text_.text = var_218_16
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501053", "story_v_out_121501.awb") ~= 0 then
					local var_218_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501053", "story_v_out_121501.awb") / 1000

					if var_218_20 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_12
					end

					if var_218_15.prefab_name ~= "" and arg_215_1.actors_[var_218_15.prefab_name] ~= nil then
						local var_218_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_15.prefab_name].transform, "story_v_out_121501", "121501053", "story_v_out_121501.awb")

						arg_215_1:RecordAudio("121501053", var_218_21)
						arg_215_1:RecordAudio("121501053", var_218_21)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_121501", "121501053", "story_v_out_121501.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_121501", "121501053", "story_v_out_121501.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_22 = math.max(var_218_13, arg_215_1.talkMaxDuration)

			if var_218_12 <= arg_215_1.time_ and arg_215_1.time_ < var_218_12 + var_218_22 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_12) / var_218_22

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_12 + var_218_22 and arg_215_1.time_ < var_218_12 + var_218_22 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play121501054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 121501054
		arg_219_1.duration_ = 2.5

		local var_219_0 = {
			ja = 2.5,
			ko = 1.933,
			zh = 1.933
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
				arg_219_0:Play121501055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1029ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1029ui_story == nil then
				arg_219_1.var_.characterEffect1029ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1029ui_story then
					arg_219_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1029ui_story then
				arg_219_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_222_4 = arg_219_1.actors_["10014ui_story"]
			local var_222_5 = 0

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 and arg_219_1.var_.characterEffect10014ui_story == nil then
				arg_219_1.var_.characterEffect10014ui_story = var_222_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_6 = 0.200000002980232

			if var_222_5 <= arg_219_1.time_ and arg_219_1.time_ < var_222_5 + var_222_6 then
				local var_222_7 = (arg_219_1.time_ - var_222_5) / var_222_6

				if arg_219_1.var_.characterEffect10014ui_story then
					local var_222_8 = Mathf.Lerp(0, 0.5, var_222_7)

					arg_219_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_219_1.var_.characterEffect10014ui_story.fillRatio = var_222_8
				end
			end

			if arg_219_1.time_ >= var_222_5 + var_222_6 and arg_219_1.time_ < var_222_5 + var_222_6 + arg_222_0 and arg_219_1.var_.characterEffect10014ui_story then
				local var_222_9 = 0.5

				arg_219_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_219_1.var_.characterEffect10014ui_story.fillRatio = var_222_9
			end

			local var_222_10 = 0
			local var_222_11 = 0.2

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_12 = arg_219_1:FormatText(StoryNameCfg[319].name)

				arg_219_1.leftNameTxt_.text = var_222_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_13 = arg_219_1:GetWordFromCfg(121501054)
				local var_222_14 = arg_219_1:FormatText(var_222_13.content)

				arg_219_1.text_.text = var_222_14

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_15 = 8
				local var_222_16 = utf8.len(var_222_14)
				local var_222_17 = var_222_15 <= 0 and var_222_11 or var_222_11 * (var_222_16 / var_222_15)

				if var_222_17 > 0 and var_222_11 < var_222_17 then
					arg_219_1.talkMaxDuration = var_222_17

					if var_222_17 + var_222_10 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_17 + var_222_10
					end
				end

				arg_219_1.text_.text = var_222_14
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501054", "story_v_out_121501.awb") ~= 0 then
					local var_222_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501054", "story_v_out_121501.awb") / 1000

					if var_222_18 + var_222_10 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_18 + var_222_10
					end

					if var_222_13.prefab_name ~= "" and arg_219_1.actors_[var_222_13.prefab_name] ~= nil then
						local var_222_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_13.prefab_name].transform, "story_v_out_121501", "121501054", "story_v_out_121501.awb")

						arg_219_1:RecordAudio("121501054", var_222_19)
						arg_219_1:RecordAudio("121501054", var_222_19)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_121501", "121501054", "story_v_out_121501.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_121501", "121501054", "story_v_out_121501.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_20 = math.max(var_222_11, arg_219_1.talkMaxDuration)

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_20 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_10) / var_222_20

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_10 + var_222_20 and arg_219_1.time_ < var_222_10 + var_222_20 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play121501055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 121501055
		arg_223_1.duration_ = 2.733

		local var_223_0 = {
			ja = 1.166,
			ko = 2.733,
			zh = 2.733
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
				arg_223_0:Play121501056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1029ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1029ui_story == nil then
				arg_223_1.var_.characterEffect1029ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1029ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1029ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1029ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1029ui_story.fillRatio = var_226_5
			end

			local var_226_6 = arg_223_1.actors_["10014ui_story"]
			local var_226_7 = 0

			if var_226_7 < arg_223_1.time_ and arg_223_1.time_ <= var_226_7 + arg_226_0 and arg_223_1.var_.characterEffect10014ui_story == nil then
				arg_223_1.var_.characterEffect10014ui_story = var_226_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_8 = 0.200000002980232

			if var_226_7 <= arg_223_1.time_ and arg_223_1.time_ < var_226_7 + var_226_8 then
				local var_226_9 = (arg_223_1.time_ - var_226_7) / var_226_8

				if arg_223_1.var_.characterEffect10014ui_story then
					arg_223_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_7 + var_226_8 and arg_223_1.time_ < var_226_7 + var_226_8 + arg_226_0 and arg_223_1.var_.characterEffect10014ui_story then
				arg_223_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_226_10 = 0
			local var_226_11 = 0.05

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_12 = arg_223_1:FormatText(StoryNameCfg[264].name)

				arg_223_1.leftNameTxt_.text = var_226_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_13 = arg_223_1:GetWordFromCfg(121501055)
				local var_226_14 = arg_223_1:FormatText(var_226_13.content)

				arg_223_1.text_.text = var_226_14

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_15 = 2
				local var_226_16 = utf8.len(var_226_14)
				local var_226_17 = var_226_15 <= 0 and var_226_11 or var_226_11 * (var_226_16 / var_226_15)

				if var_226_17 > 0 and var_226_11 < var_226_17 then
					arg_223_1.talkMaxDuration = var_226_17

					if var_226_17 + var_226_10 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_17 + var_226_10
					end
				end

				arg_223_1.text_.text = var_226_14
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501055", "story_v_out_121501.awb") ~= 0 then
					local var_226_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501055", "story_v_out_121501.awb") / 1000

					if var_226_18 + var_226_10 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_18 + var_226_10
					end

					if var_226_13.prefab_name ~= "" and arg_223_1.actors_[var_226_13.prefab_name] ~= nil then
						local var_226_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_13.prefab_name].transform, "story_v_out_121501", "121501055", "story_v_out_121501.awb")

						arg_223_1:RecordAudio("121501055", var_226_19)
						arg_223_1:RecordAudio("121501055", var_226_19)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_121501", "121501055", "story_v_out_121501.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_121501", "121501055", "story_v_out_121501.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_20 = math.max(var_226_11, arg_223_1.talkMaxDuration)

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_20 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_10) / var_226_20

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_10 + var_226_20 and arg_223_1.time_ < var_226_10 + var_226_20 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play121501056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 121501056
		arg_227_1.duration_ = 12.866

		local var_227_0 = {
			ja = 12.866,
			ko = 12.2,
			zh = 12.2
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
				arg_227_0:Play121501057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1029ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1029ui_story == nil then
				arg_227_1.var_.characterEffect1029ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1029ui_story then
					arg_227_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1029ui_story then
				arg_227_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_230_4 = arg_227_1.actors_["10014ui_story"]
			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 and arg_227_1.var_.characterEffect10014ui_story == nil then
				arg_227_1.var_.characterEffect10014ui_story = var_230_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_6 = 0.200000002980232

			if var_230_5 <= arg_227_1.time_ and arg_227_1.time_ < var_230_5 + var_230_6 then
				local var_230_7 = (arg_227_1.time_ - var_230_5) / var_230_6

				if arg_227_1.var_.characterEffect10014ui_story then
					local var_230_8 = Mathf.Lerp(0, 0.5, var_230_7)

					arg_227_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_227_1.var_.characterEffect10014ui_story.fillRatio = var_230_8
				end
			end

			if arg_227_1.time_ >= var_230_5 + var_230_6 and arg_227_1.time_ < var_230_5 + var_230_6 + arg_230_0 and arg_227_1.var_.characterEffect10014ui_story then
				local var_230_9 = 0.5

				arg_227_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_227_1.var_.characterEffect10014ui_story.fillRatio = var_230_9
			end

			local var_230_10 = 0
			local var_230_11 = 1.3

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_12 = arg_227_1:FormatText(StoryNameCfg[319].name)

				arg_227_1.leftNameTxt_.text = var_230_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_13 = arg_227_1:GetWordFromCfg(121501056)
				local var_230_14 = arg_227_1:FormatText(var_230_13.content)

				arg_227_1.text_.text = var_230_14

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_15 = 52
				local var_230_16 = utf8.len(var_230_14)
				local var_230_17 = var_230_15 <= 0 and var_230_11 or var_230_11 * (var_230_16 / var_230_15)

				if var_230_17 > 0 and var_230_11 < var_230_17 then
					arg_227_1.talkMaxDuration = var_230_17

					if var_230_17 + var_230_10 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_17 + var_230_10
					end
				end

				arg_227_1.text_.text = var_230_14
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501056", "story_v_out_121501.awb") ~= 0 then
					local var_230_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501056", "story_v_out_121501.awb") / 1000

					if var_230_18 + var_230_10 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_18 + var_230_10
					end

					if var_230_13.prefab_name ~= "" and arg_227_1.actors_[var_230_13.prefab_name] ~= nil then
						local var_230_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_13.prefab_name].transform, "story_v_out_121501", "121501056", "story_v_out_121501.awb")

						arg_227_1:RecordAudio("121501056", var_230_19)
						arg_227_1:RecordAudio("121501056", var_230_19)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_121501", "121501056", "story_v_out_121501.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_121501", "121501056", "story_v_out_121501.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_20 = math.max(var_230_11, arg_227_1.talkMaxDuration)

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_20 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_10) / var_230_20

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_10 + var_230_20 and arg_227_1.time_ < var_230_10 + var_230_20 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play121501057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 121501057
		arg_231_1.duration_ = 10.8

		local var_231_0 = {
			ja = 10.8,
			ko = 10.666,
			zh = 10.666
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
				arg_231_0:Play121501058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 1.125

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[319].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(121501057)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 45
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501057", "story_v_out_121501.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501057", "story_v_out_121501.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_121501", "121501057", "story_v_out_121501.awb")

						arg_231_1:RecordAudio("121501057", var_234_9)
						arg_231_1:RecordAudio("121501057", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_121501", "121501057", "story_v_out_121501.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_121501", "121501057", "story_v_out_121501.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_10 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_10 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_10

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_10 and arg_231_1.time_ < var_234_0 + var_234_10 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play121501058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 121501058
		arg_235_1.duration_ = 6

		local var_235_0 = {
			ja = 6,
			ko = 3.2,
			zh = 3.2
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
				arg_235_0:Play121501059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1029ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1029ui_story == nil then
				arg_235_1.var_.characterEffect1029ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1029ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1029ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1029ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1029ui_story.fillRatio = var_238_5
			end

			local var_238_6 = arg_235_1.actors_["10014ui_story"]
			local var_238_7 = 0

			if var_238_7 < arg_235_1.time_ and arg_235_1.time_ <= var_238_7 + arg_238_0 and arg_235_1.var_.characterEffect10014ui_story == nil then
				arg_235_1.var_.characterEffect10014ui_story = var_238_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_8 = 0.200000002980232

			if var_238_7 <= arg_235_1.time_ and arg_235_1.time_ < var_238_7 + var_238_8 then
				local var_238_9 = (arg_235_1.time_ - var_238_7) / var_238_8

				if arg_235_1.var_.characterEffect10014ui_story then
					arg_235_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_7 + var_238_8 and arg_235_1.time_ < var_238_7 + var_238_8 + arg_238_0 and arg_235_1.var_.characterEffect10014ui_story then
				arg_235_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_238_10 = 0
			local var_238_11 = 0.2

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_12 = arg_235_1:FormatText(StoryNameCfg[264].name)

				arg_235_1.leftNameTxt_.text = var_238_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_13 = arg_235_1:GetWordFromCfg(121501058)
				local var_238_14 = arg_235_1:FormatText(var_238_13.content)

				arg_235_1.text_.text = var_238_14

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_15 = 8
				local var_238_16 = utf8.len(var_238_14)
				local var_238_17 = var_238_15 <= 0 and var_238_11 or var_238_11 * (var_238_16 / var_238_15)

				if var_238_17 > 0 and var_238_11 < var_238_17 then
					arg_235_1.talkMaxDuration = var_238_17

					if var_238_17 + var_238_10 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_17 + var_238_10
					end
				end

				arg_235_1.text_.text = var_238_14
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501058", "story_v_out_121501.awb") ~= 0 then
					local var_238_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501058", "story_v_out_121501.awb") / 1000

					if var_238_18 + var_238_10 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_18 + var_238_10
					end

					if var_238_13.prefab_name ~= "" and arg_235_1.actors_[var_238_13.prefab_name] ~= nil then
						local var_238_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_13.prefab_name].transform, "story_v_out_121501", "121501058", "story_v_out_121501.awb")

						arg_235_1:RecordAudio("121501058", var_238_19)
						arg_235_1:RecordAudio("121501058", var_238_19)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_121501", "121501058", "story_v_out_121501.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_121501", "121501058", "story_v_out_121501.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_20 = math.max(var_238_11, arg_235_1.talkMaxDuration)

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_20 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_10) / var_238_20

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_10 + var_238_20 and arg_235_1.time_ < var_238_10 + var_238_20 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play121501059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 121501059
		arg_239_1.duration_ = 8.3

		local var_239_0 = {
			ja = 8.233,
			ko = 8.3,
			zh = 8.3
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
				arg_239_0:Play121501060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1029ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1029ui_story == nil then
				arg_239_1.var_.characterEffect1029ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1029ui_story then
					arg_239_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1029ui_story then
				arg_239_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_242_4 = arg_239_1.actors_["10014ui_story"]
			local var_242_5 = 0

			if var_242_5 < arg_239_1.time_ and arg_239_1.time_ <= var_242_5 + arg_242_0 and arg_239_1.var_.characterEffect10014ui_story == nil then
				arg_239_1.var_.characterEffect10014ui_story = var_242_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_6 = 0.200000002980232

			if var_242_5 <= arg_239_1.time_ and arg_239_1.time_ < var_242_5 + var_242_6 then
				local var_242_7 = (arg_239_1.time_ - var_242_5) / var_242_6

				if arg_239_1.var_.characterEffect10014ui_story then
					local var_242_8 = Mathf.Lerp(0, 0.5, var_242_7)

					arg_239_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_239_1.var_.characterEffect10014ui_story.fillRatio = var_242_8
				end
			end

			if arg_239_1.time_ >= var_242_5 + var_242_6 and arg_239_1.time_ < var_242_5 + var_242_6 + arg_242_0 and arg_239_1.var_.characterEffect10014ui_story then
				local var_242_9 = 0.5

				arg_239_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_239_1.var_.characterEffect10014ui_story.fillRatio = var_242_9
			end

			local var_242_10 = 0
			local var_242_11 = 0.825

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_12 = arg_239_1:FormatText(StoryNameCfg[319].name)

				arg_239_1.leftNameTxt_.text = var_242_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_13 = arg_239_1:GetWordFromCfg(121501059)
				local var_242_14 = arg_239_1:FormatText(var_242_13.content)

				arg_239_1.text_.text = var_242_14

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_15 = 33
				local var_242_16 = utf8.len(var_242_14)
				local var_242_17 = var_242_15 <= 0 and var_242_11 or var_242_11 * (var_242_16 / var_242_15)

				if var_242_17 > 0 and var_242_11 < var_242_17 then
					arg_239_1.talkMaxDuration = var_242_17

					if var_242_17 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_17 + var_242_10
					end
				end

				arg_239_1.text_.text = var_242_14
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501059", "story_v_out_121501.awb") ~= 0 then
					local var_242_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501059", "story_v_out_121501.awb") / 1000

					if var_242_18 + var_242_10 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_18 + var_242_10
					end

					if var_242_13.prefab_name ~= "" and arg_239_1.actors_[var_242_13.prefab_name] ~= nil then
						local var_242_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_13.prefab_name].transform, "story_v_out_121501", "121501059", "story_v_out_121501.awb")

						arg_239_1:RecordAudio("121501059", var_242_19)
						arg_239_1:RecordAudio("121501059", var_242_19)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_121501", "121501059", "story_v_out_121501.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_121501", "121501059", "story_v_out_121501.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_20 = math.max(var_242_11, arg_239_1.talkMaxDuration)

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_20 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_10) / var_242_20

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_10 + var_242_20 and arg_239_1.time_ < var_242_10 + var_242_20 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play121501060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 121501060
		arg_243_1.duration_ = 7.433

		local var_243_0 = {
			ja = 6.866,
			ko = 7.433,
			zh = 7.433
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
				arg_243_0:Play121501061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1029ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1029ui_story == nil then
				arg_243_1.var_.characterEffect1029ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.200000002980232

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1029ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1029ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1029ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1029ui_story.fillRatio = var_246_5
			end

			local var_246_6 = arg_243_1.actors_["10014ui_story"]
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 and arg_243_1.var_.characterEffect10014ui_story == nil then
				arg_243_1.var_.characterEffect10014ui_story = var_246_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_8 = 0.200000002980232

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8

				if arg_243_1.var_.characterEffect10014ui_story then
					arg_243_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 and arg_243_1.var_.characterEffect10014ui_story then
				arg_243_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_246_10 = 0
			local var_246_11 = 0.825

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_12 = arg_243_1:FormatText(StoryNameCfg[264].name)

				arg_243_1.leftNameTxt_.text = var_246_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_13 = arg_243_1:GetWordFromCfg(121501060)
				local var_246_14 = arg_243_1:FormatText(var_246_13.content)

				arg_243_1.text_.text = var_246_14

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_15 = 33
				local var_246_16 = utf8.len(var_246_14)
				local var_246_17 = var_246_15 <= 0 and var_246_11 or var_246_11 * (var_246_16 / var_246_15)

				if var_246_17 > 0 and var_246_11 < var_246_17 then
					arg_243_1.talkMaxDuration = var_246_17

					if var_246_17 + var_246_10 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_17 + var_246_10
					end
				end

				arg_243_1.text_.text = var_246_14
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501060", "story_v_out_121501.awb") ~= 0 then
					local var_246_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501060", "story_v_out_121501.awb") / 1000

					if var_246_18 + var_246_10 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_18 + var_246_10
					end

					if var_246_13.prefab_name ~= "" and arg_243_1.actors_[var_246_13.prefab_name] ~= nil then
						local var_246_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_13.prefab_name].transform, "story_v_out_121501", "121501060", "story_v_out_121501.awb")

						arg_243_1:RecordAudio("121501060", var_246_19)
						arg_243_1:RecordAudio("121501060", var_246_19)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_121501", "121501060", "story_v_out_121501.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_121501", "121501060", "story_v_out_121501.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_20 = math.max(var_246_11, arg_243_1.talkMaxDuration)

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_20 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_10) / var_246_20

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_10 + var_246_20 and arg_243_1.time_ < var_246_10 + var_246_20 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play121501061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 121501061
		arg_247_1.duration_ = 6.7

		local var_247_0 = {
			ja = 6.7,
			ko = 3.966,
			zh = 3.966
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
				arg_247_0:Play121501062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action445")
			end

			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_250_2 = arg_247_1.actors_["1029ui_story"]
			local var_250_3 = 0

			if var_250_3 < arg_247_1.time_ and arg_247_1.time_ <= var_250_3 + arg_250_0 and arg_247_1.var_.characterEffect1029ui_story == nil then
				arg_247_1.var_.characterEffect1029ui_story = var_250_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_4 = 0.200000002980232

			if var_250_3 <= arg_247_1.time_ and arg_247_1.time_ < var_250_3 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_3) / var_250_4

				if arg_247_1.var_.characterEffect1029ui_story then
					arg_247_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_3 + var_250_4 and arg_247_1.time_ < var_250_3 + var_250_4 + arg_250_0 and arg_247_1.var_.characterEffect1029ui_story then
				arg_247_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_250_6 = arg_247_1.actors_["10014ui_story"]
			local var_250_7 = 0

			if var_250_7 < arg_247_1.time_ and arg_247_1.time_ <= var_250_7 + arg_250_0 and arg_247_1.var_.characterEffect10014ui_story == nil then
				arg_247_1.var_.characterEffect10014ui_story = var_250_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_8 = 0.200000002980232

			if var_250_7 <= arg_247_1.time_ and arg_247_1.time_ < var_250_7 + var_250_8 then
				local var_250_9 = (arg_247_1.time_ - var_250_7) / var_250_8

				if arg_247_1.var_.characterEffect10014ui_story then
					local var_250_10 = Mathf.Lerp(0, 0.5, var_250_9)

					arg_247_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_247_1.var_.characterEffect10014ui_story.fillRatio = var_250_10
				end
			end

			if arg_247_1.time_ >= var_250_7 + var_250_8 and arg_247_1.time_ < var_250_7 + var_250_8 + arg_250_0 and arg_247_1.var_.characterEffect10014ui_story then
				local var_250_11 = 0.5

				arg_247_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_247_1.var_.characterEffect10014ui_story.fillRatio = var_250_11
			end

			local var_250_12 = 0
			local var_250_13 = 0.35

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_14 = arg_247_1:FormatText(StoryNameCfg[319].name)

				arg_247_1.leftNameTxt_.text = var_250_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_15 = arg_247_1:GetWordFromCfg(121501061)
				local var_250_16 = arg_247_1:FormatText(var_250_15.content)

				arg_247_1.text_.text = var_250_16

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_17 = 14
				local var_250_18 = utf8.len(var_250_16)
				local var_250_19 = var_250_17 <= 0 and var_250_13 or var_250_13 * (var_250_18 / var_250_17)

				if var_250_19 > 0 and var_250_13 < var_250_19 then
					arg_247_1.talkMaxDuration = var_250_19

					if var_250_19 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_19 + var_250_12
					end
				end

				arg_247_1.text_.text = var_250_16
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501061", "story_v_out_121501.awb") ~= 0 then
					local var_250_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501061", "story_v_out_121501.awb") / 1000

					if var_250_20 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_20 + var_250_12
					end

					if var_250_15.prefab_name ~= "" and arg_247_1.actors_[var_250_15.prefab_name] ~= nil then
						local var_250_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_15.prefab_name].transform, "story_v_out_121501", "121501061", "story_v_out_121501.awb")

						arg_247_1:RecordAudio("121501061", var_250_21)
						arg_247_1:RecordAudio("121501061", var_250_21)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_121501", "121501061", "story_v_out_121501.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_121501", "121501061", "story_v_out_121501.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_22 = math.max(var_250_13, arg_247_1.talkMaxDuration)

			if var_250_12 <= arg_247_1.time_ and arg_247_1.time_ < var_250_12 + var_250_22 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_12) / var_250_22

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_12 + var_250_22 and arg_247_1.time_ < var_250_12 + var_250_22 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play121501062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 121501062
		arg_251_1.duration_ = 7.266

		local var_251_0 = {
			ja = 7.266,
			ko = 6.333,
			zh = 6.333
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
				arg_251_0:Play121501063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10014ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect10014ui_story == nil then
				arg_251_1.var_.characterEffect10014ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect10014ui_story then
					arg_251_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect10014ui_story then
				arg_251_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_254_4 = arg_251_1.actors_["1029ui_story"]
			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 and arg_251_1.var_.characterEffect1029ui_story == nil then
				arg_251_1.var_.characterEffect1029ui_story = var_254_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_6 = 0.200000002980232

			if var_254_5 <= arg_251_1.time_ and arg_251_1.time_ < var_254_5 + var_254_6 then
				local var_254_7 = (arg_251_1.time_ - var_254_5) / var_254_6

				if arg_251_1.var_.characterEffect1029ui_story then
					local var_254_8 = Mathf.Lerp(0, 0.5, var_254_7)

					arg_251_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1029ui_story.fillRatio = var_254_8
				end
			end

			if arg_251_1.time_ >= var_254_5 + var_254_6 and arg_251_1.time_ < var_254_5 + var_254_6 + arg_254_0 and arg_251_1.var_.characterEffect1029ui_story then
				local var_254_9 = 0.5

				arg_251_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1029ui_story.fillRatio = var_254_9
			end

			local var_254_10 = 0
			local var_254_11 = 0.75

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_12 = arg_251_1:FormatText(StoryNameCfg[264].name)

				arg_251_1.leftNameTxt_.text = var_254_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_13 = arg_251_1:GetWordFromCfg(121501062)
				local var_254_14 = arg_251_1:FormatText(var_254_13.content)

				arg_251_1.text_.text = var_254_14

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_15 = 30
				local var_254_16 = utf8.len(var_254_14)
				local var_254_17 = var_254_15 <= 0 and var_254_11 or var_254_11 * (var_254_16 / var_254_15)

				if var_254_17 > 0 and var_254_11 < var_254_17 then
					arg_251_1.talkMaxDuration = var_254_17

					if var_254_17 + var_254_10 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_17 + var_254_10
					end
				end

				arg_251_1.text_.text = var_254_14
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501062", "story_v_out_121501.awb") ~= 0 then
					local var_254_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501062", "story_v_out_121501.awb") / 1000

					if var_254_18 + var_254_10 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_18 + var_254_10
					end

					if var_254_13.prefab_name ~= "" and arg_251_1.actors_[var_254_13.prefab_name] ~= nil then
						local var_254_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_13.prefab_name].transform, "story_v_out_121501", "121501062", "story_v_out_121501.awb")

						arg_251_1:RecordAudio("121501062", var_254_19)
						arg_251_1:RecordAudio("121501062", var_254_19)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_121501", "121501062", "story_v_out_121501.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_121501", "121501062", "story_v_out_121501.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_20 = math.max(var_254_11, arg_251_1.talkMaxDuration)

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_20 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_10) / var_254_20

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_10 + var_254_20 and arg_251_1.time_ < var_254_10 + var_254_20 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play121501063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 121501063
		arg_255_1.duration_ = 8.8

		local var_255_0 = {
			ja = 8.8,
			ko = 5.533,
			zh = 5.533
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
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play121501064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.65

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[264].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(121501063)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 26
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501063", "story_v_out_121501.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501063", "story_v_out_121501.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_121501", "121501063", "story_v_out_121501.awb")

						arg_255_1:RecordAudio("121501063", var_258_9)
						arg_255_1:RecordAudio("121501063", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_121501", "121501063", "story_v_out_121501.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_121501", "121501063", "story_v_out_121501.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play121501064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 121501064
		arg_259_1.duration_ = 11.333

		local var_259_0 = {
			ja = 8.666,
			ko = 11.333,
			zh = 11.333
		}
		local var_259_1 = manager.audio:GetLocalizationFlag()

		if var_259_0[var_259_1] ~= nil then
			arg_259_1.duration_ = var_259_0[var_259_1]
		end

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play121501065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1029ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1029ui_story == nil then
				arg_259_1.var_.characterEffect1029ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1029ui_story then
					arg_259_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1029ui_story then
				arg_259_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_262_4 = arg_259_1.actors_["10014ui_story"]
			local var_262_5 = 0

			if var_262_5 < arg_259_1.time_ and arg_259_1.time_ <= var_262_5 + arg_262_0 and arg_259_1.var_.characterEffect10014ui_story == nil then
				arg_259_1.var_.characterEffect10014ui_story = var_262_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_6 = 0.200000002980232

			if var_262_5 <= arg_259_1.time_ and arg_259_1.time_ < var_262_5 + var_262_6 then
				local var_262_7 = (arg_259_1.time_ - var_262_5) / var_262_6

				if arg_259_1.var_.characterEffect10014ui_story then
					local var_262_8 = Mathf.Lerp(0, 0.5, var_262_7)

					arg_259_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_259_1.var_.characterEffect10014ui_story.fillRatio = var_262_8
				end
			end

			if arg_259_1.time_ >= var_262_5 + var_262_6 and arg_259_1.time_ < var_262_5 + var_262_6 + arg_262_0 and arg_259_1.var_.characterEffect10014ui_story then
				local var_262_9 = 0.5

				arg_259_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_259_1.var_.characterEffect10014ui_story.fillRatio = var_262_9
			end

			local var_262_10 = 0
			local var_262_11 = 1.2

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_12 = arg_259_1:FormatText(StoryNameCfg[319].name)

				arg_259_1.leftNameTxt_.text = var_262_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_13 = arg_259_1:GetWordFromCfg(121501064)
				local var_262_14 = arg_259_1:FormatText(var_262_13.content)

				arg_259_1.text_.text = var_262_14

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_15 = 48
				local var_262_16 = utf8.len(var_262_14)
				local var_262_17 = var_262_15 <= 0 and var_262_11 or var_262_11 * (var_262_16 / var_262_15)

				if var_262_17 > 0 and var_262_11 < var_262_17 then
					arg_259_1.talkMaxDuration = var_262_17

					if var_262_17 + var_262_10 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_17 + var_262_10
					end
				end

				arg_259_1.text_.text = var_262_14
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501064", "story_v_out_121501.awb") ~= 0 then
					local var_262_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501064", "story_v_out_121501.awb") / 1000

					if var_262_18 + var_262_10 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_18 + var_262_10
					end

					if var_262_13.prefab_name ~= "" and arg_259_1.actors_[var_262_13.prefab_name] ~= nil then
						local var_262_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_13.prefab_name].transform, "story_v_out_121501", "121501064", "story_v_out_121501.awb")

						arg_259_1:RecordAudio("121501064", var_262_19)
						arg_259_1:RecordAudio("121501064", var_262_19)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_121501", "121501064", "story_v_out_121501.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_121501", "121501064", "story_v_out_121501.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_20 = math.max(var_262_11, arg_259_1.talkMaxDuration)

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_20 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_10) / var_262_20

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_10 + var_262_20 and arg_259_1.time_ < var_262_10 + var_262_20 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play121501065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 121501065
		arg_263_1.duration_ = 8.3

		local var_263_0 = {
			ja = 8.3,
			ko = 5.933,
			zh = 5.933
		}
		local var_263_1 = manager.audio:GetLocalizationFlag()

		if var_263_0[var_263_1] ~= nil then
			arg_263_1.duration_ = var_263_0[var_263_1]
		end

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play121501066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.725

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[319].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(121501065)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 29
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501065", "story_v_out_121501.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501065", "story_v_out_121501.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_121501", "121501065", "story_v_out_121501.awb")

						arg_263_1:RecordAudio("121501065", var_266_9)
						arg_263_1:RecordAudio("121501065", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_121501", "121501065", "story_v_out_121501.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_121501", "121501065", "story_v_out_121501.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play121501066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 121501066
		arg_267_1.duration_ = 5.733

		local var_267_0 = {
			ja = 3.066,
			ko = 5.733,
			zh = 5.733
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play121501067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_270_1 = arg_267_1.actors_["1029ui_story"]
			local var_270_2 = 0

			if var_270_2 < arg_267_1.time_ and arg_267_1.time_ <= var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1029ui_story == nil then
				arg_267_1.var_.characterEffect1029ui_story = var_270_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_3 = 0.200000002980232

			if var_270_2 <= arg_267_1.time_ and arg_267_1.time_ < var_270_2 + var_270_3 then
				local var_270_4 = (arg_267_1.time_ - var_270_2) / var_270_3

				if arg_267_1.var_.characterEffect1029ui_story then
					local var_270_5 = Mathf.Lerp(0, 0.5, var_270_4)

					arg_267_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1029ui_story.fillRatio = var_270_5
				end
			end

			if arg_267_1.time_ >= var_270_2 + var_270_3 and arg_267_1.time_ < var_270_2 + var_270_3 + arg_270_0 and arg_267_1.var_.characterEffect1029ui_story then
				local var_270_6 = 0.5

				arg_267_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1029ui_story.fillRatio = var_270_6
			end

			local var_270_7 = arg_267_1.actors_["10014ui_story"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.characterEffect10014ui_story == nil then
				arg_267_1.var_.characterEffect10014ui_story = var_270_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_9 = 0.200000002980232

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.characterEffect10014ui_story then
					arg_267_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.characterEffect10014ui_story then
				arg_267_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_270_11 = 0
			local var_270_12 = 0.5

			if var_270_11 < arg_267_1.time_ and arg_267_1.time_ <= var_270_11 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_13 = arg_267_1:FormatText(StoryNameCfg[264].name)

				arg_267_1.leftNameTxt_.text = var_270_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_14 = arg_267_1:GetWordFromCfg(121501066)
				local var_270_15 = arg_267_1:FormatText(var_270_14.content)

				arg_267_1.text_.text = var_270_15

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_16 = 20
				local var_270_17 = utf8.len(var_270_15)
				local var_270_18 = var_270_16 <= 0 and var_270_12 or var_270_12 * (var_270_17 / var_270_16)

				if var_270_18 > 0 and var_270_12 < var_270_18 then
					arg_267_1.talkMaxDuration = var_270_18

					if var_270_18 + var_270_11 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_18 + var_270_11
					end
				end

				arg_267_1.text_.text = var_270_15
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501066", "story_v_out_121501.awb") ~= 0 then
					local var_270_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501066", "story_v_out_121501.awb") / 1000

					if var_270_19 + var_270_11 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_11
					end

					if var_270_14.prefab_name ~= "" and arg_267_1.actors_[var_270_14.prefab_name] ~= nil then
						local var_270_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_14.prefab_name].transform, "story_v_out_121501", "121501066", "story_v_out_121501.awb")

						arg_267_1:RecordAudio("121501066", var_270_20)
						arg_267_1:RecordAudio("121501066", var_270_20)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_121501", "121501066", "story_v_out_121501.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_121501", "121501066", "story_v_out_121501.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_21 = math.max(var_270_12, arg_267_1.talkMaxDuration)

			if var_270_11 <= arg_267_1.time_ and arg_267_1.time_ < var_270_11 + var_270_21 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_11) / var_270_21

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_11 + var_270_21 and arg_267_1.time_ < var_270_11 + var_270_21 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play121501067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 121501067
		arg_271_1.duration_ = 6.7

		local var_271_0 = {
			ja = 6.7,
			ko = 4.466,
			zh = 4.466
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play121501068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_274_1 = 0
			local var_274_2 = 0.6

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_3 = arg_271_1:FormatText(StoryNameCfg[264].name)

				arg_271_1.leftNameTxt_.text = var_274_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_4 = arg_271_1:GetWordFromCfg(121501067)
				local var_274_5 = arg_271_1:FormatText(var_274_4.content)

				arg_271_1.text_.text = var_274_5

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_6 = 24
				local var_274_7 = utf8.len(var_274_5)
				local var_274_8 = var_274_6 <= 0 and var_274_2 or var_274_2 * (var_274_7 / var_274_6)

				if var_274_8 > 0 and var_274_2 < var_274_8 then
					arg_271_1.talkMaxDuration = var_274_8

					if var_274_8 + var_274_1 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_1
					end
				end

				arg_271_1.text_.text = var_274_5
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501067", "story_v_out_121501.awb") ~= 0 then
					local var_274_9 = manager.audio:GetVoiceLength("story_v_out_121501", "121501067", "story_v_out_121501.awb") / 1000

					if var_274_9 + var_274_1 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_9 + var_274_1
					end

					if var_274_4.prefab_name ~= "" and arg_271_1.actors_[var_274_4.prefab_name] ~= nil then
						local var_274_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_4.prefab_name].transform, "story_v_out_121501", "121501067", "story_v_out_121501.awb")

						arg_271_1:RecordAudio("121501067", var_274_10)
						arg_271_1:RecordAudio("121501067", var_274_10)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_121501", "121501067", "story_v_out_121501.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_121501", "121501067", "story_v_out_121501.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_11 = math.max(var_274_2, arg_271_1.talkMaxDuration)

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_11 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_1) / var_274_11

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_1 + var_274_11 and arg_271_1.time_ < var_274_1 + var_274_11 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play121501068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 121501068
		arg_275_1.duration_ = 2.866

		local var_275_0 = {
			ja = 2.866,
			ko = 2.8,
			zh = 2.8
		}
		local var_275_1 = manager.audio:GetLocalizationFlag()

		if var_275_0[var_275_1] ~= nil then
			arg_275_1.duration_ = var_275_0[var_275_1]
		end

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play121501069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1029ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1029ui_story == nil then
				arg_275_1.var_.characterEffect1029ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.200000002980232

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1029ui_story then
					arg_275_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1029ui_story then
				arg_275_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_278_4 = 0

			if var_278_4 < arg_275_1.time_ and arg_275_1.time_ <= var_278_4 + arg_278_0 then
				arg_275_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action452")
			end

			local var_278_5 = 0

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 then
				arg_275_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_278_6 = arg_275_1.actors_["10014ui_story"]
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 and arg_275_1.var_.characterEffect10014ui_story == nil then
				arg_275_1.var_.characterEffect10014ui_story = var_278_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_8 = 0.200000002980232

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_8 then
				local var_278_9 = (arg_275_1.time_ - var_278_7) / var_278_8

				if arg_275_1.var_.characterEffect10014ui_story then
					local var_278_10 = Mathf.Lerp(0, 0.5, var_278_9)

					arg_275_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_275_1.var_.characterEffect10014ui_story.fillRatio = var_278_10
				end
			end

			if arg_275_1.time_ >= var_278_7 + var_278_8 and arg_275_1.time_ < var_278_7 + var_278_8 + arg_278_0 and arg_275_1.var_.characterEffect10014ui_story then
				local var_278_11 = 0.5

				arg_275_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_275_1.var_.characterEffect10014ui_story.fillRatio = var_278_11
			end

			local var_278_12 = 0
			local var_278_13 = 0.35

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_14 = arg_275_1:FormatText(StoryNameCfg[319].name)

				arg_275_1.leftNameTxt_.text = var_278_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_15 = arg_275_1:GetWordFromCfg(121501068)
				local var_278_16 = arg_275_1:FormatText(var_278_15.content)

				arg_275_1.text_.text = var_278_16

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_17 = 14
				local var_278_18 = utf8.len(var_278_16)
				local var_278_19 = var_278_17 <= 0 and var_278_13 or var_278_13 * (var_278_18 / var_278_17)

				if var_278_19 > 0 and var_278_13 < var_278_19 then
					arg_275_1.talkMaxDuration = var_278_19

					if var_278_19 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_19 + var_278_12
					end
				end

				arg_275_1.text_.text = var_278_16
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501068", "story_v_out_121501.awb") ~= 0 then
					local var_278_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501068", "story_v_out_121501.awb") / 1000

					if var_278_20 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_12
					end

					if var_278_15.prefab_name ~= "" and arg_275_1.actors_[var_278_15.prefab_name] ~= nil then
						local var_278_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_15.prefab_name].transform, "story_v_out_121501", "121501068", "story_v_out_121501.awb")

						arg_275_1:RecordAudio("121501068", var_278_21)
						arg_275_1:RecordAudio("121501068", var_278_21)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_121501", "121501068", "story_v_out_121501.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_121501", "121501068", "story_v_out_121501.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_22 = math.max(var_278_13, arg_275_1.talkMaxDuration)

			if var_278_12 <= arg_275_1.time_ and arg_275_1.time_ < var_278_12 + var_278_22 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_12) / var_278_22

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_12 + var_278_22 and arg_275_1.time_ < var_278_12 + var_278_22 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play121501069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 121501069
		arg_279_1.duration_ = 17.2

		local var_279_0 = {
			ja = 17.2,
			ko = 9.366,
			zh = 9.366
		}
		local var_279_1 = manager.audio:GetLocalizationFlag()

		if var_279_0[var_279_1] ~= nil then
			arg_279_1.duration_ = var_279_0[var_279_1]
		end

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play121501070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_282_1 = arg_279_1.actors_["1029ui_story"]
			local var_282_2 = 0

			if var_282_2 < arg_279_1.time_ and arg_279_1.time_ <= var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1029ui_story == nil then
				arg_279_1.var_.characterEffect1029ui_story = var_282_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_3 = 0.200000002980232

			if var_282_2 <= arg_279_1.time_ and arg_279_1.time_ < var_282_2 + var_282_3 then
				local var_282_4 = (arg_279_1.time_ - var_282_2) / var_282_3

				if arg_279_1.var_.characterEffect1029ui_story then
					local var_282_5 = Mathf.Lerp(0, 0.5, var_282_4)

					arg_279_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1029ui_story.fillRatio = var_282_5
				end
			end

			if arg_279_1.time_ >= var_282_2 + var_282_3 and arg_279_1.time_ < var_282_2 + var_282_3 + arg_282_0 and arg_279_1.var_.characterEffect1029ui_story then
				local var_282_6 = 0.5

				arg_279_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1029ui_story.fillRatio = var_282_6
			end

			local var_282_7 = arg_279_1.actors_["10014ui_story"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect10014ui_story == nil then
				arg_279_1.var_.characterEffect10014ui_story = var_282_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_9 = 0.200000002980232

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.characterEffect10014ui_story then
					arg_279_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.characterEffect10014ui_story then
				arg_279_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_282_11 = 0
			local var_282_12 = 1.025

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_13 = arg_279_1:FormatText(StoryNameCfg[264].name)

				arg_279_1.leftNameTxt_.text = var_282_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_14 = arg_279_1:GetWordFromCfg(121501069)
				local var_282_15 = arg_279_1:FormatText(var_282_14.content)

				arg_279_1.text_.text = var_282_15

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_16 = 40
				local var_282_17 = utf8.len(var_282_15)
				local var_282_18 = var_282_16 <= 0 and var_282_12 or var_282_12 * (var_282_17 / var_282_16)

				if var_282_18 > 0 and var_282_12 < var_282_18 then
					arg_279_1.talkMaxDuration = var_282_18

					if var_282_18 + var_282_11 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_18 + var_282_11
					end
				end

				arg_279_1.text_.text = var_282_15
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501069", "story_v_out_121501.awb") ~= 0 then
					local var_282_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501069", "story_v_out_121501.awb") / 1000

					if var_282_19 + var_282_11 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_11
					end

					if var_282_14.prefab_name ~= "" and arg_279_1.actors_[var_282_14.prefab_name] ~= nil then
						local var_282_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_14.prefab_name].transform, "story_v_out_121501", "121501069", "story_v_out_121501.awb")

						arg_279_1:RecordAudio("121501069", var_282_20)
						arg_279_1:RecordAudio("121501069", var_282_20)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_121501", "121501069", "story_v_out_121501.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_121501", "121501069", "story_v_out_121501.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_21 = math.max(var_282_12, arg_279_1.talkMaxDuration)

			if var_282_11 <= arg_279_1.time_ and arg_279_1.time_ < var_282_11 + var_282_21 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_11) / var_282_21

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_11 + var_282_21 and arg_279_1.time_ < var_282_11 + var_282_21 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play121501070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 121501070
		arg_283_1.duration_ = 14

		local var_283_0 = {
			ja = 14,
			ko = 7.633,
			zh = 7.633
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play121501071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.925

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[264].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(121501070)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 37
				local var_286_6 = utf8.len(var_286_4)
				local var_286_7 = var_286_5 <= 0 and var_286_1 or var_286_1 * (var_286_6 / var_286_5)

				if var_286_7 > 0 and var_286_1 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_4
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501070", "story_v_out_121501.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501070", "story_v_out_121501.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_out_121501", "121501070", "story_v_out_121501.awb")

						arg_283_1:RecordAudio("121501070", var_286_9)
						arg_283_1:RecordAudio("121501070", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_121501", "121501070", "story_v_out_121501.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_121501", "121501070", "story_v_out_121501.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_10 and arg_283_1.time_ < var_286_0 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play121501071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 121501071
		arg_287_1.duration_ = 2.233333333332

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play121501072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_2")
			end

			local var_290_1 = arg_287_1.actors_["1029ui_story"]
			local var_290_2 = 0

			if var_290_2 < arg_287_1.time_ and arg_287_1.time_ <= var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1029ui_story == nil then
				arg_287_1.var_.characterEffect1029ui_story = var_290_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_3 = 0.200000002980232

			if var_290_2 <= arg_287_1.time_ and arg_287_1.time_ < var_290_2 + var_290_3 then
				local var_290_4 = (arg_287_1.time_ - var_290_2) / var_290_3

				if arg_287_1.var_.characterEffect1029ui_story then
					arg_287_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_2 + var_290_3 and arg_287_1.time_ < var_290_2 + var_290_3 + arg_290_0 and arg_287_1.var_.characterEffect1029ui_story then
				arg_287_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_290_5 = arg_287_1.actors_["10014ui_story"]
			local var_290_6 = 0

			if var_290_6 < arg_287_1.time_ and arg_287_1.time_ <= var_290_6 + arg_290_0 and arg_287_1.var_.characterEffect10014ui_story == nil then
				arg_287_1.var_.characterEffect10014ui_story = var_290_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_7 = 0.200000002980232

			if var_290_6 <= arg_287_1.time_ and arg_287_1.time_ < var_290_6 + var_290_7 then
				local var_290_8 = (arg_287_1.time_ - var_290_6) / var_290_7

				if arg_287_1.var_.characterEffect10014ui_story then
					local var_290_9 = Mathf.Lerp(0, 0.5, var_290_8)

					arg_287_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_287_1.var_.characterEffect10014ui_story.fillRatio = var_290_9
				end
			end

			if arg_287_1.time_ >= var_290_6 + var_290_7 and arg_287_1.time_ < var_290_6 + var_290_7 + arg_290_0 and arg_287_1.var_.characterEffect10014ui_story then
				local var_290_10 = 0.5

				arg_287_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_287_1.var_.characterEffect10014ui_story.fillRatio = var_290_10
			end

			local var_290_11 = 0
			local var_290_12 = 0.225

			if var_290_11 < arg_287_1.time_ and arg_287_1.time_ <= var_290_11 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_13 = arg_287_1:FormatText(StoryNameCfg[319].name)

				arg_287_1.leftNameTxt_.text = var_290_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_14 = arg_287_1:GetWordFromCfg(121501071)
				local var_290_15 = arg_287_1:FormatText(var_290_14.content)

				arg_287_1.text_.text = var_290_15

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_16 = 9
				local var_290_17 = utf8.len(var_290_15)
				local var_290_18 = var_290_16 <= 0 and var_290_12 or var_290_12 * (var_290_17 / var_290_16)

				if var_290_18 > 0 and var_290_12 < var_290_18 then
					arg_287_1.talkMaxDuration = var_290_18

					if var_290_18 + var_290_11 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_18 + var_290_11
					end
				end

				arg_287_1.text_.text = var_290_15
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501071", "story_v_out_121501.awb") ~= 0 then
					local var_290_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501071", "story_v_out_121501.awb") / 1000

					if var_290_19 + var_290_11 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_11
					end

					if var_290_14.prefab_name ~= "" and arg_287_1.actors_[var_290_14.prefab_name] ~= nil then
						local var_290_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_14.prefab_name].transform, "story_v_out_121501", "121501071", "story_v_out_121501.awb")

						arg_287_1:RecordAudio("121501071", var_290_20)
						arg_287_1:RecordAudio("121501071", var_290_20)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_121501", "121501071", "story_v_out_121501.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_121501", "121501071", "story_v_out_121501.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_21 = math.max(var_290_12, arg_287_1.talkMaxDuration)

			if var_290_11 <= arg_287_1.time_ and arg_287_1.time_ < var_290_11 + var_290_21 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_11) / var_290_21

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_11 + var_290_21 and arg_287_1.time_ < var_290_11 + var_290_21 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play121501072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 121501072
		arg_291_1.duration_ = 1.3

		local var_291_0 = {
			ja = 1.3,
			ko = 0.999999999999,
			zh = 0.999999999999
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play121501073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1029ui_story"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.characterEffect1029ui_story == nil then
				arg_291_1.var_.characterEffect1029ui_story = var_294_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_2 = 0.200000002980232

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.characterEffect1029ui_story then
					local var_294_4 = Mathf.Lerp(0, 0.5, var_294_3)

					arg_291_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1029ui_story.fillRatio = var_294_4
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.characterEffect1029ui_story then
				local var_294_5 = 0.5

				arg_291_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1029ui_story.fillRatio = var_294_5
			end

			local var_294_6 = arg_291_1.actors_["10014ui_story"]
			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 and arg_291_1.var_.characterEffect10014ui_story == nil then
				arg_291_1.var_.characterEffect10014ui_story = var_294_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_8 = 0.200000002980232

			if var_294_7 <= arg_291_1.time_ and arg_291_1.time_ < var_294_7 + var_294_8 then
				local var_294_9 = (arg_291_1.time_ - var_294_7) / var_294_8

				if arg_291_1.var_.characterEffect10014ui_story then
					arg_291_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_7 + var_294_8 and arg_291_1.time_ < var_294_7 + var_294_8 + arg_294_0 and arg_291_1.var_.characterEffect10014ui_story then
				arg_291_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_294_10 = 0
			local var_294_11 = 0.125

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_12 = arg_291_1:FormatText(StoryNameCfg[264].name)

				arg_291_1.leftNameTxt_.text = var_294_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_13 = arg_291_1:GetWordFromCfg(121501072)
				local var_294_14 = arg_291_1:FormatText(var_294_13.content)

				arg_291_1.text_.text = var_294_14

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_15 = 5
				local var_294_16 = utf8.len(var_294_14)
				local var_294_17 = var_294_15 <= 0 and var_294_11 or var_294_11 * (var_294_16 / var_294_15)

				if var_294_17 > 0 and var_294_11 < var_294_17 then
					arg_291_1.talkMaxDuration = var_294_17

					if var_294_17 + var_294_10 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_17 + var_294_10
					end
				end

				arg_291_1.text_.text = var_294_14
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501072", "story_v_out_121501.awb") ~= 0 then
					local var_294_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501072", "story_v_out_121501.awb") / 1000

					if var_294_18 + var_294_10 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_18 + var_294_10
					end

					if var_294_13.prefab_name ~= "" and arg_291_1.actors_[var_294_13.prefab_name] ~= nil then
						local var_294_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_13.prefab_name].transform, "story_v_out_121501", "121501072", "story_v_out_121501.awb")

						arg_291_1:RecordAudio("121501072", var_294_19)
						arg_291_1:RecordAudio("121501072", var_294_19)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_121501", "121501072", "story_v_out_121501.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_121501", "121501072", "story_v_out_121501.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_20 = math.max(var_294_11, arg_291_1.talkMaxDuration)

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_20 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_10) / var_294_20

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_10 + var_294_20 and arg_291_1.time_ < var_294_10 + var_294_20 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play121501073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 121501073
		arg_295_1.duration_ = 2.033

		local var_295_0 = {
			ja = 2.033,
			ko = 1.766,
			zh = 1.766
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play121501074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1029ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1029ui_story == nil then
				arg_295_1.var_.characterEffect1029ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1029ui_story then
					arg_295_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1029ui_story then
				arg_295_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_298_4 = arg_295_1.actors_["10014ui_story"]
			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 and arg_295_1.var_.characterEffect10014ui_story == nil then
				arg_295_1.var_.characterEffect10014ui_story = var_298_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_6 = 0.200000002980232

			if var_298_5 <= arg_295_1.time_ and arg_295_1.time_ < var_298_5 + var_298_6 then
				local var_298_7 = (arg_295_1.time_ - var_298_5) / var_298_6

				if arg_295_1.var_.characterEffect10014ui_story then
					local var_298_8 = Mathf.Lerp(0, 0.5, var_298_7)

					arg_295_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_295_1.var_.characterEffect10014ui_story.fillRatio = var_298_8
				end
			end

			if arg_295_1.time_ >= var_298_5 + var_298_6 and arg_295_1.time_ < var_298_5 + var_298_6 + arg_298_0 and arg_295_1.var_.characterEffect10014ui_story then
				local var_298_9 = 0.5

				arg_295_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_295_1.var_.characterEffect10014ui_story.fillRatio = var_298_9
			end

			local var_298_10 = 0
			local var_298_11 = 0.175

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_12 = arg_295_1:FormatText(StoryNameCfg[319].name)

				arg_295_1.leftNameTxt_.text = var_298_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_13 = arg_295_1:GetWordFromCfg(121501073)
				local var_298_14 = arg_295_1:FormatText(var_298_13.content)

				arg_295_1.text_.text = var_298_14

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_15 = 7
				local var_298_16 = utf8.len(var_298_14)
				local var_298_17 = var_298_15 <= 0 and var_298_11 or var_298_11 * (var_298_16 / var_298_15)

				if var_298_17 > 0 and var_298_11 < var_298_17 then
					arg_295_1.talkMaxDuration = var_298_17

					if var_298_17 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_17 + var_298_10
					end
				end

				arg_295_1.text_.text = var_298_14
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501073", "story_v_out_121501.awb") ~= 0 then
					local var_298_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501073", "story_v_out_121501.awb") / 1000

					if var_298_18 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_18 + var_298_10
					end

					if var_298_13.prefab_name ~= "" and arg_295_1.actors_[var_298_13.prefab_name] ~= nil then
						local var_298_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_13.prefab_name].transform, "story_v_out_121501", "121501073", "story_v_out_121501.awb")

						arg_295_1:RecordAudio("121501073", var_298_19)
						arg_295_1:RecordAudio("121501073", var_298_19)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_121501", "121501073", "story_v_out_121501.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_121501", "121501073", "story_v_out_121501.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_20 = math.max(var_298_11, arg_295_1.talkMaxDuration)

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_20 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_10) / var_298_20

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_10 + var_298_20 and arg_295_1.time_ < var_298_10 + var_298_20 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play121501074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 121501074
		arg_299_1.duration_ = 6.7

		local var_299_0 = {
			ja = 4.666,
			ko = 6.7,
			zh = 6.7
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play121501075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.775

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[319].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(121501074)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501074", "story_v_out_121501.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501074", "story_v_out_121501.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_121501", "121501074", "story_v_out_121501.awb")

						arg_299_1:RecordAudio("121501074", var_302_9)
						arg_299_1:RecordAudio("121501074", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_121501", "121501074", "story_v_out_121501.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_121501", "121501074", "story_v_out_121501.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play121501075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 121501075
		arg_303_1.duration_ = 4.466

		local var_303_0 = {
			ja = 3.433,
			ko = 4.466,
			zh = 4.466
		}
		local var_303_1 = manager.audio:GetLocalizationFlag()

		if var_303_0[var_303_1] ~= nil then
			arg_303_1.duration_ = var_303_0[var_303_1]
		end

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play121501076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014actionlink/10014action424")
			end

			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_306_2 = arg_303_1.actors_["1029ui_story"]
			local var_306_3 = 0

			if var_306_3 < arg_303_1.time_ and arg_303_1.time_ <= var_306_3 + arg_306_0 and arg_303_1.var_.characterEffect1029ui_story == nil then
				arg_303_1.var_.characterEffect1029ui_story = var_306_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_4 = 0.200000002980232

			if var_306_3 <= arg_303_1.time_ and arg_303_1.time_ < var_306_3 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_3) / var_306_4

				if arg_303_1.var_.characterEffect1029ui_story then
					local var_306_6 = Mathf.Lerp(0, 0.5, var_306_5)

					arg_303_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1029ui_story.fillRatio = var_306_6
				end
			end

			if arg_303_1.time_ >= var_306_3 + var_306_4 and arg_303_1.time_ < var_306_3 + var_306_4 + arg_306_0 and arg_303_1.var_.characterEffect1029ui_story then
				local var_306_7 = 0.5

				arg_303_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1029ui_story.fillRatio = var_306_7
			end

			local var_306_8 = arg_303_1.actors_["10014ui_story"]
			local var_306_9 = 0

			if var_306_9 < arg_303_1.time_ and arg_303_1.time_ <= var_306_9 + arg_306_0 and arg_303_1.var_.characterEffect10014ui_story == nil then
				arg_303_1.var_.characterEffect10014ui_story = var_306_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_10 = 0.200000002980232

			if var_306_9 <= arg_303_1.time_ and arg_303_1.time_ < var_306_9 + var_306_10 then
				local var_306_11 = (arg_303_1.time_ - var_306_9) / var_306_10

				if arg_303_1.var_.characterEffect10014ui_story then
					arg_303_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_9 + var_306_10 and arg_303_1.time_ < var_306_9 + var_306_10 + arg_306_0 and arg_303_1.var_.characterEffect10014ui_story then
				arg_303_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_306_12 = 0
			local var_306_13 = 0.5

			if var_306_12 < arg_303_1.time_ and arg_303_1.time_ <= var_306_12 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_14 = arg_303_1:FormatText(StoryNameCfg[264].name)

				arg_303_1.leftNameTxt_.text = var_306_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_15 = arg_303_1:GetWordFromCfg(121501075)
				local var_306_16 = arg_303_1:FormatText(var_306_15.content)

				arg_303_1.text_.text = var_306_16

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_17 = 20
				local var_306_18 = utf8.len(var_306_16)
				local var_306_19 = var_306_17 <= 0 and var_306_13 or var_306_13 * (var_306_18 / var_306_17)

				if var_306_19 > 0 and var_306_13 < var_306_19 then
					arg_303_1.talkMaxDuration = var_306_19

					if var_306_19 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_19 + var_306_12
					end
				end

				arg_303_1.text_.text = var_306_16
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501075", "story_v_out_121501.awb") ~= 0 then
					local var_306_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501075", "story_v_out_121501.awb") / 1000

					if var_306_20 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_20 + var_306_12
					end

					if var_306_15.prefab_name ~= "" and arg_303_1.actors_[var_306_15.prefab_name] ~= nil then
						local var_306_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_15.prefab_name].transform, "story_v_out_121501", "121501075", "story_v_out_121501.awb")

						arg_303_1:RecordAudio("121501075", var_306_21)
						arg_303_1:RecordAudio("121501075", var_306_21)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_121501", "121501075", "story_v_out_121501.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_121501", "121501075", "story_v_out_121501.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_22 = math.max(var_306_13, arg_303_1.talkMaxDuration)

			if var_306_12 <= arg_303_1.time_ and arg_303_1.time_ < var_306_12 + var_306_22 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_12) / var_306_22

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_12 + var_306_22 and arg_303_1.time_ < var_306_12 + var_306_22 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play121501076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 121501076
		arg_307_1.duration_ = 5.1

		local var_307_0 = {
			ja = 5.1,
			ko = 4.366,
			zh = 4.366
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play121501077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1029ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1029ui_story == nil then
				arg_307_1.var_.characterEffect1029ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.200000002980232

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1029ui_story then
					arg_307_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1029ui_story then
				arg_307_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_310_4 = 0

			if var_310_4 < arg_307_1.time_ and arg_307_1.time_ <= var_310_4 + arg_310_0 then
				arg_307_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 then
				arg_307_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_310_6 = arg_307_1.actors_["10014ui_story"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.characterEffect10014ui_story == nil then
				arg_307_1.var_.characterEffect10014ui_story = var_310_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_8 = 0.200000002980232

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.characterEffect10014ui_story then
					local var_310_10 = Mathf.Lerp(0, 0.5, var_310_9)

					arg_307_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_307_1.var_.characterEffect10014ui_story.fillRatio = var_310_10
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.characterEffect10014ui_story then
				local var_310_11 = 0.5

				arg_307_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_307_1.var_.characterEffect10014ui_story.fillRatio = var_310_11
			end

			local var_310_12 = 0
			local var_310_13 = 0.425

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[319].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(121501076)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 17
				local var_310_18 = utf8.len(var_310_16)
				local var_310_19 = var_310_17 <= 0 and var_310_13 or var_310_13 * (var_310_18 / var_310_17)

				if var_310_19 > 0 and var_310_13 < var_310_19 then
					arg_307_1.talkMaxDuration = var_310_19

					if var_310_19 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_19 + var_310_12
					end
				end

				arg_307_1.text_.text = var_310_16
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501076", "story_v_out_121501.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501076", "story_v_out_121501.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_121501", "121501076", "story_v_out_121501.awb")

						arg_307_1:RecordAudio("121501076", var_310_21)
						arg_307_1:RecordAudio("121501076", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_121501", "121501076", "story_v_out_121501.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_121501", "121501076", "story_v_out_121501.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_22 = math.max(var_310_13, arg_307_1.talkMaxDuration)

			if var_310_12 <= arg_307_1.time_ and arg_307_1.time_ < var_310_12 + var_310_22 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_12) / var_310_22

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_12 + var_310_22 and arg_307_1.time_ < var_310_12 + var_310_22 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play121501077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 121501077
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play121501078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1029ui_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.characterEffect1029ui_story == nil then
				arg_311_1.var_.characterEffect1029ui_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.200000002980232

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect1029ui_story then
					local var_314_4 = Mathf.Lerp(0, 0.5, var_314_3)

					arg_311_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1029ui_story.fillRatio = var_314_4
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1029ui_story then
				local var_314_5 = 0.5

				arg_311_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1029ui_story.fillRatio = var_314_5
			end

			local var_314_6 = 0
			local var_314_7 = 0.875

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_8 = arg_311_1:GetWordFromCfg(121501077)
				local var_314_9 = arg_311_1:FormatText(var_314_8.content)

				arg_311_1.text_.text = var_314_9

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_10 = 35
				local var_314_11 = utf8.len(var_314_9)
				local var_314_12 = var_314_10 <= 0 and var_314_7 or var_314_7 * (var_314_11 / var_314_10)

				if var_314_12 > 0 and var_314_7 < var_314_12 then
					arg_311_1.talkMaxDuration = var_314_12

					if var_314_12 + var_314_6 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_12 + var_314_6
					end
				end

				arg_311_1.text_.text = var_314_9
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_13 = math.max(var_314_7, arg_311_1.talkMaxDuration)

			if var_314_6 <= arg_311_1.time_ and arg_311_1.time_ < var_314_6 + var_314_13 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_6) / var_314_13

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_6 + var_314_13 and arg_311_1.time_ < var_314_6 + var_314_13 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play121501078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 121501078
		arg_315_1.duration_ = 10.266

		local var_315_0 = {
			ja = 10.266,
			ko = 3.5,
			zh = 3.5
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play121501079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action4_2")
			end

			local var_318_1 = arg_315_1.actors_["1029ui_story"]
			local var_318_2 = 0

			if var_318_2 < arg_315_1.time_ and arg_315_1.time_ <= var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect1029ui_story == nil then
				arg_315_1.var_.characterEffect1029ui_story = var_318_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_3 = 0.200000002980232

			if var_318_2 <= arg_315_1.time_ and arg_315_1.time_ < var_318_2 + var_318_3 then
				local var_318_4 = (arg_315_1.time_ - var_318_2) / var_318_3

				if arg_315_1.var_.characterEffect1029ui_story then
					local var_318_5 = Mathf.Lerp(0, 0.5, var_318_4)

					arg_315_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1029ui_story.fillRatio = var_318_5
				end
			end

			if arg_315_1.time_ >= var_318_2 + var_318_3 and arg_315_1.time_ < var_318_2 + var_318_3 + arg_318_0 and arg_315_1.var_.characterEffect1029ui_story then
				local var_318_6 = 0.5

				arg_315_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1029ui_story.fillRatio = var_318_6
			end

			local var_318_7 = arg_315_1.actors_["10014ui_story"]
			local var_318_8 = 0

			if var_318_8 < arg_315_1.time_ and arg_315_1.time_ <= var_318_8 + arg_318_0 and arg_315_1.var_.characterEffect10014ui_story == nil then
				arg_315_1.var_.characterEffect10014ui_story = var_318_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_9 = 0.200000002980232

			if var_318_8 <= arg_315_1.time_ and arg_315_1.time_ < var_318_8 + var_318_9 then
				local var_318_10 = (arg_315_1.time_ - var_318_8) / var_318_9

				if arg_315_1.var_.characterEffect10014ui_story then
					arg_315_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_8 + var_318_9 and arg_315_1.time_ < var_318_8 + var_318_9 + arg_318_0 and arg_315_1.var_.characterEffect10014ui_story then
				arg_315_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_318_11 = 0
			local var_318_12 = 0.45

			if var_318_11 < arg_315_1.time_ and arg_315_1.time_ <= var_318_11 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_13 = arg_315_1:FormatText(StoryNameCfg[264].name)

				arg_315_1.leftNameTxt_.text = var_318_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_14 = arg_315_1:GetWordFromCfg(121501078)
				local var_318_15 = arg_315_1:FormatText(var_318_14.content)

				arg_315_1.text_.text = var_318_15

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_16 = 18
				local var_318_17 = utf8.len(var_318_15)
				local var_318_18 = var_318_16 <= 0 and var_318_12 or var_318_12 * (var_318_17 / var_318_16)

				if var_318_18 > 0 and var_318_12 < var_318_18 then
					arg_315_1.talkMaxDuration = var_318_18

					if var_318_18 + var_318_11 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_18 + var_318_11
					end
				end

				arg_315_1.text_.text = var_318_15
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501078", "story_v_out_121501.awb") ~= 0 then
					local var_318_19 = manager.audio:GetVoiceLength("story_v_out_121501", "121501078", "story_v_out_121501.awb") / 1000

					if var_318_19 + var_318_11 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_19 + var_318_11
					end

					if var_318_14.prefab_name ~= "" and arg_315_1.actors_[var_318_14.prefab_name] ~= nil then
						local var_318_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_14.prefab_name].transform, "story_v_out_121501", "121501078", "story_v_out_121501.awb")

						arg_315_1:RecordAudio("121501078", var_318_20)
						arg_315_1:RecordAudio("121501078", var_318_20)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_121501", "121501078", "story_v_out_121501.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_121501", "121501078", "story_v_out_121501.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_21 = math.max(var_318_12, arg_315_1.talkMaxDuration)

			if var_318_11 <= arg_315_1.time_ and arg_315_1.time_ < var_318_11 + var_318_21 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_11) / var_318_21

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_11 + var_318_21 and arg_315_1.time_ < var_318_11 + var_318_21 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play121501079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 121501079
		arg_319_1.duration_ = 9.033

		local var_319_0 = {
			ja = 9.033,
			ko = 6.6,
			zh = 6.6
		}
		local var_319_1 = manager.audio:GetLocalizationFlag()

		if var_319_0[var_319_1] ~= nil then
			arg_319_1.duration_ = var_319_0[var_319_1]
		end

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play121501080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 0.825

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_2 = arg_319_1:FormatText(StoryNameCfg[264].name)

				arg_319_1.leftNameTxt_.text = var_322_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_3 = arg_319_1:GetWordFromCfg(121501079)
				local var_322_4 = arg_319_1:FormatText(var_322_3.content)

				arg_319_1.text_.text = var_322_4

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_5 = 33
				local var_322_6 = utf8.len(var_322_4)
				local var_322_7 = var_322_5 <= 0 and var_322_1 or var_322_1 * (var_322_6 / var_322_5)

				if var_322_7 > 0 and var_322_1 < var_322_7 then
					arg_319_1.talkMaxDuration = var_322_7

					if var_322_7 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_7 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_4
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501079", "story_v_out_121501.awb") ~= 0 then
					local var_322_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501079", "story_v_out_121501.awb") / 1000

					if var_322_8 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_8 + var_322_0
					end

					if var_322_3.prefab_name ~= "" and arg_319_1.actors_[var_322_3.prefab_name] ~= nil then
						local var_322_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_3.prefab_name].transform, "story_v_out_121501", "121501079", "story_v_out_121501.awb")

						arg_319_1:RecordAudio("121501079", var_322_9)
						arg_319_1:RecordAudio("121501079", var_322_9)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_121501", "121501079", "story_v_out_121501.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_121501", "121501079", "story_v_out_121501.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_10 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_10 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_10

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_10 and arg_319_1.time_ < var_322_0 + var_322_10 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play121501080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 121501080
		arg_323_1.duration_ = 3.9

		local var_323_0 = {
			ja = 3.9,
			ko = 1.833,
			zh = 1.833
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play121501081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1029ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1029ui_story == nil then
				arg_323_1.var_.characterEffect1029ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.200000002980232

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1029ui_story then
					arg_323_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1029ui_story then
				arg_323_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_326_4 = arg_323_1.actors_["10014ui_story"]
			local var_326_5 = 0

			if var_326_5 < arg_323_1.time_ and arg_323_1.time_ <= var_326_5 + arg_326_0 and arg_323_1.var_.characterEffect10014ui_story == nil then
				arg_323_1.var_.characterEffect10014ui_story = var_326_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_6 = 0.200000002980232

			if var_326_5 <= arg_323_1.time_ and arg_323_1.time_ < var_326_5 + var_326_6 then
				local var_326_7 = (arg_323_1.time_ - var_326_5) / var_326_6

				if arg_323_1.var_.characterEffect10014ui_story then
					local var_326_8 = Mathf.Lerp(0, 0.5, var_326_7)

					arg_323_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_323_1.var_.characterEffect10014ui_story.fillRatio = var_326_8
				end
			end

			if arg_323_1.time_ >= var_326_5 + var_326_6 and arg_323_1.time_ < var_326_5 + var_326_6 + arg_326_0 and arg_323_1.var_.characterEffect10014ui_story then
				local var_326_9 = 0.5

				arg_323_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_323_1.var_.characterEffect10014ui_story.fillRatio = var_326_9
			end

			local var_326_10 = 0
			local var_326_11 = 0.2

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_12 = arg_323_1:FormatText(StoryNameCfg[319].name)

				arg_323_1.leftNameTxt_.text = var_326_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_13 = arg_323_1:GetWordFromCfg(121501080)
				local var_326_14 = arg_323_1:FormatText(var_326_13.content)

				arg_323_1.text_.text = var_326_14

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_15 = 8
				local var_326_16 = utf8.len(var_326_14)
				local var_326_17 = var_326_15 <= 0 and var_326_11 or var_326_11 * (var_326_16 / var_326_15)

				if var_326_17 > 0 and var_326_11 < var_326_17 then
					arg_323_1.talkMaxDuration = var_326_17

					if var_326_17 + var_326_10 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_17 + var_326_10
					end
				end

				arg_323_1.text_.text = var_326_14
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501080", "story_v_out_121501.awb") ~= 0 then
					local var_326_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501080", "story_v_out_121501.awb") / 1000

					if var_326_18 + var_326_10 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_18 + var_326_10
					end

					if var_326_13.prefab_name ~= "" and arg_323_1.actors_[var_326_13.prefab_name] ~= nil then
						local var_326_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_13.prefab_name].transform, "story_v_out_121501", "121501080", "story_v_out_121501.awb")

						arg_323_1:RecordAudio("121501080", var_326_19)
						arg_323_1:RecordAudio("121501080", var_326_19)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_121501", "121501080", "story_v_out_121501.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_121501", "121501080", "story_v_out_121501.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_20 = math.max(var_326_11, arg_323_1.talkMaxDuration)

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_20 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_10) / var_326_20

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_10 + var_326_20 and arg_323_1.time_ < var_326_10 + var_326_20 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play121501081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 121501081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play121501082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1029ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1029ui_story == nil then
				arg_327_1.var_.characterEffect1029ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1029ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1029ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1029ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1029ui_story.fillRatio = var_330_5
			end

			local var_330_6 = 0
			local var_330_7 = 1.2

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_8 = arg_327_1:GetWordFromCfg(121501081)
				local var_330_9 = arg_327_1:FormatText(var_330_8.content)

				arg_327_1.text_.text = var_330_9

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_10 = 48
				local var_330_11 = utf8.len(var_330_9)
				local var_330_12 = var_330_10 <= 0 and var_330_7 or var_330_7 * (var_330_11 / var_330_10)

				if var_330_12 > 0 and var_330_7 < var_330_12 then
					arg_327_1.talkMaxDuration = var_330_12

					if var_330_12 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_12 + var_330_6
					end
				end

				arg_327_1.text_.text = var_330_9
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_13 = math.max(var_330_7, arg_327_1.talkMaxDuration)

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_13 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_6) / var_330_13

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_6 + var_330_13 and arg_327_1.time_ < var_330_6 + var_330_13 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play121501082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 121501082
		arg_331_1.duration_ = 8.533

		local var_331_0 = {
			ja = 8.533,
			ko = 8.2,
			zh = 8.2
		}
		local var_331_1 = manager.audio:GetLocalizationFlag()

		if var_331_0[var_331_1] ~= nil then
			arg_331_1.duration_ = var_331_0[var_331_1]
		end

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play121501083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_334_2 = arg_331_1.actors_["10014ui_story"]
			local var_334_3 = 0

			if var_334_3 < arg_331_1.time_ and arg_331_1.time_ <= var_334_3 + arg_334_0 and arg_331_1.var_.characterEffect10014ui_story == nil then
				arg_331_1.var_.characterEffect10014ui_story = var_334_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_4 = 0.200000002980232

			if var_334_3 <= arg_331_1.time_ and arg_331_1.time_ < var_334_3 + var_334_4 then
				local var_334_5 = (arg_331_1.time_ - var_334_3) / var_334_4

				if arg_331_1.var_.characterEffect10014ui_story then
					arg_331_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_3 + var_334_4 and arg_331_1.time_ < var_334_3 + var_334_4 + arg_334_0 and arg_331_1.var_.characterEffect10014ui_story then
				arg_331_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_334_6 = 0
			local var_334_7 = 1.1

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[264].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(121501082)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501082", "story_v_out_121501.awb") ~= 0 then
					local var_334_14 = manager.audio:GetVoiceLength("story_v_out_121501", "121501082", "story_v_out_121501.awb") / 1000

					if var_334_14 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_14 + var_334_6
					end

					if var_334_9.prefab_name ~= "" and arg_331_1.actors_[var_334_9.prefab_name] ~= nil then
						local var_334_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_9.prefab_name].transform, "story_v_out_121501", "121501082", "story_v_out_121501.awb")

						arg_331_1:RecordAudio("121501082", var_334_15)
						arg_331_1:RecordAudio("121501082", var_334_15)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_121501", "121501082", "story_v_out_121501.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_121501", "121501082", "story_v_out_121501.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_16 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_16 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_16

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_16 and arg_331_1.time_ < var_334_6 + var_334_16 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play121501083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 121501083
		arg_335_1.duration_ = 14.7

		local var_335_0 = {
			ja = 14.7,
			ko = 9.966,
			zh = 9.966
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play121501084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_338_1 = 0
			local var_338_2 = 1.15

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_3 = arg_335_1:FormatText(StoryNameCfg[264].name)

				arg_335_1.leftNameTxt_.text = var_338_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_4 = arg_335_1:GetWordFromCfg(121501083)
				local var_338_5 = arg_335_1:FormatText(var_338_4.content)

				arg_335_1.text_.text = var_338_5

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_6 = 46
				local var_338_7 = utf8.len(var_338_5)
				local var_338_8 = var_338_6 <= 0 and var_338_2 or var_338_2 * (var_338_7 / var_338_6)

				if var_338_8 > 0 and var_338_2 < var_338_8 then
					arg_335_1.talkMaxDuration = var_338_8

					if var_338_8 + var_338_1 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_1
					end
				end

				arg_335_1.text_.text = var_338_5
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501083", "story_v_out_121501.awb") ~= 0 then
					local var_338_9 = manager.audio:GetVoiceLength("story_v_out_121501", "121501083", "story_v_out_121501.awb") / 1000

					if var_338_9 + var_338_1 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_9 + var_338_1
					end

					if var_338_4.prefab_name ~= "" and arg_335_1.actors_[var_338_4.prefab_name] ~= nil then
						local var_338_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_4.prefab_name].transform, "story_v_out_121501", "121501083", "story_v_out_121501.awb")

						arg_335_1:RecordAudio("121501083", var_338_10)
						arg_335_1:RecordAudio("121501083", var_338_10)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_121501", "121501083", "story_v_out_121501.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_121501", "121501083", "story_v_out_121501.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_11 = math.max(var_338_2, arg_335_1.talkMaxDuration)

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_11 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_1) / var_338_11

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_1 + var_338_11 and arg_335_1.time_ < var_338_1 + var_338_11 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play121501084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 121501084
		arg_339_1.duration_ = 2.4

		local var_339_0 = {
			ja = 2.4,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play121501085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_2")
			end

			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_2 = arg_339_1.actors_["1029ui_story"]
			local var_342_3 = 0

			if var_342_3 < arg_339_1.time_ and arg_339_1.time_ <= var_342_3 + arg_342_0 and arg_339_1.var_.characterEffect1029ui_story == nil then
				arg_339_1.var_.characterEffect1029ui_story = var_342_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_4 = 0.200000002980232

			if var_342_3 <= arg_339_1.time_ and arg_339_1.time_ < var_342_3 + var_342_4 then
				local var_342_5 = (arg_339_1.time_ - var_342_3) / var_342_4

				if arg_339_1.var_.characterEffect1029ui_story then
					arg_339_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_3 + var_342_4 and arg_339_1.time_ < var_342_3 + var_342_4 + arg_342_0 and arg_339_1.var_.characterEffect1029ui_story then
				arg_339_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_342_6 = arg_339_1.actors_["10014ui_story"]
			local var_342_7 = 0

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 and arg_339_1.var_.characterEffect10014ui_story == nil then
				arg_339_1.var_.characterEffect10014ui_story = var_342_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_8 = 0.200000002980232

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_8 then
				local var_342_9 = (arg_339_1.time_ - var_342_7) / var_342_8

				if arg_339_1.var_.characterEffect10014ui_story then
					local var_342_10 = Mathf.Lerp(0, 0.5, var_342_9)

					arg_339_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_339_1.var_.characterEffect10014ui_story.fillRatio = var_342_10
				end
			end

			if arg_339_1.time_ >= var_342_7 + var_342_8 and arg_339_1.time_ < var_342_7 + var_342_8 + arg_342_0 and arg_339_1.var_.characterEffect10014ui_story then
				local var_342_11 = 0.5

				arg_339_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_339_1.var_.characterEffect10014ui_story.fillRatio = var_342_11
			end

			local var_342_12 = 0
			local var_342_13 = 0.15

			if var_342_12 < arg_339_1.time_ and arg_339_1.time_ <= var_342_12 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_14 = arg_339_1:FormatText(StoryNameCfg[319].name)

				arg_339_1.leftNameTxt_.text = var_342_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_15 = arg_339_1:GetWordFromCfg(121501084)
				local var_342_16 = arg_339_1:FormatText(var_342_15.content)

				arg_339_1.text_.text = var_342_16

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_17 = 6
				local var_342_18 = utf8.len(var_342_16)
				local var_342_19 = var_342_17 <= 0 and var_342_13 or var_342_13 * (var_342_18 / var_342_17)

				if var_342_19 > 0 and var_342_13 < var_342_19 then
					arg_339_1.talkMaxDuration = var_342_19

					if var_342_19 + var_342_12 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_19 + var_342_12
					end
				end

				arg_339_1.text_.text = var_342_16
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501084", "story_v_out_121501.awb") ~= 0 then
					local var_342_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501084", "story_v_out_121501.awb") / 1000

					if var_342_20 + var_342_12 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_20 + var_342_12
					end

					if var_342_15.prefab_name ~= "" and arg_339_1.actors_[var_342_15.prefab_name] ~= nil then
						local var_342_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_15.prefab_name].transform, "story_v_out_121501", "121501084", "story_v_out_121501.awb")

						arg_339_1:RecordAudio("121501084", var_342_21)
						arg_339_1:RecordAudio("121501084", var_342_21)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_121501", "121501084", "story_v_out_121501.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_121501", "121501084", "story_v_out_121501.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_22 = math.max(var_342_13, arg_339_1.talkMaxDuration)

			if var_342_12 <= arg_339_1.time_ and arg_339_1.time_ < var_342_12 + var_342_22 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_12) / var_342_22

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_12 + var_342_22 and arg_339_1.time_ < var_342_12 + var_342_22 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play121501085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 121501085
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play121501086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1029ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1029ui_story == nil then
				arg_343_1.var_.characterEffect1029ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1029ui_story then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1029ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1029ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1029ui_story.fillRatio = var_346_5
			end

			local var_346_6 = 0
			local var_346_7 = 0.725

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_8 = arg_343_1:GetWordFromCfg(121501085)
				local var_346_9 = arg_343_1:FormatText(var_346_8.content)

				arg_343_1.text_.text = var_346_9

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_10 = 29
				local var_346_11 = utf8.len(var_346_9)
				local var_346_12 = var_346_10 <= 0 and var_346_7 or var_346_7 * (var_346_11 / var_346_10)

				if var_346_12 > 0 and var_346_7 < var_346_12 then
					arg_343_1.talkMaxDuration = var_346_12

					if var_346_12 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_12 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_9
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_13 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_13 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_13

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_13 and arg_343_1.time_ < var_346_6 + var_346_13 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play121501086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 121501086
		arg_347_1.duration_ = 7.533

		local var_347_0 = {
			ja = 5.166,
			ko = 7.533,
			zh = 7.533
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
				arg_347_0:Play121501087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10014ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect10014ui_story == nil then
				arg_347_1.var_.characterEffect10014ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.200000002980232

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect10014ui_story then
					arg_347_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect10014ui_story then
				arg_347_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_350_4 = 0
			local var_350_5 = 0.925

			if var_350_4 < arg_347_1.time_ and arg_347_1.time_ <= var_350_4 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_6 = arg_347_1:FormatText(StoryNameCfg[264].name)

				arg_347_1.leftNameTxt_.text = var_350_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_7 = arg_347_1:GetWordFromCfg(121501086)
				local var_350_8 = arg_347_1:FormatText(var_350_7.content)

				arg_347_1.text_.text = var_350_8

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_9 = 38
				local var_350_10 = utf8.len(var_350_8)
				local var_350_11 = var_350_9 <= 0 and var_350_5 or var_350_5 * (var_350_10 / var_350_9)

				if var_350_11 > 0 and var_350_5 < var_350_11 then
					arg_347_1.talkMaxDuration = var_350_11

					if var_350_11 + var_350_4 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_11 + var_350_4
					end
				end

				arg_347_1.text_.text = var_350_8
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501086", "story_v_out_121501.awb") ~= 0 then
					local var_350_12 = manager.audio:GetVoiceLength("story_v_out_121501", "121501086", "story_v_out_121501.awb") / 1000

					if var_350_12 + var_350_4 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_12 + var_350_4
					end

					if var_350_7.prefab_name ~= "" and arg_347_1.actors_[var_350_7.prefab_name] ~= nil then
						local var_350_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_7.prefab_name].transform, "story_v_out_121501", "121501086", "story_v_out_121501.awb")

						arg_347_1:RecordAudio("121501086", var_350_13)
						arg_347_1:RecordAudio("121501086", var_350_13)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_121501", "121501086", "story_v_out_121501.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_121501", "121501086", "story_v_out_121501.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_14 = math.max(var_350_5, arg_347_1.talkMaxDuration)

			if var_350_4 <= arg_347_1.time_ and arg_347_1.time_ < var_350_4 + var_350_14 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_4) / var_350_14

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_4 + var_350_14 and arg_347_1.time_ < var_350_4 + var_350_14 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play121501087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 121501087
		arg_351_1.duration_ = 9.8

		local var_351_0 = {
			ja = 8.766,
			ko = 9.8,
			zh = 9.8
		}
		local var_351_1 = manager.audio:GetLocalizationFlag()

		if var_351_0[var_351_1] ~= nil then
			arg_351_1.duration_ = var_351_0[var_351_1]
		end

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play121501088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 1.025

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_2 = arg_351_1:FormatText(StoryNameCfg[264].name)

				arg_351_1.leftNameTxt_.text = var_354_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_3 = arg_351_1:GetWordFromCfg(121501087)
				local var_354_4 = arg_351_1:FormatText(var_354_3.content)

				arg_351_1.text_.text = var_354_4

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_5 = 41
				local var_354_6 = utf8.len(var_354_4)
				local var_354_7 = var_354_5 <= 0 and var_354_1 or var_354_1 * (var_354_6 / var_354_5)

				if var_354_7 > 0 and var_354_1 < var_354_7 then
					arg_351_1.talkMaxDuration = var_354_7

					if var_354_7 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_7 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_4
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501087", "story_v_out_121501.awb") ~= 0 then
					local var_354_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501087", "story_v_out_121501.awb") / 1000

					if var_354_8 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_8 + var_354_0
					end

					if var_354_3.prefab_name ~= "" and arg_351_1.actors_[var_354_3.prefab_name] ~= nil then
						local var_354_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_3.prefab_name].transform, "story_v_out_121501", "121501087", "story_v_out_121501.awb")

						arg_351_1:RecordAudio("121501087", var_354_9)
						arg_351_1:RecordAudio("121501087", var_354_9)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_121501", "121501087", "story_v_out_121501.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_121501", "121501087", "story_v_out_121501.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_10 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_10 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_10

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_10 and arg_351_1.time_ < var_354_0 + var_354_10 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play121501088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 121501088
		arg_355_1.duration_ = 7.966

		local var_355_0 = {
			ja = 7.966,
			ko = 6.5,
			zh = 6.5
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play121501089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1029ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1029ui_story == nil then
				arg_355_1.var_.characterEffect1029ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1029ui_story then
					arg_355_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1029ui_story then
				arg_355_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_358_4 = arg_355_1.actors_["10014ui_story"]
			local var_358_5 = 0

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 and arg_355_1.var_.characterEffect10014ui_story == nil then
				arg_355_1.var_.characterEffect10014ui_story = var_358_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_6 = 0.200000002980232

			if var_358_5 <= arg_355_1.time_ and arg_355_1.time_ < var_358_5 + var_358_6 then
				local var_358_7 = (arg_355_1.time_ - var_358_5) / var_358_6

				if arg_355_1.var_.characterEffect10014ui_story then
					local var_358_8 = Mathf.Lerp(0, 0.5, var_358_7)

					arg_355_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_355_1.var_.characterEffect10014ui_story.fillRatio = var_358_8
				end
			end

			if arg_355_1.time_ >= var_358_5 + var_358_6 and arg_355_1.time_ < var_358_5 + var_358_6 + arg_358_0 and arg_355_1.var_.characterEffect10014ui_story then
				local var_358_9 = 0.5

				arg_355_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_355_1.var_.characterEffect10014ui_story.fillRatio = var_358_9
			end

			local var_358_10 = 0
			local var_358_11 = 0.85

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_12 = arg_355_1:FormatText(StoryNameCfg[319].name)

				arg_355_1.leftNameTxt_.text = var_358_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_13 = arg_355_1:GetWordFromCfg(121501088)
				local var_358_14 = arg_355_1:FormatText(var_358_13.content)

				arg_355_1.text_.text = var_358_14

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_15 = 34
				local var_358_16 = utf8.len(var_358_14)
				local var_358_17 = var_358_15 <= 0 and var_358_11 or var_358_11 * (var_358_16 / var_358_15)

				if var_358_17 > 0 and var_358_11 < var_358_17 then
					arg_355_1.talkMaxDuration = var_358_17

					if var_358_17 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_17 + var_358_10
					end
				end

				arg_355_1.text_.text = var_358_14
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501088", "story_v_out_121501.awb") ~= 0 then
					local var_358_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501088", "story_v_out_121501.awb") / 1000

					if var_358_18 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_18 + var_358_10
					end

					if var_358_13.prefab_name ~= "" and arg_355_1.actors_[var_358_13.prefab_name] ~= nil then
						local var_358_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_13.prefab_name].transform, "story_v_out_121501", "121501088", "story_v_out_121501.awb")

						arg_355_1:RecordAudio("121501088", var_358_19)
						arg_355_1:RecordAudio("121501088", var_358_19)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_121501", "121501088", "story_v_out_121501.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_121501", "121501088", "story_v_out_121501.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_20 = math.max(var_358_11, arg_355_1.talkMaxDuration)

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_20 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_10) / var_358_20

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_10 + var_358_20 and arg_355_1.time_ < var_358_10 + var_358_20 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play121501089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 121501089
		arg_359_1.duration_ = 4.233

		local var_359_0 = {
			ja = 4.233,
			ko = 2.633,
			zh = 2.633
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play121501090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1029ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1029ui_story == nil then
				arg_359_1.var_.characterEffect1029ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.200000002980232

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1029ui_story then
					local var_362_4 = Mathf.Lerp(0, 0.5, var_362_3)

					arg_359_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1029ui_story.fillRatio = var_362_4
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1029ui_story then
				local var_362_5 = 0.5

				arg_359_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1029ui_story.fillRatio = var_362_5
			end

			local var_362_6 = arg_359_1.actors_["10014ui_story"]
			local var_362_7 = 0

			if var_362_7 < arg_359_1.time_ and arg_359_1.time_ <= var_362_7 + arg_362_0 and arg_359_1.var_.characterEffect10014ui_story == nil then
				arg_359_1.var_.characterEffect10014ui_story = var_362_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_8 = 0.200000002980232

			if var_362_7 <= arg_359_1.time_ and arg_359_1.time_ < var_362_7 + var_362_8 then
				local var_362_9 = (arg_359_1.time_ - var_362_7) / var_362_8

				if arg_359_1.var_.characterEffect10014ui_story then
					arg_359_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_7 + var_362_8 and arg_359_1.time_ < var_362_7 + var_362_8 + arg_362_0 and arg_359_1.var_.characterEffect10014ui_story then
				arg_359_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_362_10 = 0
			local var_362_11 = 0.25

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_12 = arg_359_1:FormatText(StoryNameCfg[264].name)

				arg_359_1.leftNameTxt_.text = var_362_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_13 = arg_359_1:GetWordFromCfg(121501089)
				local var_362_14 = arg_359_1:FormatText(var_362_13.content)

				arg_359_1.text_.text = var_362_14

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_15 = 10
				local var_362_16 = utf8.len(var_362_14)
				local var_362_17 = var_362_15 <= 0 and var_362_11 or var_362_11 * (var_362_16 / var_362_15)

				if var_362_17 > 0 and var_362_11 < var_362_17 then
					arg_359_1.talkMaxDuration = var_362_17

					if var_362_17 + var_362_10 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_17 + var_362_10
					end
				end

				arg_359_1.text_.text = var_362_14
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501089", "story_v_out_121501.awb") ~= 0 then
					local var_362_18 = manager.audio:GetVoiceLength("story_v_out_121501", "121501089", "story_v_out_121501.awb") / 1000

					if var_362_18 + var_362_10 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_18 + var_362_10
					end

					if var_362_13.prefab_name ~= "" and arg_359_1.actors_[var_362_13.prefab_name] ~= nil then
						local var_362_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_13.prefab_name].transform, "story_v_out_121501", "121501089", "story_v_out_121501.awb")

						arg_359_1:RecordAudio("121501089", var_362_19)
						arg_359_1:RecordAudio("121501089", var_362_19)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_121501", "121501089", "story_v_out_121501.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_121501", "121501089", "story_v_out_121501.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_20 = math.max(var_362_11, arg_359_1.talkMaxDuration)

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_20 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_10) / var_362_20

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_10 + var_362_20 and arg_359_1.time_ < var_362_10 + var_362_20 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play121501090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 121501090
		arg_363_1.duration_ = 9.966

		local var_363_0 = {
			ja = 8.333,
			ko = 9.966,
			zh = 9.966
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play121501091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_366_2 = arg_363_1.actors_["1029ui_story"]
			local var_366_3 = 0

			if var_366_3 < arg_363_1.time_ and arg_363_1.time_ <= var_366_3 + arg_366_0 and arg_363_1.var_.characterEffect1029ui_story == nil then
				arg_363_1.var_.characterEffect1029ui_story = var_366_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_4 = 0.200000002980232

			if var_366_3 <= arg_363_1.time_ and arg_363_1.time_ < var_366_3 + var_366_4 then
				local var_366_5 = (arg_363_1.time_ - var_366_3) / var_366_4

				if arg_363_1.var_.characterEffect1029ui_story then
					arg_363_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_3 + var_366_4 and arg_363_1.time_ < var_366_3 + var_366_4 + arg_366_0 and arg_363_1.var_.characterEffect1029ui_story then
				arg_363_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_366_6 = arg_363_1.actors_["10014ui_story"]
			local var_366_7 = 0

			if var_366_7 < arg_363_1.time_ and arg_363_1.time_ <= var_366_7 + arg_366_0 and arg_363_1.var_.characterEffect10014ui_story == nil then
				arg_363_1.var_.characterEffect10014ui_story = var_366_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_8 = 0.200000002980232

			if var_366_7 <= arg_363_1.time_ and arg_363_1.time_ < var_366_7 + var_366_8 then
				local var_366_9 = (arg_363_1.time_ - var_366_7) / var_366_8

				if arg_363_1.var_.characterEffect10014ui_story then
					local var_366_10 = Mathf.Lerp(0, 0.5, var_366_9)

					arg_363_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_363_1.var_.characterEffect10014ui_story.fillRatio = var_366_10
				end
			end

			if arg_363_1.time_ >= var_366_7 + var_366_8 and arg_363_1.time_ < var_366_7 + var_366_8 + arg_366_0 and arg_363_1.var_.characterEffect10014ui_story then
				local var_366_11 = 0.5

				arg_363_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_363_1.var_.characterEffect10014ui_story.fillRatio = var_366_11
			end

			local var_366_12 = 0
			local var_366_13 = 1.125

			if var_366_12 < arg_363_1.time_ and arg_363_1.time_ <= var_366_12 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_14 = arg_363_1:FormatText(StoryNameCfg[319].name)

				arg_363_1.leftNameTxt_.text = var_366_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_15 = arg_363_1:GetWordFromCfg(121501090)
				local var_366_16 = arg_363_1:FormatText(var_366_15.content)

				arg_363_1.text_.text = var_366_16

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_17 = 45
				local var_366_18 = utf8.len(var_366_16)
				local var_366_19 = var_366_17 <= 0 and var_366_13 or var_366_13 * (var_366_18 / var_366_17)

				if var_366_19 > 0 and var_366_13 < var_366_19 then
					arg_363_1.talkMaxDuration = var_366_19

					if var_366_19 + var_366_12 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_19 + var_366_12
					end
				end

				arg_363_1.text_.text = var_366_16
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501090", "story_v_out_121501.awb") ~= 0 then
					local var_366_20 = manager.audio:GetVoiceLength("story_v_out_121501", "121501090", "story_v_out_121501.awb") / 1000

					if var_366_20 + var_366_12 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_20 + var_366_12
					end

					if var_366_15.prefab_name ~= "" and arg_363_1.actors_[var_366_15.prefab_name] ~= nil then
						local var_366_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_15.prefab_name].transform, "story_v_out_121501", "121501090", "story_v_out_121501.awb")

						arg_363_1:RecordAudio("121501090", var_366_21)
						arg_363_1:RecordAudio("121501090", var_366_21)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_121501", "121501090", "story_v_out_121501.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_121501", "121501090", "story_v_out_121501.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_22 = math.max(var_366_13, arg_363_1.talkMaxDuration)

			if var_366_12 <= arg_363_1.time_ and arg_363_1.time_ < var_366_12 + var_366_22 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_12) / var_366_22

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_12 + var_366_22 and arg_363_1.time_ < var_366_12 + var_366_22 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play121501091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 121501091
		arg_367_1.duration_ = 9.2

		local var_367_0 = {
			ja = 9.2,
			ko = 5,
			zh = 5
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play121501092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0
			local var_370_1 = 0.55

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_2 = arg_367_1:FormatText(StoryNameCfg[319].name)

				arg_367_1.leftNameTxt_.text = var_370_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_3 = arg_367_1:GetWordFromCfg(121501091)
				local var_370_4 = arg_367_1:FormatText(var_370_3.content)

				arg_367_1.text_.text = var_370_4

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_5 = 22
				local var_370_6 = utf8.len(var_370_4)
				local var_370_7 = var_370_5 <= 0 and var_370_1 or var_370_1 * (var_370_6 / var_370_5)

				if var_370_7 > 0 and var_370_1 < var_370_7 then
					arg_367_1.talkMaxDuration = var_370_7

					if var_370_7 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_7 + var_370_0
					end
				end

				arg_367_1.text_.text = var_370_4
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501091", "story_v_out_121501.awb") ~= 0 then
					local var_370_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501091", "story_v_out_121501.awb") / 1000

					if var_370_8 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_8 + var_370_0
					end

					if var_370_3.prefab_name ~= "" and arg_367_1.actors_[var_370_3.prefab_name] ~= nil then
						local var_370_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_3.prefab_name].transform, "story_v_out_121501", "121501091", "story_v_out_121501.awb")

						arg_367_1:RecordAudio("121501091", var_370_9)
						arg_367_1:RecordAudio("121501091", var_370_9)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_121501", "121501091", "story_v_out_121501.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_121501", "121501091", "story_v_out_121501.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_10 = math.max(var_370_1, arg_367_1.talkMaxDuration)

			if var_370_0 <= arg_367_1.time_ and arg_367_1.time_ < var_370_0 + var_370_10 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_0) / var_370_10

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_0 + var_370_10 and arg_367_1.time_ < var_370_0 + var_370_10 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play121501092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 121501092
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play121501093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1029ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1029ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0, 100, 0)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1029ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, 100, 0)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = arg_371_1.actors_["1029ui_story"]
			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 and arg_371_1.var_.characterEffect1029ui_story == nil then
				arg_371_1.var_.characterEffect1029ui_story = var_374_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_11 = 0.200000002980232

			if var_374_10 <= arg_371_1.time_ and arg_371_1.time_ < var_374_10 + var_374_11 then
				local var_374_12 = (arg_371_1.time_ - var_374_10) / var_374_11

				if arg_371_1.var_.characterEffect1029ui_story then
					local var_374_13 = Mathf.Lerp(0, 0.5, var_374_12)

					arg_371_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_371_1.var_.characterEffect1029ui_story.fillRatio = var_374_13
				end
			end

			if arg_371_1.time_ >= var_374_10 + var_374_11 and arg_371_1.time_ < var_374_10 + var_374_11 + arg_374_0 and arg_371_1.var_.characterEffect1029ui_story then
				local var_374_14 = 0.5

				arg_371_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_371_1.var_.characterEffect1029ui_story.fillRatio = var_374_14
			end

			local var_374_15 = arg_371_1.actors_["10014ui_story"].transform
			local var_374_16 = 0

			if var_374_16 < arg_371_1.time_ and arg_371_1.time_ <= var_374_16 + arg_374_0 then
				arg_371_1.var_.moveOldPos10014ui_story = var_374_15.localPosition
			end

			local var_374_17 = 0.001

			if var_374_16 <= arg_371_1.time_ and arg_371_1.time_ < var_374_16 + var_374_17 then
				local var_374_18 = (arg_371_1.time_ - var_374_16) / var_374_17
				local var_374_19 = Vector3.New(0, -1.06, -6.2)

				var_374_15.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos10014ui_story, var_374_19, var_374_18)

				local var_374_20 = manager.ui.mainCamera.transform.position - var_374_15.position

				var_374_15.forward = Vector3.New(var_374_20.x, var_374_20.y, var_374_20.z)

				local var_374_21 = var_374_15.localEulerAngles

				var_374_21.z = 0
				var_374_21.x = 0
				var_374_15.localEulerAngles = var_374_21
			end

			if arg_371_1.time_ >= var_374_16 + var_374_17 and arg_371_1.time_ < var_374_16 + var_374_17 + arg_374_0 then
				var_374_15.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_374_22 = manager.ui.mainCamera.transform.position - var_374_15.position

				var_374_15.forward = Vector3.New(var_374_22.x, var_374_22.y, var_374_22.z)

				local var_374_23 = var_374_15.localEulerAngles

				var_374_23.z = 0
				var_374_23.x = 0
				var_374_15.localEulerAngles = var_374_23
			end

			local var_374_24 = 0
			local var_374_25 = 0.7

			if var_374_24 < arg_371_1.time_ and arg_371_1.time_ <= var_374_24 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_26 = arg_371_1:GetWordFromCfg(121501092)
				local var_374_27 = arg_371_1:FormatText(var_374_26.content)

				arg_371_1.text_.text = var_374_27

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_28 = 28
				local var_374_29 = utf8.len(var_374_27)
				local var_374_30 = var_374_28 <= 0 and var_374_25 or var_374_25 * (var_374_29 / var_374_28)

				if var_374_30 > 0 and var_374_25 < var_374_30 then
					arg_371_1.talkMaxDuration = var_374_30

					if var_374_30 + var_374_24 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_30 + var_374_24
					end
				end

				arg_371_1.text_.text = var_374_27
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_31 = math.max(var_374_25, arg_371_1.talkMaxDuration)

			if var_374_24 <= arg_371_1.time_ and arg_371_1.time_ < var_374_24 + var_374_31 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_24) / var_374_31

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_24 + var_374_31 and arg_371_1.time_ < var_374_24 + var_374_31 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play121501093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 121501093
		arg_375_1.duration_ = 14.533

		local var_375_0 = {
			ja = 14.533,
			ko = 8.9,
			zh = 8.9
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
			arg_375_1.auto_ = false
		end

		function arg_375_1.playNext_(arg_377_0)
			arg_375_1.onStoryFinished_()
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 1

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[319].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, true)
				arg_375_1.iconController_:SetSelectedState("hero")

				arg_375_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(121501093)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 39
				local var_378_6 = utf8.len(var_378_4)
				local var_378_7 = var_378_5 <= 0 and var_378_1 or var_378_1 * (var_378_6 / var_378_5)

				if var_378_7 > 0 and var_378_1 < var_378_7 then
					arg_375_1.talkMaxDuration = var_378_7

					if var_378_7 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_7 + var_378_0
					end
				end

				arg_375_1.text_.text = var_378_4
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121501", "121501093", "story_v_out_121501.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_121501", "121501093", "story_v_out_121501.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_121501", "121501093", "story_v_out_121501.awb")

						arg_375_1:RecordAudio("121501093", var_378_9)
						arg_375_1:RecordAudio("121501093", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_121501", "121501093", "story_v_out_121501.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_121501", "121501093", "story_v_out_121501.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_10 = math.max(var_378_1, arg_375_1.talkMaxDuration)

			if var_378_0 <= arg_375_1.time_ and arg_375_1.time_ < var_378_0 + var_378_10 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_0) / var_378_10

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_0 + var_378_10 and arg_375_1.time_ < var_378_0 + var_378_10 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST18a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05a"
	},
	voices = {
		"story_v_out_121501.awb"
	}
}
