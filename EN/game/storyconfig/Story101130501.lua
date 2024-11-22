return {
	Play113051001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 113051001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play113051002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST22"

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
				local var_4_5 = arg_1_1.bgs_.ST22

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
					if iter_4_0 ~= "ST22" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.65

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

				local var_4_33 = arg_1_1:GetWordFromCfg(113051001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 26
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
	Play113051002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 113051002
		arg_7_1.duration_ = 5.066

		local var_7_0 = {
			ja = 5.066,
			ko = 2.9,
			zh = 3.6,
			en = 4.433
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
				arg_7_0:Play113051003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1042ui_story"

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

			local var_10_4 = arg_7_1.actors_["1042ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1042ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(-0.7, -1.06, -6.2)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1042ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_10_15 = arg_7_1.actors_["1042ui_story"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect1042ui_story == nil then
				arg_7_1.var_.characterEffect1042ui_story = var_10_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_17 = 0.2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.characterEffect1042ui_story then
					arg_7_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.characterEffect1042ui_story then
				arg_7_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_10_19 = 0
			local var_10_20 = 0.25

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[205].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(113051002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051002", "story_v_out_113051.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_113051", "113051002", "story_v_out_113051.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_113051", "113051002", "story_v_out_113051.awb")

						arg_7_1:RecordAudio("113051002", var_10_28)
						arg_7_1:RecordAudio("113051002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_113051", "113051002", "story_v_out_113051.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_113051", "113051002", "story_v_out_113051.awb")
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
	Play113051003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 113051003
		arg_11_1.duration_ = 7.233

		local var_11_0 = {
			ja = 7.233,
			ko = 4.8,
			zh = 5.3,
			en = 5.666
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
				arg_11_0:Play113051004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1041ui_story"

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

			local var_14_4 = arg_11_1.actors_["1041ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1041ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0.7, -1.11, -5.9)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1041ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = 0

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				arg_11_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action3_1")
			end

			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_14_15 = arg_11_1.actors_["1042ui_story"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.characterEffect1042ui_story == nil then
				arg_11_1.var_.characterEffect1042ui_story = var_14_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_17 = 0.2

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.characterEffect1042ui_story then
					local var_14_19 = Mathf.Lerp(0, 0.5, var_14_18)

					arg_11_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1042ui_story.fillRatio = var_14_19
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.characterEffect1042ui_story then
				local var_14_20 = 0.5

				arg_11_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1042ui_story.fillRatio = var_14_20
			end

			local var_14_21 = arg_11_1.actors_["1041ui_story"]
			local var_14_22 = 0

			if var_14_22 < arg_11_1.time_ and arg_11_1.time_ <= var_14_22 + arg_14_0 and arg_11_1.var_.characterEffect1041ui_story == nil then
				arg_11_1.var_.characterEffect1041ui_story = var_14_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_23 = 0.2

			if var_14_22 <= arg_11_1.time_ and arg_11_1.time_ < var_14_22 + var_14_23 then
				local var_14_24 = (arg_11_1.time_ - var_14_22) / var_14_23

				if arg_11_1.var_.characterEffect1041ui_story then
					arg_11_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_22 + var_14_23 and arg_11_1.time_ < var_14_22 + var_14_23 + arg_14_0 and arg_11_1.var_.characterEffect1041ui_story then
				arg_11_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_14_25 = 0
			local var_14_26 = 0.7

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_27 = arg_11_1:FormatText(StoryNameCfg[208].name)

				arg_11_1.leftNameTxt_.text = var_14_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_28 = arg_11_1:GetWordFromCfg(113051003)
				local var_14_29 = arg_11_1:FormatText(var_14_28.content)

				arg_11_1.text_.text = var_14_29

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_30 = 27
				local var_14_31 = utf8.len(var_14_29)
				local var_14_32 = var_14_30 <= 0 and var_14_26 or var_14_26 * (var_14_31 / var_14_30)

				if var_14_32 > 0 and var_14_26 < var_14_32 then
					arg_11_1.talkMaxDuration = var_14_32

					if var_14_32 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_32 + var_14_25
					end
				end

				arg_11_1.text_.text = var_14_29
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051003", "story_v_out_113051.awb") ~= 0 then
					local var_14_33 = manager.audio:GetVoiceLength("story_v_out_113051", "113051003", "story_v_out_113051.awb") / 1000

					if var_14_33 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_33 + var_14_25
					end

					if var_14_28.prefab_name ~= "" and arg_11_1.actors_[var_14_28.prefab_name] ~= nil then
						local var_14_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_28.prefab_name].transform, "story_v_out_113051", "113051003", "story_v_out_113051.awb")

						arg_11_1:RecordAudio("113051003", var_14_34)
						arg_11_1:RecordAudio("113051003", var_14_34)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_113051", "113051003", "story_v_out_113051.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_113051", "113051003", "story_v_out_113051.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_35 = math.max(var_14_26, arg_11_1.talkMaxDuration)

			if var_14_25 <= arg_11_1.time_ and arg_11_1.time_ < var_14_25 + var_14_35 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_25) / var_14_35

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_25 + var_14_35 and arg_11_1.time_ < var_14_25 + var_14_35 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play113051004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 113051004
		arg_15_1.duration_ = 8.066

		local var_15_0 = {
			ja = 8.066,
			ko = 7.9,
			zh = 8.033,
			en = 8.066
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
				arg_15_0:Play113051005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1041ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1041ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1041ui_story, var_18_4, var_18_3)

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

			local var_18_9 = arg_15_1.actors_["1042ui_story"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos1042ui_story = var_18_9.localPosition
			end

			local var_18_11 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11
				local var_18_13 = Vector3.New(0, 100, 0)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1042ui_story, var_18_13, var_18_12)

				local var_18_14 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_14.x, var_18_14.y, var_18_14.z)

				local var_18_15 = var_18_9.localEulerAngles

				var_18_15.z = 0
				var_18_15.x = 0
				var_18_9.localEulerAngles = var_18_15
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(0, 100, 0)

				local var_18_16 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_16.x, var_18_16.y, var_18_16.z)

				local var_18_17 = var_18_9.localEulerAngles

				var_18_17.z = 0
				var_18_17.x = 0
				var_18_9.localEulerAngles = var_18_17
			end

			local var_18_18 = "1084ui_story"

			if arg_15_1.actors_[var_18_18] == nil then
				local var_18_19 = Object.Instantiate(Asset.Load("Char/" .. var_18_18), arg_15_1.stage_.transform)

				var_18_19.name = var_18_18
				var_18_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_18] = var_18_19

				local var_18_20 = var_18_19:GetComponentInChildren(typeof(CharacterEffect))

				var_18_20.enabled = true

				local var_18_21 = GameObjectTools.GetOrAddComponent(var_18_19, typeof(DynamicBoneHelper))

				if var_18_21 then
					var_18_21:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_20.transform, false)

				arg_15_1.var_[var_18_18 .. "Animator"] = var_18_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_18 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_18 .. "LipSync"] = var_18_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_22 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_22.localPosition
			end

			local var_18_24 = 0.001

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_24 then
				local var_18_25 = (arg_15_1.time_ - var_18_23) / var_18_24
				local var_18_26 = Vector3.New(-0.7, -0.97, -6)

				var_18_22.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_26, var_18_25)

				local var_18_27 = manager.ui.mainCamera.transform.position - var_18_22.position

				var_18_22.forward = Vector3.New(var_18_27.x, var_18_27.y, var_18_27.z)

				local var_18_28 = var_18_22.localEulerAngles

				var_18_28.z = 0
				var_18_28.x = 0
				var_18_22.localEulerAngles = var_18_28
			end

			if arg_15_1.time_ >= var_18_23 + var_18_24 and arg_15_1.time_ < var_18_23 + var_18_24 + arg_18_0 then
				var_18_22.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_18_29 = manager.ui.mainCamera.transform.position - var_18_22.position

				var_18_22.forward = Vector3.New(var_18_29.x, var_18_29.y, var_18_29.z)

				local var_18_30 = var_18_22.localEulerAngles

				var_18_30.z = 0
				var_18_30.x = 0
				var_18_22.localEulerAngles = var_18_30
			end

			local var_18_31 = 0

			if var_18_31 < arg_15_1.time_ and arg_15_1.time_ <= var_18_31 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_18_33 = arg_15_1.actors_["1084ui_story"]
			local var_18_34 = 0

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_35 = 0.2

			if var_18_34 <= arg_15_1.time_ and arg_15_1.time_ < var_18_34 + var_18_35 then
				local var_18_36 = (arg_15_1.time_ - var_18_34) / var_18_35

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_34 + var_18_35 and arg_15_1.time_ < var_18_34 + var_18_35 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_37 = 0
			local var_18_38 = 0.675

			if var_18_37 < arg_15_1.time_ and arg_15_1.time_ <= var_18_37 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_39 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_40 = arg_15_1:GetWordFromCfg(113051004)
				local var_18_41 = arg_15_1:FormatText(var_18_40.content)

				arg_15_1.text_.text = var_18_41

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_42 = 27
				local var_18_43 = utf8.len(var_18_41)
				local var_18_44 = var_18_42 <= 0 and var_18_38 or var_18_38 * (var_18_43 / var_18_42)

				if var_18_44 > 0 and var_18_38 < var_18_44 then
					arg_15_1.talkMaxDuration = var_18_44

					if var_18_44 + var_18_37 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_44 + var_18_37
					end
				end

				arg_15_1.text_.text = var_18_41
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051004", "story_v_out_113051.awb") ~= 0 then
					local var_18_45 = manager.audio:GetVoiceLength("story_v_out_113051", "113051004", "story_v_out_113051.awb") / 1000

					if var_18_45 + var_18_37 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_45 + var_18_37
					end

					if var_18_40.prefab_name ~= "" and arg_15_1.actors_[var_18_40.prefab_name] ~= nil then
						local var_18_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_40.prefab_name].transform, "story_v_out_113051", "113051004", "story_v_out_113051.awb")

						arg_15_1:RecordAudio("113051004", var_18_46)
						arg_15_1:RecordAudio("113051004", var_18_46)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_113051", "113051004", "story_v_out_113051.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_113051", "113051004", "story_v_out_113051.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_47 = math.max(var_18_38, arg_15_1.talkMaxDuration)

			if var_18_37 <= arg_15_1.time_ and arg_15_1.time_ < var_18_37 + var_18_47 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_37) / var_18_47

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_37 + var_18_47 and arg_15_1.time_ < var_18_37 + var_18_47 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play113051005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 113051005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play113051006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1084ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.825

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(113051005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 33
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_7 or var_22_7 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_7 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_14 and arg_19_1.time_ < var_22_6 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play113051006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 113051006
		arg_23_1.duration_ = 3.266

		local var_23_0 = {
			ja = 3.266,
			ko = 2.5,
			zh = 2.2,
			en = 1.999999999999
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
				arg_23_0:Play113051007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1038ui_story"

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

			local var_26_4 = arg_23_1.actors_["1038ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos1038ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(0.7, -1.11, -5.9)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1038ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_26_15 = arg_23_1.actors_["1038ui_story"]
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect1038ui_story == nil then
				arg_23_1.var_.characterEffect1038ui_story = var_26_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_17 = 0.2

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17

				if arg_23_1.var_.characterEffect1038ui_story then
					arg_23_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 and arg_23_1.var_.characterEffect1038ui_story then
				arg_23_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_26_19 = 0
			local var_26_20 = 0.2

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[94].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(113051006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 8
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051006", "story_v_out_113051.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_113051", "113051006", "story_v_out_113051.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_113051", "113051006", "story_v_out_113051.awb")

						arg_23_1:RecordAudio("113051006", var_26_28)
						arg_23_1:RecordAudio("113051006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_113051", "113051006", "story_v_out_113051.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_113051", "113051006", "story_v_out_113051.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play113051007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 113051007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play113051008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1084ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1084ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1084ui_story, var_30_4, var_30_3)

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

			local var_30_9 = arg_27_1.actors_["1038ui_story"].transform
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.var_.moveOldPos1038ui_story = var_30_9.localPosition
			end

			local var_30_11 = 0.001

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11
				local var_30_13 = Vector3.New(0, 100, 0)

				var_30_9.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1038ui_story, var_30_13, var_30_12)

				local var_30_14 = manager.ui.mainCamera.transform.position - var_30_9.position

				var_30_9.forward = Vector3.New(var_30_14.x, var_30_14.y, var_30_14.z)

				local var_30_15 = var_30_9.localEulerAngles

				var_30_15.z = 0
				var_30_15.x = 0
				var_30_9.localEulerAngles = var_30_15
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 then
				var_30_9.localPosition = Vector3.New(0, 100, 0)

				local var_30_16 = manager.ui.mainCamera.transform.position - var_30_9.position

				var_30_9.forward = Vector3.New(var_30_16.x, var_30_16.y, var_30_16.z)

				local var_30_17 = var_30_9.localEulerAngles

				var_30_17.z = 0
				var_30_17.x = 0
				var_30_9.localEulerAngles = var_30_17
			end

			local var_30_18 = 0
			local var_30_19 = 0.575

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_20 = arg_27_1:GetWordFromCfg(113051007)
				local var_30_21 = arg_27_1:FormatText(var_30_20.content)

				arg_27_1.text_.text = var_30_21

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_22 = 23
				local var_30_23 = utf8.len(var_30_21)
				local var_30_24 = var_30_22 <= 0 and var_30_19 or var_30_19 * (var_30_23 / var_30_22)

				if var_30_24 > 0 and var_30_19 < var_30_24 then
					arg_27_1.talkMaxDuration = var_30_24

					if var_30_24 + var_30_18 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_24 + var_30_18
					end
				end

				arg_27_1.text_.text = var_30_21
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_25 = math.max(var_30_19, arg_27_1.talkMaxDuration)

			if var_30_18 <= arg_27_1.time_ and arg_27_1.time_ < var_30_18 + var_30_25 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_18) / var_30_25

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_18 + var_30_25 and arg_27_1.time_ < var_30_18 + var_30_25 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play113051008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 113051008
		arg_31_1.duration_ = 1.999999999999

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play113051009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action2_1")
			end

			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_34_2 = arg_31_1.actors_["1041ui_story"]
			local var_34_3 = 0

			if var_34_3 < arg_31_1.time_ and arg_31_1.time_ <= var_34_3 + arg_34_0 and arg_31_1.var_.characterEffect1041ui_story == nil then
				arg_31_1.var_.characterEffect1041ui_story = var_34_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_4 = 0.2

			if var_34_3 <= arg_31_1.time_ and arg_31_1.time_ < var_34_3 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_3) / var_34_4

				if arg_31_1.var_.characterEffect1041ui_story then
					arg_31_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_3 + var_34_4 and arg_31_1.time_ < var_34_3 + var_34_4 + arg_34_0 and arg_31_1.var_.characterEffect1041ui_story then
				arg_31_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_34_6 = arg_31_1.actors_["1041ui_story"].transform
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 then
				arg_31_1.var_.moveOldPos1041ui_story = var_34_6.localPosition
			end

			local var_34_8 = 0.001

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8
				local var_34_10 = Vector3.New(-0.7, -1.11, -5.9)

				var_34_6.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1041ui_story, var_34_10, var_34_9)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_6.position

				var_34_6.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_6.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_6.localEulerAngles = var_34_12
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 then
				var_34_6.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_34_13 = manager.ui.mainCamera.transform.position - var_34_6.position

				var_34_6.forward = Vector3.New(var_34_13.x, var_34_13.y, var_34_13.z)

				local var_34_14 = var_34_6.localEulerAngles

				var_34_14.z = 0
				var_34_14.x = 0
				var_34_6.localEulerAngles = var_34_14
			end

			local var_34_15 = 0
			local var_34_16 = 0.125

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[208].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(113051008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 5
				local var_34_21 = utf8.len(var_34_19)
				local var_34_22 = var_34_20 <= 0 and var_34_16 or var_34_16 * (var_34_21 / var_34_20)

				if var_34_22 > 0 and var_34_16 < var_34_22 then
					arg_31_1.talkMaxDuration = var_34_22

					if var_34_22 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_15
					end
				end

				arg_31_1.text_.text = var_34_19
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051008", "story_v_out_113051.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_113051", "113051008", "story_v_out_113051.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_113051", "113051008", "story_v_out_113051.awb")

						arg_31_1:RecordAudio("113051008", var_34_24)
						arg_31_1:RecordAudio("113051008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_113051", "113051008", "story_v_out_113051.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_113051", "113051008", "story_v_out_113051.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_25 = math.max(var_34_16, arg_31_1.talkMaxDuration)

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_25 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_15) / var_34_25

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_15 + var_34_25 and arg_31_1.time_ < var_34_15 + var_34_25 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play113051009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 113051009
		arg_35_1.duration_ = 4.166

		local var_35_0 = {
			ja = 4.166,
			ko = 2.666,
			zh = 2.2,
			en = 2.633
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
				arg_35_0:Play113051010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1038ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1038ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0.7, -1.11, -5.9)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1038ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 then
				arg_35_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_38_11 = arg_35_1.actors_["1038ui_story"]
			local var_38_12 = 0

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 and arg_35_1.var_.characterEffect1038ui_story == nil then
				arg_35_1.var_.characterEffect1038ui_story = var_38_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_13 = 0.2

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_13 then
				local var_38_14 = (arg_35_1.time_ - var_38_12) / var_38_13

				if arg_35_1.var_.characterEffect1038ui_story then
					arg_35_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_12 + var_38_13 and arg_35_1.time_ < var_38_12 + var_38_13 + arg_38_0 and arg_35_1.var_.characterEffect1038ui_story then
				arg_35_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_38_15 = arg_35_1.actors_["1041ui_story"]
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect1041ui_story == nil then
				arg_35_1.var_.characterEffect1041ui_story = var_38_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_17 = 0.2

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17

				if arg_35_1.var_.characterEffect1041ui_story then
					local var_38_19 = Mathf.Lerp(0, 0.5, var_38_18)

					arg_35_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1041ui_story.fillRatio = var_38_19
				end
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 and arg_35_1.var_.characterEffect1041ui_story then
				local var_38_20 = 0.5

				arg_35_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1041ui_story.fillRatio = var_38_20
			end

			local var_38_21 = 0
			local var_38_22 = 0.175

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_23 = arg_35_1:FormatText(StoryNameCfg[94].name)

				arg_35_1.leftNameTxt_.text = var_38_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_24 = arg_35_1:GetWordFromCfg(113051009)
				local var_38_25 = arg_35_1:FormatText(var_38_24.content)

				arg_35_1.text_.text = var_38_25

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_26 = 7
				local var_38_27 = utf8.len(var_38_25)
				local var_38_28 = var_38_26 <= 0 and var_38_22 or var_38_22 * (var_38_27 / var_38_26)

				if var_38_28 > 0 and var_38_22 < var_38_28 then
					arg_35_1.talkMaxDuration = var_38_28

					if var_38_28 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_28 + var_38_21
					end
				end

				arg_35_1.text_.text = var_38_25
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051009", "story_v_out_113051.awb") ~= 0 then
					local var_38_29 = manager.audio:GetVoiceLength("story_v_out_113051", "113051009", "story_v_out_113051.awb") / 1000

					if var_38_29 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_29 + var_38_21
					end

					if var_38_24.prefab_name ~= "" and arg_35_1.actors_[var_38_24.prefab_name] ~= nil then
						local var_38_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_24.prefab_name].transform, "story_v_out_113051", "113051009", "story_v_out_113051.awb")

						arg_35_1:RecordAudio("113051009", var_38_30)
						arg_35_1:RecordAudio("113051009", var_38_30)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_113051", "113051009", "story_v_out_113051.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_113051", "113051009", "story_v_out_113051.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_31 = math.max(var_38_22, arg_35_1.talkMaxDuration)

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_31 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_21) / var_38_31

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_21 + var_38_31 and arg_35_1.time_ < var_38_21 + var_38_31 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play113051010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 113051010
		arg_39_1.duration_ = 10.2

		local var_39_0 = {
			ja = 10.2,
			ko = 5.866,
			zh = 4.833,
			en = 5.033
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
				arg_39_0:Play113051011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_42_2 = 0

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 then
				arg_39_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_42_3 = 0
			local var_42_4 = 0.625

			if var_42_3 < arg_39_1.time_ and arg_39_1.time_ <= var_42_3 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_5 = arg_39_1:FormatText(StoryNameCfg[94].name)

				arg_39_1.leftNameTxt_.text = var_42_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_6 = arg_39_1:GetWordFromCfg(113051010)
				local var_42_7 = arg_39_1:FormatText(var_42_6.content)

				arg_39_1.text_.text = var_42_7

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_8 = 25
				local var_42_9 = utf8.len(var_42_7)
				local var_42_10 = var_42_8 <= 0 and var_42_4 or var_42_4 * (var_42_9 / var_42_8)

				if var_42_10 > 0 and var_42_4 < var_42_10 then
					arg_39_1.talkMaxDuration = var_42_10

					if var_42_10 + var_42_3 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_10 + var_42_3
					end
				end

				arg_39_1.text_.text = var_42_7
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051010", "story_v_out_113051.awb") ~= 0 then
					local var_42_11 = manager.audio:GetVoiceLength("story_v_out_113051", "113051010", "story_v_out_113051.awb") / 1000

					if var_42_11 + var_42_3 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_11 + var_42_3
					end

					if var_42_6.prefab_name ~= "" and arg_39_1.actors_[var_42_6.prefab_name] ~= nil then
						local var_42_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_6.prefab_name].transform, "story_v_out_113051", "113051010", "story_v_out_113051.awb")

						arg_39_1:RecordAudio("113051010", var_42_12)
						arg_39_1:RecordAudio("113051010", var_42_12)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_113051", "113051010", "story_v_out_113051.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_113051", "113051010", "story_v_out_113051.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_4, arg_39_1.talkMaxDuration)

			if var_42_3 <= arg_39_1.time_ and arg_39_1.time_ < var_42_3 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_3) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_3 + var_42_13 and arg_39_1.time_ < var_42_3 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play113051011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 113051011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play113051012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1038ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1038ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1038ui_story, var_46_4, var_46_3)

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

			local var_46_9 = arg_43_1.actors_["1041ui_story"].transform
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.var_.moveOldPos1041ui_story = var_46_9.localPosition
			end

			local var_46_11 = 0.001

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11
				local var_46_13 = Vector3.New(0, 100, 0)

				var_46_9.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1041ui_story, var_46_13, var_46_12)

				local var_46_14 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_14.x, var_46_14.y, var_46_14.z)

				local var_46_15 = var_46_9.localEulerAngles

				var_46_15.z = 0
				var_46_15.x = 0
				var_46_9.localEulerAngles = var_46_15
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 then
				var_46_9.localPosition = Vector3.New(0, 100, 0)

				local var_46_16 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_16.x, var_46_16.y, var_46_16.z)

				local var_46_17 = var_46_9.localEulerAngles

				var_46_17.z = 0
				var_46_17.x = 0
				var_46_9.localEulerAngles = var_46_17
			end

			local var_46_18 = 0
			local var_46_19 = 0.45

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_20 = arg_43_1:GetWordFromCfg(113051011)
				local var_46_21 = arg_43_1:FormatText(var_46_20.content)

				arg_43_1.text_.text = var_46_21

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_22 = 18
				local var_46_23 = utf8.len(var_46_21)
				local var_46_24 = var_46_22 <= 0 and var_46_19 or var_46_19 * (var_46_23 / var_46_22)

				if var_46_24 > 0 and var_46_19 < var_46_24 then
					arg_43_1.talkMaxDuration = var_46_24

					if var_46_24 + var_46_18 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_24 + var_46_18
					end
				end

				arg_43_1.text_.text = var_46_21
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_19, arg_43_1.talkMaxDuration)

			if var_46_18 <= arg_43_1.time_ and arg_43_1.time_ < var_46_18 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_18) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_18 + var_46_25 and arg_43_1.time_ < var_46_18 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play113051012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 113051012
		arg_47_1.duration_ = 11.066

		local var_47_0 = {
			ja = 11.066,
			ko = 9.2,
			zh = 7.1,
			en = 8.3
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
				arg_47_0:Play113051013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1042ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1042ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, -1.06, -6.2)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1042ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = 0

			if var_50_9 < arg_47_1.time_ and arg_47_1.time_ <= var_50_9 + arg_50_0 then
				arg_47_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_11 = arg_47_1.actors_["1042ui_story"]
			local var_50_12 = 0

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 and arg_47_1.var_.characterEffect1042ui_story == nil then
				arg_47_1.var_.characterEffect1042ui_story = var_50_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_13 = 0.2

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_13 then
				local var_50_14 = (arg_47_1.time_ - var_50_12) / var_50_13

				if arg_47_1.var_.characterEffect1042ui_story then
					arg_47_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_12 + var_50_13 and arg_47_1.time_ < var_50_12 + var_50_13 + arg_50_0 and arg_47_1.var_.characterEffect1042ui_story then
				arg_47_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_50_15 = 0
			local var_50_16 = 0.9

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[205].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(113051012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051012", "story_v_out_113051.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_113051", "113051012", "story_v_out_113051.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_113051", "113051012", "story_v_out_113051.awb")

						arg_47_1:RecordAudio("113051012", var_50_24)
						arg_47_1:RecordAudio("113051012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_113051", "113051012", "story_v_out_113051.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_113051", "113051012", "story_v_out_113051.awb")
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
	Play113051013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 113051013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play113051014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1042ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1042ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1042ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, 100, 0)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = 0
			local var_54_10 = 0.975

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_11 = arg_51_1:GetWordFromCfg(113051013)
				local var_54_12 = arg_51_1:FormatText(var_54_11.content)

				arg_51_1.text_.text = var_54_12

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_13 = 39
				local var_54_14 = utf8.len(var_54_12)
				local var_54_15 = var_54_13 <= 0 and var_54_10 or var_54_10 * (var_54_14 / var_54_13)

				if var_54_15 > 0 and var_54_10 < var_54_15 then
					arg_51_1.talkMaxDuration = var_54_15

					if var_54_15 + var_54_9 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_15 + var_54_9
					end
				end

				arg_51_1.text_.text = var_54_12
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_16 = math.max(var_54_10, arg_51_1.talkMaxDuration)

			if var_54_9 <= arg_51_1.time_ and arg_51_1.time_ < var_54_9 + var_54_16 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_9) / var_54_16

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_9 + var_54_16 and arg_51_1.time_ < var_54_9 + var_54_16 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play113051014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 113051014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play113051015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.225

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_2 = arg_55_1:GetWordFromCfg(113051014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 49
				local var_58_5 = utf8.len(var_58_3)
				local var_58_6 = var_58_4 <= 0 and var_58_1 or var_58_1 * (var_58_5 / var_58_4)

				if var_58_6 > 0 and var_58_1 < var_58_6 then
					arg_55_1.talkMaxDuration = var_58_6

					if var_58_6 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_6 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_3
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_7 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_7 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_7

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_7 and arg_55_1.time_ < var_58_0 + var_58_7 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play113051015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 113051015
		arg_59_1.duration_ = 4.933

		local var_59_0 = {
			ja = 4.933,
			ko = 4.033,
			zh = 3.7,
			en = 3.966
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
				arg_59_0:Play113051016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1084ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1084ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(-0.7, -0.97, -6)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1084ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = 0

			if var_62_9 < arg_59_1.time_ and arg_59_1.time_ <= var_62_9 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_62_11 = arg_59_1.actors_["1084ui_story"]
			local var_62_12 = 0

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_13 = 0.2

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_13 then
				local var_62_14 = (arg_59_1.time_ - var_62_12) / var_62_13

				if arg_59_1.var_.characterEffect1084ui_story then
					arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_12 + var_62_13 and arg_59_1.time_ < var_62_12 + var_62_13 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_62_15 = 0
			local var_62_16 = 0.325

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_17 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_18 = arg_59_1:GetWordFromCfg(113051015)
				local var_62_19 = arg_59_1:FormatText(var_62_18.content)

				arg_59_1.text_.text = var_62_19

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_20 = 13
				local var_62_21 = utf8.len(var_62_19)
				local var_62_22 = var_62_20 <= 0 and var_62_16 or var_62_16 * (var_62_21 / var_62_20)

				if var_62_22 > 0 and var_62_16 < var_62_22 then
					arg_59_1.talkMaxDuration = var_62_22

					if var_62_22 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_22 + var_62_15
					end
				end

				arg_59_1.text_.text = var_62_19
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051015", "story_v_out_113051.awb") ~= 0 then
					local var_62_23 = manager.audio:GetVoiceLength("story_v_out_113051", "113051015", "story_v_out_113051.awb") / 1000

					if var_62_23 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_23 + var_62_15
					end

					if var_62_18.prefab_name ~= "" and arg_59_1.actors_[var_62_18.prefab_name] ~= nil then
						local var_62_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_18.prefab_name].transform, "story_v_out_113051", "113051015", "story_v_out_113051.awb")

						arg_59_1:RecordAudio("113051015", var_62_24)
						arg_59_1:RecordAudio("113051015", var_62_24)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_113051", "113051015", "story_v_out_113051.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_113051", "113051015", "story_v_out_113051.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_25 = math.max(var_62_16, arg_59_1.talkMaxDuration)

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_25 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_15) / var_62_25

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_15 + var_62_25 and arg_59_1.time_ < var_62_15 + var_62_25 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play113051016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 113051016
		arg_63_1.duration_ = 8.9

		local var_63_0 = {
			ja = 8.9,
			ko = 6.433,
			zh = 4.533,
			en = 6.433
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
				arg_63_0:Play113051017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1084ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.4

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[216].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(113051016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 16
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051016", "story_v_out_113051.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_113051", "113051016", "story_v_out_113051.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_113051", "113051016", "story_v_out_113051.awb")

						arg_63_1:RecordAudio("113051016", var_66_15)
						arg_63_1:RecordAudio("113051016", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_113051", "113051016", "story_v_out_113051.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_113051", "113051016", "story_v_out_113051.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_16 and arg_63_1.time_ < var_66_6 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play113051017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 113051017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play113051018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.475

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

				local var_70_2 = arg_67_1:GetWordFromCfg(113051017)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 19
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
	Play113051018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 113051018
		arg_71_1.duration_ = 7.9

		local var_71_0 = {
			ja = 7.9,
			ko = 7,
			zh = 6.766,
			en = 7.3
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
				arg_71_0:Play113051019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1042ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1042ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0.7, -1.06, -6.2)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1042ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = 0

			if var_74_9 < arg_71_1.time_ and arg_71_1.time_ <= var_74_9 + arg_74_0 then
				arg_71_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_74_11 = arg_71_1.actors_["1042ui_story"]
			local var_74_12 = 0

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 and arg_71_1.var_.characterEffect1042ui_story == nil then
				arg_71_1.var_.characterEffect1042ui_story = var_74_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_13 = 0.2

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_13 then
				local var_74_14 = (arg_71_1.time_ - var_74_12) / var_74_13

				if arg_71_1.var_.characterEffect1042ui_story then
					arg_71_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_12 + var_74_13 and arg_71_1.time_ < var_74_12 + var_74_13 + arg_74_0 and arg_71_1.var_.characterEffect1042ui_story then
				arg_71_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_74_15 = 0
			local var_74_16 = 0.6

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_17 = arg_71_1:FormatText(StoryNameCfg[205].name)

				arg_71_1.leftNameTxt_.text = var_74_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_18 = arg_71_1:GetWordFromCfg(113051018)
				local var_74_19 = arg_71_1:FormatText(var_74_18.content)

				arg_71_1.text_.text = var_74_19

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_20 = 24
				local var_74_21 = utf8.len(var_74_19)
				local var_74_22 = var_74_20 <= 0 and var_74_16 or var_74_16 * (var_74_21 / var_74_20)

				if var_74_22 > 0 and var_74_16 < var_74_22 then
					arg_71_1.talkMaxDuration = var_74_22

					if var_74_22 + var_74_15 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_22 + var_74_15
					end
				end

				arg_71_1.text_.text = var_74_19
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051018", "story_v_out_113051.awb") ~= 0 then
					local var_74_23 = manager.audio:GetVoiceLength("story_v_out_113051", "113051018", "story_v_out_113051.awb") / 1000

					if var_74_23 + var_74_15 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_23 + var_74_15
					end

					if var_74_18.prefab_name ~= "" and arg_71_1.actors_[var_74_18.prefab_name] ~= nil then
						local var_74_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_18.prefab_name].transform, "story_v_out_113051", "113051018", "story_v_out_113051.awb")

						arg_71_1:RecordAudio("113051018", var_74_24)
						arg_71_1:RecordAudio("113051018", var_74_24)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_113051", "113051018", "story_v_out_113051.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_113051", "113051018", "story_v_out_113051.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_25 = math.max(var_74_16, arg_71_1.talkMaxDuration)

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_25 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_15) / var_74_25

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_15 + var_74_25 and arg_71_1.time_ < var_74_15 + var_74_25 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play113051019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 113051019
		arg_75_1.duration_ = 3.333

		local var_75_0 = {
			ja = 1.999999999999,
			ko = 3.3,
			zh = 3.333,
			en = 2.666
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
				arg_75_0:Play113051020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1042ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1042ui_story == nil then
				arg_75_1.var_.characterEffect1042ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1042ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1042ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1042ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1042ui_story.fillRatio = var_78_5
			end

			local var_78_6 = 0

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4136")
			end

			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 then
				arg_75_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_78_8 = arg_75_1.actors_["1084ui_story"]
			local var_78_9 = 0

			if var_78_9 < arg_75_1.time_ and arg_75_1.time_ <= var_78_9 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story == nil then
				arg_75_1.var_.characterEffect1084ui_story = var_78_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_10 = 0.2

			if var_78_9 <= arg_75_1.time_ and arg_75_1.time_ < var_78_9 + var_78_10 then
				local var_78_11 = (arg_75_1.time_ - var_78_9) / var_78_10

				if arg_75_1.var_.characterEffect1084ui_story then
					arg_75_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_9 + var_78_10 and arg_75_1.time_ < var_78_9 + var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story then
				arg_75_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_78_12 = 0
			local var_78_13 = 0.15

			if var_78_12 < arg_75_1.time_ and arg_75_1.time_ <= var_78_12 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_14 = arg_75_1:FormatText(StoryNameCfg[6].name)

				arg_75_1.leftNameTxt_.text = var_78_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_15 = arg_75_1:GetWordFromCfg(113051019)
				local var_78_16 = arg_75_1:FormatText(var_78_15.content)

				arg_75_1.text_.text = var_78_16

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_17 = 6
				local var_78_18 = utf8.len(var_78_16)
				local var_78_19 = var_78_17 <= 0 and var_78_13 or var_78_13 * (var_78_18 / var_78_17)

				if var_78_19 > 0 and var_78_13 < var_78_19 then
					arg_75_1.talkMaxDuration = var_78_19

					if var_78_19 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_12
					end
				end

				arg_75_1.text_.text = var_78_16
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051019", "story_v_out_113051.awb") ~= 0 then
					local var_78_20 = manager.audio:GetVoiceLength("story_v_out_113051", "113051019", "story_v_out_113051.awb") / 1000

					if var_78_20 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_12
					end

					if var_78_15.prefab_name ~= "" and arg_75_1.actors_[var_78_15.prefab_name] ~= nil then
						local var_78_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_15.prefab_name].transform, "story_v_out_113051", "113051019", "story_v_out_113051.awb")

						arg_75_1:RecordAudio("113051019", var_78_21)
						arg_75_1:RecordAudio("113051019", var_78_21)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_113051", "113051019", "story_v_out_113051.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_113051", "113051019", "story_v_out_113051.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_22 = math.max(var_78_13, arg_75_1.talkMaxDuration)

			if var_78_12 <= arg_75_1.time_ and arg_75_1.time_ < var_78_12 + var_78_22 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_12) / var_78_22

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_12 + var_78_22 and arg_75_1.time_ < var_78_12 + var_78_22 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play113051020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 113051020
		arg_79_1.duration_ = 3.3

		local var_79_0 = {
			ja = 3.066,
			ko = 3.133,
			zh = 2.666,
			en = 3.3
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
				arg_79_0:Play113051021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

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

			local var_82_6 = arg_79_1.actors_["1042ui_story"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.characterEffect1042ui_story == nil then
				arg_79_1.var_.characterEffect1042ui_story = var_82_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_8 = 0.2

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.characterEffect1042ui_story then
					arg_79_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.characterEffect1042ui_story then
				arg_79_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_82_12 = 0

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_82_14 = 0
			local var_82_15 = 0.35

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_16 = arg_79_1:FormatText(StoryNameCfg[205].name)

				arg_79_1.leftNameTxt_.text = var_82_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_17 = arg_79_1:GetWordFromCfg(113051020)
				local var_82_18 = arg_79_1:FormatText(var_82_17.content)

				arg_79_1.text_.text = var_82_18

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_19 = 14
				local var_82_20 = utf8.len(var_82_18)
				local var_82_21 = var_82_19 <= 0 and var_82_15 or var_82_15 * (var_82_20 / var_82_19)

				if var_82_21 > 0 and var_82_15 < var_82_21 then
					arg_79_1.talkMaxDuration = var_82_21

					if var_82_21 + var_82_14 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_14
					end
				end

				arg_79_1.text_.text = var_82_18
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051020", "story_v_out_113051.awb") ~= 0 then
					local var_82_22 = manager.audio:GetVoiceLength("story_v_out_113051", "113051020", "story_v_out_113051.awb") / 1000

					if var_82_22 + var_82_14 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_14
					end

					if var_82_17.prefab_name ~= "" and arg_79_1.actors_[var_82_17.prefab_name] ~= nil then
						local var_82_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_17.prefab_name].transform, "story_v_out_113051", "113051020", "story_v_out_113051.awb")

						arg_79_1:RecordAudio("113051020", var_82_23)
						arg_79_1:RecordAudio("113051020", var_82_23)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_113051", "113051020", "story_v_out_113051.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_113051", "113051020", "story_v_out_113051.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_24 = math.max(var_82_15, arg_79_1.talkMaxDuration)

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_24 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_14) / var_82_24

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_14 + var_82_24 and arg_79_1.time_ < var_82_14 + var_82_24 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play113051021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 113051021
		arg_83_1.duration_ = 9

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play113051022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_1 = 1.966

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, 100, 0)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_4, var_86_3)

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

			local var_86_9 = arg_83_1.actors_["1042ui_story"].transform
			local var_86_10 = 1.966

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.var_.moveOldPos1042ui_story = var_86_9.localPosition
			end

			local var_86_11 = 0.001

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11
				local var_86_13 = Vector3.New(0, 100, 0)

				var_86_9.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1042ui_story, var_86_13, var_86_12)

				local var_86_14 = manager.ui.mainCamera.transform.position - var_86_9.position

				var_86_9.forward = Vector3.New(var_86_14.x, var_86_14.y, var_86_14.z)

				local var_86_15 = var_86_9.localEulerAngles

				var_86_15.z = 0
				var_86_15.x = 0
				var_86_9.localEulerAngles = var_86_15
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 then
				var_86_9.localPosition = Vector3.New(0, 100, 0)

				local var_86_16 = manager.ui.mainCamera.transform.position - var_86_9.position

				var_86_9.forward = Vector3.New(var_86_16.x, var_86_16.y, var_86_16.z)

				local var_86_17 = var_86_9.localEulerAngles

				var_86_17.z = 0
				var_86_17.x = 0
				var_86_9.localEulerAngles = var_86_17
			end

			local var_86_18 = 0

			if var_86_18 < arg_83_1.time_ and arg_83_1.time_ <= var_86_18 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_19 = 2

			if var_86_18 <= arg_83_1.time_ and arg_83_1.time_ < var_86_18 + var_86_19 then
				local var_86_20 = (arg_83_1.time_ - var_86_18) / var_86_19
				local var_86_21 = Color.New(0, 0, 0)

				var_86_21.a = Mathf.Lerp(0, 1, var_86_20)
				arg_83_1.mask_.color = var_86_21
			end

			if arg_83_1.time_ >= var_86_18 + var_86_19 and arg_83_1.time_ < var_86_18 + var_86_19 + arg_86_0 then
				local var_86_22 = Color.New(0, 0, 0)

				var_86_22.a = 1
				arg_83_1.mask_.color = var_86_22
			end

			local var_86_23 = 2

			if var_86_23 < arg_83_1.time_ and arg_83_1.time_ <= var_86_23 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_24 = 2

			if var_86_23 <= arg_83_1.time_ and arg_83_1.time_ < var_86_23 + var_86_24 then
				local var_86_25 = (arg_83_1.time_ - var_86_23) / var_86_24
				local var_86_26 = Color.New(0, 0, 0)

				var_86_26.a = Mathf.Lerp(1, 0, var_86_25)
				arg_83_1.mask_.color = var_86_26
			end

			if arg_83_1.time_ >= var_86_23 + var_86_24 and arg_83_1.time_ < var_86_23 + var_86_24 + arg_86_0 then
				local var_86_27 = Color.New(0, 0, 0)
				local var_86_28 = 0

				arg_83_1.mask_.enabled = false
				var_86_27.a = var_86_28
				arg_83_1.mask_.color = var_86_27
			end

			local var_86_29 = "F01a"

			if arg_83_1.bgs_[var_86_29] == nil then
				local var_86_30 = Object.Instantiate(arg_83_1.paintGo_)

				var_86_30:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_86_29)
				var_86_30.name = var_86_29
				var_86_30.transform.parent = arg_83_1.stage_.transform
				var_86_30.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.bgs_[var_86_29] = var_86_30
			end

			local var_86_31 = 2

			if var_86_31 < arg_83_1.time_ and arg_83_1.time_ <= var_86_31 + arg_86_0 then
				local var_86_32 = manager.ui.mainCamera.transform.localPosition
				local var_86_33 = Vector3.New(0, 0, 10) + Vector3.New(var_86_32.x, var_86_32.y, 0)
				local var_86_34 = arg_83_1.bgs_.F01a

				var_86_34.transform.localPosition = var_86_33
				var_86_34.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_35 = var_86_34:GetComponent("SpriteRenderer")

				if var_86_35 and var_86_35.sprite then
					local var_86_36 = (var_86_34.transform.localPosition - var_86_32).z
					local var_86_37 = manager.ui.mainCameraCom_
					local var_86_38 = 2 * var_86_36 * Mathf.Tan(var_86_37.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_39 = var_86_38 * var_86_37.aspect
					local var_86_40 = var_86_35.sprite.bounds.size.x
					local var_86_41 = var_86_35.sprite.bounds.size.y
					local var_86_42 = var_86_39 / var_86_40
					local var_86_43 = var_86_38 / var_86_41
					local var_86_44 = var_86_43 < var_86_42 and var_86_42 or var_86_43

					var_86_34.transform.localScale = Vector3.New(var_86_44, var_86_44, 0)
				end

				for iter_86_0, iter_86_1 in pairs(arg_83_1.bgs_) do
					if iter_86_0 ~= "F01a" then
						iter_86_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_45 = 0
			local var_86_46 = 1

			if var_86_45 < arg_83_1.time_ and arg_83_1.time_ <= var_86_45 + arg_86_0 then
				local var_86_47 = "play"
				local var_86_48 = "music"

				arg_83_1:AudioAction(var_86_47, var_86_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_49 = 4
			local var_86_50 = 0.625

			if var_86_49 < arg_83_1.time_ and arg_83_1.time_ <= var_86_49 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_51 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_51:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_52 = arg_83_1:GetWordFromCfg(113051021)
				local var_86_53 = arg_83_1:FormatText(var_86_52.content)

				arg_83_1.text_.text = var_86_53

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_54 = 25
				local var_86_55 = utf8.len(var_86_53)
				local var_86_56 = var_86_54 <= 0 and var_86_50 or var_86_50 * (var_86_55 / var_86_54)

				if var_86_56 > 0 and var_86_50 < var_86_56 then
					arg_83_1.talkMaxDuration = var_86_56
					var_86_49 = var_86_49 + 0.3

					if var_86_56 + var_86_49 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_56 + var_86_49
					end
				end

				arg_83_1.text_.text = var_86_53
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_57 = var_86_49 + 0.3
			local var_86_58 = math.max(var_86_50, arg_83_1.talkMaxDuration)

			if var_86_57 <= arg_83_1.time_ and arg_83_1.time_ < var_86_57 + var_86_58 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_57) / var_86_58

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_57 + var_86_58 and arg_83_1.time_ < var_86_57 + var_86_58 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play113051022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 113051022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play113051023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.2

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

				local var_92_2 = arg_89_1:GetWordFromCfg(113051022)
				local var_92_3 = arg_89_1:FormatText(var_92_2.content)

				arg_89_1.text_.text = var_92_3

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_4 = 48
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
	Play113051023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 113051023
		arg_93_1.duration_ = 4.133

		local var_93_0 = {
			ja = 4.133,
			ko = 2.233,
			zh = 2.6,
			en = 2.633
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
				arg_93_0:Play113051024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 1

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				local var_96_2 = "play"
				local var_96_3 = "music"

				arg_93_1:AudioAction(var_96_2, var_96_3, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			local var_96_4 = 0
			local var_96_5 = 0.275

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_6 = arg_93_1:FormatText(StoryNameCfg[213].name)

				arg_93_1.leftNameTxt_.text = var_96_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_7 = arg_93_1:GetWordFromCfg(113051023)
				local var_96_8 = arg_93_1:FormatText(var_96_7.content)

				arg_93_1.text_.text = var_96_8

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_9 = 11
				local var_96_10 = utf8.len(var_96_8)
				local var_96_11 = var_96_9 <= 0 and var_96_5 or var_96_5 * (var_96_10 / var_96_9)

				if var_96_11 > 0 and var_96_5 < var_96_11 then
					arg_93_1.talkMaxDuration = var_96_11

					if var_96_11 + var_96_4 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_11 + var_96_4
					end
				end

				arg_93_1.text_.text = var_96_8
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051023", "story_v_out_113051.awb") ~= 0 then
					local var_96_12 = manager.audio:GetVoiceLength("story_v_out_113051", "113051023", "story_v_out_113051.awb") / 1000

					if var_96_12 + var_96_4 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_4
					end

					if var_96_7.prefab_name ~= "" and arg_93_1.actors_[var_96_7.prefab_name] ~= nil then
						local var_96_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_7.prefab_name].transform, "story_v_out_113051", "113051023", "story_v_out_113051.awb")

						arg_93_1:RecordAudio("113051023", var_96_13)
						arg_93_1:RecordAudio("113051023", var_96_13)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_113051", "113051023", "story_v_out_113051.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_113051", "113051023", "story_v_out_113051.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_5, arg_93_1.talkMaxDuration)

			if var_96_4 <= arg_93_1.time_ and arg_93_1.time_ < var_96_4 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_4) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_4 + var_96_14 and arg_93_1.time_ < var_96_4 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play113051024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 113051024
		arg_97_1.duration_ = 2

		local var_97_0 = {
			ja = 2,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_97_0:Play113051025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_100_2 = arg_97_1.actors_["1041ui_story"]
			local var_100_3 = 0

			if var_100_3 < arg_97_1.time_ and arg_97_1.time_ <= var_100_3 + arg_100_0 and arg_97_1.var_.characterEffect1041ui_story == nil then
				arg_97_1.var_.characterEffect1041ui_story = var_100_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_4 = 0.2

			if var_100_3 <= arg_97_1.time_ and arg_97_1.time_ < var_100_3 + var_100_4 then
				local var_100_5 = (arg_97_1.time_ - var_100_3) / var_100_4

				if arg_97_1.var_.characterEffect1041ui_story then
					arg_97_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_3 + var_100_4 and arg_97_1.time_ < var_100_3 + var_100_4 + arg_100_0 and arg_97_1.var_.characterEffect1041ui_story then
				arg_97_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_100_6 = arg_97_1.actors_["1041ui_story"].transform
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 then
				arg_97_1.var_.moveOldPos1041ui_story = var_100_6.localPosition
			end

			local var_100_8 = 0.001

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8
				local var_100_10 = Vector3.New(0, -1.11, -5.9)

				var_100_6.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1041ui_story, var_100_10, var_100_9)

				local var_100_11 = manager.ui.mainCamera.transform.position - var_100_6.position

				var_100_6.forward = Vector3.New(var_100_11.x, var_100_11.y, var_100_11.z)

				local var_100_12 = var_100_6.localEulerAngles

				var_100_12.z = 0
				var_100_12.x = 0
				var_100_6.localEulerAngles = var_100_12
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 then
				var_100_6.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_100_13 = manager.ui.mainCamera.transform.position - var_100_6.position

				var_100_6.forward = Vector3.New(var_100_13.x, var_100_13.y, var_100_13.z)

				local var_100_14 = var_100_6.localEulerAngles

				var_100_14.z = 0
				var_100_14.x = 0
				var_100_6.localEulerAngles = var_100_14
			end

			local var_100_15 = 0
			local var_100_16 = 0.2

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[208].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(113051024)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 8
				local var_100_21 = utf8.len(var_100_19)
				local var_100_22 = var_100_20 <= 0 and var_100_16 or var_100_16 * (var_100_21 / var_100_20)

				if var_100_22 > 0 and var_100_16 < var_100_22 then
					arg_97_1.talkMaxDuration = var_100_22

					if var_100_22 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_22 + var_100_15
					end
				end

				arg_97_1.text_.text = var_100_19
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051024", "story_v_out_113051.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_out_113051", "113051024", "story_v_out_113051.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_out_113051", "113051024", "story_v_out_113051.awb")

						arg_97_1:RecordAudio("113051024", var_100_24)
						arg_97_1:RecordAudio("113051024", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_113051", "113051024", "story_v_out_113051.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_113051", "113051024", "story_v_out_113051.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_25 = math.max(var_100_16, arg_97_1.talkMaxDuration)

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_25 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_15) / var_100_25

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_15 + var_100_25 and arg_97_1.time_ < var_100_15 + var_100_25 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play113051025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 113051025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play113051026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1041ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1041ui_story == nil then
				arg_101_1.var_.characterEffect1041ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.2

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1041ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1041ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1041ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1041ui_story.fillRatio = var_104_5
			end

			local var_104_6 = 0
			local var_104_7 = 0.8

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_8 = arg_101_1:GetWordFromCfg(113051025)
				local var_104_9 = arg_101_1:FormatText(var_104_8.content)

				arg_101_1.text_.text = var_104_9

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_10 = 32
				local var_104_11 = utf8.len(var_104_9)
				local var_104_12 = var_104_10 <= 0 and var_104_7 or var_104_7 * (var_104_11 / var_104_10)

				if var_104_12 > 0 and var_104_7 < var_104_12 then
					arg_101_1.talkMaxDuration = var_104_12

					if var_104_12 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_12 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_9
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_13 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_13 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_13

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_13 and arg_101_1.time_ < var_104_6 + var_104_13 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play113051026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 113051026
		arg_105_1.duration_ = 13.733

		local var_105_0 = {
			ja = 13.733,
			ko = 7.9,
			zh = 9.066,
			en = 12.066
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
				arg_105_0:Play113051027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_108_1 = arg_105_1.actors_["1041ui_story"]
			local var_108_2 = 0

			if var_108_2 < arg_105_1.time_ and arg_105_1.time_ <= var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1041ui_story == nil then
				arg_105_1.var_.characterEffect1041ui_story = var_108_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_3 = 0.2

			if var_108_2 <= arg_105_1.time_ and arg_105_1.time_ < var_108_2 + var_108_3 then
				local var_108_4 = (arg_105_1.time_ - var_108_2) / var_108_3

				if arg_105_1.var_.characterEffect1041ui_story then
					arg_105_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_2 + var_108_3 and arg_105_1.time_ < var_108_2 + var_108_3 + arg_108_0 and arg_105_1.var_.characterEffect1041ui_story then
				arg_105_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_108_5 = 0
			local var_108_6 = 1.025

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_7 = arg_105_1:FormatText(StoryNameCfg[208].name)

				arg_105_1.leftNameTxt_.text = var_108_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_8 = arg_105_1:GetWordFromCfg(113051026)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 41
				local var_108_11 = utf8.len(var_108_9)
				local var_108_12 = var_108_10 <= 0 and var_108_6 or var_108_6 * (var_108_11 / var_108_10)

				if var_108_12 > 0 and var_108_6 < var_108_12 then
					arg_105_1.talkMaxDuration = var_108_12

					if var_108_12 + var_108_5 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_5
					end
				end

				arg_105_1.text_.text = var_108_9
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051026", "story_v_out_113051.awb") ~= 0 then
					local var_108_13 = manager.audio:GetVoiceLength("story_v_out_113051", "113051026", "story_v_out_113051.awb") / 1000

					if var_108_13 + var_108_5 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_5
					end

					if var_108_8.prefab_name ~= "" and arg_105_1.actors_[var_108_8.prefab_name] ~= nil then
						local var_108_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_8.prefab_name].transform, "story_v_out_113051", "113051026", "story_v_out_113051.awb")

						arg_105_1:RecordAudio("113051026", var_108_14)
						arg_105_1:RecordAudio("113051026", var_108_14)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_113051", "113051026", "story_v_out_113051.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_113051", "113051026", "story_v_out_113051.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_15 = math.max(var_108_6, arg_105_1.talkMaxDuration)

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_15 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_5) / var_108_15

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_5 + var_108_15 and arg_105_1.time_ < var_108_5 + var_108_15 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play113051027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 113051027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play113051028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1041ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1041ui_story == nil then
				arg_109_1.var_.characterEffect1041ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.2

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1041ui_story then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1041ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1041ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1041ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 0.675

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_8 = arg_109_1:GetWordFromCfg(113051027)
				local var_112_9 = arg_109_1:FormatText(var_112_8.content)

				arg_109_1.text_.text = var_112_9

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_10 = 27
				local var_112_11 = utf8.len(var_112_9)
				local var_112_12 = var_112_10 <= 0 and var_112_7 or var_112_7 * (var_112_11 / var_112_10)

				if var_112_12 > 0 and var_112_7 < var_112_12 then
					arg_109_1.talkMaxDuration = var_112_12

					if var_112_12 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_12 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_9
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_13 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_13 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_13

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_13 and arg_109_1.time_ < var_112_6 + var_112_13 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play113051028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 113051028
		arg_113_1.duration_ = 5.366

		local var_113_0 = {
			ja = 5.133333333332,
			ko = 5.133333333332,
			zh = 5.133333333332,
			en = 5.366
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
				arg_113_0:Play113051029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1041ui_story"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos1041ui_story = var_116_0.localPosition

				local var_116_2 = "1041ui_story"

				arg_113_1:ShowWeapon(arg_113_1.var_[var_116_2 .. "Animator"].transform, true)
			end

			local var_116_3 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_3 then
				local var_116_4 = (arg_113_1.time_ - var_116_1) / var_116_3
				local var_116_5 = Vector3.New(0, 100, 0)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1041ui_story, var_116_5, var_116_4)

				local var_116_6 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_6.x, var_116_6.y, var_116_6.z)

				local var_116_7 = var_116_0.localEulerAngles

				var_116_7.z = 0
				var_116_7.x = 0
				var_116_0.localEulerAngles = var_116_7
			end

			if arg_113_1.time_ >= var_116_1 + var_116_3 and arg_113_1.time_ < var_116_1 + var_116_3 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(0, 100, 0)

				local var_116_8 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_8.x, var_116_8.y, var_116_8.z)

				local var_116_9 = var_116_0.localEulerAngles

				var_116_9.z = 0
				var_116_9.x = 0
				var_116_0.localEulerAngles = var_116_9
			end

			local var_116_10 = manager.ui.mainCamera.transform
			local var_116_11 = 4

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				local var_116_12 = arg_113_1.var_.effectF03daoguang1

				if not var_116_12 then
					var_116_12 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_116_12.name = "daoguang1"
					arg_113_1.var_.effectF03daoguang1 = var_116_12
				end

				local var_116_13 = var_116_10:Find("")

				if var_116_13 then
					var_116_12.transform.parent = var_116_13
				else
					var_116_12.transform.parent = var_116_10
				end

				var_116_12.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_116_12.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_116_14 = manager.ui.mainCamera.transform
			local var_116_15 = 4.86666666666667

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				local var_116_16 = arg_113_1.var_.effectF03daoguang1

				if var_116_16 then
					Object.Destroy(var_116_16)

					arg_113_1.var_.effectF03daoguang1 = nil
				end
			end

			local var_116_17 = manager.ui.mainCamera.transform
			local var_116_18 = 4

			if var_116_18 < arg_113_1.time_ and arg_113_1.time_ <= var_116_18 + arg_116_0 then
				arg_113_1.var_.shakeOldPosF03 = var_116_17.localPosition
			end

			local var_116_19 = 0.6

			if var_116_18 <= arg_113_1.time_ and arg_113_1.time_ < var_116_18 + var_116_19 then
				local var_116_20 = (arg_113_1.time_ - var_116_18) / 0.066
				local var_116_21, var_116_22 = math.modf(var_116_20)

				var_116_17.localPosition = Vector3.New(var_116_22 * 0.13, var_116_22 * 0.13, var_116_22 * 0.13) + arg_113_1.var_.shakeOldPosF03
			end

			if arg_113_1.time_ >= var_116_18 + var_116_19 and arg_113_1.time_ < var_116_18 + var_116_19 + arg_116_0 then
				var_116_17.localPosition = arg_113_1.var_.shakeOldPosF03
			end

			local var_116_23 = 0

			if var_116_23 < arg_113_1.time_ and arg_113_1.time_ <= var_116_23 + arg_116_0 then
				arg_113_1.allBtn_.enabled = false
			end

			local var_116_24 = 2.36666666666667

			if arg_113_1.time_ >= var_116_23 + var_116_24 and arg_113_1.time_ < var_116_23 + var_116_24 + arg_116_0 then
				arg_113_1.allBtn_.enabled = true
			end

			local var_116_25 = 3.6
			local var_116_26 = 1

			if var_116_25 < arg_113_1.time_ and arg_113_1.time_ <= var_116_25 + arg_116_0 then
				local var_116_27 = "play"
				local var_116_28 = "effect"

				arg_113_1:AudioAction(var_116_27, var_116_28, "se_story_10", "se_story_10_sword02", "")
			end

			local var_116_29 = 0
			local var_116_30 = 0.55

			if var_116_29 < arg_113_1.time_ and arg_113_1.time_ <= var_116_29 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_31 = arg_113_1:FormatText(StoryNameCfg[208].name)

				arg_113_1.leftNameTxt_.text = var_116_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_32 = arg_113_1:GetWordFromCfg(113051028)
				local var_116_33 = arg_113_1:FormatText(var_116_32.content)

				arg_113_1.text_.text = var_116_33

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_34 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051028", "story_v_out_113051.awb") ~= 0 then
					local var_116_37 = manager.audio:GetVoiceLength("story_v_out_113051", "113051028", "story_v_out_113051.awb") / 1000

					if var_116_37 + var_116_29 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_37 + var_116_29
					end

					if var_116_32.prefab_name ~= "" and arg_113_1.actors_[var_116_32.prefab_name] ~= nil then
						local var_116_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_32.prefab_name].transform, "story_v_out_113051", "113051028", "story_v_out_113051.awb")

						arg_113_1:RecordAudio("113051028", var_116_38)
						arg_113_1:RecordAudio("113051028", var_116_38)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_113051", "113051028", "story_v_out_113051.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_113051", "113051028", "story_v_out_113051.awb")
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
	Play113051029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 113051029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play113051030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1041ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1041ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, 100, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1041ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, 100, 0)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = 0
			local var_120_10 = 0.55

			if var_120_9 < arg_117_1.time_ and arg_117_1.time_ <= var_120_9 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_11 = arg_117_1:GetWordFromCfg(113051029)
				local var_120_12 = arg_117_1:FormatText(var_120_11.content)

				arg_117_1.text_.text = var_120_12

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_13 = 22
				local var_120_14 = utf8.len(var_120_12)
				local var_120_15 = var_120_13 <= 0 and var_120_10 or var_120_10 * (var_120_14 / var_120_13)

				if var_120_15 > 0 and var_120_10 < var_120_15 then
					arg_117_1.talkMaxDuration = var_120_15

					if var_120_15 + var_120_9 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_15 + var_120_9
					end
				end

				arg_117_1.text_.text = var_120_12
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_16 = math.max(var_120_10, arg_117_1.talkMaxDuration)

			if var_120_9 <= arg_117_1.time_ and arg_117_1.time_ < var_120_9 + var_120_16 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_9) / var_120_16

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_9 + var_120_16 and arg_117_1.time_ < var_120_9 + var_120_16 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play113051030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 113051030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play113051031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.8

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_2 = arg_121_1:GetWordFromCfg(113051030)
				local var_124_3 = arg_121_1:FormatText(var_124_2.content)

				arg_121_1.text_.text = var_124_3

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_4 = 32
				local var_124_5 = utf8.len(var_124_3)
				local var_124_6 = var_124_4 <= 0 and var_124_1 or var_124_1 * (var_124_5 / var_124_4)

				if var_124_6 > 0 and var_124_1 < var_124_6 then
					arg_121_1.talkMaxDuration = var_124_6

					if var_124_6 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_6 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_3
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_7 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_7 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_7

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_7 and arg_121_1.time_ < var_124_0 + var_124_7 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play113051031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 113051031
		arg_125_1.duration_ = 4.4

		local var_125_0 = {
			ja = 3.5,
			ko = 3.766,
			zh = 2.733,
			en = 4.4
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
				arg_125_0:Play113051032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1038ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1038ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1038ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 then
				arg_125_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action7_1")
			end

			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 then
				arg_125_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_128_11 = arg_125_1.actors_["1038ui_story"]
			local var_128_12 = 0

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 and arg_125_1.var_.characterEffect1038ui_story == nil then
				arg_125_1.var_.characterEffect1038ui_story = var_128_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_13 = 0.2

			if var_128_12 <= arg_125_1.time_ and arg_125_1.time_ < var_128_12 + var_128_13 then
				local var_128_14 = (arg_125_1.time_ - var_128_12) / var_128_13

				if arg_125_1.var_.characterEffect1038ui_story then
					arg_125_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_12 + var_128_13 and arg_125_1.time_ < var_128_12 + var_128_13 + arg_128_0 and arg_125_1.var_.characterEffect1038ui_story then
				arg_125_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_128_15 = 0
			local var_128_16 = 0.3

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_17 = arg_125_1:FormatText(StoryNameCfg[94].name)

				arg_125_1.leftNameTxt_.text = var_128_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_18 = arg_125_1:GetWordFromCfg(113051031)
				local var_128_19 = arg_125_1:FormatText(var_128_18.content)

				arg_125_1.text_.text = var_128_19

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_20 = 12
				local var_128_21 = utf8.len(var_128_19)
				local var_128_22 = var_128_20 <= 0 and var_128_16 or var_128_16 * (var_128_21 / var_128_20)

				if var_128_22 > 0 and var_128_16 < var_128_22 then
					arg_125_1.talkMaxDuration = var_128_22

					if var_128_22 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_22 + var_128_15
					end
				end

				arg_125_1.text_.text = var_128_19
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051031", "story_v_out_113051.awb") ~= 0 then
					local var_128_23 = manager.audio:GetVoiceLength("story_v_out_113051", "113051031", "story_v_out_113051.awb") / 1000

					if var_128_23 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_15
					end

					if var_128_18.prefab_name ~= "" and arg_125_1.actors_[var_128_18.prefab_name] ~= nil then
						local var_128_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_18.prefab_name].transform, "story_v_out_113051", "113051031", "story_v_out_113051.awb")

						arg_125_1:RecordAudio("113051031", var_128_24)
						arg_125_1:RecordAudio("113051031", var_128_24)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_113051", "113051031", "story_v_out_113051.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_113051", "113051031", "story_v_out_113051.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_25 = math.max(var_128_16, arg_125_1.talkMaxDuration)

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_25 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_15) / var_128_25

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_15 + var_128_25 and arg_125_1.time_ < var_128_15 + var_128_25 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play113051032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 113051032
		arg_129_1.duration_ = 1.999999999999

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play113051033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1038ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1038ui_story == nil then
				arg_129_1.var_.characterEffect1038ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.2

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1038ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1038ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1038ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1038ui_story.fillRatio = var_132_5
			end

			local var_132_6 = 0

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action7_1")
			end

			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 then
				arg_129_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_132_8 = arg_129_1.actors_["1041ui_story"]
			local var_132_9 = 0

			if var_132_9 < arg_129_1.time_ and arg_129_1.time_ <= var_132_9 + arg_132_0 and arg_129_1.var_.characterEffect1041ui_story == nil then
				arg_129_1.var_.characterEffect1041ui_story = var_132_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_10 = 0.2

			if var_132_9 <= arg_129_1.time_ and arg_129_1.time_ < var_132_9 + var_132_10 then
				local var_132_11 = (arg_129_1.time_ - var_132_9) / var_132_10

				if arg_129_1.var_.characterEffect1041ui_story then
					arg_129_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_9 + var_132_10 and arg_129_1.time_ < var_132_9 + var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1041ui_story then
				arg_129_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_132_12 = arg_129_1.actors_["1041ui_story"].transform
			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1.var_.moveOldPos1041ui_story = var_132_12.localPosition
			end

			local var_132_14 = 0.001

			if var_132_13 <= arg_129_1.time_ and arg_129_1.time_ < var_132_13 + var_132_14 then
				local var_132_15 = (arg_129_1.time_ - var_132_13) / var_132_14
				local var_132_16 = Vector3.New(0.7, -1.11, -5.9)

				var_132_12.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1041ui_story, var_132_16, var_132_15)

				local var_132_17 = manager.ui.mainCamera.transform.position - var_132_12.position

				var_132_12.forward = Vector3.New(var_132_17.x, var_132_17.y, var_132_17.z)

				local var_132_18 = var_132_12.localEulerAngles

				var_132_18.z = 0
				var_132_18.x = 0
				var_132_12.localEulerAngles = var_132_18
			end

			if arg_129_1.time_ >= var_132_13 + var_132_14 and arg_129_1.time_ < var_132_13 + var_132_14 + arg_132_0 then
				var_132_12.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_132_19 = manager.ui.mainCamera.transform.position - var_132_12.position

				var_132_12.forward = Vector3.New(var_132_19.x, var_132_19.y, var_132_19.z)

				local var_132_20 = var_132_12.localEulerAngles

				var_132_20.z = 0
				var_132_20.x = 0
				var_132_12.localEulerAngles = var_132_20
			end

			local var_132_21 = 0
			local var_132_22 = 0.1

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_23 = arg_129_1:FormatText(StoryNameCfg[208].name)

				arg_129_1.leftNameTxt_.text = var_132_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_24 = arg_129_1:GetWordFromCfg(113051032)
				local var_132_25 = arg_129_1:FormatText(var_132_24.content)

				arg_129_1.text_.text = var_132_25

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_26 = 4
				local var_132_27 = utf8.len(var_132_25)
				local var_132_28 = var_132_26 <= 0 and var_132_22 or var_132_22 * (var_132_27 / var_132_26)

				if var_132_28 > 0 and var_132_22 < var_132_28 then
					arg_129_1.talkMaxDuration = var_132_28

					if var_132_28 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_21
					end
				end

				arg_129_1.text_.text = var_132_25
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051032", "story_v_out_113051.awb") ~= 0 then
					local var_132_29 = manager.audio:GetVoiceLength("story_v_out_113051", "113051032", "story_v_out_113051.awb") / 1000

					if var_132_29 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_29 + var_132_21
					end

					if var_132_24.prefab_name ~= "" and arg_129_1.actors_[var_132_24.prefab_name] ~= nil then
						local var_132_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_24.prefab_name].transform, "story_v_out_113051", "113051032", "story_v_out_113051.awb")

						arg_129_1:RecordAudio("113051032", var_132_30)
						arg_129_1:RecordAudio("113051032", var_132_30)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_113051", "113051032", "story_v_out_113051.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_113051", "113051032", "story_v_out_113051.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_31 = math.max(var_132_22, arg_129_1.talkMaxDuration)

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_31 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_21) / var_132_31

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_21 + var_132_31 and arg_129_1.time_ < var_132_21 + var_132_31 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play113051033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 113051033
		arg_133_1.duration_ = 19.5

		local var_133_0 = {
			ja = 19.5,
			ko = 11.7,
			zh = 11.3,
			en = 13.833
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
				arg_133_0:Play113051034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1038ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1038ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, 100, 0)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1038ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, 100, 0)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1041ui_story"].transform
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.var_.moveOldPos1041ui_story = var_136_9.localPosition
			end

			local var_136_11 = 0.001

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11
				local var_136_13 = Vector3.New(0, 100, 0)

				var_136_9.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1041ui_story, var_136_13, var_136_12)

				local var_136_14 = manager.ui.mainCamera.transform.position - var_136_9.position

				var_136_9.forward = Vector3.New(var_136_14.x, var_136_14.y, var_136_14.z)

				local var_136_15 = var_136_9.localEulerAngles

				var_136_15.z = 0
				var_136_15.x = 0
				var_136_9.localEulerAngles = var_136_15
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 then
				var_136_9.localPosition = Vector3.New(0, 100, 0)

				local var_136_16 = manager.ui.mainCamera.transform.position - var_136_9.position

				var_136_9.forward = Vector3.New(var_136_16.x, var_136_16.y, var_136_16.z)

				local var_136_17 = var_136_9.localEulerAngles

				var_136_17.z = 0
				var_136_17.x = 0
				var_136_9.localEulerAngles = var_136_17
			end

			local var_136_18 = arg_133_1.actors_["1042ui_story"].transform
			local var_136_19 = 0

			if var_136_19 < arg_133_1.time_ and arg_133_1.time_ <= var_136_19 + arg_136_0 then
				arg_133_1.var_.moveOldPos1042ui_story = var_136_18.localPosition
			end

			local var_136_20 = 0.001

			if var_136_19 <= arg_133_1.time_ and arg_133_1.time_ < var_136_19 + var_136_20 then
				local var_136_21 = (arg_133_1.time_ - var_136_19) / var_136_20
				local var_136_22 = Vector3.New(0, -1.06, -6.2)

				var_136_18.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1042ui_story, var_136_22, var_136_21)

				local var_136_23 = manager.ui.mainCamera.transform.position - var_136_18.position

				var_136_18.forward = Vector3.New(var_136_23.x, var_136_23.y, var_136_23.z)

				local var_136_24 = var_136_18.localEulerAngles

				var_136_24.z = 0
				var_136_24.x = 0
				var_136_18.localEulerAngles = var_136_24
			end

			if arg_133_1.time_ >= var_136_19 + var_136_20 and arg_133_1.time_ < var_136_19 + var_136_20 + arg_136_0 then
				var_136_18.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_136_25 = manager.ui.mainCamera.transform.position - var_136_18.position

				var_136_18.forward = Vector3.New(var_136_25.x, var_136_25.y, var_136_25.z)

				local var_136_26 = var_136_18.localEulerAngles

				var_136_26.z = 0
				var_136_26.x = 0
				var_136_18.localEulerAngles = var_136_26
			end

			local var_136_27 = 0

			if var_136_27 < arg_133_1.time_ and arg_133_1.time_ <= var_136_27 + arg_136_0 then
				arg_133_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_136_28 = 0

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 then
				arg_133_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_136_29 = arg_133_1.actors_["1042ui_story"]
			local var_136_30 = 0

			if var_136_30 < arg_133_1.time_ and arg_133_1.time_ <= var_136_30 + arg_136_0 and arg_133_1.var_.characterEffect1042ui_story == nil then
				arg_133_1.var_.characterEffect1042ui_story = var_136_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_31 = 0.2

			if var_136_30 <= arg_133_1.time_ and arg_133_1.time_ < var_136_30 + var_136_31 then
				local var_136_32 = (arg_133_1.time_ - var_136_30) / var_136_31

				if arg_133_1.var_.characterEffect1042ui_story then
					arg_133_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_30 + var_136_31 and arg_133_1.time_ < var_136_30 + var_136_31 + arg_136_0 and arg_133_1.var_.characterEffect1042ui_story then
				arg_133_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_136_33 = 0
			local var_136_34 = 1.375

			if var_136_33 < arg_133_1.time_ and arg_133_1.time_ <= var_136_33 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_35 = arg_133_1:FormatText(StoryNameCfg[205].name)

				arg_133_1.leftNameTxt_.text = var_136_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_36 = arg_133_1:GetWordFromCfg(113051033)
				local var_136_37 = arg_133_1:FormatText(var_136_36.content)

				arg_133_1.text_.text = var_136_37

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_38 = 54
				local var_136_39 = utf8.len(var_136_37)
				local var_136_40 = var_136_38 <= 0 and var_136_34 or var_136_34 * (var_136_39 / var_136_38)

				if var_136_40 > 0 and var_136_34 < var_136_40 then
					arg_133_1.talkMaxDuration = var_136_40

					if var_136_40 + var_136_33 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_40 + var_136_33
					end
				end

				arg_133_1.text_.text = var_136_37
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051033", "story_v_out_113051.awb") ~= 0 then
					local var_136_41 = manager.audio:GetVoiceLength("story_v_out_113051", "113051033", "story_v_out_113051.awb") / 1000

					if var_136_41 + var_136_33 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_41 + var_136_33
					end

					if var_136_36.prefab_name ~= "" and arg_133_1.actors_[var_136_36.prefab_name] ~= nil then
						local var_136_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_36.prefab_name].transform, "story_v_out_113051", "113051033", "story_v_out_113051.awb")

						arg_133_1:RecordAudio("113051033", var_136_42)
						arg_133_1:RecordAudio("113051033", var_136_42)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_113051", "113051033", "story_v_out_113051.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_113051", "113051033", "story_v_out_113051.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_43 = math.max(var_136_34, arg_133_1.talkMaxDuration)

			if var_136_33 <= arg_133_1.time_ and arg_133_1.time_ < var_136_33 + var_136_43 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_33) / var_136_43

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_33 + var_136_43 and arg_133_1.time_ < var_136_33 + var_136_43 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play113051034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 113051034
		arg_137_1.duration_ = 6.83333333333333

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play113051035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1042ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1042ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, 100, 0)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1042ui_story, var_140_4, var_140_3)

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

			local var_140_9 = 0

			if var_140_9 < arg_137_1.time_ and arg_137_1.time_ <= var_140_9 + arg_140_0 then
				arg_137_1.mask_.enabled = true
				arg_137_1.mask_.raycastTarget = true

				arg_137_1:SetGaussion(false)
			end

			local var_140_10 = 1.5

			if var_140_9 <= arg_137_1.time_ and arg_137_1.time_ < var_140_9 + var_140_10 then
				local var_140_11 = (arg_137_1.time_ - var_140_9) / var_140_10
				local var_140_12 = Color.New(1, 1, 1)

				var_140_12.a = Mathf.Lerp(1, 0, var_140_11)
				arg_137_1.mask_.color = var_140_12
			end

			if arg_137_1.time_ >= var_140_9 + var_140_10 and arg_137_1.time_ < var_140_9 + var_140_10 + arg_140_0 then
				local var_140_13 = Color.New(1, 1, 1)
				local var_140_14 = 0

				arg_137_1.mask_.enabled = false
				var_140_13.a = var_140_14
				arg_137_1.mask_.color = var_140_13
			end

			local var_140_15 = 1.5

			if var_140_15 < arg_137_1.time_ and arg_137_1.time_ <= var_140_15 + arg_140_0 then
				arg_137_1.allBtn_.enabled = false
			end

			local var_140_16 = 0.333333333333333

			if arg_137_1.time_ >= var_140_15 + var_140_16 and arg_137_1.time_ < var_140_15 + var_140_16 + arg_140_0 then
				arg_137_1.allBtn_.enabled = true
			end

			if arg_137_1.frameCnt_ <= 1 then
				arg_137_1.dialog_:SetActive(false)
			end

			local var_140_17 = 1.83333333333333
			local var_140_18 = 0.875

			if var_140_17 < arg_137_1.time_ and arg_137_1.time_ <= var_140_17 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0

				arg_137_1.dialog_:SetActive(true)

				local var_140_19 = LeanTween.value(arg_137_1.dialog_, 0, 1, 0.3)

				var_140_19:setOnUpdate(LuaHelper.FloatAction(function(arg_141_0)
					arg_137_1.dialogCg_.alpha = arg_141_0
				end))
				var_140_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_137_1.dialog_)
					var_140_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_137_1.duration_ = arg_137_1.duration_ + 0.3

				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_20 = arg_137_1:GetWordFromCfg(113051034)
				local var_140_21 = arg_137_1:FormatText(var_140_20.content)

				arg_137_1.text_.text = var_140_21

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_22 = 35
				local var_140_23 = utf8.len(var_140_21)
				local var_140_24 = var_140_22 <= 0 and var_140_18 or var_140_18 * (var_140_23 / var_140_22)

				if var_140_24 > 0 and var_140_18 < var_140_24 then
					arg_137_1.talkMaxDuration = var_140_24
					var_140_17 = var_140_17 + 0.3

					if var_140_24 + var_140_17 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_24 + var_140_17
					end
				end

				arg_137_1.text_.text = var_140_21
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_25 = var_140_17 + 0.3
			local var_140_26 = math.max(var_140_18, arg_137_1.talkMaxDuration)

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_25) / var_140_26

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play113051035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 113051035
		arg_143_1.duration_ = 5.8

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play113051036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = manager.ui.mainCamera.transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.shakeOldPos = var_146_0.localPosition
			end

			local var_146_2 = 0.6

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / 0.066
				local var_146_4, var_146_5 = math.modf(var_146_3)

				var_146_0.localPosition = Vector3.New(var_146_5 * 0.13, var_146_5 * 0.13, var_146_5 * 0.13) + arg_143_1.var_.shakeOldPos
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = arg_143_1.var_.shakeOldPos
			end

			local var_146_6 = 0

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.allBtn_.enabled = false
			end

			local var_146_7 = 0.8

			if arg_143_1.time_ >= var_146_6 + var_146_7 and arg_143_1.time_ < var_146_6 + var_146_7 + arg_146_0 then
				arg_143_1.allBtn_.enabled = true
			end

			local var_146_8 = 0
			local var_146_9 = 1

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 then
				local var_146_10 = "play"
				local var_146_11 = "effect"

				arg_143_1:AudioAction(var_146_10, var_146_11, "se_story_10", "se_story_10_skill02", "")
			end

			if arg_143_1.frameCnt_ <= 1 then
				arg_143_1.dialog_:SetActive(false)
			end

			local var_146_12 = 0.8
			local var_146_13 = 0.85

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				arg_143_1.dialog_:SetActive(true)

				local var_146_14 = LeanTween.value(arg_143_1.dialog_, 0, 1, 0.3)

				var_146_14:setOnUpdate(LuaHelper.FloatAction(function(arg_147_0)
					arg_143_1.dialogCg_.alpha = arg_147_0
				end))
				var_146_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_143_1.dialog_)
					var_146_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_143_1.duration_ = arg_143_1.duration_ + 0.3

				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(113051035)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 34
				local var_146_18 = utf8.len(var_146_16)
				local var_146_19 = var_146_17 <= 0 and var_146_13 or var_146_13 * (var_146_18 / var_146_17)

				if var_146_19 > 0 and var_146_13 < var_146_19 then
					arg_143_1.talkMaxDuration = var_146_19
					var_146_12 = var_146_12 + 0.3

					if var_146_19 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_12
					end
				end

				arg_143_1.text_.text = var_146_16
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_20 = var_146_12 + 0.3
			local var_146_21 = math.max(var_146_13, arg_143_1.talkMaxDuration)

			if var_146_20 <= arg_143_1.time_ and arg_143_1.time_ < var_146_20 + var_146_21 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_20) / var_146_21

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_20 + var_146_21 and arg_143_1.time_ < var_146_20 + var_146_21 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play113051036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 113051036
		arg_149_1.duration_ = 1.999999999999

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play113051037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1041ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1041ui_story = var_152_0.localPosition

				local var_152_2 = "1041ui_story"

				arg_149_1:ShowWeapon(arg_149_1.var_[var_152_2 .. "Animator"].transform, true)
			end

			local var_152_3 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_3 then
				local var_152_4 = (arg_149_1.time_ - var_152_1) / var_152_3
				local var_152_5 = Vector3.New(-0.7, -1.11, -5.9)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1041ui_story, var_152_5, var_152_4)

				local var_152_6 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_6.x, var_152_6.y, var_152_6.z)

				local var_152_7 = var_152_0.localEulerAngles

				var_152_7.z = 0
				var_152_7.x = 0
				var_152_0.localEulerAngles = var_152_7
			end

			if arg_149_1.time_ >= var_152_1 + var_152_3 and arg_149_1.time_ < var_152_1 + var_152_3 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_152_8 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_8.x, var_152_8.y, var_152_8.z)

				local var_152_9 = var_152_0.localEulerAngles

				var_152_9.z = 0
				var_152_9.x = 0
				var_152_0.localEulerAngles = var_152_9
			end

			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_152_11 = 0

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_152_12 = arg_149_1.actors_["1041ui_story"]
			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 and arg_149_1.var_.characterEffect1041ui_story == nil then
				arg_149_1.var_.characterEffect1041ui_story = var_152_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_14 = 0.2

			if var_152_13 <= arg_149_1.time_ and arg_149_1.time_ < var_152_13 + var_152_14 then
				local var_152_15 = (arg_149_1.time_ - var_152_13) / var_152_14

				if arg_149_1.var_.characterEffect1041ui_story then
					arg_149_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_13 + var_152_14 and arg_149_1.time_ < var_152_13 + var_152_14 + arg_152_0 and arg_149_1.var_.characterEffect1041ui_story then
				arg_149_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_152_16 = 0
			local var_152_17 = 0.1

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_18 = arg_149_1:FormatText(StoryNameCfg[208].name)

				arg_149_1.leftNameTxt_.text = var_152_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_19 = arg_149_1:GetWordFromCfg(113051036)
				local var_152_20 = arg_149_1:FormatText(var_152_19.content)

				arg_149_1.text_.text = var_152_20

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_21 = 4
				local var_152_22 = utf8.len(var_152_20)
				local var_152_23 = var_152_21 <= 0 and var_152_17 or var_152_17 * (var_152_22 / var_152_21)

				if var_152_23 > 0 and var_152_17 < var_152_23 then
					arg_149_1.talkMaxDuration = var_152_23

					if var_152_23 + var_152_16 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_23 + var_152_16
					end
				end

				arg_149_1.text_.text = var_152_20
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051036", "story_v_out_113051.awb") ~= 0 then
					local var_152_24 = manager.audio:GetVoiceLength("story_v_out_113051", "113051036", "story_v_out_113051.awb") / 1000

					if var_152_24 + var_152_16 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_24 + var_152_16
					end

					if var_152_19.prefab_name ~= "" and arg_149_1.actors_[var_152_19.prefab_name] ~= nil then
						local var_152_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_19.prefab_name].transform, "story_v_out_113051", "113051036", "story_v_out_113051.awb")

						arg_149_1:RecordAudio("113051036", var_152_25)
						arg_149_1:RecordAudio("113051036", var_152_25)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_113051", "113051036", "story_v_out_113051.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_113051", "113051036", "story_v_out_113051.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_26 = math.max(var_152_17, arg_149_1.talkMaxDuration)

			if var_152_16 <= arg_149_1.time_ and arg_149_1.time_ < var_152_16 + var_152_26 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_16) / var_152_26

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_16 + var_152_26 and arg_149_1.time_ < var_152_16 + var_152_26 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play113051037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 113051037
		arg_153_1.duration_ = 9.5

		local var_153_0 = {
			ja = 8.433,
			ko = 7.866,
			zh = 7,
			en = 9.5
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
			arg_153_1.auto_ = false
		end

		function arg_153_1.playNext_(arg_155_0)
			arg_153_1.onStoryFinished_()
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1041ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1041ui_story == nil then
				arg_153_1.var_.characterEffect1041ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1041ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1041ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1041ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1041ui_story.fillRatio = var_156_5
			end

			local var_156_6 = arg_153_1.actors_["1038ui_story"].transform
			local var_156_7 = 0

			if var_156_7 < arg_153_1.time_ and arg_153_1.time_ <= var_156_7 + arg_156_0 then
				arg_153_1.var_.moveOldPos1038ui_story = var_156_6.localPosition
			end

			local var_156_8 = 0.001

			if var_156_7 <= arg_153_1.time_ and arg_153_1.time_ < var_156_7 + var_156_8 then
				local var_156_9 = (arg_153_1.time_ - var_156_7) / var_156_8
				local var_156_10 = Vector3.New(0.7, -1.11, -5.9)

				var_156_6.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1038ui_story, var_156_10, var_156_9)

				local var_156_11 = manager.ui.mainCamera.transform.position - var_156_6.position

				var_156_6.forward = Vector3.New(var_156_11.x, var_156_11.y, var_156_11.z)

				local var_156_12 = var_156_6.localEulerAngles

				var_156_12.z = 0
				var_156_12.x = 0
				var_156_6.localEulerAngles = var_156_12
			end

			if arg_153_1.time_ >= var_156_7 + var_156_8 and arg_153_1.time_ < var_156_7 + var_156_8 + arg_156_0 then
				var_156_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_156_13 = manager.ui.mainCamera.transform.position - var_156_6.position

				var_156_6.forward = Vector3.New(var_156_13.x, var_156_13.y, var_156_13.z)

				local var_156_14 = var_156_6.localEulerAngles

				var_156_14.z = 0
				var_156_14.x = 0
				var_156_6.localEulerAngles = var_156_14
			end

			local var_156_15 = 0

			if var_156_15 < arg_153_1.time_ and arg_153_1.time_ <= var_156_15 + arg_156_0 then
				arg_153_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action7_1")
			end

			local var_156_16 = 0

			if var_156_16 < arg_153_1.time_ and arg_153_1.time_ <= var_156_16 + arg_156_0 then
				arg_153_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_156_17 = arg_153_1.actors_["1038ui_story"]
			local var_156_18 = 0

			if var_156_18 < arg_153_1.time_ and arg_153_1.time_ <= var_156_18 + arg_156_0 and arg_153_1.var_.characterEffect1038ui_story == nil then
				arg_153_1.var_.characterEffect1038ui_story = var_156_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_19 = 0.2

			if var_156_18 <= arg_153_1.time_ and arg_153_1.time_ < var_156_18 + var_156_19 then
				local var_156_20 = (arg_153_1.time_ - var_156_18) / var_156_19

				if arg_153_1.var_.characterEffect1038ui_story then
					arg_153_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_18 + var_156_19 and arg_153_1.time_ < var_156_18 + var_156_19 + arg_156_0 and arg_153_1.var_.characterEffect1038ui_story then
				arg_153_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_156_21 = 0
			local var_156_22 = 0.85

			if var_156_21 < arg_153_1.time_ and arg_153_1.time_ <= var_156_21 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_23 = arg_153_1:FormatText(StoryNameCfg[94].name)

				arg_153_1.leftNameTxt_.text = var_156_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_24 = arg_153_1:GetWordFromCfg(113051037)
				local var_156_25 = arg_153_1:FormatText(var_156_24.content)

				arg_153_1.text_.text = var_156_25

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_26 = 34
				local var_156_27 = utf8.len(var_156_25)
				local var_156_28 = var_156_26 <= 0 and var_156_22 or var_156_22 * (var_156_27 / var_156_26)

				if var_156_28 > 0 and var_156_22 < var_156_28 then
					arg_153_1.talkMaxDuration = var_156_28

					if var_156_28 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_28 + var_156_21
					end
				end

				arg_153_1.text_.text = var_156_25
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113051", "113051037", "story_v_out_113051.awb") ~= 0 then
					local var_156_29 = manager.audio:GetVoiceLength("story_v_out_113051", "113051037", "story_v_out_113051.awb") / 1000

					if var_156_29 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_29 + var_156_21
					end

					if var_156_24.prefab_name ~= "" and arg_153_1.actors_[var_156_24.prefab_name] ~= nil then
						local var_156_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_24.prefab_name].transform, "story_v_out_113051", "113051037", "story_v_out_113051.awb")

						arg_153_1:RecordAudio("113051037", var_156_30)
						arg_153_1:RecordAudio("113051037", var_156_30)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_113051", "113051037", "story_v_out_113051.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_113051", "113051037", "story_v_out_113051.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_31 = math.max(var_156_22, arg_153_1.talkMaxDuration)

			if var_156_21 <= arg_153_1.time_ and arg_153_1.time_ < var_156_21 + var_156_31 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_21) / var_156_31

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_21 + var_156_31 and arg_153_1.time_ < var_156_21 + var_156_31 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a"
	},
	voices = {
		"story_v_out_113051.awb"
	}
}
