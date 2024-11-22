return {
	Play121531001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 121531001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play121531002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST37a"

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
				local var_4_5 = arg_1_1.bgs_.ST37a

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
					if iter_4_0 ~= "ST37a" then
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
			local var_4_23 = 0.0666666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.2
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.475

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

				local var_4_33 = arg_1_1:GetWordFromCfg(121531001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 59
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
	Play121531002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 121531002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play121531003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

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

				local var_10_2 = arg_7_1:GetWordFromCfg(121531002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 40
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
	Play121531003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 121531003
		arg_11_1.duration_ = 11.1

		local var_11_0 = {
			ja = 9.366,
			ko = 11.1,
			zh = 11.1
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
				arg_11_0:Play121531004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1074ui_story"

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

			local var_14_4 = arg_11_1.actors_["1074ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1074ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -1.055, -6.12)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1074ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1074ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1074ui_story == nil then
				arg_11_1.var_.characterEffect1074ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1074ui_story then
					arg_11_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1074ui_story then
				arg_11_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = 0
			local var_14_20 = 0.8

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[410].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(121531003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 32
				local var_14_25 = utf8.len(var_14_23)
				local var_14_26 = var_14_24 <= 0 and var_14_20 or var_14_20 * (var_14_25 / var_14_24)

				if var_14_26 > 0 and var_14_20 < var_14_26 then
					arg_11_1.talkMaxDuration = var_14_26

					if var_14_26 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_26 + var_14_19
					end
				end

				arg_11_1.text_.text = var_14_23
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531003", "story_v_out_121531.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_121531", "121531003", "story_v_out_121531.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_121531", "121531003", "story_v_out_121531.awb")

						arg_11_1:RecordAudio("121531003", var_14_28)
						arg_11_1:RecordAudio("121531003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_121531", "121531003", "story_v_out_121531.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_121531", "121531003", "story_v_out_121531.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_29 = math.max(var_14_20, arg_11_1.talkMaxDuration)

			if var_14_19 <= arg_11_1.time_ and arg_11_1.time_ < var_14_19 + var_14_29 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_19) / var_14_29

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_19 + var_14_29 and arg_11_1.time_ < var_14_19 + var_14_29 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play121531004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 121531004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play121531005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1074ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1074ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1074ui_story, var_18_4, var_18_3)

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

			local var_18_9 = arg_15_1.actors_["1074ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1074ui_story == nil then
				arg_15_1.var_.characterEffect1074ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1074ui_story then
					local var_18_13 = Mathf.Lerp(0, 0.5, var_18_12)

					arg_15_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1074ui_story.fillRatio = var_18_13
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1074ui_story then
				local var_18_14 = 0.5

				arg_15_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1074ui_story.fillRatio = var_18_14
			end

			local var_18_15 = 0
			local var_18_16 = 0.9

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_17 = arg_15_1:GetWordFromCfg(121531004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 36
				local var_18_20 = utf8.len(var_18_18)
				local var_18_21 = var_18_19 <= 0 and var_18_16 or var_18_16 * (var_18_20 / var_18_19)

				if var_18_21 > 0 and var_18_16 < var_18_21 then
					arg_15_1.talkMaxDuration = var_18_21

					if var_18_21 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_15
					end
				end

				arg_15_1.text_.text = var_18_18
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_16, arg_15_1.talkMaxDuration)

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_15) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_15 + var_18_22 and arg_15_1.time_ < var_18_15 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play121531005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 121531005
		arg_19_1.duration_ = 6

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play121531006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = manager.ui.mainCamera.transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.shakeOldPos = var_22_0.localPosition
			end

			local var_22_2 = 1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / 0.066
				local var_22_4, var_22_5 = math.modf(var_22_3)

				var_22_0.localPosition = Vector3.New(var_22_5 * 0.13, var_22_5 * 0.13, var_22_5 * 0.13) + arg_19_1.var_.shakeOldPos
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = arg_19_1.var_.shakeOldPos
			end

			local var_22_6 = 0

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.allBtn_.enabled = false
			end

			local var_22_7 = 1

			if arg_19_1.time_ >= var_22_6 + var_22_7 and arg_19_1.time_ < var_22_6 + var_22_7 + arg_22_0 then
				arg_19_1.allBtn_.enabled = true
			end

			local var_22_8 = 0
			local var_22_9 = 0.633333333333333

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 then
				local var_22_10 = "play"
				local var_22_11 = "effect"

				arg_19_1:AudioAction(var_22_10, var_22_11, "se_story_121_04", "se_story_121_04_earthquake_loop", "")
			end

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_12 = 1
			local var_22_13 = 1.325

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_14 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_14:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(121531005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 53
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_13 or var_22_13 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_13 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19
					var_22_12 = var_22_12 + 0.3

					if var_22_19 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_12
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_20 = var_22_12 + 0.3
			local var_22_21 = math.max(var_22_13, arg_19_1.talkMaxDuration)

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_20) / var_22_21

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play121531006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 121531006
		arg_25_1.duration_ = 6.8

		local var_25_0 = {
			ja = 3.866,
			ko = 6.8,
			zh = 6.8
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play121531007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1074ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos1074ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0, -1.055, -6.12)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1074ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["1074ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.characterEffect1074ui_story == nil then
				arg_25_1.var_.characterEffect1074ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect1074ui_story then
					arg_25_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.characterEffect1074ui_story then
				arg_25_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				arg_25_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_28_15 = 0
			local var_28_16 = 0.225

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_17 = arg_25_1:FormatText(StoryNameCfg[410].name)

				arg_25_1.leftNameTxt_.text = var_28_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_18 = arg_25_1:GetWordFromCfg(121531006)
				local var_28_19 = arg_25_1:FormatText(var_28_18.content)

				arg_25_1.text_.text = var_28_19

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_20 = 9
				local var_28_21 = utf8.len(var_28_19)
				local var_28_22 = var_28_20 <= 0 and var_28_16 or var_28_16 * (var_28_21 / var_28_20)

				if var_28_22 > 0 and var_28_16 < var_28_22 then
					arg_25_1.talkMaxDuration = var_28_22

					if var_28_22 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_22 + var_28_15
					end
				end

				arg_25_1.text_.text = var_28_19
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531006", "story_v_out_121531.awb") ~= 0 then
					local var_28_23 = manager.audio:GetVoiceLength("story_v_out_121531", "121531006", "story_v_out_121531.awb") / 1000

					if var_28_23 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_23 + var_28_15
					end

					if var_28_18.prefab_name ~= "" and arg_25_1.actors_[var_28_18.prefab_name] ~= nil then
						local var_28_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_18.prefab_name].transform, "story_v_out_121531", "121531006", "story_v_out_121531.awb")

						arg_25_1:RecordAudio("121531006", var_28_24)
						arg_25_1:RecordAudio("121531006", var_28_24)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_121531", "121531006", "story_v_out_121531.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_121531", "121531006", "story_v_out_121531.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_25 = math.max(var_28_16, arg_25_1.talkMaxDuration)

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_25 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_15) / var_28_25

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_15 + var_28_25 and arg_25_1.time_ < var_28_15 + var_28_25 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play121531007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 121531007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play121531008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1074ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos1074ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(0, 100, 0)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1074ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, 100, 0)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = arg_29_1.actors_["1074ui_story"]
			local var_32_10 = 0

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 and arg_29_1.var_.characterEffect1074ui_story == nil then
				arg_29_1.var_.characterEffect1074ui_story = var_32_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_11 = 0.200000002980232

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_11 then
				local var_32_12 = (arg_29_1.time_ - var_32_10) / var_32_11

				if arg_29_1.var_.characterEffect1074ui_story then
					local var_32_13 = Mathf.Lerp(0, 0.5, var_32_12)

					arg_29_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1074ui_story.fillRatio = var_32_13
				end
			end

			if arg_29_1.time_ >= var_32_10 + var_32_11 and arg_29_1.time_ < var_32_10 + var_32_11 + arg_32_0 and arg_29_1.var_.characterEffect1074ui_story then
				local var_32_14 = 0.5

				arg_29_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1074ui_story.fillRatio = var_32_14
			end

			local var_32_15 = 0
			local var_32_16 = 1.1

			if var_32_15 < arg_29_1.time_ and arg_29_1.time_ <= var_32_15 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_17 = arg_29_1:GetWordFromCfg(121531007)
				local var_32_18 = arg_29_1:FormatText(var_32_17.content)

				arg_29_1.text_.text = var_32_18

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_19 = 44
				local var_32_20 = utf8.len(var_32_18)
				local var_32_21 = var_32_19 <= 0 and var_32_16 or var_32_16 * (var_32_20 / var_32_19)

				if var_32_21 > 0 and var_32_16 < var_32_21 then
					arg_29_1.talkMaxDuration = var_32_21

					if var_32_21 + var_32_15 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_21 + var_32_15
					end
				end

				arg_29_1.text_.text = var_32_18
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_22 = math.max(var_32_16, arg_29_1.talkMaxDuration)

			if var_32_15 <= arg_29_1.time_ and arg_29_1.time_ < var_32_15 + var_32_22 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_15) / var_32_22

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_15 + var_32_22 and arg_29_1.time_ < var_32_15 + var_32_22 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play121531008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 121531008
		arg_33_1.duration_ = 3.866

		local var_33_0 = {
			ja = 3.866,
			ko = 2.933,
			zh = 2.933
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
				arg_33_0:Play121531009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1074ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1074ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0, -1.055, -6.12)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1074ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["1074ui_story"]
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 and arg_33_1.var_.characterEffect1074ui_story == nil then
				arg_33_1.var_.characterEffect1074ui_story = var_36_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_11 = 0.200000002980232

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11

				if arg_33_1.var_.characterEffect1074ui_story then
					arg_33_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 and arg_33_1.var_.characterEffect1074ui_story then
				arg_33_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_36_13 = 0

			if var_36_13 < arg_33_1.time_ and arg_33_1.time_ <= var_36_13 + arg_36_0 then
				arg_33_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_36_15 = 0
			local var_36_16 = 0.25

			if var_36_15 < arg_33_1.time_ and arg_33_1.time_ <= var_36_15 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_17 = arg_33_1:FormatText(StoryNameCfg[410].name)

				arg_33_1.leftNameTxt_.text = var_36_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_18 = arg_33_1:GetWordFromCfg(121531008)
				local var_36_19 = arg_33_1:FormatText(var_36_18.content)

				arg_33_1.text_.text = var_36_19

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_20 = 10
				local var_36_21 = utf8.len(var_36_19)
				local var_36_22 = var_36_20 <= 0 and var_36_16 or var_36_16 * (var_36_21 / var_36_20)

				if var_36_22 > 0 and var_36_16 < var_36_22 then
					arg_33_1.talkMaxDuration = var_36_22

					if var_36_22 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_22 + var_36_15
					end
				end

				arg_33_1.text_.text = var_36_19
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531008", "story_v_out_121531.awb") ~= 0 then
					local var_36_23 = manager.audio:GetVoiceLength("story_v_out_121531", "121531008", "story_v_out_121531.awb") / 1000

					if var_36_23 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_23 + var_36_15
					end

					if var_36_18.prefab_name ~= "" and arg_33_1.actors_[var_36_18.prefab_name] ~= nil then
						local var_36_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_18.prefab_name].transform, "story_v_out_121531", "121531008", "story_v_out_121531.awb")

						arg_33_1:RecordAudio("121531008", var_36_24)
						arg_33_1:RecordAudio("121531008", var_36_24)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_121531", "121531008", "story_v_out_121531.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_121531", "121531008", "story_v_out_121531.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_25 = math.max(var_36_16, arg_33_1.talkMaxDuration)

			if var_36_15 <= arg_33_1.time_ and arg_33_1.time_ < var_36_15 + var_36_25 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_15) / var_36_25

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_15 + var_36_25 and arg_33_1.time_ < var_36_15 + var_36_25 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play121531009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 121531009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play121531010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1074ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1074ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(0, 100, 0)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1074ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, 100, 0)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = arg_37_1.actors_["1074ui_story"]
			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 and arg_37_1.var_.characterEffect1074ui_story == nil then
				arg_37_1.var_.characterEffect1074ui_story = var_40_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_11 = 0.200000002980232

			if var_40_10 <= arg_37_1.time_ and arg_37_1.time_ < var_40_10 + var_40_11 then
				local var_40_12 = (arg_37_1.time_ - var_40_10) / var_40_11

				if arg_37_1.var_.characterEffect1074ui_story then
					local var_40_13 = Mathf.Lerp(0, 0.5, var_40_12)

					arg_37_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1074ui_story.fillRatio = var_40_13
				end
			end

			if arg_37_1.time_ >= var_40_10 + var_40_11 and arg_37_1.time_ < var_40_10 + var_40_11 + arg_40_0 and arg_37_1.var_.characterEffect1074ui_story then
				local var_40_14 = 0.5

				arg_37_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1074ui_story.fillRatio = var_40_14
			end

			local var_40_15 = 0
			local var_40_16 = 1.2

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_17 = arg_37_1:GetWordFromCfg(121531009)
				local var_40_18 = arg_37_1:FormatText(var_40_17.content)

				arg_37_1.text_.text = var_40_18

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_19 = 48
				local var_40_20 = utf8.len(var_40_18)
				local var_40_21 = var_40_19 <= 0 and var_40_16 or var_40_16 * (var_40_20 / var_40_19)

				if var_40_21 > 0 and var_40_16 < var_40_21 then
					arg_37_1.talkMaxDuration = var_40_21

					if var_40_21 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_21 + var_40_15
					end
				end

				arg_37_1.text_.text = var_40_18
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_22 = math.max(var_40_16, arg_37_1.talkMaxDuration)

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_22 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_15) / var_40_22

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_15 + var_40_22 and arg_37_1.time_ < var_40_15 + var_40_22 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play121531010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 121531010
		arg_41_1.duration_ = 7.966

		local var_41_0 = {
			ja = 7.966,
			ko = 6.966,
			zh = 6.966
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
				arg_41_0:Play121531011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1074ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1074ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1074ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["1074ui_story"]
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect1074ui_story == nil then
				arg_41_1.var_.characterEffect1074ui_story = var_44_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_11 = 0.200000002980232

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11

				if arg_41_1.var_.characterEffect1074ui_story then
					local var_44_13 = Mathf.Lerp(0, 0.5, var_44_12)

					arg_41_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1074ui_story.fillRatio = var_44_13
				end
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect1074ui_story then
				local var_44_14 = 0.5

				arg_41_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1074ui_story.fillRatio = var_44_14
			end

			local var_44_15 = "10044ui_story"

			if arg_41_1.actors_[var_44_15] == nil then
				local var_44_16 = Object.Instantiate(Asset.Load("Char/" .. var_44_15), arg_41_1.stage_.transform)

				var_44_16.name = var_44_15
				var_44_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_41_1.actors_[var_44_15] = var_44_16

				local var_44_17 = var_44_16:GetComponentInChildren(typeof(CharacterEffect))

				var_44_17.enabled = true

				local var_44_18 = GameObjectTools.GetOrAddComponent(var_44_16, typeof(DynamicBoneHelper))

				if var_44_18 then
					var_44_18:EnableDynamicBone(false)
				end

				arg_41_1:ShowWeapon(var_44_17.transform, false)

				arg_41_1.var_[var_44_15 .. "Animator"] = var_44_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_41_1.var_[var_44_15 .. "Animator"].applyRootMotion = true
				arg_41_1.var_[var_44_15 .. "LipSync"] = var_44_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_44_19 = arg_41_1.actors_["10044ui_story"].transform
			local var_44_20 = 0

			if var_44_20 < arg_41_1.time_ and arg_41_1.time_ <= var_44_20 + arg_44_0 then
				arg_41_1.var_.moveOldPos10044ui_story = var_44_19.localPosition
			end

			local var_44_21 = 0.001

			if var_44_20 <= arg_41_1.time_ and arg_41_1.time_ < var_44_20 + var_44_21 then
				local var_44_22 = (arg_41_1.time_ - var_44_20) / var_44_21
				local var_44_23 = Vector3.New(0.7, -0.72, -6.3)

				var_44_19.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos10044ui_story, var_44_23, var_44_22)

				local var_44_24 = manager.ui.mainCamera.transform.position - var_44_19.position

				var_44_19.forward = Vector3.New(var_44_24.x, var_44_24.y, var_44_24.z)

				local var_44_25 = var_44_19.localEulerAngles

				var_44_25.z = 0
				var_44_25.x = 0
				var_44_19.localEulerAngles = var_44_25
			end

			if arg_41_1.time_ >= var_44_20 + var_44_21 and arg_41_1.time_ < var_44_20 + var_44_21 + arg_44_0 then
				var_44_19.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_44_26 = manager.ui.mainCamera.transform.position - var_44_19.position

				var_44_19.forward = Vector3.New(var_44_26.x, var_44_26.y, var_44_26.z)

				local var_44_27 = var_44_19.localEulerAngles

				var_44_27.z = 0
				var_44_27.x = 0
				var_44_19.localEulerAngles = var_44_27
			end

			local var_44_28 = arg_41_1.actors_["10044ui_story"]
			local var_44_29 = 0

			if var_44_29 < arg_41_1.time_ and arg_41_1.time_ <= var_44_29 + arg_44_0 and arg_41_1.var_.characterEffect10044ui_story == nil then
				arg_41_1.var_.characterEffect10044ui_story = var_44_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_30 = 0.200000002980232

			if var_44_29 <= arg_41_1.time_ and arg_41_1.time_ < var_44_29 + var_44_30 then
				local var_44_31 = (arg_41_1.time_ - var_44_29) / var_44_30

				if arg_41_1.var_.characterEffect10044ui_story then
					arg_41_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_29 + var_44_30 and arg_41_1.time_ < var_44_29 + var_44_30 + arg_44_0 and arg_41_1.var_.characterEffect10044ui_story then
				arg_41_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_44_32 = 0

			if var_44_32 < arg_41_1.time_ and arg_41_1.time_ <= var_44_32 + arg_44_0 then
				arg_41_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_44_33 = 0

			if var_44_33 < arg_41_1.time_ and arg_41_1.time_ <= var_44_33 + arg_44_0 then
				arg_41_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_44_34 = 0
			local var_44_35 = 1

			if var_44_34 < arg_41_1.time_ and arg_41_1.time_ <= var_44_34 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_36 = arg_41_1:FormatText(StoryNameCfg[380].name)

				arg_41_1.leftNameTxt_.text = var_44_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_37 = arg_41_1:GetWordFromCfg(121531010)
				local var_44_38 = arg_41_1:FormatText(var_44_37.content)

				arg_41_1.text_.text = var_44_38

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_39 = 40
				local var_44_40 = utf8.len(var_44_38)
				local var_44_41 = var_44_39 <= 0 and var_44_35 or var_44_35 * (var_44_40 / var_44_39)

				if var_44_41 > 0 and var_44_35 < var_44_41 then
					arg_41_1.talkMaxDuration = var_44_41

					if var_44_41 + var_44_34 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_41 + var_44_34
					end
				end

				arg_41_1.text_.text = var_44_38
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531010", "story_v_out_121531.awb") ~= 0 then
					local var_44_42 = manager.audio:GetVoiceLength("story_v_out_121531", "121531010", "story_v_out_121531.awb") / 1000

					if var_44_42 + var_44_34 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_42 + var_44_34
					end

					if var_44_37.prefab_name ~= "" and arg_41_1.actors_[var_44_37.prefab_name] ~= nil then
						local var_44_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_37.prefab_name].transform, "story_v_out_121531", "121531010", "story_v_out_121531.awb")

						arg_41_1:RecordAudio("121531010", var_44_43)
						arg_41_1:RecordAudio("121531010", var_44_43)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_121531", "121531010", "story_v_out_121531.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_121531", "121531010", "story_v_out_121531.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_44 = math.max(var_44_35, arg_41_1.talkMaxDuration)

			if var_44_34 <= arg_41_1.time_ and arg_41_1.time_ < var_44_34 + var_44_44 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_34) / var_44_44

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_34 + var_44_44 and arg_41_1.time_ < var_44_34 + var_44_44 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play121531011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 121531011
		arg_45_1.duration_ = 7.7

		local var_45_0 = {
			ja = 7.7,
			ko = 5.066,
			zh = 5.066
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
				arg_45_0:Play121531012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1074ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1074ui_story == nil then
				arg_45_1.var_.characterEffect1074ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1074ui_story then
					arg_45_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1074ui_story then
				arg_45_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_48_4 = 0

			if var_48_4 < arg_45_1.time_ and arg_45_1.time_ <= var_48_4 + arg_48_0 then
				arg_45_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_48_6 = arg_45_1.actors_["10044ui_story"]
			local var_48_7 = 0

			if var_48_7 < arg_45_1.time_ and arg_45_1.time_ <= var_48_7 + arg_48_0 and arg_45_1.var_.characterEffect10044ui_story == nil then
				arg_45_1.var_.characterEffect10044ui_story = var_48_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_8 = 0.200000002980232

			if var_48_7 <= arg_45_1.time_ and arg_45_1.time_ < var_48_7 + var_48_8 then
				local var_48_9 = (arg_45_1.time_ - var_48_7) / var_48_8

				if arg_45_1.var_.characterEffect10044ui_story then
					local var_48_10 = Mathf.Lerp(0, 0.5, var_48_9)

					arg_45_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_45_1.var_.characterEffect10044ui_story.fillRatio = var_48_10
				end
			end

			if arg_45_1.time_ >= var_48_7 + var_48_8 and arg_45_1.time_ < var_48_7 + var_48_8 + arg_48_0 and arg_45_1.var_.characterEffect10044ui_story then
				local var_48_11 = 0.5

				arg_45_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_45_1.var_.characterEffect10044ui_story.fillRatio = var_48_11
			end

			local var_48_12 = 0
			local var_48_13 = 0.5

			if var_48_12 < arg_45_1.time_ and arg_45_1.time_ <= var_48_12 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_14 = arg_45_1:FormatText(StoryNameCfg[410].name)

				arg_45_1.leftNameTxt_.text = var_48_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_15 = arg_45_1:GetWordFromCfg(121531011)
				local var_48_16 = arg_45_1:FormatText(var_48_15.content)

				arg_45_1.text_.text = var_48_16

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_17 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531011", "story_v_out_121531.awb") ~= 0 then
					local var_48_20 = manager.audio:GetVoiceLength("story_v_out_121531", "121531011", "story_v_out_121531.awb") / 1000

					if var_48_20 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_20 + var_48_12
					end

					if var_48_15.prefab_name ~= "" and arg_45_1.actors_[var_48_15.prefab_name] ~= nil then
						local var_48_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_15.prefab_name].transform, "story_v_out_121531", "121531011", "story_v_out_121531.awb")

						arg_45_1:RecordAudio("121531011", var_48_21)
						arg_45_1:RecordAudio("121531011", var_48_21)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_121531", "121531011", "story_v_out_121531.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_121531", "121531011", "story_v_out_121531.awb")
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
	Play121531012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 121531012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play121531013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1074ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1074ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, 100, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1074ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, 100, 0)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1074ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1074ui_story == nil then
				arg_49_1.var_.characterEffect1074ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1074ui_story then
					local var_52_13 = Mathf.Lerp(0, 0.5, var_52_12)

					arg_49_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1074ui_story.fillRatio = var_52_13
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and arg_49_1.var_.characterEffect1074ui_story then
				local var_52_14 = 0.5

				arg_49_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1074ui_story.fillRatio = var_52_14
			end

			local var_52_15 = arg_49_1.actors_["10044ui_story"].transform
			local var_52_16 = 0

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.var_.moveOldPos10044ui_story = var_52_15.localPosition
			end

			local var_52_17 = 0.001

			if var_52_16 <= arg_49_1.time_ and arg_49_1.time_ < var_52_16 + var_52_17 then
				local var_52_18 = (arg_49_1.time_ - var_52_16) / var_52_17
				local var_52_19 = Vector3.New(0, 100, 0)

				var_52_15.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10044ui_story, var_52_19, var_52_18)

				local var_52_20 = manager.ui.mainCamera.transform.position - var_52_15.position

				var_52_15.forward = Vector3.New(var_52_20.x, var_52_20.y, var_52_20.z)

				local var_52_21 = var_52_15.localEulerAngles

				var_52_21.z = 0
				var_52_21.x = 0
				var_52_15.localEulerAngles = var_52_21
			end

			if arg_49_1.time_ >= var_52_16 + var_52_17 and arg_49_1.time_ < var_52_16 + var_52_17 + arg_52_0 then
				var_52_15.localPosition = Vector3.New(0, 100, 0)

				local var_52_22 = manager.ui.mainCamera.transform.position - var_52_15.position

				var_52_15.forward = Vector3.New(var_52_22.x, var_52_22.y, var_52_22.z)

				local var_52_23 = var_52_15.localEulerAngles

				var_52_23.z = 0
				var_52_23.x = 0
				var_52_15.localEulerAngles = var_52_23
			end

			local var_52_24 = arg_49_1.actors_["10044ui_story"]
			local var_52_25 = 0

			if var_52_25 < arg_49_1.time_ and arg_49_1.time_ <= var_52_25 + arg_52_0 and arg_49_1.var_.characterEffect10044ui_story == nil then
				arg_49_1.var_.characterEffect10044ui_story = var_52_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_26 = 0.200000002980232

			if var_52_25 <= arg_49_1.time_ and arg_49_1.time_ < var_52_25 + var_52_26 then
				local var_52_27 = (arg_49_1.time_ - var_52_25) / var_52_26

				if arg_49_1.var_.characterEffect10044ui_story then
					local var_52_28 = Mathf.Lerp(0, 0.5, var_52_27)

					arg_49_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_49_1.var_.characterEffect10044ui_story.fillRatio = var_52_28
				end
			end

			if arg_49_1.time_ >= var_52_25 + var_52_26 and arg_49_1.time_ < var_52_25 + var_52_26 + arg_52_0 and arg_49_1.var_.characterEffect10044ui_story then
				local var_52_29 = 0.5

				arg_49_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_49_1.var_.characterEffect10044ui_story.fillRatio = var_52_29
			end

			local var_52_30 = 0
			local var_52_31 = 0.633333333333333

			if var_52_30 < arg_49_1.time_ and arg_49_1.time_ <= var_52_30 + arg_52_0 then
				local var_52_32 = "stop"
				local var_52_33 = "effect"

				arg_49_1:AudioAction(var_52_32, var_52_33, "se_story_121_04", "se_story_121_04_earthquake_loop", "")
			end

			local var_52_34 = 0
			local var_52_35 = 1.15

			if var_52_34 < arg_49_1.time_ and arg_49_1.time_ <= var_52_34 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_36 = arg_49_1:GetWordFromCfg(121531012)
				local var_52_37 = arg_49_1:FormatText(var_52_36.content)

				arg_49_1.text_.text = var_52_37

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_38 = 46
				local var_52_39 = utf8.len(var_52_37)
				local var_52_40 = var_52_38 <= 0 and var_52_35 or var_52_35 * (var_52_39 / var_52_38)

				if var_52_40 > 0 and var_52_35 < var_52_40 then
					arg_49_1.talkMaxDuration = var_52_40

					if var_52_40 + var_52_34 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_40 + var_52_34
					end
				end

				arg_49_1.text_.text = var_52_37
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_41 = math.max(var_52_35, arg_49_1.talkMaxDuration)

			if var_52_34 <= arg_49_1.time_ and arg_49_1.time_ < var_52_34 + var_52_41 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_34) / var_52_41

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_34 + var_52_41 and arg_49_1.time_ < var_52_34 + var_52_41 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play121531013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 121531013
		arg_53_1.duration_ = 7.065999999999

		local var_53_0 = {
			ja = 7.065999999999,
			ko = 6.632999999999,
			zh = 6.632999999999
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
				arg_53_0:Play121531014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = "ST29a"

			if arg_53_1.bgs_[var_56_0] == nil then
				local var_56_1 = Object.Instantiate(arg_53_1.paintGo_)

				var_56_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_56_0)
				var_56_1.name = var_56_0
				var_56_1.transform.parent = arg_53_1.stage_.transform
				var_56_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_53_1.bgs_[var_56_0] = var_56_1
			end

			local var_56_2 = 1.999999999999

			if var_56_2 < arg_53_1.time_ and arg_53_1.time_ <= var_56_2 + arg_56_0 then
				local var_56_3 = manager.ui.mainCamera.transform.localPosition
				local var_56_4 = Vector3.New(0, 0, 10) + Vector3.New(var_56_3.x, var_56_3.y, 0)
				local var_56_5 = arg_53_1.bgs_.ST29a

				var_56_5.transform.localPosition = var_56_4
				var_56_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_56_6 = var_56_5:GetComponent("SpriteRenderer")

				if var_56_6 and var_56_6.sprite then
					local var_56_7 = (var_56_5.transform.localPosition - var_56_3).z
					local var_56_8 = manager.ui.mainCameraCom_
					local var_56_9 = 2 * var_56_7 * Mathf.Tan(var_56_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_56_10 = var_56_9 * var_56_8.aspect
					local var_56_11 = var_56_6.sprite.bounds.size.x
					local var_56_12 = var_56_6.sprite.bounds.size.y
					local var_56_13 = var_56_10 / var_56_11
					local var_56_14 = var_56_9 / var_56_12
					local var_56_15 = var_56_14 < var_56_13 and var_56_13 or var_56_14

					var_56_5.transform.localScale = Vector3.New(var_56_15, var_56_15, 0)
				end

				for iter_56_0, iter_56_1 in pairs(arg_53_1.bgs_) do
					if iter_56_0 ~= "ST29a" then
						iter_56_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_56_16 = 0

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 then
				arg_53_1.mask_.enabled = true
				arg_53_1.mask_.raycastTarget = true

				arg_53_1:SetGaussion(false)
			end

			local var_56_17 = 2

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_17 then
				local var_56_18 = (arg_53_1.time_ - var_56_16) / var_56_17
				local var_56_19 = Color.New(0, 0, 0)

				var_56_19.a = Mathf.Lerp(0, 1, var_56_18)
				arg_53_1.mask_.color = var_56_19
			end

			if arg_53_1.time_ >= var_56_16 + var_56_17 and arg_53_1.time_ < var_56_16 + var_56_17 + arg_56_0 then
				local var_56_20 = Color.New(0, 0, 0)

				var_56_20.a = 1
				arg_53_1.mask_.color = var_56_20
			end

			local var_56_21 = 2

			if var_56_21 < arg_53_1.time_ and arg_53_1.time_ <= var_56_21 + arg_56_0 then
				arg_53_1.mask_.enabled = true
				arg_53_1.mask_.raycastTarget = true

				arg_53_1:SetGaussion(false)
			end

			local var_56_22 = 2

			if var_56_21 <= arg_53_1.time_ and arg_53_1.time_ < var_56_21 + var_56_22 then
				local var_56_23 = (arg_53_1.time_ - var_56_21) / var_56_22
				local var_56_24 = Color.New(0, 0, 0)

				var_56_24.a = Mathf.Lerp(1, 0, var_56_23)
				arg_53_1.mask_.color = var_56_24
			end

			if arg_53_1.time_ >= var_56_21 + var_56_22 and arg_53_1.time_ < var_56_21 + var_56_22 + arg_56_0 then
				local var_56_25 = Color.New(0, 0, 0)
				local var_56_26 = 0

				arg_53_1.mask_.enabled = false
				var_56_25.a = var_56_26
				arg_53_1.mask_.color = var_56_25
			end

			local var_56_27 = "1072ui_story"

			if arg_53_1.actors_[var_56_27] == nil then
				local var_56_28 = Object.Instantiate(Asset.Load("Char/" .. var_56_27), arg_53_1.stage_.transform)

				var_56_28.name = var_56_27
				var_56_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_53_1.actors_[var_56_27] = var_56_28

				local var_56_29 = var_56_28:GetComponentInChildren(typeof(CharacterEffect))

				var_56_29.enabled = true

				local var_56_30 = GameObjectTools.GetOrAddComponent(var_56_28, typeof(DynamicBoneHelper))

				if var_56_30 then
					var_56_30:EnableDynamicBone(false)
				end

				arg_53_1:ShowWeapon(var_56_29.transform, false)

				arg_53_1.var_[var_56_27 .. "Animator"] = var_56_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_53_1.var_[var_56_27 .. "Animator"].applyRootMotion = true
				arg_53_1.var_[var_56_27 .. "LipSync"] = var_56_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_56_31 = arg_53_1.actors_["1072ui_story"].transform
			local var_56_32 = 3.8

			if var_56_32 < arg_53_1.time_ and arg_53_1.time_ <= var_56_32 + arg_56_0 then
				arg_53_1.var_.moveOldPos1072ui_story = var_56_31.localPosition
			end

			local var_56_33 = 0.001

			if var_56_32 <= arg_53_1.time_ and arg_53_1.time_ < var_56_32 + var_56_33 then
				local var_56_34 = (arg_53_1.time_ - var_56_32) / var_56_33
				local var_56_35 = Vector3.New(-0.7, -0.71, -6)

				var_56_31.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1072ui_story, var_56_35, var_56_34)

				local var_56_36 = manager.ui.mainCamera.transform.position - var_56_31.position

				var_56_31.forward = Vector3.New(var_56_36.x, var_56_36.y, var_56_36.z)

				local var_56_37 = var_56_31.localEulerAngles

				var_56_37.z = 0
				var_56_37.x = 0
				var_56_31.localEulerAngles = var_56_37
			end

			if arg_53_1.time_ >= var_56_32 + var_56_33 and arg_53_1.time_ < var_56_32 + var_56_33 + arg_56_0 then
				var_56_31.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_56_38 = manager.ui.mainCamera.transform.position - var_56_31.position

				var_56_31.forward = Vector3.New(var_56_38.x, var_56_38.y, var_56_38.z)

				local var_56_39 = var_56_31.localEulerAngles

				var_56_39.z = 0
				var_56_39.x = 0
				var_56_31.localEulerAngles = var_56_39
			end

			local var_56_40 = arg_53_1.actors_["1072ui_story"]
			local var_56_41 = 3.8

			if var_56_41 < arg_53_1.time_ and arg_53_1.time_ <= var_56_41 + arg_56_0 and arg_53_1.var_.characterEffect1072ui_story == nil then
				arg_53_1.var_.characterEffect1072ui_story = var_56_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_42 = 0.200000002980232

			if var_56_41 <= arg_53_1.time_ and arg_53_1.time_ < var_56_41 + var_56_42 then
				local var_56_43 = (arg_53_1.time_ - var_56_41) / var_56_42

				if arg_53_1.var_.characterEffect1072ui_story then
					arg_53_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_41 + var_56_42 and arg_53_1.time_ < var_56_41 + var_56_42 + arg_56_0 and arg_53_1.var_.characterEffect1072ui_story then
				arg_53_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_56_44 = 3.8

			if var_56_44 < arg_53_1.time_ and arg_53_1.time_ <= var_56_44 + arg_56_0 then
				arg_53_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_56_45 = 3.8

			if var_56_45 < arg_53_1.time_ and arg_53_1.time_ <= var_56_45 + arg_56_0 then
				arg_53_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_46 = arg_53_1.actors_["1074ui_story"].transform
			local var_56_47 = 3.8

			if var_56_47 < arg_53_1.time_ and arg_53_1.time_ <= var_56_47 + arg_56_0 then
				arg_53_1.var_.moveOldPos1074ui_story = var_56_46.localPosition
			end

			local var_56_48 = 0.001

			if var_56_47 <= arg_53_1.time_ and arg_53_1.time_ < var_56_47 + var_56_48 then
				local var_56_49 = (arg_53_1.time_ - var_56_47) / var_56_48
				local var_56_50 = Vector3.New(0.7, -1.055, -6.12)

				var_56_46.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1074ui_story, var_56_50, var_56_49)

				local var_56_51 = manager.ui.mainCamera.transform.position - var_56_46.position

				var_56_46.forward = Vector3.New(var_56_51.x, var_56_51.y, var_56_51.z)

				local var_56_52 = var_56_46.localEulerAngles

				var_56_52.z = 0
				var_56_52.x = 0
				var_56_46.localEulerAngles = var_56_52
			end

			if arg_53_1.time_ >= var_56_47 + var_56_48 and arg_53_1.time_ < var_56_47 + var_56_48 + arg_56_0 then
				var_56_46.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_56_53 = manager.ui.mainCamera.transform.position - var_56_46.position

				var_56_46.forward = Vector3.New(var_56_53.x, var_56_53.y, var_56_53.z)

				local var_56_54 = var_56_46.localEulerAngles

				var_56_54.z = 0
				var_56_54.x = 0
				var_56_46.localEulerAngles = var_56_54
			end

			local var_56_55 = arg_53_1.actors_["1074ui_story"]
			local var_56_56 = 3.8

			if var_56_56 < arg_53_1.time_ and arg_53_1.time_ <= var_56_56 + arg_56_0 and arg_53_1.var_.characterEffect1074ui_story == nil then
				arg_53_1.var_.characterEffect1074ui_story = var_56_55:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_57 = 0.200000002980232

			if var_56_56 <= arg_53_1.time_ and arg_53_1.time_ < var_56_56 + var_56_57 then
				local var_56_58 = (arg_53_1.time_ - var_56_56) / var_56_57

				if arg_53_1.var_.characterEffect1074ui_story then
					local var_56_59 = Mathf.Lerp(0, 0.5, var_56_58)

					arg_53_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1074ui_story.fillRatio = var_56_59
				end
			end

			if arg_53_1.time_ >= var_56_56 + var_56_57 and arg_53_1.time_ < var_56_56 + var_56_57 + arg_56_0 and arg_53_1.var_.characterEffect1074ui_story then
				local var_56_60 = 0.5

				arg_53_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1074ui_story.fillRatio = var_56_60
			end

			if arg_53_1.frameCnt_ <= 1 then
				arg_53_1.dialog_:SetActive(false)
			end

			local var_56_61 = 3.999999999999
			local var_56_62 = 0.35

			if var_56_61 < arg_53_1.time_ and arg_53_1.time_ <= var_56_61 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0

				arg_53_1.dialog_:SetActive(true)

				local var_56_63 = LeanTween.value(arg_53_1.dialog_, 0, 1, 0.3)

				var_56_63:setOnUpdate(LuaHelper.FloatAction(function(arg_57_0)
					arg_53_1.dialogCg_.alpha = arg_57_0
				end))
				var_56_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_53_1.dialog_)
					var_56_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_53_1.duration_ = arg_53_1.duration_ + 0.3

				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_64 = arg_53_1:FormatText(StoryNameCfg[379].name)

				arg_53_1.leftNameTxt_.text = var_56_64

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_65 = arg_53_1:GetWordFromCfg(121531013)
				local var_56_66 = arg_53_1:FormatText(var_56_65.content)

				arg_53_1.text_.text = var_56_66

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_67 = 14
				local var_56_68 = utf8.len(var_56_66)
				local var_56_69 = var_56_67 <= 0 and var_56_62 or var_56_62 * (var_56_68 / var_56_67)

				if var_56_69 > 0 and var_56_62 < var_56_69 then
					arg_53_1.talkMaxDuration = var_56_69
					var_56_61 = var_56_61 + 0.3

					if var_56_69 + var_56_61 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_69 + var_56_61
					end
				end

				arg_53_1.text_.text = var_56_66
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531013", "story_v_out_121531.awb") ~= 0 then
					local var_56_70 = manager.audio:GetVoiceLength("story_v_out_121531", "121531013", "story_v_out_121531.awb") / 1000

					if var_56_70 + var_56_61 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_70 + var_56_61
					end

					if var_56_65.prefab_name ~= "" and arg_53_1.actors_[var_56_65.prefab_name] ~= nil then
						local var_56_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_65.prefab_name].transform, "story_v_out_121531", "121531013", "story_v_out_121531.awb")

						arg_53_1:RecordAudio("121531013", var_56_71)
						arg_53_1:RecordAudio("121531013", var_56_71)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_121531", "121531013", "story_v_out_121531.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_121531", "121531013", "story_v_out_121531.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_72 = var_56_61 + 0.3
			local var_56_73 = math.max(var_56_62, arg_53_1.talkMaxDuration)

			if var_56_72 <= arg_53_1.time_ and arg_53_1.time_ < var_56_72 + var_56_73 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_72) / var_56_73

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_72 + var_56_73 and arg_53_1.time_ < var_56_72 + var_56_73 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play121531014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 121531014
		arg_59_1.duration_ = 5.1

		local var_59_0 = {
			ja = 5.1,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_59_0:Play121531015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1074ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1074ui_story == nil then
				arg_59_1.var_.characterEffect1074ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1074ui_story then
					arg_59_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1074ui_story then
				arg_59_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_6 = arg_59_1.actors_["1072ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect1072ui_story == nil then
				arg_59_1.var_.characterEffect1072ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.200000002980232

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect1072ui_story then
					local var_62_10 = Mathf.Lerp(0, 0.5, var_62_9)

					arg_59_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1072ui_story.fillRatio = var_62_10
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect1072ui_story then
				local var_62_11 = 0.5

				arg_59_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1072ui_story.fillRatio = var_62_11
			end

			local var_62_12 = 0
			local var_62_13 = 0.15

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[410].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(121531014)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531014", "story_v_out_121531.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_121531", "121531014", "story_v_out_121531.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_121531", "121531014", "story_v_out_121531.awb")

						arg_59_1:RecordAudio("121531014", var_62_21)
						arg_59_1:RecordAudio("121531014", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_121531", "121531014", "story_v_out_121531.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_121531", "121531014", "story_v_out_121531.awb")
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
	Play121531015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 121531015
		arg_63_1.duration_ = 6.366

		local var_63_0 = {
			ja = 6.366,
			ko = 4.833,
			zh = 4.833
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
				arg_63_0:Play121531016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1072ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story == nil then
				arg_63_1.var_.characterEffect1072ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1072ui_story then
					arg_63_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story then
				arg_63_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_66_4 = 0

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_6 = arg_63_1.actors_["1074ui_story"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect1074ui_story == nil then
				arg_63_1.var_.characterEffect1074ui_story = var_66_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_8 = 0.200000002980232

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.characterEffect1074ui_story then
					local var_66_10 = Mathf.Lerp(0, 0.5, var_66_9)

					arg_63_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1074ui_story.fillRatio = var_66_10
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.characterEffect1074ui_story then
				local var_66_11 = 0.5

				arg_63_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1074ui_story.fillRatio = var_66_11
			end

			local var_66_12 = 0
			local var_66_13 = 0.675

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[379].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(121531015)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 27
				local var_66_18 = utf8.len(var_66_16)
				local var_66_19 = var_66_17 <= 0 and var_66_13 or var_66_13 * (var_66_18 / var_66_17)

				if var_66_19 > 0 and var_66_13 < var_66_19 then
					arg_63_1.talkMaxDuration = var_66_19

					if var_66_19 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_16
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531015", "story_v_out_121531.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_121531", "121531015", "story_v_out_121531.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_121531", "121531015", "story_v_out_121531.awb")

						arg_63_1:RecordAudio("121531015", var_66_21)
						arg_63_1:RecordAudio("121531015", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_121531", "121531015", "story_v_out_121531.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_121531", "121531015", "story_v_out_121531.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_22 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_22 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_22

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_22 and arg_63_1.time_ < var_66_12 + var_66_22 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play121531016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 121531016
		arg_67_1.duration_ = 5.433

		local var_67_0 = {
			ja = 3.6,
			ko = 5.433,
			zh = 5.433
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
				arg_67_0:Play121531017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1074ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1074ui_story == nil then
				arg_67_1.var_.characterEffect1074ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1074ui_story then
					arg_67_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1074ui_story then
				arg_67_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_6 = arg_67_1.actors_["1072ui_story"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story == nil then
				arg_67_1.var_.characterEffect1072ui_story = var_70_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_8 = 0.200000002980232

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.characterEffect1072ui_story then
					local var_70_10 = Mathf.Lerp(0, 0.5, var_70_9)

					arg_67_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1072ui_story.fillRatio = var_70_10
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story then
				local var_70_11 = 0.5

				arg_67_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1072ui_story.fillRatio = var_70_11
			end

			local var_70_12 = 0
			local var_70_13 = 0.725

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[410].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(121531016)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531016", "story_v_out_121531.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_121531", "121531016", "story_v_out_121531.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_121531", "121531016", "story_v_out_121531.awb")

						arg_67_1:RecordAudio("121531016", var_70_21)
						arg_67_1:RecordAudio("121531016", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_121531", "121531016", "story_v_out_121531.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_121531", "121531016", "story_v_out_121531.awb")
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
	Play121531017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 121531017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play121531018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1074ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1074ui_story == nil then
				arg_71_1.var_.characterEffect1074ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1074ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1074ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1074ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1074ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 1.95

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(121531017)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 78
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_7 or var_74_7 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_7 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_13 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_13 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_13

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_13 and arg_71_1.time_ < var_74_6 + var_74_13 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play121531018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 121531018
		arg_75_1.duration_ = 11.133

		local var_75_0 = {
			ja = 11.133,
			ko = 7.5,
			zh = 7.5
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
				arg_75_0:Play121531019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1072ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1072ui_story == nil then
				arg_75_1.var_.characterEffect1072ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1072ui_story then
					arg_75_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1072ui_story then
				arg_75_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_78_4 = 0
			local var_78_5 = 0.95

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_6 = arg_75_1:FormatText(StoryNameCfg[379].name)

				arg_75_1.leftNameTxt_.text = var_78_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_7 = arg_75_1:GetWordFromCfg(121531018)
				local var_78_8 = arg_75_1:FormatText(var_78_7.content)

				arg_75_1.text_.text = var_78_8

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_9 = 38
				local var_78_10 = utf8.len(var_78_8)
				local var_78_11 = var_78_9 <= 0 and var_78_5 or var_78_5 * (var_78_10 / var_78_9)

				if var_78_11 > 0 and var_78_5 < var_78_11 then
					arg_75_1.talkMaxDuration = var_78_11

					if var_78_11 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_11 + var_78_4
					end
				end

				arg_75_1.text_.text = var_78_8
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531018", "story_v_out_121531.awb") ~= 0 then
					local var_78_12 = manager.audio:GetVoiceLength("story_v_out_121531", "121531018", "story_v_out_121531.awb") / 1000

					if var_78_12 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_12 + var_78_4
					end

					if var_78_7.prefab_name ~= "" and arg_75_1.actors_[var_78_7.prefab_name] ~= nil then
						local var_78_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_7.prefab_name].transform, "story_v_out_121531", "121531018", "story_v_out_121531.awb")

						arg_75_1:RecordAudio("121531018", var_78_13)
						arg_75_1:RecordAudio("121531018", var_78_13)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_121531", "121531018", "story_v_out_121531.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_121531", "121531018", "story_v_out_121531.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_14 = math.max(var_78_5, arg_75_1.talkMaxDuration)

			if var_78_4 <= arg_75_1.time_ and arg_75_1.time_ < var_78_4 + var_78_14 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_4) / var_78_14

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_4 + var_78_14 and arg_75_1.time_ < var_78_4 + var_78_14 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play121531019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 121531019
		arg_79_1.duration_ = 8.6

		local var_79_0 = {
			ja = 8.6,
			ko = 6.133,
			zh = 6.133
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
				arg_79_0:Play121531020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.9

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[379].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(121531019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 36
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531019", "story_v_out_121531.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_121531", "121531019", "story_v_out_121531.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_121531", "121531019", "story_v_out_121531.awb")

						arg_79_1:RecordAudio("121531019", var_82_9)
						arg_79_1:RecordAudio("121531019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_121531", "121531019", "story_v_out_121531.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_121531", "121531019", "story_v_out_121531.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play121531020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 121531020
		arg_83_1.duration_ = 5.133

		local var_83_0 = {
			ja = 5.133,
			ko = 3.866,
			zh = 3.866
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
				arg_83_0:Play121531021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1074ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1074ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, 100, 0)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1074ui_story, var_86_4, var_86_3)

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

			local var_86_9 = arg_83_1.actors_["1072ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1072ui_story == nil then
				arg_83_1.var_.characterEffect1072ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1072ui_story then
					local var_86_13 = Mathf.Lerp(0, 0.5, var_86_12)

					arg_83_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1072ui_story.fillRatio = var_86_13
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1072ui_story then
				local var_86_14 = 0.5

				arg_83_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1072ui_story.fillRatio = var_86_14
			end

			local var_86_15 = arg_83_1.actors_["10044ui_story"].transform
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.var_.moveOldPos10044ui_story = var_86_15.localPosition
			end

			local var_86_17 = 0.001

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17
				local var_86_19 = Vector3.New(0.7, -0.72, -6.3)

				var_86_15.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10044ui_story, var_86_19, var_86_18)

				local var_86_20 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_20.x, var_86_20.y, var_86_20.z)

				local var_86_21 = var_86_15.localEulerAngles

				var_86_21.z = 0
				var_86_21.x = 0
				var_86_15.localEulerAngles = var_86_21
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				var_86_15.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_86_22 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_22.x, var_86_22.y, var_86_22.z)

				local var_86_23 = var_86_15.localEulerAngles

				var_86_23.z = 0
				var_86_23.x = 0
				var_86_15.localEulerAngles = var_86_23
			end

			local var_86_24 = arg_83_1.actors_["10044ui_story"]
			local var_86_25 = 0

			if var_86_25 < arg_83_1.time_ and arg_83_1.time_ <= var_86_25 + arg_86_0 and arg_83_1.var_.characterEffect10044ui_story == nil then
				arg_83_1.var_.characterEffect10044ui_story = var_86_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_26 = 0.200000002980232

			if var_86_25 <= arg_83_1.time_ and arg_83_1.time_ < var_86_25 + var_86_26 then
				local var_86_27 = (arg_83_1.time_ - var_86_25) / var_86_26

				if arg_83_1.var_.characterEffect10044ui_story then
					arg_83_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_25 + var_86_26 and arg_83_1.time_ < var_86_25 + var_86_26 + arg_86_0 and arg_83_1.var_.characterEffect10044ui_story then
				arg_83_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_86_28 = 0

			if var_86_28 < arg_83_1.time_ and arg_83_1.time_ <= var_86_28 + arg_86_0 then
				arg_83_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_86_29 = 0

			if var_86_29 < arg_83_1.time_ and arg_83_1.time_ <= var_86_29 + arg_86_0 then
				arg_83_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_86_30 = 0
			local var_86_31 = 0.5

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_32 = arg_83_1:FormatText(StoryNameCfg[380].name)

				arg_83_1.leftNameTxt_.text = var_86_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_33 = arg_83_1:GetWordFromCfg(121531020)
				local var_86_34 = arg_83_1:FormatText(var_86_33.content)

				arg_83_1.text_.text = var_86_34

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_35 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531020", "story_v_out_121531.awb") ~= 0 then
					local var_86_38 = manager.audio:GetVoiceLength("story_v_out_121531", "121531020", "story_v_out_121531.awb") / 1000

					if var_86_38 + var_86_30 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_38 + var_86_30
					end

					if var_86_33.prefab_name ~= "" and arg_83_1.actors_[var_86_33.prefab_name] ~= nil then
						local var_86_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_33.prefab_name].transform, "story_v_out_121531", "121531020", "story_v_out_121531.awb")

						arg_83_1:RecordAudio("121531020", var_86_39)
						arg_83_1:RecordAudio("121531020", var_86_39)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_121531", "121531020", "story_v_out_121531.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_121531", "121531020", "story_v_out_121531.awb")
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
	Play121531021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 121531021
		arg_87_1.duration_ = 10.7

		local var_87_0 = {
			ja = 10.7,
			ko = 5.466,
			zh = 5.466
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
				arg_87_0:Play121531022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1072ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1072ui_story == nil then
				arg_87_1.var_.characterEffect1072ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1072ui_story then
					arg_87_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1072ui_story then
				arg_87_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_90_4 = 0

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_6 = arg_87_1.actors_["10044ui_story"]
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 and arg_87_1.var_.characterEffect10044ui_story == nil then
				arg_87_1.var_.characterEffect10044ui_story = var_90_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_8 = 0.200000002980232

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8

				if arg_87_1.var_.characterEffect10044ui_story then
					local var_90_10 = Mathf.Lerp(0, 0.5, var_90_9)

					arg_87_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10044ui_story.fillRatio = var_90_10
				end
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 and arg_87_1.var_.characterEffect10044ui_story then
				local var_90_11 = 0.5

				arg_87_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10044ui_story.fillRatio = var_90_11
			end

			local var_90_12 = 0
			local var_90_13 = 0.625

			if var_90_12 < arg_87_1.time_ and arg_87_1.time_ <= var_90_12 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_14 = arg_87_1:FormatText(StoryNameCfg[379].name)

				arg_87_1.leftNameTxt_.text = var_90_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_15 = arg_87_1:GetWordFromCfg(121531021)
				local var_90_16 = arg_87_1:FormatText(var_90_15.content)

				arg_87_1.text_.text = var_90_16

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_17 = 25
				local var_90_18 = utf8.len(var_90_16)
				local var_90_19 = var_90_17 <= 0 and var_90_13 or var_90_13 * (var_90_18 / var_90_17)

				if var_90_19 > 0 and var_90_13 < var_90_19 then
					arg_87_1.talkMaxDuration = var_90_19

					if var_90_19 + var_90_12 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_19 + var_90_12
					end
				end

				arg_87_1.text_.text = var_90_16
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531021", "story_v_out_121531.awb") ~= 0 then
					local var_90_20 = manager.audio:GetVoiceLength("story_v_out_121531", "121531021", "story_v_out_121531.awb") / 1000

					if var_90_20 + var_90_12 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_20 + var_90_12
					end

					if var_90_15.prefab_name ~= "" and arg_87_1.actors_[var_90_15.prefab_name] ~= nil then
						local var_90_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_15.prefab_name].transform, "story_v_out_121531", "121531021", "story_v_out_121531.awb")

						arg_87_1:RecordAudio("121531021", var_90_21)
						arg_87_1:RecordAudio("121531021", var_90_21)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_121531", "121531021", "story_v_out_121531.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_121531", "121531021", "story_v_out_121531.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_22 = math.max(var_90_13, arg_87_1.talkMaxDuration)

			if var_90_12 <= arg_87_1.time_ and arg_87_1.time_ < var_90_12 + var_90_22 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_12) / var_90_22

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_12 + var_90_22 and arg_87_1.time_ < var_90_12 + var_90_22 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play121531022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 121531022
		arg_91_1.duration_ = 4.633

		local var_91_0 = {
			ja = 4.633,
			ko = 2.3,
			zh = 2.3
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
				arg_91_0:Play121531023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10044ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect10044ui_story == nil then
				arg_91_1.var_.characterEffect10044ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect10044ui_story then
					arg_91_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect10044ui_story then
				arg_91_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_94_4 = 0

			if var_94_4 < arg_91_1.time_ and arg_91_1.time_ <= var_94_4 + arg_94_0 then
				arg_91_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_94_5 = arg_91_1.actors_["1072ui_story"]
			local var_94_6 = 0

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1072ui_story == nil then
				arg_91_1.var_.characterEffect1072ui_story = var_94_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_7 = 0.200000002980232

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_7 then
				local var_94_8 = (arg_91_1.time_ - var_94_6) / var_94_7

				if arg_91_1.var_.characterEffect1072ui_story then
					local var_94_9 = Mathf.Lerp(0, 0.5, var_94_8)

					arg_91_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1072ui_story.fillRatio = var_94_9
				end
			end

			if arg_91_1.time_ >= var_94_6 + var_94_7 and arg_91_1.time_ < var_94_6 + var_94_7 + arg_94_0 and arg_91_1.var_.characterEffect1072ui_story then
				local var_94_10 = 0.5

				arg_91_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1072ui_story.fillRatio = var_94_10
			end

			local var_94_11 = 0
			local var_94_12 = 0.3

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_13 = arg_91_1:FormatText(StoryNameCfg[380].name)

				arg_91_1.leftNameTxt_.text = var_94_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_14 = arg_91_1:GetWordFromCfg(121531022)
				local var_94_15 = arg_91_1:FormatText(var_94_14.content)

				arg_91_1.text_.text = var_94_15

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_16 = 12
				local var_94_17 = utf8.len(var_94_15)
				local var_94_18 = var_94_16 <= 0 and var_94_12 or var_94_12 * (var_94_17 / var_94_16)

				if var_94_18 > 0 and var_94_12 < var_94_18 then
					arg_91_1.talkMaxDuration = var_94_18

					if var_94_18 + var_94_11 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_18 + var_94_11
					end
				end

				arg_91_1.text_.text = var_94_15
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531022", "story_v_out_121531.awb") ~= 0 then
					local var_94_19 = manager.audio:GetVoiceLength("story_v_out_121531", "121531022", "story_v_out_121531.awb") / 1000

					if var_94_19 + var_94_11 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_11
					end

					if var_94_14.prefab_name ~= "" and arg_91_1.actors_[var_94_14.prefab_name] ~= nil then
						local var_94_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_14.prefab_name].transform, "story_v_out_121531", "121531022", "story_v_out_121531.awb")

						arg_91_1:RecordAudio("121531022", var_94_20)
						arg_91_1:RecordAudio("121531022", var_94_20)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_121531", "121531022", "story_v_out_121531.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_121531", "121531022", "story_v_out_121531.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_21 = math.max(var_94_12, arg_91_1.talkMaxDuration)

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_21 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_11) / var_94_21

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_11 + var_94_21 and arg_91_1.time_ < var_94_11 + var_94_21 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play121531023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 121531023
		arg_95_1.duration_ = 8.666

		local var_95_0 = {
			ja = 8.666,
			ko = 6.966,
			zh = 6.966
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
				arg_95_0:Play121531024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1072ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1072ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1072ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1072ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1072ui_story == nil then
				arg_95_1.var_.characterEffect1072ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1072ui_story then
					local var_98_13 = Mathf.Lerp(0, 0.5, var_98_12)

					arg_95_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1072ui_story.fillRatio = var_98_13
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1072ui_story then
				local var_98_14 = 0.5

				arg_95_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1072ui_story.fillRatio = var_98_14
			end

			local var_98_15 = arg_95_1.actors_["1074ui_story"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos1074ui_story = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(-0.7, -1.055, -6.12)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1074ui_story, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_15.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_15.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				var_98_15.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_15.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_15.localEulerAngles = var_98_23
			end

			local var_98_24 = arg_95_1.actors_["1074ui_story"]
			local var_98_25 = 0

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 and arg_95_1.var_.characterEffect1074ui_story == nil then
				arg_95_1.var_.characterEffect1074ui_story = var_98_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_26 = 0.200000002980232

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_26 then
				local var_98_27 = (arg_95_1.time_ - var_98_25) / var_98_26

				if arg_95_1.var_.characterEffect1074ui_story then
					arg_95_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_25 + var_98_26 and arg_95_1.time_ < var_98_25 + var_98_26 + arg_98_0 and arg_95_1.var_.characterEffect1074ui_story then
				arg_95_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_98_28 = 0

			if var_98_28 < arg_95_1.time_ and arg_95_1.time_ <= var_98_28 + arg_98_0 then
				arg_95_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_98_29 = 0

			if var_98_29 < arg_95_1.time_ and arg_95_1.time_ <= var_98_29 + arg_98_0 then
				arg_95_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_98_30 = arg_95_1.actors_["10044ui_story"]
			local var_98_31 = 0

			if var_98_31 < arg_95_1.time_ and arg_95_1.time_ <= var_98_31 + arg_98_0 and arg_95_1.var_.characterEffect10044ui_story == nil then
				arg_95_1.var_.characterEffect10044ui_story = var_98_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_32 = 0.200000002980232

			if var_98_31 <= arg_95_1.time_ and arg_95_1.time_ < var_98_31 + var_98_32 then
				local var_98_33 = (arg_95_1.time_ - var_98_31) / var_98_32

				if arg_95_1.var_.characterEffect10044ui_story then
					local var_98_34 = Mathf.Lerp(0, 0.5, var_98_33)

					arg_95_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10044ui_story.fillRatio = var_98_34
				end
			end

			if arg_95_1.time_ >= var_98_31 + var_98_32 and arg_95_1.time_ < var_98_31 + var_98_32 + arg_98_0 and arg_95_1.var_.characterEffect10044ui_story then
				local var_98_35 = 0.5

				arg_95_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10044ui_story.fillRatio = var_98_35
			end

			local var_98_36 = 0
			local var_98_37 = 0.85

			if var_98_36 < arg_95_1.time_ and arg_95_1.time_ <= var_98_36 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_38 = arg_95_1:FormatText(StoryNameCfg[410].name)

				arg_95_1.leftNameTxt_.text = var_98_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_39 = arg_95_1:GetWordFromCfg(121531023)
				local var_98_40 = arg_95_1:FormatText(var_98_39.content)

				arg_95_1.text_.text = var_98_40

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_41 = 34
				local var_98_42 = utf8.len(var_98_40)
				local var_98_43 = var_98_41 <= 0 and var_98_37 or var_98_37 * (var_98_42 / var_98_41)

				if var_98_43 > 0 and var_98_37 < var_98_43 then
					arg_95_1.talkMaxDuration = var_98_43

					if var_98_43 + var_98_36 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_43 + var_98_36
					end
				end

				arg_95_1.text_.text = var_98_40
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531023", "story_v_out_121531.awb") ~= 0 then
					local var_98_44 = manager.audio:GetVoiceLength("story_v_out_121531", "121531023", "story_v_out_121531.awb") / 1000

					if var_98_44 + var_98_36 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_44 + var_98_36
					end

					if var_98_39.prefab_name ~= "" and arg_95_1.actors_[var_98_39.prefab_name] ~= nil then
						local var_98_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_39.prefab_name].transform, "story_v_out_121531", "121531023", "story_v_out_121531.awb")

						arg_95_1:RecordAudio("121531023", var_98_45)
						arg_95_1:RecordAudio("121531023", var_98_45)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_121531", "121531023", "story_v_out_121531.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_121531", "121531023", "story_v_out_121531.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_46 = math.max(var_98_37, arg_95_1.talkMaxDuration)

			if var_98_36 <= arg_95_1.time_ and arg_95_1.time_ < var_98_36 + var_98_46 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_36) / var_98_46

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_36 + var_98_46 and arg_95_1.time_ < var_98_36 + var_98_46 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play121531024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 121531024
		arg_99_1.duration_ = 6.3

		local var_99_0 = {
			ja = 6.3,
			ko = 6,
			zh = 6
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
				arg_99_0:Play121531025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10044ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10044ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0.7, -0.72, -6.3)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10044ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["10044ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect10044ui_story == nil then
				arg_99_1.var_.characterEffect10044ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect10044ui_story then
					arg_99_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect10044ui_story then
				arg_99_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action432")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_102_15 = arg_99_1.actors_["1074ui_story"]
			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 and arg_99_1.var_.characterEffect1074ui_story == nil then
				arg_99_1.var_.characterEffect1074ui_story = var_102_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_17 = 0.200000002980232

			if var_102_16 <= arg_99_1.time_ and arg_99_1.time_ < var_102_16 + var_102_17 then
				local var_102_18 = (arg_99_1.time_ - var_102_16) / var_102_17

				if arg_99_1.var_.characterEffect1074ui_story then
					local var_102_19 = Mathf.Lerp(0, 0.5, var_102_18)

					arg_99_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1074ui_story.fillRatio = var_102_19
				end
			end

			if arg_99_1.time_ >= var_102_16 + var_102_17 and arg_99_1.time_ < var_102_16 + var_102_17 + arg_102_0 and arg_99_1.var_.characterEffect1074ui_story then
				local var_102_20 = 0.5

				arg_99_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1074ui_story.fillRatio = var_102_20
			end

			local var_102_21 = 0
			local var_102_22 = 0.825

			if var_102_21 < arg_99_1.time_ and arg_99_1.time_ <= var_102_21 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_23 = arg_99_1:FormatText(StoryNameCfg[380].name)

				arg_99_1.leftNameTxt_.text = var_102_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_24 = arg_99_1:GetWordFromCfg(121531024)
				local var_102_25 = arg_99_1:FormatText(var_102_24.content)

				arg_99_1.text_.text = var_102_25

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_26 = 33
				local var_102_27 = utf8.len(var_102_25)
				local var_102_28 = var_102_26 <= 0 and var_102_22 or var_102_22 * (var_102_27 / var_102_26)

				if var_102_28 > 0 and var_102_22 < var_102_28 then
					arg_99_1.talkMaxDuration = var_102_28

					if var_102_28 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_28 + var_102_21
					end
				end

				arg_99_1.text_.text = var_102_25
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531024", "story_v_out_121531.awb") ~= 0 then
					local var_102_29 = manager.audio:GetVoiceLength("story_v_out_121531", "121531024", "story_v_out_121531.awb") / 1000

					if var_102_29 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_29 + var_102_21
					end

					if var_102_24.prefab_name ~= "" and arg_99_1.actors_[var_102_24.prefab_name] ~= nil then
						local var_102_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_24.prefab_name].transform, "story_v_out_121531", "121531024", "story_v_out_121531.awb")

						arg_99_1:RecordAudio("121531024", var_102_30)
						arg_99_1:RecordAudio("121531024", var_102_30)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_121531", "121531024", "story_v_out_121531.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_121531", "121531024", "story_v_out_121531.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_31 = math.max(var_102_22, arg_99_1.talkMaxDuration)

			if var_102_21 <= arg_99_1.time_ and arg_99_1.time_ < var_102_21 + var_102_31 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_21) / var_102_31

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_21 + var_102_31 and arg_99_1.time_ < var_102_21 + var_102_31 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play121531025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 121531025
		arg_103_1.duration_ = 7.5

		local var_103_0 = {
			ja = 7.066,
			ko = 7.5,
			zh = 7.5
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
				arg_103_0:Play121531026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1072ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1072ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(-0.7, -0.71, -6)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1072ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1072ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1072ui_story == nil then
				arg_103_1.var_.characterEffect1072ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1072ui_story then
					arg_103_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1072ui_story then
				arg_103_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_15 = arg_103_1.actors_["1074ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos1074ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0, 100, 0)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1074ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(0, 100, 0)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = arg_103_1.actors_["1074ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect1074ui_story == nil then
				arg_103_1.var_.characterEffect1074ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect1074ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1074ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect1074ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1074ui_story.fillRatio = var_106_29
			end

			local var_106_30 = arg_103_1.actors_["10044ui_story"]
			local var_106_31 = 0

			if var_106_31 < arg_103_1.time_ and arg_103_1.time_ <= var_106_31 + arg_106_0 and arg_103_1.var_.characterEffect10044ui_story == nil then
				arg_103_1.var_.characterEffect10044ui_story = var_106_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_32 = 0.200000002980232

			if var_106_31 <= arg_103_1.time_ and arg_103_1.time_ < var_106_31 + var_106_32 then
				local var_106_33 = (arg_103_1.time_ - var_106_31) / var_106_32

				if arg_103_1.var_.characterEffect10044ui_story then
					local var_106_34 = Mathf.Lerp(0, 0.5, var_106_33)

					arg_103_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10044ui_story.fillRatio = var_106_34
				end
			end

			if arg_103_1.time_ >= var_106_31 + var_106_32 and arg_103_1.time_ < var_106_31 + var_106_32 + arg_106_0 and arg_103_1.var_.characterEffect10044ui_story then
				local var_106_35 = 0.5

				arg_103_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10044ui_story.fillRatio = var_106_35
			end

			local var_106_36 = 0
			local var_106_37 = 0.8

			if var_106_36 < arg_103_1.time_ and arg_103_1.time_ <= var_106_36 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_38 = arg_103_1:FormatText(StoryNameCfg[379].name)

				arg_103_1.leftNameTxt_.text = var_106_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_39 = arg_103_1:GetWordFromCfg(121531025)
				local var_106_40 = arg_103_1:FormatText(var_106_39.content)

				arg_103_1.text_.text = var_106_40

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_41 = 32
				local var_106_42 = utf8.len(var_106_40)
				local var_106_43 = var_106_41 <= 0 and var_106_37 or var_106_37 * (var_106_42 / var_106_41)

				if var_106_43 > 0 and var_106_37 < var_106_43 then
					arg_103_1.talkMaxDuration = var_106_43

					if var_106_43 + var_106_36 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_43 + var_106_36
					end
				end

				arg_103_1.text_.text = var_106_40
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531025", "story_v_out_121531.awb") ~= 0 then
					local var_106_44 = manager.audio:GetVoiceLength("story_v_out_121531", "121531025", "story_v_out_121531.awb") / 1000

					if var_106_44 + var_106_36 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_44 + var_106_36
					end

					if var_106_39.prefab_name ~= "" and arg_103_1.actors_[var_106_39.prefab_name] ~= nil then
						local var_106_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_39.prefab_name].transform, "story_v_out_121531", "121531025", "story_v_out_121531.awb")

						arg_103_1:RecordAudio("121531025", var_106_45)
						arg_103_1:RecordAudio("121531025", var_106_45)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_121531", "121531025", "story_v_out_121531.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_121531", "121531025", "story_v_out_121531.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_46 = math.max(var_106_37, arg_103_1.talkMaxDuration)

			if var_106_36 <= arg_103_1.time_ and arg_103_1.time_ < var_106_36 + var_106_46 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_36) / var_106_46

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_36 + var_106_46 and arg_103_1.time_ < var_106_36 + var_106_46 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play121531026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 121531026
		arg_107_1.duration_ = 4.033

		local var_107_0 = {
			ja = 4.033,
			ko = 2.966,
			zh = 2.966
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
				arg_107_0:Play121531027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1072ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1072ui_story == nil then
				arg_107_1.var_.characterEffect1072ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1072ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1072ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1072ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1072ui_story.fillRatio = var_110_5
			end

			local var_110_6 = arg_107_1.actors_["10044ui_story"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.characterEffect10044ui_story == nil then
				arg_107_1.var_.characterEffect10044ui_story = var_110_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_8 = 0.200000002980232

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.characterEffect10044ui_story then
					arg_107_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.characterEffect10044ui_story then
				arg_107_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action2_2")
			end

			local var_110_11 = 0
			local var_110_12 = 0.2

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_13 = arg_107_1:FormatText(StoryNameCfg[380].name)

				arg_107_1.leftNameTxt_.text = var_110_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_14 = arg_107_1:GetWordFromCfg(121531026)
				local var_110_15 = arg_107_1:FormatText(var_110_14.content)

				arg_107_1.text_.text = var_110_15

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_16 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531026", "story_v_out_121531.awb") ~= 0 then
					local var_110_19 = manager.audio:GetVoiceLength("story_v_out_121531", "121531026", "story_v_out_121531.awb") / 1000

					if var_110_19 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_11
					end

					if var_110_14.prefab_name ~= "" and arg_107_1.actors_[var_110_14.prefab_name] ~= nil then
						local var_110_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_14.prefab_name].transform, "story_v_out_121531", "121531026", "story_v_out_121531.awb")

						arg_107_1:RecordAudio("121531026", var_110_20)
						arg_107_1:RecordAudio("121531026", var_110_20)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_121531", "121531026", "story_v_out_121531.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_121531", "121531026", "story_v_out_121531.awb")
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
	Play121531027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 121531027
		arg_111_1.duration_ = 10.866

		local var_111_0 = {
			ja = 10.866,
			ko = 7.4,
			zh = 7.4
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
				arg_111_0:Play121531028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1072ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1072ui_story == nil then
				arg_111_1.var_.characterEffect1072ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1072ui_story then
					arg_111_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1072ui_story then
				arg_111_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_114_4 = arg_111_1.actors_["10044ui_story"]
			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 and arg_111_1.var_.characterEffect10044ui_story == nil then
				arg_111_1.var_.characterEffect10044ui_story = var_114_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_6 = 0.200000002980232

			if var_114_5 <= arg_111_1.time_ and arg_111_1.time_ < var_114_5 + var_114_6 then
				local var_114_7 = (arg_111_1.time_ - var_114_5) / var_114_6

				if arg_111_1.var_.characterEffect10044ui_story then
					local var_114_8 = Mathf.Lerp(0, 0.5, var_114_7)

					arg_111_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_111_1.var_.characterEffect10044ui_story.fillRatio = var_114_8
				end
			end

			if arg_111_1.time_ >= var_114_5 + var_114_6 and arg_111_1.time_ < var_114_5 + var_114_6 + arg_114_0 and arg_111_1.var_.characterEffect10044ui_story then
				local var_114_9 = 0.5

				arg_111_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_111_1.var_.characterEffect10044ui_story.fillRatio = var_114_9
			end

			local var_114_10 = 0
			local var_114_11 = 0.875

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_12 = arg_111_1:FormatText(StoryNameCfg[379].name)

				arg_111_1.leftNameTxt_.text = var_114_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_13 = arg_111_1:GetWordFromCfg(121531027)
				local var_114_14 = arg_111_1:FormatText(var_114_13.content)

				arg_111_1.text_.text = var_114_14

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_15 = 35
				local var_114_16 = utf8.len(var_114_14)
				local var_114_17 = var_114_15 <= 0 and var_114_11 or var_114_11 * (var_114_16 / var_114_15)

				if var_114_17 > 0 and var_114_11 < var_114_17 then
					arg_111_1.talkMaxDuration = var_114_17

					if var_114_17 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_17 + var_114_10
					end
				end

				arg_111_1.text_.text = var_114_14
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531027", "story_v_out_121531.awb") ~= 0 then
					local var_114_18 = manager.audio:GetVoiceLength("story_v_out_121531", "121531027", "story_v_out_121531.awb") / 1000

					if var_114_18 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_10
					end

					if var_114_13.prefab_name ~= "" and arg_111_1.actors_[var_114_13.prefab_name] ~= nil then
						local var_114_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_13.prefab_name].transform, "story_v_out_121531", "121531027", "story_v_out_121531.awb")

						arg_111_1:RecordAudio("121531027", var_114_19)
						arg_111_1:RecordAudio("121531027", var_114_19)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_121531", "121531027", "story_v_out_121531.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_121531", "121531027", "story_v_out_121531.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_20 = math.max(var_114_11, arg_111_1.talkMaxDuration)

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_20 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_10) / var_114_20

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_10 + var_114_20 and arg_111_1.time_ < var_114_10 + var_114_20 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play121531028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 121531028
		arg_115_1.duration_ = 9.633

		local var_115_0 = {
			ja = 9.633,
			ko = 6.666,
			zh = 6.666
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
				arg_115_0:Play121531029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10044ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos10044ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0, 100, 0)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10044ui_story, var_118_4, var_118_3)

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

			local var_118_9 = arg_115_1.actors_["10044ui_story"]
			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect10044ui_story == nil then
				arg_115_1.var_.characterEffect10044ui_story = var_118_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_11 = 0.200000002980232

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_10) / var_118_11

				if arg_115_1.var_.characterEffect10044ui_story then
					local var_118_13 = Mathf.Lerp(0, 0.5, var_118_12)

					arg_115_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_115_1.var_.characterEffect10044ui_story.fillRatio = var_118_13
				end
			end

			if arg_115_1.time_ >= var_118_10 + var_118_11 and arg_115_1.time_ < var_118_10 + var_118_11 + arg_118_0 and arg_115_1.var_.characterEffect10044ui_story then
				local var_118_14 = 0.5

				arg_115_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_115_1.var_.characterEffect10044ui_story.fillRatio = var_118_14
			end

			local var_118_15 = arg_115_1.actors_["1074ui_story"].transform
			local var_118_16 = 0

			if var_118_16 < arg_115_1.time_ and arg_115_1.time_ <= var_118_16 + arg_118_0 then
				arg_115_1.var_.moveOldPos1074ui_story = var_118_15.localPosition
			end

			local var_118_17 = 0.001

			if var_118_16 <= arg_115_1.time_ and arg_115_1.time_ < var_118_16 + var_118_17 then
				local var_118_18 = (arg_115_1.time_ - var_118_16) / var_118_17
				local var_118_19 = Vector3.New(0.7, -1.055, -6.12)

				var_118_15.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1074ui_story, var_118_19, var_118_18)

				local var_118_20 = manager.ui.mainCamera.transform.position - var_118_15.position

				var_118_15.forward = Vector3.New(var_118_20.x, var_118_20.y, var_118_20.z)

				local var_118_21 = var_118_15.localEulerAngles

				var_118_21.z = 0
				var_118_21.x = 0
				var_118_15.localEulerAngles = var_118_21
			end

			if arg_115_1.time_ >= var_118_16 + var_118_17 and arg_115_1.time_ < var_118_16 + var_118_17 + arg_118_0 then
				var_118_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_118_22 = manager.ui.mainCamera.transform.position - var_118_15.position

				var_118_15.forward = Vector3.New(var_118_22.x, var_118_22.y, var_118_22.z)

				local var_118_23 = var_118_15.localEulerAngles

				var_118_23.z = 0
				var_118_23.x = 0
				var_118_15.localEulerAngles = var_118_23
			end

			local var_118_24 = arg_115_1.actors_["1074ui_story"]
			local var_118_25 = 0

			if var_118_25 < arg_115_1.time_ and arg_115_1.time_ <= var_118_25 + arg_118_0 and arg_115_1.var_.characterEffect1074ui_story == nil then
				arg_115_1.var_.characterEffect1074ui_story = var_118_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_26 = 0.200000002980232

			if var_118_25 <= arg_115_1.time_ and arg_115_1.time_ < var_118_25 + var_118_26 then
				local var_118_27 = (arg_115_1.time_ - var_118_25) / var_118_26

				if arg_115_1.var_.characterEffect1074ui_story then
					arg_115_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_25 + var_118_26 and arg_115_1.time_ < var_118_25 + var_118_26 + arg_118_0 and arg_115_1.var_.characterEffect1074ui_story then
				arg_115_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_118_28 = 0

			if var_118_28 < arg_115_1.time_ and arg_115_1.time_ <= var_118_28 + arg_118_0 then
				arg_115_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_118_29 = 0

			if var_118_29 < arg_115_1.time_ and arg_115_1.time_ <= var_118_29 + arg_118_0 then
				arg_115_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_118_30 = arg_115_1.actors_["1072ui_story"]
			local var_118_31 = 0

			if var_118_31 < arg_115_1.time_ and arg_115_1.time_ <= var_118_31 + arg_118_0 and arg_115_1.var_.characterEffect1072ui_story == nil then
				arg_115_1.var_.characterEffect1072ui_story = var_118_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_32 = 0.200000002980232

			if var_118_31 <= arg_115_1.time_ and arg_115_1.time_ < var_118_31 + var_118_32 then
				local var_118_33 = (arg_115_1.time_ - var_118_31) / var_118_32

				if arg_115_1.var_.characterEffect1072ui_story then
					local var_118_34 = Mathf.Lerp(0, 0.5, var_118_33)

					arg_115_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1072ui_story.fillRatio = var_118_34
				end
			end

			if arg_115_1.time_ >= var_118_31 + var_118_32 and arg_115_1.time_ < var_118_31 + var_118_32 + arg_118_0 and arg_115_1.var_.characterEffect1072ui_story then
				local var_118_35 = 0.5

				arg_115_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1072ui_story.fillRatio = var_118_35
			end

			local var_118_36 = 0
			local var_118_37 = 0.925

			if var_118_36 < arg_115_1.time_ and arg_115_1.time_ <= var_118_36 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_38 = arg_115_1:FormatText(StoryNameCfg[410].name)

				arg_115_1.leftNameTxt_.text = var_118_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_39 = arg_115_1:GetWordFromCfg(121531028)
				local var_118_40 = arg_115_1:FormatText(var_118_39.content)

				arg_115_1.text_.text = var_118_40

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_41 = 37
				local var_118_42 = utf8.len(var_118_40)
				local var_118_43 = var_118_41 <= 0 and var_118_37 or var_118_37 * (var_118_42 / var_118_41)

				if var_118_43 > 0 and var_118_37 < var_118_43 then
					arg_115_1.talkMaxDuration = var_118_43

					if var_118_43 + var_118_36 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_43 + var_118_36
					end
				end

				arg_115_1.text_.text = var_118_40
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531028", "story_v_out_121531.awb") ~= 0 then
					local var_118_44 = manager.audio:GetVoiceLength("story_v_out_121531", "121531028", "story_v_out_121531.awb") / 1000

					if var_118_44 + var_118_36 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_44 + var_118_36
					end

					if var_118_39.prefab_name ~= "" and arg_115_1.actors_[var_118_39.prefab_name] ~= nil then
						local var_118_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_39.prefab_name].transform, "story_v_out_121531", "121531028", "story_v_out_121531.awb")

						arg_115_1:RecordAudio("121531028", var_118_45)
						arg_115_1:RecordAudio("121531028", var_118_45)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_121531", "121531028", "story_v_out_121531.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_121531", "121531028", "story_v_out_121531.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_46 = math.max(var_118_37, arg_115_1.talkMaxDuration)

			if var_118_36 <= arg_115_1.time_ and arg_115_1.time_ < var_118_36 + var_118_46 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_36) / var_118_46

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_36 + var_118_46 and arg_115_1.time_ < var_118_36 + var_118_46 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play121531029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 121531029
		arg_119_1.duration_ = 3

		local var_119_0 = {
			ja = 3,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_119_0:Play121531030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1074ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1074ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, 100, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1074ui_story, var_122_4, var_122_3)

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

			local var_122_9 = arg_119_1.actors_["1074ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1074ui_story == nil then
				arg_119_1.var_.characterEffect1074ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1074ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1074ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1074ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1074ui_story.fillRatio = var_122_14
			end

			local var_122_15 = arg_119_1.actors_["1072ui_story"].transform
			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.var_.moveOldPos1072ui_story = var_122_15.localPosition
			end

			local var_122_17 = 0.001

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Vector3.New(0, 100, 0)

				var_122_15.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1072ui_story, var_122_19, var_122_18)

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

			local var_122_24 = arg_119_1.actors_["1072ui_story"]
			local var_122_25 = 0

			if var_122_25 < arg_119_1.time_ and arg_119_1.time_ <= var_122_25 + arg_122_0 and arg_119_1.var_.characterEffect1072ui_story == nil then
				arg_119_1.var_.characterEffect1072ui_story = var_122_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_26 = 0.200000002980232

			if var_122_25 <= arg_119_1.time_ and arg_119_1.time_ < var_122_25 + var_122_26 then
				local var_122_27 = (arg_119_1.time_ - var_122_25) / var_122_26

				if arg_119_1.var_.characterEffect1072ui_story then
					local var_122_28 = Mathf.Lerp(0, 0.5, var_122_27)

					arg_119_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1072ui_story.fillRatio = var_122_28
				end
			end

			if arg_119_1.time_ >= var_122_25 + var_122_26 and arg_119_1.time_ < var_122_25 + var_122_26 + arg_122_0 and arg_119_1.var_.characterEffect1072ui_story then
				local var_122_29 = 0.5

				arg_119_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1072ui_story.fillRatio = var_122_29
			end

			local var_122_30 = arg_119_1.actors_["10044ui_story"].transform
			local var_122_31 = 0

			if var_122_31 < arg_119_1.time_ and arg_119_1.time_ <= var_122_31 + arg_122_0 then
				arg_119_1.var_.moveOldPos10044ui_story = var_122_30.localPosition
			end

			local var_122_32 = 0.001

			if var_122_31 <= arg_119_1.time_ and arg_119_1.time_ < var_122_31 + var_122_32 then
				local var_122_33 = (arg_119_1.time_ - var_122_31) / var_122_32
				local var_122_34 = Vector3.New(0, -0.72, -6.3)

				var_122_30.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10044ui_story, var_122_34, var_122_33)

				local var_122_35 = manager.ui.mainCamera.transform.position - var_122_30.position

				var_122_30.forward = Vector3.New(var_122_35.x, var_122_35.y, var_122_35.z)

				local var_122_36 = var_122_30.localEulerAngles

				var_122_36.z = 0
				var_122_36.x = 0
				var_122_30.localEulerAngles = var_122_36
			end

			if arg_119_1.time_ >= var_122_31 + var_122_32 and arg_119_1.time_ < var_122_31 + var_122_32 + arg_122_0 then
				var_122_30.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_122_37 = manager.ui.mainCamera.transform.position - var_122_30.position

				var_122_30.forward = Vector3.New(var_122_37.x, var_122_37.y, var_122_37.z)

				local var_122_38 = var_122_30.localEulerAngles

				var_122_38.z = 0
				var_122_38.x = 0
				var_122_30.localEulerAngles = var_122_38
			end

			local var_122_39 = arg_119_1.actors_["10044ui_story"]
			local var_122_40 = 0

			if var_122_40 < arg_119_1.time_ and arg_119_1.time_ <= var_122_40 + arg_122_0 and arg_119_1.var_.characterEffect10044ui_story == nil then
				arg_119_1.var_.characterEffect10044ui_story = var_122_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_41 = 0.200000002980232

			if var_122_40 <= arg_119_1.time_ and arg_119_1.time_ < var_122_40 + var_122_41 then
				local var_122_42 = (arg_119_1.time_ - var_122_40) / var_122_41

				if arg_119_1.var_.characterEffect10044ui_story then
					arg_119_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_40 + var_122_41 and arg_119_1.time_ < var_122_40 + var_122_41 + arg_122_0 and arg_119_1.var_.characterEffect10044ui_story then
				arg_119_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_122_43 = 0

			if var_122_43 < arg_119_1.time_ and arg_119_1.time_ <= var_122_43 + arg_122_0 then
				arg_119_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action4_1")
			end

			local var_122_44 = 0

			if var_122_44 < arg_119_1.time_ and arg_119_1.time_ <= var_122_44 + arg_122_0 then
				arg_119_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_122_45 = 0
			local var_122_46 = 0.2

			if var_122_45 < arg_119_1.time_ and arg_119_1.time_ <= var_122_45 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_47 = arg_119_1:FormatText(StoryNameCfg[380].name)

				arg_119_1.leftNameTxt_.text = var_122_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_48 = arg_119_1:GetWordFromCfg(121531029)
				local var_122_49 = arg_119_1:FormatText(var_122_48.content)

				arg_119_1.text_.text = var_122_49

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_50 = 8
				local var_122_51 = utf8.len(var_122_49)
				local var_122_52 = var_122_50 <= 0 and var_122_46 or var_122_46 * (var_122_51 / var_122_50)

				if var_122_52 > 0 and var_122_46 < var_122_52 then
					arg_119_1.talkMaxDuration = var_122_52

					if var_122_52 + var_122_45 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_52 + var_122_45
					end
				end

				arg_119_1.text_.text = var_122_49
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531029", "story_v_out_121531.awb") ~= 0 then
					local var_122_53 = manager.audio:GetVoiceLength("story_v_out_121531", "121531029", "story_v_out_121531.awb") / 1000

					if var_122_53 + var_122_45 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_53 + var_122_45
					end

					if var_122_48.prefab_name ~= "" and arg_119_1.actors_[var_122_48.prefab_name] ~= nil then
						local var_122_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_48.prefab_name].transform, "story_v_out_121531", "121531029", "story_v_out_121531.awb")

						arg_119_1:RecordAudio("121531029", var_122_54)
						arg_119_1:RecordAudio("121531029", var_122_54)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_121531", "121531029", "story_v_out_121531.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_121531", "121531029", "story_v_out_121531.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_55 = math.max(var_122_46, arg_119_1.talkMaxDuration)

			if var_122_45 <= arg_119_1.time_ and arg_119_1.time_ < var_122_45 + var_122_55 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_45) / var_122_55

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_45 + var_122_55 and arg_119_1.time_ < var_122_45 + var_122_55 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play121531030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 121531030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play121531031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10044ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect10044ui_story == nil then
				arg_123_1.var_.characterEffect10044ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect10044ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_123_1.var_.characterEffect10044ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect10044ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_123_1.var_.characterEffect10044ui_story.fillRatio = var_126_5
			end

			local var_126_6 = 0
			local var_126_7 = 0.875

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_8 = arg_123_1:GetWordFromCfg(121531030)
				local var_126_9 = arg_123_1:FormatText(var_126_8.content)

				arg_123_1.text_.text = var_126_9

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_10 = 35
				local var_126_11 = utf8.len(var_126_9)
				local var_126_12 = var_126_10 <= 0 and var_126_7 or var_126_7 * (var_126_11 / var_126_10)

				if var_126_12 > 0 and var_126_7 < var_126_12 then
					arg_123_1.talkMaxDuration = var_126_12

					if var_126_12 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_12 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_9
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_13 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_13 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_13

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_13 and arg_123_1.time_ < var_126_6 + var_126_13 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play121531031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 121531031
		arg_127_1.duration_ = 6.433

		local var_127_0 = {
			ja = 6.433,
			ko = 5.933,
			zh = 5.933
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
				arg_127_0:Play121531032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10044ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect10044ui_story == nil then
				arg_127_1.var_.characterEffect10044ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect10044ui_story then
					arg_127_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect10044ui_story then
				arg_127_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_130_4 = 0

			if var_130_4 < arg_127_1.time_ and arg_127_1.time_ <= var_130_4 + arg_130_0 then
				arg_127_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action4_2")
			end

			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 then
				arg_127_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_130_6 = 0
			local var_130_7 = 0.525

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_8 = arg_127_1:FormatText(StoryNameCfg[380].name)

				arg_127_1.leftNameTxt_.text = var_130_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_9 = arg_127_1:GetWordFromCfg(121531031)
				local var_130_10 = arg_127_1:FormatText(var_130_9.content)

				arg_127_1.text_.text = var_130_10

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_11 = 21
				local var_130_12 = utf8.len(var_130_10)
				local var_130_13 = var_130_11 <= 0 and var_130_7 or var_130_7 * (var_130_12 / var_130_11)

				if var_130_13 > 0 and var_130_7 < var_130_13 then
					arg_127_1.talkMaxDuration = var_130_13

					if var_130_13 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_13 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_10
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531031", "story_v_out_121531.awb") ~= 0 then
					local var_130_14 = manager.audio:GetVoiceLength("story_v_out_121531", "121531031", "story_v_out_121531.awb") / 1000

					if var_130_14 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_14 + var_130_6
					end

					if var_130_9.prefab_name ~= "" and arg_127_1.actors_[var_130_9.prefab_name] ~= nil then
						local var_130_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_9.prefab_name].transform, "story_v_out_121531", "121531031", "story_v_out_121531.awb")

						arg_127_1:RecordAudio("121531031", var_130_15)
						arg_127_1:RecordAudio("121531031", var_130_15)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_121531", "121531031", "story_v_out_121531.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_121531", "121531031", "story_v_out_121531.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_16 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_16 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_16

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_16 and arg_127_1.time_ < var_130_6 + var_130_16 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play121531032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 121531032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play121531033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10044ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10044ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, 100, 0)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10044ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, 100, 0)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["10044ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect10044ui_story == nil then
				arg_131_1.var_.characterEffect10044ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect10044ui_story then
					local var_134_13 = Mathf.Lerp(0, 0.5, var_134_12)

					arg_131_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10044ui_story.fillRatio = var_134_13
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect10044ui_story then
				local var_134_14 = 0.5

				arg_131_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10044ui_story.fillRatio = var_134_14
			end

			local var_134_15 = 0
			local var_134_16 = 0.35

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_17 = arg_131_1:GetWordFromCfg(121531032)
				local var_134_18 = arg_131_1:FormatText(var_134_17.content)

				arg_131_1.text_.text = var_134_18

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_19 = 14
				local var_134_20 = utf8.len(var_134_18)
				local var_134_21 = var_134_19 <= 0 and var_134_16 or var_134_16 * (var_134_20 / var_134_19)

				if var_134_21 > 0 and var_134_16 < var_134_21 then
					arg_131_1.talkMaxDuration = var_134_21

					if var_134_21 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_21 + var_134_15
					end
				end

				arg_131_1.text_.text = var_134_18
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_22 = math.max(var_134_16, arg_131_1.talkMaxDuration)

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_22 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_15) / var_134_22

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_15 + var_134_22 and arg_131_1.time_ < var_134_15 + var_134_22 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play121531033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 121531033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play121531034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 1

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_2 = arg_135_1:GetWordFromCfg(121531033)
				local var_138_3 = arg_135_1:FormatText(var_138_2.content)

				arg_135_1.text_.text = var_138_3

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_4 = 40
				local var_138_5 = utf8.len(var_138_3)
				local var_138_6 = var_138_4 <= 0 and var_138_1 or var_138_1 * (var_138_5 / var_138_4)

				if var_138_6 > 0 and var_138_1 < var_138_6 then
					arg_135_1.talkMaxDuration = var_138_6

					if var_138_6 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_6 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_3
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_7 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_7 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_7

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_7 and arg_135_1.time_ < var_138_0 + var_138_7 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play121531034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 121531034
		arg_139_1.duration_ = 15.266

		local var_139_0 = {
			ja = 12,
			ko = 15.266,
			zh = 15.266
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
				arg_139_0:Play121531035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1072ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1072ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, -0.71, -6)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1072ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1072ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1072ui_story == nil then
				arg_139_1.var_.characterEffect1072ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1072ui_story then
					arg_139_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1072ui_story then
				arg_139_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_142_15 = 0
			local var_142_16 = 1.375

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_17 = arg_139_1:FormatText(StoryNameCfg[379].name)

				arg_139_1.leftNameTxt_.text = var_142_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_18 = arg_139_1:GetWordFromCfg(121531034)
				local var_142_19 = arg_139_1:FormatText(var_142_18.content)

				arg_139_1.text_.text = var_142_19

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_20 = 55
				local var_142_21 = utf8.len(var_142_19)
				local var_142_22 = var_142_20 <= 0 and var_142_16 or var_142_16 * (var_142_21 / var_142_20)

				if var_142_22 > 0 and var_142_16 < var_142_22 then
					arg_139_1.talkMaxDuration = var_142_22

					if var_142_22 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_22 + var_142_15
					end
				end

				arg_139_1.text_.text = var_142_19
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531034", "story_v_out_121531.awb") ~= 0 then
					local var_142_23 = manager.audio:GetVoiceLength("story_v_out_121531", "121531034", "story_v_out_121531.awb") / 1000

					if var_142_23 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_23 + var_142_15
					end

					if var_142_18.prefab_name ~= "" and arg_139_1.actors_[var_142_18.prefab_name] ~= nil then
						local var_142_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_18.prefab_name].transform, "story_v_out_121531", "121531034", "story_v_out_121531.awb")

						arg_139_1:RecordAudio("121531034", var_142_24)
						arg_139_1:RecordAudio("121531034", var_142_24)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_121531", "121531034", "story_v_out_121531.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_121531", "121531034", "story_v_out_121531.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_25 = math.max(var_142_16, arg_139_1.talkMaxDuration)

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_25 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_15) / var_142_25

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_15 + var_142_25 and arg_139_1.time_ < var_142_15 + var_142_25 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play121531035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 121531035
		arg_143_1.duration_ = 14.466

		local var_143_0 = {
			ja = 14.466,
			ko = 10.733,
			zh = 10.733
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
				arg_143_0:Play121531036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.2

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[379].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(121531035)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531035", "story_v_out_121531.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_121531", "121531035", "story_v_out_121531.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_121531", "121531035", "story_v_out_121531.awb")

						arg_143_1:RecordAudio("121531035", var_146_9)
						arg_143_1:RecordAudio("121531035", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_121531", "121531035", "story_v_out_121531.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_121531", "121531035", "story_v_out_121531.awb")
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
	Play121531036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 121531036
		arg_147_1.duration_ = 14.233

		local var_147_0 = {
			ja = 14.233,
			ko = 12.5,
			zh = 12.5
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
				arg_147_0:Play121531037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_2 = 0
			local var_150_3 = 1.575

			if var_150_2 < arg_147_1.time_ and arg_147_1.time_ <= var_150_2 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_4 = arg_147_1:FormatText(StoryNameCfg[379].name)

				arg_147_1.leftNameTxt_.text = var_150_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_5 = arg_147_1:GetWordFromCfg(121531036)
				local var_150_6 = arg_147_1:FormatText(var_150_5.content)

				arg_147_1.text_.text = var_150_6

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_7 = 65
				local var_150_8 = utf8.len(var_150_6)
				local var_150_9 = var_150_7 <= 0 and var_150_3 or var_150_3 * (var_150_8 / var_150_7)

				if var_150_9 > 0 and var_150_3 < var_150_9 then
					arg_147_1.talkMaxDuration = var_150_9

					if var_150_9 + var_150_2 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_9 + var_150_2
					end
				end

				arg_147_1.text_.text = var_150_6
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531036", "story_v_out_121531.awb") ~= 0 then
					local var_150_10 = manager.audio:GetVoiceLength("story_v_out_121531", "121531036", "story_v_out_121531.awb") / 1000

					if var_150_10 + var_150_2 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_10 + var_150_2
					end

					if var_150_5.prefab_name ~= "" and arg_147_1.actors_[var_150_5.prefab_name] ~= nil then
						local var_150_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_5.prefab_name].transform, "story_v_out_121531", "121531036", "story_v_out_121531.awb")

						arg_147_1:RecordAudio("121531036", var_150_11)
						arg_147_1:RecordAudio("121531036", var_150_11)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_121531", "121531036", "story_v_out_121531.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_121531", "121531036", "story_v_out_121531.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_12 = math.max(var_150_3, arg_147_1.talkMaxDuration)

			if var_150_2 <= arg_147_1.time_ and arg_147_1.time_ < var_150_2 + var_150_12 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_2) / var_150_12

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_2 + var_150_12 and arg_147_1.time_ < var_150_2 + var_150_12 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play121531037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 121531037
		arg_151_1.duration_ = 9.066

		local var_151_0 = {
			ja = 9.066,
			ko = 9,
			zh = 9
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
				arg_151_0:Play121531038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 1.125

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[379].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(121531037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 45
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531037", "story_v_out_121531.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_121531", "121531037", "story_v_out_121531.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_121531", "121531037", "story_v_out_121531.awb")

						arg_151_1:RecordAudio("121531037", var_154_9)
						arg_151_1:RecordAudio("121531037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_121531", "121531037", "story_v_out_121531.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_121531", "121531037", "story_v_out_121531.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play121531038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 121531038
		arg_155_1.duration_ = 8.133

		local var_155_0 = {
			ja = 8.133,
			ko = 6.5,
			zh = 6.5
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
				arg_155_0:Play121531039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action452")
			end

			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_158_2 = 0
			local var_158_3 = 0.675

			if var_158_2 < arg_155_1.time_ and arg_155_1.time_ <= var_158_2 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_4 = arg_155_1:FormatText(StoryNameCfg[379].name)

				arg_155_1.leftNameTxt_.text = var_158_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_5 = arg_155_1:GetWordFromCfg(121531038)
				local var_158_6 = arg_155_1:FormatText(var_158_5.content)

				arg_155_1.text_.text = var_158_6

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_7 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_121531", "121531038", "story_v_out_121531.awb") ~= 0 then
					local var_158_10 = manager.audio:GetVoiceLength("story_v_out_121531", "121531038", "story_v_out_121531.awb") / 1000

					if var_158_10 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_2
					end

					if var_158_5.prefab_name ~= "" and arg_155_1.actors_[var_158_5.prefab_name] ~= nil then
						local var_158_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_5.prefab_name].transform, "story_v_out_121531", "121531038", "story_v_out_121531.awb")

						arg_155_1:RecordAudio("121531038", var_158_11)
						arg_155_1:RecordAudio("121531038", var_158_11)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_121531", "121531038", "story_v_out_121531.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_121531", "121531038", "story_v_out_121531.awb")
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
	Play121531039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 121531039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play121531040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1072ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1072ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(0, 100, 0)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1072ui_story, var_162_4, var_162_3)

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

			local var_162_9 = arg_159_1.actors_["1072ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect1072ui_story == nil then
				arg_159_1.var_.characterEffect1072ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect1072ui_story then
					local var_162_13 = Mathf.Lerp(0, 0.5, var_162_12)

					arg_159_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1072ui_story.fillRatio = var_162_13
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect1072ui_story then
				local var_162_14 = 0.5

				arg_159_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1072ui_story.fillRatio = var_162_14
			end

			local var_162_15 = 0
			local var_162_16 = 1.325

			if var_162_15 < arg_159_1.time_ and arg_159_1.time_ <= var_162_15 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_17 = arg_159_1:GetWordFromCfg(121531039)
				local var_162_18 = arg_159_1:FormatText(var_162_17.content)

				arg_159_1.text_.text = var_162_18

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_19 = 53
				local var_162_20 = utf8.len(var_162_18)
				local var_162_21 = var_162_19 <= 0 and var_162_16 or var_162_16 * (var_162_20 / var_162_19)

				if var_162_21 > 0 and var_162_16 < var_162_21 then
					arg_159_1.talkMaxDuration = var_162_21

					if var_162_21 + var_162_15 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_21 + var_162_15
					end
				end

				arg_159_1.text_.text = var_162_18
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_22 = math.max(var_162_16, arg_159_1.talkMaxDuration)

			if var_162_15 <= arg_159_1.time_ and arg_159_1.time_ < var_162_15 + var_162_22 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_15) / var_162_22

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_15 + var_162_22 and arg_159_1.time_ < var_162_15 + var_162_22 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play121531040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 121531040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
			arg_163_1.auto_ = false
		end

		function arg_163_1.playNext_(arg_165_0)
			arg_163_1.onStoryFinished_()
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.05

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

				local var_166_2 = arg_163_1:GetWordFromCfg(121531040)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 42
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST29a"
	},
	voices = {
		"story_v_out_121531.awb"
	}
}
