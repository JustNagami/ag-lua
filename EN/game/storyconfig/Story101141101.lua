return {
	Play114111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114111001
		arg_1_1.duration_ = 6.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play114111002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F04"

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
				local var_4_5 = arg_1_1.bgs_.F04

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
					if iter_4_0 ~= "F04" then
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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 0.5

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999999
			local var_4_31 = 0.25

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

				local var_4_33 = arg_1_1:GetWordFromCfg(114111001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 10
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
	Play114111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114111002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play114111003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.275

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

				local var_10_2 = arg_7_1:GetWordFromCfg(114111002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 51
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
	Play114111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114111003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play114111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.3

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_2 = arg_11_1:GetWordFromCfg(114111003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 52
				local var_14_5 = utf8.len(var_14_3)
				local var_14_6 = var_14_4 <= 0 and var_14_1 or var_14_1 * (var_14_5 / var_14_4)

				if var_14_6 > 0 and var_14_1 < var_14_6 then
					arg_11_1.talkMaxDuration = var_14_6

					if var_14_6 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_6 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_3
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_7 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_7 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_7

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_7 and arg_11_1.time_ < var_14_0 + var_14_7 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114111004
		arg_15_1.duration_ = 7.766

		local var_15_0 = {
			ja = 5.866,
			ko = 7.233,
			zh = 7.766,
			en = 5.533
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
				arg_15_0:Play114111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1067ui_story"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("Char/" .. var_18_0), arg_15_1.stage_.transform)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_0] = var_18_1

				local var_18_2 = var_18_1:GetComponentInChildren(typeof(CharacterEffect))

				var_18_2.enabled = true

				local var_18_3 = GameObjectTools.GetOrAddComponent(var_18_1, typeof(DynamicBoneHelper))

				if var_18_3 then
					var_18_3:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_2.transform, false)

				arg_15_1.var_[var_18_0 .. "Animator"] = var_18_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_0 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_0 .. "LipSync"] = var_18_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_4 = arg_15_1.actors_["1067ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1067ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(-0.7, -1.06, -6.2)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1067ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_15 = arg_15_1.actors_["1067ui_story"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1067ui_story == nil then
				arg_15_1.var_.characterEffect1067ui_story = var_18_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_17 = 0.2

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17

				if arg_15_1.var_.characterEffect1067ui_story then
					arg_15_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1067ui_story then
				arg_15_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_18_19 = 0
			local var_18_20 = 0.7

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[206].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(114111004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 28
				local var_18_25 = utf8.len(var_18_23)
				local var_18_26 = var_18_24 <= 0 and var_18_20 or var_18_20 * (var_18_25 / var_18_24)

				if var_18_26 > 0 and var_18_20 < var_18_26 then
					arg_15_1.talkMaxDuration = var_18_26

					if var_18_26 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_26 + var_18_19
					end
				end

				arg_15_1.text_.text = var_18_23
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111004", "story_v_out_114111.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_114111", "114111004", "story_v_out_114111.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_114111", "114111004", "story_v_out_114111.awb")

						arg_15_1:RecordAudio("114111004", var_18_28)
						arg_15_1:RecordAudio("114111004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114111", "114111004", "story_v_out_114111.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114111", "114111004", "story_v_out_114111.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_29 = math.max(var_18_20, arg_15_1.talkMaxDuration)

			if var_18_19 <= arg_15_1.time_ and arg_15_1.time_ < var_18_19 + var_18_29 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_19) / var_18_29

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_19 + var_18_29 and arg_15_1.time_ < var_18_19 + var_18_29 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play114111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114111005
		arg_19_1.duration_ = 7.133

		local var_19_0 = {
			ja = 7.133,
			ko = 4.566,
			zh = 3.9,
			en = 4.133
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
				arg_19_0:Play114111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1042ui_story"

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

			local var_22_4 = arg_19_1.actors_["1042ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1042ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0.7, -1.06, -6.2)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1042ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_22_15 = arg_19_1.actors_["1042ui_story"]
			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 and arg_19_1.var_.characterEffect1042ui_story == nil then
				arg_19_1.var_.characterEffect1042ui_story = var_22_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_17 = 0.2

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17

				if arg_19_1.var_.characterEffect1042ui_story then
					arg_19_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 and arg_19_1.var_.characterEffect1042ui_story then
				arg_19_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_22_19 = arg_19_1.actors_["1067ui_story"]
			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 and arg_19_1.var_.characterEffect1067ui_story == nil then
				arg_19_1.var_.characterEffect1067ui_story = var_22_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_21 = 0.2

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_20) / var_22_21

				if arg_19_1.var_.characterEffect1067ui_story then
					local var_22_23 = Mathf.Lerp(0, 0.5, var_22_22)

					arg_19_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1067ui_story.fillRatio = var_22_23
				end
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 and arg_19_1.var_.characterEffect1067ui_story then
				local var_22_24 = 0.5

				arg_19_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1067ui_story.fillRatio = var_22_24
			end

			local var_22_25 = 0
			local var_22_26 = 0.45

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_27 = arg_19_1:FormatText(StoryNameCfg[205].name)

				arg_19_1.leftNameTxt_.text = var_22_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_28 = arg_19_1:GetWordFromCfg(114111005)
				local var_22_29 = arg_19_1:FormatText(var_22_28.content)

				arg_19_1.text_.text = var_22_29

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_30 = 18
				local var_22_31 = utf8.len(var_22_29)
				local var_22_32 = var_22_30 <= 0 and var_22_26 or var_22_26 * (var_22_31 / var_22_30)

				if var_22_32 > 0 and var_22_26 < var_22_32 then
					arg_19_1.talkMaxDuration = var_22_32

					if var_22_32 + var_22_25 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_32 + var_22_25
					end
				end

				arg_19_1.text_.text = var_22_29
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111005", "story_v_out_114111.awb") ~= 0 then
					local var_22_33 = manager.audio:GetVoiceLength("story_v_out_114111", "114111005", "story_v_out_114111.awb") / 1000

					if var_22_33 + var_22_25 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_33 + var_22_25
					end

					if var_22_28.prefab_name ~= "" and arg_19_1.actors_[var_22_28.prefab_name] ~= nil then
						local var_22_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_28.prefab_name].transform, "story_v_out_114111", "114111005", "story_v_out_114111.awb")

						arg_19_1:RecordAudio("114111005", var_22_34)
						arg_19_1:RecordAudio("114111005", var_22_34)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114111", "114111005", "story_v_out_114111.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114111", "114111005", "story_v_out_114111.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_35 = math.max(var_22_26, arg_19_1.talkMaxDuration)

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_35 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_25) / var_22_35

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_25 + var_22_35 and arg_19_1.time_ < var_22_25 + var_22_35 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114111006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play114111007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1067ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1067ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1067ui_story, var_26_4, var_26_3)

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

			local var_26_9 = arg_23_1.actors_["1042ui_story"].transform
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.var_.moveOldPos1042ui_story = var_26_9.localPosition
			end

			local var_26_11 = 0.001

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11
				local var_26_13 = Vector3.New(0, 100, 0)

				var_26_9.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1042ui_story, var_26_13, var_26_12)

				local var_26_14 = manager.ui.mainCamera.transform.position - var_26_9.position

				var_26_9.forward = Vector3.New(var_26_14.x, var_26_14.y, var_26_14.z)

				local var_26_15 = var_26_9.localEulerAngles

				var_26_15.z = 0
				var_26_15.x = 0
				var_26_9.localEulerAngles = var_26_15
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 then
				var_26_9.localPosition = Vector3.New(0, 100, 0)

				local var_26_16 = manager.ui.mainCamera.transform.position - var_26_9.position

				var_26_9.forward = Vector3.New(var_26_16.x, var_26_16.y, var_26_16.z)

				local var_26_17 = var_26_9.localEulerAngles

				var_26_17.z = 0
				var_26_17.x = 0
				var_26_9.localEulerAngles = var_26_17
			end

			local var_26_18 = 0
			local var_26_19 = 0.875

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_20 = arg_23_1:GetWordFromCfg(114111006)
				local var_26_21 = arg_23_1:FormatText(var_26_20.content)

				arg_23_1.text_.text = var_26_21

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_22 = 35
				local var_26_23 = utf8.len(var_26_21)
				local var_26_24 = var_26_22 <= 0 and var_26_19 or var_26_19 * (var_26_23 / var_26_22)

				if var_26_24 > 0 and var_26_19 < var_26_24 then
					arg_23_1.talkMaxDuration = var_26_24

					if var_26_24 + var_26_18 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_24 + var_26_18
					end
				end

				arg_23_1.text_.text = var_26_21
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_25 = math.max(var_26_19, arg_23_1.talkMaxDuration)

			if var_26_18 <= arg_23_1.time_ and arg_23_1.time_ < var_26_18 + var_26_25 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_18) / var_26_25

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_18 + var_26_25 and arg_23_1.time_ < var_26_18 + var_26_25 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play114111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114111007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play114111008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.65

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(114111007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 26
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play114111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114111008
		arg_31_1.duration_ = 16.633

		local var_31_0 = {
			ja = 16.633,
			ko = 8.7,
			zh = 9.833,
			en = 10.5
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
				arg_31_0:Play114111009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1067ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1067ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1067ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1042ui_story"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos1042ui_story = var_34_9.localPosition
			end

			local var_34_11 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11
				local var_34_13 = Vector3.New(0.7, -1.06, -6.2)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1042ui_story, var_34_13, var_34_12)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_9.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_9.localEulerAngles = var_34_15
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_9.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_9.localEulerAngles = var_34_17
			end

			local var_34_18 = 0

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_34_20 = arg_31_1.actors_["1067ui_story"]
			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 and arg_31_1.var_.characterEffect1067ui_story == nil then
				arg_31_1.var_.characterEffect1067ui_story = var_34_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_22 = 0.2

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22

				if arg_31_1.var_.characterEffect1067ui_story then
					arg_31_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 and arg_31_1.var_.characterEffect1067ui_story then
				arg_31_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_34_24 = arg_31_1.actors_["1042ui_story"]
			local var_34_25 = 0

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 and arg_31_1.var_.characterEffect1042ui_story == nil then
				arg_31_1.var_.characterEffect1042ui_story = var_34_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_26 = 0.2

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_25) / var_34_26

				if arg_31_1.var_.characterEffect1042ui_story then
					local var_34_28 = Mathf.Lerp(0, 0.5, var_34_27)

					arg_31_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1042ui_story.fillRatio = var_34_28
				end
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 and arg_31_1.var_.characterEffect1042ui_story then
				local var_34_29 = 0.5

				arg_31_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1042ui_story.fillRatio = var_34_29
			end

			local var_34_30 = 0
			local var_34_31 = 1.1

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_32 = arg_31_1:FormatText(StoryNameCfg[206].name)

				arg_31_1.leftNameTxt_.text = var_34_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_33 = arg_31_1:GetWordFromCfg(114111008)
				local var_34_34 = arg_31_1:FormatText(var_34_33.content)

				arg_31_1.text_.text = var_34_34

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_35 = 44
				local var_34_36 = utf8.len(var_34_34)
				local var_34_37 = var_34_35 <= 0 and var_34_31 or var_34_31 * (var_34_36 / var_34_35)

				if var_34_37 > 0 and var_34_31 < var_34_37 then
					arg_31_1.talkMaxDuration = var_34_37

					if var_34_37 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_30
					end
				end

				arg_31_1.text_.text = var_34_34
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111008", "story_v_out_114111.awb") ~= 0 then
					local var_34_38 = manager.audio:GetVoiceLength("story_v_out_114111", "114111008", "story_v_out_114111.awb") / 1000

					if var_34_38 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_38 + var_34_30
					end

					if var_34_33.prefab_name ~= "" and arg_31_1.actors_[var_34_33.prefab_name] ~= nil then
						local var_34_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_33.prefab_name].transform, "story_v_out_114111", "114111008", "story_v_out_114111.awb")

						arg_31_1:RecordAudio("114111008", var_34_39)
						arg_31_1:RecordAudio("114111008", var_34_39)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114111", "114111008", "story_v_out_114111.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114111", "114111008", "story_v_out_114111.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_40 = math.max(var_34_31, arg_31_1.talkMaxDuration)

			if var_34_30 <= arg_31_1.time_ and arg_31_1.time_ < var_34_30 + var_34_40 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_30) / var_34_40

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_30 + var_34_40 and arg_31_1.time_ < var_34_30 + var_34_40 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114111009
		arg_35_1.duration_ = 10.366

		local var_35_0 = {
			ja = 10.366,
			ko = 6.4,
			zh = 7.266,
			en = 7.433
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
				arg_35_0:Play114111010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1067ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1067ui_story == nil then
				arg_35_1.var_.characterEffect1067ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1067ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1067ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1067ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1067ui_story.fillRatio = var_38_5
			end

			local var_38_6 = 0

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action4_1")
			end

			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_38_8 = arg_35_1.actors_["1042ui_story"]
			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 and arg_35_1.var_.characterEffect1042ui_story == nil then
				arg_35_1.var_.characterEffect1042ui_story = var_38_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_10 = 0.2

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_9) / var_38_10

				if arg_35_1.var_.characterEffect1042ui_story then
					arg_35_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_9 + var_38_10 and arg_35_1.time_ < var_38_9 + var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1042ui_story then
				arg_35_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_38_12 = 0
			local var_38_13 = 0.675

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_14 = arg_35_1:FormatText(StoryNameCfg[205].name)

				arg_35_1.leftNameTxt_.text = var_38_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_15 = arg_35_1:GetWordFromCfg(114111009)
				local var_38_16 = arg_35_1:FormatText(var_38_15.content)

				arg_35_1.text_.text = var_38_16

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_17 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111009", "story_v_out_114111.awb") ~= 0 then
					local var_38_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111009", "story_v_out_114111.awb") / 1000

					if var_38_20 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_20 + var_38_12
					end

					if var_38_15.prefab_name ~= "" and arg_35_1.actors_[var_38_15.prefab_name] ~= nil then
						local var_38_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_15.prefab_name].transform, "story_v_out_114111", "114111009", "story_v_out_114111.awb")

						arg_35_1:RecordAudio("114111009", var_38_21)
						arg_35_1:RecordAudio("114111009", var_38_21)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114111", "114111009", "story_v_out_114111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114111", "114111009", "story_v_out_114111.awb")
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
	Play114111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114111010
		arg_39_1.duration_ = 6.366

		local var_39_0 = {
			ja = 5.7,
			ko = 5.333,
			zh = 4.833,
			en = 6.366
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
				arg_39_0:Play114111011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1042ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1042ui_story == nil then
				arg_39_1.var_.characterEffect1042ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1042ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1042ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1042ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1042ui_story.fillRatio = var_42_5
			end

			local var_42_6 = arg_39_1.actors_["1067ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect1067ui_story == nil then
				arg_39_1.var_.characterEffect1067ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.2

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect1067ui_story then
					arg_39_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect1067ui_story then
				arg_39_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_1")
			end

			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_42_12 = 0
			local var_42_13 = 0.55

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[206].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(114111010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 22
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111010", "story_v_out_114111.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111010", "story_v_out_114111.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_114111", "114111010", "story_v_out_114111.awb")

						arg_39_1:RecordAudio("114111010", var_42_21)
						arg_39_1:RecordAudio("114111010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114111", "114111010", "story_v_out_114111.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114111", "114111010", "story_v_out_114111.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play114111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114111011
		arg_43_1.duration_ = 6.033

		local var_43_0 = {
			ja = 6.033,
			ko = 2.9,
			zh = 3.666,
			en = 4.1
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
				arg_43_0:Play114111012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_46_1 = arg_43_1.actors_["1042ui_story"]
			local var_46_2 = 0

			if var_46_2 < arg_43_1.time_ and arg_43_1.time_ <= var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1042ui_story == nil then
				arg_43_1.var_.characterEffect1042ui_story = var_46_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_3 = 0.2

			if var_46_2 <= arg_43_1.time_ and arg_43_1.time_ < var_46_2 + var_46_3 then
				local var_46_4 = (arg_43_1.time_ - var_46_2) / var_46_3

				if arg_43_1.var_.characterEffect1042ui_story then
					arg_43_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_2 + var_46_3 and arg_43_1.time_ < var_46_2 + var_46_3 + arg_46_0 and arg_43_1.var_.characterEffect1042ui_story then
				arg_43_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_46_5 = arg_43_1.actors_["1067ui_story"]
			local var_46_6 = 0

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1067ui_story == nil then
				arg_43_1.var_.characterEffect1067ui_story = var_46_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_7 = 0.2

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_7 then
				local var_46_8 = (arg_43_1.time_ - var_46_6) / var_46_7

				if arg_43_1.var_.characterEffect1067ui_story then
					local var_46_9 = Mathf.Lerp(0, 0.5, var_46_8)

					arg_43_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1067ui_story.fillRatio = var_46_9
				end
			end

			if arg_43_1.time_ >= var_46_6 + var_46_7 and arg_43_1.time_ < var_46_6 + var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect1067ui_story then
				local var_46_10 = 0.5

				arg_43_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1067ui_story.fillRatio = var_46_10
			end

			local var_46_11 = 0
			local var_46_12 = 0.225

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_13 = arg_43_1:FormatText(StoryNameCfg[205].name)

				arg_43_1.leftNameTxt_.text = var_46_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_14 = arg_43_1:GetWordFromCfg(114111011)
				local var_46_15 = arg_43_1:FormatText(var_46_14.content)

				arg_43_1.text_.text = var_46_15

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_16 = 9
				local var_46_17 = utf8.len(var_46_15)
				local var_46_18 = var_46_16 <= 0 and var_46_12 or var_46_12 * (var_46_17 / var_46_16)

				if var_46_18 > 0 and var_46_12 < var_46_18 then
					arg_43_1.talkMaxDuration = var_46_18

					if var_46_18 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_18 + var_46_11
					end
				end

				arg_43_1.text_.text = var_46_15
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111011", "story_v_out_114111.awb") ~= 0 then
					local var_46_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111011", "story_v_out_114111.awb") / 1000

					if var_46_19 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_11
					end

					if var_46_14.prefab_name ~= "" and arg_43_1.actors_[var_46_14.prefab_name] ~= nil then
						local var_46_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_14.prefab_name].transform, "story_v_out_114111", "114111011", "story_v_out_114111.awb")

						arg_43_1:RecordAudio("114111011", var_46_20)
						arg_43_1:RecordAudio("114111011", var_46_20)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_114111", "114111011", "story_v_out_114111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_114111", "114111011", "story_v_out_114111.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_21 = math.max(var_46_12, arg_43_1.talkMaxDuration)

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_21 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_11) / var_46_21

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_11 + var_46_21 and arg_43_1.time_ < var_46_11 + var_46_21 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114111012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114111012
		arg_47_1.duration_ = 14.6

		local var_47_0 = {
			ja = 14.6,
			ko = 10.433,
			zh = 9.966,
			en = 13.1
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
				arg_47_0:Play114111013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1067ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1067ui_story == nil then
				arg_47_1.var_.characterEffect1067ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1067ui_story then
					arg_47_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1067ui_story then
				arg_47_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_2")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_6 = arg_47_1.actors_["1042ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1042ui_story == nil then
				arg_47_1.var_.characterEffect1042ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.2

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1042ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1042ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1042ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1042ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 1.075

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[206].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(114111012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111012", "story_v_out_114111.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111012", "story_v_out_114111.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_114111", "114111012", "story_v_out_114111.awb")

						arg_47_1:RecordAudio("114111012", var_50_21)
						arg_47_1:RecordAudio("114111012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_114111", "114111012", "story_v_out_114111.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_114111", "114111012", "story_v_out_114111.awb")
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
	Play114111013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114111013
		arg_51_1.duration_ = 10.8

		local var_51_0 = {
			ja = 9.533,
			ko = 10.8,
			zh = 10.466,
			en = 10.433
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
				arg_51_0:Play114111014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_54_1 = 0
			local var_54_2 = 1

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_3 = arg_51_1:FormatText(StoryNameCfg[206].name)

				arg_51_1.leftNameTxt_.text = var_54_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_4 = arg_51_1:GetWordFromCfg(114111013)
				local var_54_5 = arg_51_1:FormatText(var_54_4.content)

				arg_51_1.text_.text = var_54_5

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_6 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111013", "story_v_out_114111.awb") ~= 0 then
					local var_54_9 = manager.audio:GetVoiceLength("story_v_out_114111", "114111013", "story_v_out_114111.awb") / 1000

					if var_54_9 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_1
					end

					if var_54_4.prefab_name ~= "" and arg_51_1.actors_[var_54_4.prefab_name] ~= nil then
						local var_54_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_4.prefab_name].transform, "story_v_out_114111", "114111013", "story_v_out_114111.awb")

						arg_51_1:RecordAudio("114111013", var_54_10)
						arg_51_1:RecordAudio("114111013", var_54_10)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_114111", "114111013", "story_v_out_114111.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_114111", "114111013", "story_v_out_114111.awb")
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
	Play114111014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114111014
		arg_55_1.duration_ = 13.7

		local var_55_0 = {
			ja = 12.266,
			ko = 13.7,
			zh = 12.366,
			en = 12.533
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
				arg_55_0:Play114111015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action4_1")
			end

			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_58_2 = 0
			local var_58_3 = 1.1

			if var_58_2 < arg_55_1.time_ and arg_55_1.time_ <= var_58_2 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_4 = arg_55_1:FormatText(StoryNameCfg[206].name)

				arg_55_1.leftNameTxt_.text = var_58_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_5 = arg_55_1:GetWordFromCfg(114111014)
				local var_58_6 = arg_55_1:FormatText(var_58_5.content)

				arg_55_1.text_.text = var_58_6

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_7 = 44
				local var_58_8 = utf8.len(var_58_6)
				local var_58_9 = var_58_7 <= 0 and var_58_3 or var_58_3 * (var_58_8 / var_58_7)

				if var_58_9 > 0 and var_58_3 < var_58_9 then
					arg_55_1.talkMaxDuration = var_58_9

					if var_58_9 + var_58_2 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_9 + var_58_2
					end
				end

				arg_55_1.text_.text = var_58_6
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111014", "story_v_out_114111.awb") ~= 0 then
					local var_58_10 = manager.audio:GetVoiceLength("story_v_out_114111", "114111014", "story_v_out_114111.awb") / 1000

					if var_58_10 + var_58_2 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_10 + var_58_2
					end

					if var_58_5.prefab_name ~= "" and arg_55_1.actors_[var_58_5.prefab_name] ~= nil then
						local var_58_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_5.prefab_name].transform, "story_v_out_114111", "114111014", "story_v_out_114111.awb")

						arg_55_1:RecordAudio("114111014", var_58_11)
						arg_55_1:RecordAudio("114111014", var_58_11)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_114111", "114111014", "story_v_out_114111.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_114111", "114111014", "story_v_out_114111.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_12 = math.max(var_58_3, arg_55_1.talkMaxDuration)

			if var_58_2 <= arg_55_1.time_ and arg_55_1.time_ < var_58_2 + var_58_12 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_2) / var_58_12

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_2 + var_58_12 and arg_55_1.time_ < var_58_2 + var_58_12 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play114111015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114111015
		arg_59_1.duration_ = 12.3

		local var_59_0 = {
			ja = 12.3,
			ko = 10.333,
			zh = 11.2,
			en = 10.7
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
				arg_59_0:Play114111016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action4_2")
			end

			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042actionlink/1042action442")
			end

			local var_62_2 = 0

			if var_62_2 < arg_59_1.time_ and arg_59_1.time_ <= var_62_2 + arg_62_0 then
				arg_59_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_62_3 = arg_59_1.actors_["1042ui_story"]
			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 and arg_59_1.var_.characterEffect1042ui_story == nil then
				arg_59_1.var_.characterEffect1042ui_story = var_62_3:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_5 = 0.2

			if var_62_4 <= arg_59_1.time_ and arg_59_1.time_ < var_62_4 + var_62_5 then
				local var_62_6 = (arg_59_1.time_ - var_62_4) / var_62_5

				if arg_59_1.var_.characterEffect1042ui_story then
					arg_59_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_4 + var_62_5 and arg_59_1.time_ < var_62_4 + var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1042ui_story then
				arg_59_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_62_7 = arg_59_1.actors_["1067ui_story"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect1067ui_story == nil then
				arg_59_1.var_.characterEffect1067ui_story = var_62_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_9 = 0.2

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.characterEffect1067ui_story then
					local var_62_11 = Mathf.Lerp(0, 0.5, var_62_10)

					arg_59_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1067ui_story.fillRatio = var_62_11
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.characterEffect1067ui_story then
				local var_62_12 = 0.5

				arg_59_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1067ui_story.fillRatio = var_62_12
			end

			local var_62_13 = 0
			local var_62_14 = 1.25

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_15 = arg_59_1:FormatText(StoryNameCfg[205].name)

				arg_59_1.leftNameTxt_.text = var_62_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_16 = arg_59_1:GetWordFromCfg(114111015)
				local var_62_17 = arg_59_1:FormatText(var_62_16.content)

				arg_59_1.text_.text = var_62_17

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_18 = 50
				local var_62_19 = utf8.len(var_62_17)
				local var_62_20 = var_62_18 <= 0 and var_62_14 or var_62_14 * (var_62_19 / var_62_18)

				if var_62_20 > 0 and var_62_14 < var_62_20 then
					arg_59_1.talkMaxDuration = var_62_20

					if var_62_20 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_13
					end
				end

				arg_59_1.text_.text = var_62_17
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111015", "story_v_out_114111.awb") ~= 0 then
					local var_62_21 = manager.audio:GetVoiceLength("story_v_out_114111", "114111015", "story_v_out_114111.awb") / 1000

					if var_62_21 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_21 + var_62_13
					end

					if var_62_16.prefab_name ~= "" and arg_59_1.actors_[var_62_16.prefab_name] ~= nil then
						local var_62_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_16.prefab_name].transform, "story_v_out_114111", "114111015", "story_v_out_114111.awb")

						arg_59_1:RecordAudio("114111015", var_62_22)
						arg_59_1:RecordAudio("114111015", var_62_22)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_114111", "114111015", "story_v_out_114111.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_114111", "114111015", "story_v_out_114111.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_23 = math.max(var_62_14, arg_59_1.talkMaxDuration)

			if var_62_13 <= arg_59_1.time_ and arg_59_1.time_ < var_62_13 + var_62_23 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_13) / var_62_23

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_13 + var_62_23 and arg_59_1.time_ < var_62_13 + var_62_23 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114111016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 114111016
		arg_63_1.duration_ = 7.133

		local var_63_0 = {
			ja = 5.4,
			ko = 5.366,
			zh = 6.166,
			en = 7.133
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
				arg_63_0:Play114111017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1042ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1042ui_story == nil then
				arg_63_1.var_.characterEffect1042ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1042ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1042ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1042ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1042ui_story.fillRatio = var_66_5
			end

			local var_66_6 = arg_63_1.actors_["1067ui_story"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect1067ui_story == nil then
				arg_63_1.var_.characterEffect1067ui_story = var_66_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_8 = 0.2

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.characterEffect1067ui_story then
					arg_63_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.characterEffect1067ui_story then
				arg_63_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_66_11 = 0
			local var_66_12 = 0.65

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_13 = arg_63_1:FormatText(StoryNameCfg[206].name)

				arg_63_1.leftNameTxt_.text = var_66_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_14 = arg_63_1:GetWordFromCfg(114111016)
				local var_66_15 = arg_63_1:FormatText(var_66_14.content)

				arg_63_1.text_.text = var_66_15

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_16 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111016", "story_v_out_114111.awb") ~= 0 then
					local var_66_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111016", "story_v_out_114111.awb") / 1000

					if var_66_19 + var_66_11 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_11
					end

					if var_66_14.prefab_name ~= "" and arg_63_1.actors_[var_66_14.prefab_name] ~= nil then
						local var_66_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_14.prefab_name].transform, "story_v_out_114111", "114111016", "story_v_out_114111.awb")

						arg_63_1:RecordAudio("114111016", var_66_20)
						arg_63_1:RecordAudio("114111016", var_66_20)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_114111", "114111016", "story_v_out_114111.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_114111", "114111016", "story_v_out_114111.awb")
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
	Play114111017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 114111017
		arg_67_1.duration_ = 10.866

		local var_67_0 = {
			ja = 9.366,
			ko = 10.2,
			zh = 10.866,
			en = 9.833
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
				arg_67_0:Play114111018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_70_1 = 0
			local var_70_2 = 1.3

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_3 = arg_67_1:FormatText(StoryNameCfg[206].name)

				arg_67_1.leftNameTxt_.text = var_70_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_4 = arg_67_1:GetWordFromCfg(114111017)
				local var_70_5 = arg_67_1:FormatText(var_70_4.content)

				arg_67_1.text_.text = var_70_5

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_6 = 52
				local var_70_7 = utf8.len(var_70_5)
				local var_70_8 = var_70_6 <= 0 and var_70_2 or var_70_2 * (var_70_7 / var_70_6)

				if var_70_8 > 0 and var_70_2 < var_70_8 then
					arg_67_1.talkMaxDuration = var_70_8

					if var_70_8 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_1
					end
				end

				arg_67_1.text_.text = var_70_5
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111017", "story_v_out_114111.awb") ~= 0 then
					local var_70_9 = manager.audio:GetVoiceLength("story_v_out_114111", "114111017", "story_v_out_114111.awb") / 1000

					if var_70_9 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_9 + var_70_1
					end

					if var_70_4.prefab_name ~= "" and arg_67_1.actors_[var_70_4.prefab_name] ~= nil then
						local var_70_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_4.prefab_name].transform, "story_v_out_114111", "114111017", "story_v_out_114111.awb")

						arg_67_1:RecordAudio("114111017", var_70_10)
						arg_67_1:RecordAudio("114111017", var_70_10)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_114111", "114111017", "story_v_out_114111.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_114111", "114111017", "story_v_out_114111.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_11 = math.max(var_70_2, arg_67_1.talkMaxDuration)

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_11 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_1) / var_70_11

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_1 + var_70_11 and arg_67_1.time_ < var_70_1 + var_70_11 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play114111018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 114111018
		arg_71_1.duration_ = 16.7

		local var_71_0 = {
			ja = 16.7,
			ko = 11.966,
			zh = 11.166,
			en = 12.1
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
				arg_71_0:Play114111019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_74_2 = arg_71_1.actors_["1042ui_story"]
			local var_74_3 = 0

			if var_74_3 < arg_71_1.time_ and arg_71_1.time_ <= var_74_3 + arg_74_0 and arg_71_1.var_.characterEffect1042ui_story == nil then
				arg_71_1.var_.characterEffect1042ui_story = var_74_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_4 = 0.2

			if var_74_3 <= arg_71_1.time_ and arg_71_1.time_ < var_74_3 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_3) / var_74_4

				if arg_71_1.var_.characterEffect1042ui_story then
					arg_71_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_3 + var_74_4 and arg_71_1.time_ < var_74_3 + var_74_4 + arg_74_0 and arg_71_1.var_.characterEffect1042ui_story then
				arg_71_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_74_6 = arg_71_1.actors_["1067ui_story"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 and arg_71_1.var_.characterEffect1067ui_story == nil then
				arg_71_1.var_.characterEffect1067ui_story = var_74_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_8 = 0.2

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8

				if arg_71_1.var_.characterEffect1067ui_story then
					local var_74_10 = Mathf.Lerp(0, 0.5, var_74_9)

					arg_71_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1067ui_story.fillRatio = var_74_10
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect1067ui_story then
				local var_74_11 = 0.5

				arg_71_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1067ui_story.fillRatio = var_74_11
			end

			local var_74_12 = 0
			local var_74_13 = 1.1

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[205].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(114111018)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 44
				local var_74_18 = utf8.len(var_74_16)
				local var_74_19 = var_74_17 <= 0 and var_74_13 or var_74_13 * (var_74_18 / var_74_17)

				if var_74_19 > 0 and var_74_13 < var_74_19 then
					arg_71_1.talkMaxDuration = var_74_19

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_16
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111018", "story_v_out_114111.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111018", "story_v_out_114111.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_114111", "114111018", "story_v_out_114111.awb")

						arg_71_1:RecordAudio("114111018", var_74_21)
						arg_71_1:RecordAudio("114111018", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_114111", "114111018", "story_v_out_114111.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_114111", "114111018", "story_v_out_114111.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_22 and arg_71_1.time_ < var_74_12 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play114111019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 114111019
		arg_75_1.duration_ = 10.9

		local var_75_0 = {
			ja = 10.9,
			ko = 10.9,
			zh = 10.866,
			en = 8.2
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
				arg_75_0:Play114111020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1067ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1067ui_story == nil then
				arg_75_1.var_.characterEffect1067ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1067ui_story then
					arg_75_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1067ui_story then
				arg_75_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["1042ui_story"]
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect1042ui_story == nil then
				arg_75_1.var_.characterEffect1042ui_story = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.2

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect1042ui_story then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1042ui_story.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect1042ui_story then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1042ui_story.fillRatio = var_78_9
			end

			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_1")
			end

			local var_78_11 = 0

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_78_12 = 0
			local var_78_13 = 1.175

			if var_78_12 < arg_75_1.time_ and arg_75_1.time_ <= var_78_12 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_14 = arg_75_1:FormatText(StoryNameCfg[206].name)

				arg_75_1.leftNameTxt_.text = var_78_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_15 = arg_75_1:GetWordFromCfg(114111019)
				local var_78_16 = arg_75_1:FormatText(var_78_15.content)

				arg_75_1.text_.text = var_78_16

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_17 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111019", "story_v_out_114111.awb") ~= 0 then
					local var_78_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111019", "story_v_out_114111.awb") / 1000

					if var_78_20 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_12
					end

					if var_78_15.prefab_name ~= "" and arg_75_1.actors_[var_78_15.prefab_name] ~= nil then
						local var_78_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_15.prefab_name].transform, "story_v_out_114111", "114111019", "story_v_out_114111.awb")

						arg_75_1:RecordAudio("114111019", var_78_21)
						arg_75_1:RecordAudio("114111019", var_78_21)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_114111", "114111019", "story_v_out_114111.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_114111", "114111019", "story_v_out_114111.awb")
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
	Play114111020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 114111020
		arg_79_1.duration_ = 10.533

		local var_79_0 = {
			ja = 10.533,
			ko = 8,
			zh = 8.633,
			en = 8.566
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
				arg_79_0:Play114111021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1042ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1042ui_story == nil then
				arg_79_1.var_.characterEffect1042ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1042ui_story then
					arg_79_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1042ui_story then
				arg_79_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1067ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect1067ui_story == nil then
				arg_79_1.var_.characterEffect1067ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.2

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect1067ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1067ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect1067ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1067ui_story.fillRatio = var_82_9
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_82_11 = 0
			local var_82_12 = 0.65

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_13 = arg_79_1:FormatText(StoryNameCfg[205].name)

				arg_79_1.leftNameTxt_.text = var_82_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_14 = arg_79_1:GetWordFromCfg(114111020)
				local var_82_15 = arg_79_1:FormatText(var_82_14.content)

				arg_79_1.text_.text = var_82_15

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_16 = 26
				local var_82_17 = utf8.len(var_82_15)
				local var_82_18 = var_82_16 <= 0 and var_82_12 or var_82_12 * (var_82_17 / var_82_16)

				if var_82_18 > 0 and var_82_12 < var_82_18 then
					arg_79_1.talkMaxDuration = var_82_18

					if var_82_18 + var_82_11 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_18 + var_82_11
					end
				end

				arg_79_1.text_.text = var_82_15
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111020", "story_v_out_114111.awb") ~= 0 then
					local var_82_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111020", "story_v_out_114111.awb") / 1000

					if var_82_19 + var_82_11 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_11
					end

					if var_82_14.prefab_name ~= "" and arg_79_1.actors_[var_82_14.prefab_name] ~= nil then
						local var_82_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_14.prefab_name].transform, "story_v_out_114111", "114111020", "story_v_out_114111.awb")

						arg_79_1:RecordAudio("114111020", var_82_20)
						arg_79_1:RecordAudio("114111020", var_82_20)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_114111", "114111020", "story_v_out_114111.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_114111", "114111020", "story_v_out_114111.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_21 = math.max(var_82_12, arg_79_1.talkMaxDuration)

			if var_82_11 <= arg_79_1.time_ and arg_79_1.time_ < var_82_11 + var_82_21 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_11) / var_82_21

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_11 + var_82_21 and arg_79_1.time_ < var_82_11 + var_82_21 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play114111021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114111021
		arg_83_1.duration_ = 3.4

		local var_83_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 3.366,
			en = 3.4
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
				arg_83_0:Play114111022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067actionlink/1067action437")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_86_2 = arg_83_1.actors_["1042ui_story"]
			local var_86_3 = 0

			if var_86_3 < arg_83_1.time_ and arg_83_1.time_ <= var_86_3 + arg_86_0 and arg_83_1.var_.characterEffect1042ui_story == nil then
				arg_83_1.var_.characterEffect1042ui_story = var_86_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_4 = 0.2

			if var_86_3 <= arg_83_1.time_ and arg_83_1.time_ < var_86_3 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_3) / var_86_4

				if arg_83_1.var_.characterEffect1042ui_story then
					local var_86_6 = Mathf.Lerp(0, 0.5, var_86_5)

					arg_83_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1042ui_story.fillRatio = var_86_6
				end
			end

			if arg_83_1.time_ >= var_86_3 + var_86_4 and arg_83_1.time_ < var_86_3 + var_86_4 + arg_86_0 and arg_83_1.var_.characterEffect1042ui_story then
				local var_86_7 = 0.5

				arg_83_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1042ui_story.fillRatio = var_86_7
			end

			local var_86_8 = arg_83_1.actors_["1067ui_story"]
			local var_86_9 = 0

			if var_86_9 < arg_83_1.time_ and arg_83_1.time_ <= var_86_9 + arg_86_0 and arg_83_1.var_.characterEffect1067ui_story == nil then
				arg_83_1.var_.characterEffect1067ui_story = var_86_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_10 = 0.2

			if var_86_9 <= arg_83_1.time_ and arg_83_1.time_ < var_86_9 + var_86_10 then
				local var_86_11 = (arg_83_1.time_ - var_86_9) / var_86_10

				if arg_83_1.var_.characterEffect1067ui_story then
					arg_83_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_9 + var_86_10 and arg_83_1.time_ < var_86_9 + var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1067ui_story then
				arg_83_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_86_12 = 0
			local var_86_13 = 0.05

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_14 = arg_83_1:FormatText(StoryNameCfg[206].name)

				arg_83_1.leftNameTxt_.text = var_86_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_15 = arg_83_1:GetWordFromCfg(114111021)
				local var_86_16 = arg_83_1:FormatText(var_86_15.content)

				arg_83_1.text_.text = var_86_16

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_17 = 2
				local var_86_18 = utf8.len(var_86_16)
				local var_86_19 = var_86_17 <= 0 and var_86_13 or var_86_13 * (var_86_18 / var_86_17)

				if var_86_19 > 0 and var_86_13 < var_86_19 then
					arg_83_1.talkMaxDuration = var_86_19

					if var_86_19 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_19 + var_86_12
					end
				end

				arg_83_1.text_.text = var_86_16
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111021", "story_v_out_114111.awb") ~= 0 then
					local var_86_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111021", "story_v_out_114111.awb") / 1000

					if var_86_20 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_12
					end

					if var_86_15.prefab_name ~= "" and arg_83_1.actors_[var_86_15.prefab_name] ~= nil then
						local var_86_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_15.prefab_name].transform, "story_v_out_114111", "114111021", "story_v_out_114111.awb")

						arg_83_1:RecordAudio("114111021", var_86_21)
						arg_83_1:RecordAudio("114111021", var_86_21)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_114111", "114111021", "story_v_out_114111.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_114111", "114111021", "story_v_out_114111.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_22 = math.max(var_86_13, arg_83_1.talkMaxDuration)

			if var_86_12 <= arg_83_1.time_ and arg_83_1.time_ < var_86_12 + var_86_22 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_12) / var_86_22

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_12 + var_86_22 and arg_83_1.time_ < var_86_12 + var_86_22 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play114111022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 114111022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play114111023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1067ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1067ui_story == nil then
				arg_87_1.var_.characterEffect1067ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1067ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1067ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1067ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1067ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.45

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_8 = arg_87_1:GetWordFromCfg(114111022)
				local var_90_9 = arg_87_1:FormatText(var_90_8.content)

				arg_87_1.text_.text = var_90_9

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_10 = 18
				local var_90_11 = utf8.len(var_90_9)
				local var_90_12 = var_90_10 <= 0 and var_90_7 or var_90_7 * (var_90_11 / var_90_10)

				if var_90_12 > 0 and var_90_7 < var_90_12 then
					arg_87_1.talkMaxDuration = var_90_12

					if var_90_12 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_12 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_9
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_13 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_13 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_13

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_13 and arg_87_1.time_ < var_90_6 + var_90_13 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play114111023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 114111023
		arg_91_1.duration_ = 15.5

		local var_91_0 = {
			ja = 14.7,
			ko = 14.633,
			zh = 14.166,
			en = 15.5
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
				arg_91_0:Play114111024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067actionlink/1067action475")
			end

			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_94_2 = arg_91_1.actors_["1067ui_story"]
			local var_94_3 = 0

			if var_94_3 < arg_91_1.time_ and arg_91_1.time_ <= var_94_3 + arg_94_0 and arg_91_1.var_.characterEffect1067ui_story == nil then
				arg_91_1.var_.characterEffect1067ui_story = var_94_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_4 = 0.2

			if var_94_3 <= arg_91_1.time_ and arg_91_1.time_ < var_94_3 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_3) / var_94_4

				if arg_91_1.var_.characterEffect1067ui_story then
					arg_91_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_3 + var_94_4 and arg_91_1.time_ < var_94_3 + var_94_4 + arg_94_0 and arg_91_1.var_.characterEffect1067ui_story then
				arg_91_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_94_6 = 0
			local var_94_7 = 1.475

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[206].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(114111023)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 59
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111023", "story_v_out_114111.awb") ~= 0 then
					local var_94_14 = manager.audio:GetVoiceLength("story_v_out_114111", "114111023", "story_v_out_114111.awb") / 1000

					if var_94_14 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_14 + var_94_6
					end

					if var_94_9.prefab_name ~= "" and arg_91_1.actors_[var_94_9.prefab_name] ~= nil then
						local var_94_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_9.prefab_name].transform, "story_v_out_114111", "114111023", "story_v_out_114111.awb")

						arg_91_1:RecordAudio("114111023", var_94_15)
						arg_91_1:RecordAudio("114111023", var_94_15)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_114111", "114111023", "story_v_out_114111.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_114111", "114111023", "story_v_out_114111.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_16 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_16 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_16

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_16 and arg_91_1.time_ < var_94_6 + var_94_16 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play114111024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 114111024
		arg_95_1.duration_ = 14.066

		local var_95_0 = {
			ja = 11.3,
			ko = 14.066,
			zh = 12.633,
			en = 12.6
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
				arg_95_0:Play114111025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067actionlink/1067action457")
			end

			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_98_2 = 0
			local var_98_3 = 1.3

			if var_98_2 < arg_95_1.time_ and arg_95_1.time_ <= var_98_2 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_4 = arg_95_1:FormatText(StoryNameCfg[206].name)

				arg_95_1.leftNameTxt_.text = var_98_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_5 = arg_95_1:GetWordFromCfg(114111024)
				local var_98_6 = arg_95_1:FormatText(var_98_5.content)

				arg_95_1.text_.text = var_98_6

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_7 = 52
				local var_98_8 = utf8.len(var_98_6)
				local var_98_9 = var_98_7 <= 0 and var_98_3 or var_98_3 * (var_98_8 / var_98_7)

				if var_98_9 > 0 and var_98_3 < var_98_9 then
					arg_95_1.talkMaxDuration = var_98_9

					if var_98_9 + var_98_2 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_9 + var_98_2
					end
				end

				arg_95_1.text_.text = var_98_6
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111024", "story_v_out_114111.awb") ~= 0 then
					local var_98_10 = manager.audio:GetVoiceLength("story_v_out_114111", "114111024", "story_v_out_114111.awb") / 1000

					if var_98_10 + var_98_2 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_10 + var_98_2
					end

					if var_98_5.prefab_name ~= "" and arg_95_1.actors_[var_98_5.prefab_name] ~= nil then
						local var_98_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_5.prefab_name].transform, "story_v_out_114111", "114111024", "story_v_out_114111.awb")

						arg_95_1:RecordAudio("114111024", var_98_11)
						arg_95_1:RecordAudio("114111024", var_98_11)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_114111", "114111024", "story_v_out_114111.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_114111", "114111024", "story_v_out_114111.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_12 = math.max(var_98_3, arg_95_1.talkMaxDuration)

			if var_98_2 <= arg_95_1.time_ and arg_95_1.time_ < var_98_2 + var_98_12 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_2) / var_98_12

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_2 + var_98_12 and arg_95_1.time_ < var_98_2 + var_98_12 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play114111025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 114111025
		arg_99_1.duration_ = 12.233

		local var_99_0 = {
			ja = 12.233,
			ko = 8.933,
			zh = 9.966,
			en = 11.333
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
				arg_99_0:Play114111026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1067ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1067ui_story == nil then
				arg_99_1.var_.characterEffect1067ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1067ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1067ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1067ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1067ui_story.fillRatio = var_102_5
			end

			local var_102_6 = 0

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_102_7 = arg_99_1.actors_["1042ui_story"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect1042ui_story == nil then
				arg_99_1.var_.characterEffect1042ui_story = var_102_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_9 = 0.2

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.characterEffect1042ui_story then
					arg_99_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.characterEffect1042ui_story then
				arg_99_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_102_12 = 0
			local var_102_13 = 0.975

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[205].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(114111025)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 39
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111025", "story_v_out_114111.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111025", "story_v_out_114111.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_114111", "114111025", "story_v_out_114111.awb")

						arg_99_1:RecordAudio("114111025", var_102_21)
						arg_99_1:RecordAudio("114111025", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_114111", "114111025", "story_v_out_114111.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_114111", "114111025", "story_v_out_114111.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play114111026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 114111026
		arg_103_1.duration_ = 12.633

		local var_103_0 = {
			ja = 12.5,
			ko = 9.133,
			zh = 8.966,
			en = 12.633
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
				arg_103_0:Play114111027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_106_1 = 0
			local var_106_2 = 1.025

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_3 = arg_103_1:FormatText(StoryNameCfg[205].name)

				arg_103_1.leftNameTxt_.text = var_106_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_4 = arg_103_1:GetWordFromCfg(114111026)
				local var_106_5 = arg_103_1:FormatText(var_106_4.content)

				arg_103_1.text_.text = var_106_5

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_6 = 41
				local var_106_7 = utf8.len(var_106_5)
				local var_106_8 = var_106_6 <= 0 and var_106_2 or var_106_2 * (var_106_7 / var_106_6)

				if var_106_8 > 0 and var_106_2 < var_106_8 then
					arg_103_1.talkMaxDuration = var_106_8

					if var_106_8 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_1
					end
				end

				arg_103_1.text_.text = var_106_5
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111026", "story_v_out_114111.awb") ~= 0 then
					local var_106_9 = manager.audio:GetVoiceLength("story_v_out_114111", "114111026", "story_v_out_114111.awb") / 1000

					if var_106_9 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_9 + var_106_1
					end

					if var_106_4.prefab_name ~= "" and arg_103_1.actors_[var_106_4.prefab_name] ~= nil then
						local var_106_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_4.prefab_name].transform, "story_v_out_114111", "114111026", "story_v_out_114111.awb")

						arg_103_1:RecordAudio("114111026", var_106_10)
						arg_103_1:RecordAudio("114111026", var_106_10)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_114111", "114111026", "story_v_out_114111.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_114111", "114111026", "story_v_out_114111.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_11 = math.max(var_106_2, arg_103_1.talkMaxDuration)

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_11 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_1) / var_106_11

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_1 + var_106_11 and arg_103_1.time_ < var_106_1 + var_106_11 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play114111027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 114111027
		arg_107_1.duration_ = 4.2

		local var_107_0 = {
			ja = 4.2,
			ko = 2.7,
			zh = 3.2,
			en = 3.2
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
				arg_107_0:Play114111028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_110_1 = arg_107_1.actors_["1067ui_story"]
			local var_110_2 = 0

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1067ui_story == nil then
				arg_107_1.var_.characterEffect1067ui_story = var_110_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_3 = 0.2

			if var_110_2 <= arg_107_1.time_ and arg_107_1.time_ < var_110_2 + var_110_3 then
				local var_110_4 = (arg_107_1.time_ - var_110_2) / var_110_3

				if arg_107_1.var_.characterEffect1067ui_story then
					arg_107_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_2 + var_110_3 and arg_107_1.time_ < var_110_2 + var_110_3 + arg_110_0 and arg_107_1.var_.characterEffect1067ui_story then
				arg_107_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_110_5 = arg_107_1.actors_["1042ui_story"]
			local var_110_6 = 0

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect1042ui_story == nil then
				arg_107_1.var_.characterEffect1042ui_story = var_110_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_7 = 0.2

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_7 then
				local var_110_8 = (arg_107_1.time_ - var_110_6) / var_110_7

				if arg_107_1.var_.characterEffect1042ui_story then
					local var_110_9 = Mathf.Lerp(0, 0.5, var_110_8)

					arg_107_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1042ui_story.fillRatio = var_110_9
				end
			end

			if arg_107_1.time_ >= var_110_6 + var_110_7 and arg_107_1.time_ < var_110_6 + var_110_7 + arg_110_0 and arg_107_1.var_.characterEffect1042ui_story then
				local var_110_10 = 0.5

				arg_107_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1042ui_story.fillRatio = var_110_10
			end

			local var_110_11 = 0
			local var_110_12 = 0.3

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_13 = arg_107_1:FormatText(StoryNameCfg[206].name)

				arg_107_1.leftNameTxt_.text = var_110_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_14 = arg_107_1:GetWordFromCfg(114111027)
				local var_110_15 = arg_107_1:FormatText(var_110_14.content)

				arg_107_1.text_.text = var_110_15

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_16 = 12
				local var_110_17 = utf8.len(var_110_15)
				local var_110_18 = var_110_16 <= 0 and var_110_12 or var_110_12 * (var_110_17 / var_110_16)

				if var_110_18 > 0 and var_110_12 < var_110_18 then
					arg_107_1.talkMaxDuration = var_110_18

					if var_110_18 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_18 + var_110_11
					end
				end

				arg_107_1.text_.text = var_110_15
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111027", "story_v_out_114111.awb") ~= 0 then
					local var_110_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111027", "story_v_out_114111.awb") / 1000

					if var_110_19 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_11
					end

					if var_110_14.prefab_name ~= "" and arg_107_1.actors_[var_110_14.prefab_name] ~= nil then
						local var_110_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_14.prefab_name].transform, "story_v_out_114111", "114111027", "story_v_out_114111.awb")

						arg_107_1:RecordAudio("114111027", var_110_20)
						arg_107_1:RecordAudio("114111027", var_110_20)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_114111", "114111027", "story_v_out_114111.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_114111", "114111027", "story_v_out_114111.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_21 = math.max(var_110_12, arg_107_1.talkMaxDuration)

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_21 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_11) / var_110_21

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_11 + var_110_21 and arg_107_1.time_ < var_110_11 + var_110_21 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play114111028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 114111028
		arg_111_1.duration_ = 7.4

		local var_111_0 = {
			ja = 5.4,
			ko = 7.4,
			zh = 6.8,
			en = 6.733
		}
		local var_111_1 = manager.audio:GetLocalizationFlag()

		if var_111_0[var_111_1] ~= nil then
			arg_111_1.duration_ = var_111_0[var_111_1]
		end

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play114111029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1067ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1067ui_story == nil then
				arg_111_1.var_.characterEffect1067ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1067ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1067ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1067ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1067ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 then
				arg_111_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_114_8 = arg_111_1.actors_["1042ui_story"]
			local var_114_9 = 0

			if var_114_9 < arg_111_1.time_ and arg_111_1.time_ <= var_114_9 + arg_114_0 and arg_111_1.var_.characterEffect1042ui_story == nil then
				arg_111_1.var_.characterEffect1042ui_story = var_114_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_10 = 0.2

			if var_114_9 <= arg_111_1.time_ and arg_111_1.time_ < var_114_9 + var_114_10 then
				local var_114_11 = (arg_111_1.time_ - var_114_9) / var_114_10

				if arg_111_1.var_.characterEffect1042ui_story then
					arg_111_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_9 + var_114_10 and arg_111_1.time_ < var_114_9 + var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1042ui_story then
				arg_111_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_114_12 = 0
			local var_114_13 = 0.675

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_14 = arg_111_1:FormatText(StoryNameCfg[205].name)

				arg_111_1.leftNameTxt_.text = var_114_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_15 = arg_111_1:GetWordFromCfg(114111028)
				local var_114_16 = arg_111_1:FormatText(var_114_15.content)

				arg_111_1.text_.text = var_114_16

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_17 = 27
				local var_114_18 = utf8.len(var_114_16)
				local var_114_19 = var_114_17 <= 0 and var_114_13 or var_114_13 * (var_114_18 / var_114_17)

				if var_114_19 > 0 and var_114_13 < var_114_19 then
					arg_111_1.talkMaxDuration = var_114_19

					if var_114_19 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_19 + var_114_12
					end
				end

				arg_111_1.text_.text = var_114_16
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111028", "story_v_out_114111.awb") ~= 0 then
					local var_114_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111028", "story_v_out_114111.awb") / 1000

					if var_114_20 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_12
					end

					if var_114_15.prefab_name ~= "" and arg_111_1.actors_[var_114_15.prefab_name] ~= nil then
						local var_114_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_15.prefab_name].transform, "story_v_out_114111", "114111028", "story_v_out_114111.awb")

						arg_111_1:RecordAudio("114111028", var_114_21)
						arg_111_1:RecordAudio("114111028", var_114_21)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_114111", "114111028", "story_v_out_114111.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_114111", "114111028", "story_v_out_114111.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_22 = math.max(var_114_13, arg_111_1.talkMaxDuration)

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_22 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_12) / var_114_22

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_12 + var_114_22 and arg_111_1.time_ < var_114_12 + var_114_22 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play114111029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 114111029
		arg_115_1.duration_ = 11

		local var_115_0 = {
			ja = 11,
			ko = 9.3,
			zh = 8.7,
			en = 11
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
				arg_115_0:Play114111030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_118_1 = 0
			local var_118_2 = 1.05

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_3 = arg_115_1:FormatText(StoryNameCfg[205].name)

				arg_115_1.leftNameTxt_.text = var_118_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_4 = arg_115_1:GetWordFromCfg(114111029)
				local var_118_5 = arg_115_1:FormatText(var_118_4.content)

				arg_115_1.text_.text = var_118_5

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_6 = 42
				local var_118_7 = utf8.len(var_118_5)
				local var_118_8 = var_118_6 <= 0 and var_118_2 or var_118_2 * (var_118_7 / var_118_6)

				if var_118_8 > 0 and var_118_2 < var_118_8 then
					arg_115_1.talkMaxDuration = var_118_8

					if var_118_8 + var_118_1 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_1
					end
				end

				arg_115_1.text_.text = var_118_5
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111029", "story_v_out_114111.awb") ~= 0 then
					local var_118_9 = manager.audio:GetVoiceLength("story_v_out_114111", "114111029", "story_v_out_114111.awb") / 1000

					if var_118_9 + var_118_1 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_9 + var_118_1
					end

					if var_118_4.prefab_name ~= "" and arg_115_1.actors_[var_118_4.prefab_name] ~= nil then
						local var_118_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_4.prefab_name].transform, "story_v_out_114111", "114111029", "story_v_out_114111.awb")

						arg_115_1:RecordAudio("114111029", var_118_10)
						arg_115_1:RecordAudio("114111029", var_118_10)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_114111", "114111029", "story_v_out_114111.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_114111", "114111029", "story_v_out_114111.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_11 = math.max(var_118_2, arg_115_1.talkMaxDuration)

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_11 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_1) / var_118_11

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_1 + var_118_11 and arg_115_1.time_ < var_118_1 + var_118_11 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play114111030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 114111030
		arg_119_1.duration_ = 6

		local var_119_0 = {
			ja = 5.933,
			ko = 4.733,
			zh = 6,
			en = 5.7
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
				arg_119_0:Play114111031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_122_1 = arg_119_1.actors_["1067ui_story"]
			local var_122_2 = 0

			if var_122_2 < arg_119_1.time_ and arg_119_1.time_ <= var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1067ui_story == nil then
				arg_119_1.var_.characterEffect1067ui_story = var_122_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_3 = 0.2

			if var_122_2 <= arg_119_1.time_ and arg_119_1.time_ < var_122_2 + var_122_3 then
				local var_122_4 = (arg_119_1.time_ - var_122_2) / var_122_3

				if arg_119_1.var_.characterEffect1067ui_story then
					arg_119_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_2 + var_122_3 and arg_119_1.time_ < var_122_2 + var_122_3 + arg_122_0 and arg_119_1.var_.characterEffect1067ui_story then
				arg_119_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_122_5 = arg_119_1.actors_["1042ui_story"]
			local var_122_6 = 0

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect1042ui_story == nil then
				arg_119_1.var_.characterEffect1042ui_story = var_122_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_7 = 0.2

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_7 then
				local var_122_8 = (arg_119_1.time_ - var_122_6) / var_122_7

				if arg_119_1.var_.characterEffect1042ui_story then
					local var_122_9 = Mathf.Lerp(0, 0.5, var_122_8)

					arg_119_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1042ui_story.fillRatio = var_122_9
				end
			end

			if arg_119_1.time_ >= var_122_6 + var_122_7 and arg_119_1.time_ < var_122_6 + var_122_7 + arg_122_0 and arg_119_1.var_.characterEffect1042ui_story then
				local var_122_10 = 0.5

				arg_119_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1042ui_story.fillRatio = var_122_10
			end

			local var_122_11 = 0
			local var_122_12 = 0.65

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_13 = arg_119_1:FormatText(StoryNameCfg[206].name)

				arg_119_1.leftNameTxt_.text = var_122_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_14 = arg_119_1:GetWordFromCfg(114111030)
				local var_122_15 = arg_119_1:FormatText(var_122_14.content)

				arg_119_1.text_.text = var_122_15

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_16 = 26
				local var_122_17 = utf8.len(var_122_15)
				local var_122_18 = var_122_16 <= 0 and var_122_12 or var_122_12 * (var_122_17 / var_122_16)

				if var_122_18 > 0 and var_122_12 < var_122_18 then
					arg_119_1.talkMaxDuration = var_122_18

					if var_122_18 + var_122_11 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_11
					end
				end

				arg_119_1.text_.text = var_122_15
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111030", "story_v_out_114111.awb") ~= 0 then
					local var_122_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111030", "story_v_out_114111.awb") / 1000

					if var_122_19 + var_122_11 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_19 + var_122_11
					end

					if var_122_14.prefab_name ~= "" and arg_119_1.actors_[var_122_14.prefab_name] ~= nil then
						local var_122_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_14.prefab_name].transform, "story_v_out_114111", "114111030", "story_v_out_114111.awb")

						arg_119_1:RecordAudio("114111030", var_122_20)
						arg_119_1:RecordAudio("114111030", var_122_20)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_114111", "114111030", "story_v_out_114111.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_114111", "114111030", "story_v_out_114111.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_21 = math.max(var_122_12, arg_119_1.talkMaxDuration)

			if var_122_11 <= arg_119_1.time_ and arg_119_1.time_ < var_122_11 + var_122_21 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_11) / var_122_21

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_11 + var_122_21 and arg_119_1.time_ < var_122_11 + var_122_21 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play114111031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 114111031
		arg_123_1.duration_ = 11.266

		local var_123_0 = {
			ja = 11.266,
			ko = 10.5,
			zh = 7.8,
			en = 9.866
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
				arg_123_0:Play114111032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1042ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1042ui_story == nil then
				arg_123_1.var_.characterEffect1042ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1042ui_story then
					arg_123_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1042ui_story then
				arg_123_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_126_4 = arg_123_1.actors_["1067ui_story"]
			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 and arg_123_1.var_.characterEffect1067ui_story == nil then
				arg_123_1.var_.characterEffect1067ui_story = var_126_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_6 = 0.2

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6

				if arg_123_1.var_.characterEffect1067ui_story then
					local var_126_8 = Mathf.Lerp(0, 0.5, var_126_7)

					arg_123_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1067ui_story.fillRatio = var_126_8
				end
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 and arg_123_1.var_.characterEffect1067ui_story then
				local var_126_9 = 0.5

				arg_123_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1067ui_story.fillRatio = var_126_9
			end

			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action8_1")
			end

			local var_126_12 = 0
			local var_126_13 = 0.9

			if var_126_12 < arg_123_1.time_ and arg_123_1.time_ <= var_126_12 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_14 = arg_123_1:FormatText(StoryNameCfg[205].name)

				arg_123_1.leftNameTxt_.text = var_126_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_15 = arg_123_1:GetWordFromCfg(114111031)
				local var_126_16 = arg_123_1:FormatText(var_126_15.content)

				arg_123_1.text_.text = var_126_16

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_17 = 36
				local var_126_18 = utf8.len(var_126_16)
				local var_126_19 = var_126_17 <= 0 and var_126_13 or var_126_13 * (var_126_18 / var_126_17)

				if var_126_19 > 0 and var_126_13 < var_126_19 then
					arg_123_1.talkMaxDuration = var_126_19

					if var_126_19 + var_126_12 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_12
					end
				end

				arg_123_1.text_.text = var_126_16
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111031", "story_v_out_114111.awb") ~= 0 then
					local var_126_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111031", "story_v_out_114111.awb") / 1000

					if var_126_20 + var_126_12 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_20 + var_126_12
					end

					if var_126_15.prefab_name ~= "" and arg_123_1.actors_[var_126_15.prefab_name] ~= nil then
						local var_126_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_15.prefab_name].transform, "story_v_out_114111", "114111031", "story_v_out_114111.awb")

						arg_123_1:RecordAudio("114111031", var_126_21)
						arg_123_1:RecordAudio("114111031", var_126_21)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_114111", "114111031", "story_v_out_114111.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_114111", "114111031", "story_v_out_114111.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_22 = math.max(var_126_13, arg_123_1.talkMaxDuration)

			if var_126_12 <= arg_123_1.time_ and arg_123_1.time_ < var_126_12 + var_126_22 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_12) / var_126_22

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_12 + var_126_22 and arg_123_1.time_ < var_126_12 + var_126_22 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play114111032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 114111032
		arg_127_1.duration_ = 5.566

		local var_127_0 = {
			ja = 4.266,
			ko = 3.433,
			zh = 5.566,
			en = 3.766
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
				arg_127_0:Play114111033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_130_1 = arg_127_1.actors_["1067ui_story"]
			local var_130_2 = 0

			if var_130_2 < arg_127_1.time_ and arg_127_1.time_ <= var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1067ui_story == nil then
				arg_127_1.var_.characterEffect1067ui_story = var_130_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_3 = 0.2

			if var_130_2 <= arg_127_1.time_ and arg_127_1.time_ < var_130_2 + var_130_3 then
				local var_130_4 = (arg_127_1.time_ - var_130_2) / var_130_3

				if arg_127_1.var_.characterEffect1067ui_story then
					arg_127_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_2 + var_130_3 and arg_127_1.time_ < var_130_2 + var_130_3 + arg_130_0 and arg_127_1.var_.characterEffect1067ui_story then
				arg_127_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_130_5 = arg_127_1.actors_["1042ui_story"]
			local var_130_6 = 0

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1042ui_story == nil then
				arg_127_1.var_.characterEffect1042ui_story = var_130_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_7 = 0.2

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_7 then
				local var_130_8 = (arg_127_1.time_ - var_130_6) / var_130_7

				if arg_127_1.var_.characterEffect1042ui_story then
					local var_130_9 = Mathf.Lerp(0, 0.5, var_130_8)

					arg_127_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1042ui_story.fillRatio = var_130_9
				end
			end

			if arg_127_1.time_ >= var_130_6 + var_130_7 and arg_127_1.time_ < var_130_6 + var_130_7 + arg_130_0 and arg_127_1.var_.characterEffect1042ui_story then
				local var_130_10 = 0.5

				arg_127_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1042ui_story.fillRatio = var_130_10
			end

			local var_130_11 = 0
			local var_130_12 = 0.45

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_13 = arg_127_1:FormatText(StoryNameCfg[206].name)

				arg_127_1.leftNameTxt_.text = var_130_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_14 = arg_127_1:GetWordFromCfg(114111032)
				local var_130_15 = arg_127_1:FormatText(var_130_14.content)

				arg_127_1.text_.text = var_130_15

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_16 = 18
				local var_130_17 = utf8.len(var_130_15)
				local var_130_18 = var_130_16 <= 0 and var_130_12 or var_130_12 * (var_130_17 / var_130_16)

				if var_130_18 > 0 and var_130_12 < var_130_18 then
					arg_127_1.talkMaxDuration = var_130_18

					if var_130_18 + var_130_11 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_11
					end
				end

				arg_127_1.text_.text = var_130_15
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111032", "story_v_out_114111.awb") ~= 0 then
					local var_130_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111032", "story_v_out_114111.awb") / 1000

					if var_130_19 + var_130_11 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_19 + var_130_11
					end

					if var_130_14.prefab_name ~= "" and arg_127_1.actors_[var_130_14.prefab_name] ~= nil then
						local var_130_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_14.prefab_name].transform, "story_v_out_114111", "114111032", "story_v_out_114111.awb")

						arg_127_1:RecordAudio("114111032", var_130_20)
						arg_127_1:RecordAudio("114111032", var_130_20)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_114111", "114111032", "story_v_out_114111.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_114111", "114111032", "story_v_out_114111.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_21 = math.max(var_130_12, arg_127_1.talkMaxDuration)

			if var_130_11 <= arg_127_1.time_ and arg_127_1.time_ < var_130_11 + var_130_21 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_11) / var_130_21

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_11 + var_130_21 and arg_127_1.time_ < var_130_11 + var_130_21 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play114111033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 114111033
		arg_131_1.duration_ = 7.6

		local var_131_0 = {
			ja = 7.366,
			ko = 4.533,
			zh = 5.766,
			en = 7.6
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
				arg_131_0:Play114111034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1067ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1067ui_story == nil then
				arg_131_1.var_.characterEffect1067ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1067ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1067ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1067ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1067ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 then
				arg_131_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action8_2")
			end

			local var_134_8 = arg_131_1.actors_["1042ui_story"]
			local var_134_9 = 0

			if var_134_9 < arg_131_1.time_ and arg_131_1.time_ <= var_134_9 + arg_134_0 and arg_131_1.var_.characterEffect1042ui_story == nil then
				arg_131_1.var_.characterEffect1042ui_story = var_134_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_10 = 0.2

			if var_134_9 <= arg_131_1.time_ and arg_131_1.time_ < var_134_9 + var_134_10 then
				local var_134_11 = (arg_131_1.time_ - var_134_9) / var_134_10

				if arg_131_1.var_.characterEffect1042ui_story then
					arg_131_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_9 + var_134_10 and arg_131_1.time_ < var_134_9 + var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect1042ui_story then
				arg_131_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_134_12 = 0
			local var_134_13 = 0.65

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_14 = arg_131_1:FormatText(StoryNameCfg[205].name)

				arg_131_1.leftNameTxt_.text = var_134_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_15 = arg_131_1:GetWordFromCfg(114111033)
				local var_134_16 = arg_131_1:FormatText(var_134_15.content)

				arg_131_1.text_.text = var_134_16

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_17 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111033", "story_v_out_114111.awb") ~= 0 then
					local var_134_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111033", "story_v_out_114111.awb") / 1000

					if var_134_20 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_20 + var_134_12
					end

					if var_134_15.prefab_name ~= "" and arg_131_1.actors_[var_134_15.prefab_name] ~= nil then
						local var_134_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_15.prefab_name].transform, "story_v_out_114111", "114111033", "story_v_out_114111.awb")

						arg_131_1:RecordAudio("114111033", var_134_21)
						arg_131_1:RecordAudio("114111033", var_134_21)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_114111", "114111033", "story_v_out_114111.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_114111", "114111033", "story_v_out_114111.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_22 = math.max(var_134_13, arg_131_1.talkMaxDuration)

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_22 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_12) / var_134_22

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_12 + var_134_22 and arg_131_1.time_ < var_134_12 + var_134_22 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play114111034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 114111034
		arg_135_1.duration_ = 5.2

		local var_135_0 = {
			ja = 5.2,
			ko = 3.566,
			zh = 3.2,
			en = 3.333
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
				arg_135_0:Play114111035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_138_1 = arg_135_1.actors_["1067ui_story"]
			local var_138_2 = 0

			if var_138_2 < arg_135_1.time_ and arg_135_1.time_ <= var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1067ui_story == nil then
				arg_135_1.var_.characterEffect1067ui_story = var_138_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_3 = 0.2

			if var_138_2 <= arg_135_1.time_ and arg_135_1.time_ < var_138_2 + var_138_3 then
				local var_138_4 = (arg_135_1.time_ - var_138_2) / var_138_3

				if arg_135_1.var_.characterEffect1067ui_story then
					arg_135_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_2 + var_138_3 and arg_135_1.time_ < var_138_2 + var_138_3 + arg_138_0 and arg_135_1.var_.characterEffect1067ui_story then
				arg_135_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_138_5 = arg_135_1.actors_["1042ui_story"]
			local var_138_6 = 0

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1042ui_story == nil then
				arg_135_1.var_.characterEffect1042ui_story = var_138_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_7 = 0.2

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_7 then
				local var_138_8 = (arg_135_1.time_ - var_138_6) / var_138_7

				if arg_135_1.var_.characterEffect1042ui_story then
					local var_138_9 = Mathf.Lerp(0, 0.5, var_138_8)

					arg_135_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1042ui_story.fillRatio = var_138_9
				end
			end

			if arg_135_1.time_ >= var_138_6 + var_138_7 and arg_135_1.time_ < var_138_6 + var_138_7 + arg_138_0 and arg_135_1.var_.characterEffect1042ui_story then
				local var_138_10 = 0.5

				arg_135_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1042ui_story.fillRatio = var_138_10
			end

			local var_138_11 = 0
			local var_138_12 = 0.325

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_13 = arg_135_1:FormatText(StoryNameCfg[206].name)

				arg_135_1.leftNameTxt_.text = var_138_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_14 = arg_135_1:GetWordFromCfg(114111034)
				local var_138_15 = arg_135_1:FormatText(var_138_14.content)

				arg_135_1.text_.text = var_138_15

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_16 = 13
				local var_138_17 = utf8.len(var_138_15)
				local var_138_18 = var_138_16 <= 0 and var_138_12 or var_138_12 * (var_138_17 / var_138_16)

				if var_138_18 > 0 and var_138_12 < var_138_18 then
					arg_135_1.talkMaxDuration = var_138_18

					if var_138_18 + var_138_11 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_18 + var_138_11
					end
				end

				arg_135_1.text_.text = var_138_15
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111034", "story_v_out_114111.awb") ~= 0 then
					local var_138_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111034", "story_v_out_114111.awb") / 1000

					if var_138_19 + var_138_11 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_11
					end

					if var_138_14.prefab_name ~= "" and arg_135_1.actors_[var_138_14.prefab_name] ~= nil then
						local var_138_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_14.prefab_name].transform, "story_v_out_114111", "114111034", "story_v_out_114111.awb")

						arg_135_1:RecordAudio("114111034", var_138_20)
						arg_135_1:RecordAudio("114111034", var_138_20)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_114111", "114111034", "story_v_out_114111.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_114111", "114111034", "story_v_out_114111.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_21 = math.max(var_138_12, arg_135_1.talkMaxDuration)

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_21 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_11) / var_138_21

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_11 + var_138_21 and arg_135_1.time_ < var_138_11 + var_138_21 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play114111035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 114111035
		arg_139_1.duration_ = 8.5

		local var_139_0 = {
			ja = 8.5,
			ko = 4.366,
			zh = 6.7,
			en = 7.433
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
				arg_139_0:Play114111036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_142_2 = arg_139_1.actors_["1042ui_story"]
			local var_142_3 = 0

			if var_142_3 < arg_139_1.time_ and arg_139_1.time_ <= var_142_3 + arg_142_0 and arg_139_1.var_.characterEffect1042ui_story == nil then
				arg_139_1.var_.characterEffect1042ui_story = var_142_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_4 = 0.2

			if var_142_3 <= arg_139_1.time_ and arg_139_1.time_ < var_142_3 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_3) / var_142_4

				if arg_139_1.var_.characterEffect1042ui_story then
					arg_139_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_3 + var_142_4 and arg_139_1.time_ < var_142_3 + var_142_4 + arg_142_0 and arg_139_1.var_.characterEffect1042ui_story then
				arg_139_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_142_6 = arg_139_1.actors_["1067ui_story"]
			local var_142_7 = 0

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 and arg_139_1.var_.characterEffect1067ui_story == nil then
				arg_139_1.var_.characterEffect1067ui_story = var_142_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_8 = 0.2

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_8 then
				local var_142_9 = (arg_139_1.time_ - var_142_7) / var_142_8

				if arg_139_1.var_.characterEffect1067ui_story then
					local var_142_10 = Mathf.Lerp(0, 0.5, var_142_9)

					arg_139_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1067ui_story.fillRatio = var_142_10
				end
			end

			if arg_139_1.time_ >= var_142_7 + var_142_8 and arg_139_1.time_ < var_142_7 + var_142_8 + arg_142_0 and arg_139_1.var_.characterEffect1067ui_story then
				local var_142_11 = 0.5

				arg_139_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1067ui_story.fillRatio = var_142_11
			end

			local var_142_12 = 0
			local var_142_13 = 0.55

			if var_142_12 < arg_139_1.time_ and arg_139_1.time_ <= var_142_12 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_14 = arg_139_1:FormatText(StoryNameCfg[205].name)

				arg_139_1.leftNameTxt_.text = var_142_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_15 = arg_139_1:GetWordFromCfg(114111035)
				local var_142_16 = arg_139_1:FormatText(var_142_15.content)

				arg_139_1.text_.text = var_142_16

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_17 = 22
				local var_142_18 = utf8.len(var_142_16)
				local var_142_19 = var_142_17 <= 0 and var_142_13 or var_142_13 * (var_142_18 / var_142_17)

				if var_142_19 > 0 and var_142_13 < var_142_19 then
					arg_139_1.talkMaxDuration = var_142_19

					if var_142_19 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_12
					end
				end

				arg_139_1.text_.text = var_142_16
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111035", "story_v_out_114111.awb") ~= 0 then
					local var_142_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111035", "story_v_out_114111.awb") / 1000

					if var_142_20 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_20 + var_142_12
					end

					if var_142_15.prefab_name ~= "" and arg_139_1.actors_[var_142_15.prefab_name] ~= nil then
						local var_142_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_15.prefab_name].transform, "story_v_out_114111", "114111035", "story_v_out_114111.awb")

						arg_139_1:RecordAudio("114111035", var_142_21)
						arg_139_1:RecordAudio("114111035", var_142_21)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_114111", "114111035", "story_v_out_114111.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_114111", "114111035", "story_v_out_114111.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_22 = math.max(var_142_13, arg_139_1.talkMaxDuration)

			if var_142_12 <= arg_139_1.time_ and arg_139_1.time_ < var_142_12 + var_142_22 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_12) / var_142_22

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_12 + var_142_22 and arg_139_1.time_ < var_142_12 + var_142_22 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play114111036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 114111036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play114111037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1067ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1067ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, 100, 0)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1067ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, 100, 0)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["1042ui_story"].transform
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1.var_.moveOldPos1042ui_story = var_146_9.localPosition
			end

			local var_146_11 = 0.001

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11
				local var_146_13 = Vector3.New(0, 100, 0)

				var_146_9.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1042ui_story, var_146_13, var_146_12)

				local var_146_14 = manager.ui.mainCamera.transform.position - var_146_9.position

				var_146_9.forward = Vector3.New(var_146_14.x, var_146_14.y, var_146_14.z)

				local var_146_15 = var_146_9.localEulerAngles

				var_146_15.z = 0
				var_146_15.x = 0
				var_146_9.localEulerAngles = var_146_15
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 then
				var_146_9.localPosition = Vector3.New(0, 100, 0)

				local var_146_16 = manager.ui.mainCamera.transform.position - var_146_9.position

				var_146_9.forward = Vector3.New(var_146_16.x, var_146_16.y, var_146_16.z)

				local var_146_17 = var_146_9.localEulerAngles

				var_146_17.z = 0
				var_146_17.x = 0
				var_146_9.localEulerAngles = var_146_17
			end

			local var_146_18 = 0
			local var_146_19 = 1.075

			if var_146_18 < arg_143_1.time_ and arg_143_1.time_ <= var_146_18 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_20 = arg_143_1:GetWordFromCfg(114111036)
				local var_146_21 = arg_143_1:FormatText(var_146_20.content)

				arg_143_1.text_.text = var_146_21

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_22 = 43
				local var_146_23 = utf8.len(var_146_21)
				local var_146_24 = var_146_22 <= 0 and var_146_19 or var_146_19 * (var_146_23 / var_146_22)

				if var_146_24 > 0 and var_146_19 < var_146_24 then
					arg_143_1.talkMaxDuration = var_146_24

					if var_146_24 + var_146_18 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_24 + var_146_18
					end
				end

				arg_143_1.text_.text = var_146_21
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_25 = math.max(var_146_19, arg_143_1.talkMaxDuration)

			if var_146_18 <= arg_143_1.time_ and arg_143_1.time_ < var_146_18 + var_146_25 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_18) / var_146_25

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_18 + var_146_25 and arg_143_1.time_ < var_146_18 + var_146_25 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play114111037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 114111037
		arg_147_1.duration_ = 15.166

		local var_147_0 = {
			ja = 13.333,
			ko = 11.933,
			zh = 13.566,
			en = 15.166
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
				arg_147_0:Play114111038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1067ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1067ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1067ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = 0

			if var_150_9 < arg_147_1.time_ and arg_147_1.time_ <= var_150_9 + arg_150_0 then
				arg_147_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_1")
			end

			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_150_11 = arg_147_1.actors_["1067ui_story"]
			local var_150_12 = 0

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 and arg_147_1.var_.characterEffect1067ui_story == nil then
				arg_147_1.var_.characterEffect1067ui_story = var_150_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_13 = 0.2

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_13 then
				local var_150_14 = (arg_147_1.time_ - var_150_12) / var_150_13

				if arg_147_1.var_.characterEffect1067ui_story then
					arg_147_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_12 + var_150_13 and arg_147_1.time_ < var_150_12 + var_150_13 + arg_150_0 and arg_147_1.var_.characterEffect1067ui_story then
				arg_147_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_150_15 = arg_147_1.actors_["1042ui_story"].transform
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 then
				arg_147_1.var_.moveOldPos1042ui_story = var_150_15.localPosition
			end

			local var_150_17 = 0.001

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17
				local var_150_19 = Vector3.New(0.7, -1.06, -6.2)

				var_150_15.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1042ui_story, var_150_19, var_150_18)

				local var_150_20 = manager.ui.mainCamera.transform.position - var_150_15.position

				var_150_15.forward = Vector3.New(var_150_20.x, var_150_20.y, var_150_20.z)

				local var_150_21 = var_150_15.localEulerAngles

				var_150_21.z = 0
				var_150_21.x = 0
				var_150_15.localEulerAngles = var_150_21
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 then
				var_150_15.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_150_22 = manager.ui.mainCamera.transform.position - var_150_15.position

				var_150_15.forward = Vector3.New(var_150_22.x, var_150_22.y, var_150_22.z)

				local var_150_23 = var_150_15.localEulerAngles

				var_150_23.z = 0
				var_150_23.x = 0
				var_150_15.localEulerAngles = var_150_23
			end

			local var_150_24 = 0

			if var_150_24 < arg_147_1.time_ and arg_147_1.time_ <= var_150_24 + arg_150_0 then
				arg_147_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_150_25 = arg_147_1.actors_["1042ui_story"]
			local var_150_26 = 0

			if var_150_26 < arg_147_1.time_ and arg_147_1.time_ <= var_150_26 + arg_150_0 and arg_147_1.var_.characterEffect1042ui_story == nil then
				arg_147_1.var_.characterEffect1042ui_story = var_150_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_27 = 0.2

			if var_150_26 <= arg_147_1.time_ and arg_147_1.time_ < var_150_26 + var_150_27 then
				local var_150_28 = (arg_147_1.time_ - var_150_26) / var_150_27

				if arg_147_1.var_.characterEffect1042ui_story then
					local var_150_29 = Mathf.Lerp(0, 0.5, var_150_28)

					arg_147_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1042ui_story.fillRatio = var_150_29
				end
			end

			if arg_147_1.time_ >= var_150_26 + var_150_27 and arg_147_1.time_ < var_150_26 + var_150_27 + arg_150_0 and arg_147_1.var_.characterEffect1042ui_story then
				local var_150_30 = 0.5

				arg_147_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1042ui_story.fillRatio = var_150_30
			end

			local var_150_31 = 0
			local var_150_32 = 1.325

			if var_150_31 < arg_147_1.time_ and arg_147_1.time_ <= var_150_31 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_33 = arg_147_1:FormatText(StoryNameCfg[206].name)

				arg_147_1.leftNameTxt_.text = var_150_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_34 = arg_147_1:GetWordFromCfg(114111037)
				local var_150_35 = arg_147_1:FormatText(var_150_34.content)

				arg_147_1.text_.text = var_150_35

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_36 = 53
				local var_150_37 = utf8.len(var_150_35)
				local var_150_38 = var_150_36 <= 0 and var_150_32 or var_150_32 * (var_150_37 / var_150_36)

				if var_150_38 > 0 and var_150_32 < var_150_38 then
					arg_147_1.talkMaxDuration = var_150_38

					if var_150_38 + var_150_31 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_38 + var_150_31
					end
				end

				arg_147_1.text_.text = var_150_35
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111037", "story_v_out_114111.awb") ~= 0 then
					local var_150_39 = manager.audio:GetVoiceLength("story_v_out_114111", "114111037", "story_v_out_114111.awb") / 1000

					if var_150_39 + var_150_31 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_39 + var_150_31
					end

					if var_150_34.prefab_name ~= "" and arg_147_1.actors_[var_150_34.prefab_name] ~= nil then
						local var_150_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_34.prefab_name].transform, "story_v_out_114111", "114111037", "story_v_out_114111.awb")

						arg_147_1:RecordAudio("114111037", var_150_40)
						arg_147_1:RecordAudio("114111037", var_150_40)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_114111", "114111037", "story_v_out_114111.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_114111", "114111037", "story_v_out_114111.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_41 = math.max(var_150_32, arg_147_1.talkMaxDuration)

			if var_150_31 <= arg_147_1.time_ and arg_147_1.time_ < var_150_31 + var_150_41 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_31) / var_150_41

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_31 + var_150_41 and arg_147_1.time_ < var_150_31 + var_150_41 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play114111038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 114111038
		arg_151_1.duration_ = 9.266

		local var_151_0 = {
			ja = 8.166,
			ko = 9.266,
			zh = 8.2,
			en = 6.7
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
				arg_151_0:Play114111039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action4_1")
			end

			local var_154_1 = arg_151_1.actors_["1042ui_story"]
			local var_154_2 = 0

			if var_154_2 < arg_151_1.time_ and arg_151_1.time_ <= var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1042ui_story == nil then
				arg_151_1.var_.characterEffect1042ui_story = var_154_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_3 = 0.2

			if var_154_2 <= arg_151_1.time_ and arg_151_1.time_ < var_154_2 + var_154_3 then
				local var_154_4 = (arg_151_1.time_ - var_154_2) / var_154_3

				if arg_151_1.var_.characterEffect1042ui_story then
					arg_151_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_2 + var_154_3 and arg_151_1.time_ < var_154_2 + var_154_3 + arg_154_0 and arg_151_1.var_.characterEffect1042ui_story then
				arg_151_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_154_5 = arg_151_1.actors_["1067ui_story"]
			local var_154_6 = 0

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1067ui_story == nil then
				arg_151_1.var_.characterEffect1067ui_story = var_154_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_7 = 0.2

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_7 then
				local var_154_8 = (arg_151_1.time_ - var_154_6) / var_154_7

				if arg_151_1.var_.characterEffect1067ui_story then
					local var_154_9 = Mathf.Lerp(0, 0.5, var_154_8)

					arg_151_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1067ui_story.fillRatio = var_154_9
				end
			end

			if arg_151_1.time_ >= var_154_6 + var_154_7 and arg_151_1.time_ < var_154_6 + var_154_7 + arg_154_0 and arg_151_1.var_.characterEffect1067ui_story then
				local var_154_10 = 0.5

				arg_151_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1067ui_story.fillRatio = var_154_10
			end

			local var_154_11 = 0

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_154_12 = 0
			local var_154_13 = 0.8

			if var_154_12 < arg_151_1.time_ and arg_151_1.time_ <= var_154_12 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_14 = arg_151_1:FormatText(StoryNameCfg[205].name)

				arg_151_1.leftNameTxt_.text = var_154_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_15 = arg_151_1:GetWordFromCfg(114111038)
				local var_154_16 = arg_151_1:FormatText(var_154_15.content)

				arg_151_1.text_.text = var_154_16

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_17 = 32
				local var_154_18 = utf8.len(var_154_16)
				local var_154_19 = var_154_17 <= 0 and var_154_13 or var_154_13 * (var_154_18 / var_154_17)

				if var_154_19 > 0 and var_154_13 < var_154_19 then
					arg_151_1.talkMaxDuration = var_154_19

					if var_154_19 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_12
					end
				end

				arg_151_1.text_.text = var_154_16
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111038", "story_v_out_114111.awb") ~= 0 then
					local var_154_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111038", "story_v_out_114111.awb") / 1000

					if var_154_20 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_20 + var_154_12
					end

					if var_154_15.prefab_name ~= "" and arg_151_1.actors_[var_154_15.prefab_name] ~= nil then
						local var_154_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_15.prefab_name].transform, "story_v_out_114111", "114111038", "story_v_out_114111.awb")

						arg_151_1:RecordAudio("114111038", var_154_21)
						arg_151_1:RecordAudio("114111038", var_154_21)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_114111", "114111038", "story_v_out_114111.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_114111", "114111038", "story_v_out_114111.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_22 = math.max(var_154_13, arg_151_1.talkMaxDuration)

			if var_154_12 <= arg_151_1.time_ and arg_151_1.time_ < var_154_12 + var_154_22 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_12) / var_154_22

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_12 + var_154_22 and arg_151_1.time_ < var_154_12 + var_154_22 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play114111039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 114111039
		arg_155_1.duration_ = 6.333

		local var_155_0 = {
			ja = 5.166,
			ko = 6.333,
			zh = 6.1,
			en = 6.3
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
				arg_155_0:Play114111040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action3_2")
			end

			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_158_2 = arg_155_1.actors_["1067ui_story"]
			local var_158_3 = 0

			if var_158_3 < arg_155_1.time_ and arg_155_1.time_ <= var_158_3 + arg_158_0 and arg_155_1.var_.characterEffect1067ui_story == nil then
				arg_155_1.var_.characterEffect1067ui_story = var_158_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_4 = 0.2

			if var_158_3 <= arg_155_1.time_ and arg_155_1.time_ < var_158_3 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_3) / var_158_4

				if arg_155_1.var_.characterEffect1067ui_story then
					arg_155_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_3 + var_158_4 and arg_155_1.time_ < var_158_3 + var_158_4 + arg_158_0 and arg_155_1.var_.characterEffect1067ui_story then
				arg_155_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_158_6 = arg_155_1.actors_["1042ui_story"]
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 and arg_155_1.var_.characterEffect1042ui_story == nil then
				arg_155_1.var_.characterEffect1042ui_story = var_158_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_8 = 0.2

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8

				if arg_155_1.var_.characterEffect1042ui_story then
					local var_158_10 = Mathf.Lerp(0, 0.5, var_158_9)

					arg_155_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1042ui_story.fillRatio = var_158_10
				end
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 and arg_155_1.var_.characterEffect1042ui_story then
				local var_158_11 = 0.5

				arg_155_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1042ui_story.fillRatio = var_158_11
			end

			local var_158_12 = 0
			local var_158_13 = 0.625

			if var_158_12 < arg_155_1.time_ and arg_155_1.time_ <= var_158_12 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_14 = arg_155_1:FormatText(StoryNameCfg[206].name)

				arg_155_1.leftNameTxt_.text = var_158_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_15 = arg_155_1:GetWordFromCfg(114111039)
				local var_158_16 = arg_155_1:FormatText(var_158_15.content)

				arg_155_1.text_.text = var_158_16

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_17 = 25
				local var_158_18 = utf8.len(var_158_16)
				local var_158_19 = var_158_17 <= 0 and var_158_13 or var_158_13 * (var_158_18 / var_158_17)

				if var_158_19 > 0 and var_158_13 < var_158_19 then
					arg_155_1.talkMaxDuration = var_158_19

					if var_158_19 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_12
					end
				end

				arg_155_1.text_.text = var_158_16
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111039", "story_v_out_114111.awb") ~= 0 then
					local var_158_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111039", "story_v_out_114111.awb") / 1000

					if var_158_20 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_12
					end

					if var_158_15.prefab_name ~= "" and arg_155_1.actors_[var_158_15.prefab_name] ~= nil then
						local var_158_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_15.prefab_name].transform, "story_v_out_114111", "114111039", "story_v_out_114111.awb")

						arg_155_1:RecordAudio("114111039", var_158_21)
						arg_155_1:RecordAudio("114111039", var_158_21)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_114111", "114111039", "story_v_out_114111.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_114111", "114111039", "story_v_out_114111.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_22 = math.max(var_158_13, arg_155_1.talkMaxDuration)

			if var_158_12 <= arg_155_1.time_ and arg_155_1.time_ < var_158_12 + var_158_22 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_12) / var_158_22

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_12 + var_158_22 and arg_155_1.time_ < var_158_12 + var_158_22 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play114111040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 114111040
		arg_159_1.duration_ = 10.466

		local var_159_0 = {
			ja = 4.233,
			ko = 10.466,
			zh = 7.5,
			en = 7.5
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
				arg_159_0:Play114111041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_162_1 = 0
			local var_162_2 = 0.825

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_3 = arg_159_1:FormatText(StoryNameCfg[206].name)

				arg_159_1.leftNameTxt_.text = var_162_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_4 = arg_159_1:GetWordFromCfg(114111040)
				local var_162_5 = arg_159_1:FormatText(var_162_4.content)

				arg_159_1.text_.text = var_162_5

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_6 = 33
				local var_162_7 = utf8.len(var_162_5)
				local var_162_8 = var_162_6 <= 0 and var_162_2 or var_162_2 * (var_162_7 / var_162_6)

				if var_162_8 > 0 and var_162_2 < var_162_8 then
					arg_159_1.talkMaxDuration = var_162_8

					if var_162_8 + var_162_1 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_1
					end
				end

				arg_159_1.text_.text = var_162_5
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111040", "story_v_out_114111.awb") ~= 0 then
					local var_162_9 = manager.audio:GetVoiceLength("story_v_out_114111", "114111040", "story_v_out_114111.awb") / 1000

					if var_162_9 + var_162_1 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_9 + var_162_1
					end

					if var_162_4.prefab_name ~= "" and arg_159_1.actors_[var_162_4.prefab_name] ~= nil then
						local var_162_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_4.prefab_name].transform, "story_v_out_114111", "114111040", "story_v_out_114111.awb")

						arg_159_1:RecordAudio("114111040", var_162_10)
						arg_159_1:RecordAudio("114111040", var_162_10)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_114111", "114111040", "story_v_out_114111.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_114111", "114111040", "story_v_out_114111.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_11 = math.max(var_162_2, arg_159_1.talkMaxDuration)

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_11 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_1) / var_162_11

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_1 + var_162_11 and arg_159_1.time_ < var_162_1 + var_162_11 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play114111041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 114111041
		arg_163_1.duration_ = 7.9

		local var_163_0 = {
			ja = 7.9,
			ko = 4.333,
			zh = 5.4,
			en = 6.033
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
				arg_163_0:Play114111042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042actionlink/1042action442")
			end

			local var_166_1 = arg_163_1.actors_["1042ui_story"]
			local var_166_2 = 0

			if var_166_2 < arg_163_1.time_ and arg_163_1.time_ <= var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1042ui_story == nil then
				arg_163_1.var_.characterEffect1042ui_story = var_166_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_3 = 0.2

			if var_166_2 <= arg_163_1.time_ and arg_163_1.time_ < var_166_2 + var_166_3 then
				local var_166_4 = (arg_163_1.time_ - var_166_2) / var_166_3

				if arg_163_1.var_.characterEffect1042ui_story then
					arg_163_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_2 + var_166_3 and arg_163_1.time_ < var_166_2 + var_166_3 + arg_166_0 and arg_163_1.var_.characterEffect1042ui_story then
				arg_163_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_166_5 = arg_163_1.actors_["1067ui_story"]
			local var_166_6 = 0

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 and arg_163_1.var_.characterEffect1067ui_story == nil then
				arg_163_1.var_.characterEffect1067ui_story = var_166_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_7 = 0.2

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_7 then
				local var_166_8 = (arg_163_1.time_ - var_166_6) / var_166_7

				if arg_163_1.var_.characterEffect1067ui_story then
					local var_166_9 = Mathf.Lerp(0, 0.5, var_166_8)

					arg_163_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1067ui_story.fillRatio = var_166_9
				end
			end

			if arg_163_1.time_ >= var_166_6 + var_166_7 and arg_163_1.time_ < var_166_6 + var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1067ui_story then
				local var_166_10 = 0.5

				arg_163_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1067ui_story.fillRatio = var_166_10
			end

			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_166_12 = 0
			local var_166_13 = 0.425

			if var_166_12 < arg_163_1.time_ and arg_163_1.time_ <= var_166_12 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_14 = arg_163_1:FormatText(StoryNameCfg[205].name)

				arg_163_1.leftNameTxt_.text = var_166_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_15 = arg_163_1:GetWordFromCfg(114111041)
				local var_166_16 = arg_163_1:FormatText(var_166_15.content)

				arg_163_1.text_.text = var_166_16

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_17 = 17
				local var_166_18 = utf8.len(var_166_16)
				local var_166_19 = var_166_17 <= 0 and var_166_13 or var_166_13 * (var_166_18 / var_166_17)

				if var_166_19 > 0 and var_166_13 < var_166_19 then
					arg_163_1.talkMaxDuration = var_166_19

					if var_166_19 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_19 + var_166_12
					end
				end

				arg_163_1.text_.text = var_166_16
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111041", "story_v_out_114111.awb") ~= 0 then
					local var_166_20 = manager.audio:GetVoiceLength("story_v_out_114111", "114111041", "story_v_out_114111.awb") / 1000

					if var_166_20 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_20 + var_166_12
					end

					if var_166_15.prefab_name ~= "" and arg_163_1.actors_[var_166_15.prefab_name] ~= nil then
						local var_166_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_15.prefab_name].transform, "story_v_out_114111", "114111041", "story_v_out_114111.awb")

						arg_163_1:RecordAudio("114111041", var_166_21)
						arg_163_1:RecordAudio("114111041", var_166_21)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_114111", "114111041", "story_v_out_114111.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_114111", "114111041", "story_v_out_114111.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_22 = math.max(var_166_13, arg_163_1.talkMaxDuration)

			if var_166_12 <= arg_163_1.time_ and arg_163_1.time_ < var_166_12 + var_166_22 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_12) / var_166_22

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_12 + var_166_22 and arg_163_1.time_ < var_166_12 + var_166_22 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play114111042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 114111042
		arg_167_1.duration_ = 2.866

		local var_167_0 = {
			ja = 2.4,
			ko = 2.8,
			zh = 2.866,
			en = 2.7
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
				arg_167_0:Play114111043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action2_1")
			end

			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_170_2 = arg_167_1.actors_["1067ui_story"]
			local var_170_3 = 0

			if var_170_3 < arg_167_1.time_ and arg_167_1.time_ <= var_170_3 + arg_170_0 and arg_167_1.var_.characterEffect1067ui_story == nil then
				arg_167_1.var_.characterEffect1067ui_story = var_170_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_4 = 0.2

			if var_170_3 <= arg_167_1.time_ and arg_167_1.time_ < var_170_3 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_3) / var_170_4

				if arg_167_1.var_.characterEffect1067ui_story then
					arg_167_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_3 + var_170_4 and arg_167_1.time_ < var_170_3 + var_170_4 + arg_170_0 and arg_167_1.var_.characterEffect1067ui_story then
				arg_167_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_170_6 = arg_167_1.actors_["1042ui_story"]
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 and arg_167_1.var_.characterEffect1042ui_story == nil then
				arg_167_1.var_.characterEffect1042ui_story = var_170_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_8 = 0.2

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8

				if arg_167_1.var_.characterEffect1042ui_story then
					local var_170_10 = Mathf.Lerp(0, 0.5, var_170_9)

					arg_167_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1042ui_story.fillRatio = var_170_10
				end
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 and arg_167_1.var_.characterEffect1042ui_story then
				local var_170_11 = 0.5

				arg_167_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1042ui_story.fillRatio = var_170_11
			end

			local var_170_12 = 0

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 then
				arg_167_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_170_13 = 0
			local var_170_14 = 0.325

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_15 = arg_167_1:FormatText(StoryNameCfg[206].name)

				arg_167_1.leftNameTxt_.text = var_170_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_16 = arg_167_1:GetWordFromCfg(114111042)
				local var_170_17 = arg_167_1:FormatText(var_170_16.content)

				arg_167_1.text_.text = var_170_17

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_18 = 13
				local var_170_19 = utf8.len(var_170_17)
				local var_170_20 = var_170_18 <= 0 and var_170_14 or var_170_14 * (var_170_19 / var_170_18)

				if var_170_20 > 0 and var_170_14 < var_170_20 then
					arg_167_1.talkMaxDuration = var_170_20

					if var_170_20 + var_170_13 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_20 + var_170_13
					end
				end

				arg_167_1.text_.text = var_170_17
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111042", "story_v_out_114111.awb") ~= 0 then
					local var_170_21 = manager.audio:GetVoiceLength("story_v_out_114111", "114111042", "story_v_out_114111.awb") / 1000

					if var_170_21 + var_170_13 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_21 + var_170_13
					end

					if var_170_16.prefab_name ~= "" and arg_167_1.actors_[var_170_16.prefab_name] ~= nil then
						local var_170_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_16.prefab_name].transform, "story_v_out_114111", "114111042", "story_v_out_114111.awb")

						arg_167_1:RecordAudio("114111042", var_170_22)
						arg_167_1:RecordAudio("114111042", var_170_22)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_114111", "114111042", "story_v_out_114111.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_114111", "114111042", "story_v_out_114111.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_23 = math.max(var_170_14, arg_167_1.talkMaxDuration)

			if var_170_13 <= arg_167_1.time_ and arg_167_1.time_ < var_170_13 + var_170_23 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_13) / var_170_23

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_13 + var_170_23 and arg_167_1.time_ < var_170_13 + var_170_23 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play114111043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 114111043
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play114111044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1042ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1042ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, 100, 0)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1042ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, 100, 0)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["1067ui_story"].transform
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1.var_.moveOldPos1067ui_story = var_174_9.localPosition
			end

			local var_174_11 = 0.001

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11
				local var_174_13 = Vector3.New(0, 100, 0)

				var_174_9.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1067ui_story, var_174_13, var_174_12)

				local var_174_14 = manager.ui.mainCamera.transform.position - var_174_9.position

				var_174_9.forward = Vector3.New(var_174_14.x, var_174_14.y, var_174_14.z)

				local var_174_15 = var_174_9.localEulerAngles

				var_174_15.z = 0
				var_174_15.x = 0
				var_174_9.localEulerAngles = var_174_15
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 then
				var_174_9.localPosition = Vector3.New(0, 100, 0)

				local var_174_16 = manager.ui.mainCamera.transform.position - var_174_9.position

				var_174_9.forward = Vector3.New(var_174_16.x, var_174_16.y, var_174_16.z)

				local var_174_17 = var_174_9.localEulerAngles

				var_174_17.z = 0
				var_174_17.x = 0
				var_174_9.localEulerAngles = var_174_17
			end

			local var_174_18 = 0
			local var_174_19 = 0.675

			if var_174_18 < arg_171_1.time_ and arg_171_1.time_ <= var_174_18 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_20 = arg_171_1:GetWordFromCfg(114111043)
				local var_174_21 = arg_171_1:FormatText(var_174_20.content)

				arg_171_1.text_.text = var_174_21

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_22 = 27
				local var_174_23 = utf8.len(var_174_21)
				local var_174_24 = var_174_22 <= 0 and var_174_19 or var_174_19 * (var_174_23 / var_174_22)

				if var_174_24 > 0 and var_174_19 < var_174_24 then
					arg_171_1.talkMaxDuration = var_174_24

					if var_174_24 + var_174_18 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_24 + var_174_18
					end
				end

				arg_171_1.text_.text = var_174_21
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_25 = math.max(var_174_19, arg_171_1.talkMaxDuration)

			if var_174_18 <= arg_171_1.time_ and arg_171_1.time_ < var_174_18 + var_174_25 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_18) / var_174_25

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_18 + var_174_25 and arg_171_1.time_ < var_174_18 + var_174_25 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play114111044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114111044
		arg_175_1.duration_ = 6.9

		local var_175_0 = {
			ja = 6.9,
			ko = 3,
			zh = 5,
			en = 4
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
				arg_175_0:Play114111045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1042ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1042ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, -1.06, -6.2)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1042ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = 0

			if var_178_9 < arg_175_1.time_ and arg_175_1.time_ <= var_178_9 + arg_178_0 then
				arg_175_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action4_1")
			end

			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 then
				arg_175_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_178_11 = arg_175_1.actors_["1042ui_story"]
			local var_178_12 = 0

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 and arg_175_1.var_.characterEffect1042ui_story == nil then
				arg_175_1.var_.characterEffect1042ui_story = var_178_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_13 = 0.2

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_13 then
				local var_178_14 = (arg_175_1.time_ - var_178_12) / var_178_13

				if arg_175_1.var_.characterEffect1042ui_story then
					arg_175_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_12 + var_178_13 and arg_175_1.time_ < var_178_12 + var_178_13 + arg_178_0 and arg_175_1.var_.characterEffect1042ui_story then
				arg_175_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_178_15 = 0
			local var_178_16 = 0.325

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_17 = arg_175_1:FormatText(StoryNameCfg[205].name)

				arg_175_1.leftNameTxt_.text = var_178_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_18 = arg_175_1:GetWordFromCfg(114111044)
				local var_178_19 = arg_175_1:FormatText(var_178_18.content)

				arg_175_1.text_.text = var_178_19

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_20 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111044", "story_v_out_114111.awb") ~= 0 then
					local var_178_23 = manager.audio:GetVoiceLength("story_v_out_114111", "114111044", "story_v_out_114111.awb") / 1000

					if var_178_23 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_23 + var_178_15
					end

					if var_178_18.prefab_name ~= "" and arg_175_1.actors_[var_178_18.prefab_name] ~= nil then
						local var_178_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_18.prefab_name].transform, "story_v_out_114111", "114111044", "story_v_out_114111.awb")

						arg_175_1:RecordAudio("114111044", var_178_24)
						arg_175_1:RecordAudio("114111044", var_178_24)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_114111", "114111044", "story_v_out_114111.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_114111", "114111044", "story_v_out_114111.awb")
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
	Play114111045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114111045
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play114111046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1042ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1042ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 100, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1042ui_story, var_182_4, var_182_3)

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

			local var_182_9 = 0
			local var_182_10 = 0.85

			if var_182_9 < arg_179_1.time_ and arg_179_1.time_ <= var_182_9 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_11 = arg_179_1:GetWordFromCfg(114111045)
				local var_182_12 = arg_179_1:FormatText(var_182_11.content)

				arg_179_1.text_.text = var_182_12

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_13 = 34
				local var_182_14 = utf8.len(var_182_12)
				local var_182_15 = var_182_13 <= 0 and var_182_10 or var_182_10 * (var_182_14 / var_182_13)

				if var_182_15 > 0 and var_182_10 < var_182_15 then
					arg_179_1.talkMaxDuration = var_182_15

					if var_182_15 + var_182_9 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_15 + var_182_9
					end
				end

				arg_179_1.text_.text = var_182_12
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_16 = math.max(var_182_10, arg_179_1.talkMaxDuration)

			if var_182_9 <= arg_179_1.time_ and arg_179_1.time_ < var_182_9 + var_182_16 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_9) / var_182_16

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_9 + var_182_16 and arg_179_1.time_ < var_182_9 + var_182_16 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play114111046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114111046
		arg_183_1.duration_ = 7.466

		local var_183_0 = {
			ja = 7.466,
			ko = 7.333,
			zh = 4.6,
			en = 5.233
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
				arg_183_0:Play114111047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1067ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1067ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1067ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["1042ui_story"].transform
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1.var_.moveOldPos1042ui_story = var_186_9.localPosition
			end

			local var_186_11 = 0.001

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11
				local var_186_13 = Vector3.New(0.7, -1.06, -6.2)

				var_186_9.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1042ui_story, var_186_13, var_186_12)

				local var_186_14 = manager.ui.mainCamera.transform.position - var_186_9.position

				var_186_9.forward = Vector3.New(var_186_14.x, var_186_14.y, var_186_14.z)

				local var_186_15 = var_186_9.localEulerAngles

				var_186_15.z = 0
				var_186_15.x = 0
				var_186_9.localEulerAngles = var_186_15
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 then
				var_186_9.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_186_16 = manager.ui.mainCamera.transform.position - var_186_9.position

				var_186_9.forward = Vector3.New(var_186_16.x, var_186_16.y, var_186_16.z)

				local var_186_17 = var_186_9.localEulerAngles

				var_186_17.z = 0
				var_186_17.x = 0
				var_186_9.localEulerAngles = var_186_17
			end

			local var_186_18 = 0

			if var_186_18 < arg_183_1.time_ and arg_183_1.time_ <= var_186_18 + arg_186_0 then
				arg_183_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_186_19 = 0

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_186_20 = arg_183_1.actors_["1067ui_story"]
			local var_186_21 = 0

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 and arg_183_1.var_.characterEffect1067ui_story == nil then
				arg_183_1.var_.characterEffect1067ui_story = var_186_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_22 = 0.2

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_22 then
				local var_186_23 = (arg_183_1.time_ - var_186_21) / var_186_22

				if arg_183_1.var_.characterEffect1067ui_story then
					arg_183_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_21 + var_186_22 and arg_183_1.time_ < var_186_21 + var_186_22 + arg_186_0 and arg_183_1.var_.characterEffect1067ui_story then
				arg_183_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_186_24 = arg_183_1.actors_["1042ui_story"]
			local var_186_25 = 0

			if var_186_25 < arg_183_1.time_ and arg_183_1.time_ <= var_186_25 + arg_186_0 and arg_183_1.var_.characterEffect1042ui_story == nil then
				arg_183_1.var_.characterEffect1042ui_story = var_186_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_26 = 0.2

			if var_186_25 <= arg_183_1.time_ and arg_183_1.time_ < var_186_25 + var_186_26 then
				local var_186_27 = (arg_183_1.time_ - var_186_25) / var_186_26

				if arg_183_1.var_.characterEffect1042ui_story then
					local var_186_28 = Mathf.Lerp(0, 0.5, var_186_27)

					arg_183_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1042ui_story.fillRatio = var_186_28
				end
			end

			if arg_183_1.time_ >= var_186_25 + var_186_26 and arg_183_1.time_ < var_186_25 + var_186_26 + arg_186_0 and arg_183_1.var_.characterEffect1042ui_story then
				local var_186_29 = 0.5

				arg_183_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1042ui_story.fillRatio = var_186_29
			end

			local var_186_30 = 0
			local var_186_31 = 0.5

			if var_186_30 < arg_183_1.time_ and arg_183_1.time_ <= var_186_30 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_32 = arg_183_1:FormatText(StoryNameCfg[206].name)

				arg_183_1.leftNameTxt_.text = var_186_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_33 = arg_183_1:GetWordFromCfg(114111046)
				local var_186_34 = arg_183_1:FormatText(var_186_33.content)

				arg_183_1.text_.text = var_186_34

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_35 = 20
				local var_186_36 = utf8.len(var_186_34)
				local var_186_37 = var_186_35 <= 0 and var_186_31 or var_186_31 * (var_186_36 / var_186_35)

				if var_186_37 > 0 and var_186_31 < var_186_37 then
					arg_183_1.talkMaxDuration = var_186_37

					if var_186_37 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_37 + var_186_30
					end
				end

				arg_183_1.text_.text = var_186_34
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111046", "story_v_out_114111.awb") ~= 0 then
					local var_186_38 = manager.audio:GetVoiceLength("story_v_out_114111", "114111046", "story_v_out_114111.awb") / 1000

					if var_186_38 + var_186_30 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_38 + var_186_30
					end

					if var_186_33.prefab_name ~= "" and arg_183_1.actors_[var_186_33.prefab_name] ~= nil then
						local var_186_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_33.prefab_name].transform, "story_v_out_114111", "114111046", "story_v_out_114111.awb")

						arg_183_1:RecordAudio("114111046", var_186_39)
						arg_183_1:RecordAudio("114111046", var_186_39)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_114111", "114111046", "story_v_out_114111.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_114111", "114111046", "story_v_out_114111.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_40 = math.max(var_186_31, arg_183_1.talkMaxDuration)

			if var_186_30 <= arg_183_1.time_ and arg_183_1.time_ < var_186_30 + var_186_40 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_30) / var_186_40

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_30 + var_186_40 and arg_183_1.time_ < var_186_30 + var_186_40 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play114111047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114111047
		arg_187_1.duration_ = 12.3

		local var_187_0 = {
			ja = 8.333,
			ko = 10.3,
			zh = 9.8,
			en = 12.3
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
				arg_187_0:Play114111048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1042ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1042ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0.7, -1.06, -6.2)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1042ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = 0

			if var_190_9 < arg_187_1.time_ and arg_187_1.time_ <= var_190_9 + arg_190_0 then
				arg_187_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_190_10 = arg_187_1.actors_["1042ui_story"]
			local var_190_11 = 0

			if var_190_11 < arg_187_1.time_ and arg_187_1.time_ <= var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1042ui_story == nil then
				arg_187_1.var_.characterEffect1042ui_story = var_190_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_12 = 0.2

			if var_190_11 <= arg_187_1.time_ and arg_187_1.time_ < var_190_11 + var_190_12 then
				local var_190_13 = (arg_187_1.time_ - var_190_11) / var_190_12

				if arg_187_1.var_.characterEffect1042ui_story then
					arg_187_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_11 + var_190_12 and arg_187_1.time_ < var_190_11 + var_190_12 + arg_190_0 and arg_187_1.var_.characterEffect1042ui_story then
				arg_187_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_190_14 = arg_187_1.actors_["1067ui_story"]
			local var_190_15 = 0

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 and arg_187_1.var_.characterEffect1067ui_story == nil then
				arg_187_1.var_.characterEffect1067ui_story = var_190_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_16 = 0.2

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_16 then
				local var_190_17 = (arg_187_1.time_ - var_190_15) / var_190_16

				if arg_187_1.var_.characterEffect1067ui_story then
					local var_190_18 = Mathf.Lerp(0, 0.5, var_190_17)

					arg_187_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1067ui_story.fillRatio = var_190_18
				end
			end

			if arg_187_1.time_ >= var_190_15 + var_190_16 and arg_187_1.time_ < var_190_15 + var_190_16 + arg_190_0 and arg_187_1.var_.characterEffect1067ui_story then
				local var_190_19 = 0.5

				arg_187_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1067ui_story.fillRatio = var_190_19
			end

			local var_190_20 = 0
			local var_190_21 = 0.875

			if var_190_20 < arg_187_1.time_ and arg_187_1.time_ <= var_190_20 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_22 = arg_187_1:FormatText(StoryNameCfg[205].name)

				arg_187_1.leftNameTxt_.text = var_190_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_23 = arg_187_1:GetWordFromCfg(114111047)
				local var_190_24 = arg_187_1:FormatText(var_190_23.content)

				arg_187_1.text_.text = var_190_24

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_25 = 35
				local var_190_26 = utf8.len(var_190_24)
				local var_190_27 = var_190_25 <= 0 and var_190_21 or var_190_21 * (var_190_26 / var_190_25)

				if var_190_27 > 0 and var_190_21 < var_190_27 then
					arg_187_1.talkMaxDuration = var_190_27

					if var_190_27 + var_190_20 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_27 + var_190_20
					end
				end

				arg_187_1.text_.text = var_190_24
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111047", "story_v_out_114111.awb") ~= 0 then
					local var_190_28 = manager.audio:GetVoiceLength("story_v_out_114111", "114111047", "story_v_out_114111.awb") / 1000

					if var_190_28 + var_190_20 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_28 + var_190_20
					end

					if var_190_23.prefab_name ~= "" and arg_187_1.actors_[var_190_23.prefab_name] ~= nil then
						local var_190_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_23.prefab_name].transform, "story_v_out_114111", "114111047", "story_v_out_114111.awb")

						arg_187_1:RecordAudio("114111047", var_190_29)
						arg_187_1:RecordAudio("114111047", var_190_29)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114111", "114111047", "story_v_out_114111.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114111", "114111047", "story_v_out_114111.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_30 = math.max(var_190_21, arg_187_1.talkMaxDuration)

			if var_190_20 <= arg_187_1.time_ and arg_187_1.time_ < var_190_20 + var_190_30 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_20) / var_190_30

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_20 + var_190_30 and arg_187_1.time_ < var_190_20 + var_190_30 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play114111048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114111048
		arg_191_1.duration_ = 9

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play114111049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = "OM0206"

			if arg_191_1.bgs_[var_194_0] == nil then
				local var_194_1 = Object.Instantiate(arg_191_1.paintGo_)

				var_194_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_194_0)
				var_194_1.name = var_194_0
				var_194_1.transform.parent = arg_191_1.stage_.transform
				var_194_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_191_1.bgs_[var_194_0] = var_194_1
			end

			local var_194_2 = 2

			if var_194_2 < arg_191_1.time_ and arg_191_1.time_ <= var_194_2 + arg_194_0 then
				local var_194_3 = manager.ui.mainCamera.transform.localPosition
				local var_194_4 = Vector3.New(0, 0, 10) + Vector3.New(var_194_3.x, var_194_3.y, 0)
				local var_194_5 = arg_191_1.bgs_.OM0206

				var_194_5.transform.localPosition = var_194_4
				var_194_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_194_6 = var_194_5:GetComponent("SpriteRenderer")

				if var_194_6 and var_194_6.sprite then
					local var_194_7 = (var_194_5.transform.localPosition - var_194_3).z
					local var_194_8 = manager.ui.mainCameraCom_
					local var_194_9 = 2 * var_194_7 * Mathf.Tan(var_194_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_194_10 = var_194_9 * var_194_8.aspect
					local var_194_11 = var_194_6.sprite.bounds.size.x
					local var_194_12 = var_194_6.sprite.bounds.size.y
					local var_194_13 = var_194_10 / var_194_11
					local var_194_14 = var_194_9 / var_194_12
					local var_194_15 = var_194_14 < var_194_13 and var_194_13 or var_194_14

					var_194_5.transform.localScale = Vector3.New(var_194_15, var_194_15, 0)
				end

				for iter_194_0, iter_194_1 in pairs(arg_191_1.bgs_) do
					if iter_194_0 ~= "OM0206" then
						iter_194_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_194_16 = 0

			if var_194_16 < arg_191_1.time_ and arg_191_1.time_ <= var_194_16 + arg_194_0 then
				arg_191_1.mask_.enabled = true
				arg_191_1.mask_.raycastTarget = true

				arg_191_1:SetGaussion(false)
			end

			local var_194_17 = 2

			if var_194_16 <= arg_191_1.time_ and arg_191_1.time_ < var_194_16 + var_194_17 then
				local var_194_18 = (arg_191_1.time_ - var_194_16) / var_194_17
				local var_194_19 = Color.New(0, 0, 0)

				var_194_19.a = Mathf.Lerp(0, 1, var_194_18)
				arg_191_1.mask_.color = var_194_19
			end

			if arg_191_1.time_ >= var_194_16 + var_194_17 and arg_191_1.time_ < var_194_16 + var_194_17 + arg_194_0 then
				local var_194_20 = Color.New(0, 0, 0)

				var_194_20.a = 1
				arg_191_1.mask_.color = var_194_20
			end

			local var_194_21 = 2

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 then
				arg_191_1.mask_.enabled = true
				arg_191_1.mask_.raycastTarget = true

				arg_191_1:SetGaussion(false)
			end

			local var_194_22 = 2

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_21) / var_194_22
				local var_194_24 = Color.New(0, 0, 0)

				var_194_24.a = Mathf.Lerp(1, 0, var_194_23)
				arg_191_1.mask_.color = var_194_24
			end

			if arg_191_1.time_ >= var_194_21 + var_194_22 and arg_191_1.time_ < var_194_21 + var_194_22 + arg_194_0 then
				local var_194_25 = Color.New(0, 0, 0)
				local var_194_26 = 0

				arg_191_1.mask_.enabled = false
				var_194_25.a = var_194_26
				arg_191_1.mask_.color = var_194_25
			end

			local var_194_27 = arg_191_1.actors_["1042ui_story"].transform
			local var_194_28 = 1.966

			if var_194_28 < arg_191_1.time_ and arg_191_1.time_ <= var_194_28 + arg_194_0 then
				arg_191_1.var_.moveOldPos1042ui_story = var_194_27.localPosition
			end

			local var_194_29 = 0.001

			if var_194_28 <= arg_191_1.time_ and arg_191_1.time_ < var_194_28 + var_194_29 then
				local var_194_30 = (arg_191_1.time_ - var_194_28) / var_194_29
				local var_194_31 = Vector3.New(0, 100, 0)

				var_194_27.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1042ui_story, var_194_31, var_194_30)

				local var_194_32 = manager.ui.mainCamera.transform.position - var_194_27.position

				var_194_27.forward = Vector3.New(var_194_32.x, var_194_32.y, var_194_32.z)

				local var_194_33 = var_194_27.localEulerAngles

				var_194_33.z = 0
				var_194_33.x = 0
				var_194_27.localEulerAngles = var_194_33
			end

			if arg_191_1.time_ >= var_194_28 + var_194_29 and arg_191_1.time_ < var_194_28 + var_194_29 + arg_194_0 then
				var_194_27.localPosition = Vector3.New(0, 100, 0)

				local var_194_34 = manager.ui.mainCamera.transform.position - var_194_27.position

				var_194_27.forward = Vector3.New(var_194_34.x, var_194_34.y, var_194_34.z)

				local var_194_35 = var_194_27.localEulerAngles

				var_194_35.z = 0
				var_194_35.x = 0
				var_194_27.localEulerAngles = var_194_35
			end

			local var_194_36 = arg_191_1.actors_["1067ui_story"].transform
			local var_194_37 = 1.966

			if var_194_37 < arg_191_1.time_ and arg_191_1.time_ <= var_194_37 + arg_194_0 then
				arg_191_1.var_.moveOldPos1067ui_story = var_194_36.localPosition
			end

			local var_194_38 = 0.001

			if var_194_37 <= arg_191_1.time_ and arg_191_1.time_ < var_194_37 + var_194_38 then
				local var_194_39 = (arg_191_1.time_ - var_194_37) / var_194_38
				local var_194_40 = Vector3.New(0, 100, 0)

				var_194_36.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1067ui_story, var_194_40, var_194_39)

				local var_194_41 = manager.ui.mainCamera.transform.position - var_194_36.position

				var_194_36.forward = Vector3.New(var_194_41.x, var_194_41.y, var_194_41.z)

				local var_194_42 = var_194_36.localEulerAngles

				var_194_42.z = 0
				var_194_42.x = 0
				var_194_36.localEulerAngles = var_194_42
			end

			if arg_191_1.time_ >= var_194_37 + var_194_38 and arg_191_1.time_ < var_194_37 + var_194_38 + arg_194_0 then
				var_194_36.localPosition = Vector3.New(0, 100, 0)

				local var_194_43 = manager.ui.mainCamera.transform.position - var_194_36.position

				var_194_36.forward = Vector3.New(var_194_43.x, var_194_43.y, var_194_43.z)

				local var_194_44 = var_194_36.localEulerAngles

				var_194_44.z = 0
				var_194_44.x = 0
				var_194_36.localEulerAngles = var_194_44
			end

			if arg_191_1.frameCnt_ <= 1 then
				arg_191_1.dialog_:SetActive(false)
			end

			local var_194_45 = 4
			local var_194_46 = 1.675

			if var_194_45 < arg_191_1.time_ and arg_191_1.time_ <= var_194_45 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0

				arg_191_1.dialog_:SetActive(true)

				local var_194_47 = LeanTween.value(arg_191_1.dialog_, 0, 1, 0.3)

				var_194_47:setOnUpdate(LuaHelper.FloatAction(function(arg_195_0)
					arg_191_1.dialogCg_.alpha = arg_195_0
				end))
				var_194_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_191_1.dialog_)
					var_194_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_191_1.duration_ = arg_191_1.duration_ + 0.3

				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_48 = arg_191_1:GetWordFromCfg(114111048)
				local var_194_49 = arg_191_1:FormatText(var_194_48.content)

				arg_191_1.text_.text = var_194_49

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_50 = 67
				local var_194_51 = utf8.len(var_194_49)
				local var_194_52 = var_194_50 <= 0 and var_194_46 or var_194_46 * (var_194_51 / var_194_50)

				if var_194_52 > 0 and var_194_46 < var_194_52 then
					arg_191_1.talkMaxDuration = var_194_52
					var_194_45 = var_194_45 + 0.3

					if var_194_52 + var_194_45 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_52 + var_194_45
					end
				end

				arg_191_1.text_.text = var_194_49
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_53 = var_194_45 + 0.3
			local var_194_54 = math.max(var_194_46, arg_191_1.talkMaxDuration)

			if var_194_53 <= arg_191_1.time_ and arg_191_1.time_ < var_194_53 + var_194_54 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_53) / var_194_54

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_53 + var_194_54 and arg_191_1.time_ < var_194_53 + var_194_54 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play114111049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 114111049
		arg_197_1.duration_ = 9.166

		local var_197_0 = {
			ja = 8.666,
			ko = 8.933,
			zh = 8.1,
			en = 9.166
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
				arg_197_0:Play114111050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 1.1

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[104].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(114111049)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111049", "story_v_out_114111.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111049", "story_v_out_114111.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_114111", "114111049", "story_v_out_114111.awb")

						arg_197_1:RecordAudio("114111049", var_200_9)
						arg_197_1:RecordAudio("114111049", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_114111", "114111049", "story_v_out_114111.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_114111", "114111049", "story_v_out_114111.awb")
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
	Play114111050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 114111050
		arg_201_1.duration_ = 6.933

		local var_201_0 = {
			ja = 3.833,
			ko = 3.633,
			zh = 4.166,
			en = 6.933
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
				arg_201_0:Play114111051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.5

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[104].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(114111050)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111050", "story_v_out_114111.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111050", "story_v_out_114111.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_114111", "114111050", "story_v_out_114111.awb")

						arg_201_1:RecordAudio("114111050", var_204_9)
						arg_201_1:RecordAudio("114111050", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_114111", "114111050", "story_v_out_114111.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_114111", "114111050", "story_v_out_114111.awb")
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
	Play114111051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 114111051
		arg_205_1.duration_ = 8.066

		local var_205_0 = {
			ja = 5.2,
			ko = 7.4,
			zh = 7.033,
			en = 8.066
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
				arg_205_0:Play114111052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.875

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[105].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(114111051)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 35
				local var_208_6 = utf8.len(var_208_4)
				local var_208_7 = var_208_5 <= 0 and var_208_1 or var_208_1 * (var_208_6 / var_208_5)

				if var_208_7 > 0 and var_208_1 < var_208_7 then
					arg_205_1.talkMaxDuration = var_208_7

					if var_208_7 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_7 + var_208_0
					end
				end

				arg_205_1.text_.text = var_208_4
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111051", "story_v_out_114111.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111051", "story_v_out_114111.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_114111", "114111051", "story_v_out_114111.awb")

						arg_205_1:RecordAudio("114111051", var_208_9)
						arg_205_1:RecordAudio("114111051", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_114111", "114111051", "story_v_out_114111.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_114111", "114111051", "story_v_out_114111.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_10 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_10 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_10

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_10 and arg_205_1.time_ < var_208_0 + var_208_10 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play114111052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 114111052
		arg_209_1.duration_ = 11.833

		local var_209_0 = {
			ja = 10.9,
			ko = 9.433,
			zh = 10,
			en = 11.833
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
				arg_209_0:Play114111053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 1.35

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[104].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, true)
				arg_209_1.iconController_:SetSelectedState("hero")

				arg_209_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(114111052)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 54
				local var_212_6 = utf8.len(var_212_4)
				local var_212_7 = var_212_5 <= 0 and var_212_1 or var_212_1 * (var_212_6 / var_212_5)

				if var_212_7 > 0 and var_212_1 < var_212_7 then
					arg_209_1.talkMaxDuration = var_212_7

					if var_212_7 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_7 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_4
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111052", "story_v_out_114111.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111052", "story_v_out_114111.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_114111", "114111052", "story_v_out_114111.awb")

						arg_209_1:RecordAudio("114111052", var_212_9)
						arg_209_1:RecordAudio("114111052", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_114111", "114111052", "story_v_out_114111.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_114111", "114111052", "story_v_out_114111.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_10 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_10 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_10

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_10 and arg_209_1.time_ < var_212_0 + var_212_10 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play114111053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 114111053
		arg_213_1.duration_ = 5

		local var_213_0 = {
			ja = 4.466,
			ko = 5,
			zh = 4.4,
			en = 4.333
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
				arg_213_0:Play114111054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.525

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[105].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(114111053)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 21
				local var_216_6 = utf8.len(var_216_4)
				local var_216_7 = var_216_5 <= 0 and var_216_1 or var_216_1 * (var_216_6 / var_216_5)

				if var_216_7 > 0 and var_216_1 < var_216_7 then
					arg_213_1.talkMaxDuration = var_216_7

					if var_216_7 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_7 + var_216_0
					end
				end

				arg_213_1.text_.text = var_216_4
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111053", "story_v_out_114111.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111053", "story_v_out_114111.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_114111", "114111053", "story_v_out_114111.awb")

						arg_213_1:RecordAudio("114111053", var_216_9)
						arg_213_1:RecordAudio("114111053", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_114111", "114111053", "story_v_out_114111.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_114111", "114111053", "story_v_out_114111.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_10 = math.max(var_216_1, arg_213_1.talkMaxDuration)

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_10 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_0) / var_216_10

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_0 + var_216_10 and arg_213_1.time_ < var_216_0 + var_216_10 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play114111054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 114111054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play114111055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1.3

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(114111054)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 52
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_7 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_7 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_7

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_7 and arg_217_1.time_ < var_220_0 + var_220_7 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play114111055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 114111055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play114111056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 1.75

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_2 = arg_221_1:GetWordFromCfg(114111055)
				local var_224_3 = arg_221_1:FormatText(var_224_2.content)

				arg_221_1.text_.text = var_224_3

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_4 = 70
				local var_224_5 = utf8.len(var_224_3)
				local var_224_6 = var_224_4 <= 0 and var_224_1 or var_224_1 * (var_224_5 / var_224_4)

				if var_224_6 > 0 and var_224_1 < var_224_6 then
					arg_221_1.talkMaxDuration = var_224_6

					if var_224_6 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_6 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_3
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_7 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_7 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_7

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_7 and arg_221_1.time_ < var_224_0 + var_224_7 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play114111056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 114111056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play114111057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1.6

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_2 = arg_225_1:GetWordFromCfg(114111056)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 64
				local var_228_5 = utf8.len(var_228_3)
				local var_228_6 = var_228_4 <= 0 and var_228_1 or var_228_1 * (var_228_5 / var_228_4)

				if var_228_6 > 0 and var_228_1 < var_228_6 then
					arg_225_1.talkMaxDuration = var_228_6

					if var_228_6 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_6 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_3
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_7 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_7 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_7

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_7 and arg_225_1.time_ < var_228_0 + var_228_7 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play114111057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 114111057
		arg_229_1.duration_ = 4.766

		local var_229_0 = {
			ja = 3.3,
			ko = 2.666,
			zh = 3.8,
			en = 4.766
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play114111058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.25

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[205].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(114111057)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 10
				local var_232_6 = utf8.len(var_232_4)
				local var_232_7 = var_232_5 <= 0 and var_232_1 or var_232_1 * (var_232_6 / var_232_5)

				if var_232_7 > 0 and var_232_1 < var_232_7 then
					arg_229_1.talkMaxDuration = var_232_7

					if var_232_7 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_7 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_4
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111057", "story_v_out_114111.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111057", "story_v_out_114111.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_114111", "114111057", "story_v_out_114111.awb")

						arg_229_1:RecordAudio("114111057", var_232_9)
						arg_229_1:RecordAudio("114111057", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_114111", "114111057", "story_v_out_114111.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_114111", "114111057", "story_v_out_114111.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_10 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_10 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_10

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_10 and arg_229_1.time_ < var_232_0 + var_232_10 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play114111058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 114111058
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play114111059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 1.225

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_2 = arg_233_1:GetWordFromCfg(114111058)
				local var_236_3 = arg_233_1:FormatText(var_236_2.content)

				arg_233_1.text_.text = var_236_3

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_4 = 49
				local var_236_5 = utf8.len(var_236_3)
				local var_236_6 = var_236_4 <= 0 and var_236_1 or var_236_1 * (var_236_5 / var_236_4)

				if var_236_6 > 0 and var_236_1 < var_236_6 then
					arg_233_1.talkMaxDuration = var_236_6

					if var_236_6 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_6 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_3
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_7 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_7 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_7

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_7 and arg_233_1.time_ < var_236_0 + var_236_7 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play114111059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 114111059
		arg_237_1.duration_ = 9.3

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play114111060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = "F05_1"

			if arg_237_1.bgs_[var_240_0] == nil then
				local var_240_1 = Object.Instantiate(arg_237_1.paintGo_)

				var_240_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_240_0)
				var_240_1.name = var_240_0
				var_240_1.transform.parent = arg_237_1.stage_.transform
				var_240_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_237_1.bgs_[var_240_0] = var_240_1
			end

			local var_240_2 = 2

			if var_240_2 < arg_237_1.time_ and arg_237_1.time_ <= var_240_2 + arg_240_0 then
				local var_240_3 = manager.ui.mainCamera.transform.localPosition
				local var_240_4 = Vector3.New(0, 0, 10) + Vector3.New(var_240_3.x, var_240_3.y, 0)
				local var_240_5 = arg_237_1.bgs_.F05_1

				var_240_5.transform.localPosition = var_240_4
				var_240_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_240_6 = var_240_5:GetComponent("SpriteRenderer")

				if var_240_6 and var_240_6.sprite then
					local var_240_7 = (var_240_5.transform.localPosition - var_240_3).z
					local var_240_8 = manager.ui.mainCameraCom_
					local var_240_9 = 2 * var_240_7 * Mathf.Tan(var_240_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_240_10 = var_240_9 * var_240_8.aspect
					local var_240_11 = var_240_6.sprite.bounds.size.x
					local var_240_12 = var_240_6.sprite.bounds.size.y
					local var_240_13 = var_240_10 / var_240_11
					local var_240_14 = var_240_9 / var_240_12
					local var_240_15 = var_240_14 < var_240_13 and var_240_13 or var_240_14

					var_240_5.transform.localScale = Vector3.New(var_240_15, var_240_15, 0)
				end

				for iter_240_0, iter_240_1 in pairs(arg_237_1.bgs_) do
					if iter_240_0 ~= "F05_1" then
						iter_240_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_240_16 = 0

			if var_240_16 < arg_237_1.time_ and arg_237_1.time_ <= var_240_16 + arg_240_0 then
				arg_237_1.mask_.enabled = true
				arg_237_1.mask_.raycastTarget = true

				arg_237_1:SetGaussion(false)
			end

			local var_240_17 = 2

			if var_240_16 <= arg_237_1.time_ and arg_237_1.time_ < var_240_16 + var_240_17 then
				local var_240_18 = (arg_237_1.time_ - var_240_16) / var_240_17
				local var_240_19 = Color.New(0, 0, 0)

				var_240_19.a = Mathf.Lerp(0, 1, var_240_18)
				arg_237_1.mask_.color = var_240_19
			end

			if arg_237_1.time_ >= var_240_16 + var_240_17 and arg_237_1.time_ < var_240_16 + var_240_17 + arg_240_0 then
				local var_240_20 = Color.New(0, 0, 0)

				var_240_20.a = 1
				arg_237_1.mask_.color = var_240_20
			end

			local var_240_21 = 2

			if var_240_21 < arg_237_1.time_ and arg_237_1.time_ <= var_240_21 + arg_240_0 then
				arg_237_1.mask_.enabled = true
				arg_237_1.mask_.raycastTarget = true

				arg_237_1:SetGaussion(false)
			end

			local var_240_22 = 2

			if var_240_21 <= arg_237_1.time_ and arg_237_1.time_ < var_240_21 + var_240_22 then
				local var_240_23 = (arg_237_1.time_ - var_240_21) / var_240_22
				local var_240_24 = Color.New(0, 0, 0)

				var_240_24.a = Mathf.Lerp(1, 0, var_240_23)
				arg_237_1.mask_.color = var_240_24
			end

			if arg_237_1.time_ >= var_240_21 + var_240_22 and arg_237_1.time_ < var_240_21 + var_240_22 + arg_240_0 then
				local var_240_25 = Color.New(0, 0, 0)
				local var_240_26 = 0

				arg_237_1.mask_.enabled = false
				var_240_25.a = var_240_26
				arg_237_1.mask_.color = var_240_25
			end

			local var_240_27 = arg_237_1.bgs_.F05_1.transform
			local var_240_28 = 2

			if var_240_28 < arg_237_1.time_ and arg_237_1.time_ <= var_240_28 + arg_240_0 then
				arg_237_1.var_.moveOldPosF05_1 = var_240_27.localPosition
			end

			local var_240_29 = 0.001

			if var_240_28 <= arg_237_1.time_ and arg_237_1.time_ < var_240_28 + var_240_29 then
				local var_240_30 = (arg_237_1.time_ - var_240_28) / var_240_29
				local var_240_31 = Vector3.New(0, 1, 10)

				var_240_27.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPosF05_1, var_240_31, var_240_30)
			end

			if arg_237_1.time_ >= var_240_28 + var_240_29 and arg_237_1.time_ < var_240_28 + var_240_29 + arg_240_0 then
				var_240_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_240_32 = arg_237_1.bgs_.F05_1.transform
			local var_240_33 = 2.034

			if var_240_33 < arg_237_1.time_ and arg_237_1.time_ <= var_240_33 + arg_240_0 then
				arg_237_1.var_.moveOldPosF05_1 = var_240_32.localPosition
			end

			local var_240_34 = 2.5

			if var_240_33 <= arg_237_1.time_ and arg_237_1.time_ < var_240_33 + var_240_34 then
				local var_240_35 = (arg_237_1.time_ - var_240_33) / var_240_34
				local var_240_36 = Vector3.New(0, 1, 9.5)

				var_240_32.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPosF05_1, var_240_36, var_240_35)
			end

			if arg_237_1.time_ >= var_240_33 + var_240_34 and arg_237_1.time_ < var_240_33 + var_240_34 + arg_240_0 then
				var_240_32.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_240_37 = 4

			if var_240_37 < arg_237_1.time_ and arg_237_1.time_ <= var_240_37 + arg_240_0 then
				arg_237_1.allBtn_.enabled = false
			end

			local var_240_38 = 0.534

			if arg_237_1.time_ >= var_240_37 + var_240_38 and arg_237_1.time_ < var_240_37 + var_240_38 + arg_240_0 then
				arg_237_1.allBtn_.enabled = true
			end

			local var_240_39 = 0
			local var_240_40 = 5.43333333333333

			if var_240_39 < arg_237_1.time_ and arg_237_1.time_ <= var_240_39 + arg_240_0 then
				local var_240_41 = "play"
				local var_240_42 = "music"

				arg_237_1:AudioAction(var_240_41, var_240_42, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_237_1.frameCnt_ <= 1 then
				arg_237_1.dialog_:SetActive(false)
			end

			local var_240_43 = 4.3
			local var_240_44 = 0.95

			if var_240_43 < arg_237_1.time_ and arg_237_1.time_ <= var_240_43 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0

				arg_237_1.dialog_:SetActive(true)

				local var_240_45 = LeanTween.value(arg_237_1.dialog_, 0, 1, 0.3)

				var_240_45:setOnUpdate(LuaHelper.FloatAction(function(arg_241_0)
					arg_237_1.dialogCg_.alpha = arg_241_0
				end))
				var_240_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_237_1.dialog_)
					var_240_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_237_1.duration_ = arg_237_1.duration_ + 0.3

				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_46 = arg_237_1:GetWordFromCfg(114111059)
				local var_240_47 = arg_237_1:FormatText(var_240_46.content)

				arg_237_1.text_.text = var_240_47

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_48 = 38
				local var_240_49 = utf8.len(var_240_47)
				local var_240_50 = var_240_48 <= 0 and var_240_44 or var_240_44 * (var_240_49 / var_240_48)

				if var_240_50 > 0 and var_240_44 < var_240_50 then
					arg_237_1.talkMaxDuration = var_240_50
					var_240_43 = var_240_43 + 0.3

					if var_240_50 + var_240_43 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_50 + var_240_43
					end
				end

				arg_237_1.text_.text = var_240_47
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_51 = var_240_43 + 0.3
			local var_240_52 = math.max(var_240_44, arg_237_1.talkMaxDuration)

			if var_240_51 <= arg_237_1.time_ and arg_237_1.time_ < var_240_51 + var_240_52 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_51) / var_240_52

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_51 + var_240_52 and arg_237_1.time_ < var_240_51 + var_240_52 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play114111060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 114111060
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play114111061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.125

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[7].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(114111060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 5
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_8 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_8 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_8

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_8 and arg_243_1.time_ < var_246_0 + var_246_8 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play114111061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 114111061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play114111062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 1.775

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_2 = arg_247_1:GetWordFromCfg(114111061)
				local var_250_3 = arg_247_1:FormatText(var_250_2.content)

				arg_247_1.text_.text = var_250_3

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_4 = 71
				local var_250_5 = utf8.len(var_250_3)
				local var_250_6 = var_250_4 <= 0 and var_250_1 or var_250_1 * (var_250_5 / var_250_4)

				if var_250_6 > 0 and var_250_1 < var_250_6 then
					arg_247_1.talkMaxDuration = var_250_6

					if var_250_6 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_6 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_3
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_7 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_7 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_7

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_7 and arg_247_1.time_ < var_250_0 + var_250_7 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play114111062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 114111062
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play114111063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 1.525

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

				local var_254_2 = arg_251_1:GetWordFromCfg(114111062)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 61
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
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_7 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_7 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_7

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_7 and arg_251_1.time_ < var_254_0 + var_254_7 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play114111063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 114111063
		arg_255_1.duration_ = 3.2

		local var_255_0 = {
			ja = 3.2,
			ko = 2.6,
			zh = 3,
			en = 3.133
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
				arg_255_0:Play114111064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = "1097ui_story"

			if arg_255_1.actors_[var_258_0] == nil then
				local var_258_1 = Object.Instantiate(Asset.Load("Char/" .. var_258_0), arg_255_1.stage_.transform)

				var_258_1.name = var_258_0
				var_258_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_255_1.actors_[var_258_0] = var_258_1

				local var_258_2 = var_258_1:GetComponentInChildren(typeof(CharacterEffect))

				var_258_2.enabled = true

				local var_258_3 = GameObjectTools.GetOrAddComponent(var_258_1, typeof(DynamicBoneHelper))

				if var_258_3 then
					var_258_3:EnableDynamicBone(false)
				end

				arg_255_1:ShowWeapon(var_258_2.transform, false)

				arg_255_1.var_[var_258_0 .. "Animator"] = var_258_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_255_1.var_[var_258_0 .. "Animator"].applyRootMotion = true
				arg_255_1.var_[var_258_0 .. "LipSync"] = var_258_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_258_4 = arg_255_1.actors_["1097ui_story"].transform
			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 then
				arg_255_1.var_.moveOldPos1097ui_story = var_258_4.localPosition
			end

			local var_258_6 = 0.001

			if var_258_5 <= arg_255_1.time_ and arg_255_1.time_ < var_258_5 + var_258_6 then
				local var_258_7 = (arg_255_1.time_ - var_258_5) / var_258_6
				local var_258_8 = Vector3.New(-0.7, -0.54, -6.3)

				var_258_4.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1097ui_story, var_258_8, var_258_7)

				local var_258_9 = manager.ui.mainCamera.transform.position - var_258_4.position

				var_258_4.forward = Vector3.New(var_258_9.x, var_258_9.y, var_258_9.z)

				local var_258_10 = var_258_4.localEulerAngles

				var_258_10.z = 0
				var_258_10.x = 0
				var_258_4.localEulerAngles = var_258_10
			end

			if arg_255_1.time_ >= var_258_5 + var_258_6 and arg_255_1.time_ < var_258_5 + var_258_6 + arg_258_0 then
				var_258_4.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_258_11 = manager.ui.mainCamera.transform.position - var_258_4.position

				var_258_4.forward = Vector3.New(var_258_11.x, var_258_11.y, var_258_11.z)

				local var_258_12 = var_258_4.localEulerAngles

				var_258_12.z = 0
				var_258_12.x = 0
				var_258_4.localEulerAngles = var_258_12
			end

			local var_258_13 = 0

			if var_258_13 < arg_255_1.time_ and arg_255_1.time_ <= var_258_13 + arg_258_0 then
				arg_255_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_258_14 = 0

			if var_258_14 < arg_255_1.time_ and arg_255_1.time_ <= var_258_14 + arg_258_0 then
				arg_255_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_258_15 = arg_255_1.actors_["1097ui_story"]
			local var_258_16 = 0

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 and arg_255_1.var_.characterEffect1097ui_story == nil then
				arg_255_1.var_.characterEffect1097ui_story = var_258_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_17 = 0.2

			if var_258_16 <= arg_255_1.time_ and arg_255_1.time_ < var_258_16 + var_258_17 then
				local var_258_18 = (arg_255_1.time_ - var_258_16) / var_258_17

				if arg_255_1.var_.characterEffect1097ui_story then
					arg_255_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 and arg_255_1.var_.characterEffect1097ui_story then
				arg_255_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_258_19 = 0
			local var_258_20 = 0.175

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_21 = arg_255_1:FormatText(StoryNameCfg[216].name)

				arg_255_1.leftNameTxt_.text = var_258_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_22 = arg_255_1:GetWordFromCfg(114111063)
				local var_258_23 = arg_255_1:FormatText(var_258_22.content)

				arg_255_1.text_.text = var_258_23

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_24 = 7
				local var_258_25 = utf8.len(var_258_23)
				local var_258_26 = var_258_24 <= 0 and var_258_20 or var_258_20 * (var_258_25 / var_258_24)

				if var_258_26 > 0 and var_258_20 < var_258_26 then
					arg_255_1.talkMaxDuration = var_258_26

					if var_258_26 + var_258_19 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_26 + var_258_19
					end
				end

				arg_255_1.text_.text = var_258_23
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111063", "story_v_out_114111.awb") ~= 0 then
					local var_258_27 = manager.audio:GetVoiceLength("story_v_out_114111", "114111063", "story_v_out_114111.awb") / 1000

					if var_258_27 + var_258_19 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_27 + var_258_19
					end

					if var_258_22.prefab_name ~= "" and arg_255_1.actors_[var_258_22.prefab_name] ~= nil then
						local var_258_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_22.prefab_name].transform, "story_v_out_114111", "114111063", "story_v_out_114111.awb")

						arg_255_1:RecordAudio("114111063", var_258_28)
						arg_255_1:RecordAudio("114111063", var_258_28)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_114111", "114111063", "story_v_out_114111.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_114111", "114111063", "story_v_out_114111.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_29 = math.max(var_258_20, arg_255_1.talkMaxDuration)

			if var_258_19 <= arg_255_1.time_ and arg_255_1.time_ < var_258_19 + var_258_29 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_19) / var_258_29

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_19 + var_258_29 and arg_255_1.time_ < var_258_19 + var_258_29 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play114111064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 114111064
		arg_259_1.duration_ = 6.033

		local var_259_0 = {
			ja = 4.166,
			ko = 6.033,
			zh = 4.7,
			en = 5.533
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
				arg_259_0:Play114111065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1097ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1097ui_story == nil then
				arg_259_1.var_.characterEffect1097ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1097ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1097ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1097ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1097ui_story.fillRatio = var_262_5
			end

			local var_262_6 = "1184ui_story"

			if arg_259_1.actors_[var_262_6] == nil then
				local var_262_7 = Object.Instantiate(Asset.Load("Char/" .. var_262_6), arg_259_1.stage_.transform)

				var_262_7.name = var_262_6
				var_262_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_259_1.actors_[var_262_6] = var_262_7

				local var_262_8 = var_262_7:GetComponentInChildren(typeof(CharacterEffect))

				var_262_8.enabled = true

				local var_262_9 = GameObjectTools.GetOrAddComponent(var_262_7, typeof(DynamicBoneHelper))

				if var_262_9 then
					var_262_9:EnableDynamicBone(false)
				end

				arg_259_1:ShowWeapon(var_262_8.transform, false)

				arg_259_1.var_[var_262_6 .. "Animator"] = var_262_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_259_1.var_[var_262_6 .. "Animator"].applyRootMotion = true
				arg_259_1.var_[var_262_6 .. "LipSync"] = var_262_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_262_10 = arg_259_1.actors_["1184ui_story"].transform
			local var_262_11 = 0

			if var_262_11 < arg_259_1.time_ and arg_259_1.time_ <= var_262_11 + arg_262_0 then
				arg_259_1.var_.moveOldPos1184ui_story = var_262_10.localPosition

				local var_262_12 = "1184ui_story"

				arg_259_1:ShowWeapon(arg_259_1.var_[var_262_12 .. "Animator"].transform, true)
			end

			local var_262_13 = 0.001

			if var_262_11 <= arg_259_1.time_ and arg_259_1.time_ < var_262_11 + var_262_13 then
				local var_262_14 = (arg_259_1.time_ - var_262_11) / var_262_13
				local var_262_15 = Vector3.New(0.7, -0.97, -6)

				var_262_10.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1184ui_story, var_262_15, var_262_14)

				local var_262_16 = manager.ui.mainCamera.transform.position - var_262_10.position

				var_262_10.forward = Vector3.New(var_262_16.x, var_262_16.y, var_262_16.z)

				local var_262_17 = var_262_10.localEulerAngles

				var_262_17.z = 0
				var_262_17.x = 0
				var_262_10.localEulerAngles = var_262_17
			end

			if arg_259_1.time_ >= var_262_11 + var_262_13 and arg_259_1.time_ < var_262_11 + var_262_13 + arg_262_0 then
				var_262_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_262_18 = manager.ui.mainCamera.transform.position - var_262_10.position

				var_262_10.forward = Vector3.New(var_262_18.x, var_262_18.y, var_262_18.z)

				local var_262_19 = var_262_10.localEulerAngles

				var_262_19.z = 0
				var_262_19.x = 0
				var_262_10.localEulerAngles = var_262_19
			end

			local var_262_20 = 0

			if var_262_20 < arg_259_1.time_ and arg_259_1.time_ <= var_262_20 + arg_262_0 then
				arg_259_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_262_21 = 0

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 then
				arg_259_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_262_22 = arg_259_1.actors_["1184ui_story"]
			local var_262_23 = 0

			if var_262_23 < arg_259_1.time_ and arg_259_1.time_ <= var_262_23 + arg_262_0 and arg_259_1.var_.characterEffect1184ui_story == nil then
				arg_259_1.var_.characterEffect1184ui_story = var_262_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_24 = 0.2

			if var_262_23 <= arg_259_1.time_ and arg_259_1.time_ < var_262_23 + var_262_24 then
				local var_262_25 = (arg_259_1.time_ - var_262_23) / var_262_24

				if arg_259_1.var_.characterEffect1184ui_story then
					arg_259_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_23 + var_262_24 and arg_259_1.time_ < var_262_23 + var_262_24 + arg_262_0 and arg_259_1.var_.characterEffect1184ui_story then
				arg_259_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_262_26 = 0
			local var_262_27 = 0.7

			if var_262_26 < arg_259_1.time_ and arg_259_1.time_ <= var_262_26 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_28 = arg_259_1:FormatText(StoryNameCfg[6].name)

				arg_259_1.leftNameTxt_.text = var_262_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_29 = arg_259_1:GetWordFromCfg(114111064)
				local var_262_30 = arg_259_1:FormatText(var_262_29.content)

				arg_259_1.text_.text = var_262_30

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_31 = 28
				local var_262_32 = utf8.len(var_262_30)
				local var_262_33 = var_262_31 <= 0 and var_262_27 or var_262_27 * (var_262_32 / var_262_31)

				if var_262_33 > 0 and var_262_27 < var_262_33 then
					arg_259_1.talkMaxDuration = var_262_33

					if var_262_33 + var_262_26 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_33 + var_262_26
					end
				end

				arg_259_1.text_.text = var_262_30
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111064", "story_v_out_114111.awb") ~= 0 then
					local var_262_34 = manager.audio:GetVoiceLength("story_v_out_114111", "114111064", "story_v_out_114111.awb") / 1000

					if var_262_34 + var_262_26 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_34 + var_262_26
					end

					if var_262_29.prefab_name ~= "" and arg_259_1.actors_[var_262_29.prefab_name] ~= nil then
						local var_262_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_29.prefab_name].transform, "story_v_out_114111", "114111064", "story_v_out_114111.awb")

						arg_259_1:RecordAudio("114111064", var_262_35)
						arg_259_1:RecordAudio("114111064", var_262_35)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_114111", "114111064", "story_v_out_114111.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_114111", "114111064", "story_v_out_114111.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_36 = math.max(var_262_27, arg_259_1.talkMaxDuration)

			if var_262_26 <= arg_259_1.time_ and arg_259_1.time_ < var_262_26 + var_262_36 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_26) / var_262_36

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_26 + var_262_36 and arg_259_1.time_ < var_262_26 + var_262_36 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play114111065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 114111065
		arg_263_1.duration_ = 6.7

		local var_263_0 = {
			ja = 3.333,
			ko = 6.7,
			zh = 4.633,
			en = 3.466
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
				arg_263_0:Play114111066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1184ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1184ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, 100, 0)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1184ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, 100, 0)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1097ui_story"].transform
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 then
				arg_263_1.var_.moveOldPos1097ui_story = var_266_9.localPosition

				local var_266_11 = "1097ui_story"

				arg_263_1:ShowWeapon(arg_263_1.var_[var_266_11 .. "Animator"].transform, true)
			end

			local var_266_12 = 0.001

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_12 then
				local var_266_13 = (arg_263_1.time_ - var_266_10) / var_266_12
				local var_266_14 = Vector3.New(0, 100, 0)

				var_266_9.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1097ui_story, var_266_14, var_266_13)

				local var_266_15 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_15.x, var_266_15.y, var_266_15.z)

				local var_266_16 = var_266_9.localEulerAngles

				var_266_16.z = 0
				var_266_16.x = 0
				var_266_9.localEulerAngles = var_266_16
			end

			if arg_263_1.time_ >= var_266_10 + var_266_12 and arg_263_1.time_ < var_266_10 + var_266_12 + arg_266_0 then
				var_266_9.localPosition = Vector3.New(0, 100, 0)

				local var_266_17 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_17.x, var_266_17.y, var_266_17.z)

				local var_266_18 = var_266_9.localEulerAngles

				var_266_18.z = 0
				var_266_18.x = 0
				var_266_9.localEulerAngles = var_266_18
			end

			local var_266_19 = "1041ui_story"

			if arg_263_1.actors_[var_266_19] == nil then
				local var_266_20 = Object.Instantiate(Asset.Load("Char/" .. var_266_19), arg_263_1.stage_.transform)

				var_266_20.name = var_266_19
				var_266_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_263_1.actors_[var_266_19] = var_266_20

				local var_266_21 = var_266_20:GetComponentInChildren(typeof(CharacterEffect))

				var_266_21.enabled = true

				local var_266_22 = GameObjectTools.GetOrAddComponent(var_266_20, typeof(DynamicBoneHelper))

				if var_266_22 then
					var_266_22:EnableDynamicBone(false)
				end

				arg_263_1:ShowWeapon(var_266_21.transform, false)

				arg_263_1.var_[var_266_19 .. "Animator"] = var_266_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_263_1.var_[var_266_19 .. "Animator"].applyRootMotion = true
				arg_263_1.var_[var_266_19 .. "LipSync"] = var_266_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_266_23 = arg_263_1.actors_["1041ui_story"].transform
			local var_266_24 = 0

			if var_266_24 < arg_263_1.time_ and arg_263_1.time_ <= var_266_24 + arg_266_0 then
				arg_263_1.var_.moveOldPos1041ui_story = var_266_23.localPosition

				local var_266_25 = "1041ui_story"

				arg_263_1:ShowWeapon(arg_263_1.var_[var_266_25 .. "Animator"].transform, true)
			end

			local var_266_26 = 0.001

			if var_266_24 <= arg_263_1.time_ and arg_263_1.time_ < var_266_24 + var_266_26 then
				local var_266_27 = (arg_263_1.time_ - var_266_24) / var_266_26
				local var_266_28 = Vector3.New(-0.7, -1.11, -5.9)

				var_266_23.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1041ui_story, var_266_28, var_266_27)

				local var_266_29 = manager.ui.mainCamera.transform.position - var_266_23.position

				var_266_23.forward = Vector3.New(var_266_29.x, var_266_29.y, var_266_29.z)

				local var_266_30 = var_266_23.localEulerAngles

				var_266_30.z = 0
				var_266_30.x = 0
				var_266_23.localEulerAngles = var_266_30
			end

			if arg_263_1.time_ >= var_266_24 + var_266_26 and arg_263_1.time_ < var_266_24 + var_266_26 + arg_266_0 then
				var_266_23.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_266_31 = manager.ui.mainCamera.transform.position - var_266_23.position

				var_266_23.forward = Vector3.New(var_266_31.x, var_266_31.y, var_266_31.z)

				local var_266_32 = var_266_23.localEulerAngles

				var_266_32.z = 0
				var_266_32.x = 0
				var_266_23.localEulerAngles = var_266_32
			end

			local var_266_33 = 0

			if var_266_33 < arg_263_1.time_ and arg_263_1.time_ <= var_266_33 + arg_266_0 then
				arg_263_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_266_34 = 0

			if var_266_34 < arg_263_1.time_ and arg_263_1.time_ <= var_266_34 + arg_266_0 then
				arg_263_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_266_35 = arg_263_1.actors_["1041ui_story"]
			local var_266_36 = 0

			if var_266_36 < arg_263_1.time_ and arg_263_1.time_ <= var_266_36 + arg_266_0 and arg_263_1.var_.characterEffect1041ui_story == nil then
				arg_263_1.var_.characterEffect1041ui_story = var_266_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_37 = 0.2

			if var_266_36 <= arg_263_1.time_ and arg_263_1.time_ < var_266_36 + var_266_37 then
				local var_266_38 = (arg_263_1.time_ - var_266_36) / var_266_37

				if arg_263_1.var_.characterEffect1041ui_story then
					arg_263_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_36 + var_266_37 and arg_263_1.time_ < var_266_36 + var_266_37 + arg_266_0 and arg_263_1.var_.characterEffect1041ui_story then
				arg_263_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_266_39 = 0
			local var_266_40 = 0.6

			if var_266_39 < arg_263_1.time_ and arg_263_1.time_ <= var_266_39 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_41 = arg_263_1:FormatText(StoryNameCfg[208].name)

				arg_263_1.leftNameTxt_.text = var_266_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_42 = arg_263_1:GetWordFromCfg(114111065)
				local var_266_43 = arg_263_1:FormatText(var_266_42.content)

				arg_263_1.text_.text = var_266_43

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_44 = 24
				local var_266_45 = utf8.len(var_266_43)
				local var_266_46 = var_266_44 <= 0 and var_266_40 or var_266_40 * (var_266_45 / var_266_44)

				if var_266_46 > 0 and var_266_40 < var_266_46 then
					arg_263_1.talkMaxDuration = var_266_46

					if var_266_46 + var_266_39 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_46 + var_266_39
					end
				end

				arg_263_1.text_.text = var_266_43
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111065", "story_v_out_114111.awb") ~= 0 then
					local var_266_47 = manager.audio:GetVoiceLength("story_v_out_114111", "114111065", "story_v_out_114111.awb") / 1000

					if var_266_47 + var_266_39 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_47 + var_266_39
					end

					if var_266_42.prefab_name ~= "" and arg_263_1.actors_[var_266_42.prefab_name] ~= nil then
						local var_266_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_42.prefab_name].transform, "story_v_out_114111", "114111065", "story_v_out_114111.awb")

						arg_263_1:RecordAudio("114111065", var_266_48)
						arg_263_1:RecordAudio("114111065", var_266_48)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_114111", "114111065", "story_v_out_114111.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_114111", "114111065", "story_v_out_114111.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_49 = math.max(var_266_40, arg_263_1.talkMaxDuration)

			if var_266_39 <= arg_263_1.time_ and arg_263_1.time_ < var_266_39 + var_266_49 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_39) / var_266_49

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_39 + var_266_49 and arg_263_1.time_ < var_266_39 + var_266_49 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play114111066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 114111066
		arg_267_1.duration_ = 5.166

		local var_267_0 = {
			ja = 5.166,
			ko = 5,
			zh = 4.366,
			en = 2.2
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
				arg_267_0:Play114111067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = "1038ui_story"

			if arg_267_1.actors_[var_270_0] == nil then
				local var_270_1 = Object.Instantiate(Asset.Load("Char/" .. var_270_0), arg_267_1.stage_.transform)

				var_270_1.name = var_270_0
				var_270_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_267_1.actors_[var_270_0] = var_270_1

				local var_270_2 = var_270_1:GetComponentInChildren(typeof(CharacterEffect))

				var_270_2.enabled = true

				local var_270_3 = GameObjectTools.GetOrAddComponent(var_270_1, typeof(DynamicBoneHelper))

				if var_270_3 then
					var_270_3:EnableDynamicBone(false)
				end

				arg_267_1:ShowWeapon(var_270_2.transform, false)

				arg_267_1.var_[var_270_0 .. "Animator"] = var_270_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_267_1.var_[var_270_0 .. "Animator"].applyRootMotion = true
				arg_267_1.var_[var_270_0 .. "LipSync"] = var_270_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_270_4 = arg_267_1.actors_["1038ui_story"].transform
			local var_270_5 = 0

			if var_270_5 < arg_267_1.time_ and arg_267_1.time_ <= var_270_5 + arg_270_0 then
				arg_267_1.var_.moveOldPos1038ui_story = var_270_4.localPosition
			end

			local var_270_6 = 0.001

			if var_270_5 <= arg_267_1.time_ and arg_267_1.time_ < var_270_5 + var_270_6 then
				local var_270_7 = (arg_267_1.time_ - var_270_5) / var_270_6
				local var_270_8 = Vector3.New(0.7, -1.11, -5.9)

				var_270_4.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1038ui_story, var_270_8, var_270_7)

				local var_270_9 = manager.ui.mainCamera.transform.position - var_270_4.position

				var_270_4.forward = Vector3.New(var_270_9.x, var_270_9.y, var_270_9.z)

				local var_270_10 = var_270_4.localEulerAngles

				var_270_10.z = 0
				var_270_10.x = 0
				var_270_4.localEulerAngles = var_270_10
			end

			if arg_267_1.time_ >= var_270_5 + var_270_6 and arg_267_1.time_ < var_270_5 + var_270_6 + arg_270_0 then
				var_270_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_270_11 = manager.ui.mainCamera.transform.position - var_270_4.position

				var_270_4.forward = Vector3.New(var_270_11.x, var_270_11.y, var_270_11.z)

				local var_270_12 = var_270_4.localEulerAngles

				var_270_12.z = 0
				var_270_12.x = 0
				var_270_4.localEulerAngles = var_270_12
			end

			local var_270_13 = 0

			if var_270_13 < arg_267_1.time_ and arg_267_1.time_ <= var_270_13 + arg_270_0 then
				arg_267_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				arg_267_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_270_15 = arg_267_1.actors_["1038ui_story"]
			local var_270_16 = 0

			if var_270_16 < arg_267_1.time_ and arg_267_1.time_ <= var_270_16 + arg_270_0 and arg_267_1.var_.characterEffect1038ui_story == nil then
				arg_267_1.var_.characterEffect1038ui_story = var_270_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_17 = 0.2

			if var_270_16 <= arg_267_1.time_ and arg_267_1.time_ < var_270_16 + var_270_17 then
				local var_270_18 = (arg_267_1.time_ - var_270_16) / var_270_17

				if arg_267_1.var_.characterEffect1038ui_story then
					arg_267_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_16 + var_270_17 and arg_267_1.time_ < var_270_16 + var_270_17 + arg_270_0 and arg_267_1.var_.characterEffect1038ui_story then
				arg_267_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_270_19 = arg_267_1.actors_["1041ui_story"]
			local var_270_20 = 0

			if var_270_20 < arg_267_1.time_ and arg_267_1.time_ <= var_270_20 + arg_270_0 and arg_267_1.var_.characterEffect1041ui_story == nil then
				arg_267_1.var_.characterEffect1041ui_story = var_270_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_21 = 0.2

			if var_270_20 <= arg_267_1.time_ and arg_267_1.time_ < var_270_20 + var_270_21 then
				local var_270_22 = (arg_267_1.time_ - var_270_20) / var_270_21

				if arg_267_1.var_.characterEffect1041ui_story then
					local var_270_23 = Mathf.Lerp(0, 0.5, var_270_22)

					arg_267_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1041ui_story.fillRatio = var_270_23
				end
			end

			if arg_267_1.time_ >= var_270_20 + var_270_21 and arg_267_1.time_ < var_270_20 + var_270_21 + arg_270_0 and arg_267_1.var_.characterEffect1041ui_story then
				local var_270_24 = 0.5

				arg_267_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1041ui_story.fillRatio = var_270_24
			end

			local var_270_25 = 0
			local var_270_26 = 0.575

			if var_270_25 < arg_267_1.time_ and arg_267_1.time_ <= var_270_25 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_27 = arg_267_1:FormatText(StoryNameCfg[94].name)

				arg_267_1.leftNameTxt_.text = var_270_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_28 = arg_267_1:GetWordFromCfg(114111066)
				local var_270_29 = arg_267_1:FormatText(var_270_28.content)

				arg_267_1.text_.text = var_270_29

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_30 = 23
				local var_270_31 = utf8.len(var_270_29)
				local var_270_32 = var_270_30 <= 0 and var_270_26 or var_270_26 * (var_270_31 / var_270_30)

				if var_270_32 > 0 and var_270_26 < var_270_32 then
					arg_267_1.talkMaxDuration = var_270_32

					if var_270_32 + var_270_25 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_32 + var_270_25
					end
				end

				arg_267_1.text_.text = var_270_29
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111066", "story_v_out_114111.awb") ~= 0 then
					local var_270_33 = manager.audio:GetVoiceLength("story_v_out_114111", "114111066", "story_v_out_114111.awb") / 1000

					if var_270_33 + var_270_25 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_33 + var_270_25
					end

					if var_270_28.prefab_name ~= "" and arg_267_1.actors_[var_270_28.prefab_name] ~= nil then
						local var_270_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_28.prefab_name].transform, "story_v_out_114111", "114111066", "story_v_out_114111.awb")

						arg_267_1:RecordAudio("114111066", var_270_34)
						arg_267_1:RecordAudio("114111066", var_270_34)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_114111", "114111066", "story_v_out_114111.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_114111", "114111066", "story_v_out_114111.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_35 = math.max(var_270_26, arg_267_1.talkMaxDuration)

			if var_270_25 <= arg_267_1.time_ and arg_267_1.time_ < var_270_25 + var_270_35 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_25) / var_270_35

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_25 + var_270_35 and arg_267_1.time_ < var_270_25 + var_270_35 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play114111067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 114111067
		arg_271_1.duration_ = 5.833

		local var_271_0 = {
			ja = 5.833,
			ko = 4.7,
			zh = 4.766,
			en = 4.733
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
				arg_271_0:Play114111068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action8_1")
			end

			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_274_2 = arg_271_1.actors_["1041ui_story"]
			local var_274_3 = 0

			if var_274_3 < arg_271_1.time_ and arg_271_1.time_ <= var_274_3 + arg_274_0 and arg_271_1.var_.characterEffect1041ui_story == nil then
				arg_271_1.var_.characterEffect1041ui_story = var_274_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_4 = 0.2

			if var_274_3 <= arg_271_1.time_ and arg_271_1.time_ < var_274_3 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_3) / var_274_4

				if arg_271_1.var_.characterEffect1041ui_story then
					arg_271_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_3 + var_274_4 and arg_271_1.time_ < var_274_3 + var_274_4 + arg_274_0 and arg_271_1.var_.characterEffect1041ui_story then
				arg_271_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_274_6 = arg_271_1.actors_["1041ui_story"].transform
			local var_274_7 = 0

			if var_274_7 < arg_271_1.time_ and arg_271_1.time_ <= var_274_7 + arg_274_0 then
				arg_271_1.var_.moveOldPos1041ui_story = var_274_6.localPosition

				local var_274_8 = "1041ui_story"

				arg_271_1:ShowWeapon(arg_271_1.var_[var_274_8 .. "Animator"].transform, true)
			end

			local var_274_9 = 0.001

			if var_274_7 <= arg_271_1.time_ and arg_271_1.time_ < var_274_7 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_7) / var_274_9
				local var_274_11 = Vector3.New(-0.7, -1.11, -5.9)

				var_274_6.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1041ui_story, var_274_11, var_274_10)

				local var_274_12 = manager.ui.mainCamera.transform.position - var_274_6.position

				var_274_6.forward = Vector3.New(var_274_12.x, var_274_12.y, var_274_12.z)

				local var_274_13 = var_274_6.localEulerAngles

				var_274_13.z = 0
				var_274_13.x = 0
				var_274_6.localEulerAngles = var_274_13
			end

			if arg_271_1.time_ >= var_274_7 + var_274_9 and arg_271_1.time_ < var_274_7 + var_274_9 + arg_274_0 then
				var_274_6.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_274_14 = manager.ui.mainCamera.transform.position - var_274_6.position

				var_274_6.forward = Vector3.New(var_274_14.x, var_274_14.y, var_274_14.z)

				local var_274_15 = var_274_6.localEulerAngles

				var_274_15.z = 0
				var_274_15.x = 0
				var_274_6.localEulerAngles = var_274_15
			end

			local var_274_16 = arg_271_1.actors_["1038ui_story"]
			local var_274_17 = 0

			if var_274_17 < arg_271_1.time_ and arg_271_1.time_ <= var_274_17 + arg_274_0 and arg_271_1.var_.characterEffect1038ui_story == nil then
				arg_271_1.var_.characterEffect1038ui_story = var_274_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_18 = 0.2

			if var_274_17 <= arg_271_1.time_ and arg_271_1.time_ < var_274_17 + var_274_18 then
				local var_274_19 = (arg_271_1.time_ - var_274_17) / var_274_18

				if arg_271_1.var_.characterEffect1038ui_story then
					local var_274_20 = Mathf.Lerp(0, 0.5, var_274_19)

					arg_271_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1038ui_story.fillRatio = var_274_20
				end
			end

			if arg_271_1.time_ >= var_274_17 + var_274_18 and arg_271_1.time_ < var_274_17 + var_274_18 + arg_274_0 and arg_271_1.var_.characterEffect1038ui_story then
				local var_274_21 = 0.5

				arg_271_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1038ui_story.fillRatio = var_274_21
			end

			local var_274_22 = 0
			local var_274_23 = 0.525

			if var_274_22 < arg_271_1.time_ and arg_271_1.time_ <= var_274_22 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_24 = arg_271_1:FormatText(StoryNameCfg[208].name)

				arg_271_1.leftNameTxt_.text = var_274_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_25 = arg_271_1:GetWordFromCfg(114111067)
				local var_274_26 = arg_271_1:FormatText(var_274_25.content)

				arg_271_1.text_.text = var_274_26

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_27 = 21
				local var_274_28 = utf8.len(var_274_26)
				local var_274_29 = var_274_27 <= 0 and var_274_23 or var_274_23 * (var_274_28 / var_274_27)

				if var_274_29 > 0 and var_274_23 < var_274_29 then
					arg_271_1.talkMaxDuration = var_274_29

					if var_274_29 + var_274_22 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_29 + var_274_22
					end
				end

				arg_271_1.text_.text = var_274_26
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111067", "story_v_out_114111.awb") ~= 0 then
					local var_274_30 = manager.audio:GetVoiceLength("story_v_out_114111", "114111067", "story_v_out_114111.awb") / 1000

					if var_274_30 + var_274_22 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_30 + var_274_22
					end

					if var_274_25.prefab_name ~= "" and arg_271_1.actors_[var_274_25.prefab_name] ~= nil then
						local var_274_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_25.prefab_name].transform, "story_v_out_114111", "114111067", "story_v_out_114111.awb")

						arg_271_1:RecordAudio("114111067", var_274_31)
						arg_271_1:RecordAudio("114111067", var_274_31)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_114111", "114111067", "story_v_out_114111.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_114111", "114111067", "story_v_out_114111.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_32 = math.max(var_274_23, arg_271_1.talkMaxDuration)

			if var_274_22 <= arg_271_1.time_ and arg_271_1.time_ < var_274_22 + var_274_32 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_22) / var_274_32

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_22 + var_274_32 and arg_271_1.time_ < var_274_22 + var_274_32 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play114111068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 114111068
		arg_275_1.duration_ = 9

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play114111069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.mask_.enabled = true
				arg_275_1.mask_.raycastTarget = true

				arg_275_1:SetGaussion(false)
			end

			local var_278_1 = 2

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_1 then
				local var_278_2 = (arg_275_1.time_ - var_278_0) / var_278_1
				local var_278_3 = Color.New(0, 0, 0)

				var_278_3.a = Mathf.Lerp(0, 1, var_278_2)
				arg_275_1.mask_.color = var_278_3
			end

			if arg_275_1.time_ >= var_278_0 + var_278_1 and arg_275_1.time_ < var_278_0 + var_278_1 + arg_278_0 then
				local var_278_4 = Color.New(0, 0, 0)

				var_278_4.a = 1
				arg_275_1.mask_.color = var_278_4
			end

			local var_278_5 = 2

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 then
				arg_275_1.mask_.enabled = true
				arg_275_1.mask_.raycastTarget = true

				arg_275_1:SetGaussion(false)
			end

			local var_278_6 = 2

			if var_278_5 <= arg_275_1.time_ and arg_275_1.time_ < var_278_5 + var_278_6 then
				local var_278_7 = (arg_275_1.time_ - var_278_5) / var_278_6
				local var_278_8 = Color.New(0, 0, 0)

				var_278_8.a = Mathf.Lerp(1, 0, var_278_7)
				arg_275_1.mask_.color = var_278_8
			end

			if arg_275_1.time_ >= var_278_5 + var_278_6 and arg_275_1.time_ < var_278_5 + var_278_6 + arg_278_0 then
				local var_278_9 = Color.New(0, 0, 0)
				local var_278_10 = 0

				arg_275_1.mask_.enabled = false
				var_278_9.a = var_278_10
				arg_275_1.mask_.color = var_278_9
			end

			local var_278_11 = arg_275_1.actors_["1041ui_story"].transform
			local var_278_12 = 1.966

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.var_.moveOldPos1041ui_story = var_278_11.localPosition

				local var_278_13 = "1041ui_story"

				arg_275_1:ShowWeapon(arg_275_1.var_[var_278_13 .. "Animator"].transform, false)
			end

			local var_278_14 = 0.001

			if var_278_12 <= arg_275_1.time_ and arg_275_1.time_ < var_278_12 + var_278_14 then
				local var_278_15 = (arg_275_1.time_ - var_278_12) / var_278_14
				local var_278_16 = Vector3.New(0, 100, 0)

				var_278_11.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1041ui_story, var_278_16, var_278_15)

				local var_278_17 = manager.ui.mainCamera.transform.position - var_278_11.position

				var_278_11.forward = Vector3.New(var_278_17.x, var_278_17.y, var_278_17.z)

				local var_278_18 = var_278_11.localEulerAngles

				var_278_18.z = 0
				var_278_18.x = 0
				var_278_11.localEulerAngles = var_278_18
			end

			if arg_275_1.time_ >= var_278_12 + var_278_14 and arg_275_1.time_ < var_278_12 + var_278_14 + arg_278_0 then
				var_278_11.localPosition = Vector3.New(0, 100, 0)

				local var_278_19 = manager.ui.mainCamera.transform.position - var_278_11.position

				var_278_11.forward = Vector3.New(var_278_19.x, var_278_19.y, var_278_19.z)

				local var_278_20 = var_278_11.localEulerAngles

				var_278_20.z = 0
				var_278_20.x = 0
				var_278_11.localEulerAngles = var_278_20
			end

			local var_278_21 = arg_275_1.actors_["1038ui_story"].transform
			local var_278_22 = 1.966

			if var_278_22 < arg_275_1.time_ and arg_275_1.time_ <= var_278_22 + arg_278_0 then
				arg_275_1.var_.moveOldPos1038ui_story = var_278_21.localPosition
			end

			local var_278_23 = 0.001

			if var_278_22 <= arg_275_1.time_ and arg_275_1.time_ < var_278_22 + var_278_23 then
				local var_278_24 = (arg_275_1.time_ - var_278_22) / var_278_23
				local var_278_25 = Vector3.New(0, 100, 0)

				var_278_21.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1038ui_story, var_278_25, var_278_24)

				local var_278_26 = manager.ui.mainCamera.transform.position - var_278_21.position

				var_278_21.forward = Vector3.New(var_278_26.x, var_278_26.y, var_278_26.z)

				local var_278_27 = var_278_21.localEulerAngles

				var_278_27.z = 0
				var_278_27.x = 0
				var_278_21.localEulerAngles = var_278_27
			end

			if arg_275_1.time_ >= var_278_22 + var_278_23 and arg_275_1.time_ < var_278_22 + var_278_23 + arg_278_0 then
				var_278_21.localPosition = Vector3.New(0, 100, 0)

				local var_278_28 = manager.ui.mainCamera.transform.position - var_278_21.position

				var_278_21.forward = Vector3.New(var_278_28.x, var_278_28.y, var_278_28.z)

				local var_278_29 = var_278_21.localEulerAngles

				var_278_29.z = 0
				var_278_29.x = 0
				var_278_21.localEulerAngles = var_278_29
			end

			if arg_275_1.frameCnt_ <= 1 then
				arg_275_1.dialog_:SetActive(false)
			end

			local var_278_30 = 4
			local var_278_31 = 0.6

			if var_278_30 < arg_275_1.time_ and arg_275_1.time_ <= var_278_30 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0

				arg_275_1.dialog_:SetActive(true)

				local var_278_32 = LeanTween.value(arg_275_1.dialog_, 0, 1, 0.3)

				var_278_32:setOnUpdate(LuaHelper.FloatAction(function(arg_279_0)
					arg_275_1.dialogCg_.alpha = arg_279_0
				end))
				var_278_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_275_1.dialog_)
					var_278_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_275_1.duration_ = arg_275_1.duration_ + 0.3

				SetActive(arg_275_1.leftNameGo_, false)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_33 = arg_275_1:GetWordFromCfg(114111068)
				local var_278_34 = arg_275_1:FormatText(var_278_33.content)

				arg_275_1.text_.text = var_278_34

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_35 = 24
				local var_278_36 = utf8.len(var_278_34)
				local var_278_37 = var_278_35 <= 0 and var_278_31 or var_278_31 * (var_278_36 / var_278_35)

				if var_278_37 > 0 and var_278_31 < var_278_37 then
					arg_275_1.talkMaxDuration = var_278_37
					var_278_30 = var_278_30 + 0.3

					if var_278_37 + var_278_30 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_37 + var_278_30
					end
				end

				arg_275_1.text_.text = var_278_34
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_38 = var_278_30 + 0.3
			local var_278_39 = math.max(var_278_31, arg_275_1.talkMaxDuration)

			if var_278_38 <= arg_275_1.time_ and arg_275_1.time_ < var_278_38 + var_278_39 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_38) / var_278_39

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_38 + var_278_39 and arg_275_1.time_ < var_278_38 + var_278_39 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play114111069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 114111069
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play114111070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.775

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_2 = arg_281_1:GetWordFromCfg(114111069)
				local var_284_3 = arg_281_1:FormatText(var_284_2.content)

				arg_281_1.text_.text = var_284_3

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_4 = 31
				local var_284_5 = utf8.len(var_284_3)
				local var_284_6 = var_284_4 <= 0 and var_284_1 or var_284_1 * (var_284_5 / var_284_4)

				if var_284_6 > 0 and var_284_1 < var_284_6 then
					arg_281_1.talkMaxDuration = var_284_6

					if var_284_6 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_6 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_3
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_7 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_7 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_7

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_7 and arg_281_1.time_ < var_284_0 + var_284_7 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play114111070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 114111070
		arg_285_1.duration_ = 6.366

		local var_285_0 = {
			ja = 6.2,
			ko = 4.633,
			zh = 6.366,
			en = 4.6
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
				arg_285_0:Play114111071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.35

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[212].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(114111070)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111070", "story_v_out_114111.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111070", "story_v_out_114111.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_114111", "114111070", "story_v_out_114111.awb")

						arg_285_1:RecordAudio("114111070", var_288_9)
						arg_285_1:RecordAudio("114111070", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_114111", "114111070", "story_v_out_114111.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_114111", "114111070", "story_v_out_114111.awb")
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
	Play114111071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 114111071
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play114111072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 1.25

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_2 = arg_289_1:GetWordFromCfg(114111071)
				local var_292_3 = arg_289_1:FormatText(var_292_2.content)

				arg_289_1.text_.text = var_292_3

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_4 = 51
				local var_292_5 = utf8.len(var_292_3)
				local var_292_6 = var_292_4 <= 0 and var_292_1 or var_292_1 * (var_292_5 / var_292_4)

				if var_292_6 > 0 and var_292_1 < var_292_6 then
					arg_289_1.talkMaxDuration = var_292_6

					if var_292_6 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_6 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_3
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_7 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_7 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_7

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_7 and arg_289_1.time_ < var_292_0 + var_292_7 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play114111072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 114111072
		arg_293_1.duration_ = 13.3

		local var_293_0 = {
			ja = 7.966,
			ko = 9.4,
			zh = 13.3,
			en = 8.366
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
				arg_293_0:Play114111073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = "10006ui_story"

			if arg_293_1.actors_[var_296_0] == nil then
				local var_296_1 = Object.Instantiate(Asset.Load("Char/" .. var_296_0), arg_293_1.stage_.transform)

				var_296_1.name = var_296_0
				var_296_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_293_1.actors_[var_296_0] = var_296_1

				local var_296_2 = var_296_1:GetComponentInChildren(typeof(CharacterEffect))

				var_296_2.enabled = true

				local var_296_3 = GameObjectTools.GetOrAddComponent(var_296_1, typeof(DynamicBoneHelper))

				if var_296_3 then
					var_296_3:EnableDynamicBone(false)
				end

				arg_293_1:ShowWeapon(var_296_2.transform, false)

				arg_293_1.var_[var_296_0 .. "Animator"] = var_296_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_293_1.var_[var_296_0 .. "Animator"].applyRootMotion = true
				arg_293_1.var_[var_296_0 .. "LipSync"] = var_296_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_296_4 = arg_293_1.actors_["10006ui_story"].transform
			local var_296_5 = 0

			if var_296_5 < arg_293_1.time_ and arg_293_1.time_ <= var_296_5 + arg_296_0 then
				arg_293_1.var_.moveOldPos10006ui_story = var_296_4.localPosition
			end

			local var_296_6 = 0.001

			if var_296_5 <= arg_293_1.time_ and arg_293_1.time_ < var_296_5 + var_296_6 then
				local var_296_7 = (arg_293_1.time_ - var_296_5) / var_296_6
				local var_296_8 = Vector3.New(-0.7, -0.98, -5.65)

				var_296_4.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10006ui_story, var_296_8, var_296_7)

				local var_296_9 = manager.ui.mainCamera.transform.position - var_296_4.position

				var_296_4.forward = Vector3.New(var_296_9.x, var_296_9.y, var_296_9.z)

				local var_296_10 = var_296_4.localEulerAngles

				var_296_10.z = 0
				var_296_10.x = 0
				var_296_4.localEulerAngles = var_296_10
			end

			if arg_293_1.time_ >= var_296_5 + var_296_6 and arg_293_1.time_ < var_296_5 + var_296_6 + arg_296_0 then
				var_296_4.localPosition = Vector3.New(-0.7, -0.98, -5.65)

				local var_296_11 = manager.ui.mainCamera.transform.position - var_296_4.position

				var_296_4.forward = Vector3.New(var_296_11.x, var_296_11.y, var_296_11.z)

				local var_296_12 = var_296_4.localEulerAngles

				var_296_12.z = 0
				var_296_12.x = 0
				var_296_4.localEulerAngles = var_296_12
			end

			local var_296_13 = 0

			if var_296_13 < arg_293_1.time_ and arg_293_1.time_ <= var_296_13 + arg_296_0 then
				arg_293_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_296_15 = arg_293_1.actors_["10006ui_story"]
			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 and arg_293_1.var_.characterEffect10006ui_story == nil then
				arg_293_1.var_.characterEffect10006ui_story = var_296_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_17 = 0.2

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17

				if arg_293_1.var_.characterEffect10006ui_story then
					arg_293_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 and arg_293_1.var_.characterEffect10006ui_story then
				arg_293_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_296_19 = 0
			local var_296_20 = 0.775

			if var_296_19 < arg_293_1.time_ and arg_293_1.time_ <= var_296_19 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_21 = arg_293_1:FormatText(StoryNameCfg[212].name)

				arg_293_1.leftNameTxt_.text = var_296_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_22 = arg_293_1:GetWordFromCfg(114111072)
				local var_296_23 = arg_293_1:FormatText(var_296_22.content)

				arg_293_1.text_.text = var_296_23

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_24 = 31
				local var_296_25 = utf8.len(var_296_23)
				local var_296_26 = var_296_24 <= 0 and var_296_20 or var_296_20 * (var_296_25 / var_296_24)

				if var_296_26 > 0 and var_296_20 < var_296_26 then
					arg_293_1.talkMaxDuration = var_296_26

					if var_296_26 + var_296_19 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_26 + var_296_19
					end
				end

				arg_293_1.text_.text = var_296_23
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111072", "story_v_out_114111.awb") ~= 0 then
					local var_296_27 = manager.audio:GetVoiceLength("story_v_out_114111", "114111072", "story_v_out_114111.awb") / 1000

					if var_296_27 + var_296_19 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_27 + var_296_19
					end

					if var_296_22.prefab_name ~= "" and arg_293_1.actors_[var_296_22.prefab_name] ~= nil then
						local var_296_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_22.prefab_name].transform, "story_v_out_114111", "114111072", "story_v_out_114111.awb")

						arg_293_1:RecordAudio("114111072", var_296_28)
						arg_293_1:RecordAudio("114111072", var_296_28)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_114111", "114111072", "story_v_out_114111.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_114111", "114111072", "story_v_out_114111.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_29 = math.max(var_296_20, arg_293_1.talkMaxDuration)

			if var_296_19 <= arg_293_1.time_ and arg_293_1.time_ < var_296_19 + var_296_29 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_19) / var_296_29

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_19 + var_296_29 and arg_293_1.time_ < var_296_19 + var_296_29 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play114111073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 114111073
		arg_297_1.duration_ = 13.3

		local var_297_0 = {
			ja = 13.3,
			ko = 9.5,
			zh = 7.466,
			en = 8.666
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
				arg_297_0:Play114111074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action5_1")
			end

			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_300_2 = 0
			local var_300_3 = 0.725

			if var_300_2 < arg_297_1.time_ and arg_297_1.time_ <= var_300_2 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_4 = arg_297_1:FormatText(StoryNameCfg[212].name)

				arg_297_1.leftNameTxt_.text = var_300_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_5 = arg_297_1:GetWordFromCfg(114111073)
				local var_300_6 = arg_297_1:FormatText(var_300_5.content)

				arg_297_1.text_.text = var_300_6

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_7 = 29
				local var_300_8 = utf8.len(var_300_6)
				local var_300_9 = var_300_7 <= 0 and var_300_3 or var_300_3 * (var_300_8 / var_300_7)

				if var_300_9 > 0 and var_300_3 < var_300_9 then
					arg_297_1.talkMaxDuration = var_300_9

					if var_300_9 + var_300_2 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_9 + var_300_2
					end
				end

				arg_297_1.text_.text = var_300_6
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111073", "story_v_out_114111.awb") ~= 0 then
					local var_300_10 = manager.audio:GetVoiceLength("story_v_out_114111", "114111073", "story_v_out_114111.awb") / 1000

					if var_300_10 + var_300_2 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_10 + var_300_2
					end

					if var_300_5.prefab_name ~= "" and arg_297_1.actors_[var_300_5.prefab_name] ~= nil then
						local var_300_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_5.prefab_name].transform, "story_v_out_114111", "114111073", "story_v_out_114111.awb")

						arg_297_1:RecordAudio("114111073", var_300_11)
						arg_297_1:RecordAudio("114111073", var_300_11)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_114111", "114111073", "story_v_out_114111.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_114111", "114111073", "story_v_out_114111.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_12 = math.max(var_300_3, arg_297_1.talkMaxDuration)

			if var_300_2 <= arg_297_1.time_ and arg_297_1.time_ < var_300_2 + var_300_12 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_2) / var_300_12

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_2 + var_300_12 and arg_297_1.time_ < var_300_2 + var_300_12 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play114111074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 114111074
		arg_301_1.duration_ = 5.333

		local var_301_0 = {
			ja = 5.333,
			ko = 3.266,
			zh = 4.566,
			en = 4.9
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
				arg_301_0:Play114111075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action5_2")
			end

			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_304_2 = 0
			local var_304_3 = 0.325

			if var_304_2 < arg_301_1.time_ and arg_301_1.time_ <= var_304_2 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_4 = arg_301_1:FormatText(StoryNameCfg[212].name)

				arg_301_1.leftNameTxt_.text = var_304_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_5 = arg_301_1:GetWordFromCfg(114111074)
				local var_304_6 = arg_301_1:FormatText(var_304_5.content)

				arg_301_1.text_.text = var_304_6

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_7 = 13
				local var_304_8 = utf8.len(var_304_6)
				local var_304_9 = var_304_7 <= 0 and var_304_3 or var_304_3 * (var_304_8 / var_304_7)

				if var_304_9 > 0 and var_304_3 < var_304_9 then
					arg_301_1.talkMaxDuration = var_304_9

					if var_304_9 + var_304_2 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_9 + var_304_2
					end
				end

				arg_301_1.text_.text = var_304_6
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111074", "story_v_out_114111.awb") ~= 0 then
					local var_304_10 = manager.audio:GetVoiceLength("story_v_out_114111", "114111074", "story_v_out_114111.awb") / 1000

					if var_304_10 + var_304_2 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_10 + var_304_2
					end

					if var_304_5.prefab_name ~= "" and arg_301_1.actors_[var_304_5.prefab_name] ~= nil then
						local var_304_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_5.prefab_name].transform, "story_v_out_114111", "114111074", "story_v_out_114111.awb")

						arg_301_1:RecordAudio("114111074", var_304_11)
						arg_301_1:RecordAudio("114111074", var_304_11)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_114111", "114111074", "story_v_out_114111.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_114111", "114111074", "story_v_out_114111.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_12 = math.max(var_304_3, arg_301_1.talkMaxDuration)

			if var_304_2 <= arg_301_1.time_ and arg_301_1.time_ < var_304_2 + var_304_12 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_2) / var_304_12

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_2 + var_304_12 and arg_301_1.time_ < var_304_2 + var_304_12 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play114111075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 114111075
		arg_305_1.duration_ = 3.066

		local var_305_0 = {
			ja = 1.999999999999,
			ko = 3.066,
			zh = 2.6,
			en = 2.266
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
				arg_305_0:Play114111076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1097ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1097ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0.7, -0.54, -6.3)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1097ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = 0

			if var_308_9 < arg_305_1.time_ and arg_305_1.time_ <= var_308_9 + arg_308_0 then
				arg_305_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 then
				arg_305_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_308_11 = arg_305_1.actors_["1097ui_story"]
			local var_308_12 = 0

			if var_308_12 < arg_305_1.time_ and arg_305_1.time_ <= var_308_12 + arg_308_0 and arg_305_1.var_.characterEffect1097ui_story == nil then
				arg_305_1.var_.characterEffect1097ui_story = var_308_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_13 = 0.2

			if var_308_12 <= arg_305_1.time_ and arg_305_1.time_ < var_308_12 + var_308_13 then
				local var_308_14 = (arg_305_1.time_ - var_308_12) / var_308_13

				if arg_305_1.var_.characterEffect1097ui_story then
					arg_305_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_12 + var_308_13 and arg_305_1.time_ < var_308_12 + var_308_13 + arg_308_0 and arg_305_1.var_.characterEffect1097ui_story then
				arg_305_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_308_15 = arg_305_1.actors_["10006ui_story"]
			local var_308_16 = 0

			if var_308_16 < arg_305_1.time_ and arg_305_1.time_ <= var_308_16 + arg_308_0 and arg_305_1.var_.characterEffect10006ui_story == nil then
				arg_305_1.var_.characterEffect10006ui_story = var_308_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_17 = 0.2

			if var_308_16 <= arg_305_1.time_ and arg_305_1.time_ < var_308_16 + var_308_17 then
				local var_308_18 = (arg_305_1.time_ - var_308_16) / var_308_17

				if arg_305_1.var_.characterEffect10006ui_story then
					local var_308_19 = Mathf.Lerp(0, 0.5, var_308_18)

					arg_305_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_305_1.var_.characterEffect10006ui_story.fillRatio = var_308_19
				end
			end

			if arg_305_1.time_ >= var_308_16 + var_308_17 and arg_305_1.time_ < var_308_16 + var_308_17 + arg_308_0 and arg_305_1.var_.characterEffect10006ui_story then
				local var_308_20 = 0.5

				arg_305_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_305_1.var_.characterEffect10006ui_story.fillRatio = var_308_20
			end

			local var_308_21 = 0
			local var_308_22 = 0.2

			if var_308_21 < arg_305_1.time_ and arg_305_1.time_ <= var_308_21 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_23 = arg_305_1:FormatText(StoryNameCfg[216].name)

				arg_305_1.leftNameTxt_.text = var_308_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_24 = arg_305_1:GetWordFromCfg(114111075)
				local var_308_25 = arg_305_1:FormatText(var_308_24.content)

				arg_305_1.text_.text = var_308_25

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_26 = 8
				local var_308_27 = utf8.len(var_308_25)
				local var_308_28 = var_308_26 <= 0 and var_308_22 or var_308_22 * (var_308_27 / var_308_26)

				if var_308_28 > 0 and var_308_22 < var_308_28 then
					arg_305_1.talkMaxDuration = var_308_28

					if var_308_28 + var_308_21 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_28 + var_308_21
					end
				end

				arg_305_1.text_.text = var_308_25
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111075", "story_v_out_114111.awb") ~= 0 then
					local var_308_29 = manager.audio:GetVoiceLength("story_v_out_114111", "114111075", "story_v_out_114111.awb") / 1000

					if var_308_29 + var_308_21 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_29 + var_308_21
					end

					if var_308_24.prefab_name ~= "" and arg_305_1.actors_[var_308_24.prefab_name] ~= nil then
						local var_308_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_24.prefab_name].transform, "story_v_out_114111", "114111075", "story_v_out_114111.awb")

						arg_305_1:RecordAudio("114111075", var_308_30)
						arg_305_1:RecordAudio("114111075", var_308_30)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_114111", "114111075", "story_v_out_114111.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_114111", "114111075", "story_v_out_114111.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_31 = math.max(var_308_22, arg_305_1.talkMaxDuration)

			if var_308_21 <= arg_305_1.time_ and arg_305_1.time_ < var_308_21 + var_308_31 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_21) / var_308_31

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_21 + var_308_31 and arg_305_1.time_ < var_308_21 + var_308_31 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play114111076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 114111076
		arg_309_1.duration_ = 9.433

		local var_309_0 = {
			ja = 7.9,
			ko = 7.3,
			zh = 9.433,
			en = 7.3
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
				arg_309_0:Play114111077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["10006ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos10006ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, 100, 0)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10006ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, 100, 0)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1097ui_story"].transform
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 then
				arg_309_1.var_.moveOldPos1097ui_story = var_312_9.localPosition
			end

			local var_312_11 = 0.001

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11
				local var_312_13 = Vector3.New(0, 100, 0)

				var_312_9.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1097ui_story, var_312_13, var_312_12)

				local var_312_14 = manager.ui.mainCamera.transform.position - var_312_9.position

				var_312_9.forward = Vector3.New(var_312_14.x, var_312_14.y, var_312_14.z)

				local var_312_15 = var_312_9.localEulerAngles

				var_312_15.z = 0
				var_312_15.x = 0
				var_312_9.localEulerAngles = var_312_15
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 then
				var_312_9.localPosition = Vector3.New(0, 100, 0)

				local var_312_16 = manager.ui.mainCamera.transform.position - var_312_9.position

				var_312_9.forward = Vector3.New(var_312_16.x, var_312_16.y, var_312_16.z)

				local var_312_17 = var_312_9.localEulerAngles

				var_312_17.z = 0
				var_312_17.x = 0
				var_312_9.localEulerAngles = var_312_17
			end

			local var_312_18 = 0
			local var_312_19 = 0.575

			if var_312_18 < arg_309_1.time_ and arg_309_1.time_ <= var_312_18 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_20 = arg_309_1:FormatText(StoryNameCfg[212].name)

				arg_309_1.leftNameTxt_.text = var_312_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, true)
				arg_309_1.iconController_:SetSelectedState("hero")

				arg_309_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_21 = arg_309_1:GetWordFromCfg(114111076)
				local var_312_22 = arg_309_1:FormatText(var_312_21.content)

				arg_309_1.text_.text = var_312_22

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_23 = 23
				local var_312_24 = utf8.len(var_312_22)
				local var_312_25 = var_312_23 <= 0 and var_312_19 or var_312_19 * (var_312_24 / var_312_23)

				if var_312_25 > 0 and var_312_19 < var_312_25 then
					arg_309_1.talkMaxDuration = var_312_25

					if var_312_25 + var_312_18 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_25 + var_312_18
					end
				end

				arg_309_1.text_.text = var_312_22
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111076", "story_v_out_114111.awb") ~= 0 then
					local var_312_26 = manager.audio:GetVoiceLength("story_v_out_114111", "114111076", "story_v_out_114111.awb") / 1000

					if var_312_26 + var_312_18 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_26 + var_312_18
					end

					if var_312_21.prefab_name ~= "" and arg_309_1.actors_[var_312_21.prefab_name] ~= nil then
						local var_312_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_21.prefab_name].transform, "story_v_out_114111", "114111076", "story_v_out_114111.awb")

						arg_309_1:RecordAudio("114111076", var_312_27)
						arg_309_1:RecordAudio("114111076", var_312_27)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_114111", "114111076", "story_v_out_114111.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_114111", "114111076", "story_v_out_114111.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_28 = math.max(var_312_19, arg_309_1.talkMaxDuration)

			if var_312_18 <= arg_309_1.time_ and arg_309_1.time_ < var_312_18 + var_312_28 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_18) / var_312_28

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_18 + var_312_28 and arg_309_1.time_ < var_312_18 + var_312_28 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play114111077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 114111077
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play114111078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.95

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_2 = arg_313_1:GetWordFromCfg(114111077)
				local var_316_3 = arg_313_1:FormatText(var_316_2.content)

				arg_313_1.text_.text = var_316_3

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_4 = 38
				local var_316_5 = utf8.len(var_316_3)
				local var_316_6 = var_316_4 <= 0 and var_316_1 or var_316_1 * (var_316_5 / var_316_4)

				if var_316_6 > 0 and var_316_1 < var_316_6 then
					arg_313_1.talkMaxDuration = var_316_6

					if var_316_6 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_6 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_3
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_7 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_7 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_7

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_7 and arg_313_1.time_ < var_316_0 + var_316_7 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play114111078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 114111078
		arg_317_1.duration_ = 9.9

		local var_317_0 = {
			ja = 8.966,
			ko = 9.9,
			zh = 8.8,
			en = 8.133
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
				arg_317_0:Play114111079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1041ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos1041ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1041ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = 0

			if var_320_9 < arg_317_1.time_ and arg_317_1.time_ <= var_320_9 + arg_320_0 then
				arg_317_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_320_11 = arg_317_1.actors_["1041ui_story"]
			local var_320_12 = 0

			if var_320_12 < arg_317_1.time_ and arg_317_1.time_ <= var_320_12 + arg_320_0 and arg_317_1.var_.characterEffect1041ui_story == nil then
				arg_317_1.var_.characterEffect1041ui_story = var_320_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_13 = 0.2

			if var_320_12 <= arg_317_1.time_ and arg_317_1.time_ < var_320_12 + var_320_13 then
				local var_320_14 = (arg_317_1.time_ - var_320_12) / var_320_13

				if arg_317_1.var_.characterEffect1041ui_story then
					arg_317_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_12 + var_320_13 and arg_317_1.time_ < var_320_12 + var_320_13 + arg_320_0 and arg_317_1.var_.characterEffect1041ui_story then
				arg_317_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_320_15 = 0
			local var_320_16 = 0.95

			if var_320_15 < arg_317_1.time_ and arg_317_1.time_ <= var_320_15 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_17 = arg_317_1:FormatText(StoryNameCfg[208].name)

				arg_317_1.leftNameTxt_.text = var_320_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_18 = arg_317_1:GetWordFromCfg(114111078)
				local var_320_19 = arg_317_1:FormatText(var_320_18.content)

				arg_317_1.text_.text = var_320_19

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_20 = 38
				local var_320_21 = utf8.len(var_320_19)
				local var_320_22 = var_320_20 <= 0 and var_320_16 or var_320_16 * (var_320_21 / var_320_20)

				if var_320_22 > 0 and var_320_16 < var_320_22 then
					arg_317_1.talkMaxDuration = var_320_22

					if var_320_22 + var_320_15 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_22 + var_320_15
					end
				end

				arg_317_1.text_.text = var_320_19
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111078", "story_v_out_114111.awb") ~= 0 then
					local var_320_23 = manager.audio:GetVoiceLength("story_v_out_114111", "114111078", "story_v_out_114111.awb") / 1000

					if var_320_23 + var_320_15 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_23 + var_320_15
					end

					if var_320_18.prefab_name ~= "" and arg_317_1.actors_[var_320_18.prefab_name] ~= nil then
						local var_320_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_18.prefab_name].transform, "story_v_out_114111", "114111078", "story_v_out_114111.awb")

						arg_317_1:RecordAudio("114111078", var_320_24)
						arg_317_1:RecordAudio("114111078", var_320_24)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_114111", "114111078", "story_v_out_114111.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_114111", "114111078", "story_v_out_114111.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_25 = math.max(var_320_16, arg_317_1.talkMaxDuration)

			if var_320_15 <= arg_317_1.time_ and arg_317_1.time_ < var_320_15 + var_320_25 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_15) / var_320_25

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_15 + var_320_25 and arg_317_1.time_ < var_320_15 + var_320_25 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play114111079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 114111079
		arg_321_1.duration_ = 2.5

		local var_321_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.5,
			en = 1.999999999999
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play114111080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1041ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1041ui_story == nil then
				arg_321_1.var_.characterEffect1041ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.2

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1041ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1041ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1041ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1041ui_story.fillRatio = var_324_5
			end

			local var_324_6 = arg_321_1.actors_["10006ui_story"].transform
			local var_324_7 = 0

			if var_324_7 < arg_321_1.time_ and arg_321_1.time_ <= var_324_7 + arg_324_0 then
				arg_321_1.var_.moveOldPos10006ui_story = var_324_6.localPosition
			end

			local var_324_8 = 0.001

			if var_324_7 <= arg_321_1.time_ and arg_321_1.time_ < var_324_7 + var_324_8 then
				local var_324_9 = (arg_321_1.time_ - var_324_7) / var_324_8
				local var_324_10 = Vector3.New(0.7, -0.98, -5.65)

				var_324_6.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos10006ui_story, var_324_10, var_324_9)

				local var_324_11 = manager.ui.mainCamera.transform.position - var_324_6.position

				var_324_6.forward = Vector3.New(var_324_11.x, var_324_11.y, var_324_11.z)

				local var_324_12 = var_324_6.localEulerAngles

				var_324_12.z = 0
				var_324_12.x = 0
				var_324_6.localEulerAngles = var_324_12
			end

			if arg_321_1.time_ >= var_324_7 + var_324_8 and arg_321_1.time_ < var_324_7 + var_324_8 + arg_324_0 then
				var_324_6.localPosition = Vector3.New(0.7, -0.98, -5.65)

				local var_324_13 = manager.ui.mainCamera.transform.position - var_324_6.position

				var_324_6.forward = Vector3.New(var_324_13.x, var_324_13.y, var_324_13.z)

				local var_324_14 = var_324_6.localEulerAngles

				var_324_14.z = 0
				var_324_14.x = 0
				var_324_6.localEulerAngles = var_324_14
			end

			local var_324_15 = 0

			if var_324_15 < arg_321_1.time_ and arg_321_1.time_ <= var_324_15 + arg_324_0 then
				arg_321_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_324_17 = arg_321_1.actors_["10006ui_story"]
			local var_324_18 = 0

			if var_324_18 < arg_321_1.time_ and arg_321_1.time_ <= var_324_18 + arg_324_0 and arg_321_1.var_.characterEffect10006ui_story == nil then
				arg_321_1.var_.characterEffect10006ui_story = var_324_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_19 = 0.2

			if var_324_18 <= arg_321_1.time_ and arg_321_1.time_ < var_324_18 + var_324_19 then
				local var_324_20 = (arg_321_1.time_ - var_324_18) / var_324_19

				if arg_321_1.var_.characterEffect10006ui_story then
					arg_321_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_18 + var_324_19 and arg_321_1.time_ < var_324_18 + var_324_19 + arg_324_0 and arg_321_1.var_.characterEffect10006ui_story then
				arg_321_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_324_21 = 0
			local var_324_22 = 0.175

			if var_324_21 < arg_321_1.time_ and arg_321_1.time_ <= var_324_21 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_23 = arg_321_1:FormatText(StoryNameCfg[212].name)

				arg_321_1.leftNameTxt_.text = var_324_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_24 = arg_321_1:GetWordFromCfg(114111079)
				local var_324_25 = arg_321_1:FormatText(var_324_24.content)

				arg_321_1.text_.text = var_324_25

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_26 = 7
				local var_324_27 = utf8.len(var_324_25)
				local var_324_28 = var_324_26 <= 0 and var_324_22 or var_324_22 * (var_324_27 / var_324_26)

				if var_324_28 > 0 and var_324_22 < var_324_28 then
					arg_321_1.talkMaxDuration = var_324_28

					if var_324_28 + var_324_21 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_28 + var_324_21
					end
				end

				arg_321_1.text_.text = var_324_25
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111079", "story_v_out_114111.awb") ~= 0 then
					local var_324_29 = manager.audio:GetVoiceLength("story_v_out_114111", "114111079", "story_v_out_114111.awb") / 1000

					if var_324_29 + var_324_21 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_29 + var_324_21
					end

					if var_324_24.prefab_name ~= "" and arg_321_1.actors_[var_324_24.prefab_name] ~= nil then
						local var_324_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_24.prefab_name].transform, "story_v_out_114111", "114111079", "story_v_out_114111.awb")

						arg_321_1:RecordAudio("114111079", var_324_30)
						arg_321_1:RecordAudio("114111079", var_324_30)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_114111", "114111079", "story_v_out_114111.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_114111", "114111079", "story_v_out_114111.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_31 = math.max(var_324_22, arg_321_1.talkMaxDuration)

			if var_324_21 <= arg_321_1.time_ and arg_321_1.time_ < var_324_21 + var_324_31 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_21) / var_324_31

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_21 + var_324_31 and arg_321_1.time_ < var_324_21 + var_324_31 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play114111080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 114111080
		arg_325_1.duration_ = 11.133

		local var_325_0 = {
			ja = 11.133,
			ko = 9.8,
			zh = 8.5,
			en = 8
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
				arg_325_0:Play114111081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_328_1 = arg_325_1.actors_["1041ui_story"]
			local var_328_2 = 0

			if var_328_2 < arg_325_1.time_ and arg_325_1.time_ <= var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect1041ui_story == nil then
				arg_325_1.var_.characterEffect1041ui_story = var_328_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_3 = 0.2

			if var_328_2 <= arg_325_1.time_ and arg_325_1.time_ < var_328_2 + var_328_3 then
				local var_328_4 = (arg_325_1.time_ - var_328_2) / var_328_3

				if arg_325_1.var_.characterEffect1041ui_story then
					arg_325_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_2 + var_328_3 and arg_325_1.time_ < var_328_2 + var_328_3 + arg_328_0 and arg_325_1.var_.characterEffect1041ui_story then
				arg_325_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_328_5 = arg_325_1.actors_["10006ui_story"]
			local var_328_6 = 0

			if var_328_6 < arg_325_1.time_ and arg_325_1.time_ <= var_328_6 + arg_328_0 and arg_325_1.var_.characterEffect10006ui_story == nil then
				arg_325_1.var_.characterEffect10006ui_story = var_328_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_7 = 0.2

			if var_328_6 <= arg_325_1.time_ and arg_325_1.time_ < var_328_6 + var_328_7 then
				local var_328_8 = (arg_325_1.time_ - var_328_6) / var_328_7

				if arg_325_1.var_.characterEffect10006ui_story then
					local var_328_9 = Mathf.Lerp(0, 0.5, var_328_8)

					arg_325_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_325_1.var_.characterEffect10006ui_story.fillRatio = var_328_9
				end
			end

			if arg_325_1.time_ >= var_328_6 + var_328_7 and arg_325_1.time_ < var_328_6 + var_328_7 + arg_328_0 and arg_325_1.var_.characterEffect10006ui_story then
				local var_328_10 = 0.5

				arg_325_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_325_1.var_.characterEffect10006ui_story.fillRatio = var_328_10
			end

			local var_328_11 = 0
			local var_328_12 = 1.075

			if var_328_11 < arg_325_1.time_ and arg_325_1.time_ <= var_328_11 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_13 = arg_325_1:FormatText(StoryNameCfg[208].name)

				arg_325_1.leftNameTxt_.text = var_328_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_14 = arg_325_1:GetWordFromCfg(114111080)
				local var_328_15 = arg_325_1:FormatText(var_328_14.content)

				arg_325_1.text_.text = var_328_15

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_16 = 43
				local var_328_17 = utf8.len(var_328_15)
				local var_328_18 = var_328_16 <= 0 and var_328_12 or var_328_12 * (var_328_17 / var_328_16)

				if var_328_18 > 0 and var_328_12 < var_328_18 then
					arg_325_1.talkMaxDuration = var_328_18

					if var_328_18 + var_328_11 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_18 + var_328_11
					end
				end

				arg_325_1.text_.text = var_328_15
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111080", "story_v_out_114111.awb") ~= 0 then
					local var_328_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111080", "story_v_out_114111.awb") / 1000

					if var_328_19 + var_328_11 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_19 + var_328_11
					end

					if var_328_14.prefab_name ~= "" and arg_325_1.actors_[var_328_14.prefab_name] ~= nil then
						local var_328_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_14.prefab_name].transform, "story_v_out_114111", "114111080", "story_v_out_114111.awb")

						arg_325_1:RecordAudio("114111080", var_328_20)
						arg_325_1:RecordAudio("114111080", var_328_20)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_114111", "114111080", "story_v_out_114111.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_114111", "114111080", "story_v_out_114111.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_21 = math.max(var_328_12, arg_325_1.talkMaxDuration)

			if var_328_11 <= arg_325_1.time_ and arg_325_1.time_ < var_328_11 + var_328_21 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_11) / var_328_21

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_11 + var_328_21 and arg_325_1.time_ < var_328_11 + var_328_21 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play114111081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 114111081
		arg_329_1.duration_ = 12.533

		local var_329_0 = {
			ja = 8.7,
			ko = 12.533,
			zh = 8.433,
			en = 9.6
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
				arg_329_0:Play114111082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10006ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos10006ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0, 100, 0)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10006ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, 100, 0)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1041ui_story"].transform
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 then
				arg_329_1.var_.moveOldPos1041ui_story = var_332_9.localPosition
			end

			local var_332_11 = 0.001

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11
				local var_332_13 = Vector3.New(0, 100, 0)

				var_332_9.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1041ui_story, var_332_13, var_332_12)

				local var_332_14 = manager.ui.mainCamera.transform.position - var_332_9.position

				var_332_9.forward = Vector3.New(var_332_14.x, var_332_14.y, var_332_14.z)

				local var_332_15 = var_332_9.localEulerAngles

				var_332_15.z = 0
				var_332_15.x = 0
				var_332_9.localEulerAngles = var_332_15
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 then
				var_332_9.localPosition = Vector3.New(0, 100, 0)

				local var_332_16 = manager.ui.mainCamera.transform.position - var_332_9.position

				var_332_9.forward = Vector3.New(var_332_16.x, var_332_16.y, var_332_16.z)

				local var_332_17 = var_332_9.localEulerAngles

				var_332_17.z = 0
				var_332_17.x = 0
				var_332_9.localEulerAngles = var_332_17
			end

			local var_332_18 = arg_329_1.actors_["1038ui_story"].transform
			local var_332_19 = 0

			if var_332_19 < arg_329_1.time_ and arg_329_1.time_ <= var_332_19 + arg_332_0 then
				arg_329_1.var_.moveOldPos1038ui_story = var_332_18.localPosition
			end

			local var_332_20 = 0.001

			if var_332_19 <= arg_329_1.time_ and arg_329_1.time_ < var_332_19 + var_332_20 then
				local var_332_21 = (arg_329_1.time_ - var_332_19) / var_332_20
				local var_332_22 = Vector3.New(-0.7, -1.11, -5.9)

				var_332_18.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1038ui_story, var_332_22, var_332_21)

				local var_332_23 = manager.ui.mainCamera.transform.position - var_332_18.position

				var_332_18.forward = Vector3.New(var_332_23.x, var_332_23.y, var_332_23.z)

				local var_332_24 = var_332_18.localEulerAngles

				var_332_24.z = 0
				var_332_24.x = 0
				var_332_18.localEulerAngles = var_332_24
			end

			if arg_329_1.time_ >= var_332_19 + var_332_20 and arg_329_1.time_ < var_332_19 + var_332_20 + arg_332_0 then
				var_332_18.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_332_25 = manager.ui.mainCamera.transform.position - var_332_18.position

				var_332_18.forward = Vector3.New(var_332_25.x, var_332_25.y, var_332_25.z)

				local var_332_26 = var_332_18.localEulerAngles

				var_332_26.z = 0
				var_332_26.x = 0
				var_332_18.localEulerAngles = var_332_26
			end

			local var_332_27 = 0

			if var_332_27 < arg_329_1.time_ and arg_329_1.time_ <= var_332_27 + arg_332_0 then
				arg_329_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_332_28 = 0

			if var_332_28 < arg_329_1.time_ and arg_329_1.time_ <= var_332_28 + arg_332_0 then
				arg_329_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_332_29 = arg_329_1.actors_["1038ui_story"]
			local var_332_30 = 0

			if var_332_30 < arg_329_1.time_ and arg_329_1.time_ <= var_332_30 + arg_332_0 and arg_329_1.var_.characterEffect1038ui_story == nil then
				arg_329_1.var_.characterEffect1038ui_story = var_332_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_31 = 0.2

			if var_332_30 <= arg_329_1.time_ and arg_329_1.time_ < var_332_30 + var_332_31 then
				local var_332_32 = (arg_329_1.time_ - var_332_30) / var_332_31

				if arg_329_1.var_.characterEffect1038ui_story then
					arg_329_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_30 + var_332_31 and arg_329_1.time_ < var_332_30 + var_332_31 + arg_332_0 and arg_329_1.var_.characterEffect1038ui_story then
				arg_329_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_332_33 = 0
			local var_332_34 = 1.15

			if var_332_33 < arg_329_1.time_ and arg_329_1.time_ <= var_332_33 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_35 = arg_329_1:FormatText(StoryNameCfg[94].name)

				arg_329_1.leftNameTxt_.text = var_332_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_36 = arg_329_1:GetWordFromCfg(114111081)
				local var_332_37 = arg_329_1:FormatText(var_332_36.content)

				arg_329_1.text_.text = var_332_37

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_38 = 46
				local var_332_39 = utf8.len(var_332_37)
				local var_332_40 = var_332_38 <= 0 and var_332_34 or var_332_34 * (var_332_39 / var_332_38)

				if var_332_40 > 0 and var_332_34 < var_332_40 then
					arg_329_1.talkMaxDuration = var_332_40

					if var_332_40 + var_332_33 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_40 + var_332_33
					end
				end

				arg_329_1.text_.text = var_332_37
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111081", "story_v_out_114111.awb") ~= 0 then
					local var_332_41 = manager.audio:GetVoiceLength("story_v_out_114111", "114111081", "story_v_out_114111.awb") / 1000

					if var_332_41 + var_332_33 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_41 + var_332_33
					end

					if var_332_36.prefab_name ~= "" and arg_329_1.actors_[var_332_36.prefab_name] ~= nil then
						local var_332_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_36.prefab_name].transform, "story_v_out_114111", "114111081", "story_v_out_114111.awb")

						arg_329_1:RecordAudio("114111081", var_332_42)
						arg_329_1:RecordAudio("114111081", var_332_42)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_114111", "114111081", "story_v_out_114111.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_114111", "114111081", "story_v_out_114111.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_43 = math.max(var_332_34, arg_329_1.talkMaxDuration)

			if var_332_33 <= arg_329_1.time_ and arg_329_1.time_ < var_332_33 + var_332_43 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_33) / var_332_43

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_33 + var_332_43 and arg_329_1.time_ < var_332_33 + var_332_43 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play114111082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 114111082
		arg_333_1.duration_ = 11.833

		local var_333_0 = {
			ja = 9.8,
			ko = 9.933,
			zh = 9.466,
			en = 11.833
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
				arg_333_0:Play114111083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_336_2 = 0
			local var_336_3 = 1.15

			if var_336_2 < arg_333_1.time_ and arg_333_1.time_ <= var_336_2 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_4 = arg_333_1:FormatText(StoryNameCfg[94].name)

				arg_333_1.leftNameTxt_.text = var_336_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_5 = arg_333_1:GetWordFromCfg(114111082)
				local var_336_6 = arg_333_1:FormatText(var_336_5.content)

				arg_333_1.text_.text = var_336_6

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_7 = 46
				local var_336_8 = utf8.len(var_336_6)
				local var_336_9 = var_336_7 <= 0 and var_336_3 or var_336_3 * (var_336_8 / var_336_7)

				if var_336_9 > 0 and var_336_3 < var_336_9 then
					arg_333_1.talkMaxDuration = var_336_9

					if var_336_9 + var_336_2 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_9 + var_336_2
					end
				end

				arg_333_1.text_.text = var_336_6
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111082", "story_v_out_114111.awb") ~= 0 then
					local var_336_10 = manager.audio:GetVoiceLength("story_v_out_114111", "114111082", "story_v_out_114111.awb") / 1000

					if var_336_10 + var_336_2 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_10 + var_336_2
					end

					if var_336_5.prefab_name ~= "" and arg_333_1.actors_[var_336_5.prefab_name] ~= nil then
						local var_336_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_5.prefab_name].transform, "story_v_out_114111", "114111082", "story_v_out_114111.awb")

						arg_333_1:RecordAudio("114111082", var_336_11)
						arg_333_1:RecordAudio("114111082", var_336_11)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_114111", "114111082", "story_v_out_114111.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_114111", "114111082", "story_v_out_114111.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_12 = math.max(var_336_3, arg_333_1.talkMaxDuration)

			if var_336_2 <= arg_333_1.time_ and arg_333_1.time_ < var_336_2 + var_336_12 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_2) / var_336_12

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_2 + var_336_12 and arg_333_1.time_ < var_336_2 + var_336_12 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play114111083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 114111083
		arg_337_1.duration_ = 5.166

		local var_337_0 = {
			ja = 5.166,
			ko = 3.5,
			zh = 3.166,
			en = 4.033
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
				arg_337_0:Play114111084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1097ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1097ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(0.7, -0.54, -6.3)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1097ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = 0

			if var_340_9 < arg_337_1.time_ and arg_337_1.time_ <= var_340_9 + arg_340_0 then
				arg_337_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 then
				arg_337_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_340_11 = arg_337_1.actors_["1097ui_story"]
			local var_340_12 = 0

			if var_340_12 < arg_337_1.time_ and arg_337_1.time_ <= var_340_12 + arg_340_0 and arg_337_1.var_.characterEffect1097ui_story == nil then
				arg_337_1.var_.characterEffect1097ui_story = var_340_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_13 = 0.2

			if var_340_12 <= arg_337_1.time_ and arg_337_1.time_ < var_340_12 + var_340_13 then
				local var_340_14 = (arg_337_1.time_ - var_340_12) / var_340_13

				if arg_337_1.var_.characterEffect1097ui_story then
					arg_337_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_12 + var_340_13 and arg_337_1.time_ < var_340_12 + var_340_13 + arg_340_0 and arg_337_1.var_.characterEffect1097ui_story then
				arg_337_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_340_15 = arg_337_1.actors_["1038ui_story"]
			local var_340_16 = 0

			if var_340_16 < arg_337_1.time_ and arg_337_1.time_ <= var_340_16 + arg_340_0 and arg_337_1.var_.characterEffect1038ui_story == nil then
				arg_337_1.var_.characterEffect1038ui_story = var_340_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_17 = 0.2

			if var_340_16 <= arg_337_1.time_ and arg_337_1.time_ < var_340_16 + var_340_17 then
				local var_340_18 = (arg_337_1.time_ - var_340_16) / var_340_17

				if arg_337_1.var_.characterEffect1038ui_story then
					local var_340_19 = Mathf.Lerp(0, 0.5, var_340_18)

					arg_337_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_337_1.var_.characterEffect1038ui_story.fillRatio = var_340_19
				end
			end

			if arg_337_1.time_ >= var_340_16 + var_340_17 and arg_337_1.time_ < var_340_16 + var_340_17 + arg_340_0 and arg_337_1.var_.characterEffect1038ui_story then
				local var_340_20 = 0.5

				arg_337_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_337_1.var_.characterEffect1038ui_story.fillRatio = var_340_20
			end

			local var_340_21 = 0
			local var_340_22 = 0.325

			if var_340_21 < arg_337_1.time_ and arg_337_1.time_ <= var_340_21 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_23 = arg_337_1:FormatText(StoryNameCfg[216].name)

				arg_337_1.leftNameTxt_.text = var_340_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_24 = arg_337_1:GetWordFromCfg(114111083)
				local var_340_25 = arg_337_1:FormatText(var_340_24.content)

				arg_337_1.text_.text = var_340_25

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_26 = 13
				local var_340_27 = utf8.len(var_340_25)
				local var_340_28 = var_340_26 <= 0 and var_340_22 or var_340_22 * (var_340_27 / var_340_26)

				if var_340_28 > 0 and var_340_22 < var_340_28 then
					arg_337_1.talkMaxDuration = var_340_28

					if var_340_28 + var_340_21 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_28 + var_340_21
					end
				end

				arg_337_1.text_.text = var_340_25
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111083", "story_v_out_114111.awb") ~= 0 then
					local var_340_29 = manager.audio:GetVoiceLength("story_v_out_114111", "114111083", "story_v_out_114111.awb") / 1000

					if var_340_29 + var_340_21 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_29 + var_340_21
					end

					if var_340_24.prefab_name ~= "" and arg_337_1.actors_[var_340_24.prefab_name] ~= nil then
						local var_340_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_24.prefab_name].transform, "story_v_out_114111", "114111083", "story_v_out_114111.awb")

						arg_337_1:RecordAudio("114111083", var_340_30)
						arg_337_1:RecordAudio("114111083", var_340_30)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_114111", "114111083", "story_v_out_114111.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_114111", "114111083", "story_v_out_114111.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_31 = math.max(var_340_22, arg_337_1.talkMaxDuration)

			if var_340_21 <= arg_337_1.time_ and arg_337_1.time_ < var_340_21 + var_340_31 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_21) / var_340_31

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_21 + var_340_31 and arg_337_1.time_ < var_340_21 + var_340_31 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play114111084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 114111084
		arg_341_1.duration_ = 3.266

		local var_341_0 = {
			ja = 3.266,
			ko = 2.166,
			zh = 1.566,
			en = 1.366
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
				arg_341_0:Play114111085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1097ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1097ui_story == nil then
				arg_341_1.var_.characterEffect1097ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.2

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1097ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1097ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1097ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1097ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.075

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_8 = arg_341_1:FormatText(StoryNameCfg[212].name)

				arg_341_1.leftNameTxt_.text = var_344_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, true)
				arg_341_1.iconController_:SetSelectedState("hero")

				arg_341_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10006")

				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_9 = arg_341_1:GetWordFromCfg(114111084)
				local var_344_10 = arg_341_1:FormatText(var_344_9.content)

				arg_341_1.text_.text = var_344_10

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_11 = 3
				local var_344_12 = utf8.len(var_344_10)
				local var_344_13 = var_344_11 <= 0 and var_344_7 or var_344_7 * (var_344_12 / var_344_11)

				if var_344_13 > 0 and var_344_7 < var_344_13 then
					arg_341_1.talkMaxDuration = var_344_13

					if var_344_13 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_10
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111084", "story_v_out_114111.awb") ~= 0 then
					local var_344_14 = manager.audio:GetVoiceLength("story_v_out_114111", "114111084", "story_v_out_114111.awb") / 1000

					if var_344_14 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_14 + var_344_6
					end

					if var_344_9.prefab_name ~= "" and arg_341_1.actors_[var_344_9.prefab_name] ~= nil then
						local var_344_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_9.prefab_name].transform, "story_v_out_114111", "114111084", "story_v_out_114111.awb")

						arg_341_1:RecordAudio("114111084", var_344_15)
						arg_341_1:RecordAudio("114111084", var_344_15)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_114111", "114111084", "story_v_out_114111.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_114111", "114111084", "story_v_out_114111.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_16 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_16 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_16

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_16 and arg_341_1.time_ < var_344_6 + var_344_16 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play114111085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 114111085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play114111086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1038ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1038ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(0, 100, 0)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1038ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, 100, 0)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = arg_345_1.actors_["1097ui_story"].transform
			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 then
				arg_345_1.var_.moveOldPos1097ui_story = var_348_9.localPosition
			end

			local var_348_11 = 0.001

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_10) / var_348_11
				local var_348_13 = Vector3.New(0, 100, 0)

				var_348_9.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1097ui_story, var_348_13, var_348_12)

				local var_348_14 = manager.ui.mainCamera.transform.position - var_348_9.position

				var_348_9.forward = Vector3.New(var_348_14.x, var_348_14.y, var_348_14.z)

				local var_348_15 = var_348_9.localEulerAngles

				var_348_15.z = 0
				var_348_15.x = 0
				var_348_9.localEulerAngles = var_348_15
			end

			if arg_345_1.time_ >= var_348_10 + var_348_11 and arg_345_1.time_ < var_348_10 + var_348_11 + arg_348_0 then
				var_348_9.localPosition = Vector3.New(0, 100, 0)

				local var_348_16 = manager.ui.mainCamera.transform.position - var_348_9.position

				var_348_9.forward = Vector3.New(var_348_16.x, var_348_16.y, var_348_16.z)

				local var_348_17 = var_348_9.localEulerAngles

				var_348_17.z = 0
				var_348_17.x = 0
				var_348_9.localEulerAngles = var_348_17
			end

			local var_348_18 = 0
			local var_348_19 = 0.675

			if var_348_18 < arg_345_1.time_ and arg_345_1.time_ <= var_348_18 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_20 = arg_345_1:GetWordFromCfg(114111085)
				local var_348_21 = arg_345_1:FormatText(var_348_20.content)

				arg_345_1.text_.text = var_348_21

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_22 = 27
				local var_348_23 = utf8.len(var_348_21)
				local var_348_24 = var_348_22 <= 0 and var_348_19 or var_348_19 * (var_348_23 / var_348_22)

				if var_348_24 > 0 and var_348_19 < var_348_24 then
					arg_345_1.talkMaxDuration = var_348_24

					if var_348_24 + var_348_18 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_24 + var_348_18
					end
				end

				arg_345_1.text_.text = var_348_21
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_25 = math.max(var_348_19, arg_345_1.talkMaxDuration)

			if var_348_18 <= arg_345_1.time_ and arg_345_1.time_ < var_348_18 + var_348_25 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_18) / var_348_25

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_18 + var_348_25 and arg_345_1.time_ < var_348_18 + var_348_25 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play114111086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 114111086
		arg_349_1.duration_ = 10.1

		local var_349_0 = {
			ja = 7.466,
			ko = 6.533,
			zh = 6.7,
			en = 10.1
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play114111087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1184ui_story"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1184ui_story = var_352_0.localPosition

				local var_352_2 = "1184ui_story"

				arg_349_1:ShowWeapon(arg_349_1.var_[var_352_2 .. "Animator"].transform, false)
			end

			local var_352_3 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_3 then
				local var_352_4 = (arg_349_1.time_ - var_352_1) / var_352_3
				local var_352_5 = Vector3.New(0, -0.97, -6)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1184ui_story, var_352_5, var_352_4)

				local var_352_6 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_6.x, var_352_6.y, var_352_6.z)

				local var_352_7 = var_352_0.localEulerAngles

				var_352_7.z = 0
				var_352_7.x = 0
				var_352_0.localEulerAngles = var_352_7
			end

			if arg_349_1.time_ >= var_352_1 + var_352_3 and arg_349_1.time_ < var_352_1 + var_352_3 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_352_8 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_8.x, var_352_8.y, var_352_8.z)

				local var_352_9 = var_352_0.localEulerAngles

				var_352_9.z = 0
				var_352_9.x = 0
				var_352_0.localEulerAngles = var_352_9
			end

			local var_352_10 = 0

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 then
				arg_349_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_352_11 = 0

			if var_352_11 < arg_349_1.time_ and arg_349_1.time_ <= var_352_11 + arg_352_0 then
				arg_349_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_352_12 = arg_349_1.actors_["1184ui_story"]
			local var_352_13 = 0

			if var_352_13 < arg_349_1.time_ and arg_349_1.time_ <= var_352_13 + arg_352_0 and arg_349_1.var_.characterEffect1184ui_story == nil then
				arg_349_1.var_.characterEffect1184ui_story = var_352_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_14 = 0.2

			if var_352_13 <= arg_349_1.time_ and arg_349_1.time_ < var_352_13 + var_352_14 then
				local var_352_15 = (arg_349_1.time_ - var_352_13) / var_352_14

				if arg_349_1.var_.characterEffect1184ui_story then
					arg_349_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_13 + var_352_14 and arg_349_1.time_ < var_352_13 + var_352_14 + arg_352_0 and arg_349_1.var_.characterEffect1184ui_story then
				arg_349_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_352_16 = 0
			local var_352_17 = 0.725

			if var_352_16 < arg_349_1.time_ and arg_349_1.time_ <= var_352_16 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_18 = arg_349_1:FormatText(StoryNameCfg[6].name)

				arg_349_1.leftNameTxt_.text = var_352_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_19 = arg_349_1:GetWordFromCfg(114111086)
				local var_352_20 = arg_349_1:FormatText(var_352_19.content)

				arg_349_1.text_.text = var_352_20

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_21 = 29
				local var_352_22 = utf8.len(var_352_20)
				local var_352_23 = var_352_21 <= 0 and var_352_17 or var_352_17 * (var_352_22 / var_352_21)

				if var_352_23 > 0 and var_352_17 < var_352_23 then
					arg_349_1.talkMaxDuration = var_352_23

					if var_352_23 + var_352_16 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_23 + var_352_16
					end
				end

				arg_349_1.text_.text = var_352_20
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111086", "story_v_out_114111.awb") ~= 0 then
					local var_352_24 = manager.audio:GetVoiceLength("story_v_out_114111", "114111086", "story_v_out_114111.awb") / 1000

					if var_352_24 + var_352_16 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_24 + var_352_16
					end

					if var_352_19.prefab_name ~= "" and arg_349_1.actors_[var_352_19.prefab_name] ~= nil then
						local var_352_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_19.prefab_name].transform, "story_v_out_114111", "114111086", "story_v_out_114111.awb")

						arg_349_1:RecordAudio("114111086", var_352_25)
						arg_349_1:RecordAudio("114111086", var_352_25)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_114111", "114111086", "story_v_out_114111.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_114111", "114111086", "story_v_out_114111.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_26 = math.max(var_352_17, arg_349_1.talkMaxDuration)

			if var_352_16 <= arg_349_1.time_ and arg_349_1.time_ < var_352_16 + var_352_26 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_16) / var_352_26

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_16 + var_352_26 and arg_349_1.time_ < var_352_16 + var_352_26 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play114111087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 114111087
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play114111088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1184ui_story"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos1184ui_story = var_356_0.localPosition
			end

			local var_356_2 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2
				local var_356_4 = Vector3.New(0, 100, 0)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1184ui_story, var_356_4, var_356_3)

				local var_356_5 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_5.x, var_356_5.y, var_356_5.z)

				local var_356_6 = var_356_0.localEulerAngles

				var_356_6.z = 0
				var_356_6.x = 0
				var_356_0.localEulerAngles = var_356_6
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(0, 100, 0)

				local var_356_7 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_7.x, var_356_7.y, var_356_7.z)

				local var_356_8 = var_356_0.localEulerAngles

				var_356_8.z = 0
				var_356_8.x = 0
				var_356_0.localEulerAngles = var_356_8
			end

			local var_356_9 = 0
			local var_356_10 = 0.475

			if var_356_9 < arg_353_1.time_ and arg_353_1.time_ <= var_356_9 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_11 = arg_353_1:FormatText(StoryNameCfg[7].name)

				arg_353_1.leftNameTxt_.text = var_356_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_12 = arg_353_1:GetWordFromCfg(114111087)
				local var_356_13 = arg_353_1:FormatText(var_356_12.content)

				arg_353_1.text_.text = var_356_13

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_14 = 19
				local var_356_15 = utf8.len(var_356_13)
				local var_356_16 = var_356_14 <= 0 and var_356_10 or var_356_10 * (var_356_15 / var_356_14)

				if var_356_16 > 0 and var_356_10 < var_356_16 then
					arg_353_1.talkMaxDuration = var_356_16

					if var_356_16 + var_356_9 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_16 + var_356_9
					end
				end

				arg_353_1.text_.text = var_356_13
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_17 = math.max(var_356_10, arg_353_1.talkMaxDuration)

			if var_356_9 <= arg_353_1.time_ and arg_353_1.time_ < var_356_9 + var_356_17 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_9) / var_356_17

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_9 + var_356_17 and arg_353_1.time_ < var_356_9 + var_356_17 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play114111088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 114111088
		arg_357_1.duration_ = 13.633

		local var_357_0 = {
			ja = 13.633,
			ko = 8.033,
			zh = 8.233,
			en = 6.833
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play114111089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10006ui_story"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos10006ui_story = var_360_0.localPosition
			end

			local var_360_2 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2
				local var_360_4 = Vector3.New(0, -0.98, -5.65)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10006ui_story, var_360_4, var_360_3)

				local var_360_5 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_5.x, var_360_5.y, var_360_5.z)

				local var_360_6 = var_360_0.localEulerAngles

				var_360_6.z = 0
				var_360_6.x = 0
				var_360_0.localEulerAngles = var_360_6
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(0, -0.98, -5.65)

				local var_360_7 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_7.x, var_360_7.y, var_360_7.z)

				local var_360_8 = var_360_0.localEulerAngles

				var_360_8.z = 0
				var_360_8.x = 0
				var_360_0.localEulerAngles = var_360_8
			end

			local var_360_9 = 0

			if var_360_9 < arg_357_1.time_ and arg_357_1.time_ <= var_360_9 + arg_360_0 then
				arg_357_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_360_10 = 0

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 then
				arg_357_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_360_11 = arg_357_1.actors_["10006ui_story"]
			local var_360_12 = 0

			if var_360_12 < arg_357_1.time_ and arg_357_1.time_ <= var_360_12 + arg_360_0 and arg_357_1.var_.characterEffect10006ui_story == nil then
				arg_357_1.var_.characterEffect10006ui_story = var_360_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_13 = 0.2

			if var_360_12 <= arg_357_1.time_ and arg_357_1.time_ < var_360_12 + var_360_13 then
				local var_360_14 = (arg_357_1.time_ - var_360_12) / var_360_13

				if arg_357_1.var_.characterEffect10006ui_story then
					arg_357_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_12 + var_360_13 and arg_357_1.time_ < var_360_12 + var_360_13 + arg_360_0 and arg_357_1.var_.characterEffect10006ui_story then
				arg_357_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_360_15 = 0
			local var_360_16 = 0.85

			if var_360_15 < arg_357_1.time_ and arg_357_1.time_ <= var_360_15 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_17 = arg_357_1:FormatText(StoryNameCfg[212].name)

				arg_357_1.leftNameTxt_.text = var_360_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_18 = arg_357_1:GetWordFromCfg(114111088)
				local var_360_19 = arg_357_1:FormatText(var_360_18.content)

				arg_357_1.text_.text = var_360_19

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_20 = 34
				local var_360_21 = utf8.len(var_360_19)
				local var_360_22 = var_360_20 <= 0 and var_360_16 or var_360_16 * (var_360_21 / var_360_20)

				if var_360_22 > 0 and var_360_16 < var_360_22 then
					arg_357_1.talkMaxDuration = var_360_22

					if var_360_22 + var_360_15 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_22 + var_360_15
					end
				end

				arg_357_1.text_.text = var_360_19
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111088", "story_v_out_114111.awb") ~= 0 then
					local var_360_23 = manager.audio:GetVoiceLength("story_v_out_114111", "114111088", "story_v_out_114111.awb") / 1000

					if var_360_23 + var_360_15 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_23 + var_360_15
					end

					if var_360_18.prefab_name ~= "" and arg_357_1.actors_[var_360_18.prefab_name] ~= nil then
						local var_360_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_18.prefab_name].transform, "story_v_out_114111", "114111088", "story_v_out_114111.awb")

						arg_357_1:RecordAudio("114111088", var_360_24)
						arg_357_1:RecordAudio("114111088", var_360_24)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_114111", "114111088", "story_v_out_114111.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_114111", "114111088", "story_v_out_114111.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_25 = math.max(var_360_16, arg_357_1.talkMaxDuration)

			if var_360_15 <= arg_357_1.time_ and arg_357_1.time_ < var_360_15 + var_360_25 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_15) / var_360_25

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_15 + var_360_25 and arg_357_1.time_ < var_360_15 + var_360_25 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play114111089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 114111089
		arg_361_1.duration_ = 14.633

		local var_361_0 = {
			ja = 14.633,
			ko = 11.3,
			zh = 8.6,
			en = 10.1
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play114111090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_364_1 = 0
			local var_364_2 = 1.05

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_3 = arg_361_1:FormatText(StoryNameCfg[212].name)

				arg_361_1.leftNameTxt_.text = var_364_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_4 = arg_361_1:GetWordFromCfg(114111089)
				local var_364_5 = arg_361_1:FormatText(var_364_4.content)

				arg_361_1.text_.text = var_364_5

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_6 = 42
				local var_364_7 = utf8.len(var_364_5)
				local var_364_8 = var_364_6 <= 0 and var_364_2 or var_364_2 * (var_364_7 / var_364_6)

				if var_364_8 > 0 and var_364_2 < var_364_8 then
					arg_361_1.talkMaxDuration = var_364_8

					if var_364_8 + var_364_1 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_1
					end
				end

				arg_361_1.text_.text = var_364_5
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111089", "story_v_out_114111.awb") ~= 0 then
					local var_364_9 = manager.audio:GetVoiceLength("story_v_out_114111", "114111089", "story_v_out_114111.awb") / 1000

					if var_364_9 + var_364_1 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_9 + var_364_1
					end

					if var_364_4.prefab_name ~= "" and arg_361_1.actors_[var_364_4.prefab_name] ~= nil then
						local var_364_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_4.prefab_name].transform, "story_v_out_114111", "114111089", "story_v_out_114111.awb")

						arg_361_1:RecordAudio("114111089", var_364_10)
						arg_361_1:RecordAudio("114111089", var_364_10)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_114111", "114111089", "story_v_out_114111.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_114111", "114111089", "story_v_out_114111.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_11 = math.max(var_364_2, arg_361_1.talkMaxDuration)

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_11 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_1) / var_364_11

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_1 + var_364_11 and arg_361_1.time_ < var_364_1 + var_364_11 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play114111090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 114111090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play114111091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10006ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect10006ui_story == nil then
				arg_365_1.var_.characterEffect10006ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect10006ui_story then
					local var_368_4 = Mathf.Lerp(0, 0.5, var_368_3)

					arg_365_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_365_1.var_.characterEffect10006ui_story.fillRatio = var_368_4
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect10006ui_story then
				local var_368_5 = 0.5

				arg_365_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_365_1.var_.characterEffect10006ui_story.fillRatio = var_368_5
			end

			local var_368_6 = 0
			local var_368_7 = 0.575

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_8 = arg_365_1:FormatText(StoryNameCfg[7].name)

				arg_365_1.leftNameTxt_.text = var_368_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_9 = arg_365_1:GetWordFromCfg(114111090)
				local var_368_10 = arg_365_1:FormatText(var_368_9.content)

				arg_365_1.text_.text = var_368_10

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_11 = 23
				local var_368_12 = utf8.len(var_368_10)
				local var_368_13 = var_368_11 <= 0 and var_368_7 or var_368_7 * (var_368_12 / var_368_11)

				if var_368_13 > 0 and var_368_7 < var_368_13 then
					arg_365_1.talkMaxDuration = var_368_13

					if var_368_13 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_13 + var_368_6
					end
				end

				arg_365_1.text_.text = var_368_10
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_14 = math.max(var_368_7, arg_365_1.talkMaxDuration)

			if var_368_6 <= arg_365_1.time_ and arg_365_1.time_ < var_368_6 + var_368_14 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_6) / var_368_14

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_6 + var_368_14 and arg_365_1.time_ < var_368_6 + var_368_14 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play114111091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 114111091
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play114111092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["10006ui_story"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos10006ui_story = var_372_0.localPosition
			end

			local var_372_2 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2
				local var_372_4 = Vector3.New(0, 100, 0)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos10006ui_story, var_372_4, var_372_3)

				local var_372_5 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_5.x, var_372_5.y, var_372_5.z)

				local var_372_6 = var_372_0.localEulerAngles

				var_372_6.z = 0
				var_372_6.x = 0
				var_372_0.localEulerAngles = var_372_6
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(0, 100, 0)

				local var_372_7 = manager.ui.mainCamera.transform.position - var_372_0.position

				var_372_0.forward = Vector3.New(var_372_7.x, var_372_7.y, var_372_7.z)

				local var_372_8 = var_372_0.localEulerAngles

				var_372_8.z = 0
				var_372_8.x = 0
				var_372_0.localEulerAngles = var_372_8
			end

			local var_372_9 = 0
			local var_372_10 = 0.775

			if var_372_9 < arg_369_1.time_ and arg_369_1.time_ <= var_372_9 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, false)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_11 = arg_369_1:GetWordFromCfg(114111091)
				local var_372_12 = arg_369_1:FormatText(var_372_11.content)

				arg_369_1.text_.text = var_372_12

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_13 = 31
				local var_372_14 = utf8.len(var_372_12)
				local var_372_15 = var_372_13 <= 0 and var_372_10 or var_372_10 * (var_372_14 / var_372_13)

				if var_372_15 > 0 and var_372_10 < var_372_15 then
					arg_369_1.talkMaxDuration = var_372_15

					if var_372_15 + var_372_9 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_15 + var_372_9
					end
				end

				arg_369_1.text_.text = var_372_12
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_16 = math.max(var_372_10, arg_369_1.talkMaxDuration)

			if var_372_9 <= arg_369_1.time_ and arg_369_1.time_ < var_372_9 + var_372_16 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_9) / var_372_16

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_9 + var_372_16 and arg_369_1.time_ < var_372_9 + var_372_16 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play114111092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 114111092
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play114111093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.175

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[7].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(114111092)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 7
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
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_8 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_8 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_8

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_8 and arg_373_1.time_ < var_376_0 + var_376_8 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play114111093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 114111093
		arg_377_1.duration_ = 6.8

		local var_377_0 = {
			ja = 3.633,
			ko = 5.033,
			zh = 5.6,
			en = 6.8
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
				arg_377_0:Play114111094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1184ui_story"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos1184ui_story = var_380_0.localPosition

				local var_380_2 = "1184ui_story"

				arg_377_1:ShowWeapon(arg_377_1.var_[var_380_2 .. "Animator"].transform, false)
			end

			local var_380_3 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_3 then
				local var_380_4 = (arg_377_1.time_ - var_380_1) / var_380_3
				local var_380_5 = Vector3.New(0, -0.97, -6)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1184ui_story, var_380_5, var_380_4)

				local var_380_6 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_6.x, var_380_6.y, var_380_6.z)

				local var_380_7 = var_380_0.localEulerAngles

				var_380_7.z = 0
				var_380_7.x = 0
				var_380_0.localEulerAngles = var_380_7
			end

			if arg_377_1.time_ >= var_380_1 + var_380_3 and arg_377_1.time_ < var_380_1 + var_380_3 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_380_8 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_8.x, var_380_8.y, var_380_8.z)

				local var_380_9 = var_380_0.localEulerAngles

				var_380_9.z = 0
				var_380_9.x = 0
				var_380_0.localEulerAngles = var_380_9
			end

			local var_380_10 = 0

			if var_380_10 < arg_377_1.time_ and arg_377_1.time_ <= var_380_10 + arg_380_0 then
				arg_377_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_380_11 = 0

			if var_380_11 < arg_377_1.time_ and arg_377_1.time_ <= var_380_11 + arg_380_0 then
				arg_377_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_380_12 = arg_377_1.actors_["1184ui_story"]
			local var_380_13 = 0

			if var_380_13 < arg_377_1.time_ and arg_377_1.time_ <= var_380_13 + arg_380_0 and arg_377_1.var_.characterEffect1184ui_story == nil then
				arg_377_1.var_.characterEffect1184ui_story = var_380_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_14 = 0.2

			if var_380_13 <= arg_377_1.time_ and arg_377_1.time_ < var_380_13 + var_380_14 then
				local var_380_15 = (arg_377_1.time_ - var_380_13) / var_380_14

				if arg_377_1.var_.characterEffect1184ui_story then
					arg_377_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_13 + var_380_14 and arg_377_1.time_ < var_380_13 + var_380_14 + arg_380_0 and arg_377_1.var_.characterEffect1184ui_story then
				arg_377_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_380_16 = 0
			local var_380_17 = 0.5

			if var_380_16 < arg_377_1.time_ and arg_377_1.time_ <= var_380_16 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_18 = arg_377_1:FormatText(StoryNameCfg[6].name)

				arg_377_1.leftNameTxt_.text = var_380_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_19 = arg_377_1:GetWordFromCfg(114111093)
				local var_380_20 = arg_377_1:FormatText(var_380_19.content)

				arg_377_1.text_.text = var_380_20

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_21 = 20
				local var_380_22 = utf8.len(var_380_20)
				local var_380_23 = var_380_21 <= 0 and var_380_17 or var_380_17 * (var_380_22 / var_380_21)

				if var_380_23 > 0 and var_380_17 < var_380_23 then
					arg_377_1.talkMaxDuration = var_380_23

					if var_380_23 + var_380_16 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_23 + var_380_16
					end
				end

				arg_377_1.text_.text = var_380_20
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111093", "story_v_out_114111.awb") ~= 0 then
					local var_380_24 = manager.audio:GetVoiceLength("story_v_out_114111", "114111093", "story_v_out_114111.awb") / 1000

					if var_380_24 + var_380_16 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_24 + var_380_16
					end

					if var_380_19.prefab_name ~= "" and arg_377_1.actors_[var_380_19.prefab_name] ~= nil then
						local var_380_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_19.prefab_name].transform, "story_v_out_114111", "114111093", "story_v_out_114111.awb")

						arg_377_1:RecordAudio("114111093", var_380_25)
						arg_377_1:RecordAudio("114111093", var_380_25)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_114111", "114111093", "story_v_out_114111.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_114111", "114111093", "story_v_out_114111.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_26 = math.max(var_380_17, arg_377_1.talkMaxDuration)

			if var_380_16 <= arg_377_1.time_ and arg_377_1.time_ < var_380_16 + var_380_26 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_16) / var_380_26

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_16 + var_380_26 and arg_377_1.time_ < var_380_16 + var_380_26 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play114111094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 114111094
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play114111095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1184ui_story"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos1184ui_story = var_384_0.localPosition
			end

			local var_384_2 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2
				local var_384_4 = Vector3.New(0, 100, 0)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1184ui_story, var_384_4, var_384_3)

				local var_384_5 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_5.x, var_384_5.y, var_384_5.z)

				local var_384_6 = var_384_0.localEulerAngles

				var_384_6.z = 0
				var_384_6.x = 0
				var_384_0.localEulerAngles = var_384_6
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(0, 100, 0)

				local var_384_7 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_7.x, var_384_7.y, var_384_7.z)

				local var_384_8 = var_384_0.localEulerAngles

				var_384_8.z = 0
				var_384_8.x = 0
				var_384_0.localEulerAngles = var_384_8
			end

			local var_384_9 = 0
			local var_384_10 = 1.35

			if var_384_9 < arg_381_1.time_ and arg_381_1.time_ <= var_384_9 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_11 = arg_381_1:GetWordFromCfg(114111094)
				local var_384_12 = arg_381_1:FormatText(var_384_11.content)

				arg_381_1.text_.text = var_384_12

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_13 = 54
				local var_384_14 = utf8.len(var_384_12)
				local var_384_15 = var_384_13 <= 0 and var_384_10 or var_384_10 * (var_384_14 / var_384_13)

				if var_384_15 > 0 and var_384_10 < var_384_15 then
					arg_381_1.talkMaxDuration = var_384_15

					if var_384_15 + var_384_9 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_15 + var_384_9
					end
				end

				arg_381_1.text_.text = var_384_12
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_16 = math.max(var_384_10, arg_381_1.talkMaxDuration)

			if var_384_9 <= arg_381_1.time_ and arg_381_1.time_ < var_384_9 + var_384_16 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_9) / var_384_16

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_9 + var_384_16 and arg_381_1.time_ < var_384_9 + var_384_16 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play114111095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 114111095
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play114111096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = manager.ui.mainCamera.transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.shakeOldPos = var_388_0.localPosition
			end

			local var_388_2 = 1.5

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / 0.066
				local var_388_4, var_388_5 = math.modf(var_388_3)

				var_388_0.localPosition = Vector3.New(var_388_5 * 0.13, var_388_5 * 0.13, var_388_5 * 0.13) + arg_385_1.var_.shakeOldPos
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = arg_385_1.var_.shakeOldPos
			end

			local var_388_6 = 0

			if var_388_6 < arg_385_1.time_ and arg_385_1.time_ <= var_388_6 + arg_388_0 then
				arg_385_1.allBtn_.enabled = false
			end

			local var_388_7 = 1.5

			if arg_385_1.time_ >= var_388_6 + var_388_7 and arg_385_1.time_ < var_388_6 + var_388_7 + arg_388_0 then
				arg_385_1.allBtn_.enabled = true
			end

			local var_388_8 = 0
			local var_388_9 = 1

			if var_388_8 < arg_385_1.time_ and arg_385_1.time_ <= var_388_8 + arg_388_0 then
				local var_388_10 = "play"
				local var_388_11 = "effect"

				arg_385_1:AudioAction(var_388_10, var_388_11, "se_story_11", "se_story_11_roar", "")
			end

			local var_388_12 = 0
			local var_388_13 = 0.125

			if var_388_12 < arg_385_1.time_ and arg_385_1.time_ <= var_388_12 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_14 = arg_385_1:GetWordFromCfg(114111095)
				local var_388_15 = arg_385_1:FormatText(var_388_14.content)

				arg_385_1.text_.text = var_388_15

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_16 = 5
				local var_388_17 = utf8.len(var_388_15)
				local var_388_18 = var_388_16 <= 0 and var_388_13 or var_388_13 * (var_388_17 / var_388_16)

				if var_388_18 > 0 and var_388_13 < var_388_18 then
					arg_385_1.talkMaxDuration = var_388_18

					if var_388_18 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_18 + var_388_12
					end
				end

				arg_385_1.text_.text = var_388_15
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_19 = math.max(var_388_13, arg_385_1.talkMaxDuration)

			if var_388_12 <= arg_385_1.time_ and arg_385_1.time_ < var_388_12 + var_388_19 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_12) / var_388_19

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_12 + var_388_19 and arg_385_1.time_ < var_388_12 + var_388_19 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play114111096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 114111096
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play114111097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 0.15

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_2 = arg_389_1:FormatText(StoryNameCfg[7].name)

				arg_389_1.leftNameTxt_.text = var_392_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_3 = arg_389_1:GetWordFromCfg(114111096)
				local var_392_4 = arg_389_1:FormatText(var_392_3.content)

				arg_389_1.text_.text = var_392_4

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_5 = 6
				local var_392_6 = utf8.len(var_392_4)
				local var_392_7 = var_392_5 <= 0 and var_392_1 or var_392_1 * (var_392_6 / var_392_5)

				if var_392_7 > 0 and var_392_1 < var_392_7 then
					arg_389_1.talkMaxDuration = var_392_7

					if var_392_7 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_7 + var_392_0
					end
				end

				arg_389_1.text_.text = var_392_4
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_8 = math.max(var_392_1, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_8 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_0) / var_392_8

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_8 and arg_389_1.time_ < var_392_0 + var_392_8 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play114111097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 114111097
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play114111098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 1.075

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, false)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_2 = arg_393_1:GetWordFromCfg(114111097)
				local var_396_3 = arg_393_1:FormatText(var_396_2.content)

				arg_393_1.text_.text = var_396_3

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_4 = 43
				local var_396_5 = utf8.len(var_396_3)
				local var_396_6 = var_396_4 <= 0 and var_396_1 or var_396_1 * (var_396_5 / var_396_4)

				if var_396_6 > 0 and var_396_1 < var_396_6 then
					arg_393_1.talkMaxDuration = var_396_6

					if var_396_6 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_6 + var_396_0
					end
				end

				arg_393_1.text_.text = var_396_3
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_7 = math.max(var_396_1, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_7 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_0) / var_396_7

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_7 and arg_393_1.time_ < var_396_0 + var_396_7 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play114111098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 114111098
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play114111099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 1.675

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_2 = arg_397_1:GetWordFromCfg(114111098)
				local var_400_3 = arg_397_1:FormatText(var_400_2.content)

				arg_397_1.text_.text = var_400_3

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_4 = 67
				local var_400_5 = utf8.len(var_400_3)
				local var_400_6 = var_400_4 <= 0 and var_400_1 or var_400_1 * (var_400_5 / var_400_4)

				if var_400_6 > 0 and var_400_1 < var_400_6 then
					arg_397_1.talkMaxDuration = var_400_6

					if var_400_6 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_6 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_3
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_7 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_7 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_7

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_7 and arg_397_1.time_ < var_400_0 + var_400_7 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play114111099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 114111099
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play114111100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 0.325

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_2 = arg_401_1:FormatText(StoryNameCfg[7].name)

				arg_401_1.leftNameTxt_.text = var_404_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_3 = arg_401_1:GetWordFromCfg(114111099)
				local var_404_4 = arg_401_1:FormatText(var_404_3.content)

				arg_401_1.text_.text = var_404_4

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_5 = 13
				local var_404_6 = utf8.len(var_404_4)
				local var_404_7 = var_404_5 <= 0 and var_404_1 or var_404_1 * (var_404_6 / var_404_5)

				if var_404_7 > 0 and var_404_1 < var_404_7 then
					arg_401_1.talkMaxDuration = var_404_7

					if var_404_7 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_7 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_4
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_8 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_8 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_8

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_8 and arg_401_1.time_ < var_404_0 + var_404_8 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play114111100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 114111100
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play114111101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 1.775

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_2 = arg_405_1:GetWordFromCfg(114111100)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 71
				local var_408_5 = utf8.len(var_408_3)
				local var_408_6 = var_408_4 <= 0 and var_408_1 or var_408_1 * (var_408_5 / var_408_4)

				if var_408_6 > 0 and var_408_1 < var_408_6 then
					arg_405_1.talkMaxDuration = var_408_6

					if var_408_6 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_6 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_3
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_7 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_7 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_7

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_7 and arg_405_1.time_ < var_408_0 + var_408_7 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play114111101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 114111101
		arg_409_1.duration_ = 4.866

		local var_409_0 = {
			ja = 4.8,
			ko = 4.866,
			zh = 4.633,
			en = 4.366
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
				arg_409_0:Play114111102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0
			local var_412_1 = 0.5

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_2 = arg_409_1:FormatText(StoryNameCfg[10].name)

				arg_409_1.leftNameTxt_.text = var_412_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, true)
				arg_409_1.iconController_:SetSelectedState("hero")

				arg_409_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_3 = arg_409_1:GetWordFromCfg(114111101)
				local var_412_4 = arg_409_1:FormatText(var_412_3.content)

				arg_409_1.text_.text = var_412_4

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111101", "story_v_out_114111.awb") ~= 0 then
					local var_412_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111101", "story_v_out_114111.awb") / 1000

					if var_412_8 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_8 + var_412_0
					end

					if var_412_3.prefab_name ~= "" and arg_409_1.actors_[var_412_3.prefab_name] ~= nil then
						local var_412_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_3.prefab_name].transform, "story_v_out_114111", "114111101", "story_v_out_114111.awb")

						arg_409_1:RecordAudio("114111101", var_412_9)
						arg_409_1:RecordAudio("114111101", var_412_9)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_114111", "114111101", "story_v_out_114111.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_114111", "114111101", "story_v_out_114111.awb")
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
	Play114111102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 114111102
		arg_413_1.duration_ = 2.533

		local var_413_0 = {
			ja = 2.533,
			ko = 1.999999999999,
			zh = 2.1,
			en = 1.999999999999
		}
		local var_413_1 = manager.audio:GetLocalizationFlag()

		if var_413_0[var_413_1] ~= nil then
			arg_413_1.duration_ = var_413_0[var_413_1]
		end

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play114111103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1041ui_story"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1041ui_story = var_416_0.localPosition

				local var_416_2 = "1041ui_story"

				arg_413_1:ShowWeapon(arg_413_1.var_[var_416_2 .. "Animator"].transform, true)
			end

			local var_416_3 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_3 then
				local var_416_4 = (arg_413_1.time_ - var_416_1) / var_416_3
				local var_416_5 = Vector3.New(-0.7, -1.11, -5.9)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1041ui_story, var_416_5, var_416_4)

				local var_416_6 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_6.x, var_416_6.y, var_416_6.z)

				local var_416_7 = var_416_0.localEulerAngles

				var_416_7.z = 0
				var_416_7.x = 0
				var_416_0.localEulerAngles = var_416_7
			end

			if arg_413_1.time_ >= var_416_1 + var_416_3 and arg_413_1.time_ < var_416_1 + var_416_3 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_416_8 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_8.x, var_416_8.y, var_416_8.z)

				local var_416_9 = var_416_0.localEulerAngles

				var_416_9.z = 0
				var_416_9.x = 0
				var_416_0.localEulerAngles = var_416_9
			end

			local var_416_10 = 0

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 then
				arg_413_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action8_1")
			end

			local var_416_11 = 0

			if var_416_11 < arg_413_1.time_ and arg_413_1.time_ <= var_416_11 + arg_416_0 then
				arg_413_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_416_12 = arg_413_1.actors_["1041ui_story"]
			local var_416_13 = 0

			if var_416_13 < arg_413_1.time_ and arg_413_1.time_ <= var_416_13 + arg_416_0 and arg_413_1.var_.characterEffect1041ui_story == nil then
				arg_413_1.var_.characterEffect1041ui_story = var_416_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_14 = 0.2

			if var_416_13 <= arg_413_1.time_ and arg_413_1.time_ < var_416_13 + var_416_14 then
				local var_416_15 = (arg_413_1.time_ - var_416_13) / var_416_14

				if arg_413_1.var_.characterEffect1041ui_story then
					arg_413_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_13 + var_416_14 and arg_413_1.time_ < var_416_13 + var_416_14 + arg_416_0 and arg_413_1.var_.characterEffect1041ui_story then
				arg_413_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_416_16 = 0
			local var_416_17 = 0.2

			if var_416_16 < arg_413_1.time_ and arg_413_1.time_ <= var_416_16 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_18 = arg_413_1:FormatText(StoryNameCfg[208].name)

				arg_413_1.leftNameTxt_.text = var_416_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_19 = arg_413_1:GetWordFromCfg(114111102)
				local var_416_20 = arg_413_1:FormatText(var_416_19.content)

				arg_413_1.text_.text = var_416_20

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_21 = 8
				local var_416_22 = utf8.len(var_416_20)
				local var_416_23 = var_416_21 <= 0 and var_416_17 or var_416_17 * (var_416_22 / var_416_21)

				if var_416_23 > 0 and var_416_17 < var_416_23 then
					arg_413_1.talkMaxDuration = var_416_23

					if var_416_23 + var_416_16 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_23 + var_416_16
					end
				end

				arg_413_1.text_.text = var_416_20
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111102", "story_v_out_114111.awb") ~= 0 then
					local var_416_24 = manager.audio:GetVoiceLength("story_v_out_114111", "114111102", "story_v_out_114111.awb") / 1000

					if var_416_24 + var_416_16 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_24 + var_416_16
					end

					if var_416_19.prefab_name ~= "" and arg_413_1.actors_[var_416_19.prefab_name] ~= nil then
						local var_416_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_19.prefab_name].transform, "story_v_out_114111", "114111102", "story_v_out_114111.awb")

						arg_413_1:RecordAudio("114111102", var_416_25)
						arg_413_1:RecordAudio("114111102", var_416_25)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_114111", "114111102", "story_v_out_114111.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_114111", "114111102", "story_v_out_114111.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_26 = math.max(var_416_17, arg_413_1.talkMaxDuration)

			if var_416_16 <= arg_413_1.time_ and arg_413_1.time_ < var_416_16 + var_416_26 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_16) / var_416_26

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_16 + var_416_26 and arg_413_1.time_ < var_416_16 + var_416_26 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play114111103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 114111103
		arg_417_1.duration_ = 3.866

		local var_417_0 = {
			ja = 3.866,
			ko = 2.6,
			zh = 2.333,
			en = 2.4
		}
		local var_417_1 = manager.audio:GetLocalizationFlag()

		if var_417_0[var_417_1] ~= nil then
			arg_417_1.duration_ = var_417_0[var_417_1]
		end

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play114111104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1041ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect1041ui_story == nil then
				arg_417_1.var_.characterEffect1041ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect1041ui_story then
					local var_420_4 = Mathf.Lerp(0, 0.5, var_420_3)

					arg_417_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1041ui_story.fillRatio = var_420_4
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect1041ui_story then
				local var_420_5 = 0.5

				arg_417_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1041ui_story.fillRatio = var_420_5
			end

			local var_420_6 = arg_417_1.actors_["1038ui_story"].transform
			local var_420_7 = 0

			if var_420_7 < arg_417_1.time_ and arg_417_1.time_ <= var_420_7 + arg_420_0 then
				arg_417_1.var_.moveOldPos1038ui_story = var_420_6.localPosition
			end

			local var_420_8 = 0.001

			if var_420_7 <= arg_417_1.time_ and arg_417_1.time_ < var_420_7 + var_420_8 then
				local var_420_9 = (arg_417_1.time_ - var_420_7) / var_420_8
				local var_420_10 = Vector3.New(0.7, -1.11, -5.9)

				var_420_6.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1038ui_story, var_420_10, var_420_9)

				local var_420_11 = manager.ui.mainCamera.transform.position - var_420_6.position

				var_420_6.forward = Vector3.New(var_420_11.x, var_420_11.y, var_420_11.z)

				local var_420_12 = var_420_6.localEulerAngles

				var_420_12.z = 0
				var_420_12.x = 0
				var_420_6.localEulerAngles = var_420_12
			end

			if arg_417_1.time_ >= var_420_7 + var_420_8 and arg_417_1.time_ < var_420_7 + var_420_8 + arg_420_0 then
				var_420_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_420_13 = manager.ui.mainCamera.transform.position - var_420_6.position

				var_420_6.forward = Vector3.New(var_420_13.x, var_420_13.y, var_420_13.z)

				local var_420_14 = var_420_6.localEulerAngles

				var_420_14.z = 0
				var_420_14.x = 0
				var_420_6.localEulerAngles = var_420_14
			end

			local var_420_15 = 0

			if var_420_15 < arg_417_1.time_ and arg_417_1.time_ <= var_420_15 + arg_420_0 then
				arg_417_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action7_1")
			end

			local var_420_16 = 0

			if var_420_16 < arg_417_1.time_ and arg_417_1.time_ <= var_420_16 + arg_420_0 then
				arg_417_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_420_17 = arg_417_1.actors_["1038ui_story"]
			local var_420_18 = 0

			if var_420_18 < arg_417_1.time_ and arg_417_1.time_ <= var_420_18 + arg_420_0 and arg_417_1.var_.characterEffect1038ui_story == nil then
				arg_417_1.var_.characterEffect1038ui_story = var_420_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_19 = 0.2

			if var_420_18 <= arg_417_1.time_ and arg_417_1.time_ < var_420_18 + var_420_19 then
				local var_420_20 = (arg_417_1.time_ - var_420_18) / var_420_19

				if arg_417_1.var_.characterEffect1038ui_story then
					arg_417_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_18 + var_420_19 and arg_417_1.time_ < var_420_18 + var_420_19 + arg_420_0 and arg_417_1.var_.characterEffect1038ui_story then
				arg_417_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_420_21 = 0
			local var_420_22 = 0.325

			if var_420_21 < arg_417_1.time_ and arg_417_1.time_ <= var_420_21 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_23 = arg_417_1:FormatText(StoryNameCfg[94].name)

				arg_417_1.leftNameTxt_.text = var_420_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_24 = arg_417_1:GetWordFromCfg(114111103)
				local var_420_25 = arg_417_1:FormatText(var_420_24.content)

				arg_417_1.text_.text = var_420_25

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_26 = 13
				local var_420_27 = utf8.len(var_420_25)
				local var_420_28 = var_420_26 <= 0 and var_420_22 or var_420_22 * (var_420_27 / var_420_26)

				if var_420_28 > 0 and var_420_22 < var_420_28 then
					arg_417_1.talkMaxDuration = var_420_28

					if var_420_28 + var_420_21 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_28 + var_420_21
					end
				end

				arg_417_1.text_.text = var_420_25
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111103", "story_v_out_114111.awb") ~= 0 then
					local var_420_29 = manager.audio:GetVoiceLength("story_v_out_114111", "114111103", "story_v_out_114111.awb") / 1000

					if var_420_29 + var_420_21 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_29 + var_420_21
					end

					if var_420_24.prefab_name ~= "" and arg_417_1.actors_[var_420_24.prefab_name] ~= nil then
						local var_420_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_24.prefab_name].transform, "story_v_out_114111", "114111103", "story_v_out_114111.awb")

						arg_417_1:RecordAudio("114111103", var_420_30)
						arg_417_1:RecordAudio("114111103", var_420_30)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_114111", "114111103", "story_v_out_114111.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_114111", "114111103", "story_v_out_114111.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_31 = math.max(var_420_22, arg_417_1.talkMaxDuration)

			if var_420_21 <= arg_417_1.time_ and arg_417_1.time_ < var_420_21 + var_420_31 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_21) / var_420_31

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_21 + var_420_31 and arg_417_1.time_ < var_420_21 + var_420_31 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play114111104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 114111104
		arg_421_1.duration_ = 4.2

		local var_421_0 = {
			ja = 4.2,
			ko = 2.633,
			zh = 2.133,
			en = 1.999999999999
		}
		local var_421_1 = manager.audio:GetLocalizationFlag()

		if var_421_0[var_421_1] ~= nil then
			arg_421_1.duration_ = var_421_0[var_421_1]
		end

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play114111105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1038ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1038ui_story == nil then
				arg_421_1.var_.characterEffect1038ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.2

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1038ui_story then
					local var_424_4 = Mathf.Lerp(0, 0.5, var_424_3)

					arg_421_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1038ui_story.fillRatio = var_424_4
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1038ui_story then
				local var_424_5 = 0.5

				arg_421_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1038ui_story.fillRatio = var_424_5
			end

			local var_424_6 = arg_421_1.actors_["1041ui_story"]
			local var_424_7 = 0

			if var_424_7 < arg_421_1.time_ and arg_421_1.time_ <= var_424_7 + arg_424_0 and arg_421_1.var_.characterEffect1041ui_story == nil then
				arg_421_1.var_.characterEffect1041ui_story = var_424_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_8 = 0.2

			if var_424_7 <= arg_421_1.time_ and arg_421_1.time_ < var_424_7 + var_424_8 then
				local var_424_9 = (arg_421_1.time_ - var_424_7) / var_424_8

				if arg_421_1.var_.characterEffect1041ui_story then
					arg_421_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_7 + var_424_8 and arg_421_1.time_ < var_424_7 + var_424_8 + arg_424_0 and arg_421_1.var_.characterEffect1041ui_story then
				arg_421_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 then
				arg_421_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_424_11 = 0
			local var_424_12 = 0.175

			if var_424_11 < arg_421_1.time_ and arg_421_1.time_ <= var_424_11 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_13 = arg_421_1:FormatText(StoryNameCfg[208].name)

				arg_421_1.leftNameTxt_.text = var_424_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_14 = arg_421_1:GetWordFromCfg(114111104)
				local var_424_15 = arg_421_1:FormatText(var_424_14.content)

				arg_421_1.text_.text = var_424_15

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_16 = 7
				local var_424_17 = utf8.len(var_424_15)
				local var_424_18 = var_424_16 <= 0 and var_424_12 or var_424_12 * (var_424_17 / var_424_16)

				if var_424_18 > 0 and var_424_12 < var_424_18 then
					arg_421_1.talkMaxDuration = var_424_18

					if var_424_18 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_18 + var_424_11
					end
				end

				arg_421_1.text_.text = var_424_15
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111104", "story_v_out_114111.awb") ~= 0 then
					local var_424_19 = manager.audio:GetVoiceLength("story_v_out_114111", "114111104", "story_v_out_114111.awb") / 1000

					if var_424_19 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_11
					end

					if var_424_14.prefab_name ~= "" and arg_421_1.actors_[var_424_14.prefab_name] ~= nil then
						local var_424_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_14.prefab_name].transform, "story_v_out_114111", "114111104", "story_v_out_114111.awb")

						arg_421_1:RecordAudio("114111104", var_424_20)
						arg_421_1:RecordAudio("114111104", var_424_20)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_114111", "114111104", "story_v_out_114111.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_114111", "114111104", "story_v_out_114111.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_21 = math.max(var_424_12, arg_421_1.talkMaxDuration)

			if var_424_11 <= arg_421_1.time_ and arg_421_1.time_ < var_424_11 + var_424_21 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_11) / var_424_21

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_11 + var_424_21 and arg_421_1.time_ < var_424_11 + var_424_21 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play114111105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 114111105
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play114111106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1038ui_story"].transform
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				arg_425_1.var_.moveOldPos1038ui_story = var_428_0.localPosition
			end

			local var_428_2 = 0.001

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2
				local var_428_4 = Vector3.New(0, 100, 0)

				var_428_0.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1038ui_story, var_428_4, var_428_3)

				local var_428_5 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_5.x, var_428_5.y, var_428_5.z)

				local var_428_6 = var_428_0.localEulerAngles

				var_428_6.z = 0
				var_428_6.x = 0
				var_428_0.localEulerAngles = var_428_6
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 then
				var_428_0.localPosition = Vector3.New(0, 100, 0)

				local var_428_7 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_7.x, var_428_7.y, var_428_7.z)

				local var_428_8 = var_428_0.localEulerAngles

				var_428_8.z = 0
				var_428_8.x = 0
				var_428_0.localEulerAngles = var_428_8
			end

			local var_428_9 = arg_425_1.actors_["1041ui_story"].transform
			local var_428_10 = 0

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 then
				arg_425_1.var_.moveOldPos1041ui_story = var_428_9.localPosition
			end

			local var_428_11 = 0.001

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_11 then
				local var_428_12 = (arg_425_1.time_ - var_428_10) / var_428_11
				local var_428_13 = Vector3.New(0, 100, 0)

				var_428_9.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1041ui_story, var_428_13, var_428_12)

				local var_428_14 = manager.ui.mainCamera.transform.position - var_428_9.position

				var_428_9.forward = Vector3.New(var_428_14.x, var_428_14.y, var_428_14.z)

				local var_428_15 = var_428_9.localEulerAngles

				var_428_15.z = 0
				var_428_15.x = 0
				var_428_9.localEulerAngles = var_428_15
			end

			if arg_425_1.time_ >= var_428_10 + var_428_11 and arg_425_1.time_ < var_428_10 + var_428_11 + arg_428_0 then
				var_428_9.localPosition = Vector3.New(0, 100, 0)

				local var_428_16 = manager.ui.mainCamera.transform.position - var_428_9.position

				var_428_9.forward = Vector3.New(var_428_16.x, var_428_16.y, var_428_16.z)

				local var_428_17 = var_428_9.localEulerAngles

				var_428_17.z = 0
				var_428_17.x = 0
				var_428_9.localEulerAngles = var_428_17
			end

			local var_428_18 = 0
			local var_428_19 = 1.025

			if var_428_18 < arg_425_1.time_ and arg_425_1.time_ <= var_428_18 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_20 = arg_425_1:GetWordFromCfg(114111105)
				local var_428_21 = arg_425_1:FormatText(var_428_20.content)

				arg_425_1.text_.text = var_428_21

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_22 = 41
				local var_428_23 = utf8.len(var_428_21)
				local var_428_24 = var_428_22 <= 0 and var_428_19 or var_428_19 * (var_428_23 / var_428_22)

				if var_428_24 > 0 and var_428_19 < var_428_24 then
					arg_425_1.talkMaxDuration = var_428_24

					if var_428_24 + var_428_18 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_24 + var_428_18
					end
				end

				arg_425_1.text_.text = var_428_21
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_25 = math.max(var_428_19, arg_425_1.talkMaxDuration)

			if var_428_18 <= arg_425_1.time_ and arg_425_1.time_ < var_428_18 + var_428_25 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_18) / var_428_25

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_18 + var_428_25 and arg_425_1.time_ < var_428_18 + var_428_25 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play114111106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 114111106
		arg_429_1.duration_ = 9

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play114111107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0

			if var_432_0 < arg_429_1.time_ and arg_429_1.time_ <= var_432_0 + arg_432_0 then
				arg_429_1.mask_.enabled = true
				arg_429_1.mask_.raycastTarget = true

				arg_429_1:SetGaussion(false)
			end

			local var_432_1 = 2

			if var_432_0 <= arg_429_1.time_ and arg_429_1.time_ < var_432_0 + var_432_1 then
				local var_432_2 = (arg_429_1.time_ - var_432_0) / var_432_1
				local var_432_3 = Color.New(0, 0, 0)

				var_432_3.a = Mathf.Lerp(0, 1, var_432_2)
				arg_429_1.mask_.color = var_432_3
			end

			if arg_429_1.time_ >= var_432_0 + var_432_1 and arg_429_1.time_ < var_432_0 + var_432_1 + arg_432_0 then
				local var_432_4 = Color.New(0, 0, 0)

				var_432_4.a = 1
				arg_429_1.mask_.color = var_432_4
			end

			local var_432_5 = 2

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 then
				arg_429_1.mask_.enabled = true
				arg_429_1.mask_.raycastTarget = true

				arg_429_1:SetGaussion(false)
			end

			local var_432_6 = 2

			if var_432_5 <= arg_429_1.time_ and arg_429_1.time_ < var_432_5 + var_432_6 then
				local var_432_7 = (arg_429_1.time_ - var_432_5) / var_432_6
				local var_432_8 = Color.New(0, 0, 0)

				var_432_8.a = Mathf.Lerp(1, 0, var_432_7)
				arg_429_1.mask_.color = var_432_8
			end

			if arg_429_1.time_ >= var_432_5 + var_432_6 and arg_429_1.time_ < var_432_5 + var_432_6 + arg_432_0 then
				local var_432_9 = Color.New(0, 0, 0)
				local var_432_10 = 0

				arg_429_1.mask_.enabled = false
				var_432_9.a = var_432_10
				arg_429_1.mask_.color = var_432_9
			end

			local var_432_11 = "OM0211"

			if arg_429_1.bgs_[var_432_11] == nil then
				local var_432_12 = Object.Instantiate(arg_429_1.paintGo_)

				var_432_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_432_11)
				var_432_12.name = var_432_11
				var_432_12.transform.parent = arg_429_1.stage_.transform
				var_432_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_429_1.bgs_[var_432_11] = var_432_12
			end

			local var_432_13 = 2

			if var_432_13 < arg_429_1.time_ and arg_429_1.time_ <= var_432_13 + arg_432_0 then
				local var_432_14 = manager.ui.mainCamera.transform.localPosition
				local var_432_15 = Vector3.New(0, 0, 10) + Vector3.New(var_432_14.x, var_432_14.y, 0)
				local var_432_16 = arg_429_1.bgs_.OM0211

				var_432_16.transform.localPosition = var_432_15
				var_432_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_432_17 = var_432_16:GetComponent("SpriteRenderer")

				if var_432_17 and var_432_17.sprite then
					local var_432_18 = (var_432_16.transform.localPosition - var_432_14).z
					local var_432_19 = manager.ui.mainCameraCom_
					local var_432_20 = 2 * var_432_18 * Mathf.Tan(var_432_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_432_21 = var_432_20 * var_432_19.aspect
					local var_432_22 = var_432_17.sprite.bounds.size.x
					local var_432_23 = var_432_17.sprite.bounds.size.y
					local var_432_24 = var_432_21 / var_432_22
					local var_432_25 = var_432_20 / var_432_23
					local var_432_26 = var_432_25 < var_432_24 and var_432_24 or var_432_25

					var_432_16.transform.localScale = Vector3.New(var_432_26, var_432_26, 0)
				end

				for iter_432_0, iter_432_1 in pairs(arg_429_1.bgs_) do
					if iter_432_0 ~= "OM0211" then
						iter_432_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_432_27 = arg_429_1.bgs_.OM0211.transform
			local var_432_28 = 2

			if var_432_28 < arg_429_1.time_ and arg_429_1.time_ <= var_432_28 + arg_432_0 then
				arg_429_1.var_.moveOldPosOM0211 = var_432_27.localPosition
			end

			local var_432_29 = 0.001

			if var_432_28 <= arg_429_1.time_ and arg_429_1.time_ < var_432_28 + var_432_29 then
				local var_432_30 = (arg_429_1.time_ - var_432_28) / var_432_29
				local var_432_31 = Vector3.New(0, 1, 9)

				var_432_27.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPosOM0211, var_432_31, var_432_30)
			end

			if arg_429_1.time_ >= var_432_28 + var_432_29 and arg_429_1.time_ < var_432_28 + var_432_29 + arg_432_0 then
				var_432_27.localPosition = Vector3.New(0, 1, 9)
			end

			local var_432_32 = arg_429_1.bgs_.OM0211.transform
			local var_432_33 = 2.034

			if var_432_33 < arg_429_1.time_ and arg_429_1.time_ <= var_432_33 + arg_432_0 then
				arg_429_1.var_.moveOldPosOM0211 = var_432_32.localPosition
			end

			local var_432_34 = 3.5

			if var_432_33 <= arg_429_1.time_ and arg_429_1.time_ < var_432_33 + var_432_34 then
				local var_432_35 = (arg_429_1.time_ - var_432_33) / var_432_34
				local var_432_36 = Vector3.New(0, 1, 10)

				var_432_32.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPosOM0211, var_432_36, var_432_35)
			end

			if arg_429_1.time_ >= var_432_33 + var_432_34 and arg_429_1.time_ < var_432_33 + var_432_34 + arg_432_0 then
				var_432_32.localPosition = Vector3.New(0, 1, 10)
			end

			local var_432_37 = 4

			if var_432_37 < arg_429_1.time_ and arg_429_1.time_ <= var_432_37 + arg_432_0 then
				arg_429_1.allBtn_.enabled = false
			end

			local var_432_38 = 1.534

			if arg_429_1.time_ >= var_432_37 + var_432_38 and arg_429_1.time_ < var_432_37 + var_432_38 + arg_432_0 then
				arg_429_1.allBtn_.enabled = true
			end

			if arg_429_1.frameCnt_ <= 1 then
				arg_429_1.dialog_:SetActive(false)
			end

			local var_432_39 = 4
			local var_432_40 = 1.55

			if var_432_39 < arg_429_1.time_ and arg_429_1.time_ <= var_432_39 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0

				arg_429_1.dialog_:SetActive(true)

				local var_432_41 = LeanTween.value(arg_429_1.dialog_, 0, 1, 0.3)

				var_432_41:setOnUpdate(LuaHelper.FloatAction(function(arg_433_0)
					arg_429_1.dialogCg_.alpha = arg_433_0
				end))
				var_432_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_429_1.dialog_)
					var_432_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_429_1.duration_ = arg_429_1.duration_ + 0.3

				SetActive(arg_429_1.leftNameGo_, false)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_42 = arg_429_1:GetWordFromCfg(114111106)
				local var_432_43 = arg_429_1:FormatText(var_432_42.content)

				arg_429_1.text_.text = var_432_43

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_44 = 62
				local var_432_45 = utf8.len(var_432_43)
				local var_432_46 = var_432_44 <= 0 and var_432_40 or var_432_40 * (var_432_45 / var_432_44)

				if var_432_46 > 0 and var_432_40 < var_432_46 then
					arg_429_1.talkMaxDuration = var_432_46
					var_432_39 = var_432_39 + 0.3

					if var_432_46 + var_432_39 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_46 + var_432_39
					end
				end

				arg_429_1.text_.text = var_432_43
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_47 = var_432_39 + 0.3
			local var_432_48 = math.max(var_432_40, arg_429_1.talkMaxDuration)

			if var_432_47 <= arg_429_1.time_ and arg_429_1.time_ < var_432_47 + var_432_48 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_47) / var_432_48

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_47 + var_432_48 and arg_429_1.time_ < var_432_47 + var_432_48 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play114111107 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 114111107
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play114111108(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.725

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_2 = arg_435_1:GetWordFromCfg(114111107)
				local var_438_3 = arg_435_1:FormatText(var_438_2.content)

				arg_435_1.text_.text = var_438_3

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_4 = 29
				local var_438_5 = utf8.len(var_438_3)
				local var_438_6 = var_438_4 <= 0 and var_438_1 or var_438_1 * (var_438_5 / var_438_4)

				if var_438_6 > 0 and var_438_1 < var_438_6 then
					arg_435_1.talkMaxDuration = var_438_6

					if var_438_6 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_6 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_3
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_7 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_7 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_7

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_7 and arg_435_1.time_ < var_438_0 + var_438_7 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play114111108 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 114111108
		arg_439_1.duration_ = 5.566

		local var_439_0 = {
			ja = 5.066,
			ko = 5.566,
			zh = 4.166,
			en = 4.733
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play114111109(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.55

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[6].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, true)
				arg_439_1.iconController_:SetSelectedState("hero")

				arg_439_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(114111108)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 22
				local var_442_6 = utf8.len(var_442_4)
				local var_442_7 = var_442_5 <= 0 and var_442_1 or var_442_1 * (var_442_6 / var_442_5)

				if var_442_7 > 0 and var_442_1 < var_442_7 then
					arg_439_1.talkMaxDuration = var_442_7

					if var_442_7 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_7 + var_442_0
					end
				end

				arg_439_1.text_.text = var_442_4
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111108", "story_v_out_114111.awb") ~= 0 then
					local var_442_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111108", "story_v_out_114111.awb") / 1000

					if var_442_8 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_8 + var_442_0
					end

					if var_442_3.prefab_name ~= "" and arg_439_1.actors_[var_442_3.prefab_name] ~= nil then
						local var_442_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_3.prefab_name].transform, "story_v_out_114111", "114111108", "story_v_out_114111.awb")

						arg_439_1:RecordAudio("114111108", var_442_9)
						arg_439_1:RecordAudio("114111108", var_442_9)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_114111", "114111108", "story_v_out_114111.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_114111", "114111108", "story_v_out_114111.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_10 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_10 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_10

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_10 and arg_439_1.time_ < var_442_0 + var_442_10 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play114111109 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 114111109
		arg_443_1.duration_ = 9.033

		local var_443_0 = {
			ja = 4.866,
			ko = 8.9,
			zh = 7.5,
			en = 9.033
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play114111110(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 0.9

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_2 = arg_443_1:FormatText(StoryNameCfg[94].name)

				arg_443_1.leftNameTxt_.text = var_446_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, true)
				arg_443_1.iconController_:SetSelectedState("hero")

				arg_443_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_5")

				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_3 = arg_443_1:GetWordFromCfg(114111109)
				local var_446_4 = arg_443_1:FormatText(var_446_3.content)

				arg_443_1.text_.text = var_446_4

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_5 = 36
				local var_446_6 = utf8.len(var_446_4)
				local var_446_7 = var_446_5 <= 0 and var_446_1 or var_446_1 * (var_446_6 / var_446_5)

				if var_446_7 > 0 and var_446_1 < var_446_7 then
					arg_443_1.talkMaxDuration = var_446_7

					if var_446_7 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_7 + var_446_0
					end
				end

				arg_443_1.text_.text = var_446_4
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111109", "story_v_out_114111.awb") ~= 0 then
					local var_446_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111109", "story_v_out_114111.awb") / 1000

					if var_446_8 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_8 + var_446_0
					end

					if var_446_3.prefab_name ~= "" and arg_443_1.actors_[var_446_3.prefab_name] ~= nil then
						local var_446_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_3.prefab_name].transform, "story_v_out_114111", "114111109", "story_v_out_114111.awb")

						arg_443_1:RecordAudio("114111109", var_446_9)
						arg_443_1:RecordAudio("114111109", var_446_9)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_114111", "114111109", "story_v_out_114111.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_114111", "114111109", "story_v_out_114111.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_10 = math.max(var_446_1, arg_443_1.talkMaxDuration)

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_10 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_0) / var_446_10

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_0 + var_446_10 and arg_443_1.time_ < var_446_0 + var_446_10 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play114111110 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 114111110
		arg_447_1.duration_ = 7.4

		local var_447_0 = {
			ja = 7.4,
			ko = 5.2,
			zh = 5.966,
			en = 4.966
		}
		local var_447_1 = manager.audio:GetLocalizationFlag()

		if var_447_0[var_447_1] ~= nil then
			arg_447_1.duration_ = var_447_0[var_447_1]
		end

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play114111111(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.525

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[208].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, true)
				arg_447_1.iconController_:SetSelectedState("hero")

				arg_447_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(114111110)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 21
				local var_450_6 = utf8.len(var_450_4)
				local var_450_7 = var_450_5 <= 0 and var_450_1 or var_450_1 * (var_450_6 / var_450_5)

				if var_450_7 > 0 and var_450_1 < var_450_7 then
					arg_447_1.talkMaxDuration = var_450_7

					if var_450_7 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_7 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_4
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114111", "114111110", "story_v_out_114111.awb") ~= 0 then
					local var_450_8 = manager.audio:GetVoiceLength("story_v_out_114111", "114111110", "story_v_out_114111.awb") / 1000

					if var_450_8 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_0
					end

					if var_450_3.prefab_name ~= "" and arg_447_1.actors_[var_450_3.prefab_name] ~= nil then
						local var_450_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_3.prefab_name].transform, "story_v_out_114111", "114111110", "story_v_out_114111.awb")

						arg_447_1:RecordAudio("114111110", var_450_9)
						arg_447_1:RecordAudio("114111110", var_450_9)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_114111", "114111110", "story_v_out_114111.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_114111", "114111110", "story_v_out_114111.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_10 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_10 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_10

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_10 and arg_447_1.time_ < var_450_0 + var_450_10 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play114111111 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 114111111
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play114111112(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 1.525

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_2 = arg_451_1:GetWordFromCfg(114111111)
				local var_454_3 = arg_451_1:FormatText(var_454_2.content)

				arg_451_1.text_.text = var_454_3

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_4 = 61
				local var_454_5 = utf8.len(var_454_3)
				local var_454_6 = var_454_4 <= 0 and var_454_1 or var_454_1 * (var_454_5 / var_454_4)

				if var_454_6 > 0 and var_454_1 < var_454_6 then
					arg_451_1.talkMaxDuration = var_454_6

					if var_454_6 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_6 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_3
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_7 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_7 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_7

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_7 and arg_451_1.time_ < var_454_0 + var_454_7 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play114111112 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 114111112
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play114111113(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 1.425

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_2 = arg_455_1:GetWordFromCfg(114111112)
				local var_458_3 = arg_455_1:FormatText(var_458_2.content)

				arg_455_1.text_.text = var_458_3

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_4 = 57
				local var_458_5 = utf8.len(var_458_3)
				local var_458_6 = var_458_4 <= 0 and var_458_1 or var_458_1 * (var_458_5 / var_458_4)

				if var_458_6 > 0 and var_458_1 < var_458_6 then
					arg_455_1.talkMaxDuration = var_458_6

					if var_458_6 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_6 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_3
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_7 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_7 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_7

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_7 and arg_455_1.time_ < var_458_0 + var_458_7 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play114111113 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 114111113
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
			arg_459_1.auto_ = false
		end

		function arg_459_1.playNext_(arg_461_0)
			arg_459_1.onStoryFinished_()
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 1.175

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

				local var_462_2 = arg_459_1:GetWordFromCfg(114111113)
				local var_462_3 = arg_459_1:FormatText(var_462_2.content)

				arg_459_1.text_.text = var_462_3

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_4 = 47
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0206",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F05_1",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0211"
	},
	voices = {
		"story_v_out_114111.awb"
	}
}
