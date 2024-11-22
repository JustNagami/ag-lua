return {
	Play318021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 318021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play318021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K10g"

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
				local var_4_5 = arg_1_1.bgs_.K10g

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
					if iter_4_0 ~= "K10g" then
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
			local var_4_23 = 0.433333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.26666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_gardena.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.325

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

				local var_4_33 = arg_1_1:GetWordFromCfg(318021001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 53
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
	Play318021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 318021002
		arg_7_1.duration_ = 4.166

		local var_7_0 = {
			zh = 3.533,
			ja = 4.166
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
				arg_7_0:Play318021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1049ui_story"

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

			local var_10_4 = arg_7_1.actors_["1049ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1049ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.2, -6)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1049ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.2, -6)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1049ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1049ui_story == nil then
				arg_7_1.var_.characterEffect1049ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1049ui_story then
					arg_7_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1049ui_story then
				arg_7_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.4

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[562].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(318021002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021002", "story_v_out_318021.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_318021", "318021002", "story_v_out_318021.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_318021", "318021002", "story_v_out_318021.awb")

						arg_7_1:RecordAudio("318021002", var_10_28)
						arg_7_1:RecordAudio("318021002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_318021", "318021002", "story_v_out_318021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_318021", "318021002", "story_v_out_318021.awb")
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
	Play318021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 318021003
		arg_11_1.duration_ = 5.866

		local var_11_0 = {
			zh = 5.866,
			ja = 4.466
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
				arg_11_0:Play318021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10053ui_story"

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

			local var_14_4 = arg_11_1.actors_["10053ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos10053ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0.7, -1.12, -5.99)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10053ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["10053ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect10053ui_story == nil then
				arg_11_1.var_.characterEffect10053ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect10053ui_story then
					arg_11_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect10053ui_story then
				arg_11_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action4_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = arg_11_1.actors_["1049ui_story"].transform
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.var_.moveOldPos1049ui_story = var_14_19.localPosition
			end

			local var_14_21 = 0.001

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21
				local var_14_23 = Vector3.New(-0.7, -1.2, -6)

				var_14_19.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1049ui_story, var_14_23, var_14_22)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_19.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_19.localEulerAngles = var_14_25
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 then
				var_14_19.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_14_26 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_26.x, var_14_26.y, var_14_26.z)

				local var_14_27 = var_14_19.localEulerAngles

				var_14_27.z = 0
				var_14_27.x = 0
				var_14_19.localEulerAngles = var_14_27
			end

			local var_14_28 = arg_11_1.actors_["1049ui_story"]
			local var_14_29 = 0

			if var_14_29 < arg_11_1.time_ and arg_11_1.time_ <= var_14_29 + arg_14_0 and arg_11_1.var_.characterEffect1049ui_story == nil then
				arg_11_1.var_.characterEffect1049ui_story = var_14_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_30 = 0.200000002980232

			if var_14_29 <= arg_11_1.time_ and arg_11_1.time_ < var_14_29 + var_14_30 then
				local var_14_31 = (arg_11_1.time_ - var_14_29) / var_14_30

				if arg_11_1.var_.characterEffect1049ui_story then
					local var_14_32 = Mathf.Lerp(0, 0.5, var_14_31)

					arg_11_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1049ui_story.fillRatio = var_14_32
				end
			end

			if arg_11_1.time_ >= var_14_29 + var_14_30 and arg_11_1.time_ < var_14_29 + var_14_30 + arg_14_0 and arg_11_1.var_.characterEffect1049ui_story then
				local var_14_33 = 0.5

				arg_11_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1049ui_story.fillRatio = var_14_33
			end

			local var_14_34 = 0
			local var_14_35 = 0.65

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_36 = arg_11_1:FormatText(StoryNameCfg[477].name)

				arg_11_1.leftNameTxt_.text = var_14_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_37 = arg_11_1:GetWordFromCfg(318021003)
				local var_14_38 = arg_11_1:FormatText(var_14_37.content)

				arg_11_1.text_.text = var_14_38

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_39 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021003", "story_v_out_318021.awb") ~= 0 then
					local var_14_42 = manager.audio:GetVoiceLength("story_v_out_318021", "318021003", "story_v_out_318021.awb") / 1000

					if var_14_42 + var_14_34 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_42 + var_14_34
					end

					if var_14_37.prefab_name ~= "" and arg_11_1.actors_[var_14_37.prefab_name] ~= nil then
						local var_14_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_37.prefab_name].transform, "story_v_out_318021", "318021003", "story_v_out_318021.awb")

						arg_11_1:RecordAudio("318021003", var_14_43)
						arg_11_1:RecordAudio("318021003", var_14_43)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_318021", "318021003", "story_v_out_318021.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_318021", "318021003", "story_v_out_318021.awb")
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
	Play318021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 318021004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play318021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10053ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect10053ui_story == nil then
				arg_15_1.var_.characterEffect10053ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect10053ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10053ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect10053ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10053ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.675

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_8 = arg_15_1:GetWordFromCfg(318021004)
				local var_18_9 = arg_15_1:FormatText(var_18_8.content)

				arg_15_1.text_.text = var_18_9

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_10 = 27
				local var_18_11 = utf8.len(var_18_9)
				local var_18_12 = var_18_10 <= 0 and var_18_7 or var_18_7 * (var_18_11 / var_18_10)

				if var_18_12 > 0 and var_18_7 < var_18_12 then
					arg_15_1.talkMaxDuration = var_18_12

					if var_18_12 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_12 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_9
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_13 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_13 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_13

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_13 and arg_15_1.time_ < var_18_6 + var_18_13 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play318021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 318021005
		arg_19_1.duration_ = 10.233

		local var_19_0 = {
			zh = 6.733,
			ja = 10.233
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
				arg_19_0:Play318021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10053ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect10053ui_story == nil then
				arg_19_1.var_.characterEffect10053ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect10053ui_story then
					arg_19_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect10053ui_story then
				arg_19_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_22_4 = 0
			local var_22_5 = 0.7

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_6 = arg_19_1:FormatText(StoryNameCfg[477].name)

				arg_19_1.leftNameTxt_.text = var_22_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_7 = arg_19_1:GetWordFromCfg(318021005)
				local var_22_8 = arg_19_1:FormatText(var_22_7.content)

				arg_19_1.text_.text = var_22_8

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_9 = 28
				local var_22_10 = utf8.len(var_22_8)
				local var_22_11 = var_22_9 <= 0 and var_22_5 or var_22_5 * (var_22_10 / var_22_9)

				if var_22_11 > 0 and var_22_5 < var_22_11 then
					arg_19_1.talkMaxDuration = var_22_11

					if var_22_11 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_11 + var_22_4
					end
				end

				arg_19_1.text_.text = var_22_8
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021005", "story_v_out_318021.awb") ~= 0 then
					local var_22_12 = manager.audio:GetVoiceLength("story_v_out_318021", "318021005", "story_v_out_318021.awb") / 1000

					if var_22_12 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_4
					end

					if var_22_7.prefab_name ~= "" and arg_19_1.actors_[var_22_7.prefab_name] ~= nil then
						local var_22_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_7.prefab_name].transform, "story_v_out_318021", "318021005", "story_v_out_318021.awb")

						arg_19_1:RecordAudio("318021005", var_22_13)
						arg_19_1:RecordAudio("318021005", var_22_13)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_318021", "318021005", "story_v_out_318021.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_318021", "318021005", "story_v_out_318021.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_5, arg_19_1.talkMaxDuration)

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_4) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_4 + var_22_14 and arg_19_1.time_ < var_22_4 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play318021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 318021006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play318021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10053ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10053ui_story == nil then
				arg_23_1.var_.characterEffect10053ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10053ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10053ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10053ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10053ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.125

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(318021006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 5
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play318021007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 318021007
		arg_27_1.duration_ = 9.133

		local var_27_0 = {
			zh = 5.9,
			ja = 9.133
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
				arg_27_0:Play318021008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10053ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect10053ui_story == nil then
				arg_27_1.var_.characterEffect10053ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect10053ui_story then
					arg_27_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect10053ui_story then
				arg_27_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053actionlink/10053action4415")
			end

			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_6 = 0
			local var_30_7 = 0.625

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[477].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(318021007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021007", "story_v_out_318021.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_318021", "318021007", "story_v_out_318021.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_318021", "318021007", "story_v_out_318021.awb")

						arg_27_1:RecordAudio("318021007", var_30_15)
						arg_27_1:RecordAudio("318021007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_318021", "318021007", "story_v_out_318021.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_318021", "318021007", "story_v_out_318021.awb")
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
	Play318021008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 318021008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play318021009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10053ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10053ui_story == nil then
				arg_31_1.var_.characterEffect10053ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10053ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10053ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10053ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10053ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.125

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(318021008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 5
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_7 or var_34_7 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_7 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_13 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_13 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_13

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_13 and arg_31_1.time_ < var_34_6 + var_34_13 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play318021009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 318021009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play318021010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.125

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_2 = arg_35_1:GetWordFromCfg(318021009)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 45
				local var_38_5 = utf8.len(var_38_3)
				local var_38_6 = var_38_4 <= 0 and var_38_1 or var_38_1 * (var_38_5 / var_38_4)

				if var_38_6 > 0 and var_38_1 < var_38_6 then
					arg_35_1.talkMaxDuration = var_38_6

					if var_38_6 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_6 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_3
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_7 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_7 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_7

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_7 and arg_35_1.time_ < var_38_0 + var_38_7 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play318021010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 318021010
		arg_39_1.duration_ = 7.066

		local var_39_0 = {
			zh = 7.066,
			ja = 5.3
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
				arg_39_0:Play318021011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1049ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1049ui_story == nil then
				arg_39_1.var_.characterEffect1049ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1049ui_story then
					arg_39_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1049ui_story then
				arg_39_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_2")
			end

			local var_42_6 = 0
			local var_42_7 = 0.8

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[562].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(318021010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021010", "story_v_out_318021.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_318021", "318021010", "story_v_out_318021.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_318021", "318021010", "story_v_out_318021.awb")

						arg_39_1:RecordAudio("318021010", var_42_15)
						arg_39_1:RecordAudio("318021010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_318021", "318021010", "story_v_out_318021.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_318021", "318021010", "story_v_out_318021.awb")
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
	Play318021011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 318021011
		arg_43_1.duration_ = 10.2

		local var_43_0 = {
			zh = 10.2,
			ja = 9.966
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
				arg_43_0:Play318021012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.85

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[562].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(318021011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 34
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021011", "story_v_out_318021.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_318021", "318021011", "story_v_out_318021.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_318021", "318021011", "story_v_out_318021.awb")

						arg_43_1:RecordAudio("318021011", var_46_9)
						arg_43_1:RecordAudio("318021011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_318021", "318021011", "story_v_out_318021.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_318021", "318021011", "story_v_out_318021.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play318021012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 318021012
		arg_47_1.duration_ = 1.999999999999

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play318021013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10053ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10053ui_story == nil then
				arg_47_1.var_.characterEffect10053ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10053ui_story then
					arg_47_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10053ui_story then
				arg_47_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053actionlink/10053action41534")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_6 = arg_47_1.actors_["1049ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1049ui_story == nil then
				arg_47_1.var_.characterEffect1049ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1049ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1049ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1049ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1049ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 0.075

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[477].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(318021012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021012", "story_v_out_318021.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_318021", "318021012", "story_v_out_318021.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_318021", "318021012", "story_v_out_318021.awb")

						arg_47_1:RecordAudio("318021012", var_50_21)
						arg_47_1:RecordAudio("318021012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_318021", "318021012", "story_v_out_318021.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_318021", "318021012", "story_v_out_318021.awb")
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
	Play318021013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 318021013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play318021014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10053ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect10053ui_story == nil then
				arg_51_1.var_.characterEffect10053ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect10053ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_51_1.var_.characterEffect10053ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect10053ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_51_1.var_.characterEffect10053ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.433333333333333

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				local var_54_8 = "play"
				local var_54_9 = "effect"

				arg_51_1:AudioAction(var_54_8, var_54_9, "se_story_123_01", "se_story_123_01_explosion", "")
			end

			local var_54_10 = arg_51_1.actors_["1049ui_story"].transform
			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.var_.moveOldPos1049ui_story = var_54_10.localPosition
			end

			local var_54_12 = 0.001

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_12 then
				local var_54_13 = (arg_51_1.time_ - var_54_11) / var_54_12
				local var_54_14 = Vector3.New(0, 100, 0)

				var_54_10.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1049ui_story, var_54_14, var_54_13)

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

			local var_54_19 = arg_51_1.actors_["10053ui_story"].transform
			local var_54_20 = 0

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.var_.moveOldPos10053ui_story = var_54_19.localPosition
			end

			local var_54_21 = 0.001

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_21 then
				local var_54_22 = (arg_51_1.time_ - var_54_20) / var_54_21
				local var_54_23 = Vector3.New(0, 100, 0)

				var_54_19.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10053ui_story, var_54_23, var_54_22)

				local var_54_24 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_24.x, var_54_24.y, var_54_24.z)

				local var_54_25 = var_54_19.localEulerAngles

				var_54_25.z = 0
				var_54_25.x = 0
				var_54_19.localEulerAngles = var_54_25
			end

			if arg_51_1.time_ >= var_54_20 + var_54_21 and arg_51_1.time_ < var_54_20 + var_54_21 + arg_54_0 then
				var_54_19.localPosition = Vector3.New(0, 100, 0)

				local var_54_26 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_26.x, var_54_26.y, var_54_26.z)

				local var_54_27 = var_54_19.localEulerAngles

				var_54_27.z = 0
				var_54_27.x = 0
				var_54_19.localEulerAngles = var_54_27
			end

			local var_54_28 = 0

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_29 = 1

			if var_54_28 <= arg_51_1.time_ and arg_51_1.time_ < var_54_28 + var_54_29 then
				local var_54_30 = (arg_51_1.time_ - var_54_28) / var_54_29
				local var_54_31 = Color.New(1, 1, 1)

				var_54_31.a = Mathf.Lerp(1, 0, var_54_30)
				arg_51_1.mask_.color = var_54_31
			end

			if arg_51_1.time_ >= var_54_28 + var_54_29 and arg_51_1.time_ < var_54_28 + var_54_29 + arg_54_0 then
				local var_54_32 = Color.New(1, 1, 1)
				local var_54_33 = 0

				arg_51_1.mask_.enabled = false
				var_54_32.a = var_54_33
				arg_51_1.mask_.color = var_54_32
			end

			local var_54_34 = manager.ui.mainCamera.transform
			local var_54_35 = 0

			if var_54_35 < arg_51_1.time_ and arg_51_1.time_ <= var_54_35 + arg_54_0 then
				arg_51_1.var_.shakeOldPos = var_54_34.localPosition
			end

			local var_54_36 = 1

			if var_54_35 <= arg_51_1.time_ and arg_51_1.time_ < var_54_35 + var_54_36 then
				local var_54_37 = (arg_51_1.time_ - var_54_35) / 0.066
				local var_54_38, var_54_39 = math.modf(var_54_37)

				var_54_34.localPosition = Vector3.New(var_54_39 * 0.13, var_54_39 * 0.13, var_54_39 * 0.13) + arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.time_ >= var_54_35 + var_54_36 and arg_51_1.time_ < var_54_35 + var_54_36 + arg_54_0 then
				var_54_34.localPosition = arg_51_1.var_.shakeOldPos
			end

			local var_54_40 = 0
			local var_54_41 = 1.175

			if var_54_40 < arg_51_1.time_ and arg_51_1.time_ <= var_54_40 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_42 = arg_51_1:GetWordFromCfg(318021013)
				local var_54_43 = arg_51_1:FormatText(var_54_42.content)

				arg_51_1.text_.text = var_54_43

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_44 = 47
				local var_54_45 = utf8.len(var_54_43)
				local var_54_46 = var_54_44 <= 0 and var_54_41 or var_54_41 * (var_54_45 / var_54_44)

				if var_54_46 > 0 and var_54_41 < var_54_46 then
					arg_51_1.talkMaxDuration = var_54_46

					if var_54_46 + var_54_40 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_46 + var_54_40
					end
				end

				arg_51_1.text_.text = var_54_43
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_47 = math.max(var_54_41, arg_51_1.talkMaxDuration)

			if var_54_40 <= arg_51_1.time_ and arg_51_1.time_ < var_54_40 + var_54_47 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_40) / var_54_47

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_40 + var_54_47 and arg_51_1.time_ < var_54_40 + var_54_47 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play318021014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 318021014
		arg_55_1.duration_ = 9

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play318021015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = "K11g"

			if arg_55_1.bgs_[var_58_0] == nil then
				local var_58_1 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_0)
				var_58_1.name = var_58_0
				var_58_1.transform.parent = arg_55_1.stage_.transform
				var_58_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_0] = var_58_1
			end

			local var_58_2 = 2

			if var_58_2 < arg_55_1.time_ and arg_55_1.time_ <= var_58_2 + arg_58_0 then
				local var_58_3 = manager.ui.mainCamera.transform.localPosition
				local var_58_4 = Vector3.New(0, 0, 10) + Vector3.New(var_58_3.x, var_58_3.y, 0)
				local var_58_5 = arg_55_1.bgs_.K11g

				var_58_5.transform.localPosition = var_58_4
				var_58_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_6 = var_58_5:GetComponent("SpriteRenderer")

				if var_58_6 and var_58_6.sprite then
					local var_58_7 = (var_58_5.transform.localPosition - var_58_3).z
					local var_58_8 = manager.ui.mainCameraCom_
					local var_58_9 = 2 * var_58_7 * Mathf.Tan(var_58_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_10 = var_58_9 * var_58_8.aspect
					local var_58_11 = var_58_6.sprite.bounds.size.x
					local var_58_12 = var_58_6.sprite.bounds.size.y
					local var_58_13 = var_58_10 / var_58_11
					local var_58_14 = var_58_9 / var_58_12
					local var_58_15 = var_58_14 < var_58_13 and var_58_13 or var_58_14

					var_58_5.transform.localScale = Vector3.New(var_58_15, var_58_15, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "K11g" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_17 = 2

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Color.New(0, 0, 0)

				var_58_19.a = Mathf.Lerp(0, 1, var_58_18)
				arg_55_1.mask_.color = var_58_19
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				local var_58_20 = Color.New(0, 0, 0)

				var_58_20.a = 1
				arg_55_1.mask_.color = var_58_20
			end

			local var_58_21 = 2

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_22 = 2

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_22 then
				local var_58_23 = (arg_55_1.time_ - var_58_21) / var_58_22
				local var_58_24 = Color.New(0, 0, 0)

				var_58_24.a = Mathf.Lerp(1, 0, var_58_23)
				arg_55_1.mask_.color = var_58_24
			end

			if arg_55_1.time_ >= var_58_21 + var_58_22 and arg_55_1.time_ < var_58_21 + var_58_22 + arg_58_0 then
				local var_58_25 = Color.New(0, 0, 0)
				local var_58_26 = 0

				arg_55_1.mask_.enabled = false
				var_58_25.a = var_58_26
				arg_55_1.mask_.color = var_58_25
			end

			local var_58_27 = 0
			local var_58_28 = 0.433333333333333

			if var_58_27 < arg_55_1.time_ and arg_55_1.time_ <= var_58_27 + arg_58_0 then
				local var_58_29 = "play"
				local var_58_30 = "effect"

				arg_55_1:AudioAction(var_58_29, var_58_30, "se_story_1210", "se_story_1210_blast_loop", "")
			end

			local var_58_31 = arg_55_1.actors_["1049ui_story"].transform
			local var_58_32 = 2

			if var_58_32 < arg_55_1.time_ and arg_55_1.time_ <= var_58_32 + arg_58_0 then
				arg_55_1.var_.moveOldPos1049ui_story = var_58_31.localPosition
			end

			local var_58_33 = 0.001

			if var_58_32 <= arg_55_1.time_ and arg_55_1.time_ < var_58_32 + var_58_33 then
				local var_58_34 = (arg_55_1.time_ - var_58_32) / var_58_33
				local var_58_35 = Vector3.New(0, 100, 0)

				var_58_31.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1049ui_story, var_58_35, var_58_34)

				local var_58_36 = manager.ui.mainCamera.transform.position - var_58_31.position

				var_58_31.forward = Vector3.New(var_58_36.x, var_58_36.y, var_58_36.z)

				local var_58_37 = var_58_31.localEulerAngles

				var_58_37.z = 0
				var_58_37.x = 0
				var_58_31.localEulerAngles = var_58_37
			end

			if arg_55_1.time_ >= var_58_32 + var_58_33 and arg_55_1.time_ < var_58_32 + var_58_33 + arg_58_0 then
				var_58_31.localPosition = Vector3.New(0, 100, 0)

				local var_58_38 = manager.ui.mainCamera.transform.position - var_58_31.position

				var_58_31.forward = Vector3.New(var_58_38.x, var_58_38.y, var_58_38.z)

				local var_58_39 = var_58_31.localEulerAngles

				var_58_39.z = 0
				var_58_39.x = 0
				var_58_31.localEulerAngles = var_58_39
			end

			local var_58_40 = arg_55_1.actors_["10053ui_story"].transform
			local var_58_41 = 2

			if var_58_41 < arg_55_1.time_ and arg_55_1.time_ <= var_58_41 + arg_58_0 then
				arg_55_1.var_.moveOldPos10053ui_story = var_58_40.localPosition
			end

			local var_58_42 = 0.001

			if var_58_41 <= arg_55_1.time_ and arg_55_1.time_ < var_58_41 + var_58_42 then
				local var_58_43 = (arg_55_1.time_ - var_58_41) / var_58_42
				local var_58_44 = Vector3.New(0, 100, 0)

				var_58_40.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10053ui_story, var_58_44, var_58_43)

				local var_58_45 = manager.ui.mainCamera.transform.position - var_58_40.position

				var_58_40.forward = Vector3.New(var_58_45.x, var_58_45.y, var_58_45.z)

				local var_58_46 = var_58_40.localEulerAngles

				var_58_46.z = 0
				var_58_46.x = 0
				var_58_40.localEulerAngles = var_58_46
			end

			if arg_55_1.time_ >= var_58_41 + var_58_42 and arg_55_1.time_ < var_58_41 + var_58_42 + arg_58_0 then
				var_58_40.localPosition = Vector3.New(0, 100, 0)

				local var_58_47 = manager.ui.mainCamera.transform.position - var_58_40.position

				var_58_40.forward = Vector3.New(var_58_47.x, var_58_47.y, var_58_47.z)

				local var_58_48 = var_58_40.localEulerAngles

				var_58_48.z = 0
				var_58_48.x = 0
				var_58_40.localEulerAngles = var_58_48
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_49 = 4
			local var_58_50 = 0.1

			if var_58_49 < arg_55_1.time_ and arg_55_1.time_ <= var_58_49 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_51 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_51:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_52 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_53 = arg_55_1:GetWordFromCfg(318021014)
				local var_58_54 = arg_55_1:FormatText(var_58_53.content)

				arg_55_1.text_.text = var_58_54

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_55 = 4
				local var_58_56 = utf8.len(var_58_54)
				local var_58_57 = var_58_55 <= 0 and var_58_50 or var_58_50 * (var_58_56 / var_58_55)

				if var_58_57 > 0 and var_58_50 < var_58_57 then
					arg_55_1.talkMaxDuration = var_58_57
					var_58_49 = var_58_49 + 0.3

					if var_58_57 + var_58_49 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_57 + var_58_49
					end
				end

				arg_55_1.text_.text = var_58_54
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_58 = var_58_49 + 0.3
			local var_58_59 = math.max(var_58_50, arg_55_1.talkMaxDuration)

			if var_58_58 <= arg_55_1.time_ and arg_55_1.time_ < var_58_58 + var_58_59 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_58) / var_58_59

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_58 + var_58_59 and arg_55_1.time_ < var_58_58 + var_58_59 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play318021015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 318021015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play318021016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1.475

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(318021015)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 59
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_7 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_7 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_7

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_7 and arg_61_1.time_ < var_64_0 + var_64_7 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play318021016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 318021016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play318021017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.875

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

				local var_68_2 = arg_65_1:GetWordFromCfg(318021016)
				local var_68_3 = arg_65_1:FormatText(var_68_2.content)

				arg_65_1.text_.text = var_68_3

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_4 = 35
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
	Play318021017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 318021017
		arg_69_1.duration_ = 4.566

		local var_69_0 = {
			zh = 2.733,
			ja = 4.566
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
				arg_69_0:Play318021018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "1015ui_story"

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

			local var_72_4 = arg_69_1.actors_["1015ui_story"].transform
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1.var_.moveOldPos1015ui_story = var_72_4.localPosition
			end

			local var_72_6 = 0.001

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6
				local var_72_8 = Vector3.New(0, -1.15, -6.2)

				var_72_4.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1015ui_story, var_72_8, var_72_7)

				local var_72_9 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_9.x, var_72_9.y, var_72_9.z)

				local var_72_10 = var_72_4.localEulerAngles

				var_72_10.z = 0
				var_72_10.x = 0
				var_72_4.localEulerAngles = var_72_10
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 then
				var_72_4.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_72_11 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_11.x, var_72_11.y, var_72_11.z)

				local var_72_12 = var_72_4.localEulerAngles

				var_72_12.z = 0
				var_72_12.x = 0
				var_72_4.localEulerAngles = var_72_12
			end

			local var_72_13 = arg_69_1.actors_["1015ui_story"]
			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 and arg_69_1.var_.characterEffect1015ui_story == nil then
				arg_69_1.var_.characterEffect1015ui_story = var_72_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_15 = 0.200000002980232

			if var_72_14 <= arg_69_1.time_ and arg_69_1.time_ < var_72_14 + var_72_15 then
				local var_72_16 = (arg_69_1.time_ - var_72_14) / var_72_15

				if arg_69_1.var_.characterEffect1015ui_story then
					arg_69_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_14 + var_72_15 and arg_69_1.time_ < var_72_14 + var_72_15 + arg_72_0 and arg_69_1.var_.characterEffect1015ui_story then
				arg_69_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_72_17 = 0

			if var_72_17 < arg_69_1.time_ and arg_69_1.time_ <= var_72_17 + arg_72_0 then
				arg_69_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_72_18 = 0

			if var_72_18 < arg_69_1.time_ and arg_69_1.time_ <= var_72_18 + arg_72_0 then
				arg_69_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_72_19 = 0
			local var_72_20 = 0.375

			if var_72_19 < arg_69_1.time_ and arg_69_1.time_ <= var_72_19 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_21 = arg_69_1:FormatText(StoryNameCfg[479].name)

				arg_69_1.leftNameTxt_.text = var_72_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_22 = arg_69_1:GetWordFromCfg(318021017)
				local var_72_23 = arg_69_1:FormatText(var_72_22.content)

				arg_69_1.text_.text = var_72_23

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_24 = 15
				local var_72_25 = utf8.len(var_72_23)
				local var_72_26 = var_72_24 <= 0 and var_72_20 or var_72_20 * (var_72_25 / var_72_24)

				if var_72_26 > 0 and var_72_20 < var_72_26 then
					arg_69_1.talkMaxDuration = var_72_26

					if var_72_26 + var_72_19 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_26 + var_72_19
					end
				end

				arg_69_1.text_.text = var_72_23
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021017", "story_v_out_318021.awb") ~= 0 then
					local var_72_27 = manager.audio:GetVoiceLength("story_v_out_318021", "318021017", "story_v_out_318021.awb") / 1000

					if var_72_27 + var_72_19 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_27 + var_72_19
					end

					if var_72_22.prefab_name ~= "" and arg_69_1.actors_[var_72_22.prefab_name] ~= nil then
						local var_72_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_22.prefab_name].transform, "story_v_out_318021", "318021017", "story_v_out_318021.awb")

						arg_69_1:RecordAudio("318021017", var_72_28)
						arg_69_1:RecordAudio("318021017", var_72_28)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_318021", "318021017", "story_v_out_318021.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_318021", "318021017", "story_v_out_318021.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_29 = math.max(var_72_20, arg_69_1.talkMaxDuration)

			if var_72_19 <= arg_69_1.time_ and arg_69_1.time_ < var_72_19 + var_72_29 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_19) / var_72_29

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_19 + var_72_29 and arg_69_1.time_ < var_72_19 + var_72_29 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play318021018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 318021018
		arg_73_1.duration_ = 4

		local var_73_0 = {
			zh = 2.9,
			ja = 4
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
				arg_73_0:Play318021019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "1093ui_story"

			if arg_73_1.actors_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(Asset.Load("Char/" .. var_76_0), arg_73_1.stage_.transform)

				var_76_1.name = var_76_0
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.actors_[var_76_0] = var_76_1

				local var_76_2 = var_76_1:GetComponentInChildren(typeof(CharacterEffect))

				var_76_2.enabled = true

				local var_76_3 = GameObjectTools.GetOrAddComponent(var_76_1, typeof(DynamicBoneHelper))

				if var_76_3 then
					var_76_3:EnableDynamicBone(false)
				end

				arg_73_1:ShowWeapon(var_76_2.transform, false)

				arg_73_1.var_[var_76_0 .. "Animator"] = var_76_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_73_1.var_[var_76_0 .. "Animator"].applyRootMotion = true
				arg_73_1.var_[var_76_0 .. "LipSync"] = var_76_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_76_4 = 0

			if var_76_4 < arg_73_1.time_ and arg_73_1.time_ <= var_76_4 + arg_76_0 then
				arg_73_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_76_5 = arg_73_1.actors_["1015ui_story"].transform
			local var_76_6 = 0

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.var_.moveOldPos1015ui_story = var_76_5.localPosition
			end

			local var_76_7 = 0.001

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_7 then
				local var_76_8 = (arg_73_1.time_ - var_76_6) / var_76_7
				local var_76_9 = Vector3.New(0, -1.15, -6.2)

				var_76_5.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1015ui_story, var_76_9, var_76_8)

				local var_76_10 = manager.ui.mainCamera.transform.position - var_76_5.position

				var_76_5.forward = Vector3.New(var_76_10.x, var_76_10.y, var_76_10.z)

				local var_76_11 = var_76_5.localEulerAngles

				var_76_11.z = 0
				var_76_11.x = 0
				var_76_5.localEulerAngles = var_76_11
			end

			if arg_73_1.time_ >= var_76_6 + var_76_7 and arg_73_1.time_ < var_76_6 + var_76_7 + arg_76_0 then
				var_76_5.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_76_12 = manager.ui.mainCamera.transform.position - var_76_5.position

				var_76_5.forward = Vector3.New(var_76_12.x, var_76_12.y, var_76_12.z)

				local var_76_13 = var_76_5.localEulerAngles

				var_76_13.z = 0
				var_76_13.x = 0
				var_76_5.localEulerAngles = var_76_13
			end

			local var_76_14 = arg_73_1.actors_["1015ui_story"]
			local var_76_15 = 0

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 and arg_73_1.var_.characterEffect1015ui_story == nil then
				arg_73_1.var_.characterEffect1015ui_story = var_76_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_16 = 0.200000002980232

			if var_76_15 <= arg_73_1.time_ and arg_73_1.time_ < var_76_15 + var_76_16 then
				local var_76_17 = (arg_73_1.time_ - var_76_15) / var_76_16

				if arg_73_1.var_.characterEffect1015ui_story then
					local var_76_18 = Mathf.Lerp(0, 0.5, var_76_17)

					arg_73_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1015ui_story.fillRatio = var_76_18
				end
			end

			if arg_73_1.time_ >= var_76_15 + var_76_16 and arg_73_1.time_ < var_76_15 + var_76_16 + arg_76_0 and arg_73_1.var_.characterEffect1015ui_story then
				local var_76_19 = 0.5

				arg_73_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1015ui_story.fillRatio = var_76_19
			end

			local var_76_20 = 0
			local var_76_21 = 0.4

			if var_76_20 < arg_73_1.time_ and arg_73_1.time_ <= var_76_20 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_22 = arg_73_1:FormatText(StoryNameCfg[73].name)

				arg_73_1.leftNameTxt_.text = var_76_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_23 = arg_73_1:GetWordFromCfg(318021018)
				local var_76_24 = arg_73_1:FormatText(var_76_23.content)

				arg_73_1.text_.text = var_76_24

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_25 = 16
				local var_76_26 = utf8.len(var_76_24)
				local var_76_27 = var_76_25 <= 0 and var_76_21 or var_76_21 * (var_76_26 / var_76_25)

				if var_76_27 > 0 and var_76_21 < var_76_27 then
					arg_73_1.talkMaxDuration = var_76_27

					if var_76_27 + var_76_20 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_27 + var_76_20
					end
				end

				arg_73_1.text_.text = var_76_24
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021018", "story_v_out_318021.awb") ~= 0 then
					local var_76_28 = manager.audio:GetVoiceLength("story_v_out_318021", "318021018", "story_v_out_318021.awb") / 1000

					if var_76_28 + var_76_20 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_28 + var_76_20
					end

					if var_76_23.prefab_name ~= "" and arg_73_1.actors_[var_76_23.prefab_name] ~= nil then
						local var_76_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_23.prefab_name].transform, "story_v_out_318021", "318021018", "story_v_out_318021.awb")

						arg_73_1:RecordAudio("318021018", var_76_29)
						arg_73_1:RecordAudio("318021018", var_76_29)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_318021", "318021018", "story_v_out_318021.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_318021", "318021018", "story_v_out_318021.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_30 = math.max(var_76_21, arg_73_1.talkMaxDuration)

			if var_76_20 <= arg_73_1.time_ and arg_73_1.time_ < var_76_20 + var_76_30 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_20) / var_76_30

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_20 + var_76_30 and arg_73_1.time_ < var_76_20 + var_76_30 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play318021019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 318021019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play318021020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 1.025

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_2 = arg_77_1:GetWordFromCfg(318021019)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 41
				local var_80_5 = utf8.len(var_80_3)
				local var_80_6 = var_80_4 <= 0 and var_80_1 or var_80_1 * (var_80_5 / var_80_4)

				if var_80_6 > 0 and var_80_1 < var_80_6 then
					arg_77_1.talkMaxDuration = var_80_6

					if var_80_6 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_6 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_3
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_7 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_7 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_7

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_7 and arg_77_1.time_ < var_80_0 + var_80_7 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play318021020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 318021020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play318021021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.5

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_2 = arg_81_1:GetWordFromCfg(318021020)
				local var_84_3 = arg_81_1:FormatText(var_84_2.content)

				arg_81_1.text_.text = var_84_3

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_4 = 60
				local var_84_5 = utf8.len(var_84_3)
				local var_84_6 = var_84_4 <= 0 and var_84_1 or var_84_1 * (var_84_5 / var_84_4)

				if var_84_6 > 0 and var_84_1 < var_84_6 then
					arg_81_1.talkMaxDuration = var_84_6

					if var_84_6 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_6 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_3
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_7 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_7 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_7

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_7 and arg_81_1.time_ < var_84_0 + var_84_7 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play318021021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 318021021
		arg_85_1.duration_ = 3.4

		local var_85_0 = {
			zh = 2.466,
			ja = 3.4
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play318021022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1015ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1015ui_story == nil then
				arg_85_1.var_.characterEffect1015ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1015ui_story then
					arg_85_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1015ui_story then
				arg_85_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_88_4 = 0
			local var_88_5 = 0.35

			if var_88_4 < arg_85_1.time_ and arg_85_1.time_ <= var_88_4 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_6 = arg_85_1:FormatText(StoryNameCfg[479].name)

				arg_85_1.leftNameTxt_.text = var_88_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_7 = arg_85_1:GetWordFromCfg(318021021)
				local var_88_8 = arg_85_1:FormatText(var_88_7.content)

				arg_85_1.text_.text = var_88_8

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_9 = 14
				local var_88_10 = utf8.len(var_88_8)
				local var_88_11 = var_88_9 <= 0 and var_88_5 or var_88_5 * (var_88_10 / var_88_9)

				if var_88_11 > 0 and var_88_5 < var_88_11 then
					arg_85_1.talkMaxDuration = var_88_11

					if var_88_11 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_11 + var_88_4
					end
				end

				arg_85_1.text_.text = var_88_8
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021021", "story_v_out_318021.awb") ~= 0 then
					local var_88_12 = manager.audio:GetVoiceLength("story_v_out_318021", "318021021", "story_v_out_318021.awb") / 1000

					if var_88_12 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_12 + var_88_4
					end

					if var_88_7.prefab_name ~= "" and arg_85_1.actors_[var_88_7.prefab_name] ~= nil then
						local var_88_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_7.prefab_name].transform, "story_v_out_318021", "318021021", "story_v_out_318021.awb")

						arg_85_1:RecordAudio("318021021", var_88_13)
						arg_85_1:RecordAudio("318021021", var_88_13)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_318021", "318021021", "story_v_out_318021.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_318021", "318021021", "story_v_out_318021.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_14 = math.max(var_88_5, arg_85_1.talkMaxDuration)

			if var_88_4 <= arg_85_1.time_ and arg_85_1.time_ < var_88_4 + var_88_14 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_4) / var_88_14

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_4 + var_88_14 and arg_85_1.time_ < var_88_4 + var_88_14 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play318021022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 318021022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play318021023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1015ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1015ui_story == nil then
				arg_89_1.var_.characterEffect1015ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1015ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1015ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1015ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1015ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 0.525

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[7].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(318021022)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 21
				local var_92_12 = utf8.len(var_92_10)
				local var_92_13 = var_92_11 <= 0 and var_92_7 or var_92_7 * (var_92_12 / var_92_11)

				if var_92_13 > 0 and var_92_7 < var_92_13 then
					arg_89_1.talkMaxDuration = var_92_13

					if var_92_13 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_13 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_10
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_14 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_14 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_14

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_14 and arg_89_1.time_ < var_92_6 + var_92_14 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play318021023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 318021023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play318021024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1015ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1015ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(0, 100, 0)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1015ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, 100, 0)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = 0
			local var_96_10 = 1.25

			if var_96_9 < arg_93_1.time_ and arg_93_1.time_ <= var_96_9 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_11 = arg_93_1:GetWordFromCfg(318021023)
				local var_96_12 = arg_93_1:FormatText(var_96_11.content)

				arg_93_1.text_.text = var_96_12

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_13 = 50
				local var_96_14 = utf8.len(var_96_12)
				local var_96_15 = var_96_13 <= 0 and var_96_10 or var_96_10 * (var_96_14 / var_96_13)

				if var_96_15 > 0 and var_96_10 < var_96_15 then
					arg_93_1.talkMaxDuration = var_96_15

					if var_96_15 + var_96_9 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_15 + var_96_9
					end
				end

				arg_93_1.text_.text = var_96_12
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_16 = math.max(var_96_10, arg_93_1.talkMaxDuration)

			if var_96_9 <= arg_93_1.time_ and arg_93_1.time_ < var_96_9 + var_96_16 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_9) / var_96_16

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_9 + var_96_16 and arg_93_1.time_ < var_96_9 + var_96_16 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play318021024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 318021024
		arg_97_1.duration_ = 1.999999999999

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play318021025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = "1199ui_story"

			if arg_97_1.actors_[var_100_0] == nil then
				local var_100_1 = Object.Instantiate(Asset.Load("Char/" .. var_100_0), arg_97_1.stage_.transform)

				var_100_1.name = var_100_0
				var_100_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.actors_[var_100_0] = var_100_1

				local var_100_2 = var_100_1:GetComponentInChildren(typeof(CharacterEffect))

				var_100_2.enabled = true

				local var_100_3 = GameObjectTools.GetOrAddComponent(var_100_1, typeof(DynamicBoneHelper))

				if var_100_3 then
					var_100_3:EnableDynamicBone(false)
				end

				arg_97_1:ShowWeapon(var_100_2.transform, false)

				arg_97_1.var_[var_100_0 .. "Animator"] = var_100_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_97_1.var_[var_100_0 .. "Animator"].applyRootMotion = true
				arg_97_1.var_[var_100_0 .. "LipSync"] = var_100_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_100_4 = arg_97_1.actors_["1199ui_story"].transform
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.var_.moveOldPos1199ui_story = var_100_4.localPosition
			end

			local var_100_6 = 0.001

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Vector3.New(0, -1.08, -5.9)

				var_100_4.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1199ui_story, var_100_8, var_100_7)

				local var_100_9 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_9.x, var_100_9.y, var_100_9.z)

				local var_100_10 = var_100_4.localEulerAngles

				var_100_10.z = 0
				var_100_10.x = 0
				var_100_4.localEulerAngles = var_100_10
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				var_100_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_100_11 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_11.x, var_100_11.y, var_100_11.z)

				local var_100_12 = var_100_4.localEulerAngles

				var_100_12.z = 0
				var_100_12.x = 0
				var_100_4.localEulerAngles = var_100_12
			end

			local var_100_13 = arg_97_1.actors_["1199ui_story"]
			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 and arg_97_1.var_.characterEffect1199ui_story == nil then
				arg_97_1.var_.characterEffect1199ui_story = var_100_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_15 = 0.200000002980232

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15

				if arg_97_1.var_.characterEffect1199ui_story then
					arg_97_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 and arg_97_1.var_.characterEffect1199ui_story then
				arg_97_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_100_17 = 0

			if var_100_17 < arg_97_1.time_ and arg_97_1.time_ <= var_100_17 + arg_100_0 then
				arg_97_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action5_1")
			end

			local var_100_18 = 0

			if var_100_18 < arg_97_1.time_ and arg_97_1.time_ <= var_100_18 + arg_100_0 then
				arg_97_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_100_19 = 0
			local var_100_20 = 0.15

			if var_100_19 < arg_97_1.time_ and arg_97_1.time_ <= var_100_19 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_21 = arg_97_1:FormatText(StoryNameCfg[84].name)

				arg_97_1.leftNameTxt_.text = var_100_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_22 = arg_97_1:GetWordFromCfg(318021024)
				local var_100_23 = arg_97_1:FormatText(var_100_22.content)

				arg_97_1.text_.text = var_100_23

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_24 = 6
				local var_100_25 = utf8.len(var_100_23)
				local var_100_26 = var_100_24 <= 0 and var_100_20 or var_100_20 * (var_100_25 / var_100_24)

				if var_100_26 > 0 and var_100_20 < var_100_26 then
					arg_97_1.talkMaxDuration = var_100_26

					if var_100_26 + var_100_19 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_26 + var_100_19
					end
				end

				arg_97_1.text_.text = var_100_23
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021024", "story_v_out_318021.awb") ~= 0 then
					local var_100_27 = manager.audio:GetVoiceLength("story_v_out_318021", "318021024", "story_v_out_318021.awb") / 1000

					if var_100_27 + var_100_19 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_27 + var_100_19
					end

					if var_100_22.prefab_name ~= "" and arg_97_1.actors_[var_100_22.prefab_name] ~= nil then
						local var_100_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_22.prefab_name].transform, "story_v_out_318021", "318021024", "story_v_out_318021.awb")

						arg_97_1:RecordAudio("318021024", var_100_28)
						arg_97_1:RecordAudio("318021024", var_100_28)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_318021", "318021024", "story_v_out_318021.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_318021", "318021024", "story_v_out_318021.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_29 = math.max(var_100_20, arg_97_1.talkMaxDuration)

			if var_100_19 <= arg_97_1.time_ and arg_97_1.time_ < var_100_19 + var_100_29 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_19) / var_100_29

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_19 + var_100_29 and arg_97_1.time_ < var_100_19 + var_100_29 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play318021025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 318021025
		arg_101_1.duration_ = 3.1

		local var_101_0 = {
			zh = 2.666,
			ja = 3.1
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
				arg_101_0:Play318021026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1093ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1093ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0.7, -1.11, -5.88)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1093ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0.7, -1.11, -5.88)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1093ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect1093ui_story == nil then
				arg_101_1.var_.characterEffect1093ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect1093ui_story then
					arg_101_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect1093ui_story then
				arg_101_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_104_13 = arg_101_1.actors_["1199ui_story"].transform
			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1.var_.moveOldPos1199ui_story = var_104_13.localPosition
			end

			local var_104_15 = 0.001

			if var_104_14 <= arg_101_1.time_ and arg_101_1.time_ < var_104_14 + var_104_15 then
				local var_104_16 = (arg_101_1.time_ - var_104_14) / var_104_15
				local var_104_17 = Vector3.New(-0.7, -1.08, -5.9)

				var_104_13.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1199ui_story, var_104_17, var_104_16)

				local var_104_18 = manager.ui.mainCamera.transform.position - var_104_13.position

				var_104_13.forward = Vector3.New(var_104_18.x, var_104_18.y, var_104_18.z)

				local var_104_19 = var_104_13.localEulerAngles

				var_104_19.z = 0
				var_104_19.x = 0
				var_104_13.localEulerAngles = var_104_19
			end

			if arg_101_1.time_ >= var_104_14 + var_104_15 and arg_101_1.time_ < var_104_14 + var_104_15 + arg_104_0 then
				var_104_13.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_104_20 = manager.ui.mainCamera.transform.position - var_104_13.position

				var_104_13.forward = Vector3.New(var_104_20.x, var_104_20.y, var_104_20.z)

				local var_104_21 = var_104_13.localEulerAngles

				var_104_21.z = 0
				var_104_21.x = 0
				var_104_13.localEulerAngles = var_104_21
			end

			local var_104_22 = arg_101_1.actors_["1199ui_story"]
			local var_104_23 = 0

			if var_104_23 < arg_101_1.time_ and arg_101_1.time_ <= var_104_23 + arg_104_0 and arg_101_1.var_.characterEffect1199ui_story == nil then
				arg_101_1.var_.characterEffect1199ui_story = var_104_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_24 = 0.200000002980232

			if var_104_23 <= arg_101_1.time_ and arg_101_1.time_ < var_104_23 + var_104_24 then
				local var_104_25 = (arg_101_1.time_ - var_104_23) / var_104_24

				if arg_101_1.var_.characterEffect1199ui_story then
					local var_104_26 = Mathf.Lerp(0, 0.5, var_104_25)

					arg_101_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1199ui_story.fillRatio = var_104_26
				end
			end

			if arg_101_1.time_ >= var_104_23 + var_104_24 and arg_101_1.time_ < var_104_23 + var_104_24 + arg_104_0 and arg_101_1.var_.characterEffect1199ui_story then
				local var_104_27 = 0.5

				arg_101_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1199ui_story.fillRatio = var_104_27
			end

			local var_104_28 = 0

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 then
				arg_101_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_104_29 = 0
			local var_104_30 = 0.2

			if var_104_29 < arg_101_1.time_ and arg_101_1.time_ <= var_104_29 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_31 = arg_101_1:FormatText(StoryNameCfg[73].name)

				arg_101_1.leftNameTxt_.text = var_104_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_32 = arg_101_1:GetWordFromCfg(318021025)
				local var_104_33 = arg_101_1:FormatText(var_104_32.content)

				arg_101_1.text_.text = var_104_33

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_34 = 8
				local var_104_35 = utf8.len(var_104_33)
				local var_104_36 = var_104_34 <= 0 and var_104_30 or var_104_30 * (var_104_35 / var_104_34)

				if var_104_36 > 0 and var_104_30 < var_104_36 then
					arg_101_1.talkMaxDuration = var_104_36

					if var_104_36 + var_104_29 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_36 + var_104_29
					end
				end

				arg_101_1.text_.text = var_104_33
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021025", "story_v_out_318021.awb") ~= 0 then
					local var_104_37 = manager.audio:GetVoiceLength("story_v_out_318021", "318021025", "story_v_out_318021.awb") / 1000

					if var_104_37 + var_104_29 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_37 + var_104_29
					end

					if var_104_32.prefab_name ~= "" and arg_101_1.actors_[var_104_32.prefab_name] ~= nil then
						local var_104_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_32.prefab_name].transform, "story_v_out_318021", "318021025", "story_v_out_318021.awb")

						arg_101_1:RecordAudio("318021025", var_104_38)
						arg_101_1:RecordAudio("318021025", var_104_38)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_318021", "318021025", "story_v_out_318021.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_318021", "318021025", "story_v_out_318021.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_39 = math.max(var_104_30, arg_101_1.talkMaxDuration)

			if var_104_29 <= arg_101_1.time_ and arg_101_1.time_ < var_104_29 + var_104_39 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_29) / var_104_39

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_29 + var_104_39 and arg_101_1.time_ < var_104_29 + var_104_39 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play318021026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 318021026
		arg_105_1.duration_ = 12.766

		local var_105_0 = {
			zh = 12.766,
			ja = 9.066
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
				arg_105_0:Play318021027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1093ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1093ui_story == nil then
				arg_105_1.var_.characterEffect1093ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1093ui_story then
					arg_105_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1093ui_story then
				arg_105_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_108_4 = 0
			local var_108_5 = 1.075

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_6 = arg_105_1:FormatText(StoryNameCfg[73].name)

				arg_105_1.leftNameTxt_.text = var_108_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_7 = arg_105_1:GetWordFromCfg(318021026)
				local var_108_8 = arg_105_1:FormatText(var_108_7.content)

				arg_105_1.text_.text = var_108_8

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_9 = 43
				local var_108_10 = utf8.len(var_108_8)
				local var_108_11 = var_108_9 <= 0 and var_108_5 or var_108_5 * (var_108_10 / var_108_9)

				if var_108_11 > 0 and var_108_5 < var_108_11 then
					arg_105_1.talkMaxDuration = var_108_11

					if var_108_11 + var_108_4 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_11 + var_108_4
					end
				end

				arg_105_1.text_.text = var_108_8
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021026", "story_v_out_318021.awb") ~= 0 then
					local var_108_12 = manager.audio:GetVoiceLength("story_v_out_318021", "318021026", "story_v_out_318021.awb") / 1000

					if var_108_12 + var_108_4 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_4
					end

					if var_108_7.prefab_name ~= "" and arg_105_1.actors_[var_108_7.prefab_name] ~= nil then
						local var_108_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_7.prefab_name].transform, "story_v_out_318021", "318021026", "story_v_out_318021.awb")

						arg_105_1:RecordAudio("318021026", var_108_13)
						arg_105_1:RecordAudio("318021026", var_108_13)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_318021", "318021026", "story_v_out_318021.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_318021", "318021026", "story_v_out_318021.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_14 = math.max(var_108_5, arg_105_1.talkMaxDuration)

			if var_108_4 <= arg_105_1.time_ and arg_105_1.time_ < var_108_4 + var_108_14 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_4) / var_108_14

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_4 + var_108_14 and arg_105_1.time_ < var_108_4 + var_108_14 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play318021027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 318021027
		arg_109_1.duration_ = 8.3

		local var_109_0 = {
			zh = 4.7,
			ja = 8.3
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
				arg_109_0:Play318021028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1015ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1015ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(0, -1.15, -6.2)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1015ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1015ui_story"]
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1015ui_story == nil then
				arg_109_1.var_.characterEffect1015ui_story = var_112_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_11 = 0.200000002980232

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11

				if arg_109_1.var_.characterEffect1015ui_story then
					arg_109_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1015ui_story then
				arg_109_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_112_13 = 0

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 then
				arg_109_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				arg_109_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_112_15 = arg_109_1.actors_["1093ui_story"].transform
			local var_112_16 = 0

			if var_112_16 < arg_109_1.time_ and arg_109_1.time_ <= var_112_16 + arg_112_0 then
				arg_109_1.var_.moveOldPos1093ui_story = var_112_15.localPosition
			end

			local var_112_17 = 0.001

			if var_112_16 <= arg_109_1.time_ and arg_109_1.time_ < var_112_16 + var_112_17 then
				local var_112_18 = (arg_109_1.time_ - var_112_16) / var_112_17
				local var_112_19 = Vector3.New(0, 100, 0)

				var_112_15.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1093ui_story, var_112_19, var_112_18)

				local var_112_20 = manager.ui.mainCamera.transform.position - var_112_15.position

				var_112_15.forward = Vector3.New(var_112_20.x, var_112_20.y, var_112_20.z)

				local var_112_21 = var_112_15.localEulerAngles

				var_112_21.z = 0
				var_112_21.x = 0
				var_112_15.localEulerAngles = var_112_21
			end

			if arg_109_1.time_ >= var_112_16 + var_112_17 and arg_109_1.time_ < var_112_16 + var_112_17 + arg_112_0 then
				var_112_15.localPosition = Vector3.New(0, 100, 0)

				local var_112_22 = manager.ui.mainCamera.transform.position - var_112_15.position

				var_112_15.forward = Vector3.New(var_112_22.x, var_112_22.y, var_112_22.z)

				local var_112_23 = var_112_15.localEulerAngles

				var_112_23.z = 0
				var_112_23.x = 0
				var_112_15.localEulerAngles = var_112_23
			end

			local var_112_24 = arg_109_1.actors_["1093ui_story"]
			local var_112_25 = 0

			if var_112_25 < arg_109_1.time_ and arg_109_1.time_ <= var_112_25 + arg_112_0 and arg_109_1.var_.characterEffect1093ui_story == nil then
				arg_109_1.var_.characterEffect1093ui_story = var_112_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_26 = 0.200000002980232

			if var_112_25 <= arg_109_1.time_ and arg_109_1.time_ < var_112_25 + var_112_26 then
				local var_112_27 = (arg_109_1.time_ - var_112_25) / var_112_26

				if arg_109_1.var_.characterEffect1093ui_story then
					local var_112_28 = Mathf.Lerp(0, 0.5, var_112_27)

					arg_109_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1093ui_story.fillRatio = var_112_28
				end
			end

			if arg_109_1.time_ >= var_112_25 + var_112_26 and arg_109_1.time_ < var_112_25 + var_112_26 + arg_112_0 and arg_109_1.var_.characterEffect1093ui_story then
				local var_112_29 = 0.5

				arg_109_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1093ui_story.fillRatio = var_112_29
			end

			local var_112_30 = arg_109_1.actors_["1199ui_story"].transform
			local var_112_31 = 0

			if var_112_31 < arg_109_1.time_ and arg_109_1.time_ <= var_112_31 + arg_112_0 then
				arg_109_1.var_.moveOldPos1199ui_story = var_112_30.localPosition
			end

			local var_112_32 = 0.001

			if var_112_31 <= arg_109_1.time_ and arg_109_1.time_ < var_112_31 + var_112_32 then
				local var_112_33 = (arg_109_1.time_ - var_112_31) / var_112_32
				local var_112_34 = Vector3.New(0, 100, 0)

				var_112_30.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1199ui_story, var_112_34, var_112_33)

				local var_112_35 = manager.ui.mainCamera.transform.position - var_112_30.position

				var_112_30.forward = Vector3.New(var_112_35.x, var_112_35.y, var_112_35.z)

				local var_112_36 = var_112_30.localEulerAngles

				var_112_36.z = 0
				var_112_36.x = 0
				var_112_30.localEulerAngles = var_112_36
			end

			if arg_109_1.time_ >= var_112_31 + var_112_32 and arg_109_1.time_ < var_112_31 + var_112_32 + arg_112_0 then
				var_112_30.localPosition = Vector3.New(0, 100, 0)

				local var_112_37 = manager.ui.mainCamera.transform.position - var_112_30.position

				var_112_30.forward = Vector3.New(var_112_37.x, var_112_37.y, var_112_37.z)

				local var_112_38 = var_112_30.localEulerAngles

				var_112_38.z = 0
				var_112_38.x = 0
				var_112_30.localEulerAngles = var_112_38
			end

			local var_112_39 = 0
			local var_112_40 = 0.775

			if var_112_39 < arg_109_1.time_ and arg_109_1.time_ <= var_112_39 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_41 = arg_109_1:FormatText(StoryNameCfg[479].name)

				arg_109_1.leftNameTxt_.text = var_112_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_42 = arg_109_1:GetWordFromCfg(318021027)
				local var_112_43 = arg_109_1:FormatText(var_112_42.content)

				arg_109_1.text_.text = var_112_43

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_44 = 31
				local var_112_45 = utf8.len(var_112_43)
				local var_112_46 = var_112_44 <= 0 and var_112_40 or var_112_40 * (var_112_45 / var_112_44)

				if var_112_46 > 0 and var_112_40 < var_112_46 then
					arg_109_1.talkMaxDuration = var_112_46

					if var_112_46 + var_112_39 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_46 + var_112_39
					end
				end

				arg_109_1.text_.text = var_112_43
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021027", "story_v_out_318021.awb") ~= 0 then
					local var_112_47 = manager.audio:GetVoiceLength("story_v_out_318021", "318021027", "story_v_out_318021.awb") / 1000

					if var_112_47 + var_112_39 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_47 + var_112_39
					end

					if var_112_42.prefab_name ~= "" and arg_109_1.actors_[var_112_42.prefab_name] ~= nil then
						local var_112_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_42.prefab_name].transform, "story_v_out_318021", "318021027", "story_v_out_318021.awb")

						arg_109_1:RecordAudio("318021027", var_112_48)
						arg_109_1:RecordAudio("318021027", var_112_48)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_318021", "318021027", "story_v_out_318021.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_318021", "318021027", "story_v_out_318021.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_49 = math.max(var_112_40, arg_109_1.talkMaxDuration)

			if var_112_39 <= arg_109_1.time_ and arg_109_1.time_ < var_112_39 + var_112_49 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_39) / var_112_49

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_39 + var_112_49 and arg_109_1.time_ < var_112_39 + var_112_49 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play318021028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 318021028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play318021029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1015ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1015ui_story == nil then
				arg_113_1.var_.characterEffect1015ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1015ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1015ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1015ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1015ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0
			local var_116_7 = 0.6

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[7].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(318021028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 24
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
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_14 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_14 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_14

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_14 and arg_113_1.time_ < var_116_6 + var_116_14 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play318021029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 318021029
		arg_117_1.duration_ = 7.233

		local var_117_0 = {
			zh = 6.2,
			ja = 7.233
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
				arg_117_0:Play318021030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 2

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				local var_120_1 = manager.ui.mainCamera.transform.localPosition
				local var_120_2 = Vector3.New(0, 0, 10) + Vector3.New(var_120_1.x, var_120_1.y, 0)
				local var_120_3 = arg_117_1.bgs_.K10g

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
					if iter_120_0 ~= "K10g" then
						iter_120_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_120_14 = 2

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

			local var_120_20 = 0

			if var_120_20 < arg_117_1.time_ and arg_117_1.time_ <= var_120_20 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = true

				arg_117_1:SetGaussion(false)
			end

			local var_120_21 = 2

			if var_120_20 <= arg_117_1.time_ and arg_117_1.time_ < var_120_20 + var_120_21 then
				local var_120_22 = (arg_117_1.time_ - var_120_20) / var_120_21
				local var_120_23 = Color.New(0, 0, 0)

				var_120_23.a = Mathf.Lerp(0, 1, var_120_22)
				arg_117_1.mask_.color = var_120_23
			end

			if arg_117_1.time_ >= var_120_20 + var_120_21 and arg_117_1.time_ < var_120_20 + var_120_21 + arg_120_0 then
				local var_120_24 = Color.New(0, 0, 0)

				var_120_24.a = 1
				arg_117_1.mask_.color = var_120_24
			end

			local var_120_25 = arg_117_1.actors_["1049ui_story"].transform
			local var_120_26 = 4

			if var_120_26 < arg_117_1.time_ and arg_117_1.time_ <= var_120_26 + arg_120_0 then
				arg_117_1.var_.moveOldPos1049ui_story = var_120_25.localPosition
			end

			local var_120_27 = 0.001

			if var_120_26 <= arg_117_1.time_ and arg_117_1.time_ < var_120_26 + var_120_27 then
				local var_120_28 = (arg_117_1.time_ - var_120_26) / var_120_27
				local var_120_29 = Vector3.New(0, -1.2, -6)

				var_120_25.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1049ui_story, var_120_29, var_120_28)

				local var_120_30 = manager.ui.mainCamera.transform.position - var_120_25.position

				var_120_25.forward = Vector3.New(var_120_30.x, var_120_30.y, var_120_30.z)

				local var_120_31 = var_120_25.localEulerAngles

				var_120_31.z = 0
				var_120_31.x = 0
				var_120_25.localEulerAngles = var_120_31
			end

			if arg_117_1.time_ >= var_120_26 + var_120_27 and arg_117_1.time_ < var_120_26 + var_120_27 + arg_120_0 then
				var_120_25.localPosition = Vector3.New(0, -1.2, -6)

				local var_120_32 = manager.ui.mainCamera.transform.position - var_120_25.position

				var_120_25.forward = Vector3.New(var_120_32.x, var_120_32.y, var_120_32.z)

				local var_120_33 = var_120_25.localEulerAngles

				var_120_33.z = 0
				var_120_33.x = 0
				var_120_25.localEulerAngles = var_120_33
			end

			local var_120_34 = arg_117_1.actors_["1049ui_story"]
			local var_120_35 = 4

			if var_120_35 < arg_117_1.time_ and arg_117_1.time_ <= var_120_35 + arg_120_0 and arg_117_1.var_.characterEffect1049ui_story == nil then
				arg_117_1.var_.characterEffect1049ui_story = var_120_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_36 = 0.200000002980232

			if var_120_35 <= arg_117_1.time_ and arg_117_1.time_ < var_120_35 + var_120_36 then
				local var_120_37 = (arg_117_1.time_ - var_120_35) / var_120_36

				if arg_117_1.var_.characterEffect1049ui_story then
					arg_117_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_35 + var_120_36 and arg_117_1.time_ < var_120_35 + var_120_36 + arg_120_0 and arg_117_1.var_.characterEffect1049ui_story then
				arg_117_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_120_38 = 4

			if var_120_38 < arg_117_1.time_ and arg_117_1.time_ <= var_120_38 + arg_120_0 then
				arg_117_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_2")
			end

			local var_120_39 = 4

			if var_120_39 < arg_117_1.time_ and arg_117_1.time_ <= var_120_39 + arg_120_0 then
				arg_117_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_120_40 = arg_117_1.actors_["1015ui_story"].transform
			local var_120_41 = 2

			if var_120_41 < arg_117_1.time_ and arg_117_1.time_ <= var_120_41 + arg_120_0 then
				arg_117_1.var_.moveOldPos1015ui_story = var_120_40.localPosition
			end

			local var_120_42 = 0.001

			if var_120_41 <= arg_117_1.time_ and arg_117_1.time_ < var_120_41 + var_120_42 then
				local var_120_43 = (arg_117_1.time_ - var_120_41) / var_120_42
				local var_120_44 = Vector3.New(0, 100, 0)

				var_120_40.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1015ui_story, var_120_44, var_120_43)

				local var_120_45 = manager.ui.mainCamera.transform.position - var_120_40.position

				var_120_40.forward = Vector3.New(var_120_45.x, var_120_45.y, var_120_45.z)

				local var_120_46 = var_120_40.localEulerAngles

				var_120_46.z = 0
				var_120_46.x = 0
				var_120_40.localEulerAngles = var_120_46
			end

			if arg_117_1.time_ >= var_120_41 + var_120_42 and arg_117_1.time_ < var_120_41 + var_120_42 + arg_120_0 then
				var_120_40.localPosition = Vector3.New(0, 100, 0)

				local var_120_47 = manager.ui.mainCamera.transform.position - var_120_40.position

				var_120_40.forward = Vector3.New(var_120_47.x, var_120_47.y, var_120_47.z)

				local var_120_48 = var_120_40.localEulerAngles

				var_120_48.z = 0
				var_120_48.x = 0
				var_120_40.localEulerAngles = var_120_48
			end

			if arg_117_1.frameCnt_ <= 1 then
				arg_117_1.dialog_:SetActive(false)
			end

			local var_120_49 = 4
			local var_120_50 = 0.15

			if var_120_49 < arg_117_1.time_ and arg_117_1.time_ <= var_120_49 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				arg_117_1.dialog_:SetActive(true)

				local var_120_51 = LeanTween.value(arg_117_1.dialog_, 0, 1, 0.3)

				var_120_51:setOnUpdate(LuaHelper.FloatAction(function(arg_121_0)
					arg_117_1.dialogCg_.alpha = arg_121_0
				end))
				var_120_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_117_1.dialog_)
					var_120_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_117_1.duration_ = arg_117_1.duration_ + 0.3

				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_52 = arg_117_1:FormatText(StoryNameCfg[562].name)

				arg_117_1.leftNameTxt_.text = var_120_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_53 = arg_117_1:GetWordFromCfg(318021029)
				local var_120_54 = arg_117_1:FormatText(var_120_53.content)

				arg_117_1.text_.text = var_120_54

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_55 = 6
				local var_120_56 = utf8.len(var_120_54)
				local var_120_57 = var_120_55 <= 0 and var_120_50 or var_120_50 * (var_120_56 / var_120_55)

				if var_120_57 > 0 and var_120_50 < var_120_57 then
					arg_117_1.talkMaxDuration = var_120_57
					var_120_49 = var_120_49 + 0.3

					if var_120_57 + var_120_49 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_57 + var_120_49
					end
				end

				arg_117_1.text_.text = var_120_54
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021029", "story_v_out_318021.awb") ~= 0 then
					local var_120_58 = manager.audio:GetVoiceLength("story_v_out_318021", "318021029", "story_v_out_318021.awb") / 1000

					if var_120_58 + var_120_49 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_58 + var_120_49
					end

					if var_120_53.prefab_name ~= "" and arg_117_1.actors_[var_120_53.prefab_name] ~= nil then
						local var_120_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_53.prefab_name].transform, "story_v_out_318021", "318021029", "story_v_out_318021.awb")

						arg_117_1:RecordAudio("318021029", var_120_59)
						arg_117_1:RecordAudio("318021029", var_120_59)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_318021", "318021029", "story_v_out_318021.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_318021", "318021029", "story_v_out_318021.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_60 = var_120_49 + 0.3
			local var_120_61 = math.max(var_120_50, arg_117_1.talkMaxDuration)

			if var_120_60 <= arg_117_1.time_ and arg_117_1.time_ < var_120_60 + var_120_61 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_60) / var_120_61

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_60 + var_120_61 and arg_117_1.time_ < var_120_60 + var_120_61 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play318021030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 318021030
		arg_123_1.duration_ = 6.933

		local var_123_0 = {
			zh = 6.933,
			ja = 4.266
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
				arg_123_0:Play318021031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10053ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos10053ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0.7, -1.12, -5.99)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10053ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["10053ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect10053ui_story == nil then
				arg_123_1.var_.characterEffect10053ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect10053ui_story then
					arg_123_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect10053ui_story then
				arg_123_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action34_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_126_15 = arg_123_1.actors_["1049ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos1049ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(-0.7, -1.2, -6)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1049ui_story, var_126_19, var_126_18)

				local var_126_20 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_20.x, var_126_20.y, var_126_20.z)

				local var_126_21 = var_126_15.localEulerAngles

				var_126_21.z = 0
				var_126_21.x = 0
				var_126_15.localEulerAngles = var_126_21
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				var_126_15.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_126_22 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_22.x, var_126_22.y, var_126_22.z)

				local var_126_23 = var_126_15.localEulerAngles

				var_126_23.z = 0
				var_126_23.x = 0
				var_126_15.localEulerAngles = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["1049ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect1049ui_story == nil then
				arg_123_1.var_.characterEffect1049ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect1049ui_story then
					local var_126_28 = Mathf.Lerp(0, 0.5, var_126_27)

					arg_123_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1049ui_story.fillRatio = var_126_28
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1049ui_story then
				local var_126_29 = 0.5

				arg_123_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1049ui_story.fillRatio = var_126_29
			end

			local var_126_30 = 0
			local var_126_31 = 0.325

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_32 = arg_123_1:FormatText(StoryNameCfg[477].name)

				arg_123_1.leftNameTxt_.text = var_126_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_33 = arg_123_1:GetWordFromCfg(318021030)
				local var_126_34 = arg_123_1:FormatText(var_126_33.content)

				arg_123_1.text_.text = var_126_34

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_35 = 13
				local var_126_36 = utf8.len(var_126_34)
				local var_126_37 = var_126_35 <= 0 and var_126_31 or var_126_31 * (var_126_36 / var_126_35)

				if var_126_37 > 0 and var_126_31 < var_126_37 then
					arg_123_1.talkMaxDuration = var_126_37

					if var_126_37 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_37 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_34
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021030", "story_v_out_318021.awb") ~= 0 then
					local var_126_38 = manager.audio:GetVoiceLength("story_v_out_318021", "318021030", "story_v_out_318021.awb") / 1000

					if var_126_38 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_38 + var_126_30
					end

					if var_126_33.prefab_name ~= "" and arg_123_1.actors_[var_126_33.prefab_name] ~= nil then
						local var_126_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_33.prefab_name].transform, "story_v_out_318021", "318021030", "story_v_out_318021.awb")

						arg_123_1:RecordAudio("318021030", var_126_39)
						arg_123_1:RecordAudio("318021030", var_126_39)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_318021", "318021030", "story_v_out_318021.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_318021", "318021030", "story_v_out_318021.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_40 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_40 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_40

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_40 and arg_123_1.time_ < var_126_30 + var_126_40 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play318021031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 318021031
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play318021032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10053ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect10053ui_story == nil then
				arg_127_1.var_.characterEffect10053ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect10053ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_127_1.var_.characterEffect10053ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect10053ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_127_1.var_.characterEffect10053ui_story.fillRatio = var_130_5
			end

			local var_130_6 = 0
			local var_130_7 = 1.875

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_8 = arg_127_1:GetWordFromCfg(318021031)
				local var_130_9 = arg_127_1:FormatText(var_130_8.content)

				arg_127_1.text_.text = var_130_9

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_10 = 75
				local var_130_11 = utf8.len(var_130_9)
				local var_130_12 = var_130_10 <= 0 and var_130_7 or var_130_7 * (var_130_11 / var_130_10)

				if var_130_12 > 0 and var_130_7 < var_130_12 then
					arg_127_1.talkMaxDuration = var_130_12

					if var_130_12 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_12 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_9
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_13 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_13 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_13

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_13 and arg_127_1.time_ < var_130_6 + var_130_13 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play318021032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 318021032
		arg_131_1.duration_ = 1.999999999999

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play318021033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "1058ui_story"

			if arg_131_1.actors_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(Asset.Load("Char/" .. var_134_0), arg_131_1.stage_.transform)

				var_134_1.name = var_134_0
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.actors_[var_134_0] = var_134_1

				local var_134_2 = var_134_1:GetComponentInChildren(typeof(CharacterEffect))

				var_134_2.enabled = true

				local var_134_3 = GameObjectTools.GetOrAddComponent(var_134_1, typeof(DynamicBoneHelper))

				if var_134_3 then
					var_134_3:EnableDynamicBone(false)
				end

				arg_131_1:ShowWeapon(var_134_2.transform, false)

				arg_131_1.var_[var_134_0 .. "Animator"] = var_134_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_131_1.var_[var_134_0 .. "Animator"].applyRootMotion = true
				arg_131_1.var_[var_134_0 .. "LipSync"] = var_134_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_134_4 = arg_131_1.actors_["1058ui_story"].transform
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1.var_.moveOldPos1058ui_story = var_134_4.localPosition
			end

			local var_134_6 = 0.001

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6
				local var_134_8 = Vector3.New(0, -0.95, -5.88)

				var_134_4.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1058ui_story, var_134_8, var_134_7)

				local var_134_9 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_9.x, var_134_9.y, var_134_9.z)

				local var_134_10 = var_134_4.localEulerAngles

				var_134_10.z = 0
				var_134_10.x = 0
				var_134_4.localEulerAngles = var_134_10
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 then
				var_134_4.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_134_11 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_11.x, var_134_11.y, var_134_11.z)

				local var_134_12 = var_134_4.localEulerAngles

				var_134_12.z = 0
				var_134_12.x = 0
				var_134_4.localEulerAngles = var_134_12
			end

			local var_134_13 = arg_131_1.actors_["1058ui_story"]
			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 and arg_131_1.var_.characterEffect1058ui_story == nil then
				arg_131_1.var_.characterEffect1058ui_story = var_134_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_15 = 0.200000002980232

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_14) / var_134_15

				if arg_131_1.var_.characterEffect1058ui_story then
					arg_131_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_14 + var_134_15 and arg_131_1.time_ < var_134_14 + var_134_15 + arg_134_0 and arg_131_1.var_.characterEffect1058ui_story then
				arg_131_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_134_17 = 0

			if var_134_17 < arg_131_1.time_ and arg_131_1.time_ <= var_134_17 + arg_134_0 then
				arg_131_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_134_18 = 0

			if var_134_18 < arg_131_1.time_ and arg_131_1.time_ <= var_134_18 + arg_134_0 then
				arg_131_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_134_19 = arg_131_1.actors_["10053ui_story"].transform
			local var_134_20 = 0

			if var_134_20 < arg_131_1.time_ and arg_131_1.time_ <= var_134_20 + arg_134_0 then
				arg_131_1.var_.moveOldPos10053ui_story = var_134_19.localPosition
			end

			local var_134_21 = 0.001

			if var_134_20 <= arg_131_1.time_ and arg_131_1.time_ < var_134_20 + var_134_21 then
				local var_134_22 = (arg_131_1.time_ - var_134_20) / var_134_21
				local var_134_23 = Vector3.New(0, 100, 0)

				var_134_19.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10053ui_story, var_134_23, var_134_22)

				local var_134_24 = manager.ui.mainCamera.transform.position - var_134_19.position

				var_134_19.forward = Vector3.New(var_134_24.x, var_134_24.y, var_134_24.z)

				local var_134_25 = var_134_19.localEulerAngles

				var_134_25.z = 0
				var_134_25.x = 0
				var_134_19.localEulerAngles = var_134_25
			end

			if arg_131_1.time_ >= var_134_20 + var_134_21 and arg_131_1.time_ < var_134_20 + var_134_21 + arg_134_0 then
				var_134_19.localPosition = Vector3.New(0, 100, 0)

				local var_134_26 = manager.ui.mainCamera.transform.position - var_134_19.position

				var_134_19.forward = Vector3.New(var_134_26.x, var_134_26.y, var_134_26.z)

				local var_134_27 = var_134_19.localEulerAngles

				var_134_27.z = 0
				var_134_27.x = 0
				var_134_19.localEulerAngles = var_134_27
			end

			local var_134_28 = arg_131_1.actors_["1049ui_story"].transform
			local var_134_29 = 0

			if var_134_29 < arg_131_1.time_ and arg_131_1.time_ <= var_134_29 + arg_134_0 then
				arg_131_1.var_.moveOldPos1049ui_story = var_134_28.localPosition
			end

			local var_134_30 = 0.001

			if var_134_29 <= arg_131_1.time_ and arg_131_1.time_ < var_134_29 + var_134_30 then
				local var_134_31 = (arg_131_1.time_ - var_134_29) / var_134_30
				local var_134_32 = Vector3.New(0, 100, 0)

				var_134_28.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1049ui_story, var_134_32, var_134_31)

				local var_134_33 = manager.ui.mainCamera.transform.position - var_134_28.position

				var_134_28.forward = Vector3.New(var_134_33.x, var_134_33.y, var_134_33.z)

				local var_134_34 = var_134_28.localEulerAngles

				var_134_34.z = 0
				var_134_34.x = 0
				var_134_28.localEulerAngles = var_134_34
			end

			if arg_131_1.time_ >= var_134_29 + var_134_30 and arg_131_1.time_ < var_134_29 + var_134_30 + arg_134_0 then
				var_134_28.localPosition = Vector3.New(0, 100, 0)

				local var_134_35 = manager.ui.mainCamera.transform.position - var_134_28.position

				var_134_28.forward = Vector3.New(var_134_35.x, var_134_35.y, var_134_35.z)

				local var_134_36 = var_134_28.localEulerAngles

				var_134_36.z = 0
				var_134_36.x = 0
				var_134_28.localEulerAngles = var_134_36
			end

			local var_134_37 = 0
			local var_134_38 = 0.125

			if var_134_37 < arg_131_1.time_ and arg_131_1.time_ <= var_134_37 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_39 = arg_131_1:FormatText(StoryNameCfg[92].name)

				arg_131_1.leftNameTxt_.text = var_134_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_40 = arg_131_1:GetWordFromCfg(318021032)
				local var_134_41 = arg_131_1:FormatText(var_134_40.content)

				arg_131_1.text_.text = var_134_41

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_42 = 5
				local var_134_43 = utf8.len(var_134_41)
				local var_134_44 = var_134_42 <= 0 and var_134_38 or var_134_38 * (var_134_43 / var_134_42)

				if var_134_44 > 0 and var_134_38 < var_134_44 then
					arg_131_1.talkMaxDuration = var_134_44

					if var_134_44 + var_134_37 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_44 + var_134_37
					end
				end

				arg_131_1.text_.text = var_134_41
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021032", "story_v_out_318021.awb") ~= 0 then
					local var_134_45 = manager.audio:GetVoiceLength("story_v_out_318021", "318021032", "story_v_out_318021.awb") / 1000

					if var_134_45 + var_134_37 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_45 + var_134_37
					end

					if var_134_40.prefab_name ~= "" and arg_131_1.actors_[var_134_40.prefab_name] ~= nil then
						local var_134_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_40.prefab_name].transform, "story_v_out_318021", "318021032", "story_v_out_318021.awb")

						arg_131_1:RecordAudio("318021032", var_134_46)
						arg_131_1:RecordAudio("318021032", var_134_46)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_318021", "318021032", "story_v_out_318021.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_318021", "318021032", "story_v_out_318021.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_47 = math.max(var_134_38, arg_131_1.talkMaxDuration)

			if var_134_37 <= arg_131_1.time_ and arg_131_1.time_ < var_134_37 + var_134_47 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_37) / var_134_47

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_37 + var_134_47 and arg_131_1.time_ < var_134_37 + var_134_47 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play318021033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 318021033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play318021034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1058ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1058ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, 100, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1058ui_story, var_138_4, var_138_3)

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

			local var_138_9 = arg_135_1.actors_["1058ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1058ui_story == nil then
				arg_135_1.var_.characterEffect1058ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1058ui_story then
					local var_138_13 = Mathf.Lerp(0, 0.5, var_138_12)

					arg_135_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1058ui_story.fillRatio = var_138_13
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1058ui_story then
				local var_138_14 = 0.5

				arg_135_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1058ui_story.fillRatio = var_138_14
			end

			local var_138_15 = manager.ui.mainCamera.transform
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				local var_138_17 = arg_135_1.var_.effecthuoyan1

				if not var_138_17 then
					var_138_17 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_138_17.name = "huoyan1"
					arg_135_1.var_.effecthuoyan1 = var_138_17
				end

				local var_138_18 = var_138_15:Find("")

				if var_138_18 then
					var_138_17.transform.parent = var_138_18
				else
					var_138_17.transform.parent = var_138_15
				end

				var_138_17.transform.localPosition = Vector3.New(0, 0, 0)
				var_138_17.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_138_19 = manager.ui.mainCamera.transform
			local var_138_20 = 2

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				local var_138_21 = arg_135_1.var_.effecthuoyan1

				if var_138_21 then
					Object.Destroy(var_138_21)

					arg_135_1.var_.effecthuoyan1 = nil
				end
			end

			local var_138_22 = 0

			if var_138_22 < arg_135_1.time_ and arg_135_1.time_ <= var_138_22 + arg_138_0 then
				arg_135_1.mask_.enabled = true
				arg_135_1.mask_.raycastTarget = false

				arg_135_1:SetGaussion(false)
			end

			local var_138_23 = 0.5

			if var_138_22 <= arg_135_1.time_ and arg_135_1.time_ < var_138_22 + var_138_23 then
				local var_138_24 = (arg_135_1.time_ - var_138_22) / var_138_23
				local var_138_25 = Color.New(1, 0.4079707, 0.03301889)

				var_138_25.a = Mathf.Lerp(1, 0, var_138_24)
				arg_135_1.mask_.color = var_138_25
			end

			if arg_135_1.time_ >= var_138_22 + var_138_23 and arg_135_1.time_ < var_138_22 + var_138_23 + arg_138_0 then
				local var_138_26 = Color.New(1, 0.4079707, 0.03301889)
				local var_138_27 = 0

				arg_135_1.mask_.enabled = false
				var_138_26.a = var_138_27
				arg_135_1.mask_.color = var_138_26
			end

			local var_138_28 = manager.ui.mainCamera.transform
			local var_138_29 = 0

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 then
				local var_138_30 = arg_135_1.var_.effectjiajutuhuoyan1

				if not var_138_30 then
					var_138_30 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_138_30.name = "jiajutuhuoyan1"
					arg_135_1.var_.effectjiajutuhuoyan1 = var_138_30
				end

				local var_138_31 = var_138_28:Find("")

				if var_138_31 then
					var_138_30.transform.parent = var_138_31
				else
					var_138_30.transform.parent = var_138_28
				end

				var_138_30.transform.localPosition = Vector3.New(0, 0, 0)
				var_138_30.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_138_32 = 0
			local var_138_33 = 1

			if var_138_32 < arg_135_1.time_ and arg_135_1.time_ <= var_138_32 + arg_138_0 then
				local var_138_34 = "play"
				local var_138_35 = "effect"

				arg_135_1:AudioAction(var_138_34, var_138_35, "se_story_123_02", "se_story_123_02_fire", "")
			end

			local var_138_36 = 0
			local var_138_37 = 1.75

			if var_138_36 < arg_135_1.time_ and arg_135_1.time_ <= var_138_36 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_38 = arg_135_1:GetWordFromCfg(318021033)
				local var_138_39 = arg_135_1:FormatText(var_138_38.content)

				arg_135_1.text_.text = var_138_39

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_40 = 70
				local var_138_41 = utf8.len(var_138_39)
				local var_138_42 = var_138_40 <= 0 and var_138_37 or var_138_37 * (var_138_41 / var_138_40)

				if var_138_42 > 0 and var_138_37 < var_138_42 then
					arg_135_1.talkMaxDuration = var_138_42

					if var_138_42 + var_138_36 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_42 + var_138_36
					end
				end

				arg_135_1.text_.text = var_138_39
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_43 = math.max(var_138_37, arg_135_1.talkMaxDuration)

			if var_138_36 <= arg_135_1.time_ and arg_135_1.time_ < var_138_36 + var_138_43 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_36) / var_138_43

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_36 + var_138_43 and arg_135_1.time_ < var_138_36 + var_138_43 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play318021034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 318021034
		arg_139_1.duration_ = 3.3

		local var_139_0 = {
			zh = 3.3,
			ja = 2.866
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
				arg_139_0:Play318021035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1049ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1049ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, -1.2, -6)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1049ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1049ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1049ui_story == nil then
				arg_139_1.var_.characterEffect1049ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1049ui_story then
					arg_139_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1049ui_story then
				arg_139_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_142_13 = manager.ui.mainCamera.transform
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				local var_142_15 = arg_139_1.var_.effectjiajutuhuoyan1

				if var_142_15 then
					Object.Destroy(var_142_15)

					arg_139_1.var_.effectjiajutuhuoyan1 = nil
				end
			end

			local var_142_16 = 0
			local var_142_17 = 0.2

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_18 = arg_139_1:FormatText(StoryNameCfg[562].name)

				arg_139_1.leftNameTxt_.text = var_142_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_19 = arg_139_1:GetWordFromCfg(318021034)
				local var_142_20 = arg_139_1:FormatText(var_142_19.content)

				arg_139_1.text_.text = var_142_20

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_21 = 8
				local var_142_22 = utf8.len(var_142_20)
				local var_142_23 = var_142_21 <= 0 and var_142_17 or var_142_17 * (var_142_22 / var_142_21)

				if var_142_23 > 0 and var_142_17 < var_142_23 then
					arg_139_1.talkMaxDuration = var_142_23

					if var_142_23 + var_142_16 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_23 + var_142_16
					end
				end

				arg_139_1.text_.text = var_142_20
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021034", "story_v_out_318021.awb") ~= 0 then
					local var_142_24 = manager.audio:GetVoiceLength("story_v_out_318021", "318021034", "story_v_out_318021.awb") / 1000

					if var_142_24 + var_142_16 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_24 + var_142_16
					end

					if var_142_19.prefab_name ~= "" and arg_139_1.actors_[var_142_19.prefab_name] ~= nil then
						local var_142_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_19.prefab_name].transform, "story_v_out_318021", "318021034", "story_v_out_318021.awb")

						arg_139_1:RecordAudio("318021034", var_142_25)
						arg_139_1:RecordAudio("318021034", var_142_25)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_318021", "318021034", "story_v_out_318021.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_318021", "318021034", "story_v_out_318021.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_26 = math.max(var_142_17, arg_139_1.talkMaxDuration)

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_26 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_16) / var_142_26

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_16 + var_142_26 and arg_139_1.time_ < var_142_16 + var_142_26 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play318021035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 318021035
		arg_143_1.duration_ = 10.6

		local var_143_0 = {
			zh = 10.6,
			ja = 8.633
		}
		local var_143_1 = manager.audio:GetLocalizationFlag()

		if var_143_0[var_143_1] ~= nil then
			arg_143_1.duration_ = var_143_0[var_143_1]
		end

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play318021036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10053ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos10053ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0.7, -1.12, -5.99)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10053ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["10053ui_story"]
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 and arg_143_1.var_.characterEffect10053ui_story == nil then
				arg_143_1.var_.characterEffect10053ui_story = var_146_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_11 = 0.200000002980232

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11

				if arg_143_1.var_.characterEffect10053ui_story then
					arg_143_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 and arg_143_1.var_.characterEffect10053ui_story then
				arg_143_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_146_13 = arg_143_1.actors_["1049ui_story"].transform
			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1.var_.moveOldPos1049ui_story = var_146_13.localPosition
			end

			local var_146_15 = 0.001

			if var_146_14 <= arg_143_1.time_ and arg_143_1.time_ < var_146_14 + var_146_15 then
				local var_146_16 = (arg_143_1.time_ - var_146_14) / var_146_15
				local var_146_17 = Vector3.New(-0.7, -1.2, -6)

				var_146_13.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1049ui_story, var_146_17, var_146_16)

				local var_146_18 = manager.ui.mainCamera.transform.position - var_146_13.position

				var_146_13.forward = Vector3.New(var_146_18.x, var_146_18.y, var_146_18.z)

				local var_146_19 = var_146_13.localEulerAngles

				var_146_19.z = 0
				var_146_19.x = 0
				var_146_13.localEulerAngles = var_146_19
			end

			if arg_143_1.time_ >= var_146_14 + var_146_15 and arg_143_1.time_ < var_146_14 + var_146_15 + arg_146_0 then
				var_146_13.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_146_20 = manager.ui.mainCamera.transform.position - var_146_13.position

				var_146_13.forward = Vector3.New(var_146_20.x, var_146_20.y, var_146_20.z)

				local var_146_21 = var_146_13.localEulerAngles

				var_146_21.z = 0
				var_146_21.x = 0
				var_146_13.localEulerAngles = var_146_21
			end

			local var_146_22 = arg_143_1.actors_["1049ui_story"]
			local var_146_23 = 0

			if var_146_23 < arg_143_1.time_ and arg_143_1.time_ <= var_146_23 + arg_146_0 and arg_143_1.var_.characterEffect1049ui_story == nil then
				arg_143_1.var_.characterEffect1049ui_story = var_146_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_24 = 0.200000002980232

			if var_146_23 <= arg_143_1.time_ and arg_143_1.time_ < var_146_23 + var_146_24 then
				local var_146_25 = (arg_143_1.time_ - var_146_23) / var_146_24

				if arg_143_1.var_.characterEffect1049ui_story then
					local var_146_26 = Mathf.Lerp(0, 0.5, var_146_25)

					arg_143_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1049ui_story.fillRatio = var_146_26
				end
			end

			if arg_143_1.time_ >= var_146_23 + var_146_24 and arg_143_1.time_ < var_146_23 + var_146_24 + arg_146_0 and arg_143_1.var_.characterEffect1049ui_story then
				local var_146_27 = 0.5

				arg_143_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1049ui_story.fillRatio = var_146_27
			end

			local var_146_28 = 0
			local var_146_29 = 0.8

			if var_146_28 < arg_143_1.time_ and arg_143_1.time_ <= var_146_28 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_30 = arg_143_1:FormatText(StoryNameCfg[477].name)

				arg_143_1.leftNameTxt_.text = var_146_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_31 = arg_143_1:GetWordFromCfg(318021035)
				local var_146_32 = arg_143_1:FormatText(var_146_31.content)

				arg_143_1.text_.text = var_146_32

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_33 = 32
				local var_146_34 = utf8.len(var_146_32)
				local var_146_35 = var_146_33 <= 0 and var_146_29 or var_146_29 * (var_146_34 / var_146_33)

				if var_146_35 > 0 and var_146_29 < var_146_35 then
					arg_143_1.talkMaxDuration = var_146_35

					if var_146_35 + var_146_28 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_35 + var_146_28
					end
				end

				arg_143_1.text_.text = var_146_32
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021035", "story_v_out_318021.awb") ~= 0 then
					local var_146_36 = manager.audio:GetVoiceLength("story_v_out_318021", "318021035", "story_v_out_318021.awb") / 1000

					if var_146_36 + var_146_28 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_36 + var_146_28
					end

					if var_146_31.prefab_name ~= "" and arg_143_1.actors_[var_146_31.prefab_name] ~= nil then
						local var_146_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_31.prefab_name].transform, "story_v_out_318021", "318021035", "story_v_out_318021.awb")

						arg_143_1:RecordAudio("318021035", var_146_37)
						arg_143_1:RecordAudio("318021035", var_146_37)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_318021", "318021035", "story_v_out_318021.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_318021", "318021035", "story_v_out_318021.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_38 = math.max(var_146_29, arg_143_1.talkMaxDuration)

			if var_146_28 <= arg_143_1.time_ and arg_143_1.time_ < var_146_28 + var_146_38 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_28) / var_146_38

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_28 + var_146_38 and arg_143_1.time_ < var_146_28 + var_146_38 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play318021036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 318021036
		arg_147_1.duration_ = 5

		local var_147_0 = {
			zh = 4.533,
			ja = 5
		}
		local var_147_1 = manager.audio:GetLocalizationFlag()

		if var_147_0[var_147_1] ~= nil then
			arg_147_1.duration_ = var_147_0[var_147_1]
		end

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play318021037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1049ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1049ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(-0.7, -1.2, -6)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1049ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["1049ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect1049ui_story == nil then
				arg_147_1.var_.characterEffect1049ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect1049ui_story then
					arg_147_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect1049ui_story then
				arg_147_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_150_13 = arg_147_1.actors_["10053ui_story"]
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 and arg_147_1.var_.characterEffect10053ui_story == nil then
				arg_147_1.var_.characterEffect10053ui_story = var_150_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_15 = 0.200000002980232

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15

				if arg_147_1.var_.characterEffect10053ui_story then
					local var_150_17 = Mathf.Lerp(0, 0.5, var_150_16)

					arg_147_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_147_1.var_.characterEffect10053ui_story.fillRatio = var_150_17
				end
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 and arg_147_1.var_.characterEffect10053ui_story then
				local var_150_18 = 0.5

				arg_147_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_147_1.var_.characterEffect10053ui_story.fillRatio = var_150_18
			end

			local var_150_19 = 0
			local var_150_20 = 0.4

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[562].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(318021036)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 16
				local var_150_25 = utf8.len(var_150_23)
				local var_150_26 = var_150_24 <= 0 and var_150_20 or var_150_20 * (var_150_25 / var_150_24)

				if var_150_26 > 0 and var_150_20 < var_150_26 then
					arg_147_1.talkMaxDuration = var_150_26

					if var_150_26 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_26 + var_150_19
					end
				end

				arg_147_1.text_.text = var_150_23
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021036", "story_v_out_318021.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_318021", "318021036", "story_v_out_318021.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_318021", "318021036", "story_v_out_318021.awb")

						arg_147_1:RecordAudio("318021036", var_150_28)
						arg_147_1:RecordAudio("318021036", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_318021", "318021036", "story_v_out_318021.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_318021", "318021036", "story_v_out_318021.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_29 = math.max(var_150_20, arg_147_1.talkMaxDuration)

			if var_150_19 <= arg_147_1.time_ and arg_147_1.time_ < var_150_19 + var_150_29 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_19) / var_150_29

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_19 + var_150_29 and arg_147_1.time_ < var_150_19 + var_150_29 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play318021037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 318021037
		arg_151_1.duration_ = 8.833

		local var_151_0 = {
			zh = 8.833,
			ja = 4.5
		}
		local var_151_1 = manager.audio:GetLocalizationFlag()

		if var_151_0[var_151_1] ~= nil then
			arg_151_1.duration_ = var_151_0[var_151_1]
		end

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play318021038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1049ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1049ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(-0.7, -1.2, -6)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1049ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["1049ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect1049ui_story == nil then
				arg_151_1.var_.characterEffect1049ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect1049ui_story then
					arg_151_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect1049ui_story then
				arg_151_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_1")
			end

			local var_154_14 = 0
			local var_154_15 = 0.7

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_16 = arg_151_1:FormatText(StoryNameCfg[562].name)

				arg_151_1.leftNameTxt_.text = var_154_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_17 = arg_151_1:GetWordFromCfg(318021037)
				local var_154_18 = arg_151_1:FormatText(var_154_17.content)

				arg_151_1.text_.text = var_154_18

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_19 = 28
				local var_154_20 = utf8.len(var_154_18)
				local var_154_21 = var_154_19 <= 0 and var_154_15 or var_154_15 * (var_154_20 / var_154_19)

				if var_154_21 > 0 and var_154_15 < var_154_21 then
					arg_151_1.talkMaxDuration = var_154_21

					if var_154_21 + var_154_14 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_21 + var_154_14
					end
				end

				arg_151_1.text_.text = var_154_18
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021037", "story_v_out_318021.awb") ~= 0 then
					local var_154_22 = manager.audio:GetVoiceLength("story_v_out_318021", "318021037", "story_v_out_318021.awb") / 1000

					if var_154_22 + var_154_14 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_22 + var_154_14
					end

					if var_154_17.prefab_name ~= "" and arg_151_1.actors_[var_154_17.prefab_name] ~= nil then
						local var_154_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_17.prefab_name].transform, "story_v_out_318021", "318021037", "story_v_out_318021.awb")

						arg_151_1:RecordAudio("318021037", var_154_23)
						arg_151_1:RecordAudio("318021037", var_154_23)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_318021", "318021037", "story_v_out_318021.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_318021", "318021037", "story_v_out_318021.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_24 = math.max(var_154_15, arg_151_1.talkMaxDuration)

			if var_154_14 <= arg_151_1.time_ and arg_151_1.time_ < var_154_14 + var_154_24 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_14) / var_154_24

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_14 + var_154_24 and arg_151_1.time_ < var_154_14 + var_154_24 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play318021038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 318021038
		arg_155_1.duration_ = 1.999999999999

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play318021039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10053ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10053ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0.7, -1.12, -5.99)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10053ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["10053ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect10053ui_story == nil then
				arg_155_1.var_.characterEffect10053ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect10053ui_story then
					arg_155_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect10053ui_story then
				arg_155_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action34_2")
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_158_15 = arg_155_1.actors_["1049ui_story"]
			local var_158_16 = 0

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 and arg_155_1.var_.characterEffect1049ui_story == nil then
				arg_155_1.var_.characterEffect1049ui_story = var_158_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_17 = 0.200000002980232

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_16) / var_158_17

				if arg_155_1.var_.characterEffect1049ui_story then
					local var_158_19 = Mathf.Lerp(0, 0.5, var_158_18)

					arg_155_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1049ui_story.fillRatio = var_158_19
				end
			end

			if arg_155_1.time_ >= var_158_16 + var_158_17 and arg_155_1.time_ < var_158_16 + var_158_17 + arg_158_0 and arg_155_1.var_.characterEffect1049ui_story then
				local var_158_20 = 0.5

				arg_155_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1049ui_story.fillRatio = var_158_20
			end

			local var_158_21 = 0
			local var_158_22 = 0.1

			if var_158_21 < arg_155_1.time_ and arg_155_1.time_ <= var_158_21 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_23 = arg_155_1:FormatText(StoryNameCfg[477].name)

				arg_155_1.leftNameTxt_.text = var_158_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_24 = arg_155_1:GetWordFromCfg(318021038)
				local var_158_25 = arg_155_1:FormatText(var_158_24.content)

				arg_155_1.text_.text = var_158_25

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_26 = 4
				local var_158_27 = utf8.len(var_158_25)
				local var_158_28 = var_158_26 <= 0 and var_158_22 or var_158_22 * (var_158_27 / var_158_26)

				if var_158_28 > 0 and var_158_22 < var_158_28 then
					arg_155_1.talkMaxDuration = var_158_28

					if var_158_28 + var_158_21 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_28 + var_158_21
					end
				end

				arg_155_1.text_.text = var_158_25
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021038", "story_v_out_318021.awb") ~= 0 then
					local var_158_29 = manager.audio:GetVoiceLength("story_v_out_318021", "318021038", "story_v_out_318021.awb") / 1000

					if var_158_29 + var_158_21 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_29 + var_158_21
					end

					if var_158_24.prefab_name ~= "" and arg_155_1.actors_[var_158_24.prefab_name] ~= nil then
						local var_158_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_24.prefab_name].transform, "story_v_out_318021", "318021038", "story_v_out_318021.awb")

						arg_155_1:RecordAudio("318021038", var_158_30)
						arg_155_1:RecordAudio("318021038", var_158_30)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_318021", "318021038", "story_v_out_318021.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_318021", "318021038", "story_v_out_318021.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_31 = math.max(var_158_22, arg_155_1.talkMaxDuration)

			if var_158_21 <= arg_155_1.time_ and arg_155_1.time_ < var_158_21 + var_158_31 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_21) / var_158_31

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_21 + var_158_31 and arg_155_1.time_ < var_158_21 + var_158_31 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play318021039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 318021039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play318021040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10053ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10053ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(0, 100, 0)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10053ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, 100, 0)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["10053ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect10053ui_story == nil then
				arg_159_1.var_.characterEffect10053ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect10053ui_story then
					local var_162_13 = Mathf.Lerp(0, 0.5, var_162_12)

					arg_159_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_159_1.var_.characterEffect10053ui_story.fillRatio = var_162_13
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect10053ui_story then
				local var_162_14 = 0.5

				arg_159_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_159_1.var_.characterEffect10053ui_story.fillRatio = var_162_14
			end

			local var_162_15 = arg_159_1.actors_["1049ui_story"].transform
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 then
				arg_159_1.var_.moveOldPos1049ui_story = var_162_15.localPosition
			end

			local var_162_17 = 0.001

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17
				local var_162_19 = Vector3.New(0, 100, 0)

				var_162_15.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1049ui_story, var_162_19, var_162_18)

				local var_162_20 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_20.x, var_162_20.y, var_162_20.z)

				local var_162_21 = var_162_15.localEulerAngles

				var_162_21.z = 0
				var_162_21.x = 0
				var_162_15.localEulerAngles = var_162_21
			end

			if arg_159_1.time_ >= var_162_16 + var_162_17 and arg_159_1.time_ < var_162_16 + var_162_17 + arg_162_0 then
				var_162_15.localPosition = Vector3.New(0, 100, 0)

				local var_162_22 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_22.x, var_162_22.y, var_162_22.z)

				local var_162_23 = var_162_15.localEulerAngles

				var_162_23.z = 0
				var_162_23.x = 0
				var_162_15.localEulerAngles = var_162_23
			end

			local var_162_24 = arg_159_1.actors_["1049ui_story"]
			local var_162_25 = 0

			if var_162_25 < arg_159_1.time_ and arg_159_1.time_ <= var_162_25 + arg_162_0 and arg_159_1.var_.characterEffect1049ui_story == nil then
				arg_159_1.var_.characterEffect1049ui_story = var_162_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_26 = 0.200000002980232

			if var_162_25 <= arg_159_1.time_ and arg_159_1.time_ < var_162_25 + var_162_26 then
				local var_162_27 = (arg_159_1.time_ - var_162_25) / var_162_26

				if arg_159_1.var_.characterEffect1049ui_story then
					local var_162_28 = Mathf.Lerp(0, 0.5, var_162_27)

					arg_159_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1049ui_story.fillRatio = var_162_28
				end
			end

			if arg_159_1.time_ >= var_162_25 + var_162_26 and arg_159_1.time_ < var_162_25 + var_162_26 + arg_162_0 and arg_159_1.var_.characterEffect1049ui_story then
				local var_162_29 = 0.5

				arg_159_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1049ui_story.fillRatio = var_162_29
			end

			local var_162_30 = 0
			local var_162_31 = 1.425

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_32 = arg_159_1:GetWordFromCfg(318021039)
				local var_162_33 = arg_159_1:FormatText(var_162_32.content)

				arg_159_1.text_.text = var_162_33

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_34 = 57
				local var_162_35 = utf8.len(var_162_33)
				local var_162_36 = var_162_34 <= 0 and var_162_31 or var_162_31 * (var_162_35 / var_162_34)

				if var_162_36 > 0 and var_162_31 < var_162_36 then
					arg_159_1.talkMaxDuration = var_162_36

					if var_162_36 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_36 + var_162_30
					end
				end

				arg_159_1.text_.text = var_162_33
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_37 = math.max(var_162_31, arg_159_1.talkMaxDuration)

			if var_162_30 <= arg_159_1.time_ and arg_159_1.time_ < var_162_30 + var_162_37 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_30) / var_162_37

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_30 + var_162_37 and arg_159_1.time_ < var_162_30 + var_162_37 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play318021040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 318021040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play318021041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.65

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_2 = arg_163_1:GetWordFromCfg(318021040)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 66
				local var_166_5 = utf8.len(var_166_3)
				local var_166_6 = var_166_4 <= 0 and var_166_1 or var_166_1 * (var_166_5 / var_166_4)

				if var_166_6 > 0 and var_166_1 < var_166_6 then
					arg_163_1.talkMaxDuration = var_166_6

					if var_166_6 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_6 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_3
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_7 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_7 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_7

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_7 and arg_163_1.time_ < var_166_0 + var_166_7 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play318021041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 318021041
		arg_167_1.duration_ = 4.166

		local var_167_0 = {
			zh = 1.999999999999,
			ja = 4.166
		}
		local var_167_1 = manager.audio:GetLocalizationFlag()

		if var_167_0[var_167_1] ~= nil then
			arg_167_1.duration_ = var_167_0[var_167_1]
		end

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play318021042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1049ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1049ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, -1.2, -6)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1049ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1049ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1049ui_story == nil then
				arg_167_1.var_.characterEffect1049ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1049ui_story then
					arg_167_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1049ui_story then
				arg_167_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_170_13 = 0

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_170_14 = 0
			local var_170_15 = 0.25

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_16 = arg_167_1:FormatText(StoryNameCfg[562].name)

				arg_167_1.leftNameTxt_.text = var_170_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_17 = arg_167_1:GetWordFromCfg(318021041)
				local var_170_18 = arg_167_1:FormatText(var_170_17.content)

				arg_167_1.text_.text = var_170_18

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_19 = 10
				local var_170_20 = utf8.len(var_170_18)
				local var_170_21 = var_170_19 <= 0 and var_170_15 or var_170_15 * (var_170_20 / var_170_19)

				if var_170_21 > 0 and var_170_15 < var_170_21 then
					arg_167_1.talkMaxDuration = var_170_21

					if var_170_21 + var_170_14 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_21 + var_170_14
					end
				end

				arg_167_1.text_.text = var_170_18
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021041", "story_v_out_318021.awb") ~= 0 then
					local var_170_22 = manager.audio:GetVoiceLength("story_v_out_318021", "318021041", "story_v_out_318021.awb") / 1000

					if var_170_22 + var_170_14 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_22 + var_170_14
					end

					if var_170_17.prefab_name ~= "" and arg_167_1.actors_[var_170_17.prefab_name] ~= nil then
						local var_170_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_17.prefab_name].transform, "story_v_out_318021", "318021041", "story_v_out_318021.awb")

						arg_167_1:RecordAudio("318021041", var_170_23)
						arg_167_1:RecordAudio("318021041", var_170_23)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_318021", "318021041", "story_v_out_318021.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_318021", "318021041", "story_v_out_318021.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_24 = math.max(var_170_15, arg_167_1.talkMaxDuration)

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_24 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_14) / var_170_24

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_14 + var_170_24 and arg_167_1.time_ < var_170_14 + var_170_24 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play318021042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 318021042
		arg_171_1.duration_ = 8.766

		local var_171_0 = {
			zh = 5.733,
			ja = 8.766
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
				arg_171_0:Play318021043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10053ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos10053ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0.7, -1.12, -5.99)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10053ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["10053ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect10053ui_story == nil then
				arg_171_1.var_.characterEffect10053ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect10053ui_story then
					arg_171_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect10053ui_story then
				arg_171_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_15 = arg_171_1.actors_["1049ui_story"].transform
			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.var_.moveOldPos1049ui_story = var_174_15.localPosition
			end

			local var_174_17 = 0.001

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Vector3.New(-0.7, -1.2, -6)

				var_174_15.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1049ui_story, var_174_19, var_174_18)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_15.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_15.localEulerAngles = var_174_21
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				var_174_15.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_174_22 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_22.x, var_174_22.y, var_174_22.z)

				local var_174_23 = var_174_15.localEulerAngles

				var_174_23.z = 0
				var_174_23.x = 0
				var_174_15.localEulerAngles = var_174_23
			end

			local var_174_24 = arg_171_1.actors_["1049ui_story"]
			local var_174_25 = 0

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 and arg_171_1.var_.characterEffect1049ui_story == nil then
				arg_171_1.var_.characterEffect1049ui_story = var_174_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_26 = 0.200000002980232

			if var_174_25 <= arg_171_1.time_ and arg_171_1.time_ < var_174_25 + var_174_26 then
				local var_174_27 = (arg_171_1.time_ - var_174_25) / var_174_26

				if arg_171_1.var_.characterEffect1049ui_story then
					local var_174_28 = Mathf.Lerp(0, 0.5, var_174_27)

					arg_171_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1049ui_story.fillRatio = var_174_28
				end
			end

			if arg_171_1.time_ >= var_174_25 + var_174_26 and arg_171_1.time_ < var_174_25 + var_174_26 + arg_174_0 and arg_171_1.var_.characterEffect1049ui_story then
				local var_174_29 = 0.5

				arg_171_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1049ui_story.fillRatio = var_174_29
			end

			local var_174_30 = 0
			local var_174_31 = 0.475

			if var_174_30 < arg_171_1.time_ and arg_171_1.time_ <= var_174_30 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_32 = arg_171_1:FormatText(StoryNameCfg[477].name)

				arg_171_1.leftNameTxt_.text = var_174_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_33 = arg_171_1:GetWordFromCfg(318021042)
				local var_174_34 = arg_171_1:FormatText(var_174_33.content)

				arg_171_1.text_.text = var_174_34

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_35 = 19
				local var_174_36 = utf8.len(var_174_34)
				local var_174_37 = var_174_35 <= 0 and var_174_31 or var_174_31 * (var_174_36 / var_174_35)

				if var_174_37 > 0 and var_174_31 < var_174_37 then
					arg_171_1.talkMaxDuration = var_174_37

					if var_174_37 + var_174_30 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_37 + var_174_30
					end
				end

				arg_171_1.text_.text = var_174_34
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021042", "story_v_out_318021.awb") ~= 0 then
					local var_174_38 = manager.audio:GetVoiceLength("story_v_out_318021", "318021042", "story_v_out_318021.awb") / 1000

					if var_174_38 + var_174_30 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_38 + var_174_30
					end

					if var_174_33.prefab_name ~= "" and arg_171_1.actors_[var_174_33.prefab_name] ~= nil then
						local var_174_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_33.prefab_name].transform, "story_v_out_318021", "318021042", "story_v_out_318021.awb")

						arg_171_1:RecordAudio("318021042", var_174_39)
						arg_171_1:RecordAudio("318021042", var_174_39)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_318021", "318021042", "story_v_out_318021.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_318021", "318021042", "story_v_out_318021.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_40 = math.max(var_174_31, arg_171_1.talkMaxDuration)

			if var_174_30 <= arg_171_1.time_ and arg_171_1.time_ < var_174_30 + var_174_40 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_30) / var_174_40

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_30 + var_174_40 and arg_171_1.time_ < var_174_30 + var_174_40 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play318021043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 318021043
		arg_175_1.duration_ = 7.5

		local var_175_0 = {
			zh = 7.5,
			ja = 7.333
		}
		local var_175_1 = manager.audio:GetLocalizationFlag()

		if var_175_0[var_175_1] ~= nil then
			arg_175_1.duration_ = var_175_0[var_175_1]
		end

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play318021044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1049ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1049ui_story == nil then
				arg_175_1.var_.characterEffect1049ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1049ui_story then
					arg_175_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1049ui_story then
				arg_175_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_178_4 = arg_175_1.actors_["10053ui_story"]
			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 and arg_175_1.var_.characterEffect10053ui_story == nil then
				arg_175_1.var_.characterEffect10053ui_story = var_178_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_6 = 0.200000002980232

			if var_178_5 <= arg_175_1.time_ and arg_175_1.time_ < var_178_5 + var_178_6 then
				local var_178_7 = (arg_175_1.time_ - var_178_5) / var_178_6

				if arg_175_1.var_.characterEffect10053ui_story then
					local var_178_8 = Mathf.Lerp(0, 0.5, var_178_7)

					arg_175_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10053ui_story.fillRatio = var_178_8
				end
			end

			if arg_175_1.time_ >= var_178_5 + var_178_6 and arg_175_1.time_ < var_178_5 + var_178_6 + arg_178_0 and arg_175_1.var_.characterEffect10053ui_story then
				local var_178_9 = 0.5

				arg_175_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10053ui_story.fillRatio = var_178_9
			end

			local var_178_10 = 0
			local var_178_11 = 0.875

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_12 = arg_175_1:FormatText(StoryNameCfg[562].name)

				arg_175_1.leftNameTxt_.text = var_178_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_13 = arg_175_1:GetWordFromCfg(318021043)
				local var_178_14 = arg_175_1:FormatText(var_178_13.content)

				arg_175_1.text_.text = var_178_14

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_15 = 35
				local var_178_16 = utf8.len(var_178_14)
				local var_178_17 = var_178_15 <= 0 and var_178_11 or var_178_11 * (var_178_16 / var_178_15)

				if var_178_17 > 0 and var_178_11 < var_178_17 then
					arg_175_1.talkMaxDuration = var_178_17

					if var_178_17 + var_178_10 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_17 + var_178_10
					end
				end

				arg_175_1.text_.text = var_178_14
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021043", "story_v_out_318021.awb") ~= 0 then
					local var_178_18 = manager.audio:GetVoiceLength("story_v_out_318021", "318021043", "story_v_out_318021.awb") / 1000

					if var_178_18 + var_178_10 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_18 + var_178_10
					end

					if var_178_13.prefab_name ~= "" and arg_175_1.actors_[var_178_13.prefab_name] ~= nil then
						local var_178_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_13.prefab_name].transform, "story_v_out_318021", "318021043", "story_v_out_318021.awb")

						arg_175_1:RecordAudio("318021043", var_178_19)
						arg_175_1:RecordAudio("318021043", var_178_19)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_318021", "318021043", "story_v_out_318021.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_318021", "318021043", "story_v_out_318021.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_20 = math.max(var_178_11, arg_175_1.talkMaxDuration)

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_20 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_10) / var_178_20

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_10 + var_178_20 and arg_175_1.time_ < var_178_10 + var_178_20 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play318021044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 318021044
		arg_179_1.duration_ = 1.833

		local var_179_0 = {
			zh = 1.5,
			ja = 1.833
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play318021045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1049ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1049ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 100, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1049ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, 100, 0)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1049ui_story"]
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1049ui_story == nil then
				arg_179_1.var_.characterEffect1049ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.200000002980232

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1049ui_story then
					local var_182_13 = Mathf.Lerp(0, 0.5, var_182_12)

					arg_179_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1049ui_story.fillRatio = var_182_13
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1049ui_story then
				local var_182_14 = 0.5

				arg_179_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1049ui_story.fillRatio = var_182_14
			end

			local var_182_15 = arg_179_1.actors_["10053ui_story"].transform
			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 then
				arg_179_1.var_.moveOldPos10053ui_story = var_182_15.localPosition
			end

			local var_182_17 = 0.001

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17
				local var_182_19 = Vector3.New(0, 100, 0)

				var_182_15.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10053ui_story, var_182_19, var_182_18)

				local var_182_20 = manager.ui.mainCamera.transform.position - var_182_15.position

				var_182_15.forward = Vector3.New(var_182_20.x, var_182_20.y, var_182_20.z)

				local var_182_21 = var_182_15.localEulerAngles

				var_182_21.z = 0
				var_182_21.x = 0
				var_182_15.localEulerAngles = var_182_21
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 then
				var_182_15.localPosition = Vector3.New(0, 100, 0)

				local var_182_22 = manager.ui.mainCamera.transform.position - var_182_15.position

				var_182_15.forward = Vector3.New(var_182_22.x, var_182_22.y, var_182_22.z)

				local var_182_23 = var_182_15.localEulerAngles

				var_182_23.z = 0
				var_182_23.x = 0
				var_182_15.localEulerAngles = var_182_23
			end

			local var_182_24 = 0
			local var_182_25 = 0.175

			if var_182_24 < arg_179_1.time_ and arg_179_1.time_ <= var_182_24 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_26 = arg_179_1:FormatText(StoryNameCfg[479].name)

				arg_179_1.leftNameTxt_.text = var_182_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, true)
				arg_179_1.iconController_:SetSelectedState("hero")

				arg_179_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1015")

				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_27 = arg_179_1:GetWordFromCfg(318021044)
				local var_182_28 = arg_179_1:FormatText(var_182_27.content)

				arg_179_1.text_.text = var_182_28

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_29 = 7
				local var_182_30 = utf8.len(var_182_28)
				local var_182_31 = var_182_29 <= 0 and var_182_25 or var_182_25 * (var_182_30 / var_182_29)

				if var_182_31 > 0 and var_182_25 < var_182_31 then
					arg_179_1.talkMaxDuration = var_182_31

					if var_182_31 + var_182_24 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_31 + var_182_24
					end
				end

				arg_179_1.text_.text = var_182_28
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021044", "story_v_out_318021.awb") ~= 0 then
					local var_182_32 = manager.audio:GetVoiceLength("story_v_out_318021", "318021044", "story_v_out_318021.awb") / 1000

					if var_182_32 + var_182_24 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_32 + var_182_24
					end

					if var_182_27.prefab_name ~= "" and arg_179_1.actors_[var_182_27.prefab_name] ~= nil then
						local var_182_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_27.prefab_name].transform, "story_v_out_318021", "318021044", "story_v_out_318021.awb")

						arg_179_1:RecordAudio("318021044", var_182_33)
						arg_179_1:RecordAudio("318021044", var_182_33)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_318021", "318021044", "story_v_out_318021.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_318021", "318021044", "story_v_out_318021.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_34 = math.max(var_182_25, arg_179_1.talkMaxDuration)

			if var_182_24 <= arg_179_1.time_ and arg_179_1.time_ < var_182_24 + var_182_34 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_24) / var_182_34

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_24 + var_182_34 and arg_179_1.time_ < var_182_24 + var_182_34 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play318021045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 318021045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play318021046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1015ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1015ui_story == nil then
				arg_183_1.var_.characterEffect1015ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1015ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1015ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1015ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1015ui_story.fillRatio = var_186_5
			end

			local var_186_6 = 0
			local var_186_7 = 0.85

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_8 = arg_183_1:GetWordFromCfg(318021045)
				local var_186_9 = arg_183_1:FormatText(var_186_8.content)

				arg_183_1.text_.text = var_186_9

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_10 = 34
				local var_186_11 = utf8.len(var_186_9)
				local var_186_12 = var_186_10 <= 0 and var_186_7 or var_186_7 * (var_186_11 / var_186_10)

				if var_186_12 > 0 and var_186_7 < var_186_12 then
					arg_183_1.talkMaxDuration = var_186_12

					if var_186_12 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_12 + var_186_6
					end
				end

				arg_183_1.text_.text = var_186_9
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_13 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_13 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_13

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_13 and arg_183_1.time_ < var_186_6 + var_186_13 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play318021046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 318021046
		arg_187_1.duration_ = 2.366

		local var_187_0 = {
			zh = 1.999999999999,
			ja = 2.366
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
				arg_187_0:Play318021047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1049ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1049ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, -1.2, -6)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1049ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1049ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1049ui_story == nil then
				arg_187_1.var_.characterEffect1049ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1049ui_story then
					arg_187_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1049ui_story then
				arg_187_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_190_15 = arg_187_1.actors_["1015ui_story"].transform
			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.var_.moveOldPos1015ui_story = var_190_15.localPosition
			end

			local var_190_17 = 0.001

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Vector3.New(0, 100, 0)

				var_190_15.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1015ui_story, var_190_19, var_190_18)

				local var_190_20 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_20.x, var_190_20.y, var_190_20.z)

				local var_190_21 = var_190_15.localEulerAngles

				var_190_21.z = 0
				var_190_21.x = 0
				var_190_15.localEulerAngles = var_190_21
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				var_190_15.localPosition = Vector3.New(0, 100, 0)

				local var_190_22 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_22.x, var_190_22.y, var_190_22.z)

				local var_190_23 = var_190_15.localEulerAngles

				var_190_23.z = 0
				var_190_23.x = 0
				var_190_15.localEulerAngles = var_190_23
			end

			local var_190_24 = 0
			local var_190_25 = 0.1

			if var_190_24 < arg_187_1.time_ and arg_187_1.time_ <= var_190_24 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_26 = arg_187_1:FormatText(StoryNameCfg[562].name)

				arg_187_1.leftNameTxt_.text = var_190_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_27 = arg_187_1:GetWordFromCfg(318021046)
				local var_190_28 = arg_187_1:FormatText(var_190_27.content)

				arg_187_1.text_.text = var_190_28

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_29 = 4
				local var_190_30 = utf8.len(var_190_28)
				local var_190_31 = var_190_29 <= 0 and var_190_25 or var_190_25 * (var_190_30 / var_190_29)

				if var_190_31 > 0 and var_190_25 < var_190_31 then
					arg_187_1.talkMaxDuration = var_190_31

					if var_190_31 + var_190_24 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_31 + var_190_24
					end
				end

				arg_187_1.text_.text = var_190_28
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021046", "story_v_out_318021.awb") ~= 0 then
					local var_190_32 = manager.audio:GetVoiceLength("story_v_out_318021", "318021046", "story_v_out_318021.awb") / 1000

					if var_190_32 + var_190_24 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_32 + var_190_24
					end

					if var_190_27.prefab_name ~= "" and arg_187_1.actors_[var_190_27.prefab_name] ~= nil then
						local var_190_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_27.prefab_name].transform, "story_v_out_318021", "318021046", "story_v_out_318021.awb")

						arg_187_1:RecordAudio("318021046", var_190_33)
						arg_187_1:RecordAudio("318021046", var_190_33)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_318021", "318021046", "story_v_out_318021.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_318021", "318021046", "story_v_out_318021.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_34 = math.max(var_190_25, arg_187_1.talkMaxDuration)

			if var_190_24 <= arg_187_1.time_ and arg_187_1.time_ < var_190_24 + var_190_34 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_24) / var_190_34

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_24 + var_190_34 and arg_187_1.time_ < var_190_24 + var_190_34 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play318021047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 318021047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play318021048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1049ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1049ui_story == nil then
				arg_191_1.var_.characterEffect1049ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1049ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1049ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1049ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1049ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.35

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

				local var_194_9 = arg_191_1:GetWordFromCfg(318021047)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 14
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
	Play318021048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 318021048
		arg_195_1.duration_ = 9.333

		local var_195_0 = {
			zh = 4.166,
			ja = 9.333
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
				arg_195_0:Play318021049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10053ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10053ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0.7, -1.12, -5.99)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10053ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["10053ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect10053ui_story == nil then
				arg_195_1.var_.characterEffect10053ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.200000002980232

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect10053ui_story then
					arg_195_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect10053ui_story then
				arg_195_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action4_1")
			end

			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_198_15 = arg_195_1.actors_["1049ui_story"].transform
			local var_198_16 = 0

			if var_198_16 < arg_195_1.time_ and arg_195_1.time_ <= var_198_16 + arg_198_0 then
				arg_195_1.var_.moveOldPos1049ui_story = var_198_15.localPosition
			end

			local var_198_17 = 0.001

			if var_198_16 <= arg_195_1.time_ and arg_195_1.time_ < var_198_16 + var_198_17 then
				local var_198_18 = (arg_195_1.time_ - var_198_16) / var_198_17
				local var_198_19 = Vector3.New(-0.7, -1.2, -6)

				var_198_15.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1049ui_story, var_198_19, var_198_18)

				local var_198_20 = manager.ui.mainCamera.transform.position - var_198_15.position

				var_198_15.forward = Vector3.New(var_198_20.x, var_198_20.y, var_198_20.z)

				local var_198_21 = var_198_15.localEulerAngles

				var_198_21.z = 0
				var_198_21.x = 0
				var_198_15.localEulerAngles = var_198_21
			end

			if arg_195_1.time_ >= var_198_16 + var_198_17 and arg_195_1.time_ < var_198_16 + var_198_17 + arg_198_0 then
				var_198_15.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_198_22 = manager.ui.mainCamera.transform.position - var_198_15.position

				var_198_15.forward = Vector3.New(var_198_22.x, var_198_22.y, var_198_22.z)

				local var_198_23 = var_198_15.localEulerAngles

				var_198_23.z = 0
				var_198_23.x = 0
				var_198_15.localEulerAngles = var_198_23
			end

			local var_198_24 = 0
			local var_198_25 = 0.35

			if var_198_24 < arg_195_1.time_ and arg_195_1.time_ <= var_198_24 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_26 = arg_195_1:FormatText(StoryNameCfg[477].name)

				arg_195_1.leftNameTxt_.text = var_198_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_27 = arg_195_1:GetWordFromCfg(318021048)
				local var_198_28 = arg_195_1:FormatText(var_198_27.content)

				arg_195_1.text_.text = var_198_28

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_29 = 14
				local var_198_30 = utf8.len(var_198_28)
				local var_198_31 = var_198_29 <= 0 and var_198_25 or var_198_25 * (var_198_30 / var_198_29)

				if var_198_31 > 0 and var_198_25 < var_198_31 then
					arg_195_1.talkMaxDuration = var_198_31

					if var_198_31 + var_198_24 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_31 + var_198_24
					end
				end

				arg_195_1.text_.text = var_198_28
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318021", "318021048", "story_v_out_318021.awb") ~= 0 then
					local var_198_32 = manager.audio:GetVoiceLength("story_v_out_318021", "318021048", "story_v_out_318021.awb") / 1000

					if var_198_32 + var_198_24 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_32 + var_198_24
					end

					if var_198_27.prefab_name ~= "" and arg_195_1.actors_[var_198_27.prefab_name] ~= nil then
						local var_198_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_27.prefab_name].transform, "story_v_out_318021", "318021048", "story_v_out_318021.awb")

						arg_195_1:RecordAudio("318021048", var_198_33)
						arg_195_1:RecordAudio("318021048", var_198_33)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_318021", "318021048", "story_v_out_318021.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_318021", "318021048", "story_v_out_318021.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_34 = math.max(var_198_25, arg_195_1.talkMaxDuration)

			if var_198_24 <= arg_195_1.time_ and arg_195_1.time_ < var_198_24 + var_198_34 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_24) / var_198_34

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_24 + var_198_34 and arg_195_1.time_ < var_198_24 + var_198_34 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play318021049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 318021049
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play318021050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10053ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect10053ui_story == nil then
				arg_199_1.var_.characterEffect10053ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect10053ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_199_1.var_.characterEffect10053ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect10053ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_199_1.var_.characterEffect10053ui_story.fillRatio = var_202_5
			end

			local var_202_6 = 0
			local var_202_7 = 1.175

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_8 = arg_199_1:GetWordFromCfg(318021049)
				local var_202_9 = arg_199_1:FormatText(var_202_8.content)

				arg_199_1.text_.text = var_202_9

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_10 = 47
				local var_202_11 = utf8.len(var_202_9)
				local var_202_12 = var_202_10 <= 0 and var_202_7 or var_202_7 * (var_202_11 / var_202_10)

				if var_202_12 > 0 and var_202_7 < var_202_12 then
					arg_199_1.talkMaxDuration = var_202_12

					if var_202_12 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_12 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_9
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_13 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_13 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_13

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_13 and arg_199_1.time_ < var_202_6 + var_202_13 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play318021050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 318021050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
			arg_203_1.auto_ = false
		end

		function arg_203_1.playNext_(arg_205_0)
			arg_203_1.onStoryFinished_()
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.35

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[7].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(318021050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 14
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_8 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_8 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_8

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_8 and arg_203_1.time_ < var_206_0 + var_206_8 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K10g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11g"
	},
	voices = {
		"story_v_out_318021.awb"
	}
}
