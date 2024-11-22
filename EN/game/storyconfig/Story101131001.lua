return {
	Play113101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 113101001
		arg_1_1.duration_ = 6.665999999999

		local var_1_0 = {
			ja = 5.499999999999,
			ko = 6.665999999999,
			zh = 6.299999999999,
			en = 6.099999999999
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
				arg_1_0:Play113101002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F03"

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
				local var_4_5 = arg_1_1.bgs_.F03

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
					if iter_4_0 ~= "F03" then
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

			local var_4_22 = "1041ui_story"

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

			local var_4_26 = arg_1_1.actors_["1041ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1041ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(-0.7, -1.11, -5.9)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1041ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = 1.8

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_4_37 = arg_1_1.actors_["1041ui_story"]
			local var_4_38 = 1.799999999999

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1041ui_story == nil then
				arg_1_1.var_.characterEffect1041ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.2

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1041ui_story then
					arg_1_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1041ui_story then
				arg_1_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_4_41 = 0
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 1.999999999999
			local var_4_46 = 0.800000000001

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			local var_4_49 = 1.999999999999
			local var_4_50 = 0.55

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_51 = arg_1_1:FormatText(StoryNameCfg[208].name)

				arg_1_1.leftNameTxt_.text = var_4_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_52 = arg_1_1:GetWordFromCfg(113101001)
				local var_4_53 = arg_1_1:FormatText(var_4_52.content)

				arg_1_1.text_.text = var_4_53

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_54 = 22
				local var_4_55 = utf8.len(var_4_53)
				local var_4_56 = var_4_54 <= 0 and var_4_50 or var_4_50 * (var_4_55 / var_4_54)

				if var_4_56 > 0 and var_4_50 < var_4_56 then
					arg_1_1.talkMaxDuration = var_4_56

					if var_4_56 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_56 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_53
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101001", "story_v_out_113101.awb") ~= 0 then
					local var_4_57 = manager.audio:GetVoiceLength("story_v_out_113101", "113101001", "story_v_out_113101.awb") / 1000

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end

					if var_4_52.prefab_name ~= "" and arg_1_1.actors_[var_4_52.prefab_name] ~= nil then
						local var_4_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_52.prefab_name].transform, "story_v_out_113101", "113101001", "story_v_out_113101.awb")

						arg_1_1:RecordAudio("113101001", var_4_58)
						arg_1_1:RecordAudio("113101001", var_4_58)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_113101", "113101001", "story_v_out_113101.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_113101", "113101001", "story_v_out_113101.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_59 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_49 <= arg_1_1.time_ and arg_1_1.time_ < var_4_49 + var_4_59 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_49) / var_4_59

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_49 + var_4_59 and arg_1_1.time_ < var_4_49 + var_4_59 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play113101002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 113101002
		arg_5_1.duration_ = 7.366

		local var_5_0 = {
			ja = 6.133,
			ko = 7.366,
			zh = 7.266,
			en = 7.066
		}
		local var_5_1 = manager.audio:GetLocalizationFlag()

		if var_5_0[var_5_1] ~= nil then
			arg_5_1.duration_ = var_5_0[var_5_1]
		end

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play113101003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "1084ui_story"

			if arg_5_1.actors_[var_8_0] == nil then
				local var_8_1 = Object.Instantiate(Asset.Load("Char/" .. var_8_0), arg_5_1.stage_.transform)

				var_8_1.name = var_8_0
				var_8_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.actors_[var_8_0] = var_8_1

				local var_8_2 = var_8_1:GetComponentInChildren(typeof(CharacterEffect))

				var_8_2.enabled = true

				local var_8_3 = GameObjectTools.GetOrAddComponent(var_8_1, typeof(DynamicBoneHelper))

				if var_8_3 then
					var_8_3:EnableDynamicBone(false)
				end

				arg_5_1:ShowWeapon(var_8_2.transform, false)

				arg_5_1.var_[var_8_0 .. "Animator"] = var_8_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_5_1.var_[var_8_0 .. "Animator"].applyRootMotion = true
				arg_5_1.var_[var_8_0 .. "LipSync"] = var_8_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_8_4 = arg_5_1.actors_["1084ui_story"].transform
			local var_8_5 = 1.00008890058234e-12

			if var_8_5 < arg_5_1.time_ and arg_5_1.time_ <= var_8_5 + arg_8_0 then
				arg_5_1.var_.moveOldPos1084ui_story = var_8_4.localPosition
			end

			local var_8_6 = 0.001

			if var_8_5 <= arg_5_1.time_ and arg_5_1.time_ < var_8_5 + var_8_6 then
				local var_8_7 = (arg_5_1.time_ - var_8_5) / var_8_6
				local var_8_8 = Vector3.New(0.7, -0.97, -6)

				var_8_4.localPosition = Vector3.Lerp(arg_5_1.var_.moveOldPos1084ui_story, var_8_8, var_8_7)

				local var_8_9 = manager.ui.mainCamera.transform.position - var_8_4.position

				var_8_4.forward = Vector3.New(var_8_9.x, var_8_9.y, var_8_9.z)

				local var_8_10 = var_8_4.localEulerAngles

				var_8_10.z = 0
				var_8_10.x = 0
				var_8_4.localEulerAngles = var_8_10
			end

			if arg_5_1.time_ >= var_8_5 + var_8_6 and arg_5_1.time_ < var_8_5 + var_8_6 + arg_8_0 then
				var_8_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_8_11 = manager.ui.mainCamera.transform.position - var_8_4.position

				var_8_4.forward = Vector3.New(var_8_11.x, var_8_11.y, var_8_11.z)

				local var_8_12 = var_8_4.localEulerAngles

				var_8_12.z = 0
				var_8_12.x = 0
				var_8_4.localEulerAngles = var_8_12
			end

			local var_8_13 = 1.00008890058234e-12

			if var_8_13 < arg_5_1.time_ and arg_5_1.time_ <= var_8_13 + arg_8_0 then
				arg_5_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_8_14 = 1.00008890058234e-12

			if var_8_14 < arg_5_1.time_ and arg_5_1.time_ <= var_8_14 + arg_8_0 then
				arg_5_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_8_15 = arg_5_1.actors_["1084ui_story"]
			local var_8_16 = 0

			if var_8_16 < arg_5_1.time_ and arg_5_1.time_ <= var_8_16 + arg_8_0 and arg_5_1.var_.characterEffect1084ui_story == nil then
				arg_5_1.var_.characterEffect1084ui_story = var_8_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_17 = 0.2

			if var_8_16 <= arg_5_1.time_ and arg_5_1.time_ < var_8_16 + var_8_17 then
				local var_8_18 = (arg_5_1.time_ - var_8_16) / var_8_17

				if arg_5_1.var_.characterEffect1084ui_story then
					arg_5_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_5_1.time_ >= var_8_16 + var_8_17 and arg_5_1.time_ < var_8_16 + var_8_17 + arg_8_0 and arg_5_1.var_.characterEffect1084ui_story then
				arg_5_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_8_19 = arg_5_1.actors_["1041ui_story"]
			local var_8_20 = 0

			if var_8_20 < arg_5_1.time_ and arg_5_1.time_ <= var_8_20 + arg_8_0 and arg_5_1.var_.characterEffect1041ui_story == nil then
				arg_5_1.var_.characterEffect1041ui_story = var_8_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_21 = 0.2

			if var_8_20 <= arg_5_1.time_ and arg_5_1.time_ < var_8_20 + var_8_21 then
				local var_8_22 = (arg_5_1.time_ - var_8_20) / var_8_21

				if arg_5_1.var_.characterEffect1041ui_story then
					local var_8_23 = Mathf.Lerp(0, 0.5, var_8_22)

					arg_5_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_5_1.var_.characterEffect1041ui_story.fillRatio = var_8_23
				end
			end

			if arg_5_1.time_ >= var_8_20 + var_8_21 and arg_5_1.time_ < var_8_20 + var_8_21 + arg_8_0 and arg_5_1.var_.characterEffect1041ui_story then
				local var_8_24 = 0.5

				arg_5_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_5_1.var_.characterEffect1041ui_story.fillRatio = var_8_24
			end

			local var_8_25 = 0
			local var_8_26 = 0.725

			if var_8_25 < arg_5_1.time_ and arg_5_1.time_ <= var_8_25 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, true)

				local var_8_27 = arg_5_1:FormatText(StoryNameCfg[6].name)

				arg_5_1.leftNameTxt_.text = var_8_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_1.leftNameTxt_.transform)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1.leftNameTxt_.text)
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_28 = arg_5_1:GetWordFromCfg(113101002)
				local var_8_29 = arg_5_1:FormatText(var_8_28.content)

				arg_5_1.text_.text = var_8_29

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_30 = 29
				local var_8_31 = utf8.len(var_8_29)
				local var_8_32 = var_8_30 <= 0 and var_8_26 or var_8_26 * (var_8_31 / var_8_30)

				if var_8_32 > 0 and var_8_26 < var_8_32 then
					arg_5_1.talkMaxDuration = var_8_32

					if var_8_32 + var_8_25 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_32 + var_8_25
					end
				end

				arg_5_1.text_.text = var_8_29
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101002", "story_v_out_113101.awb") ~= 0 then
					local var_8_33 = manager.audio:GetVoiceLength("story_v_out_113101", "113101002", "story_v_out_113101.awb") / 1000

					if var_8_33 + var_8_25 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_33 + var_8_25
					end

					if var_8_28.prefab_name ~= "" and arg_5_1.actors_[var_8_28.prefab_name] ~= nil then
						local var_8_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_5_1.actors_[var_8_28.prefab_name].transform, "story_v_out_113101", "113101002", "story_v_out_113101.awb")

						arg_5_1:RecordAudio("113101002", var_8_34)
						arg_5_1:RecordAudio("113101002", var_8_34)
					else
						arg_5_1:AudioAction("play", "voice", "story_v_out_113101", "113101002", "story_v_out_113101.awb")
					end

					arg_5_1:RecordHistoryTalkVoice("story_v_out_113101", "113101002", "story_v_out_113101.awb")
				end

				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_35 = math.max(var_8_26, arg_5_1.talkMaxDuration)

			if var_8_25 <= arg_5_1.time_ and arg_5_1.time_ < var_8_25 + var_8_35 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_25) / var_8_35

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_25 + var_8_35 and arg_5_1.time_ < var_8_25 + var_8_35 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play113101003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 113101003
		arg_9_1.duration_ = 2.766

		local var_9_0 = {
			ja = 2.766,
			ko = 2.333,
			zh = 2,
			en = 2.433
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
				arg_9_0:Play113101004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 1.00008890058234e-12

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_12_1 = arg_9_1.actors_["1041ui_story"]
			local var_12_2 = 0

			if var_12_2 < arg_9_1.time_ and arg_9_1.time_ <= var_12_2 + arg_12_0 and arg_9_1.var_.characterEffect1041ui_story == nil then
				arg_9_1.var_.characterEffect1041ui_story = var_12_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_3 = 0.2

			if var_12_2 <= arg_9_1.time_ and arg_9_1.time_ < var_12_2 + var_12_3 then
				local var_12_4 = (arg_9_1.time_ - var_12_2) / var_12_3

				if arg_9_1.var_.characterEffect1041ui_story then
					arg_9_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_2 + var_12_3 and arg_9_1.time_ < var_12_2 + var_12_3 + arg_12_0 and arg_9_1.var_.characterEffect1041ui_story then
				arg_9_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_12_5 = arg_9_1.actors_["1084ui_story"]
			local var_12_6 = 0

			if var_12_6 < arg_9_1.time_ and arg_9_1.time_ <= var_12_6 + arg_12_0 and arg_9_1.var_.characterEffect1084ui_story == nil then
				arg_9_1.var_.characterEffect1084ui_story = var_12_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_7 = 0.2

			if var_12_6 <= arg_9_1.time_ and arg_9_1.time_ < var_12_6 + var_12_7 then
				local var_12_8 = (arg_9_1.time_ - var_12_6) / var_12_7

				if arg_9_1.var_.characterEffect1084ui_story then
					local var_12_9 = Mathf.Lerp(0, 0.5, var_12_8)

					arg_9_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_9_1.var_.characterEffect1084ui_story.fillRatio = var_12_9
				end
			end

			if arg_9_1.time_ >= var_12_6 + var_12_7 and arg_9_1.time_ < var_12_6 + var_12_7 + arg_12_0 and arg_9_1.var_.characterEffect1084ui_story then
				local var_12_10 = 0.5

				arg_9_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_9_1.var_.characterEffect1084ui_story.fillRatio = var_12_10
			end

			local var_12_11 = 0
			local var_12_12 = 0.2

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_13 = arg_9_1:FormatText(StoryNameCfg[208].name)

				arg_9_1.leftNameTxt_.text = var_12_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_14 = arg_9_1:GetWordFromCfg(113101003)
				local var_12_15 = arg_9_1:FormatText(var_12_14.content)

				arg_9_1.text_.text = var_12_15

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_16 = 8
				local var_12_17 = utf8.len(var_12_15)
				local var_12_18 = var_12_16 <= 0 and var_12_12 or var_12_12 * (var_12_17 / var_12_16)

				if var_12_18 > 0 and var_12_12 < var_12_18 then
					arg_9_1.talkMaxDuration = var_12_18

					if var_12_18 + var_12_11 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_18 + var_12_11
					end
				end

				arg_9_1.text_.text = var_12_15
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101003", "story_v_out_113101.awb") ~= 0 then
					local var_12_19 = manager.audio:GetVoiceLength("story_v_out_113101", "113101003", "story_v_out_113101.awb") / 1000

					if var_12_19 + var_12_11 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_19 + var_12_11
					end

					if var_12_14.prefab_name ~= "" and arg_9_1.actors_[var_12_14.prefab_name] ~= nil then
						local var_12_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_14.prefab_name].transform, "story_v_out_113101", "113101003", "story_v_out_113101.awb")

						arg_9_1:RecordAudio("113101003", var_12_20)
						arg_9_1:RecordAudio("113101003", var_12_20)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_113101", "113101003", "story_v_out_113101.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_113101", "113101003", "story_v_out_113101.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_21 = math.max(var_12_12, arg_9_1.talkMaxDuration)

			if var_12_11 <= arg_9_1.time_ and arg_9_1.time_ < var_12_11 + var_12_21 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_11) / var_12_21

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_11 + var_12_21 and arg_9_1.time_ < var_12_11 + var_12_21 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play113101004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 113101004
		arg_13_1.duration_ = 8.833

		local var_13_0 = {
			ja = 8.833,
			ko = 4.666,
			zh = 4.666,
			en = 5.9
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
				arg_13_0:Play113101005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1084ui_story"].transform
			local var_16_1 = 1.00008890058234e-12

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos1084ui_story = var_16_0.localPosition
			end

			local var_16_2 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2
				local var_16_4 = Vector3.New(0, 100, 0)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1084ui_story, var_16_4, var_16_3)

				local var_16_5 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_5.x, var_16_5.y, var_16_5.z)

				local var_16_6 = var_16_0.localEulerAngles

				var_16_6.z = 0
				var_16_6.x = 0
				var_16_0.localEulerAngles = var_16_6
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 then
				var_16_0.localPosition = Vector3.New(0, 100, 0)

				local var_16_7 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_7.x, var_16_7.y, var_16_7.z)

				local var_16_8 = var_16_0.localEulerAngles

				var_16_8.z = 0
				var_16_8.x = 0
				var_16_0.localEulerAngles = var_16_8
			end

			local var_16_9 = "1042ui_story"

			if arg_13_1.actors_[var_16_9] == nil then
				local var_16_10 = Object.Instantiate(Asset.Load("Char/" .. var_16_9), arg_13_1.stage_.transform)

				var_16_10.name = var_16_9
				var_16_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_13_1.actors_[var_16_9] = var_16_10

				local var_16_11 = var_16_10:GetComponentInChildren(typeof(CharacterEffect))

				var_16_11.enabled = true

				local var_16_12 = GameObjectTools.GetOrAddComponent(var_16_10, typeof(DynamicBoneHelper))

				if var_16_12 then
					var_16_12:EnableDynamicBone(false)
				end

				arg_13_1:ShowWeapon(var_16_11.transform, false)

				arg_13_1.var_[var_16_9 .. "Animator"] = var_16_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_13_1.var_[var_16_9 .. "Animator"].applyRootMotion = true
				arg_13_1.var_[var_16_9 .. "LipSync"] = var_16_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_16_13 = arg_13_1.actors_["1042ui_story"].transform
			local var_16_14 = 1.00008890058234e-12

			if var_16_14 < arg_13_1.time_ and arg_13_1.time_ <= var_16_14 + arg_16_0 then
				arg_13_1.var_.moveOldPos1042ui_story = var_16_13.localPosition
			end

			local var_16_15 = 0.001

			if var_16_14 <= arg_13_1.time_ and arg_13_1.time_ < var_16_14 + var_16_15 then
				local var_16_16 = (arg_13_1.time_ - var_16_14) / var_16_15
				local var_16_17 = Vector3.New(0.7, -1.06, -6.2)

				var_16_13.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1042ui_story, var_16_17, var_16_16)

				local var_16_18 = manager.ui.mainCamera.transform.position - var_16_13.position

				var_16_13.forward = Vector3.New(var_16_18.x, var_16_18.y, var_16_18.z)

				local var_16_19 = var_16_13.localEulerAngles

				var_16_19.z = 0
				var_16_19.x = 0
				var_16_13.localEulerAngles = var_16_19
			end

			if arg_13_1.time_ >= var_16_14 + var_16_15 and arg_13_1.time_ < var_16_14 + var_16_15 + arg_16_0 then
				var_16_13.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_16_20 = manager.ui.mainCamera.transform.position - var_16_13.position

				var_16_13.forward = Vector3.New(var_16_20.x, var_16_20.y, var_16_20.z)

				local var_16_21 = var_16_13.localEulerAngles

				var_16_21.z = 0
				var_16_21.x = 0
				var_16_13.localEulerAngles = var_16_21
			end

			local var_16_22 = 1.00008890058234e-12

			if var_16_22 < arg_13_1.time_ and arg_13_1.time_ <= var_16_22 + arg_16_0 then
				arg_13_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_16_23 = 1.00008890058234e-12

			if var_16_23 < arg_13_1.time_ and arg_13_1.time_ <= var_16_23 + arg_16_0 then
				arg_13_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_16_24 = arg_13_1.actors_["1042ui_story"]
			local var_16_25 = 0

			if var_16_25 < arg_13_1.time_ and arg_13_1.time_ <= var_16_25 + arg_16_0 and arg_13_1.var_.characterEffect1042ui_story == nil then
				arg_13_1.var_.characterEffect1042ui_story = var_16_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_26 = 0.2

			if var_16_25 <= arg_13_1.time_ and arg_13_1.time_ < var_16_25 + var_16_26 then
				local var_16_27 = (arg_13_1.time_ - var_16_25) / var_16_26

				if arg_13_1.var_.characterEffect1042ui_story then
					arg_13_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_25 + var_16_26 and arg_13_1.time_ < var_16_25 + var_16_26 + arg_16_0 and arg_13_1.var_.characterEffect1042ui_story then
				arg_13_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_16_28 = arg_13_1.actors_["1041ui_story"]
			local var_16_29 = 0

			if var_16_29 < arg_13_1.time_ and arg_13_1.time_ <= var_16_29 + arg_16_0 and arg_13_1.var_.characterEffect1041ui_story == nil then
				arg_13_1.var_.characterEffect1041ui_story = var_16_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_30 = 0.2

			if var_16_29 <= arg_13_1.time_ and arg_13_1.time_ < var_16_29 + var_16_30 then
				local var_16_31 = (arg_13_1.time_ - var_16_29) / var_16_30

				if arg_13_1.var_.characterEffect1041ui_story then
					local var_16_32 = Mathf.Lerp(0, 0.5, var_16_31)

					arg_13_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_13_1.var_.characterEffect1041ui_story.fillRatio = var_16_32
				end
			end

			if arg_13_1.time_ >= var_16_29 + var_16_30 and arg_13_1.time_ < var_16_29 + var_16_30 + arg_16_0 and arg_13_1.var_.characterEffect1041ui_story then
				local var_16_33 = 0.5

				arg_13_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_13_1.var_.characterEffect1041ui_story.fillRatio = var_16_33
			end

			local var_16_34 = 0
			local var_16_35 = 0.6

			if var_16_34 < arg_13_1.time_ and arg_13_1.time_ <= var_16_34 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_36 = arg_13_1:FormatText(StoryNameCfg[205].name)

				arg_13_1.leftNameTxt_.text = var_16_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_37 = arg_13_1:GetWordFromCfg(113101004)
				local var_16_38 = arg_13_1:FormatText(var_16_37.content)

				arg_13_1.text_.text = var_16_38

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_39 = 24
				local var_16_40 = utf8.len(var_16_38)
				local var_16_41 = var_16_39 <= 0 and var_16_35 or var_16_35 * (var_16_40 / var_16_39)

				if var_16_41 > 0 and var_16_35 < var_16_41 then
					arg_13_1.talkMaxDuration = var_16_41

					if var_16_41 + var_16_34 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_41 + var_16_34
					end
				end

				arg_13_1.text_.text = var_16_38
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101004", "story_v_out_113101.awb") ~= 0 then
					local var_16_42 = manager.audio:GetVoiceLength("story_v_out_113101", "113101004", "story_v_out_113101.awb") / 1000

					if var_16_42 + var_16_34 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_42 + var_16_34
					end

					if var_16_37.prefab_name ~= "" and arg_13_1.actors_[var_16_37.prefab_name] ~= nil then
						local var_16_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_37.prefab_name].transform, "story_v_out_113101", "113101004", "story_v_out_113101.awb")

						arg_13_1:RecordAudio("113101004", var_16_43)
						arg_13_1:RecordAudio("113101004", var_16_43)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_113101", "113101004", "story_v_out_113101.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_113101", "113101004", "story_v_out_113101.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_44 = math.max(var_16_35, arg_13_1.talkMaxDuration)

			if var_16_34 <= arg_13_1.time_ and arg_13_1.time_ < var_16_34 + var_16_44 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_34) / var_16_44

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_34 + var_16_44 and arg_13_1.time_ < var_16_34 + var_16_44 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play113101005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 113101005
		arg_17_1.duration_ = 5.866

		local var_17_0 = {
			ja = 4.666,
			ko = 5.366,
			zh = 4.366,
			en = 5.866
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
				arg_17_0:Play113101006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1042ui_story"].transform
			local var_20_1 = 1.00008890058234e-12

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1.var_.moveOldPos1042ui_story = var_20_0.localPosition
			end

			local var_20_2 = 0.001

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2
				local var_20_4 = Vector3.New(0, 100, 0)

				var_20_0.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1042ui_story, var_20_4, var_20_3)

				local var_20_5 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_5.x, var_20_5.y, var_20_5.z)

				local var_20_6 = var_20_0.localEulerAngles

				var_20_6.z = 0
				var_20_6.x = 0
				var_20_0.localEulerAngles = var_20_6
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 then
				var_20_0.localPosition = Vector3.New(0, 100, 0)

				local var_20_7 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_7.x, var_20_7.y, var_20_7.z)

				local var_20_8 = var_20_0.localEulerAngles

				var_20_8.z = 0
				var_20_8.x = 0
				var_20_0.localEulerAngles = var_20_8
			end

			local var_20_9 = arg_17_1.actors_["1084ui_story"].transform
			local var_20_10 = 1.00008890058234e-12

			if var_20_10 < arg_17_1.time_ and arg_17_1.time_ <= var_20_10 + arg_20_0 then
				arg_17_1.var_.moveOldPos1084ui_story = var_20_9.localPosition
			end

			local var_20_11 = 0.001

			if var_20_10 <= arg_17_1.time_ and arg_17_1.time_ < var_20_10 + var_20_11 then
				local var_20_12 = (arg_17_1.time_ - var_20_10) / var_20_11
				local var_20_13 = Vector3.New(0.7, -0.97, -6)

				var_20_9.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1084ui_story, var_20_13, var_20_12)

				local var_20_14 = manager.ui.mainCamera.transform.position - var_20_9.position

				var_20_9.forward = Vector3.New(var_20_14.x, var_20_14.y, var_20_14.z)

				local var_20_15 = var_20_9.localEulerAngles

				var_20_15.z = 0
				var_20_15.x = 0
				var_20_9.localEulerAngles = var_20_15
			end

			if arg_17_1.time_ >= var_20_10 + var_20_11 and arg_17_1.time_ < var_20_10 + var_20_11 + arg_20_0 then
				var_20_9.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_20_16 = manager.ui.mainCamera.transform.position - var_20_9.position

				var_20_9.forward = Vector3.New(var_20_16.x, var_20_16.y, var_20_16.z)

				local var_20_17 = var_20_9.localEulerAngles

				var_20_17.z = 0
				var_20_17.x = 0
				var_20_9.localEulerAngles = var_20_17
			end

			local var_20_18 = 1.00008890058234e-12

			if var_20_18 < arg_17_1.time_ and arg_17_1.time_ <= var_20_18 + arg_20_0 then
				arg_17_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_20_19 = 0

			if var_20_19 < arg_17_1.time_ and arg_17_1.time_ <= var_20_19 + arg_20_0 then
				arg_17_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_20_20 = arg_17_1.actors_["1084ui_story"]
			local var_20_21 = 0

			if var_20_21 < arg_17_1.time_ and arg_17_1.time_ <= var_20_21 + arg_20_0 and arg_17_1.var_.characterEffect1084ui_story == nil then
				arg_17_1.var_.characterEffect1084ui_story = var_20_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_22 = 0.2

			if var_20_21 <= arg_17_1.time_ and arg_17_1.time_ < var_20_21 + var_20_22 then
				local var_20_23 = (arg_17_1.time_ - var_20_21) / var_20_22

				if arg_17_1.var_.characterEffect1084ui_story then
					arg_17_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_17_1.time_ >= var_20_21 + var_20_22 and arg_17_1.time_ < var_20_21 + var_20_22 + arg_20_0 and arg_17_1.var_.characterEffect1084ui_story then
				arg_17_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_20_24 = 0
			local var_20_25 = 0.625

			if var_20_24 < arg_17_1.time_ and arg_17_1.time_ <= var_20_24 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_26 = arg_17_1:FormatText(StoryNameCfg[6].name)

				arg_17_1.leftNameTxt_.text = var_20_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_27 = arg_17_1:GetWordFromCfg(113101005)
				local var_20_28 = arg_17_1:FormatText(var_20_27.content)

				arg_17_1.text_.text = var_20_28

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_29 = 25
				local var_20_30 = utf8.len(var_20_28)
				local var_20_31 = var_20_29 <= 0 and var_20_25 or var_20_25 * (var_20_30 / var_20_29)

				if var_20_31 > 0 and var_20_25 < var_20_31 then
					arg_17_1.talkMaxDuration = var_20_31

					if var_20_31 + var_20_24 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_31 + var_20_24
					end
				end

				arg_17_1.text_.text = var_20_28
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101005", "story_v_out_113101.awb") ~= 0 then
					local var_20_32 = manager.audio:GetVoiceLength("story_v_out_113101", "113101005", "story_v_out_113101.awb") / 1000

					if var_20_32 + var_20_24 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_32 + var_20_24
					end

					if var_20_27.prefab_name ~= "" and arg_17_1.actors_[var_20_27.prefab_name] ~= nil then
						local var_20_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_27.prefab_name].transform, "story_v_out_113101", "113101005", "story_v_out_113101.awb")

						arg_17_1:RecordAudio("113101005", var_20_33)
						arg_17_1:RecordAudio("113101005", var_20_33)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_113101", "113101005", "story_v_out_113101.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_113101", "113101005", "story_v_out_113101.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_34 = math.max(var_20_25, arg_17_1.talkMaxDuration)

			if var_20_24 <= arg_17_1.time_ and arg_17_1.time_ < var_20_24 + var_20_34 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_24) / var_20_34

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_24 + var_20_34 and arg_17_1.time_ < var_20_24 + var_20_34 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play113101006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 113101006
		arg_21_1.duration_ = 2

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play113101007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1084ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and arg_21_1.var_.characterEffect1084ui_story == nil then
				arg_21_1.var_.characterEffect1084ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.2

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect1084ui_story then
					local var_24_4 = Mathf.Lerp(0, 0.5, var_24_3)

					arg_21_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_21_1.var_.characterEffect1084ui_story.fillRatio = var_24_4
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and arg_21_1.var_.characterEffect1084ui_story then
				local var_24_5 = 0.5

				arg_21_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_21_1.var_.characterEffect1084ui_story.fillRatio = var_24_5
			end

			local var_24_6 = 1.00008890058234e-12

			if var_24_6 < arg_21_1.time_ and arg_21_1.time_ <= var_24_6 + arg_24_0 then
				arg_21_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_24_7 = arg_21_1.actors_["1041ui_story"]
			local var_24_8 = 0

			if var_24_8 < arg_21_1.time_ and arg_21_1.time_ <= var_24_8 + arg_24_0 and arg_21_1.var_.characterEffect1041ui_story == nil then
				arg_21_1.var_.characterEffect1041ui_story = var_24_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_9 = 0.2

			if var_24_8 <= arg_21_1.time_ and arg_21_1.time_ < var_24_8 + var_24_9 then
				local var_24_10 = (arg_21_1.time_ - var_24_8) / var_24_9

				if arg_21_1.var_.characterEffect1041ui_story then
					arg_21_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_8 + var_24_9 and arg_21_1.time_ < var_24_8 + var_24_9 + arg_24_0 and arg_21_1.var_.characterEffect1041ui_story then
				arg_21_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_24_11 = 0
			local var_24_12 = 0.05

			if var_24_11 < arg_21_1.time_ and arg_21_1.time_ <= var_24_11 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_13 = arg_21_1:FormatText(StoryNameCfg[208].name)

				arg_21_1.leftNameTxt_.text = var_24_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_14 = arg_21_1:GetWordFromCfg(113101006)
				local var_24_15 = arg_21_1:FormatText(var_24_14.content)

				arg_21_1.text_.text = var_24_15

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_16 = 2
				local var_24_17 = utf8.len(var_24_15)
				local var_24_18 = var_24_16 <= 0 and var_24_12 or var_24_12 * (var_24_17 / var_24_16)

				if var_24_18 > 0 and var_24_12 < var_24_18 then
					arg_21_1.talkMaxDuration = var_24_18

					if var_24_18 + var_24_11 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_18 + var_24_11
					end
				end

				arg_21_1.text_.text = var_24_15
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101006", "story_v_out_113101.awb") ~= 0 then
					local var_24_19 = manager.audio:GetVoiceLength("story_v_out_113101", "113101006", "story_v_out_113101.awb") / 1000

					if var_24_19 + var_24_11 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_19 + var_24_11
					end

					if var_24_14.prefab_name ~= "" and arg_21_1.actors_[var_24_14.prefab_name] ~= nil then
						local var_24_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_14.prefab_name].transform, "story_v_out_113101", "113101006", "story_v_out_113101.awb")

						arg_21_1:RecordAudio("113101006", var_24_20)
						arg_21_1:RecordAudio("113101006", var_24_20)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_113101", "113101006", "story_v_out_113101.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_113101", "113101006", "story_v_out_113101.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_21 = math.max(var_24_12, arg_21_1.talkMaxDuration)

			if var_24_11 <= arg_21_1.time_ and arg_21_1.time_ < var_24_11 + var_24_21 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_11) / var_24_21

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_11 + var_24_21 and arg_21_1.time_ < var_24_11 + var_24_21 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play113101007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 113101007
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play113101008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1041ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos1041ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0, 100, 0)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1041ui_story, var_28_4, var_28_3)

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

			local var_28_9 = arg_25_1.actors_["1084ui_story"].transform
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 then
				arg_25_1.var_.moveOldPos1084ui_story = var_28_9.localPosition
			end

			local var_28_11 = 0.001

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11
				local var_28_13 = Vector3.New(0, 100, 0)

				var_28_9.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1084ui_story, var_28_13, var_28_12)

				local var_28_14 = manager.ui.mainCamera.transform.position - var_28_9.position

				var_28_9.forward = Vector3.New(var_28_14.x, var_28_14.y, var_28_14.z)

				local var_28_15 = var_28_9.localEulerAngles

				var_28_15.z = 0
				var_28_15.x = 0
				var_28_9.localEulerAngles = var_28_15
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 then
				var_28_9.localPosition = Vector3.New(0, 100, 0)

				local var_28_16 = manager.ui.mainCamera.transform.position - var_28_9.position

				var_28_9.forward = Vector3.New(var_28_16.x, var_28_16.y, var_28_16.z)

				local var_28_17 = var_28_9.localEulerAngles

				var_28_17.z = 0
				var_28_17.x = 0
				var_28_9.localEulerAngles = var_28_17
			end

			local var_28_18 = 0
			local var_28_19 = 0.7

			if var_28_18 < arg_25_1.time_ and arg_25_1.time_ <= var_28_18 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_20 = arg_25_1:GetWordFromCfg(113101007)
				local var_28_21 = arg_25_1:FormatText(var_28_20.content)

				arg_25_1.text_.text = var_28_21

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_22 = 28
				local var_28_23 = utf8.len(var_28_21)
				local var_28_24 = var_28_22 <= 0 and var_28_19 or var_28_19 * (var_28_23 / var_28_22)

				if var_28_24 > 0 and var_28_19 < var_28_24 then
					arg_25_1.talkMaxDuration = var_28_24

					if var_28_24 + var_28_18 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_24 + var_28_18
					end
				end

				arg_25_1.text_.text = var_28_21
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_25 = math.max(var_28_19, arg_25_1.talkMaxDuration)

			if var_28_18 <= arg_25_1.time_ and arg_25_1.time_ < var_28_18 + var_28_25 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_18) / var_28_25

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_18 + var_28_25 and arg_25_1.time_ < var_28_18 + var_28_25 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play113101008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 113101008
		arg_29_1.duration_ = 2.633

		local var_29_0 = {
			ja = 2.633,
			ko = 2.633,
			zh = 2.2,
			en = 2.566
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
				arg_29_0:Play113101009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1041ui_story"].transform
			local var_32_1 = 1.00008890058234e-12

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos1041ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1041ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = 1.00008890058234e-12

			if var_32_9 < arg_29_1.time_ and arg_29_1.time_ <= var_32_9 + arg_32_0 then
				arg_29_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_32_10 = 1.00008890058234e-12

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 then
				arg_29_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_32_11 = arg_29_1.actors_["1041ui_story"]
			local var_32_12 = 0

			if var_32_12 < arg_29_1.time_ and arg_29_1.time_ <= var_32_12 + arg_32_0 and arg_29_1.var_.characterEffect1041ui_story == nil then
				arg_29_1.var_.characterEffect1041ui_story = var_32_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_13 = 0.2

			if var_32_12 <= arg_29_1.time_ and arg_29_1.time_ < var_32_12 + var_32_13 then
				local var_32_14 = (arg_29_1.time_ - var_32_12) / var_32_13

				if arg_29_1.var_.characterEffect1041ui_story then
					arg_29_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_12 + var_32_13 and arg_29_1.time_ < var_32_12 + var_32_13 + arg_32_0 and arg_29_1.var_.characterEffect1041ui_story then
				arg_29_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_32_15 = 0
			local var_32_16 = 0.3

			if var_32_15 < arg_29_1.time_ and arg_29_1.time_ <= var_32_15 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_17 = arg_29_1:FormatText(StoryNameCfg[208].name)

				arg_29_1.leftNameTxt_.text = var_32_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_18 = arg_29_1:GetWordFromCfg(113101008)
				local var_32_19 = arg_29_1:FormatText(var_32_18.content)

				arg_29_1.text_.text = var_32_19

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_20 = 12
				local var_32_21 = utf8.len(var_32_19)
				local var_32_22 = var_32_20 <= 0 and var_32_16 or var_32_16 * (var_32_21 / var_32_20)

				if var_32_22 > 0 and var_32_16 < var_32_22 then
					arg_29_1.talkMaxDuration = var_32_22

					if var_32_22 + var_32_15 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_22 + var_32_15
					end
				end

				arg_29_1.text_.text = var_32_19
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101008", "story_v_out_113101.awb") ~= 0 then
					local var_32_23 = manager.audio:GetVoiceLength("story_v_out_113101", "113101008", "story_v_out_113101.awb") / 1000

					if var_32_23 + var_32_15 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_23 + var_32_15
					end

					if var_32_18.prefab_name ~= "" and arg_29_1.actors_[var_32_18.prefab_name] ~= nil then
						local var_32_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_18.prefab_name].transform, "story_v_out_113101", "113101008", "story_v_out_113101.awb")

						arg_29_1:RecordAudio("113101008", var_32_24)
						arg_29_1:RecordAudio("113101008", var_32_24)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_113101", "113101008", "story_v_out_113101.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_113101", "113101008", "story_v_out_113101.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_25 = math.max(var_32_16, arg_29_1.talkMaxDuration)

			if var_32_15 <= arg_29_1.time_ and arg_29_1.time_ < var_32_15 + var_32_25 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_15) / var_32_25

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_15 + var_32_25 and arg_29_1.time_ < var_32_15 + var_32_25 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play113101009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 113101009
		arg_33_1.duration_ = 5.5

		local var_33_0 = {
			ja = 4.066,
			ko = 5.5,
			zh = 3.5,
			en = 2
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
				arg_33_0:Play113101010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1084ui_story"].transform
			local var_36_1 = 1.00008890058234e-12

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1084ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0.7, -0.97, -6)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1084ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = 0

			if var_36_9 < arg_33_1.time_ and arg_33_1.time_ <= var_36_9 + arg_36_0 then
				arg_33_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_36_10 = 1.00008890058234e-12

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				arg_33_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_36_11 = arg_33_1.actors_["1084ui_story"]
			local var_36_12 = 0

			if var_36_12 < arg_33_1.time_ and arg_33_1.time_ <= var_36_12 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story == nil then
				arg_33_1.var_.characterEffect1084ui_story = var_36_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_13 = 0.2

			if var_36_12 <= arg_33_1.time_ and arg_33_1.time_ < var_36_12 + var_36_13 then
				local var_36_14 = (arg_33_1.time_ - var_36_12) / var_36_13

				if arg_33_1.var_.characterEffect1084ui_story then
					arg_33_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_12 + var_36_13 and arg_33_1.time_ < var_36_12 + var_36_13 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story then
				arg_33_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_36_15 = arg_33_1.actors_["1041ui_story"]
			local var_36_16 = 0

			if var_36_16 < arg_33_1.time_ and arg_33_1.time_ <= var_36_16 + arg_36_0 and arg_33_1.var_.characterEffect1041ui_story == nil then
				arg_33_1.var_.characterEffect1041ui_story = var_36_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_17 = 0.2

			if var_36_16 <= arg_33_1.time_ and arg_33_1.time_ < var_36_16 + var_36_17 then
				local var_36_18 = (arg_33_1.time_ - var_36_16) / var_36_17

				if arg_33_1.var_.characterEffect1041ui_story then
					local var_36_19 = Mathf.Lerp(0, 0.5, var_36_18)

					arg_33_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1041ui_story.fillRatio = var_36_19
				end
			end

			if arg_33_1.time_ >= var_36_16 + var_36_17 and arg_33_1.time_ < var_36_16 + var_36_17 + arg_36_0 and arg_33_1.var_.characterEffect1041ui_story then
				local var_36_20 = 0.5

				arg_33_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1041ui_story.fillRatio = var_36_20
			end

			local var_36_21 = 0
			local var_36_22 = 0.45

			if var_36_21 < arg_33_1.time_ and arg_33_1.time_ <= var_36_21 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_23 = arg_33_1:FormatText(StoryNameCfg[6].name)

				arg_33_1.leftNameTxt_.text = var_36_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_24 = arg_33_1:GetWordFromCfg(113101009)
				local var_36_25 = arg_33_1:FormatText(var_36_24.content)

				arg_33_1.text_.text = var_36_25

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_26 = 18
				local var_36_27 = utf8.len(var_36_25)
				local var_36_28 = var_36_26 <= 0 and var_36_22 or var_36_22 * (var_36_27 / var_36_26)

				if var_36_28 > 0 and var_36_22 < var_36_28 then
					arg_33_1.talkMaxDuration = var_36_28

					if var_36_28 + var_36_21 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_28 + var_36_21
					end
				end

				arg_33_1.text_.text = var_36_25
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101009", "story_v_out_113101.awb") ~= 0 then
					local var_36_29 = manager.audio:GetVoiceLength("story_v_out_113101", "113101009", "story_v_out_113101.awb") / 1000

					if var_36_29 + var_36_21 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_29 + var_36_21
					end

					if var_36_24.prefab_name ~= "" and arg_33_1.actors_[var_36_24.prefab_name] ~= nil then
						local var_36_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_24.prefab_name].transform, "story_v_out_113101", "113101009", "story_v_out_113101.awb")

						arg_33_1:RecordAudio("113101009", var_36_30)
						arg_33_1:RecordAudio("113101009", var_36_30)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_113101", "113101009", "story_v_out_113101.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_113101", "113101009", "story_v_out_113101.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_31 = math.max(var_36_22, arg_33_1.talkMaxDuration)

			if var_36_21 <= arg_33_1.time_ and arg_33_1.time_ < var_36_21 + var_36_31 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_21) / var_36_31

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_21 + var_36_31 and arg_33_1.time_ < var_36_21 + var_36_31 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play113101010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 113101010
		arg_37_1.duration_ = 7.066

		local var_37_0 = {
			ja = 7.066,
			ko = 5.966,
			zh = 6.433,
			en = 6.533
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
				arg_37_0:Play113101011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1084ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1084ui_story then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1084ui_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1084ui_story.fillRatio = var_40_5
			end

			local var_40_6 = arg_37_1.actors_["1041ui_story"]
			local var_40_7 = 0

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 and arg_37_1.var_.characterEffect1041ui_story == nil then
				arg_37_1.var_.characterEffect1041ui_story = var_40_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_8 = 0.2

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_8 then
				local var_40_9 = (arg_37_1.time_ - var_40_7) / var_40_8

				if arg_37_1.var_.characterEffect1041ui_story then
					arg_37_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_7 + var_40_8 and arg_37_1.time_ < var_40_7 + var_40_8 + arg_40_0 and arg_37_1.var_.characterEffect1041ui_story then
				arg_37_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 then
				arg_37_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_40_11 = 0

			if var_40_11 < arg_37_1.time_ and arg_37_1.time_ <= var_40_11 + arg_40_0 then
				arg_37_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action3_1")
			end

			local var_40_12 = 0
			local var_40_13 = 0.825

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_14 = arg_37_1:FormatText(StoryNameCfg[208].name)

				arg_37_1.leftNameTxt_.text = var_40_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_15 = arg_37_1:GetWordFromCfg(113101010)
				local var_40_16 = arg_37_1:FormatText(var_40_15.content)

				arg_37_1.text_.text = var_40_16

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_17 = 33
				local var_40_18 = utf8.len(var_40_16)
				local var_40_19 = var_40_17 <= 0 and var_40_13 or var_40_13 * (var_40_18 / var_40_17)

				if var_40_19 > 0 and var_40_13 < var_40_19 then
					arg_37_1.talkMaxDuration = var_40_19

					if var_40_19 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_19 + var_40_12
					end
				end

				arg_37_1.text_.text = var_40_16
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101010", "story_v_out_113101.awb") ~= 0 then
					local var_40_20 = manager.audio:GetVoiceLength("story_v_out_113101", "113101010", "story_v_out_113101.awb") / 1000

					if var_40_20 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_20 + var_40_12
					end

					if var_40_15.prefab_name ~= "" and arg_37_1.actors_[var_40_15.prefab_name] ~= nil then
						local var_40_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_15.prefab_name].transform, "story_v_out_113101", "113101010", "story_v_out_113101.awb")

						arg_37_1:RecordAudio("113101010", var_40_21)
						arg_37_1:RecordAudio("113101010", var_40_21)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_113101", "113101010", "story_v_out_113101.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_113101", "113101010", "story_v_out_113101.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_22 = math.max(var_40_13, arg_37_1.talkMaxDuration)

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_22 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_12) / var_40_22

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_12 + var_40_22 and arg_37_1.time_ < var_40_12 + var_40_22 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play113101011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 113101011
		arg_41_1.duration_ = 5.333

		local var_41_0 = {
			ja = 4.1,
			ko = 4.2,
			zh = 3.133,
			en = 5.333
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
				arg_41_0:Play113101012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1041ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1041ui_story == nil then
				arg_41_1.var_.characterEffect1041ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1041ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1041ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1041ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1041ui_story.fillRatio = var_44_5
			end

			local var_44_6 = arg_41_1.actors_["1084ui_story"]
			local var_44_7 = 0

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 and arg_41_1.var_.characterEffect1084ui_story == nil then
				arg_41_1.var_.characterEffect1084ui_story = var_44_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_8 = 0.2

			if var_44_7 <= arg_41_1.time_ and arg_41_1.time_ < var_44_7 + var_44_8 then
				local var_44_9 = (arg_41_1.time_ - var_44_7) / var_44_8

				if arg_41_1.var_.characterEffect1084ui_story then
					arg_41_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_7 + var_44_8 and arg_41_1.time_ < var_44_7 + var_44_8 + arg_44_0 and arg_41_1.var_.characterEffect1084ui_story then
				arg_41_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_44_10 = 1.00008890058234e-12

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 then
				arg_41_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_44_11 = 0
			local var_44_12 = 0.425

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_13 = arg_41_1:FormatText(StoryNameCfg[6].name)

				arg_41_1.leftNameTxt_.text = var_44_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_14 = arg_41_1:GetWordFromCfg(113101011)
				local var_44_15 = arg_41_1:FormatText(var_44_14.content)

				arg_41_1.text_.text = var_44_15

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_16 = 17
				local var_44_17 = utf8.len(var_44_15)
				local var_44_18 = var_44_16 <= 0 and var_44_12 or var_44_12 * (var_44_17 / var_44_16)

				if var_44_18 > 0 and var_44_12 < var_44_18 then
					arg_41_1.talkMaxDuration = var_44_18

					if var_44_18 + var_44_11 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_18 + var_44_11
					end
				end

				arg_41_1.text_.text = var_44_15
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101011", "story_v_out_113101.awb") ~= 0 then
					local var_44_19 = manager.audio:GetVoiceLength("story_v_out_113101", "113101011", "story_v_out_113101.awb") / 1000

					if var_44_19 + var_44_11 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_19 + var_44_11
					end

					if var_44_14.prefab_name ~= "" and arg_41_1.actors_[var_44_14.prefab_name] ~= nil then
						local var_44_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_14.prefab_name].transform, "story_v_out_113101", "113101011", "story_v_out_113101.awb")

						arg_41_1:RecordAudio("113101011", var_44_20)
						arg_41_1:RecordAudio("113101011", var_44_20)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_113101", "113101011", "story_v_out_113101.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_113101", "113101011", "story_v_out_113101.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_21 = math.max(var_44_12, arg_41_1.talkMaxDuration)

			if var_44_11 <= arg_41_1.time_ and arg_41_1.time_ < var_44_11 + var_44_21 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_11) / var_44_21

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_11 + var_44_21 and arg_41_1.time_ < var_44_11 + var_44_21 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play113101012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 113101012
		arg_45_1.duration_ = 8.966

		local var_45_0 = {
			ja = 8.966,
			ko = 6.233,
			zh = 5.633,
			en = 4.966
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
				arg_45_0:Play113101013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1041ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1041ui_story == nil then
				arg_45_1.var_.characterEffect1041ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.2

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1041ui_story then
					arg_45_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1041ui_story then
				arg_45_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_48_4 = arg_45_1.actors_["1084ui_story"]
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 and arg_45_1.var_.characterEffect1084ui_story == nil then
				arg_45_1.var_.characterEffect1084ui_story = var_48_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_6 = 0.2

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6

				if arg_45_1.var_.characterEffect1084ui_story then
					local var_48_8 = Mathf.Lerp(0, 0.5, var_48_7)

					arg_45_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1084ui_story.fillRatio = var_48_8
				end
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 and arg_45_1.var_.characterEffect1084ui_story then
				local var_48_9 = 0.5

				arg_45_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1084ui_story.fillRatio = var_48_9
			end

			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 then
				arg_45_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action3_2")
			end

			local var_48_11 = 0

			if var_48_11 < arg_45_1.time_ and arg_45_1.time_ <= var_48_11 + arg_48_0 then
				arg_45_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_48_12 = 0
			local var_48_13 = 0.775

			if var_48_12 < arg_45_1.time_ and arg_45_1.time_ <= var_48_12 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_14 = arg_45_1:FormatText(StoryNameCfg[208].name)

				arg_45_1.leftNameTxt_.text = var_48_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_15 = arg_45_1:GetWordFromCfg(113101012)
				local var_48_16 = arg_45_1:FormatText(var_48_15.content)

				arg_45_1.text_.text = var_48_16

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_17 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101012", "story_v_out_113101.awb") ~= 0 then
					local var_48_20 = manager.audio:GetVoiceLength("story_v_out_113101", "113101012", "story_v_out_113101.awb") / 1000

					if var_48_20 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_20 + var_48_12
					end

					if var_48_15.prefab_name ~= "" and arg_45_1.actors_[var_48_15.prefab_name] ~= nil then
						local var_48_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_15.prefab_name].transform, "story_v_out_113101", "113101012", "story_v_out_113101.awb")

						arg_45_1:RecordAudio("113101012", var_48_21)
						arg_45_1:RecordAudio("113101012", var_48_21)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_113101", "113101012", "story_v_out_113101.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_113101", "113101012", "story_v_out_113101.awb")
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
	Play113101013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 113101013
		arg_49_1.duration_ = 9.1

		local var_49_0 = {
			ja = 9.1,
			ko = 8.6,
			zh = 8.933,
			en = 6.733
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
				arg_49_0:Play113101014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_52_1 = 0
			local var_52_2 = 1.1

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_3 = arg_49_1:FormatText(StoryNameCfg[208].name)

				arg_49_1.leftNameTxt_.text = var_52_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_4 = arg_49_1:GetWordFromCfg(113101013)
				local var_52_5 = arg_49_1:FormatText(var_52_4.content)

				arg_49_1.text_.text = var_52_5

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_6 = 44
				local var_52_7 = utf8.len(var_52_5)
				local var_52_8 = var_52_6 <= 0 and var_52_2 or var_52_2 * (var_52_7 / var_52_6)

				if var_52_8 > 0 and var_52_2 < var_52_8 then
					arg_49_1.talkMaxDuration = var_52_8

					if var_52_8 + var_52_1 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_8 + var_52_1
					end
				end

				arg_49_1.text_.text = var_52_5
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101013", "story_v_out_113101.awb") ~= 0 then
					local var_52_9 = manager.audio:GetVoiceLength("story_v_out_113101", "113101013", "story_v_out_113101.awb") / 1000

					if var_52_9 + var_52_1 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_9 + var_52_1
					end

					if var_52_4.prefab_name ~= "" and arg_49_1.actors_[var_52_4.prefab_name] ~= nil then
						local var_52_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_4.prefab_name].transform, "story_v_out_113101", "113101013", "story_v_out_113101.awb")

						arg_49_1:RecordAudio("113101013", var_52_10)
						arg_49_1:RecordAudio("113101013", var_52_10)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_113101", "113101013", "story_v_out_113101.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_113101", "113101013", "story_v_out_113101.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_11 = math.max(var_52_2, arg_49_1.talkMaxDuration)

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_11 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_1) / var_52_11

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_1 + var_52_11 and arg_49_1.time_ < var_52_1 + var_52_11 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play113101014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 113101014
		arg_53_1.duration_ = 4.033

		local var_53_0 = {
			ja = 4.033,
			ko = 3.1,
			zh = 3.566,
			en = 3.233
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
				arg_53_0:Play113101015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1042ui_story"].transform
			local var_56_1 = 1.00008890058234e-12

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos1042ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0.7, -1.06, -6.2)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1042ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = 1.00008890058234e-12

			if var_56_9 < arg_53_1.time_ and arg_53_1.time_ <= var_56_9 + arg_56_0 then
				arg_53_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_56_10 = 1.00008890058234e-12

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 then
				arg_53_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_56_11 = arg_53_1.actors_["1042ui_story"]
			local var_56_12 = 0

			if var_56_12 < arg_53_1.time_ and arg_53_1.time_ <= var_56_12 + arg_56_0 and arg_53_1.var_.characterEffect1042ui_story == nil then
				arg_53_1.var_.characterEffect1042ui_story = var_56_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_13 = 0.2

			if var_56_12 <= arg_53_1.time_ and arg_53_1.time_ < var_56_12 + var_56_13 then
				local var_56_14 = (arg_53_1.time_ - var_56_12) / var_56_13

				if arg_53_1.var_.characterEffect1042ui_story then
					arg_53_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_12 + var_56_13 and arg_53_1.time_ < var_56_12 + var_56_13 + arg_56_0 and arg_53_1.var_.characterEffect1042ui_story then
				arg_53_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_56_15 = arg_53_1.actors_["1041ui_story"]
			local var_56_16 = 0

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 and arg_53_1.var_.characterEffect1041ui_story == nil then
				arg_53_1.var_.characterEffect1041ui_story = var_56_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_17 = 0.2

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_17 then
				local var_56_18 = (arg_53_1.time_ - var_56_16) / var_56_17

				if arg_53_1.var_.characterEffect1041ui_story then
					local var_56_19 = Mathf.Lerp(0, 0.5, var_56_18)

					arg_53_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1041ui_story.fillRatio = var_56_19
				end
			end

			if arg_53_1.time_ >= var_56_16 + var_56_17 and arg_53_1.time_ < var_56_16 + var_56_17 + arg_56_0 and arg_53_1.var_.characterEffect1041ui_story then
				local var_56_20 = 0.5

				arg_53_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1041ui_story.fillRatio = var_56_20
			end

			local var_56_21 = arg_53_1.actors_["1084ui_story"].transform
			local var_56_22 = 1.00008890058234e-12

			if var_56_22 < arg_53_1.time_ and arg_53_1.time_ <= var_56_22 + arg_56_0 then
				arg_53_1.var_.moveOldPos1084ui_story = var_56_21.localPosition
			end

			local var_56_23 = 0.001

			if var_56_22 <= arg_53_1.time_ and arg_53_1.time_ < var_56_22 + var_56_23 then
				local var_56_24 = (arg_53_1.time_ - var_56_22) / var_56_23
				local var_56_25 = Vector3.New(0, 100, 0)

				var_56_21.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1084ui_story, var_56_25, var_56_24)

				local var_56_26 = manager.ui.mainCamera.transform.position - var_56_21.position

				var_56_21.forward = Vector3.New(var_56_26.x, var_56_26.y, var_56_26.z)

				local var_56_27 = var_56_21.localEulerAngles

				var_56_27.z = 0
				var_56_27.x = 0
				var_56_21.localEulerAngles = var_56_27
			end

			if arg_53_1.time_ >= var_56_22 + var_56_23 and arg_53_1.time_ < var_56_22 + var_56_23 + arg_56_0 then
				var_56_21.localPosition = Vector3.New(0, 100, 0)

				local var_56_28 = manager.ui.mainCamera.transform.position - var_56_21.position

				var_56_21.forward = Vector3.New(var_56_28.x, var_56_28.y, var_56_28.z)

				local var_56_29 = var_56_21.localEulerAngles

				var_56_29.z = 0
				var_56_29.x = 0
				var_56_21.localEulerAngles = var_56_29
			end

			local var_56_30 = 0
			local var_56_31 = 0.35

			if var_56_30 < arg_53_1.time_ and arg_53_1.time_ <= var_56_30 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_32 = arg_53_1:FormatText(StoryNameCfg[205].name)

				arg_53_1.leftNameTxt_.text = var_56_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_33 = arg_53_1:GetWordFromCfg(113101014)
				local var_56_34 = arg_53_1:FormatText(var_56_33.content)

				arg_53_1.text_.text = var_56_34

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_35 = 14
				local var_56_36 = utf8.len(var_56_34)
				local var_56_37 = var_56_35 <= 0 and var_56_31 or var_56_31 * (var_56_36 / var_56_35)

				if var_56_37 > 0 and var_56_31 < var_56_37 then
					arg_53_1.talkMaxDuration = var_56_37

					if var_56_37 + var_56_30 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_37 + var_56_30
					end
				end

				arg_53_1.text_.text = var_56_34
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101014", "story_v_out_113101.awb") ~= 0 then
					local var_56_38 = manager.audio:GetVoiceLength("story_v_out_113101", "113101014", "story_v_out_113101.awb") / 1000

					if var_56_38 + var_56_30 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_38 + var_56_30
					end

					if var_56_33.prefab_name ~= "" and arg_53_1.actors_[var_56_33.prefab_name] ~= nil then
						local var_56_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_33.prefab_name].transform, "story_v_out_113101", "113101014", "story_v_out_113101.awb")

						arg_53_1:RecordAudio("113101014", var_56_39)
						arg_53_1:RecordAudio("113101014", var_56_39)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_113101", "113101014", "story_v_out_113101.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_113101", "113101014", "story_v_out_113101.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_40 = math.max(var_56_31, arg_53_1.talkMaxDuration)

			if var_56_30 <= arg_53_1.time_ and arg_53_1.time_ < var_56_30 + var_56_40 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_30) / var_56_40

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_30 + var_56_40 and arg_53_1.time_ < var_56_30 + var_56_40 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play113101015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 113101015
		arg_57_1.duration_ = 2.833

		local var_57_0 = {
			ja = 1.999999999999,
			ko = 2.266,
			zh = 2.833,
			en = 2.566
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
				arg_57_0:Play113101016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1041ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1041ui_story == nil then
				arg_57_1.var_.characterEffect1041ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1041ui_story then
					arg_57_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1041ui_story then
				arg_57_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_60_4 = arg_57_1.actors_["1042ui_story"]
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 and arg_57_1.var_.characterEffect1042ui_story == nil then
				arg_57_1.var_.characterEffect1042ui_story = var_60_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_6 = 0.2

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_6 then
				local var_60_7 = (arg_57_1.time_ - var_60_5) / var_60_6

				if arg_57_1.var_.characterEffect1042ui_story then
					local var_60_8 = Mathf.Lerp(0, 0.5, var_60_7)

					arg_57_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1042ui_story.fillRatio = var_60_8
				end
			end

			if arg_57_1.time_ >= var_60_5 + var_60_6 and arg_57_1.time_ < var_60_5 + var_60_6 + arg_60_0 and arg_57_1.var_.characterEffect1042ui_story then
				local var_60_9 = 0.5

				arg_57_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1042ui_story.fillRatio = var_60_9
			end

			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_60_11 = 0
			local var_60_12 = 0.325

			if var_60_11 < arg_57_1.time_ and arg_57_1.time_ <= var_60_11 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_13 = arg_57_1:FormatText(StoryNameCfg[208].name)

				arg_57_1.leftNameTxt_.text = var_60_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_14 = arg_57_1:GetWordFromCfg(113101015)
				local var_60_15 = arg_57_1:FormatText(var_60_14.content)

				arg_57_1.text_.text = var_60_15

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_16 = 13
				local var_60_17 = utf8.len(var_60_15)
				local var_60_18 = var_60_16 <= 0 and var_60_12 or var_60_12 * (var_60_17 / var_60_16)

				if var_60_18 > 0 and var_60_12 < var_60_18 then
					arg_57_1.talkMaxDuration = var_60_18

					if var_60_18 + var_60_11 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_18 + var_60_11
					end
				end

				arg_57_1.text_.text = var_60_15
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101015", "story_v_out_113101.awb") ~= 0 then
					local var_60_19 = manager.audio:GetVoiceLength("story_v_out_113101", "113101015", "story_v_out_113101.awb") / 1000

					if var_60_19 + var_60_11 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_19 + var_60_11
					end

					if var_60_14.prefab_name ~= "" and arg_57_1.actors_[var_60_14.prefab_name] ~= nil then
						local var_60_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_14.prefab_name].transform, "story_v_out_113101", "113101015", "story_v_out_113101.awb")

						arg_57_1:RecordAudio("113101015", var_60_20)
						arg_57_1:RecordAudio("113101015", var_60_20)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_113101", "113101015", "story_v_out_113101.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_113101", "113101015", "story_v_out_113101.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_21 = math.max(var_60_12, arg_57_1.talkMaxDuration)

			if var_60_11 <= arg_57_1.time_ and arg_57_1.time_ < var_60_11 + var_60_21 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_11) / var_60_21

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_11 + var_60_21 and arg_57_1.time_ < var_60_11 + var_60_21 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play113101016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 113101016
		arg_61_1.duration_ = 7.166

		local var_61_0 = {
			ja = 7.166,
			ko = 4.066,
			zh = 3.8,
			en = 4.466
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
				arg_61_0:Play113101017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action7_1")
			end

			local var_64_2 = 0
			local var_64_3 = 0.475

			if var_64_2 < arg_61_1.time_ and arg_61_1.time_ <= var_64_2 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_4 = arg_61_1:FormatText(StoryNameCfg[208].name)

				arg_61_1.leftNameTxt_.text = var_64_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_5 = arg_61_1:GetWordFromCfg(113101016)
				local var_64_6 = arg_61_1:FormatText(var_64_5.content)

				arg_61_1.text_.text = var_64_6

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_7 = 19
				local var_64_8 = utf8.len(var_64_6)
				local var_64_9 = var_64_7 <= 0 and var_64_3 or var_64_3 * (var_64_8 / var_64_7)

				if var_64_9 > 0 and var_64_3 < var_64_9 then
					arg_61_1.talkMaxDuration = var_64_9

					if var_64_9 + var_64_2 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_9 + var_64_2
					end
				end

				arg_61_1.text_.text = var_64_6
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101016", "story_v_out_113101.awb") ~= 0 then
					local var_64_10 = manager.audio:GetVoiceLength("story_v_out_113101", "113101016", "story_v_out_113101.awb") / 1000

					if var_64_10 + var_64_2 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_10 + var_64_2
					end

					if var_64_5.prefab_name ~= "" and arg_61_1.actors_[var_64_5.prefab_name] ~= nil then
						local var_64_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_5.prefab_name].transform, "story_v_out_113101", "113101016", "story_v_out_113101.awb")

						arg_61_1:RecordAudio("113101016", var_64_11)
						arg_61_1:RecordAudio("113101016", var_64_11)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_113101", "113101016", "story_v_out_113101.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_113101", "113101016", "story_v_out_113101.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_12 = math.max(var_64_3, arg_61_1.talkMaxDuration)

			if var_64_2 <= arg_61_1.time_ and arg_61_1.time_ < var_64_2 + var_64_12 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_2) / var_64_12

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_2 + var_64_12 and arg_61_1.time_ < var_64_2 + var_64_12 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play113101017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 113101017
		arg_65_1.duration_ = 4.233

		local var_65_0 = {
			ja = 4.233,
			ko = 2.7,
			zh = 2.3,
			en = 2.2
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
				arg_65_0:Play113101018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 1.00008890058234e-12

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_68_1 = 1.00008890058234e-12

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_68_2 = arg_65_1.actors_["1042ui_story"]
			local var_68_3 = 0

			if var_68_3 < arg_65_1.time_ and arg_65_1.time_ <= var_68_3 + arg_68_0 and arg_65_1.var_.characterEffect1042ui_story == nil then
				arg_65_1.var_.characterEffect1042ui_story = var_68_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_4 = 0.2

			if var_68_3 <= arg_65_1.time_ and arg_65_1.time_ < var_68_3 + var_68_4 then
				local var_68_5 = (arg_65_1.time_ - var_68_3) / var_68_4

				if arg_65_1.var_.characterEffect1042ui_story then
					arg_65_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_3 + var_68_4 and arg_65_1.time_ < var_68_3 + var_68_4 + arg_68_0 and arg_65_1.var_.characterEffect1042ui_story then
				arg_65_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_68_6 = arg_65_1.actors_["1041ui_story"]
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 and arg_65_1.var_.characterEffect1041ui_story == nil then
				arg_65_1.var_.characterEffect1041ui_story = var_68_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_8 = 0.2

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8

				if arg_65_1.var_.characterEffect1041ui_story then
					local var_68_10 = Mathf.Lerp(0, 0.5, var_68_9)

					arg_65_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1041ui_story.fillRatio = var_68_10
				end
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 and arg_65_1.var_.characterEffect1041ui_story then
				local var_68_11 = 0.5

				arg_65_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1041ui_story.fillRatio = var_68_11
			end

			local var_68_12 = 0
			local var_68_13 = 0.25

			if var_68_12 < arg_65_1.time_ and arg_65_1.time_ <= var_68_12 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_14 = arg_65_1:FormatText(StoryNameCfg[205].name)

				arg_65_1.leftNameTxt_.text = var_68_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_15 = arg_65_1:GetWordFromCfg(113101017)
				local var_68_16 = arg_65_1:FormatText(var_68_15.content)

				arg_65_1.text_.text = var_68_16

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_17 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101017", "story_v_out_113101.awb") ~= 0 then
					local var_68_20 = manager.audio:GetVoiceLength("story_v_out_113101", "113101017", "story_v_out_113101.awb") / 1000

					if var_68_20 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_20 + var_68_12
					end

					if var_68_15.prefab_name ~= "" and arg_65_1.actors_[var_68_15.prefab_name] ~= nil then
						local var_68_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_15.prefab_name].transform, "story_v_out_113101", "113101017", "story_v_out_113101.awb")

						arg_65_1:RecordAudio("113101017", var_68_21)
						arg_65_1:RecordAudio("113101017", var_68_21)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_113101", "113101017", "story_v_out_113101.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_113101", "113101017", "story_v_out_113101.awb")
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
	Play113101018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 113101018
		arg_69_1.duration_ = 3.1

		local var_69_0 = {
			ja = 2.1,
			ko = 2,
			zh = 2,
			en = 3.1
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
				arg_69_0:Play113101019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1041ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1041ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, 100, 0)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1041ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, 100, 0)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = arg_69_1.actors_["1042ui_story"].transform
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1.var_.moveOldPos1042ui_story = var_72_9.localPosition
			end

			local var_72_11 = 0.001

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11
				local var_72_13 = Vector3.New(0, 100, 0)

				var_72_9.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1042ui_story, var_72_13, var_72_12)

				local var_72_14 = manager.ui.mainCamera.transform.position - var_72_9.position

				var_72_9.forward = Vector3.New(var_72_14.x, var_72_14.y, var_72_14.z)

				local var_72_15 = var_72_9.localEulerAngles

				var_72_15.z = 0
				var_72_15.x = 0
				var_72_9.localEulerAngles = var_72_15
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 then
				var_72_9.localPosition = Vector3.New(0, 100, 0)

				local var_72_16 = manager.ui.mainCamera.transform.position - var_72_9.position

				var_72_9.forward = Vector3.New(var_72_16.x, var_72_16.y, var_72_16.z)

				local var_72_17 = var_72_9.localEulerAngles

				var_72_17.z = 0
				var_72_17.x = 0
				var_72_9.localEulerAngles = var_72_17
			end

			local var_72_18 = arg_69_1.actors_["1084ui_story"].transform
			local var_72_19 = 1.00008890058234e-12

			if var_72_19 < arg_69_1.time_ and arg_69_1.time_ <= var_72_19 + arg_72_0 then
				arg_69_1.var_.moveOldPos1084ui_story = var_72_18.localPosition
			end

			local var_72_20 = 0.001

			if var_72_19 <= arg_69_1.time_ and arg_69_1.time_ < var_72_19 + var_72_20 then
				local var_72_21 = (arg_69_1.time_ - var_72_19) / var_72_20
				local var_72_22 = Vector3.New(0, -0.97, -6)

				var_72_18.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1084ui_story, var_72_22, var_72_21)

				local var_72_23 = manager.ui.mainCamera.transform.position - var_72_18.position

				var_72_18.forward = Vector3.New(var_72_23.x, var_72_23.y, var_72_23.z)

				local var_72_24 = var_72_18.localEulerAngles

				var_72_24.z = 0
				var_72_24.x = 0
				var_72_18.localEulerAngles = var_72_24
			end

			if arg_69_1.time_ >= var_72_19 + var_72_20 and arg_69_1.time_ < var_72_19 + var_72_20 + arg_72_0 then
				var_72_18.localPosition = Vector3.New(0, -0.97, -6)

				local var_72_25 = manager.ui.mainCamera.transform.position - var_72_18.position

				var_72_18.forward = Vector3.New(var_72_25.x, var_72_25.y, var_72_25.z)

				local var_72_26 = var_72_18.localEulerAngles

				var_72_26.z = 0
				var_72_26.x = 0
				var_72_18.localEulerAngles = var_72_26
			end

			local var_72_27 = 1.00008890058234e-12

			if var_72_27 < arg_69_1.time_ and arg_69_1.time_ <= var_72_27 + arg_72_0 then
				arg_69_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_72_28 = 1.00008890058234e-12

			if var_72_28 < arg_69_1.time_ and arg_69_1.time_ <= var_72_28 + arg_72_0 then
				arg_69_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_72_29 = arg_69_1.actors_["1084ui_story"]
			local var_72_30 = 0

			if var_72_30 < arg_69_1.time_ and arg_69_1.time_ <= var_72_30 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_31 = 0.2

			if var_72_30 <= arg_69_1.time_ and arg_69_1.time_ < var_72_30 + var_72_31 then
				local var_72_32 = (arg_69_1.time_ - var_72_30) / var_72_31

				if arg_69_1.var_.characterEffect1084ui_story then
					arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_30 + var_72_31 and arg_69_1.time_ < var_72_30 + var_72_31 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story then
				arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_72_33 = 0
			local var_72_34 = 0.1

			if var_72_33 < arg_69_1.time_ and arg_69_1.time_ <= var_72_33 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_35 = arg_69_1:FormatText(StoryNameCfg[6].name)

				arg_69_1.leftNameTxt_.text = var_72_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_36 = arg_69_1:GetWordFromCfg(113101018)
				local var_72_37 = arg_69_1:FormatText(var_72_36.content)

				arg_69_1.text_.text = var_72_37

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_38 = 4
				local var_72_39 = utf8.len(var_72_37)
				local var_72_40 = var_72_38 <= 0 and var_72_34 or var_72_34 * (var_72_39 / var_72_38)

				if var_72_40 > 0 and var_72_34 < var_72_40 then
					arg_69_1.talkMaxDuration = var_72_40

					if var_72_40 + var_72_33 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_40 + var_72_33
					end
				end

				arg_69_1.text_.text = var_72_37
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101018", "story_v_out_113101.awb") ~= 0 then
					local var_72_41 = manager.audio:GetVoiceLength("story_v_out_113101", "113101018", "story_v_out_113101.awb") / 1000

					if var_72_41 + var_72_33 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_41 + var_72_33
					end

					if var_72_36.prefab_name ~= "" and arg_69_1.actors_[var_72_36.prefab_name] ~= nil then
						local var_72_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_36.prefab_name].transform, "story_v_out_113101", "113101018", "story_v_out_113101.awb")

						arg_69_1:RecordAudio("113101018", var_72_42)
						arg_69_1:RecordAudio("113101018", var_72_42)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_113101", "113101018", "story_v_out_113101.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_113101", "113101018", "story_v_out_113101.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_43 = math.max(var_72_34, arg_69_1.talkMaxDuration)

			if var_72_33 <= arg_69_1.time_ and arg_69_1.time_ < var_72_33 + var_72_43 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_33) / var_72_43

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_33 + var_72_43 and arg_69_1.time_ < var_72_33 + var_72_43 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play113101019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 113101019
		arg_73_1.duration_ = 0.199999999999

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"

			SetActive(arg_73_1.choicesGo_, true)

			for iter_74_0, iter_74_1 in ipairs(arg_73_1.choices_) do
				local var_74_0 = iter_74_0 <= 2

				SetActive(iter_74_1.go, var_74_0)
			end

			arg_73_1.choices_[1].txt.text = arg_73_1:FormatText(StoryChoiceCfg[199].name)
			arg_73_1.choices_[2].txt.text = arg_73_1:FormatText(StoryChoiceCfg[200].name)
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play113101020(arg_73_1)
			end

			if arg_75_0 == 2 then
				arg_73_0:Play113101020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1084ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story == nil then
				arg_73_1.var_.characterEffect1084ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1084ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1084ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1084ui_story.fillRatio = var_76_5
			end
		end
	end,
	Play113101020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 113101020
		arg_77_1.duration_ = 8.666

		local var_77_0 = {
			ja = 8.666,
			ko = 4.666,
			zh = 4.6,
			en = 5.1
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play113101021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1084ui_story"].transform
			local var_80_1 = 1.00008890058234e-12

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos1084ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, 100, 0)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1084ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, 100, 0)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["1041ui_story"].transform
			local var_80_10 = 1.00008890058234e-12

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1.var_.moveOldPos1041ui_story = var_80_9.localPosition
			end

			local var_80_11 = 0.001

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11
				local var_80_13 = Vector3.New(0, -1.11, -5.9)

				var_80_9.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1041ui_story, var_80_13, var_80_12)

				local var_80_14 = manager.ui.mainCamera.transform.position - var_80_9.position

				var_80_9.forward = Vector3.New(var_80_14.x, var_80_14.y, var_80_14.z)

				local var_80_15 = var_80_9.localEulerAngles

				var_80_15.z = 0
				var_80_15.x = 0
				var_80_9.localEulerAngles = var_80_15
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 then
				var_80_9.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_80_16 = manager.ui.mainCamera.transform.position - var_80_9.position

				var_80_9.forward = Vector3.New(var_80_16.x, var_80_16.y, var_80_16.z)

				local var_80_17 = var_80_9.localEulerAngles

				var_80_17.z = 0
				var_80_17.x = 0
				var_80_9.localEulerAngles = var_80_17
			end

			local var_80_18 = 1.00008890058234e-12

			if var_80_18 < arg_77_1.time_ and arg_77_1.time_ <= var_80_18 + arg_80_0 then
				arg_77_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_80_19 = 1.00008890058234e-12

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_80_20 = arg_77_1.actors_["1041ui_story"]
			local var_80_21 = 0

			if var_80_21 < arg_77_1.time_ and arg_77_1.time_ <= var_80_21 + arg_80_0 and arg_77_1.var_.characterEffect1041ui_story == nil then
				arg_77_1.var_.characterEffect1041ui_story = var_80_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_22 = 0.2

			if var_80_21 <= arg_77_1.time_ and arg_77_1.time_ < var_80_21 + var_80_22 then
				local var_80_23 = (arg_77_1.time_ - var_80_21) / var_80_22

				if arg_77_1.var_.characterEffect1041ui_story then
					arg_77_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_21 + var_80_22 and arg_77_1.time_ < var_80_21 + var_80_22 + arg_80_0 and arg_77_1.var_.characterEffect1041ui_story then
				arg_77_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_80_24 = 0
			local var_80_25 = 0.525

			if var_80_24 < arg_77_1.time_ and arg_77_1.time_ <= var_80_24 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_26 = arg_77_1:FormatText(StoryNameCfg[208].name)

				arg_77_1.leftNameTxt_.text = var_80_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_27 = arg_77_1:GetWordFromCfg(113101020)
				local var_80_28 = arg_77_1:FormatText(var_80_27.content)

				arg_77_1.text_.text = var_80_28

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_29 = 21
				local var_80_30 = utf8.len(var_80_28)
				local var_80_31 = var_80_29 <= 0 and var_80_25 or var_80_25 * (var_80_30 / var_80_29)

				if var_80_31 > 0 and var_80_25 < var_80_31 then
					arg_77_1.talkMaxDuration = var_80_31

					if var_80_31 + var_80_24 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_31 + var_80_24
					end
				end

				arg_77_1.text_.text = var_80_28
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113101", "113101020", "story_v_out_113101.awb") ~= 0 then
					local var_80_32 = manager.audio:GetVoiceLength("story_v_out_113101", "113101020", "story_v_out_113101.awb") / 1000

					if var_80_32 + var_80_24 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_32 + var_80_24
					end

					if var_80_27.prefab_name ~= "" and arg_77_1.actors_[var_80_27.prefab_name] ~= nil then
						local var_80_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_27.prefab_name].transform, "story_v_out_113101", "113101020", "story_v_out_113101.awb")

						arg_77_1:RecordAudio("113101020", var_80_33)
						arg_77_1:RecordAudio("113101020", var_80_33)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_113101", "113101020", "story_v_out_113101.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_113101", "113101020", "story_v_out_113101.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_34 = math.max(var_80_25, arg_77_1.talkMaxDuration)

			if var_80_24 <= arg_77_1.time_ and arg_77_1.time_ < var_80_24 + var_80_34 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_24) / var_80_34

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_24 + var_80_34 and arg_77_1.time_ < var_80_24 + var_80_34 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play113101021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 113101021
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
			arg_81_1.auto_ = false
		end

		function arg_81_1.playNext_(arg_83_0)
			arg_81_1.onStoryFinished_()
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1041ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1041ui_story == nil then
				arg_81_1.var_.characterEffect1041ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1041ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1041ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1041ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1041ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0
			local var_84_7 = 0.475

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_8 = arg_81_1:GetWordFromCfg(113101021)
				local var_84_9 = arg_81_1:FormatText(var_84_8.content)

				arg_81_1.text_.text = var_84_9

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_10 = 19
				local var_84_11 = utf8.len(var_84_9)
				local var_84_12 = var_84_10 <= 0 and var_84_7 or var_84_7 * (var_84_11 / var_84_10)

				if var_84_12 > 0 and var_84_7 < var_84_12 then
					arg_81_1.talkMaxDuration = var_84_12

					if var_84_12 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_12 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_9
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_13 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_13 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_13

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_13 and arg_81_1.time_ < var_84_6 + var_84_13 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F03"
	},
	voices = {
		"story_v_out_113101.awb"
	}
}
