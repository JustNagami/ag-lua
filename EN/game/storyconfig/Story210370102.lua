return {
	Play103702001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103702001
		arg_1_1.duration_ = 11.1

		local var_1_0 = {
			ja = 11.1,
			ko = 9.3,
			en = 10.033
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
				arg_1_0:Play103702002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST13a"

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
				local var_4_5 = arg_1_1.bgs_.ST13a

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
					if iter_4_0 ~= "ST13a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.ST13a
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueST13a = var_4_20.a
					arg_1_1.var_.alphaMatValueST13a = var_4_19
				end

				arg_1_1.var_.alphaOldValueST13a = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueST13a, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueST13a then
					local var_4_24 = arg_1_1.var_.alphaMatValueST13a
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueST13a then
				local var_4_26 = arg_1_1.var_.alphaMatValueST13a
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = "1037ui_story"

			if arg_1_1.actors_[var_4_28] == nil then
				local var_4_29 = Object.Instantiate(Asset.Load("Char/" .. var_4_28), arg_1_1.stage_.transform)

				var_4_29.name = var_4_28
				var_4_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_28] = var_4_29

				local var_4_30 = var_4_29:GetComponentInChildren(typeof(CharacterEffect))

				var_4_30.enabled = true

				local var_4_31 = GameObjectTools.GetOrAddComponent(var_4_29, typeof(DynamicBoneHelper))

				if var_4_31 then
					var_4_31:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_30.transform, false)

				arg_1_1.var_[var_4_28 .. "Animator"] = var_4_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_28 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_28 .. "LipSync"] = var_4_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_32 = arg_1_1.actors_["1037ui_story"].transform
			local var_4_33 = 1.5

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				arg_1_1.var_.moveOldPos1037ui_story = var_4_32.localPosition
			end

			local var_4_34 = 0.001

			if var_4_33 <= arg_1_1.time_ and arg_1_1.time_ < var_4_33 + var_4_34 then
				local var_4_35 = (arg_1_1.time_ - var_4_33) / var_4_34
				local var_4_36 = Vector3.New(0, -1.09, -5.81)

				var_4_32.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1037ui_story, var_4_36, var_4_35)

				local var_4_37 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_37.x, var_4_37.y, var_4_37.z)

				local var_4_38 = var_4_32.localEulerAngles

				var_4_38.z = 0
				var_4_38.x = 0
				var_4_32.localEulerAngles = var_4_38
			end

			if arg_1_1.time_ >= var_4_33 + var_4_34 and arg_1_1.time_ < var_4_33 + var_4_34 + arg_4_0 then
				var_4_32.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_4_39 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_39.x, var_4_39.y, var_4_39.z)

				local var_4_40 = var_4_32.localEulerAngles

				var_4_40.z = 0
				var_4_40.x = 0
				var_4_32.localEulerAngles = var_4_40
			end

			local var_4_41 = arg_1_1.actors_["1037ui_story"]
			local var_4_42 = 1.5

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 and arg_1_1.var_.characterEffect1037ui_story == nil then
				arg_1_1.var_.characterEffect1037ui_story = var_4_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_43 = 0.2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43

				if arg_1_1.var_.characterEffect1037ui_story then
					arg_1_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 and arg_1_1.var_.characterEffect1037ui_story then
				arg_1_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_4_45 = 1.5

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_4_46 = 1.5

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				arg_1_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action1_1")
			end

			local var_4_47 = 0
			local var_4_48 = 1

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_51 = 2
			local var_4_52 = 1.5

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				local var_4_53 = "play"
				local var_4_54 = "music"

				arg_1_1:AudioAction(var_4_53, var_4_54, "bgm_side_daily05", "bgm_side_daily05", "bgm_side_daily05.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_55 = 1.5
			local var_4_56 = 0.825

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_57 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_57:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_58 = arg_1_1:FormatText(StoryNameCfg[15].name)

				arg_1_1.leftNameTxt_.text = var_4_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_59 = arg_1_1:GetWordFromCfg(103702001)
				local var_4_60 = arg_1_1:FormatText(var_4_59.content)

				arg_1_1.text_.text = var_4_60

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_61 = 33
				local var_4_62 = utf8.len(var_4_60)
				local var_4_63 = var_4_61 <= 0 and var_4_56 or var_4_56 * (var_4_62 / var_4_61)

				if var_4_63 > 0 and var_4_56 < var_4_63 then
					arg_1_1.talkMaxDuration = var_4_63
					var_4_55 = var_4_55 + 0.3

					if var_4_63 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_63 + var_4_55
					end
				end

				arg_1_1.text_.text = var_4_60
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702001", "story_v_side_old_103702.awb") ~= 0 then
					local var_4_64 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702001", "story_v_side_old_103702.awb") / 1000

					if var_4_64 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_64 + var_4_55
					end

					if var_4_59.prefab_name ~= "" and arg_1_1.actors_[var_4_59.prefab_name] ~= nil then
						local var_4_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_59.prefab_name].transform, "story_v_side_old_103702", "103702001", "story_v_side_old_103702.awb")

						arg_1_1:RecordAudio("103702001", var_4_65)
						arg_1_1:RecordAudio("103702001", var_4_65)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702001", "story_v_side_old_103702.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702001", "story_v_side_old_103702.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_66 = var_4_55 + 0.3
			local var_4_67 = math.max(var_4_56, arg_1_1.talkMaxDuration)

			if var_4_66 <= arg_1_1.time_ and arg_1_1.time_ < var_4_66 + var_4_67 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_66) / var_4_67

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_66 + var_4_67 and arg_1_1.time_ < var_4_66 + var_4_67 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play103702002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103702002
		arg_7_1.duration_ = 16.2

		local var_7_0 = {
			ja = 14.3,
			ko = 16.2,
			en = 12.866
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
				arg_7_0:Play103702003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action5_1")
			end

			local var_10_2 = 0
			local var_10_3 = 1.875

			if var_10_2 < arg_7_1.time_ and arg_7_1.time_ <= var_10_2 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_4 = arg_7_1:FormatText(StoryNameCfg[15].name)

				arg_7_1.leftNameTxt_.text = var_10_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_5 = arg_7_1:GetWordFromCfg(103702002)
				local var_10_6 = arg_7_1:FormatText(var_10_5.content)

				arg_7_1.text_.text = var_10_6

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_7 = 75
				local var_10_8 = utf8.len(var_10_6)
				local var_10_9 = var_10_7 <= 0 and var_10_3 or var_10_3 * (var_10_8 / var_10_7)

				if var_10_9 > 0 and var_10_3 < var_10_9 then
					arg_7_1.talkMaxDuration = var_10_9

					if var_10_9 + var_10_2 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_9 + var_10_2
					end
				end

				arg_7_1.text_.text = var_10_6
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702002", "story_v_side_old_103702.awb") ~= 0 then
					local var_10_10 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702002", "story_v_side_old_103702.awb") / 1000

					if var_10_10 + var_10_2 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_10 + var_10_2
					end

					if var_10_5.prefab_name ~= "" and arg_7_1.actors_[var_10_5.prefab_name] ~= nil then
						local var_10_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_5.prefab_name].transform, "story_v_side_old_103702", "103702002", "story_v_side_old_103702.awb")

						arg_7_1:RecordAudio("103702002", var_10_11)
						arg_7_1:RecordAudio("103702002", var_10_11)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702002", "story_v_side_old_103702.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702002", "story_v_side_old_103702.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_12 = math.max(var_10_3, arg_7_1.talkMaxDuration)

			if var_10_2 <= arg_7_1.time_ and arg_7_1.time_ < var_10_2 + var_10_12 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_2) / var_10_12

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_2 + var_10_12 and arg_7_1.time_ < var_10_2 + var_10_12 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play103702003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103702003
		arg_11_1.duration_ = 18.366

		local var_11_0 = {
			ja = 16.633,
			ko = 16.2,
			en = 18.366
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
				arg_11_0:Play103702004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_14_1 = 0
			local var_14_2 = 1.775

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_3 = arg_11_1:FormatText(StoryNameCfg[15].name)

				arg_11_1.leftNameTxt_.text = var_14_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_4 = arg_11_1:GetWordFromCfg(103702003)
				local var_14_5 = arg_11_1:FormatText(var_14_4.content)

				arg_11_1.text_.text = var_14_5

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_6 = 71
				local var_14_7 = utf8.len(var_14_5)
				local var_14_8 = var_14_6 <= 0 and var_14_2 or var_14_2 * (var_14_7 / var_14_6)

				if var_14_8 > 0 and var_14_2 < var_14_8 then
					arg_11_1.talkMaxDuration = var_14_8

					if var_14_8 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_1
					end
				end

				arg_11_1.text_.text = var_14_5
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702003", "story_v_side_old_103702.awb") ~= 0 then
					local var_14_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702003", "story_v_side_old_103702.awb") / 1000

					if var_14_9 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_1
					end

					if var_14_4.prefab_name ~= "" and arg_11_1.actors_[var_14_4.prefab_name] ~= nil then
						local var_14_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_4.prefab_name].transform, "story_v_side_old_103702", "103702003", "story_v_side_old_103702.awb")

						arg_11_1:RecordAudio("103702003", var_14_10)
						arg_11_1:RecordAudio("103702003", var_14_10)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702003", "story_v_side_old_103702.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702003", "story_v_side_old_103702.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_11 = math.max(var_14_2, arg_11_1.talkMaxDuration)

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_11 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_1) / var_14_11

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_1 + var_14_11 and arg_11_1.time_ < var_14_1 + var_14_11 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play103702004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103702004
		arg_15_1.duration_ = 13.8

		local var_15_0 = {
			ja = 13.8,
			ko = 11.966,
			en = 10
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
				arg_15_0:Play103702005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action452")
			end

			local var_18_2 = 0
			local var_18_3 = 1.6

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_4 = arg_15_1:FormatText(StoryNameCfg[15].name)

				arg_15_1.leftNameTxt_.text = var_18_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_5 = arg_15_1:GetWordFromCfg(103702004)
				local var_18_6 = arg_15_1:FormatText(var_18_5.content)

				arg_15_1.text_.text = var_18_6

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_7 = 64
				local var_18_8 = utf8.len(var_18_6)
				local var_18_9 = var_18_7 <= 0 and var_18_3 or var_18_3 * (var_18_8 / var_18_7)

				if var_18_9 > 0 and var_18_3 < var_18_9 then
					arg_15_1.talkMaxDuration = var_18_9

					if var_18_9 + var_18_2 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_9 + var_18_2
					end
				end

				arg_15_1.text_.text = var_18_6
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702004", "story_v_side_old_103702.awb") ~= 0 then
					local var_18_10 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702004", "story_v_side_old_103702.awb") / 1000

					if var_18_10 + var_18_2 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_10 + var_18_2
					end

					if var_18_5.prefab_name ~= "" and arg_15_1.actors_[var_18_5.prefab_name] ~= nil then
						local var_18_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_5.prefab_name].transform, "story_v_side_old_103702", "103702004", "story_v_side_old_103702.awb")

						arg_15_1:RecordAudio("103702004", var_18_11)
						arg_15_1:RecordAudio("103702004", var_18_11)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702004", "story_v_side_old_103702.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702004", "story_v_side_old_103702.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_12 = math.max(var_18_3, arg_15_1.talkMaxDuration)

			if var_18_2 <= arg_15_1.time_ and arg_15_1.time_ < var_18_2 + var_18_12 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_2) / var_18_12

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_2 + var_18_12 and arg_15_1.time_ < var_18_2 + var_18_12 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play103702005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103702005
		arg_19_1.duration_ = 5.033

		local var_19_0 = {
			ja = 5.033,
			ko = 3.2,
			en = 4.566
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
				arg_19_0:Play103702006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_22_1 = 0
			local var_22_2 = 0.5

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[15].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(103702005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 20
				local var_22_7 = utf8.len(var_22_5)
				local var_22_8 = var_22_6 <= 0 and var_22_2 or var_22_2 * (var_22_7 / var_22_6)

				if var_22_8 > 0 and var_22_2 < var_22_8 then
					arg_19_1.talkMaxDuration = var_22_8

					if var_22_8 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_1
					end
				end

				arg_19_1.text_.text = var_22_5
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702005", "story_v_side_old_103702.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702005", "story_v_side_old_103702.awb") / 1000

					if var_22_9 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_1
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_side_old_103702", "103702005", "story_v_side_old_103702.awb")

						arg_19_1:RecordAudio("103702005", var_22_10)
						arg_19_1:RecordAudio("103702005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702005", "story_v_side_old_103702.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702005", "story_v_side_old_103702.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_11 = math.max(var_22_2, arg_19_1.talkMaxDuration)

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_11 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_1) / var_22_11

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_1 + var_22_11 and arg_19_1.time_ < var_22_1 + var_22_11 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play103702006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 103702006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play103702007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1037ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1037ui_story == nil then
				arg_23_1.var_.characterEffect1037ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1037ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1037ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1037ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1037ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.95

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

				local var_26_8 = arg_23_1:GetWordFromCfg(103702006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 38
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
	Play103702007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 103702007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play103702008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1037ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1037ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1037ui_story, var_30_4, var_30_3)

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

			local var_30_9 = 0
			local var_30_10 = 1

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_11 = arg_27_1:GetWordFromCfg(103702007)
				local var_30_12 = arg_27_1:FormatText(var_30_11.content)

				arg_27_1.text_.text = var_30_12

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_13 = 40
				local var_30_14 = utf8.len(var_30_12)
				local var_30_15 = var_30_13 <= 0 and var_30_10 or var_30_10 * (var_30_14 / var_30_13)

				if var_30_15 > 0 and var_30_10 < var_30_15 then
					arg_27_1.talkMaxDuration = var_30_15

					if var_30_15 + var_30_9 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_15 + var_30_9
					end
				end

				arg_27_1.text_.text = var_30_12
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_10, arg_27_1.talkMaxDuration)

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_9) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_9 + var_30_16 and arg_27_1.time_ < var_30_9 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play103702008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 103702008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play103702009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.7

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

				local var_34_2 = arg_31_1:GetWordFromCfg(103702008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 28
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
	Play103702009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 103702009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play103702010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.6

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(103702009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 24
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
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_8 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_8 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_8

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_8 and arg_35_1.time_ < var_38_0 + var_38_8 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play103702010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 103702010
		arg_39_1.duration_ = 11.3

		local var_39_0 = {
			ja = 7.233,
			ko = 11.3,
			en = 7.633
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
				arg_39_0:Play103702011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1037ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1037ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, -1.09, -5.81)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1037ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1037ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1037ui_story == nil then
				arg_39_1.var_.characterEffect1037ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.2

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1037ui_story then
					arg_39_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1037ui_story then
				arg_39_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_42_15 = 0
			local var_42_16 = 1.1

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_17 = arg_39_1:FormatText(StoryNameCfg[15].name)

				arg_39_1.leftNameTxt_.text = var_42_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_18 = arg_39_1:GetWordFromCfg(103702010)
				local var_42_19 = arg_39_1:FormatText(var_42_18.content)

				arg_39_1.text_.text = var_42_19

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_20 = 44
				local var_42_21 = utf8.len(var_42_19)
				local var_42_22 = var_42_20 <= 0 and var_42_16 or var_42_16 * (var_42_21 / var_42_20)

				if var_42_22 > 0 and var_42_16 < var_42_22 then
					arg_39_1.talkMaxDuration = var_42_22

					if var_42_22 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_22 + var_42_15
					end
				end

				arg_39_1.text_.text = var_42_19
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702010", "story_v_side_old_103702.awb") ~= 0 then
					local var_42_23 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702010", "story_v_side_old_103702.awb") / 1000

					if var_42_23 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_23 + var_42_15
					end

					if var_42_18.prefab_name ~= "" and arg_39_1.actors_[var_42_18.prefab_name] ~= nil then
						local var_42_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_18.prefab_name].transform, "story_v_side_old_103702", "103702010", "story_v_side_old_103702.awb")

						arg_39_1:RecordAudio("103702010", var_42_24)
						arg_39_1:RecordAudio("103702010", var_42_24)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702010", "story_v_side_old_103702.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702010", "story_v_side_old_103702.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_25 = math.max(var_42_16, arg_39_1.talkMaxDuration)

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_25 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_15) / var_42_25

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_15 + var_42_25 and arg_39_1.time_ < var_42_15 + var_42_25 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play103702011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 103702011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play103702012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1037ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1037ui_story == nil then
				arg_43_1.var_.characterEffect1037ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1037ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1037ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1037ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1037ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0
			local var_46_7 = 0.4

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(103702011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 16
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_14 and arg_43_1.time_ < var_46_6 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play103702012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 103702012
		arg_47_1.duration_ = 12.2

		local var_47_0 = {
			ja = 12.2,
			ko = 8.6,
			en = 8
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
				arg_47_0:Play103702013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1037ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1037ui_story == nil then
				arg_47_1.var_.characterEffect1037ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1037ui_story then
					arg_47_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1037ui_story then
				arg_47_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action423")
			end

			local var_50_6 = 0
			local var_50_7 = 0.85

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[15].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(103702012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 34
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702012", "story_v_side_old_103702.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702012", "story_v_side_old_103702.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_side_old_103702", "103702012", "story_v_side_old_103702.awb")

						arg_47_1:RecordAudio("103702012", var_50_15)
						arg_47_1:RecordAudio("103702012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702012", "story_v_side_old_103702.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702012", "story_v_side_old_103702.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_16 and arg_47_1.time_ < var_50_6 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play103702013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 103702013
		arg_51_1.duration_ = 11.6

		local var_51_0 = {
			ja = 11.6,
			ko = 6.5,
			en = 8.933
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
				arg_51_0:Play103702014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_54_1 = 0
			local var_54_2 = 0.575

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_3 = arg_51_1:FormatText(StoryNameCfg[15].name)

				arg_51_1.leftNameTxt_.text = var_54_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_4 = arg_51_1:GetWordFromCfg(103702013)
				local var_54_5 = arg_51_1:FormatText(var_54_4.content)

				arg_51_1.text_.text = var_54_5

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_6 = 23
				local var_54_7 = utf8.len(var_54_5)
				local var_54_8 = var_54_6 <= 0 and var_54_2 or var_54_2 * (var_54_7 / var_54_6)

				if var_54_8 > 0 and var_54_2 < var_54_8 then
					arg_51_1.talkMaxDuration = var_54_8

					if var_54_8 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_1
					end
				end

				arg_51_1.text_.text = var_54_5
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702013", "story_v_side_old_103702.awb") ~= 0 then
					local var_54_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702013", "story_v_side_old_103702.awb") / 1000

					if var_54_9 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_1
					end

					if var_54_4.prefab_name ~= "" and arg_51_1.actors_[var_54_4.prefab_name] ~= nil then
						local var_54_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_4.prefab_name].transform, "story_v_side_old_103702", "103702013", "story_v_side_old_103702.awb")

						arg_51_1:RecordAudio("103702013", var_54_10)
						arg_51_1:RecordAudio("103702013", var_54_10)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702013", "story_v_side_old_103702.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702013", "story_v_side_old_103702.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_11 = math.max(var_54_2, arg_51_1.talkMaxDuration)

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_11 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_1) / var_54_11

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_1 + var_54_11 and arg_51_1.time_ < var_54_1 + var_54_11 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play103702014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 103702014
		arg_55_1.duration_ = 0.166666666666

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"

			SetActive(arg_55_1.choicesGo_, true)

			for iter_56_0, iter_56_1 in ipairs(arg_55_1.choices_) do
				local var_56_0 = iter_56_0 <= 1

				SetActive(iter_56_1.go, var_56_0)
			end

			arg_55_1.choices_[1].txt.text = arg_55_1:FormatText(StoryChoiceCfg[121].name)
			arg_55_1.choices_[2].txt.text = arg_55_1:FormatText(StoryChoiceCfg[122].name)
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play103702015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			return
		end
	end,
	Play103702015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 103702015
		arg_59_1.duration_ = 13.033

		local var_59_0 = {
			ja = 13.033,
			ko = 8.333,
			en = 8.3
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
				arg_59_0:Play103702016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_62_1 = 0
			local var_62_2 = 1.125

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_3 = arg_59_1:FormatText(StoryNameCfg[15].name)

				arg_59_1.leftNameTxt_.text = var_62_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_4 = arg_59_1:GetWordFromCfg(103702015)
				local var_62_5 = arg_59_1:FormatText(var_62_4.content)

				arg_59_1.text_.text = var_62_5

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_6 = 45
				local var_62_7 = utf8.len(var_62_5)
				local var_62_8 = var_62_6 <= 0 and var_62_2 or var_62_2 * (var_62_7 / var_62_6)

				if var_62_8 > 0 and var_62_2 < var_62_8 then
					arg_59_1.talkMaxDuration = var_62_8

					if var_62_8 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_1
					end
				end

				arg_59_1.text_.text = var_62_5
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702015", "story_v_side_old_103702.awb") ~= 0 then
					local var_62_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702015", "story_v_side_old_103702.awb") / 1000

					if var_62_9 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_9 + var_62_1
					end

					if var_62_4.prefab_name ~= "" and arg_59_1.actors_[var_62_4.prefab_name] ~= nil then
						local var_62_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_4.prefab_name].transform, "story_v_side_old_103702", "103702015", "story_v_side_old_103702.awb")

						arg_59_1:RecordAudio("103702015", var_62_10)
						arg_59_1:RecordAudio("103702015", var_62_10)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702015", "story_v_side_old_103702.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702015", "story_v_side_old_103702.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_11 = math.max(var_62_2, arg_59_1.talkMaxDuration)

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_11 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_1) / var_62_11

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_1 + var_62_11 and arg_59_1.time_ < var_62_1 + var_62_11 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play103702016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 103702016
		arg_63_1.duration_ = 4.2

		local var_63_0 = {
			ja = 3.5,
			ko = 2.2,
			en = 4.2
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
				arg_63_0:Play103702017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action437")
			end

			local var_66_2 = 0
			local var_66_3 = 0.275

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_4 = arg_63_1:FormatText(StoryNameCfg[15].name)

				arg_63_1.leftNameTxt_.text = var_66_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_5 = arg_63_1:GetWordFromCfg(103702016)
				local var_66_6 = arg_63_1:FormatText(var_66_5.content)

				arg_63_1.text_.text = var_66_6

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_7 = 11
				local var_66_8 = utf8.len(var_66_6)
				local var_66_9 = var_66_7 <= 0 and var_66_3 or var_66_3 * (var_66_8 / var_66_7)

				if var_66_9 > 0 and var_66_3 < var_66_9 then
					arg_63_1.talkMaxDuration = var_66_9

					if var_66_9 + var_66_2 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_9 + var_66_2
					end
				end

				arg_63_1.text_.text = var_66_6
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702016", "story_v_side_old_103702.awb") ~= 0 then
					local var_66_10 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702016", "story_v_side_old_103702.awb") / 1000

					if var_66_10 + var_66_2 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_10 + var_66_2
					end

					if var_66_5.prefab_name ~= "" and arg_63_1.actors_[var_66_5.prefab_name] ~= nil then
						local var_66_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_5.prefab_name].transform, "story_v_side_old_103702", "103702016", "story_v_side_old_103702.awb")

						arg_63_1:RecordAudio("103702016", var_66_11)
						arg_63_1:RecordAudio("103702016", var_66_11)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702016", "story_v_side_old_103702.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702016", "story_v_side_old_103702.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_12 = math.max(var_66_3, arg_63_1.talkMaxDuration)

			if var_66_2 <= arg_63_1.time_ and arg_63_1.time_ < var_66_2 + var_66_12 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_2) / var_66_12

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_2 + var_66_12 and arg_63_1.time_ < var_66_2 + var_66_12 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play103702017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 103702017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play103702018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1037ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1037ui_story == nil then
				arg_67_1.var_.characterEffect1037ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1037ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1037ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1037ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1037ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.925

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[7].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(103702017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 37
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
	Play103702018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 103702018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play103702019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.575

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[7].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(103702018)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 23
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_8 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_8 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_8

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_8 and arg_71_1.time_ < var_74_0 + var_74_8 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play103702019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 103702019
		arg_75_1.duration_ = 4.666

		local var_75_0 = {
			ja = 4.666,
			en = 4.333
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
				arg_75_0:Play103702020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.475

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[10].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(103702019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702019", "story_v_side_old_103702.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702019", "story_v_side_old_103702.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_side_old_103702", "103702019", "story_v_side_old_103702.awb")

						arg_75_1:RecordAudio("103702019", var_78_9)
						arg_75_1:RecordAudio("103702019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702019", "story_v_side_old_103702.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702019", "story_v_side_old_103702.awb")
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
	Play103702020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 103702020
		arg_79_1.duration_ = 3.9

		local var_79_0 = {
			ja = 2.7,
			ko = 3.9,
			en = 3.166
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
				arg_79_0:Play103702021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1037ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1037ui_story == nil then
				arg_79_1.var_.characterEffect1037ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1037ui_story then
					arg_79_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1037ui_story then
				arg_79_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action472")
			end

			local var_82_6 = 0
			local var_82_7 = 0.35

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[15].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(103702020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702020", "story_v_side_old_103702.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702020", "story_v_side_old_103702.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_side_old_103702", "103702020", "story_v_side_old_103702.awb")

						arg_79_1:RecordAudio("103702020", var_82_15)
						arg_79_1:RecordAudio("103702020", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702020", "story_v_side_old_103702.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702020", "story_v_side_old_103702.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_16 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_16 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_16

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_16 and arg_79_1.time_ < var_82_6 + var_82_16 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play103702021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 103702021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play103702022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1037ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1037ui_story == nil then
				arg_83_1.var_.characterEffect1037ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1037ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1037ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1037ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1037ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.6

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_8 = arg_83_1:GetWordFromCfg(103702021)
				local var_86_9 = arg_83_1:FormatText(var_86_8.content)

				arg_83_1.text_.text = var_86_9

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_10 = 24
				local var_86_11 = utf8.len(var_86_9)
				local var_86_12 = var_86_10 <= 0 and var_86_7 or var_86_7 * (var_86_11 / var_86_10)

				if var_86_12 > 0 and var_86_7 < var_86_12 then
					arg_83_1.talkMaxDuration = var_86_12

					if var_86_12 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_12 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_9
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_13 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_13 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_13

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_13 and arg_83_1.time_ < var_86_6 + var_86_13 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play103702022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 103702022
		arg_87_1.duration_ = 6.3

		local var_87_0 = {
			ja = 4.166,
			ko = 4.366,
			en = 6.3
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
				arg_87_0:Play103702023(arg_87_1)
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

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[10].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(103702022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702022", "story_v_side_old_103702.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702022", "story_v_side_old_103702.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_side_old_103702", "103702022", "story_v_side_old_103702.awb")

						arg_87_1:RecordAudio("103702022", var_90_9)
						arg_87_1:RecordAudio("103702022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702022", "story_v_side_old_103702.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702022", "story_v_side_old_103702.awb")
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
	Play103702023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 103702023
		arg_91_1.duration_ = 6.1

		local var_91_0 = {
			ja = 5.6,
			ko = 5.3,
			en = 6.1
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
				arg_91_0:Play103702024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1037ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1037ui_story == nil then
				arg_91_1.var_.characterEffect1037ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1037ui_story then
					arg_91_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1037ui_story then
				arg_91_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_94_4 = 0

			if var_94_4 < arg_91_1.time_ and arg_91_1.time_ <= var_94_4 + arg_94_0 then
				arg_91_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_94_5 = 0
			local var_94_6 = 0.775

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_7 = arg_91_1:FormatText(StoryNameCfg[15].name)

				arg_91_1.leftNameTxt_.text = var_94_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(103702023)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 31
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_6 or var_94_6 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_6 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_5 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_5
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702023", "story_v_side_old_103702.awb") ~= 0 then
					local var_94_13 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702023", "story_v_side_old_103702.awb") / 1000

					if var_94_13 + var_94_5 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_5
					end

					if var_94_8.prefab_name ~= "" and arg_91_1.actors_[var_94_8.prefab_name] ~= nil then
						local var_94_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_8.prefab_name].transform, "story_v_side_old_103702", "103702023", "story_v_side_old_103702.awb")

						arg_91_1:RecordAudio("103702023", var_94_14)
						arg_91_1:RecordAudio("103702023", var_94_14)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702023", "story_v_side_old_103702.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702023", "story_v_side_old_103702.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_15 = math.max(var_94_6, arg_91_1.talkMaxDuration)

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_15 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_5) / var_94_15

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_5 + var_94_15 and arg_91_1.time_ < var_94_5 + var_94_15 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play103702024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 103702024
		arg_95_1.duration_ = 10.2

		local var_95_0 = {
			ja = 10.2,
			ko = 6.233,
			en = 7.066
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
				arg_95_0:Play103702025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1037ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1037ui_story == nil then
				arg_95_1.var_.characterEffect1037ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.2

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1037ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1037ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1037ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1037ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.7

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[10].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(103702024)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 28
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702024", "story_v_side_old_103702.awb") ~= 0 then
					local var_98_14 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702024", "story_v_side_old_103702.awb") / 1000

					if var_98_14 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_6
					end

					if var_98_9.prefab_name ~= "" and arg_95_1.actors_[var_98_9.prefab_name] ~= nil then
						local var_98_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_9.prefab_name].transform, "story_v_side_old_103702", "103702024", "story_v_side_old_103702.awb")

						arg_95_1:RecordAudio("103702024", var_98_15)
						arg_95_1:RecordAudio("103702024", var_98_15)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702024", "story_v_side_old_103702.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702024", "story_v_side_old_103702.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_16 and arg_95_1.time_ < var_98_6 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play103702025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 103702025
		arg_99_1.duration_ = 0.166666666666

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"

			SetActive(arg_99_1.choicesGo_, true)

			for iter_100_0, iter_100_1 in ipairs(arg_99_1.choices_) do
				local var_100_0 = iter_100_0 <= 2

				SetActive(iter_100_1.go, var_100_0)
			end

			arg_99_1.choices_[1].txt.text = arg_99_1:FormatText(StoryChoiceCfg[123].name)
			arg_99_1.choices_[2].txt.text = arg_99_1:FormatText(StoryChoiceCfg[124].name)
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play103702026(arg_99_1)
			end

			if arg_101_0 == 2 then
				arg_99_0:Play103702027(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			return
		end
	end,
	Play103702026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 103702026
		arg_103_1.duration_ = 10.633

		local var_103_0 = {
			ja = 10.633,
			ko = 7.8,
			en = 10.433
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
				arg_103_0:Play103702028(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.925

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[10].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(103702026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702026", "story_v_side_old_103702.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702026", "story_v_side_old_103702.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_side_old_103702", "103702026", "story_v_side_old_103702.awb")

						arg_103_1:RecordAudio("103702026", var_106_9)
						arg_103_1:RecordAudio("103702026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702026", "story_v_side_old_103702.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702026", "story_v_side_old_103702.awb")
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
	Play103702028 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 103702028
		arg_107_1.duration_ = 4.833

		local var_107_0 = {
			ja = 4.833,
			ko = 3.1,
			en = 4.033
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
				arg_107_0:Play103702029(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1037ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1037ui_story == nil then
				arg_107_1.var_.characterEffect1037ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1037ui_story then
					arg_107_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1037ui_story then
				arg_107_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_110_4 = 0

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action424")
			end

			local var_110_6 = 0
			local var_110_7 = 0.4

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[15].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(103702028)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 16
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702028", "story_v_side_old_103702.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702028", "story_v_side_old_103702.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_side_old_103702", "103702028", "story_v_side_old_103702.awb")

						arg_107_1:RecordAudio("103702028", var_110_15)
						arg_107_1:RecordAudio("103702028", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702028", "story_v_side_old_103702.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702028", "story_v_side_old_103702.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_16 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_16

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_16 and arg_107_1.time_ < var_110_6 + var_110_16 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play103702029 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 103702029
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play103702030(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1037ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1037ui_story == nil then
				arg_111_1.var_.characterEffect1037ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1037ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1037ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1037ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1037ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.4

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(103702029)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 16
				local var_114_12 = utf8.len(var_114_10)
				local var_114_13 = var_114_11 <= 0 and var_114_7 or var_114_7 * (var_114_12 / var_114_11)

				if var_114_13 > 0 and var_114_7 < var_114_13 then
					arg_111_1.talkMaxDuration = var_114_13

					if var_114_13 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_13 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_10
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_14 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_14 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_14

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_14 and arg_111_1.time_ < var_114_6 + var_114_14 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play103702030 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 103702030
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play103702031(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1037ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1037ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0, 100, 0)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1037ui_story, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, 100, 0)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = 0
			local var_118_10 = 0.5

			if var_118_9 < arg_115_1.time_ and arg_115_1.time_ <= var_118_9 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_11 = arg_115_1:GetWordFromCfg(103702030)
				local var_118_12 = arg_115_1:FormatText(var_118_11.content)

				arg_115_1.text_.text = var_118_12

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_13 = 20
				local var_118_14 = utf8.len(var_118_12)
				local var_118_15 = var_118_13 <= 0 and var_118_10 or var_118_10 * (var_118_14 / var_118_13)

				if var_118_15 > 0 and var_118_10 < var_118_15 then
					arg_115_1.talkMaxDuration = var_118_15

					if var_118_15 + var_118_9 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_15 + var_118_9
					end
				end

				arg_115_1.text_.text = var_118_12
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_16 = math.max(var_118_10, arg_115_1.talkMaxDuration)

			if var_118_9 <= arg_115_1.time_ and arg_115_1.time_ < var_118_9 + var_118_16 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_9) / var_118_16

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_9 + var_118_16 and arg_115_1.time_ < var_118_9 + var_118_16 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play103702031 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 103702031
		arg_119_1.duration_ = 10.333

		local var_119_0 = {
			ja = 9.266,
			ko = 7.866,
			en = 10.333
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
				arg_119_0:Play103702032(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.775

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[10].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(103702031)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 31
				local var_122_6 = utf8.len(var_122_4)
				local var_122_7 = var_122_5 <= 0 and var_122_1 or var_122_1 * (var_122_6 / var_122_5)

				if var_122_7 > 0 and var_122_1 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_4
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702031", "story_v_side_old_103702.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702031", "story_v_side_old_103702.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_side_old_103702", "103702031", "story_v_side_old_103702.awb")

						arg_119_1:RecordAudio("103702031", var_122_9)
						arg_119_1:RecordAudio("103702031", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702031", "story_v_side_old_103702.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702031", "story_v_side_old_103702.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_10 and arg_119_1.time_ < var_122_0 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play103702032 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 103702032
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play103702033(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.4

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(103702032)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 16
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_8 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_8 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_8

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_8 and arg_123_1.time_ < var_126_0 + var_126_8 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play103702033 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 103702033
		arg_127_1.duration_ = 6.2

		local var_127_0 = {
			ja = 6.2,
			ko = 5.1,
			en = 6.066
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
				arg_127_0:Play103702034(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.65

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[10].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(103702033)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 26
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702033", "story_v_side_old_103702.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702033", "story_v_side_old_103702.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_side_old_103702", "103702033", "story_v_side_old_103702.awb")

						arg_127_1:RecordAudio("103702033", var_130_9)
						arg_127_1:RecordAudio("103702033", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702033", "story_v_side_old_103702.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702033", "story_v_side_old_103702.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play103702034 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 103702034
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play103702035(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.35

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[7].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(103702034)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 14
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_8 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_8 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_8

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_8 and arg_131_1.time_ < var_134_0 + var_134_8 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play103702035 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 103702035
		arg_135_1.duration_ = 8.633

		local var_135_0 = {
			ja = 8.4,
			ko = 6.066,
			en = 8.633
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
				arg_135_0:Play103702036(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.75

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[10].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, true)
				arg_135_1.iconController_:SetSelectedState("hero")

				arg_135_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(103702035)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 30
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702035", "story_v_side_old_103702.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702035", "story_v_side_old_103702.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_side_old_103702", "103702035", "story_v_side_old_103702.awb")

						arg_135_1:RecordAudio("103702035", var_138_9)
						arg_135_1:RecordAudio("103702035", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702035", "story_v_side_old_103702.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702035", "story_v_side_old_103702.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play103702036 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 103702036
		arg_139_1.duration_ = 8.266

		local var_139_0 = {
			ja = 8.266,
			ko = 7.1,
			en = 7.1
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
				arg_139_0:Play103702037(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.725

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[10].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, true)
				arg_139_1.iconController_:SetSelectedState("hero")

				arg_139_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(103702036)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702036", "story_v_side_old_103702.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702036", "story_v_side_old_103702.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_side_old_103702", "103702036", "story_v_side_old_103702.awb")

						arg_139_1:RecordAudio("103702036", var_142_9)
						arg_139_1:RecordAudio("103702036", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702036", "story_v_side_old_103702.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702036", "story_v_side_old_103702.awb")
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
	Play103702037 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 103702037
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play103702038(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.4

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(103702037)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 16
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play103702038 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 103702038
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play103702039(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.475

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_2 = arg_147_1:GetWordFromCfg(103702038)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 19
				local var_150_5 = utf8.len(var_150_3)
				local var_150_6 = var_150_4 <= 0 and var_150_1 or var_150_1 * (var_150_5 / var_150_4)

				if var_150_6 > 0 and var_150_1 < var_150_6 then
					arg_147_1.talkMaxDuration = var_150_6

					if var_150_6 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_6 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_3
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_7 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_7 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_7

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_7 and arg_147_1.time_ < var_150_0 + var_150_7 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play103702039 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 103702039
		arg_151_1.duration_ = 5.933

		local var_151_0 = {
			ja = 5.933,
			ko = 5,
			en = 3
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
				arg_151_0:Play103702040(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1037ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1037ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(0, -1.09, -5.81)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1037ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["1037ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect1037ui_story == nil then
				arg_151_1.var_.characterEffect1037ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.2

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect1037ui_story then
					arg_151_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect1037ui_story then
				arg_151_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action1_1")
			end

			local var_154_15 = 0
			local var_154_16 = 0.55

			if var_154_15 < arg_151_1.time_ and arg_151_1.time_ <= var_154_15 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_17 = arg_151_1:FormatText(StoryNameCfg[15].name)

				arg_151_1.leftNameTxt_.text = var_154_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_18 = arg_151_1:GetWordFromCfg(103702039)
				local var_154_19 = arg_151_1:FormatText(var_154_18.content)

				arg_151_1.text_.text = var_154_19

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_20 = 22
				local var_154_21 = utf8.len(var_154_19)
				local var_154_22 = var_154_20 <= 0 and var_154_16 or var_154_16 * (var_154_21 / var_154_20)

				if var_154_22 > 0 and var_154_16 < var_154_22 then
					arg_151_1.talkMaxDuration = var_154_22

					if var_154_22 + var_154_15 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_22 + var_154_15
					end
				end

				arg_151_1.text_.text = var_154_19
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702039", "story_v_side_old_103702.awb") ~= 0 then
					local var_154_23 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702039", "story_v_side_old_103702.awb") / 1000

					if var_154_23 + var_154_15 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_23 + var_154_15
					end

					if var_154_18.prefab_name ~= "" and arg_151_1.actors_[var_154_18.prefab_name] ~= nil then
						local var_154_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_18.prefab_name].transform, "story_v_side_old_103702", "103702039", "story_v_side_old_103702.awb")

						arg_151_1:RecordAudio("103702039", var_154_24)
						arg_151_1:RecordAudio("103702039", var_154_24)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702039", "story_v_side_old_103702.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702039", "story_v_side_old_103702.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_25 = math.max(var_154_16, arg_151_1.talkMaxDuration)

			if var_154_15 <= arg_151_1.time_ and arg_151_1.time_ < var_154_15 + var_154_25 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_15) / var_154_25

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_15 + var_154_25 and arg_151_1.time_ < var_154_15 + var_154_25 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play103702040 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 103702040
		arg_155_1.duration_ = 6.566

		local var_155_0 = {
			ja = 6.566,
			ko = 4.7,
			en = 4
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
				arg_155_0:Play103702041(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action5_1")
			end

			local var_158_2 = 0
			local var_158_3 = 0.625

			if var_158_2 < arg_155_1.time_ and arg_155_1.time_ <= var_158_2 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_4 = arg_155_1:FormatText(StoryNameCfg[15].name)

				arg_155_1.leftNameTxt_.text = var_158_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_5 = arg_155_1:GetWordFromCfg(103702040)
				local var_158_6 = arg_155_1:FormatText(var_158_5.content)

				arg_155_1.text_.text = var_158_6

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_7 = 25
				local var_158_8 = utf8.len(var_158_6)
				local var_158_9 = var_158_7 <= 0 and var_158_3 or var_158_3 * (var_158_8 / var_158_7)

				if var_158_9 > 0 and var_158_3 < var_158_9 then
					arg_155_1.talkMaxDuration = var_158_9

					if var_158_9 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_9 + var_158_2
					end
				end

				arg_155_1.text_.text = var_158_6
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702040", "story_v_side_old_103702.awb") ~= 0 then
					local var_158_10 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702040", "story_v_side_old_103702.awb") / 1000

					if var_158_10 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_2
					end

					if var_158_5.prefab_name ~= "" and arg_155_1.actors_[var_158_5.prefab_name] ~= nil then
						local var_158_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_5.prefab_name].transform, "story_v_side_old_103702", "103702040", "story_v_side_old_103702.awb")

						arg_155_1:RecordAudio("103702040", var_158_11)
						arg_155_1:RecordAudio("103702040", var_158_11)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702040", "story_v_side_old_103702.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702040", "story_v_side_old_103702.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_12 = math.max(var_158_3, arg_155_1.talkMaxDuration)

			if var_158_2 <= arg_155_1.time_ and arg_155_1.time_ < var_158_2 + var_158_12 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_2) / var_158_12

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_2 + var_158_12 and arg_155_1.time_ < var_158_2 + var_158_12 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play103702041 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 103702041
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play103702042(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1037ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1037ui_story == nil then
				arg_159_1.var_.characterEffect1037ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.2

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1037ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1037ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1037ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1037ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.675

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

				local var_162_9 = arg_159_1:GetWordFromCfg(103702041)
				local var_162_10 = arg_159_1:FormatText(var_162_9.content)

				arg_159_1.text_.text = var_162_10

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_11 = 27
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
	Play103702042 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 103702042
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play103702043(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.6

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

				local var_166_3 = arg_163_1:GetWordFromCfg(103702042)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 24
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
	Play103702043 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 103702043
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play103702044(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1037ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1037ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, 100, 0)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1037ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, 100, 0)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = 0
			local var_170_10 = 0.675

			if var_170_9 < arg_167_1.time_ and arg_167_1.time_ <= var_170_9 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_11 = arg_167_1:GetWordFromCfg(103702043)
				local var_170_12 = arg_167_1:FormatText(var_170_11.content)

				arg_167_1.text_.text = var_170_12

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_13 = 27
				local var_170_14 = utf8.len(var_170_12)
				local var_170_15 = var_170_13 <= 0 and var_170_10 or var_170_10 * (var_170_14 / var_170_13)

				if var_170_15 > 0 and var_170_10 < var_170_15 then
					arg_167_1.talkMaxDuration = var_170_15

					if var_170_15 + var_170_9 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_15 + var_170_9
					end
				end

				arg_167_1.text_.text = var_170_12
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_16 = math.max(var_170_10, arg_167_1.talkMaxDuration)

			if var_170_9 <= arg_167_1.time_ and arg_167_1.time_ < var_170_9 + var_170_16 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_9) / var_170_16

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_9 + var_170_16 and arg_167_1.time_ < var_170_9 + var_170_16 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play103702044 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 103702044
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play103702045(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_2 = arg_171_1:GetWordFromCfg(103702044)
				local var_174_3 = arg_171_1:FormatText(var_174_2.content)

				arg_171_1.text_.text = var_174_3

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_4 = 40
				local var_174_5 = utf8.len(var_174_3)
				local var_174_6 = var_174_4 <= 0 and var_174_1 or var_174_1 * (var_174_5 / var_174_4)

				if var_174_6 > 0 and var_174_1 < var_174_6 then
					arg_171_1.talkMaxDuration = var_174_6

					if var_174_6 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_6 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_3
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_7 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_7 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_7

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_7 and arg_171_1.time_ < var_174_0 + var_174_7 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play103702045 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 103702045
		arg_175_1.duration_ = 13.4

		local var_175_0 = {
			ja = 10.3,
			ko = 7.833,
			en = 13.4
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
				arg_175_0:Play103702046(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1037ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1037ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, -1.09, -5.81)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1037ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1037ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1037ui_story == nil then
				arg_175_1.var_.characterEffect1037ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.2

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1037ui_story then
					arg_175_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1037ui_story then
				arg_175_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_178_13 = 0

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				arg_175_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action1_1")
			end

			local var_178_15 = 0
			local var_178_16 = 0.75

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_17 = arg_175_1:FormatText(StoryNameCfg[15].name)

				arg_175_1.leftNameTxt_.text = var_178_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_18 = arg_175_1:GetWordFromCfg(103702045)
				local var_178_19 = arg_175_1:FormatText(var_178_18.content)

				arg_175_1.text_.text = var_178_19

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_20 = 30
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702045", "story_v_side_old_103702.awb") ~= 0 then
					local var_178_23 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702045", "story_v_side_old_103702.awb") / 1000

					if var_178_23 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_23 + var_178_15
					end

					if var_178_18.prefab_name ~= "" and arg_175_1.actors_[var_178_18.prefab_name] ~= nil then
						local var_178_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_18.prefab_name].transform, "story_v_side_old_103702", "103702045", "story_v_side_old_103702.awb")

						arg_175_1:RecordAudio("103702045", var_178_24)
						arg_175_1:RecordAudio("103702045", var_178_24)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702045", "story_v_side_old_103702.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702045", "story_v_side_old_103702.awb")
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
	Play103702046 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 103702046
		arg_179_1.duration_ = 5.7

		local var_179_0 = {
			ja = 3.4,
			ko = 1.999999999999,
			en = 5.7
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
				arg_179_0:Play103702047(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_182_1 = 0
			local var_182_2 = 0.125

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_3 = arg_179_1:FormatText(StoryNameCfg[15].name)

				arg_179_1.leftNameTxt_.text = var_182_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_4 = arg_179_1:GetWordFromCfg(103702046)
				local var_182_5 = arg_179_1:FormatText(var_182_4.content)

				arg_179_1.text_.text = var_182_5

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_6 = 5
				local var_182_7 = utf8.len(var_182_5)
				local var_182_8 = var_182_6 <= 0 and var_182_2 or var_182_2 * (var_182_7 / var_182_6)

				if var_182_8 > 0 and var_182_2 < var_182_8 then
					arg_179_1.talkMaxDuration = var_182_8

					if var_182_8 + var_182_1 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_1
					end
				end

				arg_179_1.text_.text = var_182_5
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702046", "story_v_side_old_103702.awb") ~= 0 then
					local var_182_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702046", "story_v_side_old_103702.awb") / 1000

					if var_182_9 + var_182_1 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_9 + var_182_1
					end

					if var_182_4.prefab_name ~= "" and arg_179_1.actors_[var_182_4.prefab_name] ~= nil then
						local var_182_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_4.prefab_name].transform, "story_v_side_old_103702", "103702046", "story_v_side_old_103702.awb")

						arg_179_1:RecordAudio("103702046", var_182_10)
						arg_179_1:RecordAudio("103702046", var_182_10)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702046", "story_v_side_old_103702.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702046", "story_v_side_old_103702.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_11 = math.max(var_182_2, arg_179_1.talkMaxDuration)

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_11 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_1) / var_182_11

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_1 + var_182_11 and arg_179_1.time_ < var_182_1 + var_182_11 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play103702047 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 103702047
		arg_183_1.duration_ = 6.5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play103702048(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.bgs_.ST13a
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				local var_186_2 = var_186_0:GetComponent("SpriteRenderer")

				if var_186_2 then
					var_186_2.material = arg_183_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_186_3 = var_186_2.material
					local var_186_4 = var_186_3:GetColor("_Color")

					arg_183_1.var_.alphaOldValueST13a = var_186_4.a
					arg_183_1.var_.alphaMatValueST13a = var_186_3
				end

				arg_183_1.var_.alphaOldValueST13a = 1
			end

			local var_186_5 = 1.5

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_5 then
				local var_186_6 = (arg_183_1.time_ - var_186_1) / var_186_5
				local var_186_7 = Mathf.Lerp(arg_183_1.var_.alphaOldValueST13a, 0, var_186_6)

				if arg_183_1.var_.alphaMatValueST13a then
					local var_186_8 = arg_183_1.var_.alphaMatValueST13a
					local var_186_9 = var_186_8:GetColor("_Color")

					var_186_9.a = var_186_7

					var_186_8:SetColor("_Color", var_186_9)
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_5 and arg_183_1.time_ < var_186_1 + var_186_5 + arg_186_0 and arg_183_1.var_.alphaMatValueST13a then
				local var_186_10 = arg_183_1.var_.alphaMatValueST13a
				local var_186_11 = var_186_10:GetColor("_Color")

				var_186_11.a = 0

				var_186_10:SetColor("_Color", var_186_11)
			end

			local var_186_12 = arg_183_1.actors_["1037ui_story"].transform
			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1.var_.moveOldPos1037ui_story = var_186_12.localPosition
			end

			local var_186_14 = 0.001

			if var_186_13 <= arg_183_1.time_ and arg_183_1.time_ < var_186_13 + var_186_14 then
				local var_186_15 = (arg_183_1.time_ - var_186_13) / var_186_14
				local var_186_16 = Vector3.New(0, 100, 0)

				var_186_12.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1037ui_story, var_186_16, var_186_15)

				local var_186_17 = manager.ui.mainCamera.transform.position - var_186_12.position

				var_186_12.forward = Vector3.New(var_186_17.x, var_186_17.y, var_186_17.z)

				local var_186_18 = var_186_12.localEulerAngles

				var_186_18.z = 0
				var_186_18.x = 0
				var_186_12.localEulerAngles = var_186_18
			end

			if arg_183_1.time_ >= var_186_13 + var_186_14 and arg_183_1.time_ < var_186_13 + var_186_14 + arg_186_0 then
				var_186_12.localPosition = Vector3.New(0, 100, 0)

				local var_186_19 = manager.ui.mainCamera.transform.position - var_186_12.position

				var_186_12.forward = Vector3.New(var_186_19.x, var_186_19.y, var_186_19.z)

				local var_186_20 = var_186_12.localEulerAngles

				var_186_20.z = 0
				var_186_20.x = 0
				var_186_12.localEulerAngles = var_186_20
			end

			if arg_183_1.frameCnt_ <= 1 then
				arg_183_1.dialog_:SetActive(false)
			end

			local var_186_21 = 1.5
			local var_186_22 = 0.175

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				arg_183_1.dialog_:SetActive(true)

				local var_186_23 = LeanTween.value(arg_183_1.dialog_, 0, 1, 0.3)

				var_186_23:setOnUpdate(LuaHelper.FloatAction(function(arg_187_0)
					arg_183_1.dialogCg_.alpha = arg_187_0
				end))
				var_186_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_183_1.dialog_)
					var_186_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_183_1.duration_ = arg_183_1.duration_ + 0.3

				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_24 = arg_183_1:GetWordFromCfg(103702047)
				local var_186_25 = arg_183_1:FormatText(var_186_24.content)

				arg_183_1.text_.text = var_186_25

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_26 = 7
				local var_186_27 = utf8.len(var_186_25)
				local var_186_28 = var_186_26 <= 0 and var_186_22 or var_186_22 * (var_186_27 / var_186_26)

				if var_186_28 > 0 and var_186_22 < var_186_28 then
					arg_183_1.talkMaxDuration = var_186_28
					var_186_21 = var_186_21 + 0.3

					if var_186_28 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_28 + var_186_21
					end
				end

				arg_183_1.text_.text = var_186_25
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_29 = var_186_21 + 0.3
			local var_186_30 = math.max(var_186_22, arg_183_1.talkMaxDuration)

			if var_186_29 <= arg_183_1.time_ and arg_183_1.time_ < var_186_29 + var_186_30 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_29) / var_186_30

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_29 + var_186_30 and arg_183_1.time_ < var_186_29 + var_186_30 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play103702048 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 103702048
		arg_189_1.duration_ = 19.2

		local var_189_0 = {
			ja = 19.2,
			ko = 16.3,
			en = 18.766
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play103702049(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = "ST12"

			if arg_189_1.bgs_[var_192_0] == nil then
				local var_192_1 = Object.Instantiate(arg_189_1.paintGo_)

				var_192_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_192_0)
				var_192_1.name = var_192_0
				var_192_1.transform.parent = arg_189_1.stage_.transform
				var_192_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_189_1.bgs_[var_192_0] = var_192_1
			end

			local var_192_2 = 0

			if var_192_2 < arg_189_1.time_ and arg_189_1.time_ <= var_192_2 + arg_192_0 then
				local var_192_3 = manager.ui.mainCamera.transform.localPosition
				local var_192_4 = Vector3.New(0, 0, 10) + Vector3.New(var_192_3.x, var_192_3.y, 0)
				local var_192_5 = arg_189_1.bgs_.ST12

				var_192_5.transform.localPosition = var_192_4
				var_192_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_192_6 = var_192_5:GetComponent("SpriteRenderer")

				if var_192_6 and var_192_6.sprite then
					local var_192_7 = (var_192_5.transform.localPosition - var_192_3).z
					local var_192_8 = manager.ui.mainCameraCom_
					local var_192_9 = 2 * var_192_7 * Mathf.Tan(var_192_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_192_10 = var_192_9 * var_192_8.aspect
					local var_192_11 = var_192_6.sprite.bounds.size.x
					local var_192_12 = var_192_6.sprite.bounds.size.y
					local var_192_13 = var_192_10 / var_192_11
					local var_192_14 = var_192_9 / var_192_12
					local var_192_15 = var_192_14 < var_192_13 and var_192_13 or var_192_14

					var_192_5.transform.localScale = Vector3.New(var_192_15, var_192_15, 0)
				end

				for iter_192_0, iter_192_1 in pairs(arg_189_1.bgs_) do
					if iter_192_0 ~= "ST12" then
						iter_192_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_192_16 = arg_189_1.bgs_.ST12
			local var_192_17 = 0

			if var_192_17 < arg_189_1.time_ and arg_189_1.time_ <= var_192_17 + arg_192_0 then
				local var_192_18 = var_192_16:GetComponent("SpriteRenderer")

				if var_192_18 then
					var_192_18.material = arg_189_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_192_19 = var_192_18.material
					local var_192_20 = var_192_19:GetColor("_Color")

					arg_189_1.var_.alphaOldValueST12 = var_192_20.a
					arg_189_1.var_.alphaMatValueST12 = var_192_19
				end

				arg_189_1.var_.alphaOldValueST12 = 0
			end

			local var_192_21 = 2.26666666666667

			if var_192_17 <= arg_189_1.time_ and arg_189_1.time_ < var_192_17 + var_192_21 then
				local var_192_22 = (arg_189_1.time_ - var_192_17) / var_192_21
				local var_192_23 = Mathf.Lerp(arg_189_1.var_.alphaOldValueST12, 1, var_192_22)

				if arg_189_1.var_.alphaMatValueST12 then
					local var_192_24 = arg_189_1.var_.alphaMatValueST12
					local var_192_25 = var_192_24:GetColor("_Color")

					var_192_25.a = var_192_23

					var_192_24:SetColor("_Color", var_192_25)
				end
			end

			if arg_189_1.time_ >= var_192_17 + var_192_21 and arg_189_1.time_ < var_192_17 + var_192_21 + arg_192_0 and arg_189_1.var_.alphaMatValueST12 then
				local var_192_26 = arg_189_1.var_.alphaMatValueST12
				local var_192_27 = var_192_26:GetColor("_Color")

				var_192_27.a = 1

				var_192_26:SetColor("_Color", var_192_27)
			end

			local var_192_28 = "1019ui_story"

			if arg_189_1.actors_[var_192_28] == nil then
				local var_192_29 = Object.Instantiate(Asset.Load("Char/" .. var_192_28), arg_189_1.stage_.transform)

				var_192_29.name = var_192_28
				var_192_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_189_1.actors_[var_192_28] = var_192_29

				local var_192_30 = var_192_29:GetComponentInChildren(typeof(CharacterEffect))

				var_192_30.enabled = true

				local var_192_31 = GameObjectTools.GetOrAddComponent(var_192_29, typeof(DynamicBoneHelper))

				if var_192_31 then
					var_192_31:EnableDynamicBone(false)
				end

				arg_189_1:ShowWeapon(var_192_30.transform, false)

				arg_189_1.var_[var_192_28 .. "Animator"] = var_192_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_189_1.var_[var_192_28 .. "Animator"].applyRootMotion = true
				arg_189_1.var_[var_192_28 .. "LipSync"] = var_192_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_192_32 = arg_189_1.actors_["1019ui_story"].transform
			local var_192_33 = 2

			if var_192_33 < arg_189_1.time_ and arg_189_1.time_ <= var_192_33 + arg_192_0 then
				arg_189_1.var_.moveOldPos1019ui_story = var_192_32.localPosition
			end

			local var_192_34 = 0.001

			if var_192_33 <= arg_189_1.time_ and arg_189_1.time_ < var_192_33 + var_192_34 then
				local var_192_35 = (arg_189_1.time_ - var_192_33) / var_192_34
				local var_192_36 = Vector3.New(0, -1.08, -5.9)

				var_192_32.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1019ui_story, var_192_36, var_192_35)

				local var_192_37 = manager.ui.mainCamera.transform.position - var_192_32.position

				var_192_32.forward = Vector3.New(var_192_37.x, var_192_37.y, var_192_37.z)

				local var_192_38 = var_192_32.localEulerAngles

				var_192_38.z = 0
				var_192_38.x = 0
				var_192_32.localEulerAngles = var_192_38
			end

			if arg_189_1.time_ >= var_192_33 + var_192_34 and arg_189_1.time_ < var_192_33 + var_192_34 + arg_192_0 then
				var_192_32.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_192_39 = manager.ui.mainCamera.transform.position - var_192_32.position

				var_192_32.forward = Vector3.New(var_192_39.x, var_192_39.y, var_192_39.z)

				local var_192_40 = var_192_32.localEulerAngles

				var_192_40.z = 0
				var_192_40.x = 0
				var_192_32.localEulerAngles = var_192_40
			end

			local var_192_41 = arg_189_1.actors_["1019ui_story"]
			local var_192_42 = 2

			if var_192_42 < arg_189_1.time_ and arg_189_1.time_ <= var_192_42 + arg_192_0 and arg_189_1.var_.characterEffect1019ui_story == nil then
				arg_189_1.var_.characterEffect1019ui_story = var_192_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_43 = 0.2

			if var_192_42 <= arg_189_1.time_ and arg_189_1.time_ < var_192_42 + var_192_43 then
				local var_192_44 = (arg_189_1.time_ - var_192_42) / var_192_43

				if arg_189_1.var_.characterEffect1019ui_story then
					arg_189_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_42 + var_192_43 and arg_189_1.time_ < var_192_42 + var_192_43 + arg_192_0 and arg_189_1.var_.characterEffect1019ui_story then
				arg_189_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_192_45 = 2

			if var_192_45 < arg_189_1.time_ and arg_189_1.time_ <= var_192_45 + arg_192_0 then
				arg_189_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_192_46 = 2

			if var_192_46 < arg_189_1.time_ and arg_189_1.time_ <= var_192_46 + arg_192_0 then
				arg_189_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			if arg_189_1.frameCnt_ <= 1 then
				arg_189_1.dialog_:SetActive(false)
			end

			local var_192_47 = 2
			local var_192_48 = 1.625

			if var_192_47 < arg_189_1.time_ and arg_189_1.time_ <= var_192_47 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0

				arg_189_1.dialog_:SetActive(true)

				local var_192_49 = LeanTween.value(arg_189_1.dialog_, 0, 1, 0.3)

				var_192_49:setOnUpdate(LuaHelper.FloatAction(function(arg_193_0)
					arg_189_1.dialogCg_.alpha = arg_193_0
				end))
				var_192_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_189_1.dialog_)
					var_192_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_189_1.duration_ = arg_189_1.duration_ + 0.3

				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_50 = arg_189_1:FormatText(StoryNameCfg[13].name)

				arg_189_1.leftNameTxt_.text = var_192_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_51 = arg_189_1:GetWordFromCfg(103702048)
				local var_192_52 = arg_189_1:FormatText(var_192_51.content)

				arg_189_1.text_.text = var_192_52

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_53 = 65
				local var_192_54 = utf8.len(var_192_52)
				local var_192_55 = var_192_53 <= 0 and var_192_48 or var_192_48 * (var_192_54 / var_192_53)

				if var_192_55 > 0 and var_192_48 < var_192_55 then
					arg_189_1.talkMaxDuration = var_192_55
					var_192_47 = var_192_47 + 0.3

					if var_192_55 + var_192_47 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_55 + var_192_47
					end
				end

				arg_189_1.text_.text = var_192_52
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702048", "story_v_side_old_103702.awb") ~= 0 then
					local var_192_56 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702048", "story_v_side_old_103702.awb") / 1000

					if var_192_56 + var_192_47 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_56 + var_192_47
					end

					if var_192_51.prefab_name ~= "" and arg_189_1.actors_[var_192_51.prefab_name] ~= nil then
						local var_192_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_51.prefab_name].transform, "story_v_side_old_103702", "103702048", "story_v_side_old_103702.awb")

						arg_189_1:RecordAudio("103702048", var_192_57)
						arg_189_1:RecordAudio("103702048", var_192_57)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702048", "story_v_side_old_103702.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702048", "story_v_side_old_103702.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_58 = var_192_47 + 0.3
			local var_192_59 = math.max(var_192_48, arg_189_1.talkMaxDuration)

			if var_192_58 <= arg_189_1.time_ and arg_189_1.time_ < var_192_58 + var_192_59 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_58) / var_192_59

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_58 + var_192_59 and arg_189_1.time_ < var_192_58 + var_192_59 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play103702049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 103702049
		arg_195_1.duration_ = 11.1

		local var_195_0 = {
			ja = 10.166,
			ko = 8.4,
			en = 11.1
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
				arg_195_0:Play103702050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_198_1 = 0
			local var_198_2 = 1.025

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_3 = arg_195_1:FormatText(StoryNameCfg[13].name)

				arg_195_1.leftNameTxt_.text = var_198_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_4 = arg_195_1:GetWordFromCfg(103702049)
				local var_198_5 = arg_195_1:FormatText(var_198_4.content)

				arg_195_1.text_.text = var_198_5

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_6 = 41
				local var_198_7 = utf8.len(var_198_5)
				local var_198_8 = var_198_6 <= 0 and var_198_2 or var_198_2 * (var_198_7 / var_198_6)

				if var_198_8 > 0 and var_198_2 < var_198_8 then
					arg_195_1.talkMaxDuration = var_198_8

					if var_198_8 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_1
					end
				end

				arg_195_1.text_.text = var_198_5
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702049", "story_v_side_old_103702.awb") ~= 0 then
					local var_198_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702049", "story_v_side_old_103702.awb") / 1000

					if var_198_9 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_9 + var_198_1
					end

					if var_198_4.prefab_name ~= "" and arg_195_1.actors_[var_198_4.prefab_name] ~= nil then
						local var_198_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_4.prefab_name].transform, "story_v_side_old_103702", "103702049", "story_v_side_old_103702.awb")

						arg_195_1:RecordAudio("103702049", var_198_10)
						arg_195_1:RecordAudio("103702049", var_198_10)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702049", "story_v_side_old_103702.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702049", "story_v_side_old_103702.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_11 = math.max(var_198_2, arg_195_1.talkMaxDuration)

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_11 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_1) / var_198_11

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_1 + var_198_11 and arg_195_1.time_ < var_198_1 + var_198_11 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play103702050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 103702050
		arg_199_1.duration_ = 3.9

		local var_199_0 = {
			ja = 3.9,
			ko = 2.9,
			en = 3.533
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
				arg_199_0:Play103702051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1019ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1019ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1019ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1037ui_story"].transform
			local var_202_10 = 0.034

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1.var_.moveOldPos1037ui_story = var_202_9.localPosition
			end

			local var_202_11 = 0.001

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11
				local var_202_13 = Vector3.New(0.7, -1.09, -5.81)

				var_202_9.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1037ui_story, var_202_13, var_202_12)

				local var_202_14 = manager.ui.mainCamera.transform.position - var_202_9.position

				var_202_9.forward = Vector3.New(var_202_14.x, var_202_14.y, var_202_14.z)

				local var_202_15 = var_202_9.localEulerAngles

				var_202_15.z = 0
				var_202_15.x = 0
				var_202_9.localEulerAngles = var_202_15
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 then
				var_202_9.localPosition = Vector3.New(0.7, -1.09, -5.81)

				local var_202_16 = manager.ui.mainCamera.transform.position - var_202_9.position

				var_202_9.forward = Vector3.New(var_202_16.x, var_202_16.y, var_202_16.z)

				local var_202_17 = var_202_9.localEulerAngles

				var_202_17.z = 0
				var_202_17.x = 0
				var_202_9.localEulerAngles = var_202_17
			end

			local var_202_18 = arg_199_1.actors_["1019ui_story"]
			local var_202_19 = 0

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 and arg_199_1.var_.characterEffect1019ui_story == nil then
				arg_199_1.var_.characterEffect1019ui_story = var_202_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_20 = 0.2

			if var_202_19 <= arg_199_1.time_ and arg_199_1.time_ < var_202_19 + var_202_20 then
				local var_202_21 = (arg_199_1.time_ - var_202_19) / var_202_20

				if arg_199_1.var_.characterEffect1019ui_story then
					local var_202_22 = Mathf.Lerp(0, 0.5, var_202_21)

					arg_199_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1019ui_story.fillRatio = var_202_22
				end
			end

			if arg_199_1.time_ >= var_202_19 + var_202_20 and arg_199_1.time_ < var_202_19 + var_202_20 + arg_202_0 and arg_199_1.var_.characterEffect1019ui_story then
				local var_202_23 = 0.5

				arg_199_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1019ui_story.fillRatio = var_202_23
			end

			local var_202_24 = arg_199_1.actors_["1037ui_story"]
			local var_202_25 = 0

			if var_202_25 < arg_199_1.time_ and arg_199_1.time_ <= var_202_25 + arg_202_0 and arg_199_1.var_.characterEffect1037ui_story == nil then
				arg_199_1.var_.characterEffect1037ui_story = var_202_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_26 = 0.2

			if var_202_25 <= arg_199_1.time_ and arg_199_1.time_ < var_202_25 + var_202_26 then
				local var_202_27 = (arg_199_1.time_ - var_202_25) / var_202_26

				if arg_199_1.var_.characterEffect1037ui_story then
					arg_199_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_25 + var_202_26 and arg_199_1.time_ < var_202_25 + var_202_26 + arg_202_0 and arg_199_1.var_.characterEffect1037ui_story then
				arg_199_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_202_28 = 0

			if var_202_28 < arg_199_1.time_ and arg_199_1.time_ <= var_202_28 + arg_202_0 then
				arg_199_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_202_29 = 0

			if var_202_29 < arg_199_1.time_ and arg_199_1.time_ <= var_202_29 + arg_202_0 then
				arg_199_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_202_30 = 0
			local var_202_31 = 0.375

			if var_202_30 < arg_199_1.time_ and arg_199_1.time_ <= var_202_30 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_32 = arg_199_1:FormatText(StoryNameCfg[15].name)

				arg_199_1.leftNameTxt_.text = var_202_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_33 = arg_199_1:GetWordFromCfg(103702050)
				local var_202_34 = arg_199_1:FormatText(var_202_33.content)

				arg_199_1.text_.text = var_202_34

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_35 = 15
				local var_202_36 = utf8.len(var_202_34)
				local var_202_37 = var_202_35 <= 0 and var_202_31 or var_202_31 * (var_202_36 / var_202_35)

				if var_202_37 > 0 and var_202_31 < var_202_37 then
					arg_199_1.talkMaxDuration = var_202_37

					if var_202_37 + var_202_30 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_37 + var_202_30
					end
				end

				arg_199_1.text_.text = var_202_34
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702050", "story_v_side_old_103702.awb") ~= 0 then
					local var_202_38 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702050", "story_v_side_old_103702.awb") / 1000

					if var_202_38 + var_202_30 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_38 + var_202_30
					end

					if var_202_33.prefab_name ~= "" and arg_199_1.actors_[var_202_33.prefab_name] ~= nil then
						local var_202_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_33.prefab_name].transform, "story_v_side_old_103702", "103702050", "story_v_side_old_103702.awb")

						arg_199_1:RecordAudio("103702050", var_202_39)
						arg_199_1:RecordAudio("103702050", var_202_39)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702050", "story_v_side_old_103702.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702050", "story_v_side_old_103702.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_40 = math.max(var_202_31, arg_199_1.talkMaxDuration)

			if var_202_30 <= arg_199_1.time_ and arg_199_1.time_ < var_202_30 + var_202_40 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_30) / var_202_40

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_30 + var_202_40 and arg_199_1.time_ < var_202_30 + var_202_40 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play103702051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 103702051
		arg_203_1.duration_ = 5.3

		local var_203_0 = {
			ja = 5.3,
			ko = 3.266,
			en = 3.533
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
				arg_203_0:Play103702052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1037ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1037ui_story == nil then
				arg_203_1.var_.characterEffect1037ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1037ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1037ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1037ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1037ui_story.fillRatio = var_206_5
			end

			local var_206_6 = arg_203_1.actors_["1019ui_story"]
			local var_206_7 = 0

			if var_206_7 < arg_203_1.time_ and arg_203_1.time_ <= var_206_7 + arg_206_0 and arg_203_1.var_.characterEffect1019ui_story == nil then
				arg_203_1.var_.characterEffect1019ui_story = var_206_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_8 = 0.2

			if var_206_7 <= arg_203_1.time_ and arg_203_1.time_ < var_206_7 + var_206_8 then
				local var_206_9 = (arg_203_1.time_ - var_206_7) / var_206_8

				if arg_203_1.var_.characterEffect1019ui_story then
					arg_203_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_7 + var_206_8 and arg_203_1.time_ < var_206_7 + var_206_8 + arg_206_0 and arg_203_1.var_.characterEffect1019ui_story then
				arg_203_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 then
				arg_203_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_206_11 = 0

			if var_206_11 < arg_203_1.time_ and arg_203_1.time_ <= var_206_11 + arg_206_0 then
				arg_203_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_206_12 = 0
			local var_206_13 = 0.375

			if var_206_12 < arg_203_1.time_ and arg_203_1.time_ <= var_206_12 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_14 = arg_203_1:FormatText(StoryNameCfg[13].name)

				arg_203_1.leftNameTxt_.text = var_206_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_15 = arg_203_1:GetWordFromCfg(103702051)
				local var_206_16 = arg_203_1:FormatText(var_206_15.content)

				arg_203_1.text_.text = var_206_16

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_17 = 15
				local var_206_18 = utf8.len(var_206_16)
				local var_206_19 = var_206_17 <= 0 and var_206_13 or var_206_13 * (var_206_18 / var_206_17)

				if var_206_19 > 0 and var_206_13 < var_206_19 then
					arg_203_1.talkMaxDuration = var_206_19

					if var_206_19 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_19 + var_206_12
					end
				end

				arg_203_1.text_.text = var_206_16
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702051", "story_v_side_old_103702.awb") ~= 0 then
					local var_206_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702051", "story_v_side_old_103702.awb") / 1000

					if var_206_20 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_12
					end

					if var_206_15.prefab_name ~= "" and arg_203_1.actors_[var_206_15.prefab_name] ~= nil then
						local var_206_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_15.prefab_name].transform, "story_v_side_old_103702", "103702051", "story_v_side_old_103702.awb")

						arg_203_1:RecordAudio("103702051", var_206_21)
						arg_203_1:RecordAudio("103702051", var_206_21)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702051", "story_v_side_old_103702.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702051", "story_v_side_old_103702.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_22 = math.max(var_206_13, arg_203_1.talkMaxDuration)

			if var_206_12 <= arg_203_1.time_ and arg_203_1.time_ < var_206_12 + var_206_22 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_12) / var_206_22

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_12 + var_206_22 and arg_203_1.time_ < var_206_12 + var_206_22 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play103702052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 103702052
		arg_207_1.duration_ = 10.6

		local var_207_0 = {
			ja = 10.6,
			ko = 5.5,
			en = 3.3
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
				arg_207_0:Play103702053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1019ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1019ui_story == nil then
				arg_207_1.var_.characterEffect1019ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.2

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1019ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1019ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1019ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1019ui_story.fillRatio = var_210_5
			end

			local var_210_6 = arg_207_1.actors_["1037ui_story"]
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 and arg_207_1.var_.characterEffect1037ui_story == nil then
				arg_207_1.var_.characterEffect1037ui_story = var_210_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_8 = 0.2

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8

				if arg_207_1.var_.characterEffect1037ui_story then
					arg_207_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 and arg_207_1.var_.characterEffect1037ui_story then
				arg_207_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_210_11 = 0

			if var_210_11 < arg_207_1.time_ and arg_207_1.time_ <= var_210_11 + arg_210_0 then
				arg_207_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action423")
			end

			local var_210_12 = 0
			local var_210_13 = 0.725

			if var_210_12 < arg_207_1.time_ and arg_207_1.time_ <= var_210_12 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_14 = arg_207_1:FormatText(StoryNameCfg[15].name)

				arg_207_1.leftNameTxt_.text = var_210_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(103702052)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 29
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702052", "story_v_side_old_103702.awb") ~= 0 then
					local var_210_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702052", "story_v_side_old_103702.awb") / 1000

					if var_210_20 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_12
					end

					if var_210_15.prefab_name ~= "" and arg_207_1.actors_[var_210_15.prefab_name] ~= nil then
						local var_210_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_15.prefab_name].transform, "story_v_side_old_103702", "103702052", "story_v_side_old_103702.awb")

						arg_207_1:RecordAudio("103702052", var_210_21)
						arg_207_1:RecordAudio("103702052", var_210_21)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702052", "story_v_side_old_103702.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702052", "story_v_side_old_103702.awb")
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
	Play103702053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 103702053
		arg_211_1.duration_ = 7.3

		local var_211_0 = {
			ja = 7.3,
			ko = 7.3,
			en = 5.3
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
				arg_211_0:Play103702054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1037ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1037ui_story == nil then
				arg_211_1.var_.characterEffect1037ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1037ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1037ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1037ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1037ui_story.fillRatio = var_214_5
			end

			local var_214_6 = arg_211_1.actors_["1019ui_story"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect1019ui_story == nil then
				arg_211_1.var_.characterEffect1019ui_story = var_214_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_8 = 0.2

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.characterEffect1019ui_story then
					arg_211_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect1019ui_story then
				arg_211_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_214_11 = 0
			local var_214_12 = 0.725

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_13 = arg_211_1:FormatText(StoryNameCfg[13].name)

				arg_211_1.leftNameTxt_.text = var_214_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_14 = arg_211_1:GetWordFromCfg(103702053)
				local var_214_15 = arg_211_1:FormatText(var_214_14.content)

				arg_211_1.text_.text = var_214_15

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_16 = 29
				local var_214_17 = utf8.len(var_214_15)
				local var_214_18 = var_214_16 <= 0 and var_214_12 or var_214_12 * (var_214_17 / var_214_16)

				if var_214_18 > 0 and var_214_12 < var_214_18 then
					arg_211_1.talkMaxDuration = var_214_18

					if var_214_18 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_18 + var_214_11
					end
				end

				arg_211_1.text_.text = var_214_15
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702053", "story_v_side_old_103702.awb") ~= 0 then
					local var_214_19 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702053", "story_v_side_old_103702.awb") / 1000

					if var_214_19 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_11
					end

					if var_214_14.prefab_name ~= "" and arg_211_1.actors_[var_214_14.prefab_name] ~= nil then
						local var_214_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_14.prefab_name].transform, "story_v_side_old_103702", "103702053", "story_v_side_old_103702.awb")

						arg_211_1:RecordAudio("103702053", var_214_20)
						arg_211_1:RecordAudio("103702053", var_214_20)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702053", "story_v_side_old_103702.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702053", "story_v_side_old_103702.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_21 = math.max(var_214_12, arg_211_1.talkMaxDuration)

			if var_214_11 <= arg_211_1.time_ and arg_211_1.time_ < var_214_11 + var_214_21 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_11) / var_214_21

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_11 + var_214_21 and arg_211_1.time_ < var_214_11 + var_214_21 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play103702054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 103702054
		arg_215_1.duration_ = 10.5

		local var_215_0 = {
			ja = 8.133,
			ko = 6.133,
			en = 10.5
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
				arg_215_0:Play103702055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1019ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1019ui_story == nil then
				arg_215_1.var_.characterEffect1019ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1019ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1019ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1019ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1019ui_story.fillRatio = var_218_5
			end

			local var_218_6 = arg_215_1.actors_["1037ui_story"]
			local var_218_7 = 0

			if var_218_7 < arg_215_1.time_ and arg_215_1.time_ <= var_218_7 + arg_218_0 and arg_215_1.var_.characterEffect1037ui_story == nil then
				arg_215_1.var_.characterEffect1037ui_story = var_218_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_8 = 0.2

			if var_218_7 <= arg_215_1.time_ and arg_215_1.time_ < var_218_7 + var_218_8 then
				local var_218_9 = (arg_215_1.time_ - var_218_7) / var_218_8

				if arg_215_1.var_.characterEffect1037ui_story then
					arg_215_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_7 + var_218_8 and arg_215_1.time_ < var_218_7 + var_218_8 + arg_218_0 and arg_215_1.var_.characterEffect1037ui_story then
				arg_215_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_218_11 = 0

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 then
				arg_215_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action434")
			end

			local var_218_12 = 0
			local var_218_13 = 0.65

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_14 = arg_215_1:FormatText(StoryNameCfg[15].name)

				arg_215_1.leftNameTxt_.text = var_218_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_15 = arg_215_1:GetWordFromCfg(103702054)
				local var_218_16 = arg_215_1:FormatText(var_218_15.content)

				arg_215_1.text_.text = var_218_16

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_17 = 26
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702054", "story_v_side_old_103702.awb") ~= 0 then
					local var_218_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702054", "story_v_side_old_103702.awb") / 1000

					if var_218_20 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_12
					end

					if var_218_15.prefab_name ~= "" and arg_215_1.actors_[var_218_15.prefab_name] ~= nil then
						local var_218_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_15.prefab_name].transform, "story_v_side_old_103702", "103702054", "story_v_side_old_103702.awb")

						arg_215_1:RecordAudio("103702054", var_218_21)
						arg_215_1:RecordAudio("103702054", var_218_21)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702054", "story_v_side_old_103702.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702054", "story_v_side_old_103702.awb")
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
	Play103702055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 103702055
		arg_219_1.duration_ = 7.466

		local var_219_0 = {
			ja = 7,
			ko = 6.066,
			en = 7.466
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
				arg_219_0:Play103702056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1037ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1037ui_story == nil then
				arg_219_1.var_.characterEffect1037ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1037ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1037ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1037ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1037ui_story.fillRatio = var_222_5
			end

			local var_222_6 = arg_219_1.actors_["1019ui_story"]
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 and arg_219_1.var_.characterEffect1019ui_story == nil then
				arg_219_1.var_.characterEffect1019ui_story = var_222_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_8 = 0.2

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8

				if arg_219_1.var_.characterEffect1019ui_story then
					arg_219_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 and arg_219_1.var_.characterEffect1019ui_story then
				arg_219_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 then
				arg_219_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_222_11 = 0

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action457")
			end

			local var_222_12 = 0
			local var_222_13 = 0.825

			if var_222_12 < arg_219_1.time_ and arg_219_1.time_ <= var_222_12 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_14 = arg_219_1:FormatText(StoryNameCfg[13].name)

				arg_219_1.leftNameTxt_.text = var_222_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_15 = arg_219_1:GetWordFromCfg(103702055)
				local var_222_16 = arg_219_1:FormatText(var_222_15.content)

				arg_219_1.text_.text = var_222_16

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_17 = 33
				local var_222_18 = utf8.len(var_222_16)
				local var_222_19 = var_222_17 <= 0 and var_222_13 or var_222_13 * (var_222_18 / var_222_17)

				if var_222_19 > 0 and var_222_13 < var_222_19 then
					arg_219_1.talkMaxDuration = var_222_19

					if var_222_19 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_12
					end
				end

				arg_219_1.text_.text = var_222_16
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702055", "story_v_side_old_103702.awb") ~= 0 then
					local var_222_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702055", "story_v_side_old_103702.awb") / 1000

					if var_222_20 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_12
					end

					if var_222_15.prefab_name ~= "" and arg_219_1.actors_[var_222_15.prefab_name] ~= nil then
						local var_222_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_15.prefab_name].transform, "story_v_side_old_103702", "103702055", "story_v_side_old_103702.awb")

						arg_219_1:RecordAudio("103702055", var_222_21)
						arg_219_1:RecordAudio("103702055", var_222_21)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702055", "story_v_side_old_103702.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702055", "story_v_side_old_103702.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_22 = math.max(var_222_13, arg_219_1.talkMaxDuration)

			if var_222_12 <= arg_219_1.time_ and arg_219_1.time_ < var_222_12 + var_222_22 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_12) / var_222_22

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_12 + var_222_22 and arg_219_1.time_ < var_222_12 + var_222_22 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play103702056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 103702056
		arg_223_1.duration_ = 12.566

		local var_223_0 = {
			ja = 12.566,
			ko = 8.7,
			en = 9.066
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
				arg_223_0:Play103702057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_226_1 = 0
			local var_226_2 = 0.975

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_3 = arg_223_1:FormatText(StoryNameCfg[13].name)

				arg_223_1.leftNameTxt_.text = var_226_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_4 = arg_223_1:GetWordFromCfg(103702056)
				local var_226_5 = arg_223_1:FormatText(var_226_4.content)

				arg_223_1.text_.text = var_226_5

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_6 = 39
				local var_226_7 = utf8.len(var_226_5)
				local var_226_8 = var_226_6 <= 0 and var_226_2 or var_226_2 * (var_226_7 / var_226_6)

				if var_226_8 > 0 and var_226_2 < var_226_8 then
					arg_223_1.talkMaxDuration = var_226_8

					if var_226_8 + var_226_1 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_1
					end
				end

				arg_223_1.text_.text = var_226_5
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702056", "story_v_side_old_103702.awb") ~= 0 then
					local var_226_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702056", "story_v_side_old_103702.awb") / 1000

					if var_226_9 + var_226_1 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_9 + var_226_1
					end

					if var_226_4.prefab_name ~= "" and arg_223_1.actors_[var_226_4.prefab_name] ~= nil then
						local var_226_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_4.prefab_name].transform, "story_v_side_old_103702", "103702056", "story_v_side_old_103702.awb")

						arg_223_1:RecordAudio("103702056", var_226_10)
						arg_223_1:RecordAudio("103702056", var_226_10)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702056", "story_v_side_old_103702.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702056", "story_v_side_old_103702.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_11 = math.max(var_226_2, arg_223_1.talkMaxDuration)

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_11 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_1) / var_226_11

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_1 + var_226_11 and arg_223_1.time_ < var_226_1 + var_226_11 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play103702057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 103702057
		arg_227_1.duration_ = 5.533

		local var_227_0 = {
			ja = 5.533,
			ko = 4.8,
			en = 4.5
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
				arg_227_0:Play103702058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1019ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1019ui_story == nil then
				arg_227_1.var_.characterEffect1019ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1019ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1019ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1019ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1019ui_story.fillRatio = var_230_5
			end

			local var_230_6 = arg_227_1.actors_["1037ui_story"]
			local var_230_7 = 0

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 and arg_227_1.var_.characterEffect1037ui_story == nil then
				arg_227_1.var_.characterEffect1037ui_story = var_230_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_8 = 0.2

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_8 then
				local var_230_9 = (arg_227_1.time_ - var_230_7) / var_230_8

				if arg_227_1.var_.characterEffect1037ui_story then
					arg_227_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_7 + var_230_8 and arg_227_1.time_ < var_230_7 + var_230_8 + arg_230_0 and arg_227_1.var_.characterEffect1037ui_story then
				arg_227_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_230_11 = 0

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action443")
			end

			local var_230_12 = 0
			local var_230_13 = 0.425

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[15].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(103702057)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 17
				local var_230_18 = utf8.len(var_230_16)
				local var_230_19 = var_230_17 <= 0 and var_230_13 or var_230_13 * (var_230_18 / var_230_17)

				if var_230_19 > 0 and var_230_13 < var_230_19 then
					arg_227_1.talkMaxDuration = var_230_19

					if var_230_19 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_12
					end
				end

				arg_227_1.text_.text = var_230_16
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702057", "story_v_side_old_103702.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702057", "story_v_side_old_103702.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_side_old_103702", "103702057", "story_v_side_old_103702.awb")

						arg_227_1:RecordAudio("103702057", var_230_21)
						arg_227_1:RecordAudio("103702057", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702057", "story_v_side_old_103702.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702057", "story_v_side_old_103702.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_22 = math.max(var_230_13, arg_227_1.talkMaxDuration)

			if var_230_12 <= arg_227_1.time_ and arg_227_1.time_ < var_230_12 + var_230_22 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_12) / var_230_22

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_12 + var_230_22 and arg_227_1.time_ < var_230_12 + var_230_22 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play103702058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 103702058
		arg_231_1.duration_ = 8.266

		local var_231_0 = {
			ja = 8.2,
			ko = 6.066,
			en = 8.266
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
				arg_231_0:Play103702059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1037ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1037ui_story == nil then
				arg_231_1.var_.characterEffect1037ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1037ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1037ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1037ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1037ui_story.fillRatio = var_234_5
			end

			local var_234_6 = arg_231_1.actors_["1019ui_story"]
			local var_234_7 = 0

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 and arg_231_1.var_.characterEffect1019ui_story == nil then
				arg_231_1.var_.characterEffect1019ui_story = var_234_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_8 = 0.2

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_8 then
				local var_234_9 = (arg_231_1.time_ - var_234_7) / var_234_8

				if arg_231_1.var_.characterEffect1019ui_story then
					arg_231_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_7 + var_234_8 and arg_231_1.time_ < var_234_7 + var_234_8 + arg_234_0 and arg_231_1.var_.characterEffect1019ui_story then
				arg_231_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_234_11 = 0

			if var_234_11 < arg_231_1.time_ and arg_231_1.time_ <= var_234_11 + arg_234_0 then
				arg_231_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action475")
			end

			local var_234_12 = 0
			local var_234_13 = 0.75

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[13].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(103702058)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 30
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702058", "story_v_side_old_103702.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702058", "story_v_side_old_103702.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_side_old_103702", "103702058", "story_v_side_old_103702.awb")

						arg_231_1:RecordAudio("103702058", var_234_21)
						arg_231_1:RecordAudio("103702058", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702058", "story_v_side_old_103702.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702058", "story_v_side_old_103702.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_22 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_12) / var_234_22

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_12 + var_234_22 and arg_231_1.time_ < var_234_12 + var_234_22 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play103702059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 103702059
		arg_235_1.duration_ = 10.866

		local var_235_0 = {
			ja = 10.866,
			ko = 9.233,
			en = 7.7
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
				arg_235_0:Play103702060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_238_1 = 0
			local var_238_2 = 1.1

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_3 = arg_235_1:FormatText(StoryNameCfg[13].name)

				arg_235_1.leftNameTxt_.text = var_238_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_4 = arg_235_1:GetWordFromCfg(103702059)
				local var_238_5 = arg_235_1:FormatText(var_238_4.content)

				arg_235_1.text_.text = var_238_5

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_6 = 44
				local var_238_7 = utf8.len(var_238_5)
				local var_238_8 = var_238_6 <= 0 and var_238_2 or var_238_2 * (var_238_7 / var_238_6)

				if var_238_8 > 0 and var_238_2 < var_238_8 then
					arg_235_1.talkMaxDuration = var_238_8

					if var_238_8 + var_238_1 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_1
					end
				end

				arg_235_1.text_.text = var_238_5
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702059", "story_v_side_old_103702.awb") ~= 0 then
					local var_238_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702059", "story_v_side_old_103702.awb") / 1000

					if var_238_9 + var_238_1 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_9 + var_238_1
					end

					if var_238_4.prefab_name ~= "" and arg_235_1.actors_[var_238_4.prefab_name] ~= nil then
						local var_238_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_4.prefab_name].transform, "story_v_side_old_103702", "103702059", "story_v_side_old_103702.awb")

						arg_235_1:RecordAudio("103702059", var_238_10)
						arg_235_1:RecordAudio("103702059", var_238_10)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702059", "story_v_side_old_103702.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702059", "story_v_side_old_103702.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_11 = math.max(var_238_2, arg_235_1.talkMaxDuration)

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_11 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_1) / var_238_11

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_1 + var_238_11 and arg_235_1.time_ < var_238_1 + var_238_11 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play103702060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 103702060
		arg_239_1.duration_ = 9.8

		local var_239_0 = {
			ja = 7.633,
			ko = 9.8,
			en = 7.866
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
				arg_239_0:Play103702061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_242_1 = 0
			local var_242_2 = 1.2

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_3 = arg_239_1:FormatText(StoryNameCfg[13].name)

				arg_239_1.leftNameTxt_.text = var_242_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_4 = arg_239_1:GetWordFromCfg(103702060)
				local var_242_5 = arg_239_1:FormatText(var_242_4.content)

				arg_239_1.text_.text = var_242_5

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_6 = 48
				local var_242_7 = utf8.len(var_242_5)
				local var_242_8 = var_242_6 <= 0 and var_242_2 or var_242_2 * (var_242_7 / var_242_6)

				if var_242_8 > 0 and var_242_2 < var_242_8 then
					arg_239_1.talkMaxDuration = var_242_8

					if var_242_8 + var_242_1 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_1
					end
				end

				arg_239_1.text_.text = var_242_5
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702060", "story_v_side_old_103702.awb") ~= 0 then
					local var_242_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702060", "story_v_side_old_103702.awb") / 1000

					if var_242_9 + var_242_1 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_9 + var_242_1
					end

					if var_242_4.prefab_name ~= "" and arg_239_1.actors_[var_242_4.prefab_name] ~= nil then
						local var_242_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_4.prefab_name].transform, "story_v_side_old_103702", "103702060", "story_v_side_old_103702.awb")

						arg_239_1:RecordAudio("103702060", var_242_10)
						arg_239_1:RecordAudio("103702060", var_242_10)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702060", "story_v_side_old_103702.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702060", "story_v_side_old_103702.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_11 = math.max(var_242_2, arg_239_1.talkMaxDuration)

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_11 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_1) / var_242_11

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_1 + var_242_11 and arg_239_1.time_ < var_242_1 + var_242_11 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play103702061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 103702061
		arg_243_1.duration_ = 3.6

		local var_243_0 = {
			ja = 3.6,
			ko = 3.1,
			en = 3.5
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
				arg_243_0:Play103702062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1019ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1019ui_story == nil then
				arg_243_1.var_.characterEffect1019ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.2

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1019ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1019ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1019ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1019ui_story.fillRatio = var_246_5
			end

			local var_246_6 = arg_243_1.actors_["1037ui_story"]
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 and arg_243_1.var_.characterEffect1037ui_story == nil then
				arg_243_1.var_.characterEffect1037ui_story = var_246_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_8 = 0.2

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8

				if arg_243_1.var_.characterEffect1037ui_story then
					arg_243_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 and arg_243_1.var_.characterEffect1037ui_story then
				arg_243_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_246_11 = 0

			if var_246_11 < arg_243_1.time_ and arg_243_1.time_ <= var_246_11 + arg_246_0 then
				arg_243_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action436")
			end

			local var_246_12 = 0
			local var_246_13 = 0.35

			if var_246_12 < arg_243_1.time_ and arg_243_1.time_ <= var_246_12 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_14 = arg_243_1:FormatText(StoryNameCfg[15].name)

				arg_243_1.leftNameTxt_.text = var_246_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_15 = arg_243_1:GetWordFromCfg(103702061)
				local var_246_16 = arg_243_1:FormatText(var_246_15.content)

				arg_243_1.text_.text = var_246_16

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_17 = 14
				local var_246_18 = utf8.len(var_246_16)
				local var_246_19 = var_246_17 <= 0 and var_246_13 or var_246_13 * (var_246_18 / var_246_17)

				if var_246_19 > 0 and var_246_13 < var_246_19 then
					arg_243_1.talkMaxDuration = var_246_19

					if var_246_19 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_19 + var_246_12
					end
				end

				arg_243_1.text_.text = var_246_16
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702061", "story_v_side_old_103702.awb") ~= 0 then
					local var_246_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702061", "story_v_side_old_103702.awb") / 1000

					if var_246_20 + var_246_12 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_20 + var_246_12
					end

					if var_246_15.prefab_name ~= "" and arg_243_1.actors_[var_246_15.prefab_name] ~= nil then
						local var_246_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_15.prefab_name].transform, "story_v_side_old_103702", "103702061", "story_v_side_old_103702.awb")

						arg_243_1:RecordAudio("103702061", var_246_21)
						arg_243_1:RecordAudio("103702061", var_246_21)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702061", "story_v_side_old_103702.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702061", "story_v_side_old_103702.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_22 = math.max(var_246_13, arg_243_1.talkMaxDuration)

			if var_246_12 <= arg_243_1.time_ and arg_243_1.time_ < var_246_12 + var_246_22 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_12) / var_246_22

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_12 + var_246_22 and arg_243_1.time_ < var_246_12 + var_246_22 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play103702062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 103702062
		arg_247_1.duration_ = 10.633

		local var_247_0 = {
			ja = 10.633,
			ko = 6.866,
			en = 3.566
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
				arg_247_0:Play103702063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1037ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1037ui_story == nil then
				arg_247_1.var_.characterEffect1037ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1037ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1037ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1037ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1037ui_story.fillRatio = var_250_5
			end

			local var_250_6 = arg_247_1.actors_["1019ui_story"]
			local var_250_7 = 0

			if var_250_7 < arg_247_1.time_ and arg_247_1.time_ <= var_250_7 + arg_250_0 and arg_247_1.var_.characterEffect1019ui_story == nil then
				arg_247_1.var_.characterEffect1019ui_story = var_250_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_8 = 0.2

			if var_250_7 <= arg_247_1.time_ and arg_247_1.time_ < var_250_7 + var_250_8 then
				local var_250_9 = (arg_247_1.time_ - var_250_7) / var_250_8

				if arg_247_1.var_.characterEffect1019ui_story then
					arg_247_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_7 + var_250_8 and arg_247_1.time_ < var_250_7 + var_250_8 + arg_250_0 and arg_247_1.var_.characterEffect1019ui_story then
				arg_247_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_250_11 = 0

			if var_250_11 < arg_247_1.time_ and arg_247_1.time_ <= var_250_11 + arg_250_0 then
				arg_247_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action452")
			end

			local var_250_12 = 0
			local var_250_13 = 0.7

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_14 = arg_247_1:FormatText(StoryNameCfg[13].name)

				arg_247_1.leftNameTxt_.text = var_250_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_15 = arg_247_1:GetWordFromCfg(103702062)
				local var_250_16 = arg_247_1:FormatText(var_250_15.content)

				arg_247_1.text_.text = var_250_16

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_17 = 28
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702062", "story_v_side_old_103702.awb") ~= 0 then
					local var_250_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702062", "story_v_side_old_103702.awb") / 1000

					if var_250_20 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_20 + var_250_12
					end

					if var_250_15.prefab_name ~= "" and arg_247_1.actors_[var_250_15.prefab_name] ~= nil then
						local var_250_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_15.prefab_name].transform, "story_v_side_old_103702", "103702062", "story_v_side_old_103702.awb")

						arg_247_1:RecordAudio("103702062", var_250_21)
						arg_247_1:RecordAudio("103702062", var_250_21)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702062", "story_v_side_old_103702.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702062", "story_v_side_old_103702.awb")
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
	Play103702063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 103702063
		arg_251_1.duration_ = 6

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play103702064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.bgs_.ST12
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				local var_254_2 = var_254_0:GetComponent("SpriteRenderer")

				if var_254_2 then
					var_254_2.material = arg_251_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_254_3 = var_254_2.material
					local var_254_4 = var_254_3:GetColor("_Color")

					arg_251_1.var_.alphaOldValueST12 = var_254_4.a
					arg_251_1.var_.alphaMatValueST12 = var_254_3
				end

				arg_251_1.var_.alphaOldValueST12 = 1
			end

			local var_254_5 = 1

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_5 then
				local var_254_6 = (arg_251_1.time_ - var_254_1) / var_254_5
				local var_254_7 = Mathf.Lerp(arg_251_1.var_.alphaOldValueST12, 0, var_254_6)

				if arg_251_1.var_.alphaMatValueST12 then
					local var_254_8 = arg_251_1.var_.alphaMatValueST12
					local var_254_9 = var_254_8:GetColor("_Color")

					var_254_9.a = var_254_7

					var_254_8:SetColor("_Color", var_254_9)
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_5 and arg_251_1.time_ < var_254_1 + var_254_5 + arg_254_0 and arg_251_1.var_.alphaMatValueST12 then
				local var_254_10 = arg_251_1.var_.alphaMatValueST12
				local var_254_11 = var_254_10:GetColor("_Color")

				var_254_11.a = 0

				var_254_10:SetColor("_Color", var_254_11)
			end

			local var_254_12 = arg_251_1.actors_["1019ui_story"].transform
			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1.var_.moveOldPos1019ui_story = var_254_12.localPosition
			end

			local var_254_14 = 0.001

			if var_254_13 <= arg_251_1.time_ and arg_251_1.time_ < var_254_13 + var_254_14 then
				local var_254_15 = (arg_251_1.time_ - var_254_13) / var_254_14
				local var_254_16 = Vector3.New(0, 100, 0)

				var_254_12.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1019ui_story, var_254_16, var_254_15)

				local var_254_17 = manager.ui.mainCamera.transform.position - var_254_12.position

				var_254_12.forward = Vector3.New(var_254_17.x, var_254_17.y, var_254_17.z)

				local var_254_18 = var_254_12.localEulerAngles

				var_254_18.z = 0
				var_254_18.x = 0
				var_254_12.localEulerAngles = var_254_18
			end

			if arg_251_1.time_ >= var_254_13 + var_254_14 and arg_251_1.time_ < var_254_13 + var_254_14 + arg_254_0 then
				var_254_12.localPosition = Vector3.New(0, 100, 0)

				local var_254_19 = manager.ui.mainCamera.transform.position - var_254_12.position

				var_254_12.forward = Vector3.New(var_254_19.x, var_254_19.y, var_254_19.z)

				local var_254_20 = var_254_12.localEulerAngles

				var_254_20.z = 0
				var_254_20.x = 0
				var_254_12.localEulerAngles = var_254_20
			end

			local var_254_21 = arg_251_1.actors_["1037ui_story"].transform
			local var_254_22 = 0

			if var_254_22 < arg_251_1.time_ and arg_251_1.time_ <= var_254_22 + arg_254_0 then
				arg_251_1.var_.moveOldPos1037ui_story = var_254_21.localPosition
			end

			local var_254_23 = 0.001

			if var_254_22 <= arg_251_1.time_ and arg_251_1.time_ < var_254_22 + var_254_23 then
				local var_254_24 = (arg_251_1.time_ - var_254_22) / var_254_23
				local var_254_25 = Vector3.New(0, 100, 0)

				var_254_21.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1037ui_story, var_254_25, var_254_24)

				local var_254_26 = manager.ui.mainCamera.transform.position - var_254_21.position

				var_254_21.forward = Vector3.New(var_254_26.x, var_254_26.y, var_254_26.z)

				local var_254_27 = var_254_21.localEulerAngles

				var_254_27.z = 0
				var_254_27.x = 0
				var_254_21.localEulerAngles = var_254_27
			end

			if arg_251_1.time_ >= var_254_22 + var_254_23 and arg_251_1.time_ < var_254_22 + var_254_23 + arg_254_0 then
				var_254_21.localPosition = Vector3.New(0, 100, 0)

				local var_254_28 = manager.ui.mainCamera.transform.position - var_254_21.position

				var_254_21.forward = Vector3.New(var_254_28.x, var_254_28.y, var_254_28.z)

				local var_254_29 = var_254_21.localEulerAngles

				var_254_29.z = 0
				var_254_29.x = 0
				var_254_21.localEulerAngles = var_254_29
			end

			if arg_251_1.frameCnt_ <= 1 then
				arg_251_1.dialog_:SetActive(false)
			end

			local var_254_30 = 1
			local var_254_31 = 0.15

			if var_254_30 < arg_251_1.time_ and arg_251_1.time_ <= var_254_30 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0

				arg_251_1.dialog_:SetActive(true)

				local var_254_32 = LeanTween.value(arg_251_1.dialog_, 0, 1, 0.3)

				var_254_32:setOnUpdate(LuaHelper.FloatAction(function(arg_255_0)
					arg_251_1.dialogCg_.alpha = arg_255_0
				end))
				var_254_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_251_1.dialog_)
					var_254_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_251_1.duration_ = arg_251_1.duration_ + 0.3

				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_33 = arg_251_1:GetWordFromCfg(103702063)
				local var_254_34 = arg_251_1:FormatText(var_254_33.content)

				arg_251_1.text_.text = var_254_34

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_35 = 6
				local var_254_36 = utf8.len(var_254_34)
				local var_254_37 = var_254_35 <= 0 and var_254_31 or var_254_31 * (var_254_36 / var_254_35)

				if var_254_37 > 0 and var_254_31 < var_254_37 then
					arg_251_1.talkMaxDuration = var_254_37
					var_254_30 = var_254_30 + 0.3

					if var_254_37 + var_254_30 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_37 + var_254_30
					end
				end

				arg_251_1.text_.text = var_254_34
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_38 = var_254_30 + 0.3
			local var_254_39 = math.max(var_254_31, arg_251_1.talkMaxDuration)

			if var_254_38 <= arg_251_1.time_ and arg_251_1.time_ < var_254_38 + var_254_39 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_38) / var_254_39

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_38 + var_254_39 and arg_251_1.time_ < var_254_38 + var_254_39 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play103702064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 103702064
		arg_257_1.duration_ = 5.966

		local var_257_0 = {
			ja = 4.3,
			ko = 5.966,
			en = 5.233
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play103702065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.bgs_.ST12
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				local var_260_2 = var_260_0:GetComponent("SpriteRenderer")

				if var_260_2 then
					var_260_2.material = arg_257_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_260_3 = var_260_2.material
					local var_260_4 = var_260_3:GetColor("_Color")

					arg_257_1.var_.alphaOldValueST12 = var_260_4.a
					arg_257_1.var_.alphaMatValueST12 = var_260_3
				end

				arg_257_1.var_.alphaOldValueST12 = 0
			end

			local var_260_5 = 1.5

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_5 then
				local var_260_6 = (arg_257_1.time_ - var_260_1) / var_260_5
				local var_260_7 = Mathf.Lerp(arg_257_1.var_.alphaOldValueST12, 1, var_260_6)

				if arg_257_1.var_.alphaMatValueST12 then
					local var_260_8 = arg_257_1.var_.alphaMatValueST12
					local var_260_9 = var_260_8:GetColor("_Color")

					var_260_9.a = var_260_7

					var_260_8:SetColor("_Color", var_260_9)
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_5 and arg_257_1.time_ < var_260_1 + var_260_5 + arg_260_0 and arg_257_1.var_.alphaMatValueST12 then
				local var_260_10 = arg_257_1.var_.alphaMatValueST12
				local var_260_11 = var_260_10:GetColor("_Color")

				var_260_11.a = 1

				var_260_10:SetColor("_Color", var_260_11)
			end

			local var_260_12 = "1036ui_story"

			if arg_257_1.actors_[var_260_12] == nil then
				local var_260_13 = Object.Instantiate(Asset.Load("Char/" .. var_260_12), arg_257_1.stage_.transform)

				var_260_13.name = var_260_12
				var_260_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.actors_[var_260_12] = var_260_13

				local var_260_14 = var_260_13:GetComponentInChildren(typeof(CharacterEffect))

				var_260_14.enabled = true

				local var_260_15 = GameObjectTools.GetOrAddComponent(var_260_13, typeof(DynamicBoneHelper))

				if var_260_15 then
					var_260_15:EnableDynamicBone(false)
				end

				arg_257_1:ShowWeapon(var_260_14.transform, false)

				arg_257_1.var_[var_260_12 .. "Animator"] = var_260_14.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_257_1.var_[var_260_12 .. "Animator"].applyRootMotion = true
				arg_257_1.var_[var_260_12 .. "LipSync"] = var_260_14.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_260_16 = arg_257_1.actors_["1036ui_story"].transform
			local var_260_17 = 1.5

			if var_260_17 < arg_257_1.time_ and arg_257_1.time_ <= var_260_17 + arg_260_0 then
				arg_257_1.var_.moveOldPos1036ui_story = var_260_16.localPosition
			end

			local var_260_18 = 0.001

			if var_260_17 <= arg_257_1.time_ and arg_257_1.time_ < var_260_17 + var_260_18 then
				local var_260_19 = (arg_257_1.time_ - var_260_17) / var_260_18
				local var_260_20 = Vector3.New(0, -1.09, -5.78)

				var_260_16.localPosition = Vector3.Lerp(arg_257_1.var_.moveOldPos1036ui_story, var_260_20, var_260_19)

				local var_260_21 = manager.ui.mainCamera.transform.position - var_260_16.position

				var_260_16.forward = Vector3.New(var_260_21.x, var_260_21.y, var_260_21.z)

				local var_260_22 = var_260_16.localEulerAngles

				var_260_22.z = 0
				var_260_22.x = 0
				var_260_16.localEulerAngles = var_260_22
			end

			if arg_257_1.time_ >= var_260_17 + var_260_18 and arg_257_1.time_ < var_260_17 + var_260_18 + arg_260_0 then
				var_260_16.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_260_23 = manager.ui.mainCamera.transform.position - var_260_16.position

				var_260_16.forward = Vector3.New(var_260_23.x, var_260_23.y, var_260_23.z)

				local var_260_24 = var_260_16.localEulerAngles

				var_260_24.z = 0
				var_260_24.x = 0
				var_260_16.localEulerAngles = var_260_24
			end

			local var_260_25 = arg_257_1.actors_["1036ui_story"]
			local var_260_26 = 1.5

			if var_260_26 < arg_257_1.time_ and arg_257_1.time_ <= var_260_26 + arg_260_0 and arg_257_1.var_.characterEffect1036ui_story == nil then
				arg_257_1.var_.characterEffect1036ui_story = var_260_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_27 = 0.2

			if var_260_26 <= arg_257_1.time_ and arg_257_1.time_ < var_260_26 + var_260_27 then
				local var_260_28 = (arg_257_1.time_ - var_260_26) / var_260_27

				if arg_257_1.var_.characterEffect1036ui_story then
					arg_257_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_26 + var_260_27 and arg_257_1.time_ < var_260_26 + var_260_27 + arg_260_0 and arg_257_1.var_.characterEffect1036ui_story then
				arg_257_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_260_29 = 1.5

			if var_260_29 < arg_257_1.time_ and arg_257_1.time_ <= var_260_29 + arg_260_0 then
				arg_257_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_260_30 = 1.5

			if var_260_30 < arg_257_1.time_ and arg_257_1.time_ <= var_260_30 + arg_260_0 then
				arg_257_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action2_1")
			end

			if arg_257_1.frameCnt_ <= 1 then
				arg_257_1.dialog_:SetActive(false)
			end

			local var_260_31 = 1.5
			local var_260_32 = 0.275

			if var_260_31 < arg_257_1.time_ and arg_257_1.time_ <= var_260_31 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				arg_257_1.dialog_:SetActive(true)

				local var_260_33 = LeanTween.value(arg_257_1.dialog_, 0, 1, 0.3)

				var_260_33:setOnUpdate(LuaHelper.FloatAction(function(arg_261_0)
					arg_257_1.dialogCg_.alpha = arg_261_0
				end))
				var_260_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_257_1.dialog_)
					var_260_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_257_1.duration_ = arg_257_1.duration_ + 0.3

				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_34 = arg_257_1:FormatText(StoryNameCfg[5].name)

				arg_257_1.leftNameTxt_.text = var_260_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_35 = arg_257_1:GetWordFromCfg(103702064)
				local var_260_36 = arg_257_1:FormatText(var_260_35.content)

				arg_257_1.text_.text = var_260_36

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_37 = 11
				local var_260_38 = utf8.len(var_260_36)
				local var_260_39 = var_260_37 <= 0 and var_260_32 or var_260_32 * (var_260_38 / var_260_37)

				if var_260_39 > 0 and var_260_32 < var_260_39 then
					arg_257_1.talkMaxDuration = var_260_39
					var_260_31 = var_260_31 + 0.3

					if var_260_39 + var_260_31 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_39 + var_260_31
					end
				end

				arg_257_1.text_.text = var_260_36
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702064", "story_v_side_old_103702.awb") ~= 0 then
					local var_260_40 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702064", "story_v_side_old_103702.awb") / 1000

					if var_260_40 + var_260_31 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_40 + var_260_31
					end

					if var_260_35.prefab_name ~= "" and arg_257_1.actors_[var_260_35.prefab_name] ~= nil then
						local var_260_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_35.prefab_name].transform, "story_v_side_old_103702", "103702064", "story_v_side_old_103702.awb")

						arg_257_1:RecordAudio("103702064", var_260_41)
						arg_257_1:RecordAudio("103702064", var_260_41)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702064", "story_v_side_old_103702.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702064", "story_v_side_old_103702.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_42 = var_260_31 + 0.3
			local var_260_43 = math.max(var_260_32, arg_257_1.talkMaxDuration)

			if var_260_42 <= arg_257_1.time_ and arg_257_1.time_ < var_260_42 + var_260_43 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_42) / var_260_43

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_42 + var_260_43 and arg_257_1.time_ < var_260_42 + var_260_43 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play103702065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 103702065
		arg_263_1.duration_ = 3.533

		local var_263_0 = {
			ja = 3.533,
			ko = 2.6,
			en = 3
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
				arg_263_0:Play103702066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1036ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1036ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(-0.7, -1.09, -5.78)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1036ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1037ui_story"].transform
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 then
				arg_263_1.var_.moveOldPos1037ui_story = var_266_9.localPosition
			end

			local var_266_11 = 0.001

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11
				local var_266_13 = Vector3.New(0.7, -1.09, -5.81)

				var_266_9.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1037ui_story, var_266_13, var_266_12)

				local var_266_14 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_14.x, var_266_14.y, var_266_14.z)

				local var_266_15 = var_266_9.localEulerAngles

				var_266_15.z = 0
				var_266_15.x = 0
				var_266_9.localEulerAngles = var_266_15
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 then
				var_266_9.localPosition = Vector3.New(0.7, -1.09, -5.81)

				local var_266_16 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_16.x, var_266_16.y, var_266_16.z)

				local var_266_17 = var_266_9.localEulerAngles

				var_266_17.z = 0
				var_266_17.x = 0
				var_266_9.localEulerAngles = var_266_17
			end

			local var_266_18 = arg_263_1.actors_["1036ui_story"]
			local var_266_19 = 0

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 and arg_263_1.var_.characterEffect1036ui_story == nil then
				arg_263_1.var_.characterEffect1036ui_story = var_266_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_20 = 0.2

			if var_266_19 <= arg_263_1.time_ and arg_263_1.time_ < var_266_19 + var_266_20 then
				local var_266_21 = (arg_263_1.time_ - var_266_19) / var_266_20

				if arg_263_1.var_.characterEffect1036ui_story then
					local var_266_22 = Mathf.Lerp(0, 0.5, var_266_21)

					arg_263_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1036ui_story.fillRatio = var_266_22
				end
			end

			if arg_263_1.time_ >= var_266_19 + var_266_20 and arg_263_1.time_ < var_266_19 + var_266_20 + arg_266_0 and arg_263_1.var_.characterEffect1036ui_story then
				local var_266_23 = 0.5

				arg_263_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1036ui_story.fillRatio = var_266_23
			end

			local var_266_24 = arg_263_1.actors_["1037ui_story"]
			local var_266_25 = 0

			if var_266_25 < arg_263_1.time_ and arg_263_1.time_ <= var_266_25 + arg_266_0 and arg_263_1.var_.characterEffect1037ui_story == nil then
				arg_263_1.var_.characterEffect1037ui_story = var_266_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_26 = 0.2

			if var_266_25 <= arg_263_1.time_ and arg_263_1.time_ < var_266_25 + var_266_26 then
				local var_266_27 = (arg_263_1.time_ - var_266_25) / var_266_26

				if arg_263_1.var_.characterEffect1037ui_story then
					arg_263_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_25 + var_266_26 and arg_263_1.time_ < var_266_25 + var_266_26 + arg_266_0 and arg_263_1.var_.characterEffect1037ui_story then
				arg_263_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_266_28 = 0

			if var_266_28 < arg_263_1.time_ and arg_263_1.time_ <= var_266_28 + arg_266_0 then
				arg_263_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_266_29 = 0

			if var_266_29 < arg_263_1.time_ and arg_263_1.time_ <= var_266_29 + arg_266_0 then
				arg_263_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action4_1")
			end

			local var_266_30 = 0
			local var_266_31 = 0.25

			if var_266_30 < arg_263_1.time_ and arg_263_1.time_ <= var_266_30 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_32 = arg_263_1:FormatText(StoryNameCfg[15].name)

				arg_263_1.leftNameTxt_.text = var_266_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_33 = arg_263_1:GetWordFromCfg(103702065)
				local var_266_34 = arg_263_1:FormatText(var_266_33.content)

				arg_263_1.text_.text = var_266_34

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_35 = 10
				local var_266_36 = utf8.len(var_266_34)
				local var_266_37 = var_266_35 <= 0 and var_266_31 or var_266_31 * (var_266_36 / var_266_35)

				if var_266_37 > 0 and var_266_31 < var_266_37 then
					arg_263_1.talkMaxDuration = var_266_37

					if var_266_37 + var_266_30 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_37 + var_266_30
					end
				end

				arg_263_1.text_.text = var_266_34
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702065", "story_v_side_old_103702.awb") ~= 0 then
					local var_266_38 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702065", "story_v_side_old_103702.awb") / 1000

					if var_266_38 + var_266_30 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_38 + var_266_30
					end

					if var_266_33.prefab_name ~= "" and arg_263_1.actors_[var_266_33.prefab_name] ~= nil then
						local var_266_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_33.prefab_name].transform, "story_v_side_old_103702", "103702065", "story_v_side_old_103702.awb")

						arg_263_1:RecordAudio("103702065", var_266_39)
						arg_263_1:RecordAudio("103702065", var_266_39)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702065", "story_v_side_old_103702.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702065", "story_v_side_old_103702.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_40 = math.max(var_266_31, arg_263_1.talkMaxDuration)

			if var_266_30 <= arg_263_1.time_ and arg_263_1.time_ < var_266_30 + var_266_40 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_30) / var_266_40

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_30 + var_266_40 and arg_263_1.time_ < var_266_30 + var_266_40 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play103702066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 103702066
		arg_267_1.duration_ = 9.433

		local var_267_0 = {
			ja = 7.1,
			ko = 8.266,
			en = 9.433
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
				arg_267_0:Play103702067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1037ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1037ui_story == nil then
				arg_267_1.var_.characterEffect1037ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1037ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1037ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1037ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1037ui_story.fillRatio = var_270_5
			end

			local var_270_6 = arg_267_1.actors_["1036ui_story"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.characterEffect1036ui_story == nil then
				arg_267_1.var_.characterEffect1036ui_story = var_270_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_8 = 0.2

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.characterEffect1036ui_story then
					arg_267_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.characterEffect1036ui_story then
				arg_267_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 then
				arg_267_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_270_11 = 0

			if var_270_11 < arg_267_1.time_ and arg_267_1.time_ <= var_270_11 + arg_270_0 then
				arg_267_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action423")
			end

			local var_270_12 = 0
			local var_270_13 = 0.675

			if var_270_12 < arg_267_1.time_ and arg_267_1.time_ <= var_270_12 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_14 = arg_267_1:FormatText(StoryNameCfg[5].name)

				arg_267_1.leftNameTxt_.text = var_270_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_15 = arg_267_1:GetWordFromCfg(103702066)
				local var_270_16 = arg_267_1:FormatText(var_270_15.content)

				arg_267_1.text_.text = var_270_16

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_17 = 27
				local var_270_18 = utf8.len(var_270_16)
				local var_270_19 = var_270_17 <= 0 and var_270_13 or var_270_13 * (var_270_18 / var_270_17)

				if var_270_19 > 0 and var_270_13 < var_270_19 then
					arg_267_1.talkMaxDuration = var_270_19

					if var_270_19 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_12
					end
				end

				arg_267_1.text_.text = var_270_16
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702066", "story_v_side_old_103702.awb") ~= 0 then
					local var_270_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702066", "story_v_side_old_103702.awb") / 1000

					if var_270_20 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_12
					end

					if var_270_15.prefab_name ~= "" and arg_267_1.actors_[var_270_15.prefab_name] ~= nil then
						local var_270_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_15.prefab_name].transform, "story_v_side_old_103702", "103702066", "story_v_side_old_103702.awb")

						arg_267_1:RecordAudio("103702066", var_270_21)
						arg_267_1:RecordAudio("103702066", var_270_21)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702066", "story_v_side_old_103702.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702066", "story_v_side_old_103702.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_13, arg_267_1.talkMaxDuration)

			if var_270_12 <= arg_267_1.time_ and arg_267_1.time_ < var_270_12 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_12) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_12 + var_270_22 and arg_267_1.time_ < var_270_12 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play103702067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 103702067
		arg_271_1.duration_ = 14.433

		local var_271_0 = {
			ja = 14.433,
			ko = 5.2,
			en = 7.4
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
				arg_271_0:Play103702068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1036ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1036ui_story == nil then
				arg_271_1.var_.characterEffect1036ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.2

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1036ui_story then
					local var_274_4 = Mathf.Lerp(0, 0.5, var_274_3)

					arg_271_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1036ui_story.fillRatio = var_274_4
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1036ui_story then
				local var_274_5 = 0.5

				arg_271_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1036ui_story.fillRatio = var_274_5
			end

			local var_274_6 = arg_271_1.actors_["1037ui_story"]
			local var_274_7 = 0

			if var_274_7 < arg_271_1.time_ and arg_271_1.time_ <= var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect1037ui_story == nil then
				arg_271_1.var_.characterEffect1037ui_story = var_274_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_8 = 0.2

			if var_274_7 <= arg_271_1.time_ and arg_271_1.time_ < var_274_7 + var_274_8 then
				local var_274_9 = (arg_271_1.time_ - var_274_7) / var_274_8

				if arg_271_1.var_.characterEffect1037ui_story then
					arg_271_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_7 + var_274_8 and arg_271_1.time_ < var_274_7 + var_274_8 + arg_274_0 and arg_271_1.var_.characterEffect1037ui_story then
				arg_271_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_274_11 = 0

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action445")
			end

			local var_274_12 = 0
			local var_274_13 = 0.8

			if var_274_12 < arg_271_1.time_ and arg_271_1.time_ <= var_274_12 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_14 = arg_271_1:FormatText(StoryNameCfg[15].name)

				arg_271_1.leftNameTxt_.text = var_274_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_15 = arg_271_1:GetWordFromCfg(103702067)
				local var_274_16 = arg_271_1:FormatText(var_274_15.content)

				arg_271_1.text_.text = var_274_16

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_17 = 32
				local var_274_18 = utf8.len(var_274_16)
				local var_274_19 = var_274_17 <= 0 and var_274_13 or var_274_13 * (var_274_18 / var_274_17)

				if var_274_19 > 0 and var_274_13 < var_274_19 then
					arg_271_1.talkMaxDuration = var_274_19

					if var_274_19 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_12
					end
				end

				arg_271_1.text_.text = var_274_16
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702067", "story_v_side_old_103702.awb") ~= 0 then
					local var_274_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702067", "story_v_side_old_103702.awb") / 1000

					if var_274_20 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_20 + var_274_12
					end

					if var_274_15.prefab_name ~= "" and arg_271_1.actors_[var_274_15.prefab_name] ~= nil then
						local var_274_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_15.prefab_name].transform, "story_v_side_old_103702", "103702067", "story_v_side_old_103702.awb")

						arg_271_1:RecordAudio("103702067", var_274_21)
						arg_271_1:RecordAudio("103702067", var_274_21)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702067", "story_v_side_old_103702.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702067", "story_v_side_old_103702.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_22 = math.max(var_274_13, arg_271_1.talkMaxDuration)

			if var_274_12 <= arg_271_1.time_ and arg_271_1.time_ < var_274_12 + var_274_22 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_12) / var_274_22

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_12 + var_274_22 and arg_271_1.time_ < var_274_12 + var_274_22 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play103702068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 103702068
		arg_275_1.duration_ = 6.966

		local var_275_0 = {
			ja = 6.966,
			ko = 3.6,
			en = 3.5
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
				arg_275_0:Play103702069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action452")
			end

			local var_278_2 = 0
			local var_278_3 = 0.5

			if var_278_2 < arg_275_1.time_ and arg_275_1.time_ <= var_278_2 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_4 = arg_275_1:FormatText(StoryNameCfg[15].name)

				arg_275_1.leftNameTxt_.text = var_278_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_5 = arg_275_1:GetWordFromCfg(103702068)
				local var_278_6 = arg_275_1:FormatText(var_278_5.content)

				arg_275_1.text_.text = var_278_6

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_7 = 20
				local var_278_8 = utf8.len(var_278_6)
				local var_278_9 = var_278_7 <= 0 and var_278_3 or var_278_3 * (var_278_8 / var_278_7)

				if var_278_9 > 0 and var_278_3 < var_278_9 then
					arg_275_1.talkMaxDuration = var_278_9

					if var_278_9 + var_278_2 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_9 + var_278_2
					end
				end

				arg_275_1.text_.text = var_278_6
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702068", "story_v_side_old_103702.awb") ~= 0 then
					local var_278_10 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702068", "story_v_side_old_103702.awb") / 1000

					if var_278_10 + var_278_2 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_10 + var_278_2
					end

					if var_278_5.prefab_name ~= "" and arg_275_1.actors_[var_278_5.prefab_name] ~= nil then
						local var_278_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_5.prefab_name].transform, "story_v_side_old_103702", "103702068", "story_v_side_old_103702.awb")

						arg_275_1:RecordAudio("103702068", var_278_11)
						arg_275_1:RecordAudio("103702068", var_278_11)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702068", "story_v_side_old_103702.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702068", "story_v_side_old_103702.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_12 = math.max(var_278_3, arg_275_1.talkMaxDuration)

			if var_278_2 <= arg_275_1.time_ and arg_275_1.time_ < var_278_2 + var_278_12 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_2) / var_278_12

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_2 + var_278_12 and arg_275_1.time_ < var_278_2 + var_278_12 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play103702069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 103702069
		arg_279_1.duration_ = 9

		local var_279_0 = {
			ja = 8.4,
			ko = 7.366,
			en = 9
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
				arg_279_0:Play103702070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1037ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1037ui_story == nil then
				arg_279_1.var_.characterEffect1037ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1037ui_story then
					local var_282_4 = Mathf.Lerp(0, 0.5, var_282_3)

					arg_279_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1037ui_story.fillRatio = var_282_4
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1037ui_story then
				local var_282_5 = 0.5

				arg_279_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1037ui_story.fillRatio = var_282_5
			end

			local var_282_6 = arg_279_1.actors_["1036ui_story"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect1036ui_story == nil then
				arg_279_1.var_.characterEffect1036ui_story = var_282_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_8 = 0.2

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.characterEffect1036ui_story then
					arg_279_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect1036ui_story then
				arg_279_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 then
				arg_279_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_282_11 = 0

			if var_282_11 < arg_279_1.time_ and arg_279_1.time_ <= var_282_11 + arg_282_0 then
				arg_279_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action435")
			end

			local var_282_12 = 0
			local var_282_13 = 0.8

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[5].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(103702069)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 32
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702069", "story_v_side_old_103702.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702069", "story_v_side_old_103702.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_side_old_103702", "103702069", "story_v_side_old_103702.awb")

						arg_279_1:RecordAudio("103702069", var_282_21)
						arg_279_1:RecordAudio("103702069", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702069", "story_v_side_old_103702.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702069", "story_v_side_old_103702.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play103702070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 103702070
		arg_283_1.duration_ = 7.866

		local var_283_0 = {
			ja = 7.866,
			ko = 4.833,
			en = 3.8
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
				arg_283_0:Play103702071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1036ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1036ui_story == nil then
				arg_283_1.var_.characterEffect1036ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.2

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1036ui_story then
					local var_286_4 = Mathf.Lerp(0, 0.5, var_286_3)

					arg_283_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1036ui_story.fillRatio = var_286_4
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1036ui_story then
				local var_286_5 = 0.5

				arg_283_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1036ui_story.fillRatio = var_286_5
			end

			local var_286_6 = arg_283_1.actors_["1037ui_story"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.characterEffect1037ui_story == nil then
				arg_283_1.var_.characterEffect1037ui_story = var_286_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_8 = 0.2

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.characterEffect1037ui_story then
					arg_283_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.characterEffect1037ui_story then
				arg_283_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 then
				arg_283_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_286_11 = 0
			local var_286_12 = 0.65

			if var_286_11 < arg_283_1.time_ and arg_283_1.time_ <= var_286_11 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_13 = arg_283_1:FormatText(StoryNameCfg[15].name)

				arg_283_1.leftNameTxt_.text = var_286_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_14 = arg_283_1:GetWordFromCfg(103702070)
				local var_286_15 = arg_283_1:FormatText(var_286_14.content)

				arg_283_1.text_.text = var_286_15

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_16 = 26
				local var_286_17 = utf8.len(var_286_15)
				local var_286_18 = var_286_16 <= 0 and var_286_12 or var_286_12 * (var_286_17 / var_286_16)

				if var_286_18 > 0 and var_286_12 < var_286_18 then
					arg_283_1.talkMaxDuration = var_286_18

					if var_286_18 + var_286_11 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_18 + var_286_11
					end
				end

				arg_283_1.text_.text = var_286_15
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702070", "story_v_side_old_103702.awb") ~= 0 then
					local var_286_19 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702070", "story_v_side_old_103702.awb") / 1000

					if var_286_19 + var_286_11 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_11
					end

					if var_286_14.prefab_name ~= "" and arg_283_1.actors_[var_286_14.prefab_name] ~= nil then
						local var_286_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_14.prefab_name].transform, "story_v_side_old_103702", "103702070", "story_v_side_old_103702.awb")

						arg_283_1:RecordAudio("103702070", var_286_20)
						arg_283_1:RecordAudio("103702070", var_286_20)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702070", "story_v_side_old_103702.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702070", "story_v_side_old_103702.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_21 = math.max(var_286_12, arg_283_1.talkMaxDuration)

			if var_286_11 <= arg_283_1.time_ and arg_283_1.time_ < var_286_11 + var_286_21 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_11) / var_286_21

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_11 + var_286_21 and arg_283_1.time_ < var_286_11 + var_286_21 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play103702071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 103702071
		arg_287_1.duration_ = 7.133

		local var_287_0 = {
			ja = 5.2,
			ko = 6.7,
			en = 7.133
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play103702072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1037ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1037ui_story == nil then
				arg_287_1.var_.characterEffect1037ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1037ui_story then
					local var_290_4 = Mathf.Lerp(0, 0.5, var_290_3)

					arg_287_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1037ui_story.fillRatio = var_290_4
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1037ui_story then
				local var_290_5 = 0.5

				arg_287_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1037ui_story.fillRatio = var_290_5
			end

			local var_290_6 = arg_287_1.actors_["1036ui_story"]
			local var_290_7 = 0

			if var_290_7 < arg_287_1.time_ and arg_287_1.time_ <= var_290_7 + arg_290_0 and arg_287_1.var_.characterEffect1036ui_story == nil then
				arg_287_1.var_.characterEffect1036ui_story = var_290_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_8 = 0.2

			if var_290_7 <= arg_287_1.time_ and arg_287_1.time_ < var_290_7 + var_290_8 then
				local var_290_9 = (arg_287_1.time_ - var_290_7) / var_290_8

				if arg_287_1.var_.characterEffect1036ui_story then
					arg_287_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_7 + var_290_8 and arg_287_1.time_ < var_290_7 + var_290_8 + arg_290_0 and arg_287_1.var_.characterEffect1036ui_story then
				arg_287_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_290_10 = 0

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 then
				arg_287_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_290_11 = 0

			if var_290_11 < arg_287_1.time_ and arg_287_1.time_ <= var_290_11 + arg_290_0 then
				arg_287_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action424")
			end

			local var_290_12 = 0
			local var_290_13 = 0.675

			if var_290_12 < arg_287_1.time_ and arg_287_1.time_ <= var_290_12 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_14 = arg_287_1:FormatText(StoryNameCfg[5].name)

				arg_287_1.leftNameTxt_.text = var_290_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_15 = arg_287_1:GetWordFromCfg(103702071)
				local var_290_16 = arg_287_1:FormatText(var_290_15.content)

				arg_287_1.text_.text = var_290_16

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_17 = 27
				local var_290_18 = utf8.len(var_290_16)
				local var_290_19 = var_290_17 <= 0 and var_290_13 or var_290_13 * (var_290_18 / var_290_17)

				if var_290_19 > 0 and var_290_13 < var_290_19 then
					arg_287_1.talkMaxDuration = var_290_19

					if var_290_19 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_12
					end
				end

				arg_287_1.text_.text = var_290_16
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702071", "story_v_side_old_103702.awb") ~= 0 then
					local var_290_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702071", "story_v_side_old_103702.awb") / 1000

					if var_290_20 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_20 + var_290_12
					end

					if var_290_15.prefab_name ~= "" and arg_287_1.actors_[var_290_15.prefab_name] ~= nil then
						local var_290_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_15.prefab_name].transform, "story_v_side_old_103702", "103702071", "story_v_side_old_103702.awb")

						arg_287_1:RecordAudio("103702071", var_290_21)
						arg_287_1:RecordAudio("103702071", var_290_21)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702071", "story_v_side_old_103702.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702071", "story_v_side_old_103702.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_22 = math.max(var_290_13, arg_287_1.talkMaxDuration)

			if var_290_12 <= arg_287_1.time_ and arg_287_1.time_ < var_290_12 + var_290_22 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_12) / var_290_22

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_12 + var_290_22 and arg_287_1.time_ < var_290_12 + var_290_22 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play103702072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 103702072
		arg_291_1.duration_ = 9.4

		local var_291_0 = {
			ja = 9.4,
			ko = 7.8,
			en = 8.766
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
				arg_291_0:Play103702073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_294_1 = 0
			local var_294_2 = 0.775

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_3 = arg_291_1:FormatText(StoryNameCfg[5].name)

				arg_291_1.leftNameTxt_.text = var_294_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_4 = arg_291_1:GetWordFromCfg(103702072)
				local var_294_5 = arg_291_1:FormatText(var_294_4.content)

				arg_291_1.text_.text = var_294_5

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_6 = 31
				local var_294_7 = utf8.len(var_294_5)
				local var_294_8 = var_294_6 <= 0 and var_294_2 or var_294_2 * (var_294_7 / var_294_6)

				if var_294_8 > 0 and var_294_2 < var_294_8 then
					arg_291_1.talkMaxDuration = var_294_8

					if var_294_8 + var_294_1 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_8 + var_294_1
					end
				end

				arg_291_1.text_.text = var_294_5
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702072", "story_v_side_old_103702.awb") ~= 0 then
					local var_294_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702072", "story_v_side_old_103702.awb") / 1000

					if var_294_9 + var_294_1 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_9 + var_294_1
					end

					if var_294_4.prefab_name ~= "" and arg_291_1.actors_[var_294_4.prefab_name] ~= nil then
						local var_294_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_4.prefab_name].transform, "story_v_side_old_103702", "103702072", "story_v_side_old_103702.awb")

						arg_291_1:RecordAudio("103702072", var_294_10)
						arg_291_1:RecordAudio("103702072", var_294_10)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702072", "story_v_side_old_103702.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702072", "story_v_side_old_103702.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_11 = math.max(var_294_2, arg_291_1.talkMaxDuration)

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_11 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_1) / var_294_11

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_1 + var_294_11 and arg_291_1.time_ < var_294_1 + var_294_11 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play103702073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 103702073
		arg_295_1.duration_ = 3.366

		local var_295_0 = {
			ja = 3.366,
			ko = 2.7,
			en = 2.766
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
				arg_295_0:Play103702074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1036ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1036ui_story == nil then
				arg_295_1.var_.characterEffect1036ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1036ui_story then
					local var_298_4 = Mathf.Lerp(0, 0.5, var_298_3)

					arg_295_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1036ui_story.fillRatio = var_298_4
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1036ui_story then
				local var_298_5 = 0.5

				arg_295_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1036ui_story.fillRatio = var_298_5
			end

			local var_298_6 = arg_295_1.actors_["1037ui_story"]
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 and arg_295_1.var_.characterEffect1037ui_story == nil then
				arg_295_1.var_.characterEffect1037ui_story = var_298_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_8 = 0.2

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8

				if arg_295_1.var_.characterEffect1037ui_story then
					arg_295_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 and arg_295_1.var_.characterEffect1037ui_story then
				arg_295_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_298_11 = 0

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				arg_295_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action424")
			end

			local var_298_12 = 0
			local var_298_13 = 0.2

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_14 = arg_295_1:FormatText(StoryNameCfg[15].name)

				arg_295_1.leftNameTxt_.text = var_298_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_15 = arg_295_1:GetWordFromCfg(103702073)
				local var_298_16 = arg_295_1:FormatText(var_298_15.content)

				arg_295_1.text_.text = var_298_16

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_17 = 8
				local var_298_18 = utf8.len(var_298_16)
				local var_298_19 = var_298_17 <= 0 and var_298_13 or var_298_13 * (var_298_18 / var_298_17)

				if var_298_19 > 0 and var_298_13 < var_298_19 then
					arg_295_1.talkMaxDuration = var_298_19

					if var_298_19 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_12
					end
				end

				arg_295_1.text_.text = var_298_16
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702073", "story_v_side_old_103702.awb") ~= 0 then
					local var_298_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702073", "story_v_side_old_103702.awb") / 1000

					if var_298_20 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_12
					end

					if var_298_15.prefab_name ~= "" and arg_295_1.actors_[var_298_15.prefab_name] ~= nil then
						local var_298_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_15.prefab_name].transform, "story_v_side_old_103702", "103702073", "story_v_side_old_103702.awb")

						arg_295_1:RecordAudio("103702073", var_298_21)
						arg_295_1:RecordAudio("103702073", var_298_21)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702073", "story_v_side_old_103702.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702073", "story_v_side_old_103702.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_22 = math.max(var_298_13, arg_295_1.talkMaxDuration)

			if var_298_12 <= arg_295_1.time_ and arg_295_1.time_ < var_298_12 + var_298_22 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_12) / var_298_22

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_12 + var_298_22 and arg_295_1.time_ < var_298_12 + var_298_22 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play103702074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 103702074
		arg_299_1.duration_ = 5.8

		local var_299_0 = {
			ja = 5.8,
			ko = 5.233,
			en = 5.3
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
				arg_299_0:Play103702075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action443")
			end

			local var_302_2 = 0
			local var_302_3 = 0.625

			if var_302_2 < arg_299_1.time_ and arg_299_1.time_ <= var_302_2 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_4 = arg_299_1:FormatText(StoryNameCfg[15].name)

				arg_299_1.leftNameTxt_.text = var_302_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_5 = arg_299_1:GetWordFromCfg(103702074)
				local var_302_6 = arg_299_1:FormatText(var_302_5.content)

				arg_299_1.text_.text = var_302_6

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_7 = 25
				local var_302_8 = utf8.len(var_302_6)
				local var_302_9 = var_302_7 <= 0 and var_302_3 or var_302_3 * (var_302_8 / var_302_7)

				if var_302_9 > 0 and var_302_3 < var_302_9 then
					arg_299_1.talkMaxDuration = var_302_9

					if var_302_9 + var_302_2 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_9 + var_302_2
					end
				end

				arg_299_1.text_.text = var_302_6
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702074", "story_v_side_old_103702.awb") ~= 0 then
					local var_302_10 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702074", "story_v_side_old_103702.awb") / 1000

					if var_302_10 + var_302_2 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_10 + var_302_2
					end

					if var_302_5.prefab_name ~= "" and arg_299_1.actors_[var_302_5.prefab_name] ~= nil then
						local var_302_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_5.prefab_name].transform, "story_v_side_old_103702", "103702074", "story_v_side_old_103702.awb")

						arg_299_1:RecordAudio("103702074", var_302_11)
						arg_299_1:RecordAudio("103702074", var_302_11)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702074", "story_v_side_old_103702.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702074", "story_v_side_old_103702.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_12 = math.max(var_302_3, arg_299_1.talkMaxDuration)

			if var_302_2 <= arg_299_1.time_ and arg_299_1.time_ < var_302_2 + var_302_12 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_2) / var_302_12

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_2 + var_302_12 and arg_299_1.time_ < var_302_2 + var_302_12 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play103702075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 103702075
		arg_303_1.duration_ = 9.533

		local var_303_0 = {
			ja = 8.9,
			ko = 7.666,
			en = 9.533
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
				arg_303_0:Play103702076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1037ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1037ui_story == nil then
				arg_303_1.var_.characterEffect1037ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1037ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1037ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1037ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1037ui_story.fillRatio = var_306_5
			end

			local var_306_6 = arg_303_1.actors_["1036ui_story"]
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 and arg_303_1.var_.characterEffect1036ui_story == nil then
				arg_303_1.var_.characterEffect1036ui_story = var_306_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_8 = 0.2

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8

				if arg_303_1.var_.characterEffect1036ui_story then
					arg_303_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 and arg_303_1.var_.characterEffect1036ui_story then
				arg_303_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 then
				arg_303_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_306_11 = 0

			if var_306_11 < arg_303_1.time_ and arg_303_1.time_ <= var_306_11 + arg_306_0 then
				arg_303_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action442")
			end

			local var_306_12 = 0
			local var_306_13 = 0.575

			if var_306_12 < arg_303_1.time_ and arg_303_1.time_ <= var_306_12 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_14 = arg_303_1:FormatText(StoryNameCfg[5].name)

				arg_303_1.leftNameTxt_.text = var_306_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_15 = arg_303_1:GetWordFromCfg(103702075)
				local var_306_16 = arg_303_1:FormatText(var_306_15.content)

				arg_303_1.text_.text = var_306_16

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702075", "story_v_side_old_103702.awb") ~= 0 then
					local var_306_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702075", "story_v_side_old_103702.awb") / 1000

					if var_306_20 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_20 + var_306_12
					end

					if var_306_15.prefab_name ~= "" and arg_303_1.actors_[var_306_15.prefab_name] ~= nil then
						local var_306_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_15.prefab_name].transform, "story_v_side_old_103702", "103702075", "story_v_side_old_103702.awb")

						arg_303_1:RecordAudio("103702075", var_306_21)
						arg_303_1:RecordAudio("103702075", var_306_21)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702075", "story_v_side_old_103702.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702075", "story_v_side_old_103702.awb")
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
	Play103702076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 103702076
		arg_307_1.duration_ = 8.9

		local var_307_0 = {
			ja = 7.566,
			ko = 7.466,
			en = 8.9
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
				arg_307_0:Play103702077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1036ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1036ui_story == nil then
				arg_307_1.var_.characterEffect1036ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.2

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1036ui_story then
					local var_310_4 = Mathf.Lerp(0, 0.5, var_310_3)

					arg_307_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1036ui_story.fillRatio = var_310_4
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1036ui_story then
				local var_310_5 = 0.5

				arg_307_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1036ui_story.fillRatio = var_310_5
			end

			local var_310_6 = arg_307_1.actors_["1037ui_story"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.characterEffect1037ui_story == nil then
				arg_307_1.var_.characterEffect1037ui_story = var_310_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_8 = 0.2

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.characterEffect1037ui_story then
					arg_307_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.characterEffect1037ui_story then
				arg_307_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 then
				arg_307_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_310_11 = 0

			if var_310_11 < arg_307_1.time_ and arg_307_1.time_ <= var_310_11 + arg_310_0 then
				arg_307_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action432")
			end

			local var_310_12 = 0
			local var_310_13 = 1

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[15].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(103702076)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 40
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

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702076", "story_v_side_old_103702.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702076", "story_v_side_old_103702.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_side_old_103702", "103702076", "story_v_side_old_103702.awb")

						arg_307_1:RecordAudio("103702076", var_310_21)
						arg_307_1:RecordAudio("103702076", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702076", "story_v_side_old_103702.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702076", "story_v_side_old_103702.awb")
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
	Play103702077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 103702077
		arg_311_1.duration_ = 5.466

		local var_311_0 = {
			ja = 3.866,
			ko = 3.933,
			en = 5.466
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play103702078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1037ui_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.characterEffect1037ui_story == nil then
				arg_311_1.var_.characterEffect1037ui_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.2

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect1037ui_story then
					local var_314_4 = Mathf.Lerp(0, 0.5, var_314_3)

					arg_311_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1037ui_story.fillRatio = var_314_4
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1037ui_story then
				local var_314_5 = 0.5

				arg_311_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1037ui_story.fillRatio = var_314_5
			end

			local var_314_6 = arg_311_1.actors_["1036ui_story"]
			local var_314_7 = 0

			if var_314_7 < arg_311_1.time_ and arg_311_1.time_ <= var_314_7 + arg_314_0 and arg_311_1.var_.characterEffect1036ui_story == nil then
				arg_311_1.var_.characterEffect1036ui_story = var_314_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_8 = 0.2

			if var_314_7 <= arg_311_1.time_ and arg_311_1.time_ < var_314_7 + var_314_8 then
				local var_314_9 = (arg_311_1.time_ - var_314_7) / var_314_8

				if arg_311_1.var_.characterEffect1036ui_story then
					arg_311_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_7 + var_314_8 and arg_311_1.time_ < var_314_7 + var_314_8 + arg_314_0 and arg_311_1.var_.characterEffect1036ui_story then
				arg_311_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 then
				arg_311_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_314_11 = 0

			if var_314_11 < arg_311_1.time_ and arg_311_1.time_ <= var_314_11 + arg_314_0 then
				arg_311_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action424")
			end

			local var_314_12 = 0
			local var_314_13 = 0.375

			if var_314_12 < arg_311_1.time_ and arg_311_1.time_ <= var_314_12 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_14 = arg_311_1:FormatText(StoryNameCfg[5].name)

				arg_311_1.leftNameTxt_.text = var_314_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_15 = arg_311_1:GetWordFromCfg(103702077)
				local var_314_16 = arg_311_1:FormatText(var_314_15.content)

				arg_311_1.text_.text = var_314_16

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_17 = 15
				local var_314_18 = utf8.len(var_314_16)
				local var_314_19 = var_314_17 <= 0 and var_314_13 or var_314_13 * (var_314_18 / var_314_17)

				if var_314_19 > 0 and var_314_13 < var_314_19 then
					arg_311_1.talkMaxDuration = var_314_19

					if var_314_19 + var_314_12 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_19 + var_314_12
					end
				end

				arg_311_1.text_.text = var_314_16
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702077", "story_v_side_old_103702.awb") ~= 0 then
					local var_314_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702077", "story_v_side_old_103702.awb") / 1000

					if var_314_20 + var_314_12 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_20 + var_314_12
					end

					if var_314_15.prefab_name ~= "" and arg_311_1.actors_[var_314_15.prefab_name] ~= nil then
						local var_314_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_15.prefab_name].transform, "story_v_side_old_103702", "103702077", "story_v_side_old_103702.awb")

						arg_311_1:RecordAudio("103702077", var_314_21)
						arg_311_1:RecordAudio("103702077", var_314_21)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702077", "story_v_side_old_103702.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702077", "story_v_side_old_103702.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_22 = math.max(var_314_13, arg_311_1.talkMaxDuration)

			if var_314_12 <= arg_311_1.time_ and arg_311_1.time_ < var_314_12 + var_314_22 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_12) / var_314_22

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_12 + var_314_22 and arg_311_1.time_ < var_314_12 + var_314_22 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play103702078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 103702078
		arg_315_1.duration_ = 9.866

		local var_315_0 = {
			ja = 6.533,
			ko = 9.2,
			en = 9.866
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
				arg_315_0:Play103702079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_318_1 = 0
			local var_318_2 = 0.875

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_3 = arg_315_1:FormatText(StoryNameCfg[5].name)

				arg_315_1.leftNameTxt_.text = var_318_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_4 = arg_315_1:GetWordFromCfg(103702078)
				local var_318_5 = arg_315_1:FormatText(var_318_4.content)

				arg_315_1.text_.text = var_318_5

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_6 = 35
				local var_318_7 = utf8.len(var_318_5)
				local var_318_8 = var_318_6 <= 0 and var_318_2 or var_318_2 * (var_318_7 / var_318_6)

				if var_318_8 > 0 and var_318_2 < var_318_8 then
					arg_315_1.talkMaxDuration = var_318_8

					if var_318_8 + var_318_1 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_8 + var_318_1
					end
				end

				arg_315_1.text_.text = var_318_5
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702078", "story_v_side_old_103702.awb") ~= 0 then
					local var_318_9 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702078", "story_v_side_old_103702.awb") / 1000

					if var_318_9 + var_318_1 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_9 + var_318_1
					end

					if var_318_4.prefab_name ~= "" and arg_315_1.actors_[var_318_4.prefab_name] ~= nil then
						local var_318_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_4.prefab_name].transform, "story_v_side_old_103702", "103702078", "story_v_side_old_103702.awb")

						arg_315_1:RecordAudio("103702078", var_318_10)
						arg_315_1:RecordAudio("103702078", var_318_10)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702078", "story_v_side_old_103702.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702078", "story_v_side_old_103702.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_11 = math.max(var_318_2, arg_315_1.talkMaxDuration)

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_11 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_1) / var_318_11

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_1 + var_318_11 and arg_315_1.time_ < var_318_1 + var_318_11 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play103702079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 103702079
		arg_319_1.duration_ = 6.366

		local var_319_0 = {
			ja = 6.366,
			ko = 4.433,
			en = 3.166
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
				arg_319_0:Play103702080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1036ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1036ui_story == nil then
				arg_319_1.var_.characterEffect1036ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.2

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1036ui_story then
					local var_322_4 = Mathf.Lerp(0, 0.5, var_322_3)

					arg_319_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1036ui_story.fillRatio = var_322_4
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1036ui_story then
				local var_322_5 = 0.5

				arg_319_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1036ui_story.fillRatio = var_322_5
			end

			local var_322_6 = arg_319_1.actors_["1037ui_story"]
			local var_322_7 = 0

			if var_322_7 < arg_319_1.time_ and arg_319_1.time_ <= var_322_7 + arg_322_0 and arg_319_1.var_.characterEffect1037ui_story == nil then
				arg_319_1.var_.characterEffect1037ui_story = var_322_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_8 = 0.2

			if var_322_7 <= arg_319_1.time_ and arg_319_1.time_ < var_322_7 + var_322_8 then
				local var_322_9 = (arg_319_1.time_ - var_322_7) / var_322_8

				if arg_319_1.var_.characterEffect1037ui_story then
					arg_319_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_7 + var_322_8 and arg_319_1.time_ < var_322_7 + var_322_8 + arg_322_0 and arg_319_1.var_.characterEffect1037ui_story then
				arg_319_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 then
				arg_319_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_322_11 = 0

			if var_322_11 < arg_319_1.time_ and arg_319_1.time_ <= var_322_11 + arg_322_0 then
				arg_319_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action424")
			end

			local var_322_12 = 0
			local var_322_13 = 0.4

			if var_322_12 < arg_319_1.time_ and arg_319_1.time_ <= var_322_12 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_14 = arg_319_1:FormatText(StoryNameCfg[15].name)

				arg_319_1.leftNameTxt_.text = var_322_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_15 = arg_319_1:GetWordFromCfg(103702079)
				local var_322_16 = arg_319_1:FormatText(var_322_15.content)

				arg_319_1.text_.text = var_322_16

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_17 = 16
				local var_322_18 = utf8.len(var_322_16)
				local var_322_19 = var_322_17 <= 0 and var_322_13 or var_322_13 * (var_322_18 / var_322_17)

				if var_322_19 > 0 and var_322_13 < var_322_19 then
					arg_319_1.talkMaxDuration = var_322_19

					if var_322_19 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_19 + var_322_12
					end
				end

				arg_319_1.text_.text = var_322_16
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702079", "story_v_side_old_103702.awb") ~= 0 then
					local var_322_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702079", "story_v_side_old_103702.awb") / 1000

					if var_322_20 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_12
					end

					if var_322_15.prefab_name ~= "" and arg_319_1.actors_[var_322_15.prefab_name] ~= nil then
						local var_322_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_15.prefab_name].transform, "story_v_side_old_103702", "103702079", "story_v_side_old_103702.awb")

						arg_319_1:RecordAudio("103702079", var_322_21)
						arg_319_1:RecordAudio("103702079", var_322_21)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702079", "story_v_side_old_103702.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702079", "story_v_side_old_103702.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_22 = math.max(var_322_13, arg_319_1.talkMaxDuration)

			if var_322_12 <= arg_319_1.time_ and arg_319_1.time_ < var_322_12 + var_322_22 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_12) / var_322_22

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_12 + var_322_22 and arg_319_1.time_ < var_322_12 + var_322_22 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play103702080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 103702080
		arg_323_1.duration_ = 7.766

		local var_323_0 = {
			ja = 7.766,
			ko = 6.366,
			en = 7.466
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
				arg_323_0:Play103702081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1037ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1037ui_story == nil then
				arg_323_1.var_.characterEffect1037ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.2

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1037ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1037ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1037ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1037ui_story.fillRatio = var_326_5
			end

			local var_326_6 = arg_323_1.actors_["1036ui_story"]
			local var_326_7 = 0

			if var_326_7 < arg_323_1.time_ and arg_323_1.time_ <= var_326_7 + arg_326_0 and arg_323_1.var_.characterEffect1036ui_story == nil then
				arg_323_1.var_.characterEffect1036ui_story = var_326_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_8 = 0.2

			if var_326_7 <= arg_323_1.time_ and arg_323_1.time_ < var_326_7 + var_326_8 then
				local var_326_9 = (arg_323_1.time_ - var_326_7) / var_326_8

				if arg_323_1.var_.characterEffect1036ui_story then
					arg_323_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_7 + var_326_8 and arg_323_1.time_ < var_326_7 + var_326_8 + arg_326_0 and arg_323_1.var_.characterEffect1036ui_story then
				arg_323_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 then
				arg_323_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_326_11 = 0

			if var_326_11 < arg_323_1.time_ and arg_323_1.time_ <= var_326_11 + arg_326_0 then
				arg_323_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036actionlink/1036action442")
			end

			local var_326_12 = 0
			local var_326_13 = 0.675

			if var_326_12 < arg_323_1.time_ and arg_323_1.time_ <= var_326_12 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_14 = arg_323_1:FormatText(StoryNameCfg[5].name)

				arg_323_1.leftNameTxt_.text = var_326_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_15 = arg_323_1:GetWordFromCfg(103702080)
				local var_326_16 = arg_323_1:FormatText(var_326_15.content)

				arg_323_1.text_.text = var_326_16

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_17 = 27
				local var_326_18 = utf8.len(var_326_16)
				local var_326_19 = var_326_17 <= 0 and var_326_13 or var_326_13 * (var_326_18 / var_326_17)

				if var_326_19 > 0 and var_326_13 < var_326_19 then
					arg_323_1.talkMaxDuration = var_326_19

					if var_326_19 + var_326_12 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_19 + var_326_12
					end
				end

				arg_323_1.text_.text = var_326_16
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702080", "story_v_side_old_103702.awb") ~= 0 then
					local var_326_20 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702080", "story_v_side_old_103702.awb") / 1000

					if var_326_20 + var_326_12 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_20 + var_326_12
					end

					if var_326_15.prefab_name ~= "" and arg_323_1.actors_[var_326_15.prefab_name] ~= nil then
						local var_326_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_15.prefab_name].transform, "story_v_side_old_103702", "103702080", "story_v_side_old_103702.awb")

						arg_323_1:RecordAudio("103702080", var_326_21)
						arg_323_1:RecordAudio("103702080", var_326_21)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702080", "story_v_side_old_103702.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702080", "story_v_side_old_103702.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_22 = math.max(var_326_13, arg_323_1.talkMaxDuration)

			if var_326_12 <= arg_323_1.time_ and arg_323_1.time_ < var_326_12 + var_326_22 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_12) / var_326_22

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_12 + var_326_22 and arg_323_1.time_ < var_326_12 + var_326_22 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play103702081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 103702081
		arg_327_1.duration_ = 6

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
			arg_327_1.auto_ = false
		end

		function arg_327_1.playNext_(arg_329_0)
			arg_327_1.onStoryFinished_()
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.bgs_.ST12
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				local var_330_2 = var_330_0:GetComponent("SpriteRenderer")

				if var_330_2 then
					var_330_2.material = arg_327_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_330_3 = var_330_2.material
					local var_330_4 = var_330_3:GetColor("_Color")

					arg_327_1.var_.alphaOldValueST12 = var_330_4.a
					arg_327_1.var_.alphaMatValueST12 = var_330_3
				end

				arg_327_1.var_.alphaOldValueST12 = 1
			end

			local var_330_5 = 1

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_5 then
				local var_330_6 = (arg_327_1.time_ - var_330_1) / var_330_5
				local var_330_7 = Mathf.Lerp(arg_327_1.var_.alphaOldValueST12, 0, var_330_6)

				if arg_327_1.var_.alphaMatValueST12 then
					local var_330_8 = arg_327_1.var_.alphaMatValueST12
					local var_330_9 = var_330_8:GetColor("_Color")

					var_330_9.a = var_330_7

					var_330_8:SetColor("_Color", var_330_9)
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_5 and arg_327_1.time_ < var_330_1 + var_330_5 + arg_330_0 and arg_327_1.var_.alphaMatValueST12 then
				local var_330_10 = arg_327_1.var_.alphaMatValueST12
				local var_330_11 = var_330_10:GetColor("_Color")

				var_330_11.a = 0

				var_330_10:SetColor("_Color", var_330_11)
			end

			local var_330_12 = arg_327_1.actors_["1036ui_story"].transform
			local var_330_13 = 0

			if var_330_13 < arg_327_1.time_ and arg_327_1.time_ <= var_330_13 + arg_330_0 then
				arg_327_1.var_.moveOldPos1036ui_story = var_330_12.localPosition
			end

			local var_330_14 = 0.001

			if var_330_13 <= arg_327_1.time_ and arg_327_1.time_ < var_330_13 + var_330_14 then
				local var_330_15 = (arg_327_1.time_ - var_330_13) / var_330_14
				local var_330_16 = Vector3.New(0, 100, 0)

				var_330_12.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1036ui_story, var_330_16, var_330_15)

				local var_330_17 = manager.ui.mainCamera.transform.position - var_330_12.position

				var_330_12.forward = Vector3.New(var_330_17.x, var_330_17.y, var_330_17.z)

				local var_330_18 = var_330_12.localEulerAngles

				var_330_18.z = 0
				var_330_18.x = 0
				var_330_12.localEulerAngles = var_330_18
			end

			if arg_327_1.time_ >= var_330_13 + var_330_14 and arg_327_1.time_ < var_330_13 + var_330_14 + arg_330_0 then
				var_330_12.localPosition = Vector3.New(0, 100, 0)

				local var_330_19 = manager.ui.mainCamera.transform.position - var_330_12.position

				var_330_12.forward = Vector3.New(var_330_19.x, var_330_19.y, var_330_19.z)

				local var_330_20 = var_330_12.localEulerAngles

				var_330_20.z = 0
				var_330_20.x = 0
				var_330_12.localEulerAngles = var_330_20
			end

			local var_330_21 = arg_327_1.actors_["1037ui_story"].transform
			local var_330_22 = 0

			if var_330_22 < arg_327_1.time_ and arg_327_1.time_ <= var_330_22 + arg_330_0 then
				arg_327_1.var_.moveOldPos1037ui_story = var_330_21.localPosition
			end

			local var_330_23 = 0.001

			if var_330_22 <= arg_327_1.time_ and arg_327_1.time_ < var_330_22 + var_330_23 then
				local var_330_24 = (arg_327_1.time_ - var_330_22) / var_330_23
				local var_330_25 = Vector3.New(0, 100, 0)

				var_330_21.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1037ui_story, var_330_25, var_330_24)

				local var_330_26 = manager.ui.mainCamera.transform.position - var_330_21.position

				var_330_21.forward = Vector3.New(var_330_26.x, var_330_26.y, var_330_26.z)

				local var_330_27 = var_330_21.localEulerAngles

				var_330_27.z = 0
				var_330_27.x = 0
				var_330_21.localEulerAngles = var_330_27
			end

			if arg_327_1.time_ >= var_330_22 + var_330_23 and arg_327_1.time_ < var_330_22 + var_330_23 + arg_330_0 then
				var_330_21.localPosition = Vector3.New(0, 100, 0)

				local var_330_28 = manager.ui.mainCamera.transform.position - var_330_21.position

				var_330_21.forward = Vector3.New(var_330_28.x, var_330_28.y, var_330_28.z)

				local var_330_29 = var_330_21.localEulerAngles

				var_330_29.z = 0
				var_330_29.x = 0
				var_330_21.localEulerAngles = var_330_29
			end

			if arg_327_1.frameCnt_ <= 1 then
				arg_327_1.dialog_:SetActive(false)
			end

			local var_330_30 = 1
			local var_330_31 = 0.3

			if var_330_30 < arg_327_1.time_ and arg_327_1.time_ <= var_330_30 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0

				arg_327_1.dialog_:SetActive(true)

				local var_330_32 = LeanTween.value(arg_327_1.dialog_, 0, 1, 0.3)

				var_330_32:setOnUpdate(LuaHelper.FloatAction(function(arg_331_0)
					arg_327_1.dialogCg_.alpha = arg_331_0
				end))
				var_330_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_327_1.dialog_)
					var_330_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_327_1.duration_ = arg_327_1.duration_ + 0.3

				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_33 = arg_327_1:GetWordFromCfg(103702081)
				local var_330_34 = arg_327_1:FormatText(var_330_33.content)

				arg_327_1.text_.text = var_330_34

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_35 = 12
				local var_330_36 = utf8.len(var_330_34)
				local var_330_37 = var_330_35 <= 0 and var_330_31 or var_330_31 * (var_330_36 / var_330_35)

				if var_330_37 > 0 and var_330_31 < var_330_37 then
					arg_327_1.talkMaxDuration = var_330_37
					var_330_30 = var_330_30 + 0.3

					if var_330_37 + var_330_30 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_37 + var_330_30
					end
				end

				arg_327_1.text_.text = var_330_34
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_38 = var_330_30 + 0.3
			local var_330_39 = math.max(var_330_31, arg_327_1.talkMaxDuration)

			if var_330_38 <= arg_327_1.time_ and arg_327_1.time_ < var_330_38 + var_330_39 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_38) / var_330_39

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_38 + var_330_39 and arg_327_1.time_ < var_330_38 + var_330_39 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play103702027 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 103702027
		arg_333_1.duration_ = 10.6

		local var_333_0 = {
			ja = 10.6,
			ko = 6.433,
			en = 8.166
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
				arg_333_0:Play103702028(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.75

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_2 = arg_333_1:FormatText(StoryNameCfg[10].name)

				arg_333_1.leftNameTxt_.text = var_336_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, true)
				arg_333_1.iconController_:SetSelectedState("hero")

				arg_333_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_3 = arg_333_1:GetWordFromCfg(103702027)
				local var_336_4 = arg_333_1:FormatText(var_336_3.content)

				arg_333_1.text_.text = var_336_4

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_5 = 30
				local var_336_6 = utf8.len(var_336_4)
				local var_336_7 = var_336_5 <= 0 and var_336_1 or var_336_1 * (var_336_6 / var_336_5)

				if var_336_7 > 0 and var_336_1 < var_336_7 then
					arg_333_1.talkMaxDuration = var_336_7

					if var_336_7 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_7 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_4
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103702", "103702027", "story_v_side_old_103702.awb") ~= 0 then
					local var_336_8 = manager.audio:GetVoiceLength("story_v_side_old_103702", "103702027", "story_v_side_old_103702.awb") / 1000

					if var_336_8 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_8 + var_336_0
					end

					if var_336_3.prefab_name ~= "" and arg_333_1.actors_[var_336_3.prefab_name] ~= nil then
						local var_336_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_3.prefab_name].transform, "story_v_side_old_103702", "103702027", "story_v_side_old_103702.awb")

						arg_333_1:RecordAudio("103702027", var_336_9)
						arg_333_1:RecordAudio("103702027", var_336_9)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_side_old_103702", "103702027", "story_v_side_old_103702.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_side_old_103702", "103702027", "story_v_side_old_103702.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_10 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_10 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_10

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_10 and arg_333_1.time_ < var_336_0 + var_336_10 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST13a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12"
	},
	voices = {
		"story_v_side_old_103702.awb"
	}
}
