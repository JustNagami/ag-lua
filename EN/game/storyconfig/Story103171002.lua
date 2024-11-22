return {
	Play317102001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317102001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317102002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K09f"

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
				local var_4_5 = arg_1_1.bgs_.K09f

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
					if iter_4_0 ~= "K09f" then
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
			local var_4_23 = 0.3

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.466666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.8

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

				local var_4_33 = arg_1_1:GetWordFromCfg(317102001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 72
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
	Play317102002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317102002
		arg_7_1.duration_ = 2.633

		local var_7_0 = {
			zh = 2.433,
			ja = 2.633
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
				arg_7_0:Play317102003(arg_7_1)
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

			local var_10_4 = arg_7_1.actors_["1093ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1093ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(-0.7, -1.11, -5.88)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1093ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1093ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1093ui_story == nil then
				arg_7_1.var_.characterEffect1093ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1093ui_story then
					arg_7_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1093ui_story then
				arg_7_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = "1015ui_story"

			if arg_7_1.actors_[var_10_19] == nil then
				local var_10_20 = Object.Instantiate(Asset.Load("Char/" .. var_10_19), arg_7_1.stage_.transform)

				var_10_20.name = var_10_19
				var_10_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_19] = var_10_20

				local var_10_21 = var_10_20:GetComponentInChildren(typeof(CharacterEffect))

				var_10_21.enabled = true

				local var_10_22 = GameObjectTools.GetOrAddComponent(var_10_20, typeof(DynamicBoneHelper))

				if var_10_22 then
					var_10_22:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_21.transform, false)

				arg_7_1.var_[var_10_19 .. "Animator"] = var_10_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_19 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_19 .. "LipSync"] = var_10_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_23 = arg_7_1.actors_["1015ui_story"].transform
			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1.var_.moveOldPos1015ui_story = var_10_23.localPosition
			end

			local var_10_25 = 0.001

			if var_10_24 <= arg_7_1.time_ and arg_7_1.time_ < var_10_24 + var_10_25 then
				local var_10_26 = (arg_7_1.time_ - var_10_24) / var_10_25
				local var_10_27 = Vector3.New(0.7, -1.15, -6.2)

				var_10_23.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1015ui_story, var_10_27, var_10_26)

				local var_10_28 = manager.ui.mainCamera.transform.position - var_10_23.position

				var_10_23.forward = Vector3.New(var_10_28.x, var_10_28.y, var_10_28.z)

				local var_10_29 = var_10_23.localEulerAngles

				var_10_29.z = 0
				var_10_29.x = 0
				var_10_23.localEulerAngles = var_10_29
			end

			if arg_7_1.time_ >= var_10_24 + var_10_25 and arg_7_1.time_ < var_10_24 + var_10_25 + arg_10_0 then
				var_10_23.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_10_30 = manager.ui.mainCamera.transform.position - var_10_23.position

				var_10_23.forward = Vector3.New(var_10_30.x, var_10_30.y, var_10_30.z)

				local var_10_31 = var_10_23.localEulerAngles

				var_10_31.z = 0
				var_10_31.x = 0
				var_10_23.localEulerAngles = var_10_31
			end

			local var_10_32 = arg_7_1.actors_["1015ui_story"]
			local var_10_33 = 0

			if var_10_33 < arg_7_1.time_ and arg_7_1.time_ <= var_10_33 + arg_10_0 and arg_7_1.var_.characterEffect1015ui_story == nil then
				arg_7_1.var_.characterEffect1015ui_story = var_10_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_34 = 0.200000002980232

			if var_10_33 <= arg_7_1.time_ and arg_7_1.time_ < var_10_33 + var_10_34 then
				local var_10_35 = (arg_7_1.time_ - var_10_33) / var_10_34

				if arg_7_1.var_.characterEffect1015ui_story then
					local var_10_36 = Mathf.Lerp(0, 0.5, var_10_35)

					arg_7_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1015ui_story.fillRatio = var_10_36
				end
			end

			if arg_7_1.time_ >= var_10_33 + var_10_34 and arg_7_1.time_ < var_10_33 + var_10_34 + arg_10_0 and arg_7_1.var_.characterEffect1015ui_story then
				local var_10_37 = 0.5

				arg_7_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1015ui_story.fillRatio = var_10_37
			end

			local var_10_38 = 0

			if var_10_38 < arg_7_1.time_ and arg_7_1.time_ <= var_10_38 + arg_10_0 then
				arg_7_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_10_39 = 0
			local var_10_40 = 0.275

			if var_10_39 < arg_7_1.time_ and arg_7_1.time_ <= var_10_39 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_41 = arg_7_1:FormatText(StoryNameCfg[73].name)

				arg_7_1.leftNameTxt_.text = var_10_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_42 = arg_7_1:GetWordFromCfg(317102002)
				local var_10_43 = arg_7_1:FormatText(var_10_42.content)

				arg_7_1.text_.text = var_10_43

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_44 = 11
				local var_10_45 = utf8.len(var_10_43)
				local var_10_46 = var_10_44 <= 0 and var_10_40 or var_10_40 * (var_10_45 / var_10_44)

				if var_10_46 > 0 and var_10_40 < var_10_46 then
					arg_7_1.talkMaxDuration = var_10_46

					if var_10_46 + var_10_39 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_46 + var_10_39
					end
				end

				arg_7_1.text_.text = var_10_43
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102002", "story_v_out_317102.awb") ~= 0 then
					local var_10_47 = manager.audio:GetVoiceLength("story_v_out_317102", "317102002", "story_v_out_317102.awb") / 1000

					if var_10_47 + var_10_39 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_47 + var_10_39
					end

					if var_10_42.prefab_name ~= "" and arg_7_1.actors_[var_10_42.prefab_name] ~= nil then
						local var_10_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_42.prefab_name].transform, "story_v_out_317102", "317102002", "story_v_out_317102.awb")

						arg_7_1:RecordAudio("317102002", var_10_48)
						arg_7_1:RecordAudio("317102002", var_10_48)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_317102", "317102002", "story_v_out_317102.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_317102", "317102002", "story_v_out_317102.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_49 = math.max(var_10_40, arg_7_1.talkMaxDuration)

			if var_10_39 <= arg_7_1.time_ and arg_7_1.time_ < var_10_39 + var_10_49 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_39) / var_10_49

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_39 + var_10_49 and arg_7_1.time_ < var_10_39 + var_10_49 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play317102003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317102003
		arg_11_1.duration_ = 4.3

		local var_11_0 = {
			zh = 4.033,
			ja = 4.3
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
				arg_11_0:Play317102004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1093ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1093ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1093ui_story, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["1093ui_story"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story == nil then
				arg_11_1.var_.characterEffect1093ui_story = var_14_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_11 = 0.200000002980232

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.characterEffect1093ui_story then
					local var_14_13 = Mathf.Lerp(0, 0.5, var_14_12)

					arg_11_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1093ui_story.fillRatio = var_14_13
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story then
				local var_14_14 = 0.5

				arg_11_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1093ui_story.fillRatio = var_14_14
			end

			local var_14_15 = arg_11_1.actors_["1015ui_story"].transform
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				arg_11_1.var_.moveOldPos1015ui_story = var_14_15.localPosition
			end

			local var_14_17 = 0.001

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17
				local var_14_19 = Vector3.New(0.7, -1.15, -6.2)

				var_14_15.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1015ui_story, var_14_19, var_14_18)

				local var_14_20 = manager.ui.mainCamera.transform.position - var_14_15.position

				var_14_15.forward = Vector3.New(var_14_20.x, var_14_20.y, var_14_20.z)

				local var_14_21 = var_14_15.localEulerAngles

				var_14_21.z = 0
				var_14_21.x = 0
				var_14_15.localEulerAngles = var_14_21
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 then
				var_14_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_14_22 = manager.ui.mainCamera.transform.position - var_14_15.position

				var_14_15.forward = Vector3.New(var_14_22.x, var_14_22.y, var_14_22.z)

				local var_14_23 = var_14_15.localEulerAngles

				var_14_23.z = 0
				var_14_23.x = 0
				var_14_15.localEulerAngles = var_14_23
			end

			local var_14_24 = arg_11_1.actors_["1015ui_story"]
			local var_14_25 = 0

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 and arg_11_1.var_.characterEffect1015ui_story == nil then
				arg_11_1.var_.characterEffect1015ui_story = var_14_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_26 = 0.200000002980232

			if var_14_25 <= arg_11_1.time_ and arg_11_1.time_ < var_14_25 + var_14_26 then
				local var_14_27 = (arg_11_1.time_ - var_14_25) / var_14_26

				if arg_11_1.var_.characterEffect1015ui_story then
					arg_11_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_25 + var_14_26 and arg_11_1.time_ < var_14_25 + var_14_26 + arg_14_0 and arg_11_1.var_.characterEffect1015ui_story then
				arg_11_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_14_28 = 0

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_29 = 0
			local var_14_30 = 0.5

			if var_14_29 < arg_11_1.time_ and arg_11_1.time_ <= var_14_29 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_31 = arg_11_1:FormatText(StoryNameCfg[479].name)

				arg_11_1.leftNameTxt_.text = var_14_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_32 = arg_11_1:GetWordFromCfg(317102003)
				local var_14_33 = arg_11_1:FormatText(var_14_32.content)

				arg_11_1.text_.text = var_14_33

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_34 = 20
				local var_14_35 = utf8.len(var_14_33)
				local var_14_36 = var_14_34 <= 0 and var_14_30 or var_14_30 * (var_14_35 / var_14_34)

				if var_14_36 > 0 and var_14_30 < var_14_36 then
					arg_11_1.talkMaxDuration = var_14_36

					if var_14_36 + var_14_29 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_36 + var_14_29
					end
				end

				arg_11_1.text_.text = var_14_33
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102003", "story_v_out_317102.awb") ~= 0 then
					local var_14_37 = manager.audio:GetVoiceLength("story_v_out_317102", "317102003", "story_v_out_317102.awb") / 1000

					if var_14_37 + var_14_29 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_37 + var_14_29
					end

					if var_14_32.prefab_name ~= "" and arg_11_1.actors_[var_14_32.prefab_name] ~= nil then
						local var_14_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_32.prefab_name].transform, "story_v_out_317102", "317102003", "story_v_out_317102.awb")

						arg_11_1:RecordAudio("317102003", var_14_38)
						arg_11_1:RecordAudio("317102003", var_14_38)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317102", "317102003", "story_v_out_317102.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317102", "317102003", "story_v_out_317102.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_39 = math.max(var_14_30, arg_11_1.talkMaxDuration)

			if var_14_29 <= arg_11_1.time_ and arg_11_1.time_ < var_14_29 + var_14_39 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_29) / var_14_39

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_29 + var_14_39 and arg_11_1.time_ < var_14_29 + var_14_39 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317102004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317102004
		arg_15_1.duration_ = 6.5

		local var_15_0 = {
			zh = 6.166,
			ja = 6.5
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
				arg_15_0:Play317102005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1015ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1015ui_story == nil then
				arg_15_1.var_.characterEffect1015ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1015ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1015ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1015ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1015ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["1093ui_story"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_8 = 0.200000002980232

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.characterEffect1093ui_story then
					arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_18_10 = 0
			local var_18_11 = 0.775

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_12 = arg_15_1:FormatText(StoryNameCfg[73].name)

				arg_15_1.leftNameTxt_.text = var_18_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_13 = arg_15_1:GetWordFromCfg(317102004)
				local var_18_14 = arg_15_1:FormatText(var_18_13.content)

				arg_15_1.text_.text = var_18_14

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_15 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102004", "story_v_out_317102.awb") ~= 0 then
					local var_18_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102004", "story_v_out_317102.awb") / 1000

					if var_18_18 + var_18_10 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_18 + var_18_10
					end

					if var_18_13.prefab_name ~= "" and arg_15_1.actors_[var_18_13.prefab_name] ~= nil then
						local var_18_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_13.prefab_name].transform, "story_v_out_317102", "317102004", "story_v_out_317102.awb")

						arg_15_1:RecordAudio("317102004", var_18_19)
						arg_15_1:RecordAudio("317102004", var_18_19)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317102", "317102004", "story_v_out_317102.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317102", "317102004", "story_v_out_317102.awb")
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
	Play317102005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317102005
		arg_19_1.duration_ = 7.666

		local var_19_0 = {
			zh = 7.666,
			ja = 3.033
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
				arg_19_0:Play317102006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1015ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1015ui_story == nil then
				arg_19_1.var_.characterEffect1015ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1015ui_story then
					arg_19_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1015ui_story then
				arg_19_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1093ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story == nil then
				arg_19_1.var_.characterEffect1093ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.200000002980232

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1093ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_9
			end

			local var_22_10 = 0
			local var_22_11 = 0.875

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_12 = arg_19_1:FormatText(StoryNameCfg[479].name)

				arg_19_1.leftNameTxt_.text = var_22_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_13 = arg_19_1:GetWordFromCfg(317102005)
				local var_22_14 = arg_19_1:FormatText(var_22_13.content)

				arg_19_1.text_.text = var_22_14

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_15 = 35
				local var_22_16 = utf8.len(var_22_14)
				local var_22_17 = var_22_15 <= 0 and var_22_11 or var_22_11 * (var_22_16 / var_22_15)

				if var_22_17 > 0 and var_22_11 < var_22_17 then
					arg_19_1.talkMaxDuration = var_22_17

					if var_22_17 + var_22_10 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_17 + var_22_10
					end
				end

				arg_19_1.text_.text = var_22_14
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102005", "story_v_out_317102.awb") ~= 0 then
					local var_22_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102005", "story_v_out_317102.awb") / 1000

					if var_22_18 + var_22_10 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_18 + var_22_10
					end

					if var_22_13.prefab_name ~= "" and arg_19_1.actors_[var_22_13.prefab_name] ~= nil then
						local var_22_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_13.prefab_name].transform, "story_v_out_317102", "317102005", "story_v_out_317102.awb")

						arg_19_1:RecordAudio("317102005", var_22_19)
						arg_19_1:RecordAudio("317102005", var_22_19)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_317102", "317102005", "story_v_out_317102.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_317102", "317102005", "story_v_out_317102.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_20 = math.max(var_22_11, arg_19_1.talkMaxDuration)

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_20 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_10) / var_22_20

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_10 + var_22_20 and arg_19_1.time_ < var_22_10 + var_22_20 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317102006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317102006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play317102007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1093ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1093ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1093ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, 100, 0)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1093ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story == nil then
				arg_23_1.var_.characterEffect1093ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1093ui_story then
					local var_26_13 = Mathf.Lerp(0, 0.5, var_26_12)

					arg_23_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1093ui_story.fillRatio = var_26_13
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1093ui_story then
				local var_26_14 = 0.5

				arg_23_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1093ui_story.fillRatio = var_26_14
			end

			local var_26_15 = arg_23_1.actors_["1015ui_story"].transform
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.var_.moveOldPos1015ui_story = var_26_15.localPosition
			end

			local var_26_17 = 0.001

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Vector3.New(0, 100, 0)

				var_26_15.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1015ui_story, var_26_19, var_26_18)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_15.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_15.localEulerAngles = var_26_21
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				var_26_15.localPosition = Vector3.New(0, 100, 0)

				local var_26_22 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_22.x, var_26_22.y, var_26_22.z)

				local var_26_23 = var_26_15.localEulerAngles

				var_26_23.z = 0
				var_26_23.x = 0
				var_26_15.localEulerAngles = var_26_23
			end

			local var_26_24 = arg_23_1.actors_["1015ui_story"]
			local var_26_25 = 0

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 and arg_23_1.var_.characterEffect1015ui_story == nil then
				arg_23_1.var_.characterEffect1015ui_story = var_26_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_26 = 0.200000002980232

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_25) / var_26_26

				if arg_23_1.var_.characterEffect1015ui_story then
					local var_26_28 = Mathf.Lerp(0, 0.5, var_26_27)

					arg_23_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1015ui_story.fillRatio = var_26_28
				end
			end

			if arg_23_1.time_ >= var_26_25 + var_26_26 and arg_23_1.time_ < var_26_25 + var_26_26 + arg_26_0 and arg_23_1.var_.characterEffect1015ui_story then
				local var_26_29 = 0.5

				arg_23_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1015ui_story.fillRatio = var_26_29
			end

			local var_26_30 = 0
			local var_26_31 = 0.55

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_32 = arg_23_1:GetWordFromCfg(317102006)
				local var_26_33 = arg_23_1:FormatText(var_26_32.content)

				arg_23_1.text_.text = var_26_33

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_34 = 22
				local var_26_35 = utf8.len(var_26_33)
				local var_26_36 = var_26_34 <= 0 and var_26_31 or var_26_31 * (var_26_35 / var_26_34)

				if var_26_36 > 0 and var_26_31 < var_26_36 then
					arg_23_1.talkMaxDuration = var_26_36

					if var_26_36 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_36 + var_26_30
					end
				end

				arg_23_1.text_.text = var_26_33
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_37 = math.max(var_26_31, arg_23_1.talkMaxDuration)

			if var_26_30 <= arg_23_1.time_ and arg_23_1.time_ < var_26_30 + var_26_37 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_30) / var_26_37

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_30 + var_26_37 and arg_23_1.time_ < var_26_30 + var_26_37 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317102007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317102007
		arg_27_1.duration_ = 3.1

		local var_27_0 = {
			zh = 2.266,
			ja = 3.1
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
				arg_27_0:Play317102008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1093ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1093ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1093ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1093ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1093ui_story == nil then
				arg_27_1.var_.characterEffect1093ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1093ui_story then
					arg_27_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1093ui_story then
				arg_27_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_30_15 = arg_27_1.actors_["1015ui_story"].transform
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 then
				arg_27_1.var_.moveOldPos1015ui_story = var_30_15.localPosition
			end

			local var_30_17 = 0.001

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17
				local var_30_19 = Vector3.New(0.7, -1.15, -6.2)

				var_30_15.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1015ui_story, var_30_19, var_30_18)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_15.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_15.localEulerAngles = var_30_21
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 then
				var_30_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_15.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_15.localEulerAngles = var_30_23
			end

			local var_30_24 = arg_27_1.actors_["1015ui_story"]
			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 and arg_27_1.var_.characterEffect1015ui_story == nil then
				arg_27_1.var_.characterEffect1015ui_story = var_30_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_26 = 0.200000002980232

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_25) / var_30_26

				if arg_27_1.var_.characterEffect1015ui_story then
					local var_30_28 = Mathf.Lerp(0, 0.5, var_30_27)

					arg_27_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1015ui_story.fillRatio = var_30_28
				end
			end

			if arg_27_1.time_ >= var_30_25 + var_30_26 and arg_27_1.time_ < var_30_25 + var_30_26 + arg_30_0 and arg_27_1.var_.characterEffect1015ui_story then
				local var_30_29 = 0.5

				arg_27_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1015ui_story.fillRatio = var_30_29
			end

			local var_30_30 = 0

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_30_31 = 0
			local var_30_32 = 0.275

			if var_30_31 < arg_27_1.time_ and arg_27_1.time_ <= var_30_31 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_33 = arg_27_1:FormatText(StoryNameCfg[73].name)

				arg_27_1.leftNameTxt_.text = var_30_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_34 = arg_27_1:GetWordFromCfg(317102007)
				local var_30_35 = arg_27_1:FormatText(var_30_34.content)

				arg_27_1.text_.text = var_30_35

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_36 = 11
				local var_30_37 = utf8.len(var_30_35)
				local var_30_38 = var_30_36 <= 0 and var_30_32 or var_30_32 * (var_30_37 / var_30_36)

				if var_30_38 > 0 and var_30_32 < var_30_38 then
					arg_27_1.talkMaxDuration = var_30_38

					if var_30_38 + var_30_31 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_38 + var_30_31
					end
				end

				arg_27_1.text_.text = var_30_35
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102007", "story_v_out_317102.awb") ~= 0 then
					local var_30_39 = manager.audio:GetVoiceLength("story_v_out_317102", "317102007", "story_v_out_317102.awb") / 1000

					if var_30_39 + var_30_31 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_39 + var_30_31
					end

					if var_30_34.prefab_name ~= "" and arg_27_1.actors_[var_30_34.prefab_name] ~= nil then
						local var_30_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_34.prefab_name].transform, "story_v_out_317102", "317102007", "story_v_out_317102.awb")

						arg_27_1:RecordAudio("317102007", var_30_40)
						arg_27_1:RecordAudio("317102007", var_30_40)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_317102", "317102007", "story_v_out_317102.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_317102", "317102007", "story_v_out_317102.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_41 = math.max(var_30_32, arg_27_1.talkMaxDuration)

			if var_30_31 <= arg_27_1.time_ and arg_27_1.time_ < var_30_31 + var_30_41 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_31) / var_30_41

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_31 + var_30_41 and arg_27_1.time_ < var_30_31 + var_30_41 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317102008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317102008
		arg_31_1.duration_ = 7.366

		local var_31_0 = {
			zh = 7.366,
			ja = 6.2
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
				arg_31_0:Play317102009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1093ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1093ui_story == nil then
				arg_31_1.var_.characterEffect1093ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

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

			local var_34_6 = arg_31_1.actors_["1015ui_story"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.characterEffect1015ui_story == nil then
				arg_31_1.var_.characterEffect1015ui_story = var_34_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_8 = 0.200000002980232

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.characterEffect1015ui_story then
					arg_31_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect1015ui_story then
				arg_31_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_34_10 = 0
			local var_34_11 = 0.9

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_12 = arg_31_1:FormatText(StoryNameCfg[479].name)

				arg_31_1.leftNameTxt_.text = var_34_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_13 = arg_31_1:GetWordFromCfg(317102008)
				local var_34_14 = arg_31_1:FormatText(var_34_13.content)

				arg_31_1.text_.text = var_34_14

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_15 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102008", "story_v_out_317102.awb") ~= 0 then
					local var_34_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102008", "story_v_out_317102.awb") / 1000

					if var_34_18 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_10
					end

					if var_34_13.prefab_name ~= "" and arg_31_1.actors_[var_34_13.prefab_name] ~= nil then
						local var_34_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_13.prefab_name].transform, "story_v_out_317102", "317102008", "story_v_out_317102.awb")

						arg_31_1:RecordAudio("317102008", var_34_19)
						arg_31_1:RecordAudio("317102008", var_34_19)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_317102", "317102008", "story_v_out_317102.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_317102", "317102008", "story_v_out_317102.awb")
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
	Play317102009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317102009
		arg_35_1.duration_ = 2.7

		local var_35_0 = {
			zh = 2.266,
			ja = 2.7
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
				arg_35_0:Play317102010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1093ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story == nil then
				arg_35_1.var_.characterEffect1093ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1093ui_story then
					arg_35_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story then
				arg_35_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1015ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1015ui_story == nil then
				arg_35_1.var_.characterEffect1015ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.200000002980232

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1015ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1015ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1015ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1015ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0
			local var_38_11 = 0.275

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[73].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(317102009)
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102009", "story_v_out_317102.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102009", "story_v_out_317102.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_317102", "317102009", "story_v_out_317102.awb")

						arg_35_1:RecordAudio("317102009", var_38_19)
						arg_35_1:RecordAudio("317102009", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_317102", "317102009", "story_v_out_317102.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_317102", "317102009", "story_v_out_317102.awb")
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
	Play317102010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317102010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play317102011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1093ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1093ui_story == nil then
				arg_39_1.var_.characterEffect1093ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

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
			local var_42_7 = 0.55

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(317102010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 22
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_7 or var_42_7 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_7 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_13 and arg_39_1.time_ < var_42_6 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317102011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317102011
		arg_43_1.duration_ = 10.9

		local var_43_0 = {
			zh = 7.866,
			ja = 10.9
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
				arg_43_0:Play317102012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1015ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1015ui_story == nil then
				arg_43_1.var_.characterEffect1015ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1015ui_story then
					arg_43_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1015ui_story then
				arg_43_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_46_4 = 0
			local var_46_5 = 0.55

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_6 = arg_43_1:FormatText(StoryNameCfg[479].name)

				arg_43_1.leftNameTxt_.text = var_46_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_7 = arg_43_1:GetWordFromCfg(317102011)
				local var_46_8 = arg_43_1:FormatText(var_46_7.content)

				arg_43_1.text_.text = var_46_8

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_9 = 22
				local var_46_10 = utf8.len(var_46_8)
				local var_46_11 = var_46_9 <= 0 and var_46_5 or var_46_5 * (var_46_10 / var_46_9)

				if var_46_11 > 0 and var_46_5 < var_46_11 then
					arg_43_1.talkMaxDuration = var_46_11

					if var_46_11 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_11 + var_46_4
					end
				end

				arg_43_1.text_.text = var_46_8
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102011", "story_v_out_317102.awb") ~= 0 then
					local var_46_12 = manager.audio:GetVoiceLength("story_v_out_317102", "317102011", "story_v_out_317102.awb") / 1000

					if var_46_12 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_4
					end

					if var_46_7.prefab_name ~= "" and arg_43_1.actors_[var_46_7.prefab_name] ~= nil then
						local var_46_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_7.prefab_name].transform, "story_v_out_317102", "317102011", "story_v_out_317102.awb")

						arg_43_1:RecordAudio("317102011", var_46_13)
						arg_43_1:RecordAudio("317102011", var_46_13)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_317102", "317102011", "story_v_out_317102.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_317102", "317102011", "story_v_out_317102.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_5, arg_43_1.talkMaxDuration)

			if var_46_4 <= arg_43_1.time_ and arg_43_1.time_ < var_46_4 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_4) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_4 + var_46_14 and arg_43_1.time_ < var_46_4 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play317102012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317102012
		arg_47_1.duration_ = 4.9

		local var_47_0 = {
			zh = 4.9,
			ja = 2.266
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
				arg_47_0:Play317102013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1093ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1093ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1093ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1093ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1093ui_story == nil then
				arg_47_1.var_.characterEffect1093ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1093ui_story then
					arg_47_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1093ui_story then
				arg_47_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_15 = arg_47_1.actors_["1015ui_story"].transform
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.var_.moveOldPos1015ui_story = var_50_15.localPosition
			end

			local var_50_17 = 0.001

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Vector3.New(0.7, -1.15, -6.2)

				var_50_15.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1015ui_story, var_50_19, var_50_18)

				local var_50_20 = manager.ui.mainCamera.transform.position - var_50_15.position

				var_50_15.forward = Vector3.New(var_50_20.x, var_50_20.y, var_50_20.z)

				local var_50_21 = var_50_15.localEulerAngles

				var_50_21.z = 0
				var_50_21.x = 0
				var_50_15.localEulerAngles = var_50_21
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				var_50_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_50_22 = manager.ui.mainCamera.transform.position - var_50_15.position

				var_50_15.forward = Vector3.New(var_50_22.x, var_50_22.y, var_50_22.z)

				local var_50_23 = var_50_15.localEulerAngles

				var_50_23.z = 0
				var_50_23.x = 0
				var_50_15.localEulerAngles = var_50_23
			end

			local var_50_24 = arg_47_1.actors_["1015ui_story"]
			local var_50_25 = 0

			if var_50_25 < arg_47_1.time_ and arg_47_1.time_ <= var_50_25 + arg_50_0 and arg_47_1.var_.characterEffect1015ui_story == nil then
				arg_47_1.var_.characterEffect1015ui_story = var_50_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_26 = 0.200000002980232

			if var_50_25 <= arg_47_1.time_ and arg_47_1.time_ < var_50_25 + var_50_26 then
				local var_50_27 = (arg_47_1.time_ - var_50_25) / var_50_26

				if arg_47_1.var_.characterEffect1015ui_story then
					local var_50_28 = Mathf.Lerp(0, 0.5, var_50_27)

					arg_47_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1015ui_story.fillRatio = var_50_28
				end
			end

			if arg_47_1.time_ >= var_50_25 + var_50_26 and arg_47_1.time_ < var_50_25 + var_50_26 + arg_50_0 and arg_47_1.var_.characterEffect1015ui_story then
				local var_50_29 = 0.5

				arg_47_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1015ui_story.fillRatio = var_50_29
			end

			local var_50_30 = 0
			local var_50_31 = 0.6

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_32 = arg_47_1:FormatText(StoryNameCfg[73].name)

				arg_47_1.leftNameTxt_.text = var_50_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_33 = arg_47_1:GetWordFromCfg(317102012)
				local var_50_34 = arg_47_1:FormatText(var_50_33.content)

				arg_47_1.text_.text = var_50_34

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_35 = 24
				local var_50_36 = utf8.len(var_50_34)
				local var_50_37 = var_50_35 <= 0 and var_50_31 or var_50_31 * (var_50_36 / var_50_35)

				if var_50_37 > 0 and var_50_31 < var_50_37 then
					arg_47_1.talkMaxDuration = var_50_37

					if var_50_37 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_37 + var_50_30
					end
				end

				arg_47_1.text_.text = var_50_34
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102012", "story_v_out_317102.awb") ~= 0 then
					local var_50_38 = manager.audio:GetVoiceLength("story_v_out_317102", "317102012", "story_v_out_317102.awb") / 1000

					if var_50_38 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_38 + var_50_30
					end

					if var_50_33.prefab_name ~= "" and arg_47_1.actors_[var_50_33.prefab_name] ~= nil then
						local var_50_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_33.prefab_name].transform, "story_v_out_317102", "317102012", "story_v_out_317102.awb")

						arg_47_1:RecordAudio("317102012", var_50_39)
						arg_47_1:RecordAudio("317102012", var_50_39)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_317102", "317102012", "story_v_out_317102.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_317102", "317102012", "story_v_out_317102.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_40 = math.max(var_50_31, arg_47_1.talkMaxDuration)

			if var_50_30 <= arg_47_1.time_ and arg_47_1.time_ < var_50_30 + var_50_40 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_30) / var_50_40

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_30 + var_50_40 and arg_47_1.time_ < var_50_30 + var_50_40 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play317102013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317102013
		arg_51_1.duration_ = 5.5

		local var_51_0 = {
			zh = 2.9,
			ja = 5.5
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
				arg_51_0:Play317102014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1093ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1093ui_story == nil then
				arg_51_1.var_.characterEffect1093ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1093ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1093ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1093ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1093ui_story.fillRatio = var_54_5
			end

			local var_54_6 = arg_51_1.actors_["1015ui_story"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.characterEffect1015ui_story == nil then
				arg_51_1.var_.characterEffect1015ui_story = var_54_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_8 = 0.200000002980232

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.characterEffect1015ui_story then
					arg_51_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.characterEffect1015ui_story then
				arg_51_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_54_10 = 0
			local var_54_11 = 0.3

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[479].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(317102013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 12
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102013", "story_v_out_317102.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102013", "story_v_out_317102.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_317102", "317102013", "story_v_out_317102.awb")

						arg_51_1:RecordAudio("317102013", var_54_19)
						arg_51_1:RecordAudio("317102013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_317102", "317102013", "story_v_out_317102.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_317102", "317102013", "story_v_out_317102.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317102014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317102014
		arg_55_1.duration_ = 7.566

		local var_55_0 = {
			zh = 6.366,
			ja = 7.566
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
				arg_55_0:Play317102015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.7

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[479].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(317102014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102014", "story_v_out_317102.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102014", "story_v_out_317102.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_317102", "317102014", "story_v_out_317102.awb")

						arg_55_1:RecordAudio("317102014", var_58_9)
						arg_55_1:RecordAudio("317102014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317102", "317102014", "story_v_out_317102.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317102", "317102014", "story_v_out_317102.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play317102015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317102015
		arg_59_1.duration_ = 1.999999999999

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play317102016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1093ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1093ui_story == nil then
				arg_59_1.var_.characterEffect1093ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1093ui_story then
					arg_59_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1093ui_story then
				arg_59_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["1015ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story == nil then
				arg_59_1.var_.characterEffect1015ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.200000002980232

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1015ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1015ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1015ui_story.fillRatio = var_62_9
			end

			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_62_11 = 0
			local var_62_12 = 0.15

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_13 = arg_59_1:FormatText(StoryNameCfg[73].name)

				arg_59_1.leftNameTxt_.text = var_62_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_14 = arg_59_1:GetWordFromCfg(317102015)
				local var_62_15 = arg_59_1:FormatText(var_62_14.content)

				arg_59_1.text_.text = var_62_15

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_16 = 6
				local var_62_17 = utf8.len(var_62_15)
				local var_62_18 = var_62_16 <= 0 and var_62_12 or var_62_12 * (var_62_17 / var_62_16)

				if var_62_18 > 0 and var_62_12 < var_62_18 then
					arg_59_1.talkMaxDuration = var_62_18

					if var_62_18 + var_62_11 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_18 + var_62_11
					end
				end

				arg_59_1.text_.text = var_62_15
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102015", "story_v_out_317102.awb") ~= 0 then
					local var_62_19 = manager.audio:GetVoiceLength("story_v_out_317102", "317102015", "story_v_out_317102.awb") / 1000

					if var_62_19 + var_62_11 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_11
					end

					if var_62_14.prefab_name ~= "" and arg_59_1.actors_[var_62_14.prefab_name] ~= nil then
						local var_62_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_14.prefab_name].transform, "story_v_out_317102", "317102015", "story_v_out_317102.awb")

						arg_59_1:RecordAudio("317102015", var_62_20)
						arg_59_1:RecordAudio("317102015", var_62_20)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_317102", "317102015", "story_v_out_317102.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_317102", "317102015", "story_v_out_317102.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_21 = math.max(var_62_12, arg_59_1.talkMaxDuration)

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_21 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_11) / var_62_21

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_11 + var_62_21 and arg_59_1.time_ < var_62_11 + var_62_21 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play317102016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317102016
		arg_63_1.duration_ = 14.2

		local var_63_0 = {
			zh = 12.5,
			ja = 14.2
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
				arg_63_0:Play317102017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1093ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1093ui_story == nil then
				arg_63_1.var_.characterEffect1093ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

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

			local var_66_6 = arg_63_1.actors_["1015ui_story"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect1015ui_story == nil then
				arg_63_1.var_.characterEffect1015ui_story = var_66_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_8 = 0.200000002980232

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.characterEffect1015ui_story then
					arg_63_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.characterEffect1015ui_story then
				arg_63_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_66_11 = 0
			local var_66_12 = 1.425

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_13 = arg_63_1:FormatText(StoryNameCfg[479].name)

				arg_63_1.leftNameTxt_.text = var_66_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_14 = arg_63_1:GetWordFromCfg(317102016)
				local var_66_15 = arg_63_1:FormatText(var_66_14.content)

				arg_63_1.text_.text = var_66_15

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_16 = 57
				local var_66_17 = utf8.len(var_66_15)
				local var_66_18 = var_66_16 <= 0 and var_66_12 or var_66_12 * (var_66_17 / var_66_16)

				if var_66_18 > 0 and var_66_12 < var_66_18 then
					arg_63_1.talkMaxDuration = var_66_18

					if var_66_18 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_11
					end
				end

				arg_63_1.text_.text = var_66_15
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102016", "story_v_out_317102.awb") ~= 0 then
					local var_66_19 = manager.audio:GetVoiceLength("story_v_out_317102", "317102016", "story_v_out_317102.awb") / 1000

					if var_66_19 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_11
					end

					if var_66_14.prefab_name ~= "" and arg_63_1.actors_[var_66_14.prefab_name] ~= nil then
						local var_66_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_14.prefab_name].transform, "story_v_out_317102", "317102016", "story_v_out_317102.awb")

						arg_63_1:RecordAudio("317102016", var_66_20)
						arg_63_1:RecordAudio("317102016", var_66_20)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317102", "317102016", "story_v_out_317102.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317102", "317102016", "story_v_out_317102.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_21 = math.max(var_66_12, arg_63_1.talkMaxDuration)

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_21 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_11) / var_66_21

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_11 + var_66_21 and arg_63_1.time_ < var_66_11 + var_66_21 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play317102017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317102017
		arg_67_1.duration_ = 4.4

		local var_67_0 = {
			zh = 3.066,
			ja = 4.4
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
				arg_67_0:Play317102018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1093ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1093ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1093ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1093ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1093ui_story == nil then
				arg_67_1.var_.characterEffect1093ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1093ui_story then
					arg_67_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1093ui_story then
				arg_67_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_15 = arg_67_1.actors_["1015ui_story"].transform
			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.var_.moveOldPos1015ui_story = var_70_15.localPosition
			end

			local var_70_17 = 0.001

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Vector3.New(0.7, -1.15, -6.2)

				var_70_15.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1015ui_story, var_70_19, var_70_18)

				local var_70_20 = manager.ui.mainCamera.transform.position - var_70_15.position

				var_70_15.forward = Vector3.New(var_70_20.x, var_70_20.y, var_70_20.z)

				local var_70_21 = var_70_15.localEulerAngles

				var_70_21.z = 0
				var_70_21.x = 0
				var_70_15.localEulerAngles = var_70_21
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				var_70_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_70_22 = manager.ui.mainCamera.transform.position - var_70_15.position

				var_70_15.forward = Vector3.New(var_70_22.x, var_70_22.y, var_70_22.z)

				local var_70_23 = var_70_15.localEulerAngles

				var_70_23.z = 0
				var_70_23.x = 0
				var_70_15.localEulerAngles = var_70_23
			end

			local var_70_24 = arg_67_1.actors_["1015ui_story"]
			local var_70_25 = 0

			if var_70_25 < arg_67_1.time_ and arg_67_1.time_ <= var_70_25 + arg_70_0 and arg_67_1.var_.characterEffect1015ui_story == nil then
				arg_67_1.var_.characterEffect1015ui_story = var_70_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_26 = 0.200000002980232

			if var_70_25 <= arg_67_1.time_ and arg_67_1.time_ < var_70_25 + var_70_26 then
				local var_70_27 = (arg_67_1.time_ - var_70_25) / var_70_26

				if arg_67_1.var_.characterEffect1015ui_story then
					local var_70_28 = Mathf.Lerp(0, 0.5, var_70_27)

					arg_67_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1015ui_story.fillRatio = var_70_28
				end
			end

			if arg_67_1.time_ >= var_70_25 + var_70_26 and arg_67_1.time_ < var_70_25 + var_70_26 + arg_70_0 and arg_67_1.var_.characterEffect1015ui_story then
				local var_70_29 = 0.5

				arg_67_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1015ui_story.fillRatio = var_70_29
			end

			local var_70_30 = 0
			local var_70_31 = 0.25

			if var_70_30 < arg_67_1.time_ and arg_67_1.time_ <= var_70_30 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_32 = arg_67_1:FormatText(StoryNameCfg[73].name)

				arg_67_1.leftNameTxt_.text = var_70_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_33 = arg_67_1:GetWordFromCfg(317102017)
				local var_70_34 = arg_67_1:FormatText(var_70_33.content)

				arg_67_1.text_.text = var_70_34

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_35 = 10
				local var_70_36 = utf8.len(var_70_34)
				local var_70_37 = var_70_35 <= 0 and var_70_31 or var_70_31 * (var_70_36 / var_70_35)

				if var_70_37 > 0 and var_70_31 < var_70_37 then
					arg_67_1.talkMaxDuration = var_70_37

					if var_70_37 + var_70_30 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_37 + var_70_30
					end
				end

				arg_67_1.text_.text = var_70_34
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102017", "story_v_out_317102.awb") ~= 0 then
					local var_70_38 = manager.audio:GetVoiceLength("story_v_out_317102", "317102017", "story_v_out_317102.awb") / 1000

					if var_70_38 + var_70_30 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_38 + var_70_30
					end

					if var_70_33.prefab_name ~= "" and arg_67_1.actors_[var_70_33.prefab_name] ~= nil then
						local var_70_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_33.prefab_name].transform, "story_v_out_317102", "317102017", "story_v_out_317102.awb")

						arg_67_1:RecordAudio("317102017", var_70_39)
						arg_67_1:RecordAudio("317102017", var_70_39)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_317102", "317102017", "story_v_out_317102.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_317102", "317102017", "story_v_out_317102.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_40 = math.max(var_70_31, arg_67_1.talkMaxDuration)

			if var_70_30 <= arg_67_1.time_ and arg_67_1.time_ < var_70_30 + var_70_40 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_30) / var_70_40

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_30 + var_70_40 and arg_67_1.time_ < var_70_30 + var_70_40 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317102018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317102018
		arg_71_1.duration_ = 2.966

		local var_71_0 = {
			zh = 2.066,
			ja = 2.966
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
				arg_71_0:Play317102019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1093ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1093ui_story == nil then
				arg_71_1.var_.characterEffect1093ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1093ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1093ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1093ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1093ui_story.fillRatio = var_74_5
			end

			local var_74_6 = arg_71_1.actors_["1015ui_story"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 and arg_71_1.var_.characterEffect1015ui_story == nil then
				arg_71_1.var_.characterEffect1015ui_story = var_74_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_8 = 0.200000002980232

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8

				if arg_71_1.var_.characterEffect1015ui_story then
					arg_71_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect1015ui_story then
				arg_71_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_74_10 = 0
			local var_74_11 = 0.175

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_12 = arg_71_1:FormatText(StoryNameCfg[479].name)

				arg_71_1.leftNameTxt_.text = var_74_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_13 = arg_71_1:GetWordFromCfg(317102018)
				local var_74_14 = arg_71_1:FormatText(var_74_13.content)

				arg_71_1.text_.text = var_74_14

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_15 = 7
				local var_74_16 = utf8.len(var_74_14)
				local var_74_17 = var_74_15 <= 0 and var_74_11 or var_74_11 * (var_74_16 / var_74_15)

				if var_74_17 > 0 and var_74_11 < var_74_17 then
					arg_71_1.talkMaxDuration = var_74_17

					if var_74_17 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_17 + var_74_10
					end
				end

				arg_71_1.text_.text = var_74_14
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102018", "story_v_out_317102.awb") ~= 0 then
					local var_74_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102018", "story_v_out_317102.awb") / 1000

					if var_74_18 + var_74_10 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_10
					end

					if var_74_13.prefab_name ~= "" and arg_71_1.actors_[var_74_13.prefab_name] ~= nil then
						local var_74_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_13.prefab_name].transform, "story_v_out_317102", "317102018", "story_v_out_317102.awb")

						arg_71_1:RecordAudio("317102018", var_74_19)
						arg_71_1:RecordAudio("317102018", var_74_19)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_317102", "317102018", "story_v_out_317102.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_317102", "317102018", "story_v_out_317102.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_20 = math.max(var_74_11, arg_71_1.talkMaxDuration)

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_20 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_10) / var_74_20

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_10 + var_74_20 and arg_71_1.time_ < var_74_10 + var_74_20 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317102019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317102019
		arg_75_1.duration_ = 18.233

		local var_75_0 = {
			zh = 18.233,
			ja = 13.4
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
				arg_75_0:Play317102020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 2.225

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[479].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(317102019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 89
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102019", "story_v_out_317102.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102019", "story_v_out_317102.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_317102", "317102019", "story_v_out_317102.awb")

						arg_75_1:RecordAudio("317102019", var_78_9)
						arg_75_1:RecordAudio("317102019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317102", "317102019", "story_v_out_317102.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317102", "317102019", "story_v_out_317102.awb")
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
	Play317102020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317102020
		arg_79_1.duration_ = 6.433

		local var_79_0 = {
			zh = 5.233,
			ja = 6.433
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
				arg_79_0:Play317102021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1093ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story == nil then
				arg_79_1.var_.characterEffect1093ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1093ui_story then
					arg_79_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1093ui_story then
				arg_79_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1015ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect1015ui_story == nil then
				arg_79_1.var_.characterEffect1015ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.200000002980232

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect1015ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1015ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect1015ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1015ui_story.fillRatio = var_82_9
			end

			local var_82_10 = 0
			local var_82_11 = 0.6

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_12 = arg_79_1:FormatText(StoryNameCfg[73].name)

				arg_79_1.leftNameTxt_.text = var_82_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_13 = arg_79_1:GetWordFromCfg(317102020)
				local var_82_14 = arg_79_1:FormatText(var_82_13.content)

				arg_79_1.text_.text = var_82_14

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_15 = 24
				local var_82_16 = utf8.len(var_82_14)
				local var_82_17 = var_82_15 <= 0 and var_82_11 or var_82_11 * (var_82_16 / var_82_15)

				if var_82_17 > 0 and var_82_11 < var_82_17 then
					arg_79_1.talkMaxDuration = var_82_17

					if var_82_17 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_17 + var_82_10
					end
				end

				arg_79_1.text_.text = var_82_14
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102020", "story_v_out_317102.awb") ~= 0 then
					local var_82_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102020", "story_v_out_317102.awb") / 1000

					if var_82_18 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_18 + var_82_10
					end

					if var_82_13.prefab_name ~= "" and arg_79_1.actors_[var_82_13.prefab_name] ~= nil then
						local var_82_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_13.prefab_name].transform, "story_v_out_317102", "317102020", "story_v_out_317102.awb")

						arg_79_1:RecordAudio("317102020", var_82_19)
						arg_79_1:RecordAudio("317102020", var_82_19)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_317102", "317102020", "story_v_out_317102.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_317102", "317102020", "story_v_out_317102.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_20 = math.max(var_82_11, arg_79_1.talkMaxDuration)

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_20 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_10) / var_82_20

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_10 + var_82_20 and arg_79_1.time_ < var_82_10 + var_82_20 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317102021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317102021
		arg_83_1.duration_ = 15.033

		local var_83_0 = {
			zh = 14.466,
			ja = 15.033
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
				arg_83_0:Play317102022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1093ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1093ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1093ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1093ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story == nil then
				arg_83_1.var_.characterEffect1093ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1093ui_story then
					local var_86_13 = Mathf.Lerp(0, 0.5, var_86_12)

					arg_83_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1093ui_story.fillRatio = var_86_13
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story then
				local var_86_14 = 0.5

				arg_83_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1093ui_story.fillRatio = var_86_14
			end

			local var_86_15 = arg_83_1.actors_["1015ui_story"].transform
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.var_.moveOldPos1015ui_story = var_86_15.localPosition
			end

			local var_86_17 = 0.001

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17
				local var_86_19 = Vector3.New(0.7, -1.15, -6.2)

				var_86_15.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1015ui_story, var_86_19, var_86_18)

				local var_86_20 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_20.x, var_86_20.y, var_86_20.z)

				local var_86_21 = var_86_15.localEulerAngles

				var_86_21.z = 0
				var_86_21.x = 0
				var_86_15.localEulerAngles = var_86_21
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				var_86_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_86_22 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_22.x, var_86_22.y, var_86_22.z)

				local var_86_23 = var_86_15.localEulerAngles

				var_86_23.z = 0
				var_86_23.x = 0
				var_86_15.localEulerAngles = var_86_23
			end

			local var_86_24 = arg_83_1.actors_["1015ui_story"]
			local var_86_25 = 0

			if var_86_25 < arg_83_1.time_ and arg_83_1.time_ <= var_86_25 + arg_86_0 and arg_83_1.var_.characterEffect1015ui_story == nil then
				arg_83_1.var_.characterEffect1015ui_story = var_86_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_26 = 0.200000002980232

			if var_86_25 <= arg_83_1.time_ and arg_83_1.time_ < var_86_25 + var_86_26 then
				local var_86_27 = (arg_83_1.time_ - var_86_25) / var_86_26

				if arg_83_1.var_.characterEffect1015ui_story then
					arg_83_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_25 + var_86_26 and arg_83_1.time_ < var_86_25 + var_86_26 + arg_86_0 and arg_83_1.var_.characterEffect1015ui_story then
				arg_83_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_86_28 = 0

			if var_86_28 < arg_83_1.time_ and arg_83_1.time_ <= var_86_28 + arg_86_0 then
				arg_83_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_86_29 = 0

			if var_86_29 < arg_83_1.time_ and arg_83_1.time_ <= var_86_29 + arg_86_0 then
				arg_83_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_86_30 = 0
			local var_86_31 = 1.525

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_32 = arg_83_1:FormatText(StoryNameCfg[479].name)

				arg_83_1.leftNameTxt_.text = var_86_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_33 = arg_83_1:GetWordFromCfg(317102021)
				local var_86_34 = arg_83_1:FormatText(var_86_33.content)

				arg_83_1.text_.text = var_86_34

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_35 = 61
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102021", "story_v_out_317102.awb") ~= 0 then
					local var_86_38 = manager.audio:GetVoiceLength("story_v_out_317102", "317102021", "story_v_out_317102.awb") / 1000

					if var_86_38 + var_86_30 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_38 + var_86_30
					end

					if var_86_33.prefab_name ~= "" and arg_83_1.actors_[var_86_33.prefab_name] ~= nil then
						local var_86_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_33.prefab_name].transform, "story_v_out_317102", "317102021", "story_v_out_317102.awb")

						arg_83_1:RecordAudio("317102021", var_86_39)
						arg_83_1:RecordAudio("317102021", var_86_39)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317102", "317102021", "story_v_out_317102.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317102", "317102021", "story_v_out_317102.awb")
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
	Play317102022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317102022
		arg_87_1.duration_ = 9.7

		local var_87_0 = {
			zh = 9.7,
			ja = 8.933
		}
		local var_87_1 = manager.audio:GetLocalizationFlag()

		if var_87_0[var_87_1] ~= nil then
			arg_87_1.duration_ = var_87_0[var_87_1]
		end

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play317102023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_1 = 0
			local var_90_2 = 1.1

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_3 = arg_87_1:FormatText(StoryNameCfg[479].name)

				arg_87_1.leftNameTxt_.text = var_90_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_4 = arg_87_1:GetWordFromCfg(317102022)
				local var_90_5 = arg_87_1:FormatText(var_90_4.content)

				arg_87_1.text_.text = var_90_5

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_6 = 44
				local var_90_7 = utf8.len(var_90_5)
				local var_90_8 = var_90_6 <= 0 and var_90_2 or var_90_2 * (var_90_7 / var_90_6)

				if var_90_8 > 0 and var_90_2 < var_90_8 then
					arg_87_1.talkMaxDuration = var_90_8

					if var_90_8 + var_90_1 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_1
					end
				end

				arg_87_1.text_.text = var_90_5
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102022", "story_v_out_317102.awb") ~= 0 then
					local var_90_9 = manager.audio:GetVoiceLength("story_v_out_317102", "317102022", "story_v_out_317102.awb") / 1000

					if var_90_9 + var_90_1 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_9 + var_90_1
					end

					if var_90_4.prefab_name ~= "" and arg_87_1.actors_[var_90_4.prefab_name] ~= nil then
						local var_90_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_4.prefab_name].transform, "story_v_out_317102", "317102022", "story_v_out_317102.awb")

						arg_87_1:RecordAudio("317102022", var_90_10)
						arg_87_1:RecordAudio("317102022", var_90_10)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_317102", "317102022", "story_v_out_317102.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_317102", "317102022", "story_v_out_317102.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_11 = math.max(var_90_2, arg_87_1.talkMaxDuration)

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_11 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_1) / var_90_11

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_1 + var_90_11 and arg_87_1.time_ < var_90_1 + var_90_11 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play317102023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 317102023
		arg_91_1.duration_ = 13.6

		local var_91_0 = {
			zh = 13.6,
			ja = 12.3
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
				arg_91_0:Play317102024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1.625

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[479].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(317102023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 65
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102023", "story_v_out_317102.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102023", "story_v_out_317102.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_317102", "317102023", "story_v_out_317102.awb")

						arg_91_1:RecordAudio("317102023", var_94_9)
						arg_91_1:RecordAudio("317102023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_317102", "317102023", "story_v_out_317102.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_317102", "317102023", "story_v_out_317102.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play317102024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 317102024
		arg_95_1.duration_ = 7.933

		local var_95_0 = {
			zh = 5.9,
			ja = 7.933
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
				arg_95_0:Play317102025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_2")
			end

			local var_98_1 = arg_95_1.actors_["1093ui_story"]
			local var_98_2 = 0

			if var_98_2 < arg_95_1.time_ and arg_95_1.time_ <= var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1093ui_story == nil then
				arg_95_1.var_.characterEffect1093ui_story = var_98_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_3 = 0.200000002980232

			if var_98_2 <= arg_95_1.time_ and arg_95_1.time_ < var_98_2 + var_98_3 then
				local var_98_4 = (arg_95_1.time_ - var_98_2) / var_98_3

				if arg_95_1.var_.characterEffect1093ui_story then
					arg_95_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_2 + var_98_3 and arg_95_1.time_ < var_98_2 + var_98_3 + arg_98_0 and arg_95_1.var_.characterEffect1093ui_story then
				arg_95_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_98_5 = arg_95_1.actors_["1015ui_story"]
			local var_98_6 = 0

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect1015ui_story == nil then
				arg_95_1.var_.characterEffect1015ui_story = var_98_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_7 = 0.200000002980232

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_7 then
				local var_98_8 = (arg_95_1.time_ - var_98_6) / var_98_7

				if arg_95_1.var_.characterEffect1015ui_story then
					local var_98_9 = Mathf.Lerp(0, 0.5, var_98_8)

					arg_95_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1015ui_story.fillRatio = var_98_9
				end
			end

			if arg_95_1.time_ >= var_98_6 + var_98_7 and arg_95_1.time_ < var_98_6 + var_98_7 + arg_98_0 and arg_95_1.var_.characterEffect1015ui_story then
				local var_98_10 = 0.5

				arg_95_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1015ui_story.fillRatio = var_98_10
			end

			local var_98_11 = 0
			local var_98_12 = 0.625

			if var_98_11 < arg_95_1.time_ and arg_95_1.time_ <= var_98_11 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_13 = arg_95_1:FormatText(StoryNameCfg[73].name)

				arg_95_1.leftNameTxt_.text = var_98_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_14 = arg_95_1:GetWordFromCfg(317102024)
				local var_98_15 = arg_95_1:FormatText(var_98_14.content)

				arg_95_1.text_.text = var_98_15

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_16 = 25
				local var_98_17 = utf8.len(var_98_15)
				local var_98_18 = var_98_16 <= 0 and var_98_12 or var_98_12 * (var_98_17 / var_98_16)

				if var_98_18 > 0 and var_98_12 < var_98_18 then
					arg_95_1.talkMaxDuration = var_98_18

					if var_98_18 + var_98_11 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_18 + var_98_11
					end
				end

				arg_95_1.text_.text = var_98_15
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102024", "story_v_out_317102.awb") ~= 0 then
					local var_98_19 = manager.audio:GetVoiceLength("story_v_out_317102", "317102024", "story_v_out_317102.awb") / 1000

					if var_98_19 + var_98_11 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_19 + var_98_11
					end

					if var_98_14.prefab_name ~= "" and arg_95_1.actors_[var_98_14.prefab_name] ~= nil then
						local var_98_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_14.prefab_name].transform, "story_v_out_317102", "317102024", "story_v_out_317102.awb")

						arg_95_1:RecordAudio("317102024", var_98_20)
						arg_95_1:RecordAudio("317102024", var_98_20)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_317102", "317102024", "story_v_out_317102.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_317102", "317102024", "story_v_out_317102.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_21 = math.max(var_98_12, arg_95_1.talkMaxDuration)

			if var_98_11 <= arg_95_1.time_ and arg_95_1.time_ < var_98_11 + var_98_21 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_11) / var_98_21

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_11 + var_98_21 and arg_95_1.time_ < var_98_11 + var_98_21 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play317102025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 317102025
		arg_99_1.duration_ = 3.066

		local var_99_0 = {
			zh = 3.066,
			ja = 2.6
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
				arg_99_0:Play317102026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1093ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1093ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1093ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1093ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1093ui_story == nil then
				arg_99_1.var_.characterEffect1093ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1093ui_story then
					local var_102_13 = Mathf.Lerp(0, 0.5, var_102_12)

					arg_99_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1093ui_story.fillRatio = var_102_13
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1093ui_story then
				local var_102_14 = 0.5

				arg_99_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1093ui_story.fillRatio = var_102_14
			end

			local var_102_15 = arg_99_1.actors_["1015ui_story"].transform
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1.var_.moveOldPos1015ui_story = var_102_15.localPosition
			end

			local var_102_17 = 0.001

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17
				local var_102_19 = Vector3.New(0.7, -1.15, -6.2)

				var_102_15.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1015ui_story, var_102_19, var_102_18)

				local var_102_20 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_20.x, var_102_20.y, var_102_20.z)

				local var_102_21 = var_102_15.localEulerAngles

				var_102_21.z = 0
				var_102_21.x = 0
				var_102_15.localEulerAngles = var_102_21
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 then
				var_102_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_102_22 = manager.ui.mainCamera.transform.position - var_102_15.position

				var_102_15.forward = Vector3.New(var_102_22.x, var_102_22.y, var_102_22.z)

				local var_102_23 = var_102_15.localEulerAngles

				var_102_23.z = 0
				var_102_23.x = 0
				var_102_15.localEulerAngles = var_102_23
			end

			local var_102_24 = arg_99_1.actors_["1015ui_story"]
			local var_102_25 = 0

			if var_102_25 < arg_99_1.time_ and arg_99_1.time_ <= var_102_25 + arg_102_0 and arg_99_1.var_.characterEffect1015ui_story == nil then
				arg_99_1.var_.characterEffect1015ui_story = var_102_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_26 = 0.200000002980232

			if var_102_25 <= arg_99_1.time_ and arg_99_1.time_ < var_102_25 + var_102_26 then
				local var_102_27 = (arg_99_1.time_ - var_102_25) / var_102_26

				if arg_99_1.var_.characterEffect1015ui_story then
					arg_99_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_25 + var_102_26 and arg_99_1.time_ < var_102_25 + var_102_26 + arg_102_0 and arg_99_1.var_.characterEffect1015ui_story then
				arg_99_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_102_28 = 0

			if var_102_28 < arg_99_1.time_ and arg_99_1.time_ <= var_102_28 + arg_102_0 then
				arg_99_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_102_29 = 0

			if var_102_29 < arg_99_1.time_ and arg_99_1.time_ <= var_102_29 + arg_102_0 then
				arg_99_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_30 = 0
			local var_102_31 = 0.35

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[479].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(317102025)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102025", "story_v_out_317102.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_out_317102", "317102025", "story_v_out_317102.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_out_317102", "317102025", "story_v_out_317102.awb")

						arg_99_1:RecordAudio("317102025", var_102_39)
						arg_99_1:RecordAudio("317102025", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_317102", "317102025", "story_v_out_317102.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_317102", "317102025", "story_v_out_317102.awb")
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
	Play317102026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 317102026
		arg_103_1.duration_ = 14.7

		local var_103_0 = {
			zh = 12.166,
			ja = 14.7
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
				arg_103_0:Play317102027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1.375

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[479].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(317102026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 55
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102026", "story_v_out_317102.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102026", "story_v_out_317102.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_317102", "317102026", "story_v_out_317102.awb")

						arg_103_1:RecordAudio("317102026", var_106_9)
						arg_103_1:RecordAudio("317102026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_317102", "317102026", "story_v_out_317102.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_317102", "317102026", "story_v_out_317102.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play317102027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 317102027
		arg_107_1.duration_ = 17.3

		local var_107_0 = {
			zh = 17.3,
			ja = 14.6
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
				arg_107_0:Play317102028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1.75

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[479].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(317102027)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 70
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102027", "story_v_out_317102.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102027", "story_v_out_317102.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_317102", "317102027", "story_v_out_317102.awb")

						arg_107_1:RecordAudio("317102027", var_110_9)
						arg_107_1:RecordAudio("317102027", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_317102", "317102027", "story_v_out_317102.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_317102", "317102027", "story_v_out_317102.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play317102028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 317102028
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play317102029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1015ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1015ui_story == nil then
				arg_111_1.var_.characterEffect1015ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1015ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1015ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1015ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1015ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.925

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(317102028)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 37
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_7 or var_114_7 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_7 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_13 and arg_111_1.time_ < var_114_6 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play317102029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 317102029
		arg_115_1.duration_ = 5.2

		local var_115_0 = {
			zh = 3.133,
			ja = 5.2
		}
		local var_115_1 = manager.audio:GetLocalizationFlag()

		if var_115_0[var_115_1] ~= nil then
			arg_115_1.duration_ = var_115_0[var_115_1]
		end

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play317102030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1093ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1093ui_story == nil then
				arg_115_1.var_.characterEffect1093ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1093ui_story then
					arg_115_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1093ui_story then
				arg_115_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_118_4 = 0

			if var_118_4 < arg_115_1.time_ and arg_115_1.time_ <= var_118_4 + arg_118_0 then
				arg_115_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 then
				arg_115_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_118_6 = 0
			local var_118_7 = 0.3

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[73].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(317102029)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 12
				local var_118_12 = utf8.len(var_118_10)
				local var_118_13 = var_118_11 <= 0 and var_118_7 or var_118_7 * (var_118_12 / var_118_11)

				if var_118_13 > 0 and var_118_7 < var_118_13 then
					arg_115_1.talkMaxDuration = var_118_13

					if var_118_13 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_13 + var_118_6
					end
				end

				arg_115_1.text_.text = var_118_10
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102029", "story_v_out_317102.awb") ~= 0 then
					local var_118_14 = manager.audio:GetVoiceLength("story_v_out_317102", "317102029", "story_v_out_317102.awb") / 1000

					if var_118_14 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_14 + var_118_6
					end

					if var_118_9.prefab_name ~= "" and arg_115_1.actors_[var_118_9.prefab_name] ~= nil then
						local var_118_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_9.prefab_name].transform, "story_v_out_317102", "317102029", "story_v_out_317102.awb")

						arg_115_1:RecordAudio("317102029", var_118_15)
						arg_115_1:RecordAudio("317102029", var_118_15)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_317102", "317102029", "story_v_out_317102.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_317102", "317102029", "story_v_out_317102.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_16 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_16 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_16

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_16 and arg_115_1.time_ < var_118_6 + var_118_16 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play317102030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 317102030
		arg_119_1.duration_ = 3.766

		local var_119_0 = {
			zh = 3.766,
			ja = 3
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
				arg_119_0:Play317102031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1093ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1093ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, 100, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1093ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, 100, 0)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1093ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1093ui_story == nil then
				arg_119_1.var_.characterEffect1093ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1093ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1093ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1093ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1093ui_story.fillRatio = var_122_14
			end

			local var_122_15 = arg_119_1.actors_["1015ui_story"].transform
			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.var_.moveOldPos1015ui_story = var_122_15.localPosition
			end

			local var_122_17 = 0.001

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Vector3.New(0, 100, 0)

				var_122_15.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1015ui_story, var_122_19, var_122_18)

				local var_122_20 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_20.x, var_122_20.y, var_122_20.z)

				local var_122_21 = var_122_15.localEulerAngles

				var_122_21.z = 0
				var_122_21.x = 0
				var_122_15.localEulerAngles = var_122_21
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 then
				var_122_15.localPosition = Vector3.New(0, 100, 0)

				local var_122_22 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_22.x, var_122_22.y, var_122_22.z)

				local var_122_23 = var_122_15.localEulerAngles

				var_122_23.z = 0
				var_122_23.x = 0
				var_122_15.localEulerAngles = var_122_23
			end

			local var_122_24 = arg_119_1.actors_["1015ui_story"]
			local var_122_25 = 0

			if var_122_25 < arg_119_1.time_ and arg_119_1.time_ <= var_122_25 + arg_122_0 and arg_119_1.var_.characterEffect1015ui_story == nil then
				arg_119_1.var_.characterEffect1015ui_story = var_122_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_26 = 0.200000002980232

			if var_122_25 <= arg_119_1.time_ and arg_119_1.time_ < var_122_25 + var_122_26 then
				local var_122_27 = (arg_119_1.time_ - var_122_25) / var_122_26

				if arg_119_1.var_.characterEffect1015ui_story then
					local var_122_28 = Mathf.Lerp(0, 0.5, var_122_27)

					arg_119_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1015ui_story.fillRatio = var_122_28
				end
			end

			if arg_119_1.time_ >= var_122_25 + var_122_26 and arg_119_1.time_ < var_122_25 + var_122_26 + arg_122_0 and arg_119_1.var_.characterEffect1015ui_story then
				local var_122_29 = 0.5

				arg_119_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1015ui_story.fillRatio = var_122_29
			end

			local var_122_30 = "2078ui_story"

			if arg_119_1.actors_[var_122_30] == nil then
				local var_122_31 = Object.Instantiate(Asset.Load("Char/" .. var_122_30), arg_119_1.stage_.transform)

				var_122_31.name = var_122_30
				var_122_31.transform.localPosition = Vector3.New(0, 100, 0)
				arg_119_1.actors_[var_122_30] = var_122_31

				local var_122_32 = var_122_31:GetComponentInChildren(typeof(CharacterEffect))

				var_122_32.enabled = true

				local var_122_33 = GameObjectTools.GetOrAddComponent(var_122_31, typeof(DynamicBoneHelper))

				if var_122_33 then
					var_122_33:EnableDynamicBone(false)
				end

				arg_119_1:ShowWeapon(var_122_32.transform, false)

				arg_119_1.var_[var_122_30 .. "Animator"] = var_122_32.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_119_1.var_[var_122_30 .. "Animator"].applyRootMotion = true
				arg_119_1.var_[var_122_30 .. "LipSync"] = var_122_32.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_122_34 = arg_119_1.actors_["2078ui_story"].transform
			local var_122_35 = 0

			if var_122_35 < arg_119_1.time_ and arg_119_1.time_ <= var_122_35 + arg_122_0 then
				arg_119_1.var_.moveOldPos2078ui_story = var_122_34.localPosition
			end

			local var_122_36 = 0.001

			if var_122_35 <= arg_119_1.time_ and arg_119_1.time_ < var_122_35 + var_122_36 then
				local var_122_37 = (arg_119_1.time_ - var_122_35) / var_122_36
				local var_122_38 = Vector3.New(0, -1.28, -5.6)

				var_122_34.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos2078ui_story, var_122_38, var_122_37)

				local var_122_39 = manager.ui.mainCamera.transform.position - var_122_34.position

				var_122_34.forward = Vector3.New(var_122_39.x, var_122_39.y, var_122_39.z)

				local var_122_40 = var_122_34.localEulerAngles

				var_122_40.z = 0
				var_122_40.x = 0
				var_122_34.localEulerAngles = var_122_40
			end

			if arg_119_1.time_ >= var_122_35 + var_122_36 and arg_119_1.time_ < var_122_35 + var_122_36 + arg_122_0 then
				var_122_34.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_122_41 = manager.ui.mainCamera.transform.position - var_122_34.position

				var_122_34.forward = Vector3.New(var_122_41.x, var_122_41.y, var_122_41.z)

				local var_122_42 = var_122_34.localEulerAngles

				var_122_42.z = 0
				var_122_42.x = 0
				var_122_34.localEulerAngles = var_122_42
			end

			local var_122_43 = arg_119_1.actors_["2078ui_story"]
			local var_122_44 = 0

			if var_122_44 < arg_119_1.time_ and arg_119_1.time_ <= var_122_44 + arg_122_0 and arg_119_1.var_.characterEffect2078ui_story == nil then
				arg_119_1.var_.characterEffect2078ui_story = var_122_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_45 = 0.200000002980232

			if var_122_44 <= arg_119_1.time_ and arg_119_1.time_ < var_122_44 + var_122_45 then
				local var_122_46 = (arg_119_1.time_ - var_122_44) / var_122_45

				if arg_119_1.var_.characterEffect2078ui_story then
					arg_119_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_44 + var_122_45 and arg_119_1.time_ < var_122_44 + var_122_45 + arg_122_0 and arg_119_1.var_.characterEffect2078ui_story then
				arg_119_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_122_47 = 0

			if var_122_47 < arg_119_1.time_ and arg_119_1.time_ <= var_122_47 + arg_122_0 then
				arg_119_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_122_48 = 0

			if var_122_48 < arg_119_1.time_ and arg_119_1.time_ <= var_122_48 + arg_122_0 then
				arg_119_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_122_49 = 0
			local var_122_50 = 0.4

			if var_122_49 < arg_119_1.time_ and arg_119_1.time_ <= var_122_49 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_51 = arg_119_1:FormatText(StoryNameCfg[528].name)

				arg_119_1.leftNameTxt_.text = var_122_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_52 = arg_119_1:GetWordFromCfg(317102030)
				local var_122_53 = arg_119_1:FormatText(var_122_52.content)

				arg_119_1.text_.text = var_122_53

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_54 = 16
				local var_122_55 = utf8.len(var_122_53)
				local var_122_56 = var_122_54 <= 0 and var_122_50 or var_122_50 * (var_122_55 / var_122_54)

				if var_122_56 > 0 and var_122_50 < var_122_56 then
					arg_119_1.talkMaxDuration = var_122_56

					if var_122_56 + var_122_49 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_56 + var_122_49
					end
				end

				arg_119_1.text_.text = var_122_53
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102030", "story_v_out_317102.awb") ~= 0 then
					local var_122_57 = manager.audio:GetVoiceLength("story_v_out_317102", "317102030", "story_v_out_317102.awb") / 1000

					if var_122_57 + var_122_49 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_57 + var_122_49
					end

					if var_122_52.prefab_name ~= "" and arg_119_1.actors_[var_122_52.prefab_name] ~= nil then
						local var_122_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_52.prefab_name].transform, "story_v_out_317102", "317102030", "story_v_out_317102.awb")

						arg_119_1:RecordAudio("317102030", var_122_58)
						arg_119_1:RecordAudio("317102030", var_122_58)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_317102", "317102030", "story_v_out_317102.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_317102", "317102030", "story_v_out_317102.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_59 = math.max(var_122_50, arg_119_1.talkMaxDuration)

			if var_122_49 <= arg_119_1.time_ and arg_119_1.time_ < var_122_49 + var_122_59 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_49) / var_122_59

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_49 + var_122_59 and arg_119_1.time_ < var_122_49 + var_122_59 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play317102031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 317102031
		arg_123_1.duration_ = 11.433

		local var_123_0 = {
			zh = 7.933,
			ja = 11.433
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
				arg_123_0:Play317102032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1093ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1093ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1093ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1093ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1093ui_story == nil then
				arg_123_1.var_.characterEffect1093ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect1093ui_story then
					local var_126_13 = Mathf.Lerp(0, 0.5, var_126_12)

					arg_123_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1093ui_story.fillRatio = var_126_13
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1093ui_story then
				local var_126_14 = 0.5

				arg_123_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1093ui_story.fillRatio = var_126_14
			end

			local var_126_15 = arg_123_1.actors_["1015ui_story"].transform
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.var_.moveOldPos1015ui_story = var_126_15.localPosition
			end

			local var_126_17 = 0.001

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Vector3.New(0.7, -1.15, -6.2)

				var_126_15.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1015ui_story, var_126_19, var_126_18)

				local var_126_20 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_20.x, var_126_20.y, var_126_20.z)

				local var_126_21 = var_126_15.localEulerAngles

				var_126_21.z = 0
				var_126_21.x = 0
				var_126_15.localEulerAngles = var_126_21
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				var_126_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_126_22 = manager.ui.mainCamera.transform.position - var_126_15.position

				var_126_15.forward = Vector3.New(var_126_22.x, var_126_22.y, var_126_22.z)

				local var_126_23 = var_126_15.localEulerAngles

				var_126_23.z = 0
				var_126_23.x = 0
				var_126_15.localEulerAngles = var_126_23
			end

			local var_126_24 = arg_123_1.actors_["1015ui_story"]
			local var_126_25 = 0

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 and arg_123_1.var_.characterEffect1015ui_story == nil then
				arg_123_1.var_.characterEffect1015ui_story = var_126_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_26 = 0.200000002980232

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_26 then
				local var_126_27 = (arg_123_1.time_ - var_126_25) / var_126_26

				if arg_123_1.var_.characterEffect1015ui_story then
					arg_123_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_25 + var_126_26 and arg_123_1.time_ < var_126_25 + var_126_26 + arg_126_0 and arg_123_1.var_.characterEffect1015ui_story then
				arg_123_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_126_28 = 0

			if var_126_28 < arg_123_1.time_ and arg_123_1.time_ <= var_126_28 + arg_126_0 then
				arg_123_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_126_29 = 0

			if var_126_29 < arg_123_1.time_ and arg_123_1.time_ <= var_126_29 + arg_126_0 then
				arg_123_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_30 = arg_123_1.actors_["2078ui_story"].transform
			local var_126_31 = 0

			if var_126_31 < arg_123_1.time_ and arg_123_1.time_ <= var_126_31 + arg_126_0 then
				arg_123_1.var_.moveOldPos2078ui_story = var_126_30.localPosition
			end

			local var_126_32 = 0.001

			if var_126_31 <= arg_123_1.time_ and arg_123_1.time_ < var_126_31 + var_126_32 then
				local var_126_33 = (arg_123_1.time_ - var_126_31) / var_126_32
				local var_126_34 = Vector3.New(0, 100, 0)

				var_126_30.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos2078ui_story, var_126_34, var_126_33)

				local var_126_35 = manager.ui.mainCamera.transform.position - var_126_30.position

				var_126_30.forward = Vector3.New(var_126_35.x, var_126_35.y, var_126_35.z)

				local var_126_36 = var_126_30.localEulerAngles

				var_126_36.z = 0
				var_126_36.x = 0
				var_126_30.localEulerAngles = var_126_36
			end

			if arg_123_1.time_ >= var_126_31 + var_126_32 and arg_123_1.time_ < var_126_31 + var_126_32 + arg_126_0 then
				var_126_30.localPosition = Vector3.New(0, 100, 0)

				local var_126_37 = manager.ui.mainCamera.transform.position - var_126_30.position

				var_126_30.forward = Vector3.New(var_126_37.x, var_126_37.y, var_126_37.z)

				local var_126_38 = var_126_30.localEulerAngles

				var_126_38.z = 0
				var_126_38.x = 0
				var_126_30.localEulerAngles = var_126_38
			end

			local var_126_39 = arg_123_1.actors_["2078ui_story"]
			local var_126_40 = 0

			if var_126_40 < arg_123_1.time_ and arg_123_1.time_ <= var_126_40 + arg_126_0 and arg_123_1.var_.characterEffect2078ui_story == nil then
				arg_123_1.var_.characterEffect2078ui_story = var_126_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_41 = 0.200000002980232

			if var_126_40 <= arg_123_1.time_ and arg_123_1.time_ < var_126_40 + var_126_41 then
				local var_126_42 = (arg_123_1.time_ - var_126_40) / var_126_41

				if arg_123_1.var_.characterEffect2078ui_story then
					local var_126_43 = Mathf.Lerp(0, 0.5, var_126_42)

					arg_123_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_123_1.var_.characterEffect2078ui_story.fillRatio = var_126_43
				end
			end

			if arg_123_1.time_ >= var_126_40 + var_126_41 and arg_123_1.time_ < var_126_40 + var_126_41 + arg_126_0 and arg_123_1.var_.characterEffect2078ui_story then
				local var_126_44 = 0.5

				arg_123_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_123_1.var_.characterEffect2078ui_story.fillRatio = var_126_44
			end

			local var_126_45 = 0
			local var_126_46 = 0.975

			if var_126_45 < arg_123_1.time_ and arg_123_1.time_ <= var_126_45 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_47 = arg_123_1:FormatText(StoryNameCfg[479].name)

				arg_123_1.leftNameTxt_.text = var_126_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_48 = arg_123_1:GetWordFromCfg(317102031)
				local var_126_49 = arg_123_1:FormatText(var_126_48.content)

				arg_123_1.text_.text = var_126_49

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_50 = 39
				local var_126_51 = utf8.len(var_126_49)
				local var_126_52 = var_126_50 <= 0 and var_126_46 or var_126_46 * (var_126_51 / var_126_50)

				if var_126_52 > 0 and var_126_46 < var_126_52 then
					arg_123_1.talkMaxDuration = var_126_52

					if var_126_52 + var_126_45 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_52 + var_126_45
					end
				end

				arg_123_1.text_.text = var_126_49
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102031", "story_v_out_317102.awb") ~= 0 then
					local var_126_53 = manager.audio:GetVoiceLength("story_v_out_317102", "317102031", "story_v_out_317102.awb") / 1000

					if var_126_53 + var_126_45 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_53 + var_126_45
					end

					if var_126_48.prefab_name ~= "" and arg_123_1.actors_[var_126_48.prefab_name] ~= nil then
						local var_126_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_48.prefab_name].transform, "story_v_out_317102", "317102031", "story_v_out_317102.awb")

						arg_123_1:RecordAudio("317102031", var_126_54)
						arg_123_1:RecordAudio("317102031", var_126_54)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_317102", "317102031", "story_v_out_317102.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_317102", "317102031", "story_v_out_317102.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_55 = math.max(var_126_46, arg_123_1.talkMaxDuration)

			if var_126_45 <= arg_123_1.time_ and arg_123_1.time_ < var_126_45 + var_126_55 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_45) / var_126_55

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_45 + var_126_55 and arg_123_1.time_ < var_126_45 + var_126_55 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play317102032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 317102032
		arg_127_1.duration_ = 9.433

		local var_127_0 = {
			zh = 7.733,
			ja = 9.433
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
				arg_127_0:Play317102033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1093ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1093ui_story == nil then
				arg_127_1.var_.characterEffect1093ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1093ui_story then
					arg_127_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1093ui_story then
				arg_127_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["1015ui_story"]
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story == nil then
				arg_127_1.var_.characterEffect1015ui_story = var_130_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_6 = 0.200000002980232

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6

				if arg_127_1.var_.characterEffect1015ui_story then
					local var_130_8 = Mathf.Lerp(0, 0.5, var_130_7)

					arg_127_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1015ui_story.fillRatio = var_130_8
				end
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story then
				local var_130_9 = 0.5

				arg_127_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1015ui_story.fillRatio = var_130_9
			end

			local var_130_10 = 0
			local var_130_11 = 1.025

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_12 = arg_127_1:FormatText(StoryNameCfg[73].name)

				arg_127_1.leftNameTxt_.text = var_130_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_13 = arg_127_1:GetWordFromCfg(317102032)
				local var_130_14 = arg_127_1:FormatText(var_130_13.content)

				arg_127_1.text_.text = var_130_14

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_15 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102032", "story_v_out_317102.awb") ~= 0 then
					local var_130_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102032", "story_v_out_317102.awb") / 1000

					if var_130_18 + var_130_10 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_10
					end

					if var_130_13.prefab_name ~= "" and arg_127_1.actors_[var_130_13.prefab_name] ~= nil then
						local var_130_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_13.prefab_name].transform, "story_v_out_317102", "317102032", "story_v_out_317102.awb")

						arg_127_1:RecordAudio("317102032", var_130_19)
						arg_127_1:RecordAudio("317102032", var_130_19)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_317102", "317102032", "story_v_out_317102.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_317102", "317102032", "story_v_out_317102.awb")
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
	Play317102033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 317102033
		arg_131_1.duration_ = 5.466

		local var_131_0 = {
			zh = 4.533,
			ja = 5.466
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
				arg_131_0:Play317102034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1093ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1093ui_story == nil then
				arg_131_1.var_.characterEffect1093ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1093ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1093ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1093ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1093ui_story.fillRatio = var_134_5
			end

			local var_134_6 = arg_131_1.actors_["1015ui_story"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 and arg_131_1.var_.characterEffect1015ui_story == nil then
				arg_131_1.var_.characterEffect1015ui_story = var_134_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_8 = 0.200000002980232

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_8 then
				local var_134_9 = (arg_131_1.time_ - var_134_7) / var_134_8

				if arg_131_1.var_.characterEffect1015ui_story then
					arg_131_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_8 and arg_131_1.time_ < var_134_7 + var_134_8 + arg_134_0 and arg_131_1.var_.characterEffect1015ui_story then
				arg_131_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_134_10 = 0
			local var_134_11 = 0.525

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_12 = arg_131_1:FormatText(StoryNameCfg[479].name)

				arg_131_1.leftNameTxt_.text = var_134_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_13 = arg_131_1:GetWordFromCfg(317102033)
				local var_134_14 = arg_131_1:FormatText(var_134_13.content)

				arg_131_1.text_.text = var_134_14

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_15 = 21
				local var_134_16 = utf8.len(var_134_14)
				local var_134_17 = var_134_15 <= 0 and var_134_11 or var_134_11 * (var_134_16 / var_134_15)

				if var_134_17 > 0 and var_134_11 < var_134_17 then
					arg_131_1.talkMaxDuration = var_134_17

					if var_134_17 + var_134_10 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_17 + var_134_10
					end
				end

				arg_131_1.text_.text = var_134_14
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102033", "story_v_out_317102.awb") ~= 0 then
					local var_134_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102033", "story_v_out_317102.awb") / 1000

					if var_134_18 + var_134_10 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_18 + var_134_10
					end

					if var_134_13.prefab_name ~= "" and arg_131_1.actors_[var_134_13.prefab_name] ~= nil then
						local var_134_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_13.prefab_name].transform, "story_v_out_317102", "317102033", "story_v_out_317102.awb")

						arg_131_1:RecordAudio("317102033", var_134_19)
						arg_131_1:RecordAudio("317102033", var_134_19)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_317102", "317102033", "story_v_out_317102.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_317102", "317102033", "story_v_out_317102.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_20 = math.max(var_134_11, arg_131_1.talkMaxDuration)

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_20 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_10) / var_134_20

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_10 + var_134_20 and arg_131_1.time_ < var_134_10 + var_134_20 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play317102034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 317102034
		arg_135_1.duration_ = 2.6

		local var_135_0 = {
			zh = 1.766,
			ja = 2.6
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
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play317102035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1093ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1093ui_story == nil then
				arg_135_1.var_.characterEffect1093ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1093ui_story then
					arg_135_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1093ui_story then
				arg_135_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_138_4 = arg_135_1.actors_["1015ui_story"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect1015ui_story == nil then
				arg_135_1.var_.characterEffect1015ui_story = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.200000002980232

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect1015ui_story then
					local var_138_8 = Mathf.Lerp(0, 0.5, var_138_7)

					arg_135_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1015ui_story.fillRatio = var_138_8
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1015ui_story then
				local var_138_9 = 0.5

				arg_135_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1015ui_story.fillRatio = var_138_9
			end

			local var_138_10 = 0
			local var_138_11 = 0.2

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_12 = arg_135_1:FormatText(StoryNameCfg[73].name)

				arg_135_1.leftNameTxt_.text = var_138_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_13 = arg_135_1:GetWordFromCfg(317102034)
				local var_138_14 = arg_135_1:FormatText(var_138_13.content)

				arg_135_1.text_.text = var_138_14

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_15 = 8
				local var_138_16 = utf8.len(var_138_14)
				local var_138_17 = var_138_15 <= 0 and var_138_11 or var_138_11 * (var_138_16 / var_138_15)

				if var_138_17 > 0 and var_138_11 < var_138_17 then
					arg_135_1.talkMaxDuration = var_138_17

					if var_138_17 + var_138_10 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_17 + var_138_10
					end
				end

				arg_135_1.text_.text = var_138_14
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102034", "story_v_out_317102.awb") ~= 0 then
					local var_138_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102034", "story_v_out_317102.awb") / 1000

					if var_138_18 + var_138_10 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_18 + var_138_10
					end

					if var_138_13.prefab_name ~= "" and arg_135_1.actors_[var_138_13.prefab_name] ~= nil then
						local var_138_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_13.prefab_name].transform, "story_v_out_317102", "317102034", "story_v_out_317102.awb")

						arg_135_1:RecordAudio("317102034", var_138_19)
						arg_135_1:RecordAudio("317102034", var_138_19)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_317102", "317102034", "story_v_out_317102.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_317102", "317102034", "story_v_out_317102.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_20 = math.max(var_138_11, arg_135_1.talkMaxDuration)

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_20 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_10) / var_138_20

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_10 + var_138_20 and arg_135_1.time_ < var_138_10 + var_138_20 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play317102035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 317102035
		arg_139_1.duration_ = 13.366

		local var_139_0 = {
			zh = 8.5,
			ja = 13.366
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
				arg_139_0:Play317102036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1093ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1093ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1093ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1093ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1093ui_story == nil then
				arg_139_1.var_.characterEffect1093ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1093ui_story then
					local var_142_13 = Mathf.Lerp(0, 0.5, var_142_12)

					arg_139_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1093ui_story.fillRatio = var_142_13
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1093ui_story then
				local var_142_14 = 0.5

				arg_139_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1093ui_story.fillRatio = var_142_14
			end

			local var_142_15 = arg_139_1.actors_["1015ui_story"].transform
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.var_.moveOldPos1015ui_story = var_142_15.localPosition
			end

			local var_142_17 = 0.001

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17
				local var_142_19 = Vector3.New(0.7, -1.15, -6.2)

				var_142_15.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1015ui_story, var_142_19, var_142_18)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_15.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_15.localEulerAngles = var_142_21
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 then
				var_142_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_142_22 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_22.x, var_142_22.y, var_142_22.z)

				local var_142_23 = var_142_15.localEulerAngles

				var_142_23.z = 0
				var_142_23.x = 0
				var_142_15.localEulerAngles = var_142_23
			end

			local var_142_24 = arg_139_1.actors_["1015ui_story"]
			local var_142_25 = 0

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 and arg_139_1.var_.characterEffect1015ui_story == nil then
				arg_139_1.var_.characterEffect1015ui_story = var_142_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_26 = 0.200000002980232

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_26 then
				local var_142_27 = (arg_139_1.time_ - var_142_25) / var_142_26

				if arg_139_1.var_.characterEffect1015ui_story then
					arg_139_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_25 + var_142_26 and arg_139_1.time_ < var_142_25 + var_142_26 + arg_142_0 and arg_139_1.var_.characterEffect1015ui_story then
				arg_139_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_142_28 = 0

			if var_142_28 < arg_139_1.time_ and arg_139_1.time_ <= var_142_28 + arg_142_0 then
				arg_139_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_142_29 = 0

			if var_142_29 < arg_139_1.time_ and arg_139_1.time_ <= var_142_29 + arg_142_0 then
				arg_139_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_142_30 = 0
			local var_142_31 = 1.1

			if var_142_30 < arg_139_1.time_ and arg_139_1.time_ <= var_142_30 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_32 = arg_139_1:FormatText(StoryNameCfg[479].name)

				arg_139_1.leftNameTxt_.text = var_142_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_33 = arg_139_1:GetWordFromCfg(317102035)
				local var_142_34 = arg_139_1:FormatText(var_142_33.content)

				arg_139_1.text_.text = var_142_34

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_35 = 44
				local var_142_36 = utf8.len(var_142_34)
				local var_142_37 = var_142_35 <= 0 and var_142_31 or var_142_31 * (var_142_36 / var_142_35)

				if var_142_37 > 0 and var_142_31 < var_142_37 then
					arg_139_1.talkMaxDuration = var_142_37

					if var_142_37 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_37 + var_142_30
					end
				end

				arg_139_1.text_.text = var_142_34
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102035", "story_v_out_317102.awb") ~= 0 then
					local var_142_38 = manager.audio:GetVoiceLength("story_v_out_317102", "317102035", "story_v_out_317102.awb") / 1000

					if var_142_38 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_38 + var_142_30
					end

					if var_142_33.prefab_name ~= "" and arg_139_1.actors_[var_142_33.prefab_name] ~= nil then
						local var_142_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_33.prefab_name].transform, "story_v_out_317102", "317102035", "story_v_out_317102.awb")

						arg_139_1:RecordAudio("317102035", var_142_39)
						arg_139_1:RecordAudio("317102035", var_142_39)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_317102", "317102035", "story_v_out_317102.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_317102", "317102035", "story_v_out_317102.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_40 = math.max(var_142_31, arg_139_1.talkMaxDuration)

			if var_142_30 <= arg_139_1.time_ and arg_139_1.time_ < var_142_30 + var_142_40 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_30) / var_142_40

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_30 + var_142_40 and arg_139_1.time_ < var_142_30 + var_142_40 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play317102036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 317102036
		arg_143_1.duration_ = 9.1

		local var_143_0 = {
			zh = 7.533,
			ja = 9.1
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
				arg_143_0:Play317102037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.85

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[479].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(317102036)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 34
				local var_146_6 = utf8.len(var_146_4)
				local var_146_7 = var_146_5 <= 0 and var_146_1 or var_146_1 * (var_146_6 / var_146_5)

				if var_146_7 > 0 and var_146_1 < var_146_7 then
					arg_143_1.talkMaxDuration = var_146_7

					if var_146_7 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_7 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_4
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102036", "story_v_out_317102.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102036", "story_v_out_317102.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_317102", "317102036", "story_v_out_317102.awb")

						arg_143_1:RecordAudio("317102036", var_146_9)
						arg_143_1:RecordAudio("317102036", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_317102", "317102036", "story_v_out_317102.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_317102", "317102036", "story_v_out_317102.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_10 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_10 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_10

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_10 and arg_143_1.time_ < var_146_0 + var_146_10 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play317102037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 317102037
		arg_147_1.duration_ = 12.6

		local var_147_0 = {
			zh = 6.266,
			ja = 12.6
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
				arg_147_0:Play317102038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.8

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[479].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(317102037)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 32
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102037", "story_v_out_317102.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102037", "story_v_out_317102.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_317102", "317102037", "story_v_out_317102.awb")

						arg_147_1:RecordAudio("317102037", var_150_9)
						arg_147_1:RecordAudio("317102037", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_317102", "317102037", "story_v_out_317102.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_317102", "317102037", "story_v_out_317102.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play317102038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 317102038
		arg_151_1.duration_ = 17.033

		local var_151_0 = {
			zh = 12.533,
			ja = 17.033
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
				arg_151_0:Play317102039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1093ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1093ui_story == nil then
				arg_151_1.var_.characterEffect1093ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1093ui_story then
					arg_151_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1093ui_story then
				arg_151_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1015ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1015ui_story == nil then
				arg_151_1.var_.characterEffect1015ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.200000002980232

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1015ui_story then
					local var_154_8 = Mathf.Lerp(0, 0.5, var_154_7)

					arg_151_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1015ui_story.fillRatio = var_154_8
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1015ui_story then
				local var_154_9 = 0.5

				arg_151_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1015ui_story.fillRatio = var_154_9
			end

			local var_154_10 = 0
			local var_154_11 = 1.25

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_12 = arg_151_1:FormatText(StoryNameCfg[73].name)

				arg_151_1.leftNameTxt_.text = var_154_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_13 = arg_151_1:GetWordFromCfg(317102038)
				local var_154_14 = arg_151_1:FormatText(var_154_13.content)

				arg_151_1.text_.text = var_154_14

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_15 = 50
				local var_154_16 = utf8.len(var_154_14)
				local var_154_17 = var_154_15 <= 0 and var_154_11 or var_154_11 * (var_154_16 / var_154_15)

				if var_154_17 > 0 and var_154_11 < var_154_17 then
					arg_151_1.talkMaxDuration = var_154_17

					if var_154_17 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_17 + var_154_10
					end
				end

				arg_151_1.text_.text = var_154_14
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102038", "story_v_out_317102.awb") ~= 0 then
					local var_154_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102038", "story_v_out_317102.awb") / 1000

					if var_154_18 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_10
					end

					if var_154_13.prefab_name ~= "" and arg_151_1.actors_[var_154_13.prefab_name] ~= nil then
						local var_154_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_13.prefab_name].transform, "story_v_out_317102", "317102038", "story_v_out_317102.awb")

						arg_151_1:RecordAudio("317102038", var_154_19)
						arg_151_1:RecordAudio("317102038", var_154_19)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_317102", "317102038", "story_v_out_317102.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_317102", "317102038", "story_v_out_317102.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_20 = math.max(var_154_11, arg_151_1.talkMaxDuration)

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_20 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_10) / var_154_20

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_10 + var_154_20 and arg_151_1.time_ < var_154_10 + var_154_20 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play317102039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 317102039
		arg_155_1.duration_ = 8.8

		local var_155_0 = {
			zh = 5.333,
			ja = 8.8
		}
		local var_155_1 = manager.audio:GetLocalizationFlag()

		if var_155_0[var_155_1] ~= nil then
			arg_155_1.duration_ = var_155_0[var_155_1]
		end

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play317102040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.6

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[73].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(317102039)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 24
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102039", "story_v_out_317102.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102039", "story_v_out_317102.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_317102", "317102039", "story_v_out_317102.awb")

						arg_155_1:RecordAudio("317102039", var_158_9)
						arg_155_1:RecordAudio("317102039", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_317102", "317102039", "story_v_out_317102.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_317102", "317102039", "story_v_out_317102.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play317102040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 317102040
		arg_159_1.duration_ = 4.166

		local var_159_0 = {
			zh = 4.066,
			ja = 4.166
		}
		local var_159_1 = manager.audio:GetLocalizationFlag()

		if var_159_0[var_159_1] ~= nil then
			arg_159_1.duration_ = var_159_0[var_159_1]
		end

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play317102041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1093ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1093ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1093ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["1093ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect1093ui_story == nil then
				arg_159_1.var_.characterEffect1093ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect1093ui_story then
					arg_159_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect1093ui_story then
				arg_159_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_162_13 = 0

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action2_1")
			end

			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_162_15 = arg_159_1.actors_["1015ui_story"].transform
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 then
				arg_159_1.var_.moveOldPos1015ui_story = var_162_15.localPosition
			end

			local var_162_17 = 0.001

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17
				local var_162_19 = Vector3.New(0.7, -1.15, -6.2)

				var_162_15.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1015ui_story, var_162_19, var_162_18)

				local var_162_20 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_20.x, var_162_20.y, var_162_20.z)

				local var_162_21 = var_162_15.localEulerAngles

				var_162_21.z = 0
				var_162_21.x = 0
				var_162_15.localEulerAngles = var_162_21
			end

			if arg_159_1.time_ >= var_162_16 + var_162_17 and arg_159_1.time_ < var_162_16 + var_162_17 + arg_162_0 then
				var_162_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_162_22 = manager.ui.mainCamera.transform.position - var_162_15.position

				var_162_15.forward = Vector3.New(var_162_22.x, var_162_22.y, var_162_22.z)

				local var_162_23 = var_162_15.localEulerAngles

				var_162_23.z = 0
				var_162_23.x = 0
				var_162_15.localEulerAngles = var_162_23
			end

			local var_162_24 = arg_159_1.actors_["1015ui_story"]
			local var_162_25 = 0

			if var_162_25 < arg_159_1.time_ and arg_159_1.time_ <= var_162_25 + arg_162_0 and arg_159_1.var_.characterEffect1015ui_story == nil then
				arg_159_1.var_.characterEffect1015ui_story = var_162_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_26 = 0.200000002980232

			if var_162_25 <= arg_159_1.time_ and arg_159_1.time_ < var_162_25 + var_162_26 then
				local var_162_27 = (arg_159_1.time_ - var_162_25) / var_162_26

				if arg_159_1.var_.characterEffect1015ui_story then
					local var_162_28 = Mathf.Lerp(0, 0.5, var_162_27)

					arg_159_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1015ui_story.fillRatio = var_162_28
				end
			end

			if arg_159_1.time_ >= var_162_25 + var_162_26 and arg_159_1.time_ < var_162_25 + var_162_26 + arg_162_0 and arg_159_1.var_.characterEffect1015ui_story then
				local var_162_29 = 0.5

				arg_159_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1015ui_story.fillRatio = var_162_29
			end

			local var_162_30 = 0
			local var_162_31 = 0.4

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_32 = arg_159_1:FormatText(StoryNameCfg[73].name)

				arg_159_1.leftNameTxt_.text = var_162_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_33 = arg_159_1:GetWordFromCfg(317102040)
				local var_162_34 = arg_159_1:FormatText(var_162_33.content)

				arg_159_1.text_.text = var_162_34

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_35 = 16
				local var_162_36 = utf8.len(var_162_34)
				local var_162_37 = var_162_35 <= 0 and var_162_31 or var_162_31 * (var_162_36 / var_162_35)

				if var_162_37 > 0 and var_162_31 < var_162_37 then
					arg_159_1.talkMaxDuration = var_162_37

					if var_162_37 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_37 + var_162_30
					end
				end

				arg_159_1.text_.text = var_162_34
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102040", "story_v_out_317102.awb") ~= 0 then
					local var_162_38 = manager.audio:GetVoiceLength("story_v_out_317102", "317102040", "story_v_out_317102.awb") / 1000

					if var_162_38 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_38 + var_162_30
					end

					if var_162_33.prefab_name ~= "" and arg_159_1.actors_[var_162_33.prefab_name] ~= nil then
						local var_162_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_33.prefab_name].transform, "story_v_out_317102", "317102040", "story_v_out_317102.awb")

						arg_159_1:RecordAudio("317102040", var_162_39)
						arg_159_1:RecordAudio("317102040", var_162_39)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_317102", "317102040", "story_v_out_317102.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_317102", "317102040", "story_v_out_317102.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_40 = math.max(var_162_31, arg_159_1.talkMaxDuration)

			if var_162_30 <= arg_159_1.time_ and arg_159_1.time_ < var_162_30 + var_162_40 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_30) / var_162_40

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_30 + var_162_40 and arg_159_1.time_ < var_162_30 + var_162_40 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play317102041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 317102041
		arg_163_1.duration_ = 8.8

		local var_163_0 = {
			zh = 8.8,
			ja = 5.133
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play317102042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1093ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1093ui_story == nil then
				arg_163_1.var_.characterEffect1093ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1093ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1093ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1093ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1093ui_story.fillRatio = var_166_5
			end

			local var_166_6 = arg_163_1.actors_["1015ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story == nil then
				arg_163_1.var_.characterEffect1015ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.200000002980232

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1015ui_story then
					arg_163_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story then
				arg_163_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_166_10 = 0
			local var_166_11 = 0.95

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_12 = arg_163_1:FormatText(StoryNameCfg[479].name)

				arg_163_1.leftNameTxt_.text = var_166_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_13 = arg_163_1:GetWordFromCfg(317102041)
				local var_166_14 = arg_163_1:FormatText(var_166_13.content)

				arg_163_1.text_.text = var_166_14

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_15 = 38
				local var_166_16 = utf8.len(var_166_14)
				local var_166_17 = var_166_15 <= 0 and var_166_11 or var_166_11 * (var_166_16 / var_166_15)

				if var_166_17 > 0 and var_166_11 < var_166_17 then
					arg_163_1.talkMaxDuration = var_166_17

					if var_166_17 + var_166_10 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_17 + var_166_10
					end
				end

				arg_163_1.text_.text = var_166_14
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102041", "story_v_out_317102.awb") ~= 0 then
					local var_166_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102041", "story_v_out_317102.awb") / 1000

					if var_166_18 + var_166_10 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_18 + var_166_10
					end

					if var_166_13.prefab_name ~= "" and arg_163_1.actors_[var_166_13.prefab_name] ~= nil then
						local var_166_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_13.prefab_name].transform, "story_v_out_317102", "317102041", "story_v_out_317102.awb")

						arg_163_1:RecordAudio("317102041", var_166_19)
						arg_163_1:RecordAudio("317102041", var_166_19)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_317102", "317102041", "story_v_out_317102.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_317102", "317102041", "story_v_out_317102.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_20 = math.max(var_166_11, arg_163_1.talkMaxDuration)

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_20 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_10) / var_166_20

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_10 + var_166_20 and arg_163_1.time_ < var_166_10 + var_166_20 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play317102042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 317102042
		arg_167_1.duration_ = 2.4

		local var_167_0 = {
			zh = 2.166,
			ja = 2.4
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
				arg_167_0:Play317102043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1093ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1093ui_story == nil then
				arg_167_1.var_.characterEffect1093ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1093ui_story then
					arg_167_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1093ui_story then
				arg_167_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_170_4 = arg_167_1.actors_["1015ui_story"]
			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 and arg_167_1.var_.characterEffect1015ui_story == nil then
				arg_167_1.var_.characterEffect1015ui_story = var_170_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_6 = 0.200000002980232

			if var_170_5 <= arg_167_1.time_ and arg_167_1.time_ < var_170_5 + var_170_6 then
				local var_170_7 = (arg_167_1.time_ - var_170_5) / var_170_6

				if arg_167_1.var_.characterEffect1015ui_story then
					local var_170_8 = Mathf.Lerp(0, 0.5, var_170_7)

					arg_167_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1015ui_story.fillRatio = var_170_8
				end
			end

			if arg_167_1.time_ >= var_170_5 + var_170_6 and arg_167_1.time_ < var_170_5 + var_170_6 + arg_170_0 and arg_167_1.var_.characterEffect1015ui_story then
				local var_170_9 = 0.5

				arg_167_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1015ui_story.fillRatio = var_170_9
			end

			local var_170_10 = 0
			local var_170_11 = 0.325

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_12 = arg_167_1:FormatText(StoryNameCfg[73].name)

				arg_167_1.leftNameTxt_.text = var_170_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_13 = arg_167_1:GetWordFromCfg(317102042)
				local var_170_14 = arg_167_1:FormatText(var_170_13.content)

				arg_167_1.text_.text = var_170_14

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_15 = 13
				local var_170_16 = utf8.len(var_170_14)
				local var_170_17 = var_170_15 <= 0 and var_170_11 or var_170_11 * (var_170_16 / var_170_15)

				if var_170_17 > 0 and var_170_11 < var_170_17 then
					arg_167_1.talkMaxDuration = var_170_17

					if var_170_17 + var_170_10 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_17 + var_170_10
					end
				end

				arg_167_1.text_.text = var_170_14
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102042", "story_v_out_317102.awb") ~= 0 then
					local var_170_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102042", "story_v_out_317102.awb") / 1000

					if var_170_18 + var_170_10 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_18 + var_170_10
					end

					if var_170_13.prefab_name ~= "" and arg_167_1.actors_[var_170_13.prefab_name] ~= nil then
						local var_170_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_13.prefab_name].transform, "story_v_out_317102", "317102042", "story_v_out_317102.awb")

						arg_167_1:RecordAudio("317102042", var_170_19)
						arg_167_1:RecordAudio("317102042", var_170_19)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_317102", "317102042", "story_v_out_317102.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_317102", "317102042", "story_v_out_317102.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_20 = math.max(var_170_11, arg_167_1.talkMaxDuration)

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_20 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_10) / var_170_20

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_10 + var_170_20 and arg_167_1.time_ < var_170_10 + var_170_20 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play317102043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 317102043
		arg_171_1.duration_ = 6.066

		local var_171_0 = {
			zh = 6.033,
			ja = 6.066
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
				arg_171_0:Play317102044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1093ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1093ui_story == nil then
				arg_171_1.var_.characterEffect1093ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1093ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1093ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1093ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1093ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["1015ui_story"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.characterEffect1015ui_story == nil then
				arg_171_1.var_.characterEffect1015ui_story = var_174_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_8 = 0.200000002980232

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.characterEffect1015ui_story then
					arg_171_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.characterEffect1015ui_story then
				arg_171_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_174_10 = 0
			local var_174_11 = 0.625

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_12 = arg_171_1:FormatText(StoryNameCfg[479].name)

				arg_171_1.leftNameTxt_.text = var_174_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_13 = arg_171_1:GetWordFromCfg(317102043)
				local var_174_14 = arg_171_1:FormatText(var_174_13.content)

				arg_171_1.text_.text = var_174_14

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_15 = 25
				local var_174_16 = utf8.len(var_174_14)
				local var_174_17 = var_174_15 <= 0 and var_174_11 or var_174_11 * (var_174_16 / var_174_15)

				if var_174_17 > 0 and var_174_11 < var_174_17 then
					arg_171_1.talkMaxDuration = var_174_17

					if var_174_17 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_17 + var_174_10
					end
				end

				arg_171_1.text_.text = var_174_14
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102043", "story_v_out_317102.awb") ~= 0 then
					local var_174_18 = manager.audio:GetVoiceLength("story_v_out_317102", "317102043", "story_v_out_317102.awb") / 1000

					if var_174_18 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_10
					end

					if var_174_13.prefab_name ~= "" and arg_171_1.actors_[var_174_13.prefab_name] ~= nil then
						local var_174_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_13.prefab_name].transform, "story_v_out_317102", "317102043", "story_v_out_317102.awb")

						arg_171_1:RecordAudio("317102043", var_174_19)
						arg_171_1:RecordAudio("317102043", var_174_19)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_317102", "317102043", "story_v_out_317102.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_317102", "317102043", "story_v_out_317102.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_20 = math.max(var_174_11, arg_171_1.talkMaxDuration)

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_20 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_10) / var_174_20

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_10 + var_174_20 and arg_171_1.time_ < var_174_10 + var_174_20 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play317102044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 317102044
		arg_175_1.duration_ = 4.466

		local var_175_0 = {
			zh = 4.466,
			ja = 3.933
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
				arg_175_0:Play317102045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1093ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1093ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, 100, 0)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1093ui_story, var_178_4, var_178_3)

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

			local var_178_9 = arg_175_1.actors_["1093ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1093ui_story == nil then
				arg_175_1.var_.characterEffect1093ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1093ui_story then
					local var_178_13 = Mathf.Lerp(0, 0.5, var_178_12)

					arg_175_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1093ui_story.fillRatio = var_178_13
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1093ui_story then
				local var_178_14 = 0.5

				arg_175_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1093ui_story.fillRatio = var_178_14
			end

			local var_178_15 = arg_175_1.actors_["1015ui_story"].transform
			local var_178_16 = 0

			if var_178_16 < arg_175_1.time_ and arg_175_1.time_ <= var_178_16 + arg_178_0 then
				arg_175_1.var_.moveOldPos1015ui_story = var_178_15.localPosition
			end

			local var_178_17 = 0.001

			if var_178_16 <= arg_175_1.time_ and arg_175_1.time_ < var_178_16 + var_178_17 then
				local var_178_18 = (arg_175_1.time_ - var_178_16) / var_178_17
				local var_178_19 = Vector3.New(0, 100, 0)

				var_178_15.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1015ui_story, var_178_19, var_178_18)

				local var_178_20 = manager.ui.mainCamera.transform.position - var_178_15.position

				var_178_15.forward = Vector3.New(var_178_20.x, var_178_20.y, var_178_20.z)

				local var_178_21 = var_178_15.localEulerAngles

				var_178_21.z = 0
				var_178_21.x = 0
				var_178_15.localEulerAngles = var_178_21
			end

			if arg_175_1.time_ >= var_178_16 + var_178_17 and arg_175_1.time_ < var_178_16 + var_178_17 + arg_178_0 then
				var_178_15.localPosition = Vector3.New(0, 100, 0)

				local var_178_22 = manager.ui.mainCamera.transform.position - var_178_15.position

				var_178_15.forward = Vector3.New(var_178_22.x, var_178_22.y, var_178_22.z)

				local var_178_23 = var_178_15.localEulerAngles

				var_178_23.z = 0
				var_178_23.x = 0
				var_178_15.localEulerAngles = var_178_23
			end

			local var_178_24 = arg_175_1.actors_["1015ui_story"]
			local var_178_25 = 0

			if var_178_25 < arg_175_1.time_ and arg_175_1.time_ <= var_178_25 + arg_178_0 and arg_175_1.var_.characterEffect1015ui_story == nil then
				arg_175_1.var_.characterEffect1015ui_story = var_178_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_26 = 0.200000002980232

			if var_178_25 <= arg_175_1.time_ and arg_175_1.time_ < var_178_25 + var_178_26 then
				local var_178_27 = (arg_175_1.time_ - var_178_25) / var_178_26

				if arg_175_1.var_.characterEffect1015ui_story then
					local var_178_28 = Mathf.Lerp(0, 0.5, var_178_27)

					arg_175_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1015ui_story.fillRatio = var_178_28
				end
			end

			if arg_175_1.time_ >= var_178_25 + var_178_26 and arg_175_1.time_ < var_178_25 + var_178_26 + arg_178_0 and arg_175_1.var_.characterEffect1015ui_story then
				local var_178_29 = 0.5

				arg_175_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1015ui_story.fillRatio = var_178_29
			end

			local var_178_30 = arg_175_1.actors_["2078ui_story"].transform
			local var_178_31 = 0

			if var_178_31 < arg_175_1.time_ and arg_175_1.time_ <= var_178_31 + arg_178_0 then
				arg_175_1.var_.moveOldPos2078ui_story = var_178_30.localPosition
			end

			local var_178_32 = 0.001

			if var_178_31 <= arg_175_1.time_ and arg_175_1.time_ < var_178_31 + var_178_32 then
				local var_178_33 = (arg_175_1.time_ - var_178_31) / var_178_32
				local var_178_34 = Vector3.New(0, -1.28, -5.6)

				var_178_30.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos2078ui_story, var_178_34, var_178_33)

				local var_178_35 = manager.ui.mainCamera.transform.position - var_178_30.position

				var_178_30.forward = Vector3.New(var_178_35.x, var_178_35.y, var_178_35.z)

				local var_178_36 = var_178_30.localEulerAngles

				var_178_36.z = 0
				var_178_36.x = 0
				var_178_30.localEulerAngles = var_178_36
			end

			if arg_175_1.time_ >= var_178_31 + var_178_32 and arg_175_1.time_ < var_178_31 + var_178_32 + arg_178_0 then
				var_178_30.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_178_37 = manager.ui.mainCamera.transform.position - var_178_30.position

				var_178_30.forward = Vector3.New(var_178_37.x, var_178_37.y, var_178_37.z)

				local var_178_38 = var_178_30.localEulerAngles

				var_178_38.z = 0
				var_178_38.x = 0
				var_178_30.localEulerAngles = var_178_38
			end

			local var_178_39 = arg_175_1.actors_["2078ui_story"]
			local var_178_40 = 0

			if var_178_40 < arg_175_1.time_ and arg_175_1.time_ <= var_178_40 + arg_178_0 and arg_175_1.var_.characterEffect2078ui_story == nil then
				arg_175_1.var_.characterEffect2078ui_story = var_178_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_41 = 0.200000002980232

			if var_178_40 <= arg_175_1.time_ and arg_175_1.time_ < var_178_40 + var_178_41 then
				local var_178_42 = (arg_175_1.time_ - var_178_40) / var_178_41

				if arg_175_1.var_.characterEffect2078ui_story then
					arg_175_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_40 + var_178_41 and arg_175_1.time_ < var_178_40 + var_178_41 + arg_178_0 and arg_175_1.var_.characterEffect2078ui_story then
				arg_175_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_178_43 = 0

			if var_178_43 < arg_175_1.time_ and arg_175_1.time_ <= var_178_43 + arg_178_0 then
				arg_175_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_178_44 = 0

			if var_178_44 < arg_175_1.time_ and arg_175_1.time_ <= var_178_44 + arg_178_0 then
				arg_175_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_178_45 = 0
			local var_178_46 = 0.625

			if var_178_45 < arg_175_1.time_ and arg_175_1.time_ <= var_178_45 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_47 = arg_175_1:FormatText(StoryNameCfg[528].name)

				arg_175_1.leftNameTxt_.text = var_178_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_48 = arg_175_1:GetWordFromCfg(317102044)
				local var_178_49 = arg_175_1:FormatText(var_178_48.content)

				arg_175_1.text_.text = var_178_49

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_50 = 25
				local var_178_51 = utf8.len(var_178_49)
				local var_178_52 = var_178_50 <= 0 and var_178_46 or var_178_46 * (var_178_51 / var_178_50)

				if var_178_52 > 0 and var_178_46 < var_178_52 then
					arg_175_1.talkMaxDuration = var_178_52

					if var_178_52 + var_178_45 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_52 + var_178_45
					end
				end

				arg_175_1.text_.text = var_178_49
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102044", "story_v_out_317102.awb") ~= 0 then
					local var_178_53 = manager.audio:GetVoiceLength("story_v_out_317102", "317102044", "story_v_out_317102.awb") / 1000

					if var_178_53 + var_178_45 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_53 + var_178_45
					end

					if var_178_48.prefab_name ~= "" and arg_175_1.actors_[var_178_48.prefab_name] ~= nil then
						local var_178_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_48.prefab_name].transform, "story_v_out_317102", "317102044", "story_v_out_317102.awb")

						arg_175_1:RecordAudio("317102044", var_178_54)
						arg_175_1:RecordAudio("317102044", var_178_54)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_317102", "317102044", "story_v_out_317102.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_317102", "317102044", "story_v_out_317102.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_55 = math.max(var_178_46, arg_175_1.talkMaxDuration)

			if var_178_45 <= arg_175_1.time_ and arg_175_1.time_ < var_178_45 + var_178_55 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_45) / var_178_55

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_45 + var_178_55 and arg_175_1.time_ < var_178_45 + var_178_55 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play317102045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 317102045
		arg_179_1.duration_ = 6.4

		local var_179_0 = {
			zh = 6.4,
			ja = 4.433
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
				arg_179_0:Play317102046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1093ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1093ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(-0.7, -1.11, -5.88)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1093ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1093ui_story"]
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1093ui_story == nil then
				arg_179_1.var_.characterEffect1093ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.200000002980232

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1093ui_story then
					local var_182_13 = Mathf.Lerp(0, 0.5, var_182_12)

					arg_179_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1093ui_story.fillRatio = var_182_13
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1093ui_story then
				local var_182_14 = 0.5

				arg_179_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1093ui_story.fillRatio = var_182_14
			end

			local var_182_15 = arg_179_1.actors_["1015ui_story"].transform
			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 then
				arg_179_1.var_.moveOldPos1015ui_story = var_182_15.localPosition
			end

			local var_182_17 = 0.001

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17
				local var_182_19 = Vector3.New(0.7, -1.15, -6.2)

				var_182_15.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1015ui_story, var_182_19, var_182_18)

				local var_182_20 = manager.ui.mainCamera.transform.position - var_182_15.position

				var_182_15.forward = Vector3.New(var_182_20.x, var_182_20.y, var_182_20.z)

				local var_182_21 = var_182_15.localEulerAngles

				var_182_21.z = 0
				var_182_21.x = 0
				var_182_15.localEulerAngles = var_182_21
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 then
				var_182_15.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_182_22 = manager.ui.mainCamera.transform.position - var_182_15.position

				var_182_15.forward = Vector3.New(var_182_22.x, var_182_22.y, var_182_22.z)

				local var_182_23 = var_182_15.localEulerAngles

				var_182_23.z = 0
				var_182_23.x = 0
				var_182_15.localEulerAngles = var_182_23
			end

			local var_182_24 = arg_179_1.actors_["1015ui_story"]
			local var_182_25 = 0

			if var_182_25 < arg_179_1.time_ and arg_179_1.time_ <= var_182_25 + arg_182_0 and arg_179_1.var_.characterEffect1015ui_story == nil then
				arg_179_1.var_.characterEffect1015ui_story = var_182_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_26 = 0.200000002980232

			if var_182_25 <= arg_179_1.time_ and arg_179_1.time_ < var_182_25 + var_182_26 then
				local var_182_27 = (arg_179_1.time_ - var_182_25) / var_182_26

				if arg_179_1.var_.characterEffect1015ui_story then
					arg_179_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_25 + var_182_26 and arg_179_1.time_ < var_182_25 + var_182_26 + arg_182_0 and arg_179_1.var_.characterEffect1015ui_story then
				arg_179_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_182_28 = arg_179_1.actors_["2078ui_story"].transform
			local var_182_29 = 0

			if var_182_29 < arg_179_1.time_ and arg_179_1.time_ <= var_182_29 + arg_182_0 then
				arg_179_1.var_.moveOldPos2078ui_story = var_182_28.localPosition
			end

			local var_182_30 = 0.001

			if var_182_29 <= arg_179_1.time_ and arg_179_1.time_ < var_182_29 + var_182_30 then
				local var_182_31 = (arg_179_1.time_ - var_182_29) / var_182_30
				local var_182_32 = Vector3.New(0, 100, 0)

				var_182_28.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos2078ui_story, var_182_32, var_182_31)

				local var_182_33 = manager.ui.mainCamera.transform.position - var_182_28.position

				var_182_28.forward = Vector3.New(var_182_33.x, var_182_33.y, var_182_33.z)

				local var_182_34 = var_182_28.localEulerAngles

				var_182_34.z = 0
				var_182_34.x = 0
				var_182_28.localEulerAngles = var_182_34
			end

			if arg_179_1.time_ >= var_182_29 + var_182_30 and arg_179_1.time_ < var_182_29 + var_182_30 + arg_182_0 then
				var_182_28.localPosition = Vector3.New(0, 100, 0)

				local var_182_35 = manager.ui.mainCamera.transform.position - var_182_28.position

				var_182_28.forward = Vector3.New(var_182_35.x, var_182_35.y, var_182_35.z)

				local var_182_36 = var_182_28.localEulerAngles

				var_182_36.z = 0
				var_182_36.x = 0
				var_182_28.localEulerAngles = var_182_36
			end

			local var_182_37 = 0
			local var_182_38 = 0.85

			if var_182_37 < arg_179_1.time_ and arg_179_1.time_ <= var_182_37 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_39 = arg_179_1:FormatText(StoryNameCfg[479].name)

				arg_179_1.leftNameTxt_.text = var_182_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_40 = arg_179_1:GetWordFromCfg(317102045)
				local var_182_41 = arg_179_1:FormatText(var_182_40.content)

				arg_179_1.text_.text = var_182_41

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_42 = 34
				local var_182_43 = utf8.len(var_182_41)
				local var_182_44 = var_182_42 <= 0 and var_182_38 or var_182_38 * (var_182_43 / var_182_42)

				if var_182_44 > 0 and var_182_38 < var_182_44 then
					arg_179_1.talkMaxDuration = var_182_44

					if var_182_44 + var_182_37 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_44 + var_182_37
					end
				end

				arg_179_1.text_.text = var_182_41
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102045", "story_v_out_317102.awb") ~= 0 then
					local var_182_45 = manager.audio:GetVoiceLength("story_v_out_317102", "317102045", "story_v_out_317102.awb") / 1000

					if var_182_45 + var_182_37 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_45 + var_182_37
					end

					if var_182_40.prefab_name ~= "" and arg_179_1.actors_[var_182_40.prefab_name] ~= nil then
						local var_182_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_40.prefab_name].transform, "story_v_out_317102", "317102045", "story_v_out_317102.awb")

						arg_179_1:RecordAudio("317102045", var_182_46)
						arg_179_1:RecordAudio("317102045", var_182_46)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_317102", "317102045", "story_v_out_317102.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_317102", "317102045", "story_v_out_317102.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_47 = math.max(var_182_38, arg_179_1.talkMaxDuration)

			if var_182_37 <= arg_179_1.time_ and arg_179_1.time_ < var_182_37 + var_182_47 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_37) / var_182_47

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_37 + var_182_47 and arg_179_1.time_ < var_182_37 + var_182_47 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play317102046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 317102046
		arg_183_1.duration_ = 5.566

		local var_183_0 = {
			zh = 5.566,
			ja = 5.5
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
				arg_183_0:Play317102047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.625

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[479].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(317102046)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 26
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102046", "story_v_out_317102.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102046", "story_v_out_317102.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_317102", "317102046", "story_v_out_317102.awb")

						arg_183_1:RecordAudio("317102046", var_186_9)
						arg_183_1:RecordAudio("317102046", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_317102", "317102046", "story_v_out_317102.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_317102", "317102046", "story_v_out_317102.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play317102047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 317102047
		arg_187_1.duration_ = 9

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play317102048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 2

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				local var_190_1 = manager.ui.mainCamera.transform.localPosition
				local var_190_2 = Vector3.New(0, 0, 10) + Vector3.New(var_190_1.x, var_190_1.y, 0)
				local var_190_3 = arg_187_1.bgs_.K09f

				var_190_3.transform.localPosition = var_190_2
				var_190_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_190_4 = var_190_3:GetComponent("SpriteRenderer")

				if var_190_4 and var_190_4.sprite then
					local var_190_5 = (var_190_3.transform.localPosition - var_190_1).z
					local var_190_6 = manager.ui.mainCameraCom_
					local var_190_7 = 2 * var_190_5 * Mathf.Tan(var_190_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_190_8 = var_190_7 * var_190_6.aspect
					local var_190_9 = var_190_4.sprite.bounds.size.x
					local var_190_10 = var_190_4.sprite.bounds.size.y
					local var_190_11 = var_190_8 / var_190_9
					local var_190_12 = var_190_7 / var_190_10
					local var_190_13 = var_190_12 < var_190_11 and var_190_11 or var_190_12

					var_190_3.transform.localScale = Vector3.New(var_190_13, var_190_13, 0)
				end

				for iter_190_0, iter_190_1 in pairs(arg_187_1.bgs_) do
					if iter_190_0 ~= "K09f" then
						iter_190_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_15 = 2

			if var_190_14 <= arg_187_1.time_ and arg_187_1.time_ < var_190_14 + var_190_15 then
				local var_190_16 = (arg_187_1.time_ - var_190_14) / var_190_15
				local var_190_17 = Color.New(0, 0, 0)

				var_190_17.a = Mathf.Lerp(0, 1, var_190_16)
				arg_187_1.mask_.color = var_190_17
			end

			if arg_187_1.time_ >= var_190_14 + var_190_15 and arg_187_1.time_ < var_190_14 + var_190_15 + arg_190_0 then
				local var_190_18 = Color.New(0, 0, 0)

				var_190_18.a = 1
				arg_187_1.mask_.color = var_190_18
			end

			local var_190_19 = 2

			if var_190_19 < arg_187_1.time_ and arg_187_1.time_ <= var_190_19 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_20 = 2

			if var_190_19 <= arg_187_1.time_ and arg_187_1.time_ < var_190_19 + var_190_20 then
				local var_190_21 = (arg_187_1.time_ - var_190_19) / var_190_20
				local var_190_22 = Color.New(0, 0, 0)

				var_190_22.a = Mathf.Lerp(1, 0, var_190_21)
				arg_187_1.mask_.color = var_190_22
			end

			if arg_187_1.time_ >= var_190_19 + var_190_20 and arg_187_1.time_ < var_190_19 + var_190_20 + arg_190_0 then
				local var_190_23 = Color.New(0, 0, 0)
				local var_190_24 = 0

				arg_187_1.mask_.enabled = false
				var_190_23.a = var_190_24
				arg_187_1.mask_.color = var_190_23
			end

			local var_190_25 = arg_187_1.actors_["1093ui_story"].transform
			local var_190_26 = 2

			if var_190_26 < arg_187_1.time_ and arg_187_1.time_ <= var_190_26 + arg_190_0 then
				arg_187_1.var_.moveOldPos1093ui_story = var_190_25.localPosition
			end

			local var_190_27 = 0.001

			if var_190_26 <= arg_187_1.time_ and arg_187_1.time_ < var_190_26 + var_190_27 then
				local var_190_28 = (arg_187_1.time_ - var_190_26) / var_190_27
				local var_190_29 = Vector3.New(0, 100, 0)

				var_190_25.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1093ui_story, var_190_29, var_190_28)

				local var_190_30 = manager.ui.mainCamera.transform.position - var_190_25.position

				var_190_25.forward = Vector3.New(var_190_30.x, var_190_30.y, var_190_30.z)

				local var_190_31 = var_190_25.localEulerAngles

				var_190_31.z = 0
				var_190_31.x = 0
				var_190_25.localEulerAngles = var_190_31
			end

			if arg_187_1.time_ >= var_190_26 + var_190_27 and arg_187_1.time_ < var_190_26 + var_190_27 + arg_190_0 then
				var_190_25.localPosition = Vector3.New(0, 100, 0)

				local var_190_32 = manager.ui.mainCamera.transform.position - var_190_25.position

				var_190_25.forward = Vector3.New(var_190_32.x, var_190_32.y, var_190_32.z)

				local var_190_33 = var_190_25.localEulerAngles

				var_190_33.z = 0
				var_190_33.x = 0
				var_190_25.localEulerAngles = var_190_33
			end

			local var_190_34 = arg_187_1.actors_["1015ui_story"].transform
			local var_190_35 = 2

			if var_190_35 < arg_187_1.time_ and arg_187_1.time_ <= var_190_35 + arg_190_0 then
				arg_187_1.var_.moveOldPos1015ui_story = var_190_34.localPosition
			end

			local var_190_36 = 0.001

			if var_190_35 <= arg_187_1.time_ and arg_187_1.time_ < var_190_35 + var_190_36 then
				local var_190_37 = (arg_187_1.time_ - var_190_35) / var_190_36
				local var_190_38 = Vector3.New(0, 100, 0)

				var_190_34.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1015ui_story, var_190_38, var_190_37)

				local var_190_39 = manager.ui.mainCamera.transform.position - var_190_34.position

				var_190_34.forward = Vector3.New(var_190_39.x, var_190_39.y, var_190_39.z)

				local var_190_40 = var_190_34.localEulerAngles

				var_190_40.z = 0
				var_190_40.x = 0
				var_190_34.localEulerAngles = var_190_40
			end

			if arg_187_1.time_ >= var_190_35 + var_190_36 and arg_187_1.time_ < var_190_35 + var_190_36 + arg_190_0 then
				var_190_34.localPosition = Vector3.New(0, 100, 0)

				local var_190_41 = manager.ui.mainCamera.transform.position - var_190_34.position

				var_190_34.forward = Vector3.New(var_190_41.x, var_190_41.y, var_190_41.z)

				local var_190_42 = var_190_34.localEulerAngles

				var_190_42.z = 0
				var_190_42.x = 0
				var_190_34.localEulerAngles = var_190_42
			end

			if arg_187_1.frameCnt_ <= 1 then
				arg_187_1.dialog_:SetActive(false)
			end

			local var_190_43 = 4
			local var_190_44 = 0.85

			if var_190_43 < arg_187_1.time_ and arg_187_1.time_ <= var_190_43 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				arg_187_1.dialog_:SetActive(true)

				local var_190_45 = LeanTween.value(arg_187_1.dialog_, 0, 1, 0.3)

				var_190_45:setOnUpdate(LuaHelper.FloatAction(function(arg_191_0)
					arg_187_1.dialogCg_.alpha = arg_191_0
				end))
				var_190_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_187_1.dialog_)
					var_190_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_187_1.duration_ = arg_187_1.duration_ + 0.3

				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_46 = arg_187_1:GetWordFromCfg(317102047)
				local var_190_47 = arg_187_1:FormatText(var_190_46.content)

				arg_187_1.text_.text = var_190_47

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_48 = 34
				local var_190_49 = utf8.len(var_190_47)
				local var_190_50 = var_190_48 <= 0 and var_190_44 or var_190_44 * (var_190_49 / var_190_48)

				if var_190_50 > 0 and var_190_44 < var_190_50 then
					arg_187_1.talkMaxDuration = var_190_50
					var_190_43 = var_190_43 + 0.3

					if var_190_50 + var_190_43 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_50 + var_190_43
					end
				end

				arg_187_1.text_.text = var_190_47
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_51 = var_190_43 + 0.3
			local var_190_52 = math.max(var_190_44, arg_187_1.talkMaxDuration)

			if var_190_51 <= arg_187_1.time_ and arg_187_1.time_ < var_190_51 + var_190_52 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_51) / var_190_52

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_51 + var_190_52 and arg_187_1.time_ < var_190_51 + var_190_52 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play317102048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 317102048
		arg_193_1.duration_ = 5.033

		local var_193_0 = {
			zh = 2.933,
			ja = 5.033
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
				arg_193_0:Play317102049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.35

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[93].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(317102048)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 14
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102048", "story_v_out_317102.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102048", "story_v_out_317102.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_317102", "317102048", "story_v_out_317102.awb")

						arg_193_1:RecordAudio("317102048", var_196_9)
						arg_193_1:RecordAudio("317102048", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_317102", "317102048", "story_v_out_317102.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_317102", "317102048", "story_v_out_317102.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play317102049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 317102049
		arg_197_1.duration_ = 2.5

		local var_197_0 = {
			zh = 1.233,
			ja = 2.5
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
				arg_197_0:Play317102050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.175

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[93].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(317102049)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102049", "story_v_out_317102.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_317102", "317102049", "story_v_out_317102.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_317102", "317102049", "story_v_out_317102.awb")

						arg_197_1:RecordAudio("317102049", var_200_9)
						arg_197_1:RecordAudio("317102049", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_317102", "317102049", "story_v_out_317102.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_317102", "317102049", "story_v_out_317102.awb")
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
	Play317102050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 317102050
		arg_201_1.duration_ = 9.966

		local var_201_0 = {
			zh = 7.633,
			ja = 9.966
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
				arg_201_0:Play317102051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "1058ui_story"

			if arg_201_1.actors_[var_204_0] == nil then
				local var_204_1 = Object.Instantiate(Asset.Load("Char/" .. var_204_0), arg_201_1.stage_.transform)

				var_204_1.name = var_204_0
				var_204_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.actors_[var_204_0] = var_204_1

				local var_204_2 = var_204_1:GetComponentInChildren(typeof(CharacterEffect))

				var_204_2.enabled = true

				local var_204_3 = GameObjectTools.GetOrAddComponent(var_204_1, typeof(DynamicBoneHelper))

				if var_204_3 then
					var_204_3:EnableDynamicBone(false)
				end

				arg_201_1:ShowWeapon(var_204_2.transform, false)

				arg_201_1.var_[var_204_0 .. "Animator"] = var_204_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_201_1.var_[var_204_0 .. "Animator"].applyRootMotion = true
				arg_201_1.var_[var_204_0 .. "LipSync"] = var_204_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_204_4 = arg_201_1.actors_["1058ui_story"].transform
			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 then
				arg_201_1.var_.moveOldPos1058ui_story = var_204_4.localPosition
			end

			local var_204_6 = 0.001

			if var_204_5 <= arg_201_1.time_ and arg_201_1.time_ < var_204_5 + var_204_6 then
				local var_204_7 = (arg_201_1.time_ - var_204_5) / var_204_6
				local var_204_8 = Vector3.New(0, -0.95, -5.88)

				var_204_4.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1058ui_story, var_204_8, var_204_7)

				local var_204_9 = manager.ui.mainCamera.transform.position - var_204_4.position

				var_204_4.forward = Vector3.New(var_204_9.x, var_204_9.y, var_204_9.z)

				local var_204_10 = var_204_4.localEulerAngles

				var_204_10.z = 0
				var_204_10.x = 0
				var_204_4.localEulerAngles = var_204_10
			end

			if arg_201_1.time_ >= var_204_5 + var_204_6 and arg_201_1.time_ < var_204_5 + var_204_6 + arg_204_0 then
				var_204_4.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_204_11 = manager.ui.mainCamera.transform.position - var_204_4.position

				var_204_4.forward = Vector3.New(var_204_11.x, var_204_11.y, var_204_11.z)

				local var_204_12 = var_204_4.localEulerAngles

				var_204_12.z = 0
				var_204_12.x = 0
				var_204_4.localEulerAngles = var_204_12
			end

			local var_204_13 = arg_201_1.actors_["1058ui_story"]
			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 and arg_201_1.var_.characterEffect1058ui_story == nil then
				arg_201_1.var_.characterEffect1058ui_story = var_204_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_15 = 0.2

			if var_204_14 <= arg_201_1.time_ and arg_201_1.time_ < var_204_14 + var_204_15 then
				local var_204_16 = (arg_201_1.time_ - var_204_14) / var_204_15

				if arg_201_1.var_.characterEffect1058ui_story then
					arg_201_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_14 + var_204_15 and arg_201_1.time_ < var_204_14 + var_204_15 + arg_204_0 and arg_201_1.var_.characterEffect1058ui_story then
				arg_201_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_204_17 = 0

			if var_204_17 < arg_201_1.time_ and arg_201_1.time_ <= var_204_17 + arg_204_0 then
				arg_201_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action4_1")
			end

			local var_204_18 = 0

			if var_204_18 < arg_201_1.time_ and arg_201_1.time_ <= var_204_18 + arg_204_0 then
				arg_201_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_19 = 0
			local var_204_20 = 0.925

			if var_204_19 < arg_201_1.time_ and arg_201_1.time_ <= var_204_19 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_21 = arg_201_1:FormatText(StoryNameCfg[92].name)

				arg_201_1.leftNameTxt_.text = var_204_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_22 = arg_201_1:GetWordFromCfg(317102050)
				local var_204_23 = arg_201_1:FormatText(var_204_22.content)

				arg_201_1.text_.text = var_204_23

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_24 = 37
				local var_204_25 = utf8.len(var_204_23)
				local var_204_26 = var_204_24 <= 0 and var_204_20 or var_204_20 * (var_204_25 / var_204_24)

				if var_204_26 > 0 and var_204_20 < var_204_26 then
					arg_201_1.talkMaxDuration = var_204_26

					if var_204_26 + var_204_19 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_26 + var_204_19
					end
				end

				arg_201_1.text_.text = var_204_23
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102050", "story_v_out_317102.awb") ~= 0 then
					local var_204_27 = manager.audio:GetVoiceLength("story_v_out_317102", "317102050", "story_v_out_317102.awb") / 1000

					if var_204_27 + var_204_19 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_27 + var_204_19
					end

					if var_204_22.prefab_name ~= "" and arg_201_1.actors_[var_204_22.prefab_name] ~= nil then
						local var_204_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_22.prefab_name].transform, "story_v_out_317102", "317102050", "story_v_out_317102.awb")

						arg_201_1:RecordAudio("317102050", var_204_28)
						arg_201_1:RecordAudio("317102050", var_204_28)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_317102", "317102050", "story_v_out_317102.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_317102", "317102050", "story_v_out_317102.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_29 = math.max(var_204_20, arg_201_1.talkMaxDuration)

			if var_204_19 <= arg_201_1.time_ and arg_201_1.time_ < var_204_19 + var_204_29 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_19) / var_204_29

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_19 + var_204_29 and arg_201_1.time_ < var_204_19 + var_204_29 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play317102051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 317102051
		arg_205_1.duration_ = 7.633

		local var_205_0 = {
			zh = 4.2,
			ja = 7.633
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
				arg_205_0:Play317102052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1058ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect1058ui_story == nil then
				arg_205_1.var_.characterEffect1058ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.2

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1058ui_story then
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1058ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1058ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1058ui_story.fillRatio = var_208_5
			end

			local var_208_6 = 0
			local var_208_7 = 0.5

			if var_208_6 < arg_205_1.time_ and arg_205_1.time_ <= var_208_6 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_8 = arg_205_1:FormatText(StoryNameCfg[93].name)

				arg_205_1.leftNameTxt_.text = var_208_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_9 = arg_205_1:GetWordFromCfg(317102051)
				local var_208_10 = arg_205_1:FormatText(var_208_9.content)

				arg_205_1.text_.text = var_208_10

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_11 = 20
				local var_208_12 = utf8.len(var_208_10)
				local var_208_13 = var_208_11 <= 0 and var_208_7 or var_208_7 * (var_208_12 / var_208_11)

				if var_208_13 > 0 and var_208_7 < var_208_13 then
					arg_205_1.talkMaxDuration = var_208_13

					if var_208_13 + var_208_6 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_6
					end
				end

				arg_205_1.text_.text = var_208_10
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102051", "story_v_out_317102.awb") ~= 0 then
					local var_208_14 = manager.audio:GetVoiceLength("story_v_out_317102", "317102051", "story_v_out_317102.awb") / 1000

					if var_208_14 + var_208_6 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_14 + var_208_6
					end

					if var_208_9.prefab_name ~= "" and arg_205_1.actors_[var_208_9.prefab_name] ~= nil then
						local var_208_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_9.prefab_name].transform, "story_v_out_317102", "317102051", "story_v_out_317102.awb")

						arg_205_1:RecordAudio("317102051", var_208_15)
						arg_205_1:RecordAudio("317102051", var_208_15)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_317102", "317102051", "story_v_out_317102.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_317102", "317102051", "story_v_out_317102.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_16 = math.max(var_208_7, arg_205_1.talkMaxDuration)

			if var_208_6 <= arg_205_1.time_ and arg_205_1.time_ < var_208_6 + var_208_16 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_6) / var_208_16

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_6 + var_208_16 and arg_205_1.time_ < var_208_6 + var_208_16 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play317102052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 317102052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play317102053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1058ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1058ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, 100, 0)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1058ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, 100, 0)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = 0
			local var_212_10 = 0.375

			if var_212_9 < arg_209_1.time_ and arg_209_1.time_ <= var_212_9 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_11 = arg_209_1:GetWordFromCfg(317102052)
				local var_212_12 = arg_209_1:FormatText(var_212_11.content)

				arg_209_1.text_.text = var_212_12

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_13 = 15
				local var_212_14 = utf8.len(var_212_12)
				local var_212_15 = var_212_13 <= 0 and var_212_10 or var_212_10 * (var_212_14 / var_212_13)

				if var_212_15 > 0 and var_212_10 < var_212_15 then
					arg_209_1.talkMaxDuration = var_212_15

					if var_212_15 + var_212_9 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_15 + var_212_9
					end
				end

				arg_209_1.text_.text = var_212_12
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_16 = math.max(var_212_10, arg_209_1.talkMaxDuration)

			if var_212_9 <= arg_209_1.time_ and arg_209_1.time_ < var_212_9 + var_212_16 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_9) / var_212_16

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_9 + var_212_16 and arg_209_1.time_ < var_212_9 + var_212_16 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play317102053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 317102053
		arg_213_1.duration_ = 10.366

		local var_213_0 = {
			zh = 8.8,
			ja = 10.366
		}
		local var_213_1 = manager.audio:GetLocalizationFlag()

		if var_213_0[var_213_1] ~= nil then
			arg_213_1.duration_ = var_213_0[var_213_1]
		end

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play317102054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1058ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1058ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, -0.95, -5.88)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1058ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1058ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1058ui_story == nil then
				arg_213_1.var_.characterEffect1058ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.2

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1058ui_story then
					arg_213_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1058ui_story then
				arg_213_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_216_13 = 0

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action4_2")
			end

			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 then
				arg_213_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_216_15 = 0
			local var_216_16 = 1

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_17 = arg_213_1:FormatText(StoryNameCfg[92].name)

				arg_213_1.leftNameTxt_.text = var_216_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_18 = arg_213_1:GetWordFromCfg(317102053)
				local var_216_19 = arg_213_1:FormatText(var_216_18.content)

				arg_213_1.text_.text = var_216_19

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_20 = 40
				local var_216_21 = utf8.len(var_216_19)
				local var_216_22 = var_216_20 <= 0 and var_216_16 or var_216_16 * (var_216_21 / var_216_20)

				if var_216_22 > 0 and var_216_16 < var_216_22 then
					arg_213_1.talkMaxDuration = var_216_22

					if var_216_22 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_22 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_19
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102053", "story_v_out_317102.awb") ~= 0 then
					local var_216_23 = manager.audio:GetVoiceLength("story_v_out_317102", "317102053", "story_v_out_317102.awb") / 1000

					if var_216_23 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_23 + var_216_15
					end

					if var_216_18.prefab_name ~= "" and arg_213_1.actors_[var_216_18.prefab_name] ~= nil then
						local var_216_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_18.prefab_name].transform, "story_v_out_317102", "317102053", "story_v_out_317102.awb")

						arg_213_1:RecordAudio("317102053", var_216_24)
						arg_213_1:RecordAudio("317102053", var_216_24)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_317102", "317102053", "story_v_out_317102.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_317102", "317102053", "story_v_out_317102.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_25 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_25 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_25

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_25 and arg_213_1.time_ < var_216_15 + var_216_25 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play317102054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 317102054
		arg_217_1.duration_ = 2.8

		local var_217_0 = {
			zh = 0.999999999999,
			ja = 2.8
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
				arg_217_0:Play317102055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1058ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1058ui_story == nil then
				arg_217_1.var_.characterEffect1058ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1058ui_story then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1058ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1058ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1058ui_story.fillRatio = var_220_5
			end

			local var_220_6 = 0
			local var_220_7 = 0.075

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_8 = arg_217_1:FormatText(StoryNameCfg[93].name)

				arg_217_1.leftNameTxt_.text = var_220_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_9 = arg_217_1:GetWordFromCfg(317102054)
				local var_220_10 = arg_217_1:FormatText(var_220_9.content)

				arg_217_1.text_.text = var_220_10

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_11 = 3
				local var_220_12 = utf8.len(var_220_10)
				local var_220_13 = var_220_11 <= 0 and var_220_7 or var_220_7 * (var_220_12 / var_220_11)

				if var_220_13 > 0 and var_220_7 < var_220_13 then
					arg_217_1.talkMaxDuration = var_220_13

					if var_220_13 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_13 + var_220_6
					end
				end

				arg_217_1.text_.text = var_220_10
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102054", "story_v_out_317102.awb") ~= 0 then
					local var_220_14 = manager.audio:GetVoiceLength("story_v_out_317102", "317102054", "story_v_out_317102.awb") / 1000

					if var_220_14 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_14 + var_220_6
					end

					if var_220_9.prefab_name ~= "" and arg_217_1.actors_[var_220_9.prefab_name] ~= nil then
						local var_220_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_9.prefab_name].transform, "story_v_out_317102", "317102054", "story_v_out_317102.awb")

						arg_217_1:RecordAudio("317102054", var_220_15)
						arg_217_1:RecordAudio("317102054", var_220_15)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_317102", "317102054", "story_v_out_317102.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_317102", "317102054", "story_v_out_317102.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_16 = math.max(var_220_7, arg_217_1.talkMaxDuration)

			if var_220_6 <= arg_217_1.time_ and arg_217_1.time_ < var_220_6 + var_220_16 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_6) / var_220_16

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_6 + var_220_16 and arg_217_1.time_ < var_220_6 + var_220_16 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play317102055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 317102055
		arg_221_1.duration_ = 14.266

		local var_221_0 = {
			zh = 8.666,
			ja = 14.266
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
				arg_221_0:Play317102056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1058ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1058ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0, -0.95, -5.88)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1058ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["1058ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect1058ui_story == nil then
				arg_221_1.var_.characterEffect1058ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.2

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect1058ui_story then
					arg_221_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect1058ui_story then
				arg_221_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_224_14 = 0
			local var_224_15 = 1.125

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_16 = arg_221_1:FormatText(StoryNameCfg[92].name)

				arg_221_1.leftNameTxt_.text = var_224_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_17 = arg_221_1:GetWordFromCfg(317102055)
				local var_224_18 = arg_221_1:FormatText(var_224_17.content)

				arg_221_1.text_.text = var_224_18

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_19 = 45
				local var_224_20 = utf8.len(var_224_18)
				local var_224_21 = var_224_19 <= 0 and var_224_15 or var_224_15 * (var_224_20 / var_224_19)

				if var_224_21 > 0 and var_224_15 < var_224_21 then
					arg_221_1.talkMaxDuration = var_224_21

					if var_224_21 + var_224_14 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_21 + var_224_14
					end
				end

				arg_221_1.text_.text = var_224_18
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102055", "story_v_out_317102.awb") ~= 0 then
					local var_224_22 = manager.audio:GetVoiceLength("story_v_out_317102", "317102055", "story_v_out_317102.awb") / 1000

					if var_224_22 + var_224_14 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_22 + var_224_14
					end

					if var_224_17.prefab_name ~= "" and arg_221_1.actors_[var_224_17.prefab_name] ~= nil then
						local var_224_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_17.prefab_name].transform, "story_v_out_317102", "317102055", "story_v_out_317102.awb")

						arg_221_1:RecordAudio("317102055", var_224_23)
						arg_221_1:RecordAudio("317102055", var_224_23)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_317102", "317102055", "story_v_out_317102.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_317102", "317102055", "story_v_out_317102.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_24 = math.max(var_224_15, arg_221_1.talkMaxDuration)

			if var_224_14 <= arg_221_1.time_ and arg_221_1.time_ < var_224_14 + var_224_24 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_14) / var_224_24

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_14 + var_224_24 and arg_221_1.time_ < var_224_14 + var_224_24 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play317102056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 317102056
		arg_225_1.duration_ = 2.333

		local var_225_0 = {
			zh = 0.999999999999,
			ja = 2.333
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
				arg_225_0:Play317102057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1058ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1058ui_story == nil then
				arg_225_1.var_.characterEffect1058ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.2

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1058ui_story then
					local var_228_4 = Mathf.Lerp(0, 0.5, var_228_3)

					arg_225_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1058ui_story.fillRatio = var_228_4
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1058ui_story then
				local var_228_5 = 0.5

				arg_225_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1058ui_story.fillRatio = var_228_5
			end

			local var_228_6 = 0
			local var_228_7 = 0.125

			if var_228_6 < arg_225_1.time_ and arg_225_1.time_ <= var_228_6 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_8 = arg_225_1:FormatText(StoryNameCfg[93].name)

				arg_225_1.leftNameTxt_.text = var_228_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, true)
				arg_225_1.iconController_:SetSelectedState("hero")

				arg_225_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_9 = arg_225_1:GetWordFromCfg(317102056)
				local var_228_10 = arg_225_1:FormatText(var_228_9.content)

				arg_225_1.text_.text = var_228_10

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_11 = 5
				local var_228_12 = utf8.len(var_228_10)
				local var_228_13 = var_228_11 <= 0 and var_228_7 or var_228_7 * (var_228_12 / var_228_11)

				if var_228_13 > 0 and var_228_7 < var_228_13 then
					arg_225_1.talkMaxDuration = var_228_13

					if var_228_13 + var_228_6 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_13 + var_228_6
					end
				end

				arg_225_1.text_.text = var_228_10
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317102", "317102056", "story_v_out_317102.awb") ~= 0 then
					local var_228_14 = manager.audio:GetVoiceLength("story_v_out_317102", "317102056", "story_v_out_317102.awb") / 1000

					if var_228_14 + var_228_6 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_14 + var_228_6
					end

					if var_228_9.prefab_name ~= "" and arg_225_1.actors_[var_228_9.prefab_name] ~= nil then
						local var_228_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_9.prefab_name].transform, "story_v_out_317102", "317102056", "story_v_out_317102.awb")

						arg_225_1:RecordAudio("317102056", var_228_15)
						arg_225_1:RecordAudio("317102056", var_228_15)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_317102", "317102056", "story_v_out_317102.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_317102", "317102056", "story_v_out_317102.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_16 = math.max(var_228_7, arg_225_1.talkMaxDuration)

			if var_228_6 <= arg_225_1.time_ and arg_225_1.time_ < var_228_6 + var_228_16 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_6) / var_228_16

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_6 + var_228_16 and arg_225_1.time_ < var_228_6 + var_228_16 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play317102057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 317102057
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
			arg_229_1.auto_ = false
		end

		function arg_229_1.playNext_(arg_231_0)
			arg_229_1.onStoryFinished_()
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1058ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1058ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, 100, 0)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1058ui_story, var_232_4, var_232_3)

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

			local var_232_9 = 0
			local var_232_10 = 0.775

			if var_232_9 < arg_229_1.time_ and arg_229_1.time_ <= var_232_9 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_11 = arg_229_1:GetWordFromCfg(317102057)
				local var_232_12 = arg_229_1:FormatText(var_232_11.content)

				arg_229_1.text_.text = var_232_12

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_13 = 31
				local var_232_14 = utf8.len(var_232_12)
				local var_232_15 = var_232_13 <= 0 and var_232_10 or var_232_10 * (var_232_14 / var_232_13)

				if var_232_15 > 0 and var_232_10 < var_232_15 then
					arg_229_1.talkMaxDuration = var_232_15

					if var_232_15 + var_232_9 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_15 + var_232_9
					end
				end

				arg_229_1.text_.text = var_232_12
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_16 = math.max(var_232_10, arg_229_1.talkMaxDuration)

			if var_232_9 <= arg_229_1.time_ and arg_229_1.time_ < var_232_9 + var_232_16 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_9) / var_232_16

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_9 + var_232_16 and arg_229_1.time_ < var_232_9 + var_232_16 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K09f"
	},
	voices = {
		"story_v_out_317102.awb"
	}
}
