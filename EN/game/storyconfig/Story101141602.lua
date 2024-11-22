return {
	Play114162001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114162001
		arg_1_1.duration_ = 5.432999999998

		local var_1_0 = {
			ja = 4.532999999998,
			ko = 5.432999999998,
			zh = 4.765999999998,
			en = 5.332999999998
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
				arg_1_0:Play114162002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F05_1"

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
				local var_4_5 = arg_1_1.bgs_.F05_1

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
					if iter_4_0 ~= "F05_1" then
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

			local var_4_22 = "1038ui_story"

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

			local var_4_26 = arg_1_1.actors_["1038ui_story"].transform
			local var_4_27 = 1.800000000002

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1038ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(-0.7, -1.11, -5.9)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1038ui_story, var_4_30, var_4_29)

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
				arg_1_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action7_1")
			end

			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_4_37 = arg_1_1.actors_["1038ui_story"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1038ui_story == nil then
				arg_1_1.var_.characterEffect1038ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.2

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1038ui_story then
					arg_1_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1038ui_story then
				arg_1_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_4_41 = 2
			local var_4_42 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_1_4_story_surface", "bgm_activity_1_4_story_surface", "bgm_activity_1_4_story_surface.awb")
			end

			local var_4_45 = 0
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 1.999999999998
			local var_4_50 = 0.3

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[94].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(114162001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162001", "story_v_out_114162.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_114162", "114162001", "story_v_out_114162.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_114162", "114162001", "story_v_out_114162.awb")

						arg_1_1:RecordAudio("114162001", var_4_59)
						arg_1_1:RecordAudio("114162001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114162", "114162001", "story_v_out_114162.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114162", "114162001", "story_v_out_114162.awb")
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
	Play114162002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114162002
		arg_7_1.duration_ = 2.833

		local var_7_0 = {
			ja = 2.433,
			ko = 2.4,
			zh = 1.999999999999,
			en = 2.833
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
				arg_7_0:Play114162003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1038ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1038ui_story == nil then
				arg_7_1.var_.characterEffect1038ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1038ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1038ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1038ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1038ui_story.fillRatio = var_10_5
			end

			local var_10_6 = "1184ui_story"

			if arg_7_1.actors_[var_10_6] == nil then
				local var_10_7 = Object.Instantiate(Asset.Load("Char/" .. var_10_6), arg_7_1.stage_.transform)

				var_10_7.name = var_10_6
				var_10_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_6] = var_10_7

				local var_10_8 = var_10_7:GetComponentInChildren(typeof(CharacterEffect))

				var_10_8.enabled = true

				local var_10_9 = GameObjectTools.GetOrAddComponent(var_10_7, typeof(DynamicBoneHelper))

				if var_10_9 then
					var_10_9:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_8.transform, false)

				arg_7_1.var_[var_10_6 .. "Animator"] = var_10_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_6 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_6 .. "LipSync"] = var_10_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_10 = arg_7_1.actors_["1184ui_story"].transform
			local var_10_11 = 1.99973371195483e-12

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.var_.moveOldPos1184ui_story = var_10_10.localPosition

				local var_10_12 = "1184ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_12 .. "Animator"].transform, true)
			end

			local var_10_13 = 0.001

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_13 then
				local var_10_14 = (arg_7_1.time_ - var_10_11) / var_10_13
				local var_10_15 = Vector3.New(0.7, -0.97, -6)

				var_10_10.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1184ui_story, var_10_15, var_10_14)

				local var_10_16 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_16.x, var_10_16.y, var_10_16.z)

				local var_10_17 = var_10_10.localEulerAngles

				var_10_17.z = 0
				var_10_17.x = 0
				var_10_10.localEulerAngles = var_10_17
			end

			if arg_7_1.time_ >= var_10_11 + var_10_13 and arg_7_1.time_ < var_10_11 + var_10_13 + arg_10_0 then
				var_10_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_10_18 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_18.x, var_10_18.y, var_10_18.z)

				local var_10_19 = var_10_10.localEulerAngles

				var_10_19.z = 0
				var_10_19.x = 0
				var_10_10.localEulerAngles = var_10_19
			end

			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				arg_7_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				arg_7_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_10_22 = arg_7_1.actors_["1184ui_story"]
			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 and arg_7_1.var_.characterEffect1184ui_story == nil then
				arg_7_1.var_.characterEffect1184ui_story = var_10_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_24 = 0.2

			if var_10_23 <= arg_7_1.time_ and arg_7_1.time_ < var_10_23 + var_10_24 then
				local var_10_25 = (arg_7_1.time_ - var_10_23) / var_10_24

				if arg_7_1.var_.characterEffect1184ui_story then
					arg_7_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_23 + var_10_24 and arg_7_1.time_ < var_10_23 + var_10_24 + arg_10_0 and arg_7_1.var_.characterEffect1184ui_story then
				arg_7_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_10_26 = 0
			local var_10_27 = 0.225

			if var_10_26 < arg_7_1.time_ and arg_7_1.time_ <= var_10_26 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_28 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_29 = arg_7_1:GetWordFromCfg(114162002)
				local var_10_30 = arg_7_1:FormatText(var_10_29.content)

				arg_7_1.text_.text = var_10_30

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_31 = 9
				local var_10_32 = utf8.len(var_10_30)
				local var_10_33 = var_10_31 <= 0 and var_10_27 or var_10_27 * (var_10_32 / var_10_31)

				if var_10_33 > 0 and var_10_27 < var_10_33 then
					arg_7_1.talkMaxDuration = var_10_33

					if var_10_33 + var_10_26 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_26
					end
				end

				arg_7_1.text_.text = var_10_30
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162002", "story_v_out_114162.awb") ~= 0 then
					local var_10_34 = manager.audio:GetVoiceLength("story_v_out_114162", "114162002", "story_v_out_114162.awb") / 1000

					if var_10_34 + var_10_26 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_34 + var_10_26
					end

					if var_10_29.prefab_name ~= "" and arg_7_1.actors_[var_10_29.prefab_name] ~= nil then
						local var_10_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_29.prefab_name].transform, "story_v_out_114162", "114162002", "story_v_out_114162.awb")

						arg_7_1:RecordAudio("114162002", var_10_35)
						arg_7_1:RecordAudio("114162002", var_10_35)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114162", "114162002", "story_v_out_114162.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114162", "114162002", "story_v_out_114162.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_36 = math.max(var_10_27, arg_7_1.talkMaxDuration)

			if var_10_26 <= arg_7_1.time_ and arg_7_1.time_ < var_10_26 + var_10_36 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_26) / var_10_36

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_26 + var_10_36 and arg_7_1.time_ < var_10_26 + var_10_36 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play114162003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114162003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play114162004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1184ui_story"].transform
			local var_14_1 = 1.99973371195483e-12

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1184ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 100, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1184ui_story, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, 100, 0)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["1038ui_story"].transform
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.var_.moveOldPos1038ui_story = var_14_9.localPosition
			end

			local var_14_11 = 0.001

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11
				local var_14_13 = Vector3.New(0, 100, 0)

				var_14_9.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1038ui_story, var_14_13, var_14_12)

				local var_14_14 = manager.ui.mainCamera.transform.position - var_14_9.position

				var_14_9.forward = Vector3.New(var_14_14.x, var_14_14.y, var_14_14.z)

				local var_14_15 = var_14_9.localEulerAngles

				var_14_15.z = 0
				var_14_15.x = 0
				var_14_9.localEulerAngles = var_14_15
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 then
				var_14_9.localPosition = Vector3.New(0, 100, 0)

				local var_14_16 = manager.ui.mainCamera.transform.position - var_14_9.position

				var_14_9.forward = Vector3.New(var_14_16.x, var_14_16.y, var_14_16.z)

				local var_14_17 = var_14_9.localEulerAngles

				var_14_17.z = 0
				var_14_17.x = 0
				var_14_9.localEulerAngles = var_14_17
			end

			local var_14_18 = 0
			local var_14_19 = 0.65

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_20 = arg_11_1:GetWordFromCfg(114162003)
				local var_14_21 = arg_11_1:FormatText(var_14_20.content)

				arg_11_1.text_.text = var_14_21

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_22 = 26
				local var_14_23 = utf8.len(var_14_21)
				local var_14_24 = var_14_22 <= 0 and var_14_19 or var_14_19 * (var_14_23 / var_14_22)

				if var_14_24 > 0 and var_14_19 < var_14_24 then
					arg_11_1.talkMaxDuration = var_14_24

					if var_14_24 + var_14_18 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_24 + var_14_18
					end
				end

				arg_11_1.text_.text = var_14_21
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_25 = math.max(var_14_19, arg_11_1.talkMaxDuration)

			if var_14_18 <= arg_11_1.time_ and arg_11_1.time_ < var_14_18 + var_14_25 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_18) / var_14_25

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_18 + var_14_25 and arg_11_1.time_ < var_14_18 + var_14_25 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114162004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114162004
		arg_15_1.duration_ = 0.016666666666

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"

			SetActive(arg_15_1.choicesGo_, true)

			for iter_16_0, iter_16_1 in ipairs(arg_15_1.choices_) do
				local var_16_0 = iter_16_0 <= 1

				SetActive(iter_16_1.go, var_16_0)
			end

			arg_15_1.choices_[1].txt.text = arg_15_1:FormatText(StoryChoiceCfg[144].name)
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play114162005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			return
		end
	end,
	Play114162005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114162005
		arg_19_1.duration_ = 5.5

		local var_19_0 = {
			ja = 4.9,
			ko = 5.233,
			zh = 4.1,
			en = 5.5
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
				arg_19_0:Play114162006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1184ui_story"].transform
			local var_22_1 = 1.99973371195483e-12

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1184ui_story = var_22_0.localPosition

				local var_22_2 = "1184ui_story"

				arg_19_1:ShowWeapon(arg_19_1.var_[var_22_2 .. "Animator"].transform, false)
			end

			local var_22_3 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_3 then
				local var_22_4 = (arg_19_1.time_ - var_22_1) / var_22_3
				local var_22_5 = Vector3.New(0, -0.97, -6)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1184ui_story, var_22_5, var_22_4)

				local var_22_6 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_6.x, var_22_6.y, var_22_6.z)

				local var_22_7 = var_22_0.localEulerAngles

				var_22_7.z = 0
				var_22_7.x = 0
				var_22_0.localEulerAngles = var_22_7
			end

			if arg_19_1.time_ >= var_22_1 + var_22_3 and arg_19_1.time_ < var_22_1 + var_22_3 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_22_8 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_8.x, var_22_8.y, var_22_8.z)

				local var_22_9 = var_22_0.localEulerAngles

				var_22_9.z = 0
				var_22_9.x = 0
				var_22_0.localEulerAngles = var_22_9
			end

			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_22_12 = arg_19_1.actors_["1184ui_story"]
			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 and arg_19_1.var_.characterEffect1184ui_story == nil then
				arg_19_1.var_.characterEffect1184ui_story = var_22_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_14 = 0.2

			if var_22_13 <= arg_19_1.time_ and arg_19_1.time_ < var_22_13 + var_22_14 then
				local var_22_15 = (arg_19_1.time_ - var_22_13) / var_22_14

				if arg_19_1.var_.characterEffect1184ui_story then
					arg_19_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_13 + var_22_14 and arg_19_1.time_ < var_22_13 + var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect1184ui_story then
				arg_19_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_22_16 = 0
			local var_22_17 = 0.525

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_18 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_19 = arg_19_1:GetWordFromCfg(114162005)
				local var_22_20 = arg_19_1:FormatText(var_22_19.content)

				arg_19_1.text_.text = var_22_20

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_21 = 21
				local var_22_22 = utf8.len(var_22_20)
				local var_22_23 = var_22_21 <= 0 and var_22_17 or var_22_17 * (var_22_22 / var_22_21)

				if var_22_23 > 0 and var_22_17 < var_22_23 then
					arg_19_1.talkMaxDuration = var_22_23

					if var_22_23 + var_22_16 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_16
					end
				end

				arg_19_1.text_.text = var_22_20
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162005", "story_v_out_114162.awb") ~= 0 then
					local var_22_24 = manager.audio:GetVoiceLength("story_v_out_114162", "114162005", "story_v_out_114162.awb") / 1000

					if var_22_24 + var_22_16 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_24 + var_22_16
					end

					if var_22_19.prefab_name ~= "" and arg_19_1.actors_[var_22_19.prefab_name] ~= nil then
						local var_22_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_19.prefab_name].transform, "story_v_out_114162", "114162005", "story_v_out_114162.awb")

						arg_19_1:RecordAudio("114162005", var_22_25)
						arg_19_1:RecordAudio("114162005", var_22_25)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114162", "114162005", "story_v_out_114162.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114162", "114162005", "story_v_out_114162.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_26 = math.max(var_22_17, arg_19_1.talkMaxDuration)

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_26 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_16) / var_22_26

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_16 + var_22_26 and arg_19_1.time_ < var_22_16 + var_22_26 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114162006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114162006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play114162007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1184ui_story"].transform
			local var_26_1 = 1.99973371195483e-12

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1184ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1184ui_story, var_26_4, var_26_3)

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

			local var_26_9 = 0
			local var_26_10 = 1.1

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_11 = arg_23_1:GetWordFromCfg(114162006)
				local var_26_12 = arg_23_1:FormatText(var_26_11.content)

				arg_23_1.text_.text = var_26_12

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_13 = 44
				local var_26_14 = utf8.len(var_26_12)
				local var_26_15 = var_26_13 <= 0 and var_26_10 or var_26_10 * (var_26_14 / var_26_13)

				if var_26_15 > 0 and var_26_10 < var_26_15 then
					arg_23_1.talkMaxDuration = var_26_15

					if var_26_15 + var_26_9 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_15 + var_26_9
					end
				end

				arg_23_1.text_.text = var_26_12
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_10, arg_23_1.talkMaxDuration)

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_9) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_9 + var_26_16 and arg_23_1.time_ < var_26_9 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play114162007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114162007
		arg_27_1.duration_ = 7.9

		local var_27_0 = {
			ja = 6.8,
			ko = 7.9,
			zh = 7.1,
			en = 4.7
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
				arg_27_0:Play114162008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "10006ui_story"

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

			local var_30_4 = arg_27_1.actors_["10006ui_story"].transform
			local var_30_5 = 1.99973371195483e-12

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos10006ui_story = var_30_4.localPosition

				local var_30_6 = "10006ui_story"

				arg_27_1:ShowWeapon(arg_27_1.var_[var_30_6 .. "Animator"].transform, true)
			end

			local var_30_7 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_7 then
				local var_30_8 = (arg_27_1.time_ - var_30_5) / var_30_7
				local var_30_9 = Vector3.New(-0.7, -0.98, -5.65)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10006ui_story, var_30_9, var_30_8)

				local var_30_10 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_10.x, var_30_10.y, var_30_10.z)

				local var_30_11 = var_30_4.localEulerAngles

				var_30_11.z = 0
				var_30_11.x = 0
				var_30_4.localEulerAngles = var_30_11
			end

			if arg_27_1.time_ >= var_30_5 + var_30_7 and arg_27_1.time_ < var_30_5 + var_30_7 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(-0.7, -0.98, -5.65)

				local var_30_12 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_12.x, var_30_12.y, var_30_12.z)

				local var_30_13 = var_30_4.localEulerAngles

				var_30_13.z = 0
				var_30_13.x = 0
				var_30_4.localEulerAngles = var_30_13
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action5_1")
			end

			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_30_16 = arg_27_1.actors_["10006ui_story"]
			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 and arg_27_1.var_.characterEffect10006ui_story == nil then
				arg_27_1.var_.characterEffect10006ui_story = var_30_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_18 = 0.2

			if var_30_17 <= arg_27_1.time_ and arg_27_1.time_ < var_30_17 + var_30_18 then
				local var_30_19 = (arg_27_1.time_ - var_30_17) / var_30_18

				if arg_27_1.var_.characterEffect10006ui_story then
					arg_27_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_17 + var_30_18 and arg_27_1.time_ < var_30_17 + var_30_18 + arg_30_0 and arg_27_1.var_.characterEffect10006ui_story then
				arg_27_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_30_20 = 0
			local var_30_21 = 0.825

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_22 = arg_27_1:FormatText(StoryNameCfg[212].name)

				arg_27_1.leftNameTxt_.text = var_30_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_23 = arg_27_1:GetWordFromCfg(114162007)
				local var_30_24 = arg_27_1:FormatText(var_30_23.content)

				arg_27_1.text_.text = var_30_24

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_25 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162007", "story_v_out_114162.awb") ~= 0 then
					local var_30_28 = manager.audio:GetVoiceLength("story_v_out_114162", "114162007", "story_v_out_114162.awb") / 1000

					if var_30_28 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_28 + var_30_20
					end

					if var_30_23.prefab_name ~= "" and arg_27_1.actors_[var_30_23.prefab_name] ~= nil then
						local var_30_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_23.prefab_name].transform, "story_v_out_114162", "114162007", "story_v_out_114162.awb")

						arg_27_1:RecordAudio("114162007", var_30_29)
						arg_27_1:RecordAudio("114162007", var_30_29)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114162", "114162007", "story_v_out_114162.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114162", "114162007", "story_v_out_114162.awb")
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
	Play114162008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114162008
		arg_31_1.duration_ = 5.366

		local var_31_0 = {
			ja = 4.166,
			ko = 5.366,
			zh = 4.033,
			en = 4.6
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
				arg_31_0:Play114162009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10006ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10006ui_story == nil then
				arg_31_1.var_.characterEffect10006ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10006ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10006ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10006ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10006ui_story.fillRatio = var_34_5
			end

			local var_34_6 = "1041ui_story"

			if arg_31_1.actors_[var_34_6] == nil then
				local var_34_7 = Object.Instantiate(Asset.Load("Char/" .. var_34_6), arg_31_1.stage_.transform)

				var_34_7.name = var_34_6
				var_34_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_6] = var_34_7

				local var_34_8 = var_34_7:GetComponentInChildren(typeof(CharacterEffect))

				var_34_8.enabled = true

				local var_34_9 = GameObjectTools.GetOrAddComponent(var_34_7, typeof(DynamicBoneHelper))

				if var_34_9 then
					var_34_9:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_8.transform, false)

				arg_31_1.var_[var_34_6 .. "Animator"] = var_34_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_6 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_6 .. "LipSync"] = var_34_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_10 = arg_31_1.actors_["1041ui_story"].transform
			local var_34_11 = 1.99973371195483e-12

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.var_.moveOldPos1041ui_story = var_34_10.localPosition
			end

			local var_34_12 = 0.001

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_12 then
				local var_34_13 = (arg_31_1.time_ - var_34_11) / var_34_12
				local var_34_14 = Vector3.New(0.7, -1.11, -5.9)

				var_34_10.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1041ui_story, var_34_14, var_34_13)

				local var_34_15 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_15.x, var_34_15.y, var_34_15.z)

				local var_34_16 = var_34_10.localEulerAngles

				var_34_16.z = 0
				var_34_16.x = 0
				var_34_10.localEulerAngles = var_34_16
			end

			if arg_31_1.time_ >= var_34_11 + var_34_12 and arg_31_1.time_ < var_34_11 + var_34_12 + arg_34_0 then
				var_34_10.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_34_17 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_17.x, var_34_17.y, var_34_17.z)

				local var_34_18 = var_34_10.localEulerAngles

				var_34_18.z = 0
				var_34_18.x = 0
				var_34_10.localEulerAngles = var_34_18
			end

			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_34_21 = arg_31_1.actors_["1041ui_story"]
			local var_34_22 = 0

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 and arg_31_1.var_.characterEffect1041ui_story == nil then
				arg_31_1.var_.characterEffect1041ui_story = var_34_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_23 = 0.2

			if var_34_22 <= arg_31_1.time_ and arg_31_1.time_ < var_34_22 + var_34_23 then
				local var_34_24 = (arg_31_1.time_ - var_34_22) / var_34_23

				if arg_31_1.var_.characterEffect1041ui_story then
					arg_31_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_22 + var_34_23 and arg_31_1.time_ < var_34_22 + var_34_23 + arg_34_0 and arg_31_1.var_.characterEffect1041ui_story then
				arg_31_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_34_25 = 0
			local var_34_26 = 0.55

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_27 = arg_31_1:FormatText(StoryNameCfg[208].name)

				arg_31_1.leftNameTxt_.text = var_34_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_28 = arg_31_1:GetWordFromCfg(114162008)
				local var_34_29 = arg_31_1:FormatText(var_34_28.content)

				arg_31_1.text_.text = var_34_29

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_30 = 22
				local var_34_31 = utf8.len(var_34_29)
				local var_34_32 = var_34_30 <= 0 and var_34_26 or var_34_26 * (var_34_31 / var_34_30)

				if var_34_32 > 0 and var_34_26 < var_34_32 then
					arg_31_1.talkMaxDuration = var_34_32

					if var_34_32 + var_34_25 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_25
					end
				end

				arg_31_1.text_.text = var_34_29
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162008", "story_v_out_114162.awb") ~= 0 then
					local var_34_33 = manager.audio:GetVoiceLength("story_v_out_114162", "114162008", "story_v_out_114162.awb") / 1000

					if var_34_33 + var_34_25 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_33 + var_34_25
					end

					if var_34_28.prefab_name ~= "" and arg_31_1.actors_[var_34_28.prefab_name] ~= nil then
						local var_34_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_28.prefab_name].transform, "story_v_out_114162", "114162008", "story_v_out_114162.awb")

						arg_31_1:RecordAudio("114162008", var_34_34)
						arg_31_1:RecordAudio("114162008", var_34_34)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114162", "114162008", "story_v_out_114162.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114162", "114162008", "story_v_out_114162.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_35 = math.max(var_34_26, arg_31_1.talkMaxDuration)

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_35 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_25) / var_34_35

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_25 + var_34_35 and arg_31_1.time_ < var_34_25 + var_34_35 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114162009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114162009
		arg_35_1.duration_ = 2.2

		local var_35_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.2,
			en = 1.999999999999
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
				arg_35_0:Play114162010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1041ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1041ui_story == nil then
				arg_35_1.var_.characterEffect1041ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1041ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1041ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1041ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1041ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["10006ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect10006ui_story == nil then
				arg_35_1.var_.characterEffect10006ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.2

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect10006ui_story then
					arg_35_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect10006ui_story then
				arg_35_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action5_2")
			end

			local var_38_12 = 0
			local var_38_13 = 0.175

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_14 = arg_35_1:FormatText(StoryNameCfg[212].name)

				arg_35_1.leftNameTxt_.text = var_38_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_15 = arg_35_1:GetWordFromCfg(114162009)
				local var_38_16 = arg_35_1:FormatText(var_38_15.content)

				arg_35_1.text_.text = var_38_16

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_17 = 7
				local var_38_18 = utf8.len(var_38_16)
				local var_38_19 = var_38_17 <= 0 and var_38_13 or var_38_13 * (var_38_18 / var_38_17)

				if var_38_19 > 0 and var_38_13 < var_38_19 then
					arg_35_1.talkMaxDuration = var_38_19

					if var_38_19 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_12
					end
				end

				arg_35_1.text_.text = var_38_16
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162009", "story_v_out_114162.awb") ~= 0 then
					local var_38_20 = manager.audio:GetVoiceLength("story_v_out_114162", "114162009", "story_v_out_114162.awb") / 1000

					if var_38_20 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_20 + var_38_12
					end

					if var_38_15.prefab_name ~= "" and arg_35_1.actors_[var_38_15.prefab_name] ~= nil then
						local var_38_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_15.prefab_name].transform, "story_v_out_114162", "114162009", "story_v_out_114162.awb")

						arg_35_1:RecordAudio("114162009", var_38_21)
						arg_35_1:RecordAudio("114162009", var_38_21)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114162", "114162009", "story_v_out_114162.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114162", "114162009", "story_v_out_114162.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_22 = math.max(var_38_13, arg_35_1.talkMaxDuration)

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_22 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_12) / var_38_22

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_12 + var_38_22 and arg_35_1.time_ < var_38_12 + var_38_22 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114162010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114162010
		arg_39_1.duration_ = 8.733

		local var_39_0 = {
			ja = 8.733,
			ko = 6.666,
			zh = 5.466,
			en = 6.9
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
				arg_39_0:Play114162011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10006ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10006ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10006ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1041ui_story"].transform
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.var_.moveOldPos1041ui_story = var_42_9.localPosition
			end

			local var_42_11 = 0.001

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11
				local var_42_13 = Vector3.New(0, 100, 0)

				var_42_9.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1041ui_story, var_42_13, var_42_12)

				local var_42_14 = manager.ui.mainCamera.transform.position - var_42_9.position

				var_42_9.forward = Vector3.New(var_42_14.x, var_42_14.y, var_42_14.z)

				local var_42_15 = var_42_9.localEulerAngles

				var_42_15.z = 0
				var_42_15.x = 0
				var_42_9.localEulerAngles = var_42_15
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 then
				var_42_9.localPosition = Vector3.New(0, 100, 0)

				local var_42_16 = manager.ui.mainCamera.transform.position - var_42_9.position

				var_42_9.forward = Vector3.New(var_42_16.x, var_42_16.y, var_42_16.z)

				local var_42_17 = var_42_9.localEulerAngles

				var_42_17.z = 0
				var_42_17.x = 0
				var_42_9.localEulerAngles = var_42_17
			end

			local var_42_18 = arg_39_1.actors_["1038ui_story"].transform
			local var_42_19 = 1.99973371195483e-12

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.var_.moveOldPos1038ui_story = var_42_18.localPosition
			end

			local var_42_20 = 0.001

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / var_42_20
				local var_42_22 = Vector3.New(0, -1.11, -5.9)

				var_42_18.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1038ui_story, var_42_22, var_42_21)

				local var_42_23 = manager.ui.mainCamera.transform.position - var_42_18.position

				var_42_18.forward = Vector3.New(var_42_23.x, var_42_23.y, var_42_23.z)

				local var_42_24 = var_42_18.localEulerAngles

				var_42_24.z = 0
				var_42_24.x = 0
				var_42_18.localEulerAngles = var_42_24
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 then
				var_42_18.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_42_25 = manager.ui.mainCamera.transform.position - var_42_18.position

				var_42_18.forward = Vector3.New(var_42_25.x, var_42_25.y, var_42_25.z)

				local var_42_26 = var_42_18.localEulerAngles

				var_42_26.z = 0
				var_42_26.x = 0
				var_42_18.localEulerAngles = var_42_26
			end

			local var_42_27 = 0

			if var_42_27 < arg_39_1.time_ and arg_39_1.time_ <= var_42_27 + arg_42_0 then
				arg_39_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_42_29 = arg_39_1.actors_["1038ui_story"]
			local var_42_30 = 0

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 and arg_39_1.var_.characterEffect1038ui_story == nil then
				arg_39_1.var_.characterEffect1038ui_story = var_42_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_31 = 0.2

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_31 then
				local var_42_32 = (arg_39_1.time_ - var_42_30) / var_42_31

				if arg_39_1.var_.characterEffect1038ui_story then
					arg_39_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_30 + var_42_31 and arg_39_1.time_ < var_42_30 + var_42_31 + arg_42_0 and arg_39_1.var_.characterEffect1038ui_story then
				arg_39_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_42_33 = 0
			local var_42_34 = 0.725

			if var_42_33 < arg_39_1.time_ and arg_39_1.time_ <= var_42_33 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_35 = arg_39_1:FormatText(StoryNameCfg[94].name)

				arg_39_1.leftNameTxt_.text = var_42_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_36 = arg_39_1:GetWordFromCfg(114162010)
				local var_42_37 = arg_39_1:FormatText(var_42_36.content)

				arg_39_1.text_.text = var_42_37

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_38 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162010", "story_v_out_114162.awb") ~= 0 then
					local var_42_41 = manager.audio:GetVoiceLength("story_v_out_114162", "114162010", "story_v_out_114162.awb") / 1000

					if var_42_41 + var_42_33 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_41 + var_42_33
					end

					if var_42_36.prefab_name ~= "" and arg_39_1.actors_[var_42_36.prefab_name] ~= nil then
						local var_42_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_36.prefab_name].transform, "story_v_out_114162", "114162010", "story_v_out_114162.awb")

						arg_39_1:RecordAudio("114162010", var_42_42)
						arg_39_1:RecordAudio("114162010", var_42_42)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114162", "114162010", "story_v_out_114162.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114162", "114162010", "story_v_out_114162.awb")
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
	Play114162011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114162011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play114162012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1038ui_story"].transform
			local var_46_1 = 1.99973371195483e-12

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

			local var_46_9 = 0
			local var_46_10 = 0.975

			if var_46_9 < arg_43_1.time_ and arg_43_1.time_ <= var_46_9 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_11 = arg_43_1:GetWordFromCfg(114162011)
				local var_46_12 = arg_43_1:FormatText(var_46_11.content)

				arg_43_1.text_.text = var_46_12

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_13 = 39
				local var_46_14 = utf8.len(var_46_12)
				local var_46_15 = var_46_13 <= 0 and var_46_10 or var_46_10 * (var_46_14 / var_46_13)

				if var_46_15 > 0 and var_46_10 < var_46_15 then
					arg_43_1.talkMaxDuration = var_46_15

					if var_46_15 + var_46_9 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_15 + var_46_9
					end
				end

				arg_43_1.text_.text = var_46_12
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_16 = math.max(var_46_10, arg_43_1.talkMaxDuration)

			if var_46_9 <= arg_43_1.time_ and arg_43_1.time_ < var_46_9 + var_46_16 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_9) / var_46_16

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_9 + var_46_16 and arg_43_1.time_ < var_46_9 + var_46_16 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114162012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114162012
		arg_47_1.duration_ = 7.033

		local var_47_0 = {
			ja = 7.033,
			ko = 3.4,
			zh = 2.533,
			en = 2.566
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
				arg_47_0:Play114162013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1097ui_story"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(Asset.Load("Char/" .. var_50_0), arg_47_1.stage_.transform)

				var_50_1.name = var_50_0
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.actors_[var_50_0] = var_50_1

				local var_50_2 = var_50_1:GetComponentInChildren(typeof(CharacterEffect))

				var_50_2.enabled = true

				local var_50_3 = GameObjectTools.GetOrAddComponent(var_50_1, typeof(DynamicBoneHelper))

				if var_50_3 then
					var_50_3:EnableDynamicBone(false)
				end

				arg_47_1:ShowWeapon(var_50_2.transform, false)

				arg_47_1.var_[var_50_0 .. "Animator"] = var_50_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_47_1.var_[var_50_0 .. "Animator"].applyRootMotion = true
				arg_47_1.var_[var_50_0 .. "LipSync"] = var_50_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_50_4 = arg_47_1.actors_["1097ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1097ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0, -0.54, -6.3)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1097ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_50_15 = arg_47_1.actors_["1097ui_story"]
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1097ui_story == nil then
				arg_47_1.var_.characterEffect1097ui_story = var_50_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_17 = 0.2

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17

				if arg_47_1.var_.characterEffect1097ui_story then
					arg_47_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 and arg_47_1.var_.characterEffect1097ui_story then
				arg_47_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_50_19 = 0
			local var_50_20 = 0.225

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[216].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(114162012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 9
				local var_50_25 = utf8.len(var_50_23)
				local var_50_26 = var_50_24 <= 0 and var_50_20 or var_50_20 * (var_50_25 / var_50_24)

				if var_50_26 > 0 and var_50_20 < var_50_26 then
					arg_47_1.talkMaxDuration = var_50_26

					if var_50_26 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_19
					end
				end

				arg_47_1.text_.text = var_50_23
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162012", "story_v_out_114162.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_114162", "114162012", "story_v_out_114162.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_114162", "114162012", "story_v_out_114162.awb")

						arg_47_1:RecordAudio("114162012", var_50_28)
						arg_47_1:RecordAudio("114162012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_114162", "114162012", "story_v_out_114162.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_114162", "114162012", "story_v_out_114162.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_29 = math.max(var_50_20, arg_47_1.talkMaxDuration)

			if var_50_19 <= arg_47_1.time_ and arg_47_1.time_ < var_50_19 + var_50_29 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_19) / var_50_29

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_19 + var_50_29 and arg_47_1.time_ < var_50_19 + var_50_29 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play114162013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114162013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play114162014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1097ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1097ui_story == nil then
				arg_51_1.var_.characterEffect1097ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1097ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1097ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1097ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1097ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.125

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(114162013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 5
				local var_54_12 = utf8.len(var_54_10)
				local var_54_13 = var_54_11 <= 0 and var_54_7 or var_54_7 * (var_54_12 / var_54_11)

				if var_54_13 > 0 and var_54_7 < var_54_13 then
					arg_51_1.talkMaxDuration = var_54_13

					if var_54_13 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_13 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_10
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_14 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_14 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_14

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_14 and arg_51_1.time_ < var_54_6 + var_54_14 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play114162014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114162014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play114162015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1097ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1097ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, 100, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1097ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, 100, 0)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = 0
			local var_58_10 = 0.825

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_11 = arg_55_1:GetWordFromCfg(114162014)
				local var_58_12 = arg_55_1:FormatText(var_58_11.content)

				arg_55_1.text_.text = var_58_12

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_13 = 33
				local var_58_14 = utf8.len(var_58_12)
				local var_58_15 = var_58_13 <= 0 and var_58_10 or var_58_10 * (var_58_14 / var_58_13)

				if var_58_15 > 0 and var_58_10 < var_58_15 then
					arg_55_1.talkMaxDuration = var_58_15

					if var_58_15 + var_58_9 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_15 + var_58_9
					end
				end

				arg_55_1.text_.text = var_58_12
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_10, arg_55_1.talkMaxDuration)

			if var_58_9 <= arg_55_1.time_ and arg_55_1.time_ < var_58_9 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_9) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_9 + var_58_16 and arg_55_1.time_ < var_58_9 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play114162015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114162015
		arg_59_1.duration_ = 14.033999999999

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play114162016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "OM0212"

			if arg_59_1.bgs_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_0)
				var_62_1.name = var_62_0
				var_62_1.transform.parent = arg_59_1.stage_.transform
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_0] = var_62_1
			end

			local var_62_2 = 2

			if var_62_2 < arg_59_1.time_ and arg_59_1.time_ <= var_62_2 + arg_62_0 then
				local var_62_3 = manager.ui.mainCamera.transform.localPosition
				local var_62_4 = Vector3.New(0, 0, 10) + Vector3.New(var_62_3.x, var_62_3.y, 0)
				local var_62_5 = arg_59_1.bgs_.OM0212

				var_62_5.transform.localPosition = var_62_4
				var_62_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_6 = var_62_5:GetComponent("SpriteRenderer")

				if var_62_6 and var_62_6.sprite then
					local var_62_7 = (var_62_5.transform.localPosition - var_62_3).z
					local var_62_8 = manager.ui.mainCameraCom_
					local var_62_9 = 2 * var_62_7 * Mathf.Tan(var_62_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_10 = var_62_9 * var_62_8.aspect
					local var_62_11 = var_62_6.sprite.bounds.size.x
					local var_62_12 = var_62_6.sprite.bounds.size.y
					local var_62_13 = var_62_10 / var_62_11
					local var_62_14 = var_62_9 / var_62_12
					local var_62_15 = var_62_14 < var_62_13 and var_62_13 or var_62_14

					var_62_5.transform.localScale = Vector3.New(var_62_15, var_62_15, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "OM0212" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_17 = 2

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17
				local var_62_19 = Color.New(0, 0, 0)

				var_62_19.a = Mathf.Lerp(0, 1, var_62_18)
				arg_59_1.mask_.color = var_62_19
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 then
				local var_62_20 = Color.New(0, 0, 0)

				var_62_20.a = 1
				arg_59_1.mask_.color = var_62_20
			end

			local var_62_21 = 2

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_22 = 2

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_22 then
				local var_62_23 = (arg_59_1.time_ - var_62_21) / var_62_22
				local var_62_24 = Color.New(0, 0, 0)

				var_62_24.a = Mathf.Lerp(1, 0, var_62_23)
				arg_59_1.mask_.color = var_62_24
			end

			if arg_59_1.time_ >= var_62_21 + var_62_22 and arg_59_1.time_ < var_62_21 + var_62_22 + arg_62_0 then
				local var_62_25 = Color.New(0, 0, 0)
				local var_62_26 = 0

				arg_59_1.mask_.enabled = false
				var_62_25.a = var_62_26
				arg_59_1.mask_.color = var_62_25
			end

			local var_62_27 = arg_59_1.bgs_.OM0212.transform
			local var_62_28 = 2

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1.var_.moveOldPosOM0212 = var_62_27.localPosition
			end

			local var_62_29 = 0.001

			if var_62_28 <= arg_59_1.time_ and arg_59_1.time_ < var_62_28 + var_62_29 then
				local var_62_30 = (arg_59_1.time_ - var_62_28) / var_62_29
				local var_62_31 = Vector3.New(0, 1, 5)

				var_62_27.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPosOM0212, var_62_31, var_62_30)
			end

			if arg_59_1.time_ >= var_62_28 + var_62_29 and arg_59_1.time_ < var_62_28 + var_62_29 + arg_62_0 then
				var_62_27.localPosition = Vector3.New(0, 1, 5)
			end

			local var_62_32 = arg_59_1.bgs_.OM0212.transform
			local var_62_33 = 2.034

			if var_62_33 < arg_59_1.time_ and arg_59_1.time_ <= var_62_33 + arg_62_0 then
				arg_59_1.var_.moveOldPosOM0212 = var_62_32.localPosition
			end

			local var_62_34 = 12

			if var_62_33 <= arg_59_1.time_ and arg_59_1.time_ < var_62_33 + var_62_34 then
				local var_62_35 = (arg_59_1.time_ - var_62_33) / var_62_34
				local var_62_36 = Vector3.New(0, 0, 5)

				var_62_32.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPosOM0212, var_62_36, var_62_35)
			end

			if arg_59_1.time_ >= var_62_33 + var_62_34 and arg_59_1.time_ < var_62_33 + var_62_34 + arg_62_0 then
				var_62_32.localPosition = Vector3.New(0, 0, 5)
			end

			local var_62_37 = 3.86666666666667

			if var_62_37 < arg_59_1.time_ and arg_59_1.time_ <= var_62_37 + arg_62_0 then
				arg_59_1.allBtn_.enabled = false
			end

			local var_62_38 = 10.1673333333333

			if arg_59_1.time_ >= var_62_37 + var_62_38 and arg_59_1.time_ < var_62_37 + var_62_38 + arg_62_0 then
				arg_59_1.allBtn_.enabled = true
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_39 = 6
			local var_62_40 = 1.4

			if var_62_39 < arg_59_1.time_ and arg_59_1.time_ <= var_62_39 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_41 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_41:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_42 = arg_59_1:GetWordFromCfg(114162015)
				local var_62_43 = arg_59_1:FormatText(var_62_42.content)

				arg_59_1.text_.text = var_62_43

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_44 = 56
				local var_62_45 = utf8.len(var_62_43)
				local var_62_46 = var_62_44 <= 0 and var_62_40 or var_62_40 * (var_62_45 / var_62_44)

				if var_62_46 > 0 and var_62_40 < var_62_46 then
					arg_59_1.talkMaxDuration = var_62_46
					var_62_39 = var_62_39 + 0.3

					if var_62_46 + var_62_39 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_46 + var_62_39
					end
				end

				arg_59_1.text_.text = var_62_43
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_47 = var_62_39 + 0.3
			local var_62_48 = math.max(var_62_40, arg_59_1.talkMaxDuration)

			if var_62_47 <= arg_59_1.time_ and arg_59_1.time_ < var_62_47 + var_62_48 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_47) / var_62_48

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_47 + var_62_48 and arg_59_1.time_ < var_62_47 + var_62_48 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114162016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 114162016
		arg_65_1.duration_ = 8.86666666666667

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play114162017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_1 = 2

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_1 then
				local var_68_2 = (arg_65_1.time_ - var_68_0) / var_68_1
				local var_68_3 = Color.New(0, 0, 0)

				var_68_3.a = Mathf.Lerp(0, 1, var_68_2)
				arg_65_1.mask_.color = var_68_3
			end

			if arg_65_1.time_ >= var_68_0 + var_68_1 and arg_65_1.time_ < var_68_0 + var_68_1 + arg_68_0 then
				local var_68_4 = Color.New(0, 0, 0)

				var_68_4.a = 1
				arg_65_1.mask_.color = var_68_4
			end

			local var_68_5 = 2

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_6 = 1.86666666666667

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_6 then
				local var_68_7 = (arg_65_1.time_ - var_68_5) / var_68_6
				local var_68_8 = Color.New(0, 0, 0)

				var_68_8.a = Mathf.Lerp(1, 0, var_68_7)
				arg_65_1.mask_.color = var_68_8
			end

			if arg_65_1.time_ >= var_68_5 + var_68_6 and arg_65_1.time_ < var_68_5 + var_68_6 + arg_68_0 then
				local var_68_9 = Color.New(0, 0, 0)
				local var_68_10 = 0

				arg_65_1.mask_.enabled = false
				var_68_9.a = var_68_10
				arg_65_1.mask_.color = var_68_9
			end

			local var_68_11 = arg_65_1.bgs_.OM0212.transform
			local var_68_12 = 2

			if var_68_12 < arg_65_1.time_ and arg_65_1.time_ <= var_68_12 + arg_68_0 then
				arg_65_1.var_.moveOldPosOM0212 = var_68_11.localPosition
			end

			local var_68_13 = 0.001

			if var_68_12 <= arg_65_1.time_ and arg_65_1.time_ < var_68_12 + var_68_13 then
				local var_68_14 = (arg_65_1.time_ - var_68_12) / var_68_13
				local var_68_15 = Vector3.New(0, 1, 9.5)

				var_68_11.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPosOM0212, var_68_15, var_68_14)
			end

			if arg_65_1.time_ >= var_68_12 + var_68_13 and arg_65_1.time_ < var_68_12 + var_68_13 + arg_68_0 then
				var_68_11.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_68_16 = arg_65_1.bgs_.OM0212.transform
			local var_68_17 = 2.034

			if var_68_17 < arg_65_1.time_ and arg_65_1.time_ <= var_68_17 + arg_68_0 then
				arg_65_1.var_.moveOldPosOM0212 = var_68_16.localPosition
			end

			local var_68_18 = 2.5

			if var_68_17 <= arg_65_1.time_ and arg_65_1.time_ < var_68_17 + var_68_18 then
				local var_68_19 = (arg_65_1.time_ - var_68_17) / var_68_18
				local var_68_20 = Vector3.New(0, 1, 10)

				var_68_16.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPosOM0212, var_68_20, var_68_19)
			end

			if arg_65_1.time_ >= var_68_17 + var_68_18 and arg_65_1.time_ < var_68_17 + var_68_18 + arg_68_0 then
				var_68_16.localPosition = Vector3.New(0, 1, 10)
			end

			local var_68_21 = 3.86666666666667

			if var_68_21 < arg_65_1.time_ and arg_65_1.time_ <= var_68_21 + arg_68_0 then
				arg_65_1.allBtn_.enabled = false
			end

			local var_68_22 = 0.667333333333334

			if arg_65_1.time_ >= var_68_21 + var_68_22 and arg_65_1.time_ < var_68_21 + var_68_22 + arg_68_0 then
				arg_65_1.allBtn_.enabled = true
			end

			local var_68_23 = 3.86666666666667
			local var_68_24 = 1.325

			if var_68_23 < arg_65_1.time_ and arg_65_1.time_ <= var_68_23 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_25 = arg_65_1:GetWordFromCfg(114162016)
				local var_68_26 = arg_65_1:FormatText(var_68_25.content)

				arg_65_1.text_.text = var_68_26

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_27 = 53
				local var_68_28 = utf8.len(var_68_26)
				local var_68_29 = var_68_27 <= 0 and var_68_24 or var_68_24 * (var_68_28 / var_68_27)

				if var_68_29 > 0 and var_68_24 < var_68_29 then
					arg_65_1.talkMaxDuration = var_68_29

					if var_68_29 + var_68_23 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_29 + var_68_23
					end
				end

				arg_65_1.text_.text = var_68_26
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_30 = math.max(var_68_24, arg_65_1.talkMaxDuration)

			if var_68_23 <= arg_65_1.time_ and arg_65_1.time_ < var_68_23 + var_68_30 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_23) / var_68_30

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_23 + var_68_30 and arg_65_1.time_ < var_68_23 + var_68_30 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play114162017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 114162017
		arg_69_1.duration_ = 1.633

		local var_69_0 = {
			ja = 0.999999999999,
			ko = 1.166,
			zh = 1.633,
			en = 1.433
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
				arg_69_0:Play114162018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.15

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[216].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(114162017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 6
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162017", "story_v_out_114162.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162017", "story_v_out_114162.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_114162", "114162017", "story_v_out_114162.awb")

						arg_69_1:RecordAudio("114162017", var_72_9)
						arg_69_1:RecordAudio("114162017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_114162", "114162017", "story_v_out_114162.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_114162", "114162017", "story_v_out_114162.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play114162018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 114162018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play114162019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.5

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_2 = arg_73_1:GetWordFromCfg(114162018)
				local var_76_3 = arg_73_1:FormatText(var_76_2.content)

				arg_73_1.text_.text = var_76_3

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_4 = 20
				local var_76_5 = utf8.len(var_76_3)
				local var_76_6 = var_76_4 <= 0 and var_76_1 or var_76_1 * (var_76_5 / var_76_4)

				if var_76_6 > 0 and var_76_1 < var_76_6 then
					arg_73_1.talkMaxDuration = var_76_6

					if var_76_6 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_6 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_3
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_7 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_7 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_7

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_7 and arg_73_1.time_ < var_76_0 + var_76_7 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play114162019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 114162019
		arg_77_1.duration_ = 6

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play114162020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = manager.ui.mainCamera.transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.shakeOldPos = var_80_0.localPosition
			end

			local var_80_2 = 1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / 0.066
				local var_80_4, var_80_5 = math.modf(var_80_3)

				var_80_0.localPosition = Vector3.New(var_80_5 * 0.13, var_80_5 * 0.13, var_80_5 * 0.13) + arg_77_1.var_.shakeOldPos
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = arg_77_1.var_.shakeOldPos
			end

			local var_80_6 = 0

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.allBtn_.enabled = false
			end

			local var_80_7 = 1

			if arg_77_1.time_ >= var_80_6 + var_80_7 and arg_77_1.time_ < var_80_6 + var_80_7 + arg_80_0 then
				arg_77_1.allBtn_.enabled = true
			end

			if arg_77_1.frameCnt_ <= 1 then
				arg_77_1.dialog_:SetActive(false)
			end

			local var_80_8 = 1
			local var_80_9 = 1.375

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_10 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_10:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_10:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_10:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_11 = arg_77_1:GetWordFromCfg(114162019)
				local var_80_12 = arg_77_1:FormatText(var_80_11.content)

				arg_77_1.text_.text = var_80_12

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_13 = 55
				local var_80_14 = utf8.len(var_80_12)
				local var_80_15 = var_80_13 <= 0 and var_80_9 or var_80_9 * (var_80_14 / var_80_13)

				if var_80_15 > 0 and var_80_9 < var_80_15 then
					arg_77_1.talkMaxDuration = var_80_15
					var_80_8 = var_80_8 + 0.3

					if var_80_15 + var_80_8 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_15 + var_80_8
					end
				end

				arg_77_1.text_.text = var_80_12
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = var_80_8 + 0.3
			local var_80_17 = math.max(var_80_9, arg_77_1.talkMaxDuration)

			if var_80_16 <= arg_77_1.time_ and arg_77_1.time_ < var_80_16 + var_80_17 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_16) / var_80_17

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_16 + var_80_17 and arg_77_1.time_ < var_80_16 + var_80_17 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play114162020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114162020
		arg_83_1.duration_ = 2.8

		local var_83_0 = {
			ja = 2.8,
			ko = 2.5,
			zh = 2.066,
			en = 2.4
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
				arg_83_0:Play114162021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.225

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(114162020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 9
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162020", "story_v_out_114162.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162020", "story_v_out_114162.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_114162", "114162020", "story_v_out_114162.awb")

						arg_83_1:RecordAudio("114162020", var_86_9)
						arg_83_1:RecordAudio("114162020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_114162", "114162020", "story_v_out_114162.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_114162", "114162020", "story_v_out_114162.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play114162021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 114162021
		arg_87_1.duration_ = 2.9

		local var_87_0 = {
			ja = 2.266,
			ko = 2.466,
			zh = 2.9,
			en = 2.3
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
				arg_87_0:Play114162022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.35

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[208].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(114162021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 14
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162021", "story_v_out_114162.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162021", "story_v_out_114162.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_114162", "114162021", "story_v_out_114162.awb")

						arg_87_1:RecordAudio("114162021", var_90_9)
						arg_87_1:RecordAudio("114162021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_114162", "114162021", "story_v_out_114162.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_114162", "114162021", "story_v_out_114162.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play114162022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 114162022
		arg_91_1.duration_ = 5.7

		local var_91_0 = {
			ja = 5.7,
			ko = 3.066,
			zh = 3.066,
			en = 4.333
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
				arg_91_0:Play114162023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.3

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[94].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_5")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(114162022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162022", "story_v_out_114162.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162022", "story_v_out_114162.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_114162", "114162022", "story_v_out_114162.awb")

						arg_91_1:RecordAudio("114162022", var_94_9)
						arg_91_1:RecordAudio("114162022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_114162", "114162022", "story_v_out_114162.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_114162", "114162022", "story_v_out_114162.awb")
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
	Play114162023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 114162023
		arg_95_1.duration_ = 6.333

		local var_95_0 = {
			ja = 6.333,
			ko = 5.133,
			zh = 4.3,
			en = 3.866
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
				arg_95_0:Play114162024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.4

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[216].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(114162023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162023", "story_v_out_114162.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162023", "story_v_out_114162.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_114162", "114162023", "story_v_out_114162.awb")

						arg_95_1:RecordAudio("114162023", var_98_9)
						arg_95_1:RecordAudio("114162023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_114162", "114162023", "story_v_out_114162.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_114162", "114162023", "story_v_out_114162.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play114162024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 114162024
		arg_99_1.duration_ = 13.4

		local var_99_0 = {
			ja = 13.4,
			ko = 7.533,
			zh = 6.333,
			en = 7.666
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
				arg_99_0:Play114162025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.775

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[10].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(114162024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 31
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162024", "story_v_out_114162.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162024", "story_v_out_114162.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_114162", "114162024", "story_v_out_114162.awb")

						arg_99_1:RecordAudio("114162024", var_102_9)
						arg_99_1:RecordAudio("114162024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_114162", "114162024", "story_v_out_114162.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_114162", "114162024", "story_v_out_114162.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play114162025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 114162025
		arg_103_1.duration_ = 9

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play114162026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 2

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				local var_106_1 = manager.ui.mainCamera.transform.localPosition
				local var_106_2 = Vector3.New(0, 0, 10) + Vector3.New(var_106_1.x, var_106_1.y, 0)
				local var_106_3 = arg_103_1.bgs_.F05_1

				var_106_3.transform.localPosition = var_106_2
				var_106_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_106_4 = var_106_3:GetComponent("SpriteRenderer")

				if var_106_4 and var_106_4.sprite then
					local var_106_5 = (var_106_3.transform.localPosition - var_106_1).z
					local var_106_6 = manager.ui.mainCameraCom_
					local var_106_7 = 2 * var_106_5 * Mathf.Tan(var_106_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_106_8 = var_106_7 * var_106_6.aspect
					local var_106_9 = var_106_4.sprite.bounds.size.x
					local var_106_10 = var_106_4.sprite.bounds.size.y
					local var_106_11 = var_106_8 / var_106_9
					local var_106_12 = var_106_7 / var_106_10
					local var_106_13 = var_106_12 < var_106_11 and var_106_11 or var_106_12

					var_106_3.transform.localScale = Vector3.New(var_106_13, var_106_13, 0)
				end

				for iter_106_0, iter_106_1 in pairs(arg_103_1.bgs_) do
					if iter_106_0 ~= "F05_1" then
						iter_106_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_15 = 2

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15
				local var_106_17 = Color.New(0, 0, 0)

				var_106_17.a = Mathf.Lerp(0, 1, var_106_16)
				arg_103_1.mask_.color = var_106_17
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 then
				local var_106_18 = Color.New(0, 0, 0)

				var_106_18.a = 1
				arg_103_1.mask_.color = var_106_18
			end

			local var_106_19 = 2

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_20 = 2

			if var_106_19 <= arg_103_1.time_ and arg_103_1.time_ < var_106_19 + var_106_20 then
				local var_106_21 = (arg_103_1.time_ - var_106_19) / var_106_20
				local var_106_22 = Color.New(0, 0, 0)

				var_106_22.a = Mathf.Lerp(1, 0, var_106_21)
				arg_103_1.mask_.color = var_106_22
			end

			if arg_103_1.time_ >= var_106_19 + var_106_20 and arg_103_1.time_ < var_106_19 + var_106_20 + arg_106_0 then
				local var_106_23 = Color.New(0, 0, 0)
				local var_106_24 = 0

				arg_103_1.mask_.enabled = false
				var_106_23.a = var_106_24
				arg_103_1.mask_.color = var_106_23
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_25 = 4
			local var_106_26 = 0.925

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_27 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_27:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_28 = arg_103_1:GetWordFromCfg(114162025)
				local var_106_29 = arg_103_1:FormatText(var_106_28.content)

				arg_103_1.text_.text = var_106_29

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_30 = 37
				local var_106_31 = utf8.len(var_106_29)
				local var_106_32 = var_106_30 <= 0 and var_106_26 or var_106_26 * (var_106_31 / var_106_30)

				if var_106_32 > 0 and var_106_26 < var_106_32 then
					arg_103_1.talkMaxDuration = var_106_32
					var_106_25 = var_106_25 + 0.3

					if var_106_32 + var_106_25 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_32 + var_106_25
					end
				end

				arg_103_1.text_.text = var_106_29
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_33 = var_106_25 + 0.3
			local var_106_34 = math.max(var_106_26, arg_103_1.talkMaxDuration)

			if var_106_33 <= arg_103_1.time_ and arg_103_1.time_ < var_106_33 + var_106_34 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_33) / var_106_34

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_33 + var_106_34 and arg_103_1.time_ < var_106_33 + var_106_34 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play114162026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 114162026
		arg_109_1.duration_ = 4.866

		local var_109_0 = {
			ja = 4.866,
			ko = 4.7,
			zh = 4.466,
			en = 4.7
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
				arg_109_0:Play114162027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.5

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[212].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(114162026)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 20
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162026", "story_v_out_114162.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162026", "story_v_out_114162.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_114162", "114162026", "story_v_out_114162.awb")

						arg_109_1:RecordAudio("114162026", var_112_9)
						arg_109_1:RecordAudio("114162026", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_114162", "114162026", "story_v_out_114162.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_114162", "114162026", "story_v_out_114162.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play114162027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 114162027
		arg_113_1.duration_ = 6.166

		local var_113_0 = {
			ja = 3.733,
			ko = 5,
			zh = 6.166,
			en = 5.466
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
				arg_113_0:Play114162028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.15

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[216].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(114162027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 6
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162027", "story_v_out_114162.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162027", "story_v_out_114162.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_114162", "114162027", "story_v_out_114162.awb")

						arg_113_1:RecordAudio("114162027", var_116_9)
						arg_113_1:RecordAudio("114162027", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_114162", "114162027", "story_v_out_114162.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_114162", "114162027", "story_v_out_114162.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_10 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_10 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_10

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_10 and arg_113_1.time_ < var_116_0 + var_116_10 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play114162028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 114162028
		arg_117_1.duration_ = 4.166

		local var_117_0 = {
			ja = 4.166,
			ko = 2.833,
			zh = 3.9,
			en = 2.166
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
				arg_117_0:Play114162029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.2

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[212].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(114162028)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 8
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162028", "story_v_out_114162.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162028", "story_v_out_114162.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_114162", "114162028", "story_v_out_114162.awb")

						arg_117_1:RecordAudio("114162028", var_120_9)
						arg_117_1:RecordAudio("114162028", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_114162", "114162028", "story_v_out_114162.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_114162", "114162028", "story_v_out_114162.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play114162029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 114162029
		arg_121_1.duration_ = 8.966

		local var_121_0 = {
			ja = 8.8,
			ko = 6.366,
			zh = 6.366,
			en = 8.966
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
				arg_121_0:Play114162030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.7

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[10].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(114162029)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 28
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162029", "story_v_out_114162.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162029", "story_v_out_114162.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_114162", "114162029", "story_v_out_114162.awb")

						arg_121_1:RecordAudio("114162029", var_124_9)
						arg_121_1:RecordAudio("114162029", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_114162", "114162029", "story_v_out_114162.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_114162", "114162029", "story_v_out_114162.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play114162030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 114162030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play114162031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.625

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_2 = arg_125_1:GetWordFromCfg(114162030)
				local var_128_3 = arg_125_1:FormatText(var_128_2.content)

				arg_125_1.text_.text = var_128_3

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_4 = 25
				local var_128_5 = utf8.len(var_128_3)
				local var_128_6 = var_128_4 <= 0 and var_128_1 or var_128_1 * (var_128_5 / var_128_4)

				if var_128_6 > 0 and var_128_1 < var_128_6 then
					arg_125_1.talkMaxDuration = var_128_6

					if var_128_6 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_6 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_3
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_7 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_7 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_7

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_7 and arg_125_1.time_ < var_128_0 + var_128_7 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play114162031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 114162031
		arg_129_1.duration_ = 7.166

		local var_129_0 = {
			ja = 6.666,
			ko = 6.833,
			zh = 6.1,
			en = 7.166
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
				arg_129_0:Play114162032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10006ui_story"].transform
			local var_132_1 = 1.99973371195483e-12

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10006ui_story = var_132_0.localPosition

				local var_132_2 = "10006ui_story"

				arg_129_1:ShowWeapon(arg_129_1.var_[var_132_2 .. "Animator"].transform, true)
			end

			local var_132_3 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_3 then
				local var_132_4 = (arg_129_1.time_ - var_132_1) / var_132_3
				local var_132_5 = Vector3.New(-0.7, -0.98, -5.65)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10006ui_story, var_132_5, var_132_4)

				local var_132_6 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_6.x, var_132_6.y, var_132_6.z)

				local var_132_7 = var_132_0.localEulerAngles

				var_132_7.z = 0
				var_132_7.x = 0
				var_132_0.localEulerAngles = var_132_7
			end

			if arg_129_1.time_ >= var_132_1 + var_132_3 and arg_129_1.time_ < var_132_1 + var_132_3 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(-0.7, -0.98, -5.65)

				local var_132_8 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_8.x, var_132_8.y, var_132_8.z)

				local var_132_9 = var_132_0.localEulerAngles

				var_132_9.z = 0
				var_132_9.x = 0
				var_132_0.localEulerAngles = var_132_9
			end

			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action6_1")
			end

			local var_132_11 = 0

			if var_132_11 < arg_129_1.time_ and arg_129_1.time_ <= var_132_11 + arg_132_0 then
				arg_129_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_132_12 = arg_129_1.actors_["10006ui_story"]
			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 and arg_129_1.var_.characterEffect10006ui_story == nil then
				arg_129_1.var_.characterEffect10006ui_story = var_132_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_14 = 0.2

			if var_132_13 <= arg_129_1.time_ and arg_129_1.time_ < var_132_13 + var_132_14 then
				local var_132_15 = (arg_129_1.time_ - var_132_13) / var_132_14

				if arg_129_1.var_.characterEffect10006ui_story then
					arg_129_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_13 + var_132_14 and arg_129_1.time_ < var_132_13 + var_132_14 + arg_132_0 and arg_129_1.var_.characterEffect10006ui_story then
				arg_129_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_132_16 = 0
			local var_132_17 = 0.825

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_18 = arg_129_1:FormatText(StoryNameCfg[212].name)

				arg_129_1.leftNameTxt_.text = var_132_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_19 = arg_129_1:GetWordFromCfg(114162031)
				local var_132_20 = arg_129_1:FormatText(var_132_19.content)

				arg_129_1.text_.text = var_132_20

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_21 = 33
				local var_132_22 = utf8.len(var_132_20)
				local var_132_23 = var_132_21 <= 0 and var_132_17 or var_132_17 * (var_132_22 / var_132_21)

				if var_132_23 > 0 and var_132_17 < var_132_23 then
					arg_129_1.talkMaxDuration = var_132_23

					if var_132_23 + var_132_16 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_16
					end
				end

				arg_129_1.text_.text = var_132_20
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162031", "story_v_out_114162.awb") ~= 0 then
					local var_132_24 = manager.audio:GetVoiceLength("story_v_out_114162", "114162031", "story_v_out_114162.awb") / 1000

					if var_132_24 + var_132_16 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_24 + var_132_16
					end

					if var_132_19.prefab_name ~= "" and arg_129_1.actors_[var_132_19.prefab_name] ~= nil then
						local var_132_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_19.prefab_name].transform, "story_v_out_114162", "114162031", "story_v_out_114162.awb")

						arg_129_1:RecordAudio("114162031", var_132_25)
						arg_129_1:RecordAudio("114162031", var_132_25)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_114162", "114162031", "story_v_out_114162.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_114162", "114162031", "story_v_out_114162.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_26 = math.max(var_132_17, arg_129_1.talkMaxDuration)

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_26 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_16) / var_132_26

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_16 + var_132_26 and arg_129_1.time_ < var_132_16 + var_132_26 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play114162032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 114162032
		arg_133_1.duration_ = 5.066

		local var_133_0 = {
			ja = 4.233,
			ko = 5.066,
			zh = 4.933,
			en = 3.833
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
				arg_133_0:Play114162033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10006ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect10006ui_story == nil then
				arg_133_1.var_.characterEffect10006ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.2

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect10006ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_133_1.var_.characterEffect10006ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect10006ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_133_1.var_.characterEffect10006ui_story.fillRatio = var_136_5
			end

			local var_136_6 = arg_133_1.actors_["1041ui_story"].transform
			local var_136_7 = 1.99973371195483e-12

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 then
				arg_133_1.var_.moveOldPos1041ui_story = var_136_6.localPosition
			end

			local var_136_8 = 0.001

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8
				local var_136_10 = Vector3.New(0.7, -1.11, -5.9)

				var_136_6.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1041ui_story, var_136_10, var_136_9)

				local var_136_11 = manager.ui.mainCamera.transform.position - var_136_6.position

				var_136_6.forward = Vector3.New(var_136_11.x, var_136_11.y, var_136_11.z)

				local var_136_12 = var_136_6.localEulerAngles

				var_136_12.z = 0
				var_136_12.x = 0
				var_136_6.localEulerAngles = var_136_12
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 then
				var_136_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_136_13 = manager.ui.mainCamera.transform.position - var_136_6.position

				var_136_6.forward = Vector3.New(var_136_13.x, var_136_13.y, var_136_13.z)

				local var_136_14 = var_136_6.localEulerAngles

				var_136_14.z = 0
				var_136_14.x = 0
				var_136_6.localEulerAngles = var_136_14
			end

			local var_136_15 = 0

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_136_16 = 0

			if var_136_16 < arg_133_1.time_ and arg_133_1.time_ <= var_136_16 + arg_136_0 then
				arg_133_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_136_17 = arg_133_1.actors_["1041ui_story"]
			local var_136_18 = 0

			if var_136_18 < arg_133_1.time_ and arg_133_1.time_ <= var_136_18 + arg_136_0 and arg_133_1.var_.characterEffect1041ui_story == nil then
				arg_133_1.var_.characterEffect1041ui_story = var_136_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_19 = 0.2

			if var_136_18 <= arg_133_1.time_ and arg_133_1.time_ < var_136_18 + var_136_19 then
				local var_136_20 = (arg_133_1.time_ - var_136_18) / var_136_19

				if arg_133_1.var_.characterEffect1041ui_story then
					arg_133_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_18 + var_136_19 and arg_133_1.time_ < var_136_18 + var_136_19 + arg_136_0 and arg_133_1.var_.characterEffect1041ui_story then
				arg_133_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_136_21 = 0
			local var_136_22 = 0.325

			if var_136_21 < arg_133_1.time_ and arg_133_1.time_ <= var_136_21 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_23 = arg_133_1:FormatText(StoryNameCfg[208].name)

				arg_133_1.leftNameTxt_.text = var_136_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_24 = arg_133_1:GetWordFromCfg(114162032)
				local var_136_25 = arg_133_1:FormatText(var_136_24.content)

				arg_133_1.text_.text = var_136_25

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_26 = 13
				local var_136_27 = utf8.len(var_136_25)
				local var_136_28 = var_136_26 <= 0 and var_136_22 or var_136_22 * (var_136_27 / var_136_26)

				if var_136_28 > 0 and var_136_22 < var_136_28 then
					arg_133_1.talkMaxDuration = var_136_28

					if var_136_28 + var_136_21 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_28 + var_136_21
					end
				end

				arg_133_1.text_.text = var_136_25
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162032", "story_v_out_114162.awb") ~= 0 then
					local var_136_29 = manager.audio:GetVoiceLength("story_v_out_114162", "114162032", "story_v_out_114162.awb") / 1000

					if var_136_29 + var_136_21 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_29 + var_136_21
					end

					if var_136_24.prefab_name ~= "" and arg_133_1.actors_[var_136_24.prefab_name] ~= nil then
						local var_136_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_24.prefab_name].transform, "story_v_out_114162", "114162032", "story_v_out_114162.awb")

						arg_133_1:RecordAudio("114162032", var_136_30)
						arg_133_1:RecordAudio("114162032", var_136_30)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_114162", "114162032", "story_v_out_114162.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_114162", "114162032", "story_v_out_114162.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_31 = math.max(var_136_22, arg_133_1.talkMaxDuration)

			if var_136_21 <= arg_133_1.time_ and arg_133_1.time_ < var_136_21 + var_136_31 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_21) / var_136_31

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_21 + var_136_31 and arg_133_1.time_ < var_136_21 + var_136_31 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play114162033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 114162033
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play114162034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1041ui_story"].transform
			local var_140_1 = 1.99973371195483e-12

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1041ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, 100, 0)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1041ui_story, var_140_4, var_140_3)

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

			local var_140_9 = arg_137_1.actors_["10006ui_story"].transform
			local var_140_10 = 1.99973371195483e-12

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.var_.moveOldPos10006ui_story = var_140_9.localPosition
			end

			local var_140_11 = 0.001

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11
				local var_140_13 = Vector3.New(0, 100, 0)

				var_140_9.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10006ui_story, var_140_13, var_140_12)

				local var_140_14 = manager.ui.mainCamera.transform.position - var_140_9.position

				var_140_9.forward = Vector3.New(var_140_14.x, var_140_14.y, var_140_14.z)

				local var_140_15 = var_140_9.localEulerAngles

				var_140_15.z = 0
				var_140_15.x = 0
				var_140_9.localEulerAngles = var_140_15
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 then
				var_140_9.localPosition = Vector3.New(0, 100, 0)

				local var_140_16 = manager.ui.mainCamera.transform.position - var_140_9.position

				var_140_9.forward = Vector3.New(var_140_16.x, var_140_16.y, var_140_16.z)

				local var_140_17 = var_140_9.localEulerAngles

				var_140_17.z = 0
				var_140_17.x = 0
				var_140_9.localEulerAngles = var_140_17
			end

			local var_140_18 = 0
			local var_140_19 = 1

			if var_140_18 < arg_137_1.time_ and arg_137_1.time_ <= var_140_18 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_20 = arg_137_1:GetWordFromCfg(114162033)
				local var_140_21 = arg_137_1:FormatText(var_140_20.content)

				arg_137_1.text_.text = var_140_21

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_22 = 40
				local var_140_23 = utf8.len(var_140_21)
				local var_140_24 = var_140_22 <= 0 and var_140_19 or var_140_19 * (var_140_23 / var_140_22)

				if var_140_24 > 0 and var_140_19 < var_140_24 then
					arg_137_1.talkMaxDuration = var_140_24

					if var_140_24 + var_140_18 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_24 + var_140_18
					end
				end

				arg_137_1.text_.text = var_140_21
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_25 = math.max(var_140_19, arg_137_1.talkMaxDuration)

			if var_140_18 <= arg_137_1.time_ and arg_137_1.time_ < var_140_18 + var_140_25 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_18) / var_140_25

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_18 + var_140_25 and arg_137_1.time_ < var_140_18 + var_140_25 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play114162034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 114162034
		arg_141_1.duration_ = 5.733

		local var_141_0 = {
			ja = 4.6,
			ko = 4.6,
			zh = 3.6,
			en = 5.733
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
				arg_141_0:Play114162035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1184ui_story"].transform
			local var_144_1 = 1.99973371195483e-12

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1184ui_story = var_144_0.localPosition

				local var_144_2 = "1184ui_story"

				arg_141_1:ShowWeapon(arg_141_1.var_[var_144_2 .. "Animator"].transform, false)
			end

			local var_144_3 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_3 then
				local var_144_4 = (arg_141_1.time_ - var_144_1) / var_144_3
				local var_144_5 = Vector3.New(0, -0.97, -6)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1184ui_story, var_144_5, var_144_4)

				local var_144_6 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_6.x, var_144_6.y, var_144_6.z)

				local var_144_7 = var_144_0.localEulerAngles

				var_144_7.z = 0
				var_144_7.x = 0
				var_144_0.localEulerAngles = var_144_7
			end

			if arg_141_1.time_ >= var_144_1 + var_144_3 and arg_141_1.time_ < var_144_1 + var_144_3 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_144_8 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_8.x, var_144_8.y, var_144_8.z)

				local var_144_9 = var_144_0.localEulerAngles

				var_144_9.z = 0
				var_144_9.x = 0
				var_144_0.localEulerAngles = var_144_9
			end

			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_144_11 = 0

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_144_12 = arg_141_1.actors_["1184ui_story"]
			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 and arg_141_1.var_.characterEffect1184ui_story == nil then
				arg_141_1.var_.characterEffect1184ui_story = var_144_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_14 = 0.2

			if var_144_13 <= arg_141_1.time_ and arg_141_1.time_ < var_144_13 + var_144_14 then
				local var_144_15 = (arg_141_1.time_ - var_144_13) / var_144_14

				if arg_141_1.var_.characterEffect1184ui_story then
					arg_141_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_13 + var_144_14 and arg_141_1.time_ < var_144_13 + var_144_14 + arg_144_0 and arg_141_1.var_.characterEffect1184ui_story then
				arg_141_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_144_16 = 0
			local var_144_17 = 0.425

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_18 = arg_141_1:FormatText(StoryNameCfg[6].name)

				arg_141_1.leftNameTxt_.text = var_144_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_19 = arg_141_1:GetWordFromCfg(114162034)
				local var_144_20 = arg_141_1:FormatText(var_144_19.content)

				arg_141_1.text_.text = var_144_20

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_21 = 17
				local var_144_22 = utf8.len(var_144_20)
				local var_144_23 = var_144_21 <= 0 and var_144_17 or var_144_17 * (var_144_22 / var_144_21)

				if var_144_23 > 0 and var_144_17 < var_144_23 then
					arg_141_1.talkMaxDuration = var_144_23

					if var_144_23 + var_144_16 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_23 + var_144_16
					end
				end

				arg_141_1.text_.text = var_144_20
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162034", "story_v_out_114162.awb") ~= 0 then
					local var_144_24 = manager.audio:GetVoiceLength("story_v_out_114162", "114162034", "story_v_out_114162.awb") / 1000

					if var_144_24 + var_144_16 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_24 + var_144_16
					end

					if var_144_19.prefab_name ~= "" and arg_141_1.actors_[var_144_19.prefab_name] ~= nil then
						local var_144_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_19.prefab_name].transform, "story_v_out_114162", "114162034", "story_v_out_114162.awb")

						arg_141_1:RecordAudio("114162034", var_144_25)
						arg_141_1:RecordAudio("114162034", var_144_25)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_114162", "114162034", "story_v_out_114162.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_114162", "114162034", "story_v_out_114162.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_26 = math.max(var_144_17, arg_141_1.talkMaxDuration)

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_26 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_16) / var_144_26

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_16 + var_144_26 and arg_141_1.time_ < var_144_16 + var_144_26 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play114162035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 114162035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play114162036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1184ui_story"].transform
			local var_148_1 = 1.99973371195483e-12

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1184ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, 100, 0)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1184ui_story, var_148_4, var_148_3)

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

			local var_148_9 = 0
			local var_148_10 = 1

			if var_148_9 < arg_145_1.time_ and arg_145_1.time_ <= var_148_9 + arg_148_0 then
				local var_148_11 = "play"
				local var_148_12 = "effect"

				arg_145_1:AudioAction(var_148_11, var_148_12, "se_story_11", "se_story_11_piano", "")
			end

			local var_148_13 = 0
			local var_148_14 = 0.075

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(114162035)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 3
				local var_148_18 = utf8.len(var_148_16)
				local var_148_19 = var_148_17 <= 0 and var_148_14 or var_148_14 * (var_148_18 / var_148_17)

				if var_148_19 > 0 and var_148_14 < var_148_19 then
					arg_145_1.talkMaxDuration = var_148_19

					if var_148_19 + var_148_13 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_13
					end
				end

				arg_145_1.text_.text = var_148_16
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_20 = math.max(var_148_14, arg_145_1.talkMaxDuration)

			if var_148_13 <= arg_145_1.time_ and arg_145_1.time_ < var_148_13 + var_148_20 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_13) / var_148_20

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_13 + var_148_20 and arg_145_1.time_ < var_148_13 + var_148_20 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play114162036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 114162036
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play114162037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.5

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_2 = arg_149_1:GetWordFromCfg(114162036)
				local var_152_3 = arg_149_1:FormatText(var_152_2.content)

				arg_149_1.text_.text = var_152_3

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_4 = 20
				local var_152_5 = utf8.len(var_152_3)
				local var_152_6 = var_152_4 <= 0 and var_152_1 or var_152_1 * (var_152_5 / var_152_4)

				if var_152_6 > 0 and var_152_1 < var_152_6 then
					arg_149_1.talkMaxDuration = var_152_6

					if var_152_6 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_6 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_3
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_7 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_7 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_7

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_7 and arg_149_1.time_ < var_152_0 + var_152_7 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play114162037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 114162037
		arg_153_1.duration_ = 5.433

		local var_153_0 = {
			ja = 5.033,
			ko = 5.233,
			zh = 5.033,
			en = 5.433
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
				arg_153_0:Play114162038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.525

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[36].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(114162037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 21
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162037", "story_v_out_114162.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162037", "story_v_out_114162.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_114162", "114162037", "story_v_out_114162.awb")

						arg_153_1:RecordAudio("114162037", var_156_9)
						arg_153_1:RecordAudio("114162037", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_114162", "114162037", "story_v_out_114162.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_114162", "114162037", "story_v_out_114162.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play114162038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 114162038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play114162039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 1.05

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_2 = arg_157_1:GetWordFromCfg(114162038)
				local var_160_3 = arg_157_1:FormatText(var_160_2.content)

				arg_157_1.text_.text = var_160_3

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_4 = 42
				local var_160_5 = utf8.len(var_160_3)
				local var_160_6 = var_160_4 <= 0 and var_160_1 or var_160_1 * (var_160_5 / var_160_4)

				if var_160_6 > 0 and var_160_1 < var_160_6 then
					arg_157_1.talkMaxDuration = var_160_6

					if var_160_6 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_6 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_3
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_7 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_7 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_7

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_7 and arg_157_1.time_ < var_160_0 + var_160_7 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play114162039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 114162039
		arg_161_1.duration_ = 3.3

		local var_161_0 = {
			ja = 3.3,
			ko = 2.166,
			zh = 2.8,
			en = 2
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
				arg_161_0:Play114162040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = manager.ui.mainCamera.transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.shakeOldPos10006ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.6

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / 0.066
				local var_164_4, var_164_5 = math.modf(var_164_3)

				var_164_0.localPosition = Vector3.New(var_164_5 * 0.13, var_164_5 * 0.13, var_164_5 * 0.13) + arg_161_1.var_.shakeOldPos10006ui_story
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = arg_161_1.var_.shakeOldPos10006ui_story
			end

			local var_164_6 = 0

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.allBtn_.enabled = false
			end

			local var_164_7 = 0.6

			if arg_161_1.time_ >= var_164_6 + var_164_7 and arg_161_1.time_ < var_164_6 + var_164_7 + arg_164_0 then
				arg_161_1.allBtn_.enabled = true
			end

			local var_164_8 = 0
			local var_164_9 = 0.175

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_10 = arg_161_1:FormatText(StoryNameCfg[212].name)

				arg_161_1.leftNameTxt_.text = var_164_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_11 = arg_161_1:GetWordFromCfg(114162039)
				local var_164_12 = arg_161_1:FormatText(var_164_11.content)

				arg_161_1.text_.text = var_164_12

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_13 = 7
				local var_164_14 = utf8.len(var_164_12)
				local var_164_15 = var_164_13 <= 0 and var_164_9 or var_164_9 * (var_164_14 / var_164_13)

				if var_164_15 > 0 and var_164_9 < var_164_15 then
					arg_161_1.talkMaxDuration = var_164_15

					if var_164_15 + var_164_8 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_15 + var_164_8
					end
				end

				arg_161_1.text_.text = var_164_12
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162039", "story_v_out_114162.awb") ~= 0 then
					local var_164_16 = manager.audio:GetVoiceLength("story_v_out_114162", "114162039", "story_v_out_114162.awb") / 1000

					if var_164_16 + var_164_8 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_16 + var_164_8
					end

					if var_164_11.prefab_name ~= "" and arg_161_1.actors_[var_164_11.prefab_name] ~= nil then
						local var_164_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_11.prefab_name].transform, "story_v_out_114162", "114162039", "story_v_out_114162.awb")

						arg_161_1:RecordAudio("114162039", var_164_17)
						arg_161_1:RecordAudio("114162039", var_164_17)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_114162", "114162039", "story_v_out_114162.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_114162", "114162039", "story_v_out_114162.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_18 = math.max(var_164_9, arg_161_1.talkMaxDuration)

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_18 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_8) / var_164_18

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_8 + var_164_18 and arg_161_1.time_ < var_164_8 + var_164_18 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play114162040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 114162040
		arg_165_1.duration_ = 2.033

		local var_165_0 = {
			ja = 2.033,
			ko = 1.2,
			zh = 1.133,
			en = 1.233
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
			arg_165_1.auto_ = false
		end

		function arg_165_1.playNext_(arg_167_0)
			arg_165_1.onStoryFinished_()
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.1

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[6].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(114162040)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 4
				local var_168_6 = utf8.len(var_168_4)
				local var_168_7 = var_168_5 <= 0 and var_168_1 or var_168_1 * (var_168_6 / var_168_5)

				if var_168_7 > 0 and var_168_1 < var_168_7 then
					arg_165_1.talkMaxDuration = var_168_7

					if var_168_7 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_7 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_4
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114162", "114162040", "story_v_out_114162.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_114162", "114162040", "story_v_out_114162.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_114162", "114162040", "story_v_out_114162.awb")

						arg_165_1:RecordAudio("114162040", var_168_9)
						arg_165_1:RecordAudio("114162040", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_114162", "114162040", "story_v_out_114162.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_114162", "114162040", "story_v_out_114162.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F05_1",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0212"
	},
	voices = {
		"story_v_out_114162.awb"
	}
}
