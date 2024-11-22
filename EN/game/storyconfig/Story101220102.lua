return {
	Play122012001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 122012001
		arg_1_1.duration_ = 6.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play122012002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J10i"

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
				local var_4_5 = arg_1_1.bgs_.J10i

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
					if iter_4_0 ~= "J10i" then
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
			local var_4_23 = 0.4

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.93333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999999
			local var_4_31 = 1.775

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

				local var_4_33 = arg_1_1:GetWordFromCfg(122012001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 71
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
	Play122012002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 122012002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play122012003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.25

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

				local var_10_2 = arg_7_1:GetWordFromCfg(122012002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 50
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
	Play122012003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 122012003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play122012004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.65

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

				local var_14_2 = arg_11_1:GetWordFromCfg(122012003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 26
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
	Play122012004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 122012004
		arg_15_1.duration_ = 9.133

		local var_15_0 = {
			ja = 9.133,
			ko = 5.333,
			zh = 5.333
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
				arg_15_0:Play122012005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1184ui_story"

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

			local var_18_4 = arg_15_1.actors_["1184ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1184ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0, -0.97, -6)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1184ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = arg_15_1.actors_["1184ui_story"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.characterEffect1184ui_story == nil then
				arg_15_1.var_.characterEffect1184ui_story = var_18_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_15 = 0.200000002980232

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.characterEffect1184ui_story then
					arg_15_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect1184ui_story then
				arg_15_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_18_19 = 0
			local var_18_20 = 0.675

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(122012004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012004", "story_v_out_122012.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_122012", "122012004", "story_v_out_122012.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_122012", "122012004", "story_v_out_122012.awb")

						arg_15_1:RecordAudio("122012004", var_18_28)
						arg_15_1:RecordAudio("122012004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_122012", "122012004", "story_v_out_122012.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_122012", "122012004", "story_v_out_122012.awb")
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
	Play122012005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 122012005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play122012006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1184ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1184ui_story == nil then
				arg_19_1.var_.characterEffect1184ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1184ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1184ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1184ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1184ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.675

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

				local var_22_9 = arg_19_1:GetWordFromCfg(122012005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 27
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
	Play122012006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 122012006
		arg_23_1.duration_ = 2.4

		local var_23_0 = {
			ja = 2.4,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_23_0:Play122012007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1184ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1184ui_story == nil then
				arg_23_1.var_.characterEffect1184ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1184ui_story then
					arg_23_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1184ui_story then
				arg_23_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_26_6 = arg_23_1.actors_["1184ui_story"].transform
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 then
				arg_23_1.var_.moveOldPos1184ui_story = var_26_6.localPosition

				local var_26_8 = "1184ui_story"

				arg_23_1:ShowWeapon(arg_23_1.var_[var_26_8 .. "Animator"].transform, true)
			end

			local var_26_9 = 0.001

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_7) / var_26_9
				local var_26_11 = Vector3.New(0, -0.97, -6)

				var_26_6.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1184ui_story, var_26_11, var_26_10)

				local var_26_12 = manager.ui.mainCamera.transform.position - var_26_6.position

				var_26_6.forward = Vector3.New(var_26_12.x, var_26_12.y, var_26_12.z)

				local var_26_13 = var_26_6.localEulerAngles

				var_26_13.z = 0
				var_26_13.x = 0
				var_26_6.localEulerAngles = var_26_13
			end

			if arg_23_1.time_ >= var_26_7 + var_26_9 and arg_23_1.time_ < var_26_7 + var_26_9 + arg_26_0 then
				var_26_6.localPosition = Vector3.New(0, -0.97, -6)

				local var_26_14 = manager.ui.mainCamera.transform.position - var_26_6.position

				var_26_6.forward = Vector3.New(var_26_14.x, var_26_14.y, var_26_14.z)

				local var_26_15 = var_26_6.localEulerAngles

				var_26_15.z = 0
				var_26_15.x = 0
				var_26_6.localEulerAngles = var_26_15
			end

			local var_26_16 = 0
			local var_26_17 = 0.2

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_18 = arg_23_1:FormatText(StoryNameCfg[6].name)

				arg_23_1.leftNameTxt_.text = var_26_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_19 = arg_23_1:GetWordFromCfg(122012006)
				local var_26_20 = arg_23_1:FormatText(var_26_19.content)

				arg_23_1.text_.text = var_26_20

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_21 = 8
				local var_26_22 = utf8.len(var_26_20)
				local var_26_23 = var_26_21 <= 0 and var_26_17 or var_26_17 * (var_26_22 / var_26_21)

				if var_26_23 > 0 and var_26_17 < var_26_23 then
					arg_23_1.talkMaxDuration = var_26_23

					if var_26_23 + var_26_16 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_16
					end
				end

				arg_23_1.text_.text = var_26_20
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012006", "story_v_out_122012.awb") ~= 0 then
					local var_26_24 = manager.audio:GetVoiceLength("story_v_out_122012", "122012006", "story_v_out_122012.awb") / 1000

					if var_26_24 + var_26_16 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_24 + var_26_16
					end

					if var_26_19.prefab_name ~= "" and arg_23_1.actors_[var_26_19.prefab_name] ~= nil then
						local var_26_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_19.prefab_name].transform, "story_v_out_122012", "122012006", "story_v_out_122012.awb")

						arg_23_1:RecordAudio("122012006", var_26_25)
						arg_23_1:RecordAudio("122012006", var_26_25)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_122012", "122012006", "story_v_out_122012.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_122012", "122012006", "story_v_out_122012.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_26 = math.max(var_26_17, arg_23_1.talkMaxDuration)

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_26 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_16) / var_26_26

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_16 + var_26_26 and arg_23_1.time_ < var_26_16 + var_26_26 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play122012007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 122012007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play122012008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1184ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1184ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1184ui_story, var_30_4, var_30_3)

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

			local var_30_9 = arg_27_1.actors_["1184ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1184ui_story == nil then
				arg_27_1.var_.characterEffect1184ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1184ui_story then
					local var_30_13 = Mathf.Lerp(0, 0.5, var_30_12)

					arg_27_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1184ui_story.fillRatio = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1184ui_story then
				local var_30_14 = 0.5

				arg_27_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1184ui_story.fillRatio = var_30_14
			end

			local var_30_15 = 0
			local var_30_16 = 1

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				local var_30_17 = "play"
				local var_30_18 = "effect"

				arg_27_1:AudioAction(var_30_17, var_30_18, "se_story_122_01", "se_story_122_01_shield", "")
			end

			local var_30_19 = 0
			local var_30_20 = 1.5

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_21 = arg_27_1:GetWordFromCfg(122012007)
				local var_30_22 = arg_27_1:FormatText(var_30_21.content)

				arg_27_1.text_.text = var_30_22

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_23 = 60
				local var_30_24 = utf8.len(var_30_22)
				local var_30_25 = var_30_23 <= 0 and var_30_20 or var_30_20 * (var_30_24 / var_30_23)

				if var_30_25 > 0 and var_30_20 < var_30_25 then
					arg_27_1.talkMaxDuration = var_30_25

					if var_30_25 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_25 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_22
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_26 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_26 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_26

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_26 and arg_27_1.time_ < var_30_19 + var_30_26 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play122012008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 122012008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play122012009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.4

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

				local var_34_2 = arg_31_1:GetWordFromCfg(122012008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 56
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
	Play122012009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 122012009
		arg_35_1.duration_ = 11.533

		local var_35_0 = {
			ja = 11.533,
			ko = 7.2,
			zh = 7.2
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
				arg_35_0:Play122012010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1184ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1184ui_story = var_38_0.localPosition

				local var_38_2 = "1184ui_story"

				arg_35_1:ShowWeapon(arg_35_1.var_[var_38_2 .. "Animator"].transform, false)
			end

			local var_38_3 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_1) / var_38_3
				local var_38_5 = Vector3.New(0, -0.97, -6)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1184ui_story, var_38_5, var_38_4)

				local var_38_6 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_6.x, var_38_6.y, var_38_6.z)

				local var_38_7 = var_38_0.localEulerAngles

				var_38_7.z = 0
				var_38_7.x = 0
				var_38_0.localEulerAngles = var_38_7
			end

			if arg_35_1.time_ >= var_38_1 + var_38_3 and arg_35_1.time_ < var_38_1 + var_38_3 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_38_8 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_8.x, var_38_8.y, var_38_8.z)

				local var_38_9 = var_38_0.localEulerAngles

				var_38_9.z = 0
				var_38_9.x = 0
				var_38_0.localEulerAngles = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["1184ui_story"]
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story == nil then
				arg_35_1.var_.characterEffect1184ui_story = var_38_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_12 = 0.200000002980232

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12

				if arg_35_1.var_.characterEffect1184ui_story then
					arg_35_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_11 + var_38_12 and arg_35_1.time_ < var_38_11 + var_38_12 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story then
				arg_35_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_38_16 = 0
			local var_38_17 = 0.975

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_18 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_19 = arg_35_1:GetWordFromCfg(122012009)
				local var_38_20 = arg_35_1:FormatText(var_38_19.content)

				arg_35_1.text_.text = var_38_20

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_21 = 39
				local var_38_22 = utf8.len(var_38_20)
				local var_38_23 = var_38_21 <= 0 and var_38_17 or var_38_17 * (var_38_22 / var_38_21)

				if var_38_23 > 0 and var_38_17 < var_38_23 then
					arg_35_1.talkMaxDuration = var_38_23

					if var_38_23 + var_38_16 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_16
					end
				end

				arg_35_1.text_.text = var_38_20
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012009", "story_v_out_122012.awb") ~= 0 then
					local var_38_24 = manager.audio:GetVoiceLength("story_v_out_122012", "122012009", "story_v_out_122012.awb") / 1000

					if var_38_24 + var_38_16 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_24 + var_38_16
					end

					if var_38_19.prefab_name ~= "" and arg_35_1.actors_[var_38_19.prefab_name] ~= nil then
						local var_38_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_19.prefab_name].transform, "story_v_out_122012", "122012009", "story_v_out_122012.awb")

						arg_35_1:RecordAudio("122012009", var_38_25)
						arg_35_1:RecordAudio("122012009", var_38_25)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_122012", "122012009", "story_v_out_122012.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_122012", "122012009", "story_v_out_122012.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_26 = math.max(var_38_17, arg_35_1.talkMaxDuration)

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_26 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_16) / var_38_26

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_16 + var_38_26 and arg_35_1.time_ < var_38_16 + var_38_26 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play122012010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 122012010
		arg_39_1.duration_ = 6.5

		local var_39_0 = {
			ja = 6.5,
			ko = 5,
			zh = 5
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
				arg_39_0:Play122012011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1184ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1184ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1184ui_story, var_42_4, var_42_3)

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

			local var_42_9 = arg_39_1.actors_["1184ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1184ui_story == nil then
				arg_39_1.var_.characterEffect1184ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1184ui_story then
					local var_42_13 = Mathf.Lerp(0, 0.5, var_42_12)

					arg_39_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1184ui_story.fillRatio = var_42_13
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1184ui_story then
				local var_42_14 = 0.5

				arg_39_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1184ui_story.fillRatio = var_42_14
			end

			local var_42_15 = manager.ui.mainCamera.transform
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.var_.shakeOldPos = var_42_15.localPosition
			end

			local var_42_17 = 0.6

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / 0.066
				local var_42_19, var_42_20 = math.modf(var_42_18)

				var_42_15.localPosition = Vector3.New(var_42_20 * 0.13, var_42_20 * 0.13, var_42_20 * 0.13) + arg_39_1.var_.shakeOldPos
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				var_42_15.localPosition = arg_39_1.var_.shakeOldPos
			end

			local var_42_21 = 0

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 then
				arg_39_1.allBtn_.enabled = false
			end

			local var_42_22 = 0.6

			if arg_39_1.time_ >= var_42_21 + var_42_22 and arg_39_1.time_ < var_42_21 + var_42_22 + arg_42_0 then
				arg_39_1.allBtn_.enabled = true
			end

			local var_42_23 = 0
			local var_42_24 = 0.625

			if var_42_23 < arg_39_1.time_ and arg_39_1.time_ <= var_42_23 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_25 = arg_39_1:FormatText(StoryNameCfg[384].name)

				arg_39_1.leftNameTxt_.text = var_42_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_26 = arg_39_1:GetWordFromCfg(122012010)
				local var_42_27 = arg_39_1:FormatText(var_42_26.content)

				arg_39_1.text_.text = var_42_27

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_28 = 25
				local var_42_29 = utf8.len(var_42_27)
				local var_42_30 = var_42_28 <= 0 and var_42_24 or var_42_24 * (var_42_29 / var_42_28)

				if var_42_30 > 0 and var_42_24 < var_42_30 then
					arg_39_1.talkMaxDuration = var_42_30

					if var_42_30 + var_42_23 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_30 + var_42_23
					end
				end

				arg_39_1.text_.text = var_42_27
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012010", "story_v_out_122012.awb") ~= 0 then
					local var_42_31 = manager.audio:GetVoiceLength("story_v_out_122012", "122012010", "story_v_out_122012.awb") / 1000

					if var_42_31 + var_42_23 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_31 + var_42_23
					end

					if var_42_26.prefab_name ~= "" and arg_39_1.actors_[var_42_26.prefab_name] ~= nil then
						local var_42_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_26.prefab_name].transform, "story_v_out_122012", "122012010", "story_v_out_122012.awb")

						arg_39_1:RecordAudio("122012010", var_42_32)
						arg_39_1:RecordAudio("122012010", var_42_32)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_122012", "122012010", "story_v_out_122012.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_122012", "122012010", "story_v_out_122012.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_33 = math.max(var_42_24, arg_39_1.talkMaxDuration)

			if var_42_23 <= arg_39_1.time_ and arg_39_1.time_ < var_42_23 + var_42_33 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_23) / var_42_33

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_23 + var_42_33 and arg_39_1.time_ < var_42_23 + var_42_33 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play122012011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 122012011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play122012012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.4

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(122012011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 16
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
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_8 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_8 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_8

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_8 and arg_43_1.time_ < var_46_0 + var_46_8 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play122012012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 122012012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play122012013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.3

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[7].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(122012012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 52
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_8 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_8 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_8

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_8 and arg_47_1.time_ < var_50_0 + var_50_8 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play122012013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 122012013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play122012014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.725

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_2 = arg_51_1:GetWordFromCfg(122012013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 69
				local var_54_5 = utf8.len(var_54_3)
				local var_54_6 = var_54_4 <= 0 and var_54_1 or var_54_1 * (var_54_5 / var_54_4)

				if var_54_6 > 0 and var_54_1 < var_54_6 then
					arg_51_1.talkMaxDuration = var_54_6

					if var_54_6 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_6 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_3
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_7 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_7 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_7

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_7 and arg_51_1.time_ < var_54_0 + var_54_7 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play122012014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 122012014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play122012015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.275

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

				local var_58_2 = arg_55_1:GetWordFromCfg(122012014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 51
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
	Play122012015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 122012015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play122012016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.45

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(122012015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 18
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play122012016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 122012016
		arg_63_1.duration_ = 1.999999999999

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"

			SetActive(arg_63_1.choicesGo_, true)

			for iter_64_0, iter_64_1 in ipairs(arg_63_1.choices_) do
				local var_64_0 = iter_64_0 <= 2

				SetActive(iter_64_1.go, var_64_0)
			end

			arg_63_1.choices_[1].txt.text = arg_63_1:FormatText(StoryChoiceCfg[417].name)
			arg_63_1.choices_[2].txt.text = arg_63_1:FormatText(StoryChoiceCfg[418].name)
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play122012017(arg_63_1)
			end

			if arg_65_0 == 2 then
				arg_63_0:Play122012025(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.allBtn_.enabled = false
			end

			local var_66_1 = 0.5

			if arg_63_1.time_ >= var_66_0 + var_66_1 and arg_63_1.time_ < var_66_0 + var_66_1 + arg_66_0 then
				arg_63_1.allBtn_.enabled = true
			end

			local var_66_2 = "1071ui_story"

			if arg_63_1.actors_[var_66_2] == nil then
				local var_66_3 = Object.Instantiate(Asset.Load("Char/" .. var_66_2), arg_63_1.stage_.transform)

				var_66_3.name = var_66_2
				var_66_3.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_2] = var_66_3

				local var_66_4 = var_66_3:GetComponentInChildren(typeof(CharacterEffect))

				var_66_4.enabled = true

				local var_66_5 = GameObjectTools.GetOrAddComponent(var_66_3, typeof(DynamicBoneHelper))

				if var_66_5 then
					var_66_5:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_4.transform, false)

				arg_63_1.var_[var_66_2 .. "Animator"] = var_66_4.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_2 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_2 .. "LipSync"] = var_66_4.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_6 = 0

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end
		end
	end,
	Play122012017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 122012017
		arg_67_1.duration_ = 4.366

		local var_67_0 = {
			ja = 4.366,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_67_0:Play122012018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1071ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1071ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, -1.05, -6.2)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1071ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1071ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1071ui_story == nil then
				arg_67_1.var_.characterEffect1071ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1071ui_story then
					arg_67_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1071ui_story then
				arg_67_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_70_14 = 0
			local var_70_15 = 0.05

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_16 = arg_67_1:FormatText(StoryNameCfg[384].name)

				arg_67_1.leftNameTxt_.text = var_70_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_17 = arg_67_1:GetWordFromCfg(122012017)
				local var_70_18 = arg_67_1:FormatText(var_70_17.content)

				arg_67_1.text_.text = var_70_18

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_19 = 2
				local var_70_20 = utf8.len(var_70_18)
				local var_70_21 = var_70_19 <= 0 and var_70_15 or var_70_15 * (var_70_20 / var_70_19)

				if var_70_21 > 0 and var_70_15 < var_70_21 then
					arg_67_1.talkMaxDuration = var_70_21

					if var_70_21 + var_70_14 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_14
					end
				end

				arg_67_1.text_.text = var_70_18
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012017", "story_v_out_122012.awb") ~= 0 then
					local var_70_22 = manager.audio:GetVoiceLength("story_v_out_122012", "122012017", "story_v_out_122012.awb") / 1000

					if var_70_22 + var_70_14 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_22 + var_70_14
					end

					if var_70_17.prefab_name ~= "" and arg_67_1.actors_[var_70_17.prefab_name] ~= nil then
						local var_70_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_17.prefab_name].transform, "story_v_out_122012", "122012017", "story_v_out_122012.awb")

						arg_67_1:RecordAudio("122012017", var_70_23)
						arg_67_1:RecordAudio("122012017", var_70_23)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_122012", "122012017", "story_v_out_122012.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_122012", "122012017", "story_v_out_122012.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_24 = math.max(var_70_15, arg_67_1.talkMaxDuration)

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_24 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_14) / var_70_24

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_14 + var_70_24 and arg_67_1.time_ < var_70_14 + var_70_24 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play122012018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 122012018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play122012019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1071ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1071ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, 100, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1071ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, 100, 0)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["1071ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect1071ui_story == nil then
				arg_71_1.var_.characterEffect1071ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect1071ui_story then
					local var_74_13 = Mathf.Lerp(0, 0.5, var_74_12)

					arg_71_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1071ui_story.fillRatio = var_74_13
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect1071ui_story then
				local var_74_14 = 0.5

				arg_71_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1071ui_story.fillRatio = var_74_14
			end

			local var_74_15 = 0
			local var_74_16 = 0.1

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_17 = arg_71_1:FormatText(StoryNameCfg[7].name)

				arg_71_1.leftNameTxt_.text = var_74_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_18 = arg_71_1:GetWordFromCfg(122012018)
				local var_74_19 = arg_71_1:FormatText(var_74_18.content)

				arg_71_1.text_.text = var_74_19

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_20 = 4
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
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_23 = math.max(var_74_16, arg_71_1.talkMaxDuration)

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_23 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_15) / var_74_23

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_15 + var_74_23 and arg_71_1.time_ < var_74_15 + var_74_23 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play122012019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 122012019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play122012020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.675

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(122012019)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 67
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play122012020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 122012020
		arg_79_1.duration_ = 6.5

		local var_79_0 = {
			ja = 6.5,
			ko = 3.9,
			zh = 3.9
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
				arg_79_0:Play122012021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1184ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1184ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, -0.97, -6)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1184ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1184ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1184ui_story == nil then
				arg_79_1.var_.characterEffect1184ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1184ui_story then
					arg_79_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1184ui_story then
				arg_79_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_82_15 = 0
			local var_82_16 = 0.425

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_17 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_18 = arg_79_1:GetWordFromCfg(122012020)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 17
				local var_82_21 = utf8.len(var_82_19)
				local var_82_22 = var_82_20 <= 0 and var_82_16 or var_82_16 * (var_82_21 / var_82_20)

				if var_82_22 > 0 and var_82_16 < var_82_22 then
					arg_79_1.talkMaxDuration = var_82_22

					if var_82_22 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_19
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012020", "story_v_out_122012.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_122012", "122012020", "story_v_out_122012.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_122012", "122012020", "story_v_out_122012.awb")

						arg_79_1:RecordAudio("122012020", var_82_24)
						arg_79_1:RecordAudio("122012020", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_122012", "122012020", "story_v_out_122012.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_122012", "122012020", "story_v_out_122012.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_25 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_25 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_25

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_25 and arg_79_1.time_ < var_82_15 + var_82_25 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play122012021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 122012021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play122012022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1184ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1184ui_story == nil then
				arg_83_1.var_.characterEffect1184ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1184ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1184ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1184ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1184ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.825

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(122012021)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 33
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_14 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_14 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_14

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_14 and arg_83_1.time_ < var_86_6 + var_86_14 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play122012022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 122012022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play122012023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.075

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[7].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(122012022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 3
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
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_8 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_8 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_8

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_8 and arg_87_1.time_ < var_90_0 + var_90_8 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play122012023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 122012023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play122012024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1184ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1184ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, 100, 0)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1184ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, 100, 0)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1184ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1184ui_story == nil then
				arg_91_1.var_.characterEffect1184ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1184ui_story then
					local var_94_13 = Mathf.Lerp(0, 0.5, var_94_12)

					arg_91_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1184ui_story.fillRatio = var_94_13
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1184ui_story then
				local var_94_14 = 0.5

				arg_91_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1184ui_story.fillRatio = var_94_14
			end

			local var_94_15 = 0
			local var_94_16 = 1.375

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(122012023)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 55
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_16 or var_94_16 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_16 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_15
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_22 = math.max(var_94_16, arg_91_1.talkMaxDuration)

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_22 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_15) / var_94_22

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_15 + var_94_22 and arg_91_1.time_ < var_94_15 + var_94_22 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play122012024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 122012024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play122012030(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.875

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_2 = arg_95_1:GetWordFromCfg(122012024)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 35
				local var_98_5 = utf8.len(var_98_3)
				local var_98_6 = var_98_4 <= 0 and var_98_1 or var_98_1 * (var_98_5 / var_98_4)

				if var_98_6 > 0 and var_98_1 < var_98_6 then
					arg_95_1.talkMaxDuration = var_98_6

					if var_98_6 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_6 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_3
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_7 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_7 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_7

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_7 and arg_95_1.time_ < var_98_0 + var_98_7 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play122012030 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 122012030
		arg_99_1.duration_ = 7.333

		local var_99_0 = {
			ja = 4.866,
			ko = 7.333,
			zh = 7.333
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
				arg_99_0:Play122012031(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1071ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1071ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.05, -6.2)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1071ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1071ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1071ui_story == nil then
				arg_99_1.var_.characterEffect1071ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1071ui_story then
					arg_99_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1071ui_story then
				arg_99_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_102_14 = 0
			local var_102_15 = 0.4

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_16 = arg_99_1:FormatText(StoryNameCfg[384].name)

				arg_99_1.leftNameTxt_.text = var_102_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_17 = arg_99_1:GetWordFromCfg(122012030)
				local var_102_18 = arg_99_1:FormatText(var_102_17.content)

				arg_99_1.text_.text = var_102_18

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_19 = 16
				local var_102_20 = utf8.len(var_102_18)
				local var_102_21 = var_102_19 <= 0 and var_102_15 or var_102_15 * (var_102_20 / var_102_19)

				if var_102_21 > 0 and var_102_15 < var_102_21 then
					arg_99_1.talkMaxDuration = var_102_21

					if var_102_21 + var_102_14 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_21 + var_102_14
					end
				end

				arg_99_1.text_.text = var_102_18
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012030", "story_v_out_122012.awb") ~= 0 then
					local var_102_22 = manager.audio:GetVoiceLength("story_v_out_122012", "122012030", "story_v_out_122012.awb") / 1000

					if var_102_22 + var_102_14 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_14
					end

					if var_102_17.prefab_name ~= "" and arg_99_1.actors_[var_102_17.prefab_name] ~= nil then
						local var_102_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_17.prefab_name].transform, "story_v_out_122012", "122012030", "story_v_out_122012.awb")

						arg_99_1:RecordAudio("122012030", var_102_23)
						arg_99_1:RecordAudio("122012030", var_102_23)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_122012", "122012030", "story_v_out_122012.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_122012", "122012030", "story_v_out_122012.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_24 = math.max(var_102_15, arg_99_1.talkMaxDuration)

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_24 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_14) / var_102_24

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_14 + var_102_24 and arg_99_1.time_ < var_102_14 + var_102_24 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play122012031 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 122012031
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play122012032(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1071ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1071ui_story == nil then
				arg_103_1.var_.characterEffect1071ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1071ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1071ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1071ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1071ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.15

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

				local var_106_9 = arg_103_1:GetWordFromCfg(122012031)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 6
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
	Play122012032 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 122012032
		arg_107_1.duration_ = 2.066

		local var_107_0 = {
			ja = 2.066,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_107_0:Play122012033(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1071ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1071ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, 100, 0)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1071ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, 100, 0)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1071ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1071ui_story == nil then
				arg_107_1.var_.characterEffect1071ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1071ui_story then
					local var_110_13 = Mathf.Lerp(0, 0.5, var_110_12)

					arg_107_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1071ui_story.fillRatio = var_110_13
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1071ui_story then
				local var_110_14 = 0.5

				arg_107_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1071ui_story.fillRatio = var_110_14
			end

			local var_110_15 = arg_107_1.actors_["1184ui_story"].transform
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.var_.moveOldPos1184ui_story = var_110_15.localPosition
			end

			local var_110_17 = 0.001

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Vector3.New(0, -0.97, -6)

				var_110_15.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1184ui_story, var_110_19, var_110_18)

				local var_110_20 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_20.x, var_110_20.y, var_110_20.z)

				local var_110_21 = var_110_15.localEulerAngles

				var_110_21.z = 0
				var_110_21.x = 0
				var_110_15.localEulerAngles = var_110_21
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				var_110_15.localPosition = Vector3.New(0, -0.97, -6)

				local var_110_22 = manager.ui.mainCamera.transform.position - var_110_15.position

				var_110_15.forward = Vector3.New(var_110_22.x, var_110_22.y, var_110_22.z)

				local var_110_23 = var_110_15.localEulerAngles

				var_110_23.z = 0
				var_110_23.x = 0
				var_110_15.localEulerAngles = var_110_23
			end

			local var_110_24 = arg_107_1.actors_["1184ui_story"]
			local var_110_25 = 0

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 and arg_107_1.var_.characterEffect1184ui_story == nil then
				arg_107_1.var_.characterEffect1184ui_story = var_110_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_26 = 0.200000002980232

			if var_110_25 <= arg_107_1.time_ and arg_107_1.time_ < var_110_25 + var_110_26 then
				local var_110_27 = (arg_107_1.time_ - var_110_25) / var_110_26

				if arg_107_1.var_.characterEffect1184ui_story then
					arg_107_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_25 + var_110_26 and arg_107_1.time_ < var_110_25 + var_110_26 + arg_110_0 and arg_107_1.var_.characterEffect1184ui_story then
				arg_107_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_110_28 = 0

			if var_110_28 < arg_107_1.time_ and arg_107_1.time_ <= var_110_28 + arg_110_0 then
				arg_107_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_110_29 = 0

			if var_110_29 < arg_107_1.time_ and arg_107_1.time_ <= var_110_29 + arg_110_0 then
				arg_107_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_30 = 0
			local var_110_31 = 0.225

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_32 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(122012032)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 9
				local var_110_36 = utf8.len(var_110_34)
				local var_110_37 = var_110_35 <= 0 and var_110_31 or var_110_31 * (var_110_36 / var_110_35)

				if var_110_37 > 0 and var_110_31 < var_110_37 then
					arg_107_1.talkMaxDuration = var_110_37

					if var_110_37 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_37 + var_110_30
					end
				end

				arg_107_1.text_.text = var_110_34
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012032", "story_v_out_122012.awb") ~= 0 then
					local var_110_38 = manager.audio:GetVoiceLength("story_v_out_122012", "122012032", "story_v_out_122012.awb") / 1000

					if var_110_38 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_30
					end

					if var_110_33.prefab_name ~= "" and arg_107_1.actors_[var_110_33.prefab_name] ~= nil then
						local var_110_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_33.prefab_name].transform, "story_v_out_122012", "122012032", "story_v_out_122012.awb")

						arg_107_1:RecordAudio("122012032", var_110_39)
						arg_107_1:RecordAudio("122012032", var_110_39)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_122012", "122012032", "story_v_out_122012.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_122012", "122012032", "story_v_out_122012.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_40 = math.max(var_110_31, arg_107_1.talkMaxDuration)

			if var_110_30 <= arg_107_1.time_ and arg_107_1.time_ < var_110_30 + var_110_40 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_30) / var_110_40

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_30 + var_110_40 and arg_107_1.time_ < var_110_30 + var_110_40 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play122012033 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 122012033
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play122012034(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1184ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1184ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(0, 100, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1184ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, 100, 0)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1184ui_story"]
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1184ui_story == nil then
				arg_111_1.var_.characterEffect1184ui_story = var_114_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_11 = 0.200000002980232

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11

				if arg_111_1.var_.characterEffect1184ui_story then
					local var_114_13 = Mathf.Lerp(0, 0.5, var_114_12)

					arg_111_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1184ui_story.fillRatio = var_114_13
				end
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect1184ui_story then
				local var_114_14 = 0.5

				arg_111_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1184ui_story.fillRatio = var_114_14
			end

			local var_114_15 = 0
			local var_114_16 = 1.35

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_17 = arg_111_1:GetWordFromCfg(122012033)
				local var_114_18 = arg_111_1:FormatText(var_114_17.content)

				arg_111_1.text_.text = var_114_18

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_19 = 54
				local var_114_20 = utf8.len(var_114_18)
				local var_114_21 = var_114_19 <= 0 and var_114_16 or var_114_16 * (var_114_20 / var_114_19)

				if var_114_21 > 0 and var_114_16 < var_114_21 then
					arg_111_1.talkMaxDuration = var_114_21

					if var_114_21 + var_114_15 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_21 + var_114_15
					end
				end

				arg_111_1.text_.text = var_114_18
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_22 = math.max(var_114_16, arg_111_1.talkMaxDuration)

			if var_114_15 <= arg_111_1.time_ and arg_111_1.time_ < var_114_15 + var_114_22 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_15) / var_114_22

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_15 + var_114_22 and arg_111_1.time_ < var_114_15 + var_114_22 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play122012034 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 122012034
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play122012035(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				local var_118_2 = "play"
				local var_118_3 = "effect"

				arg_115_1:AudioAction(var_118_2, var_118_3, "se_story_122_01", "se_story_122_01_battleground_loop", "")
			end

			local var_118_4 = 0
			local var_118_5 = 1.2

			if var_118_4 < arg_115_1.time_ and arg_115_1.time_ <= var_118_4 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_6 = arg_115_1:GetWordFromCfg(122012034)
				local var_118_7 = arg_115_1:FormatText(var_118_6.content)

				arg_115_1.text_.text = var_118_7

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_8 = 48
				local var_118_9 = utf8.len(var_118_7)
				local var_118_10 = var_118_8 <= 0 and var_118_5 or var_118_5 * (var_118_9 / var_118_8)

				if var_118_10 > 0 and var_118_5 < var_118_10 then
					arg_115_1.talkMaxDuration = var_118_10

					if var_118_10 + var_118_4 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_10 + var_118_4
					end
				end

				arg_115_1.text_.text = var_118_7
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_11 = math.max(var_118_5, arg_115_1.talkMaxDuration)

			if var_118_4 <= arg_115_1.time_ and arg_115_1.time_ < var_118_4 + var_118_11 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_4) / var_118_11

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_4 + var_118_11 and arg_115_1.time_ < var_118_4 + var_118_11 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play122012035 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 122012035
		arg_119_1.duration_ = 5.7

		local var_119_0 = {
			ja = 5.7,
			ko = 4.566,
			zh = 4.566
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
				arg_119_0:Play122012036(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.525

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[379].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(122012035)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012035", "story_v_out_122012.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_122012", "122012035", "story_v_out_122012.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_122012", "122012035", "story_v_out_122012.awb")

						arg_119_1:RecordAudio("122012035", var_122_9)
						arg_119_1:RecordAudio("122012035", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_122012", "122012035", "story_v_out_122012.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_122012", "122012035", "story_v_out_122012.awb")
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
	Play122012036 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 122012036
		arg_123_1.duration_ = 1.999999999999

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play122012037(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1184ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1184ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, -0.97, -6)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1184ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["1184ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1184ui_story == nil then
				arg_123_1.var_.characterEffect1184ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect1184ui_story then
					arg_123_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect1184ui_story then
				arg_123_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_15 = 0
			local var_126_16 = 0.15

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[6].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(122012036)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 6
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_16 or var_126_16 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_16 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012036", "story_v_out_122012.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_122012", "122012036", "story_v_out_122012.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_122012", "122012036", "story_v_out_122012.awb")

						arg_123_1:RecordAudio("122012036", var_126_24)
						arg_123_1:RecordAudio("122012036", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_122012", "122012036", "story_v_out_122012.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_122012", "122012036", "story_v_out_122012.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_25 and arg_123_1.time_ < var_126_15 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play122012037 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 122012037
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play122012038(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1184ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1184ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, 100, 0)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1184ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, 100, 0)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1184ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1184ui_story == nil then
				arg_127_1.var_.characterEffect1184ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1184ui_story then
					local var_130_13 = Mathf.Lerp(0, 0.5, var_130_12)

					arg_127_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1184ui_story.fillRatio = var_130_13
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1184ui_story then
				local var_130_14 = 0.5

				arg_127_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1184ui_story.fillRatio = var_130_14
			end

			local var_130_15 = 0
			local var_130_16 = 1.75

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_17 = arg_127_1:GetWordFromCfg(122012037)
				local var_130_18 = arg_127_1:FormatText(var_130_17.content)

				arg_127_1.text_.text = var_130_18

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_19 = 70
				local var_130_20 = utf8.len(var_130_18)
				local var_130_21 = var_130_19 <= 0 and var_130_16 or var_130_16 * (var_130_20 / var_130_19)

				if var_130_21 > 0 and var_130_16 < var_130_21 then
					arg_127_1.talkMaxDuration = var_130_21

					if var_130_21 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_21 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_18
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_22 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_22 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_22

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_22 and arg_127_1.time_ < var_130_15 + var_130_22 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play122012038 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 122012038
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play122012039(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1.4

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_2 = arg_131_1:GetWordFromCfg(122012038)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 56
				local var_134_5 = utf8.len(var_134_3)
				local var_134_6 = var_134_4 <= 0 and var_134_1 or var_134_1 * (var_134_5 / var_134_4)

				if var_134_6 > 0 and var_134_1 < var_134_6 then
					arg_131_1.talkMaxDuration = var_134_6

					if var_134_6 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_6 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_3
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_7 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_7 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_7

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_7 and arg_131_1.time_ < var_134_0 + var_134_7 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play122012039 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 122012039
		arg_135_1.duration_ = 4.066

		local var_135_0 = {
			ja = 4.066,
			ko = 3.7,
			zh = 3.7
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
				arg_135_0:Play122012040(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "1072ui_story"

			if arg_135_1.actors_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(Asset.Load("Char/" .. var_138_0), arg_135_1.stage_.transform)

				var_138_1.name = var_138_0
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.actors_[var_138_0] = var_138_1

				local var_138_2 = var_138_1:GetComponentInChildren(typeof(CharacterEffect))

				var_138_2.enabled = true

				local var_138_3 = GameObjectTools.GetOrAddComponent(var_138_1, typeof(DynamicBoneHelper))

				if var_138_3 then
					var_138_3:EnableDynamicBone(false)
				end

				arg_135_1:ShowWeapon(var_138_2.transform, false)

				arg_135_1.var_[var_138_0 .. "Animator"] = var_138_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_135_1.var_[var_138_0 .. "Animator"].applyRootMotion = true
				arg_135_1.var_[var_138_0 .. "LipSync"] = var_138_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_138_4 = arg_135_1.actors_["1072ui_story"].transform
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.var_.moveOldPos1072ui_story = var_138_4.localPosition
			end

			local var_138_6 = 0.001

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6
				local var_138_8 = Vector3.New(-0.7, -0.71, -6)

				var_138_4.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1072ui_story, var_138_8, var_138_7)

				local var_138_9 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_9.x, var_138_9.y, var_138_9.z)

				local var_138_10 = var_138_4.localEulerAngles

				var_138_10.z = 0
				var_138_10.x = 0
				var_138_4.localEulerAngles = var_138_10
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 then
				var_138_4.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_138_11 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_11.x, var_138_11.y, var_138_11.z)

				local var_138_12 = var_138_4.localEulerAngles

				var_138_12.z = 0
				var_138_12.x = 0
				var_138_4.localEulerAngles = var_138_12
			end

			local var_138_13 = arg_135_1.actors_["1072ui_story"]
			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 and arg_135_1.var_.characterEffect1072ui_story == nil then
				arg_135_1.var_.characterEffect1072ui_story = var_138_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_15 = 0.200000002980232

			if var_138_14 <= arg_135_1.time_ and arg_135_1.time_ < var_138_14 + var_138_15 then
				local var_138_16 = (arg_135_1.time_ - var_138_14) / var_138_15

				if arg_135_1.var_.characterEffect1072ui_story then
					arg_135_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_14 + var_138_15 and arg_135_1.time_ < var_138_14 + var_138_15 + arg_138_0 and arg_135_1.var_.characterEffect1072ui_story then
				arg_135_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_138_17 = 0

			if var_138_17 < arg_135_1.time_ and arg_135_1.time_ <= var_138_17 + arg_138_0 then
				arg_135_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_138_18 = 0

			if var_138_18 < arg_135_1.time_ and arg_135_1.time_ <= var_138_18 + arg_138_0 then
				arg_135_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_138_19 = arg_135_1.actors_["1071ui_story"].transform
			local var_138_20 = 0

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				arg_135_1.var_.moveOldPos1071ui_story = var_138_19.localPosition
			end

			local var_138_21 = 0.001

			if var_138_20 <= arg_135_1.time_ and arg_135_1.time_ < var_138_20 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_20) / var_138_21
				local var_138_23 = Vector3.New(0.7, -1.05, -6.2)

				var_138_19.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1071ui_story, var_138_23, var_138_22)

				local var_138_24 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_24.x, var_138_24.y, var_138_24.z)

				local var_138_25 = var_138_19.localEulerAngles

				var_138_25.z = 0
				var_138_25.x = 0
				var_138_19.localEulerAngles = var_138_25
			end

			if arg_135_1.time_ >= var_138_20 + var_138_21 and arg_135_1.time_ < var_138_20 + var_138_21 + arg_138_0 then
				var_138_19.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_138_26 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_26.x, var_138_26.y, var_138_26.z)

				local var_138_27 = var_138_19.localEulerAngles

				var_138_27.z = 0
				var_138_27.x = 0
				var_138_19.localEulerAngles = var_138_27
			end

			local var_138_28 = arg_135_1.actors_["1071ui_story"]
			local var_138_29 = 0

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 and arg_135_1.var_.characterEffect1071ui_story == nil then
				arg_135_1.var_.characterEffect1071ui_story = var_138_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_30 = 0.200000002980232

			if var_138_29 <= arg_135_1.time_ and arg_135_1.time_ < var_138_29 + var_138_30 then
				local var_138_31 = (arg_135_1.time_ - var_138_29) / var_138_30

				if arg_135_1.var_.characterEffect1071ui_story then
					local var_138_32 = Mathf.Lerp(0, 0.5, var_138_31)

					arg_135_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1071ui_story.fillRatio = var_138_32
				end
			end

			if arg_135_1.time_ >= var_138_29 + var_138_30 and arg_135_1.time_ < var_138_29 + var_138_30 + arg_138_0 and arg_135_1.var_.characterEffect1071ui_story then
				local var_138_33 = 0.5

				arg_135_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1071ui_story.fillRatio = var_138_33
			end

			local var_138_34 = 0
			local var_138_35 = 0.375

			if var_138_34 < arg_135_1.time_ and arg_135_1.time_ <= var_138_34 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_36 = arg_135_1:FormatText(StoryNameCfg[379].name)

				arg_135_1.leftNameTxt_.text = var_138_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_37 = arg_135_1:GetWordFromCfg(122012039)
				local var_138_38 = arg_135_1:FormatText(var_138_37.content)

				arg_135_1.text_.text = var_138_38

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_39 = 15
				local var_138_40 = utf8.len(var_138_38)
				local var_138_41 = var_138_39 <= 0 and var_138_35 or var_138_35 * (var_138_40 / var_138_39)

				if var_138_41 > 0 and var_138_35 < var_138_41 then
					arg_135_1.talkMaxDuration = var_138_41

					if var_138_41 + var_138_34 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_41 + var_138_34
					end
				end

				arg_135_1.text_.text = var_138_38
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012039", "story_v_out_122012.awb") ~= 0 then
					local var_138_42 = manager.audio:GetVoiceLength("story_v_out_122012", "122012039", "story_v_out_122012.awb") / 1000

					if var_138_42 + var_138_34 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_42 + var_138_34
					end

					if var_138_37.prefab_name ~= "" and arg_135_1.actors_[var_138_37.prefab_name] ~= nil then
						local var_138_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_37.prefab_name].transform, "story_v_out_122012", "122012039", "story_v_out_122012.awb")

						arg_135_1:RecordAudio("122012039", var_138_43)
						arg_135_1:RecordAudio("122012039", var_138_43)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_122012", "122012039", "story_v_out_122012.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_122012", "122012039", "story_v_out_122012.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_44 = math.max(var_138_35, arg_135_1.talkMaxDuration)

			if var_138_34 <= arg_135_1.time_ and arg_135_1.time_ < var_138_34 + var_138_44 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_34) / var_138_44

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_34 + var_138_44 and arg_135_1.time_ < var_138_34 + var_138_44 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play122012040 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 122012040
		arg_139_1.duration_ = 8.1

		local var_139_0 = {
			ja = 8.1,
			ko = 4.533,
			zh = 4.533
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
				arg_139_0:Play122012041(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1071ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1071ui_story == nil then
				arg_139_1.var_.characterEffect1071ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1071ui_story then
					arg_139_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1071ui_story then
				arg_139_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_142_4 = 0

			if var_142_4 < arg_139_1.time_ and arg_139_1.time_ <= var_142_4 + arg_142_0 then
				arg_139_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_142_5 = arg_139_1.actors_["1072ui_story"]
			local var_142_6 = 0

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect1072ui_story == nil then
				arg_139_1.var_.characterEffect1072ui_story = var_142_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_7 = 0.200000002980232

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_7 then
				local var_142_8 = (arg_139_1.time_ - var_142_6) / var_142_7

				if arg_139_1.var_.characterEffect1072ui_story then
					local var_142_9 = Mathf.Lerp(0, 0.5, var_142_8)

					arg_139_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1072ui_story.fillRatio = var_142_9
				end
			end

			if arg_139_1.time_ >= var_142_6 + var_142_7 and arg_139_1.time_ < var_142_6 + var_142_7 + arg_142_0 and arg_139_1.var_.characterEffect1072ui_story then
				local var_142_10 = 0.5

				arg_139_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1072ui_story.fillRatio = var_142_10
			end

			local var_142_11 = 0
			local var_142_12 = 0.6

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_13 = arg_139_1:FormatText(StoryNameCfg[384].name)

				arg_139_1.leftNameTxt_.text = var_142_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_14 = arg_139_1:GetWordFromCfg(122012040)
				local var_142_15 = arg_139_1:FormatText(var_142_14.content)

				arg_139_1.text_.text = var_142_15

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_16 = 24
				local var_142_17 = utf8.len(var_142_15)
				local var_142_18 = var_142_16 <= 0 and var_142_12 or var_142_12 * (var_142_17 / var_142_16)

				if var_142_18 > 0 and var_142_12 < var_142_18 then
					arg_139_1.talkMaxDuration = var_142_18

					if var_142_18 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_18 + var_142_11
					end
				end

				arg_139_1.text_.text = var_142_15
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012040", "story_v_out_122012.awb") ~= 0 then
					local var_142_19 = manager.audio:GetVoiceLength("story_v_out_122012", "122012040", "story_v_out_122012.awb") / 1000

					if var_142_19 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_11
					end

					if var_142_14.prefab_name ~= "" and arg_139_1.actors_[var_142_14.prefab_name] ~= nil then
						local var_142_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_14.prefab_name].transform, "story_v_out_122012", "122012040", "story_v_out_122012.awb")

						arg_139_1:RecordAudio("122012040", var_142_20)
						arg_139_1:RecordAudio("122012040", var_142_20)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_122012", "122012040", "story_v_out_122012.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_122012", "122012040", "story_v_out_122012.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_21 = math.max(var_142_12, arg_139_1.talkMaxDuration)

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_21 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_11) / var_142_21

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_11 + var_142_21 and arg_139_1.time_ < var_142_11 + var_142_21 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play122012041 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 122012041
		arg_143_1.duration_ = 8.6

		local var_143_0 = {
			ja = 8.6,
			ko = 5.966,
			zh = 5.966
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
				arg_143_0:Play122012042(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1072ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1072ui_story == nil then
				arg_143_1.var_.characterEffect1072ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1072ui_story then
					arg_143_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1072ui_story then
				arg_143_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_146_4 = 0

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 then
				arg_143_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_146_6 = arg_143_1.actors_["1071ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect1071ui_story == nil then
				arg_143_1.var_.characterEffect1071ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.200000002980232

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect1071ui_story then
					local var_146_10 = Mathf.Lerp(0, 0.5, var_146_9)

					arg_143_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1071ui_story.fillRatio = var_146_10
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect1071ui_story then
				local var_146_11 = 0.5

				arg_143_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1071ui_story.fillRatio = var_146_11
			end

			local var_146_12 = 0

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_146_13 = 0
			local var_146_14 = 0.75

			if var_146_13 < arg_143_1.time_ and arg_143_1.time_ <= var_146_13 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_15 = arg_143_1:FormatText(StoryNameCfg[379].name)

				arg_143_1.leftNameTxt_.text = var_146_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_16 = arg_143_1:GetWordFromCfg(122012041)
				local var_146_17 = arg_143_1:FormatText(var_146_16.content)

				arg_143_1.text_.text = var_146_17

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_18 = 30
				local var_146_19 = utf8.len(var_146_17)
				local var_146_20 = var_146_18 <= 0 and var_146_14 or var_146_14 * (var_146_19 / var_146_18)

				if var_146_20 > 0 and var_146_14 < var_146_20 then
					arg_143_1.talkMaxDuration = var_146_20

					if var_146_20 + var_146_13 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_13
					end
				end

				arg_143_1.text_.text = var_146_17
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012041", "story_v_out_122012.awb") ~= 0 then
					local var_146_21 = manager.audio:GetVoiceLength("story_v_out_122012", "122012041", "story_v_out_122012.awb") / 1000

					if var_146_21 + var_146_13 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_21 + var_146_13
					end

					if var_146_16.prefab_name ~= "" and arg_143_1.actors_[var_146_16.prefab_name] ~= nil then
						local var_146_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_16.prefab_name].transform, "story_v_out_122012", "122012041", "story_v_out_122012.awb")

						arg_143_1:RecordAudio("122012041", var_146_22)
						arg_143_1:RecordAudio("122012041", var_146_22)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_122012", "122012041", "story_v_out_122012.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_122012", "122012041", "story_v_out_122012.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_23 = math.max(var_146_14, arg_143_1.talkMaxDuration)

			if var_146_13 <= arg_143_1.time_ and arg_143_1.time_ < var_146_13 + var_146_23 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_13) / var_146_23

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_13 + var_146_23 and arg_143_1.time_ < var_146_13 + var_146_23 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play122012042 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 122012042
		arg_147_1.duration_ = 6.8

		local var_147_0 = {
			ja = 6.4,
			ko = 6.8,
			zh = 6.8
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
				arg_147_0:Play122012043(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1071ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1071ui_story == nil then
				arg_147_1.var_.characterEffect1071ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1071ui_story then
					arg_147_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1071ui_story then
				arg_147_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_150_4 = arg_147_1.actors_["1072ui_story"]
			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 and arg_147_1.var_.characterEffect1072ui_story == nil then
				arg_147_1.var_.characterEffect1072ui_story = var_150_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_6 = 0.200000002980232

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6

				if arg_147_1.var_.characterEffect1072ui_story then
					local var_150_8 = Mathf.Lerp(0, 0.5, var_150_7)

					arg_147_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1072ui_story.fillRatio = var_150_8
				end
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 and arg_147_1.var_.characterEffect1072ui_story then
				local var_150_9 = 0.5

				arg_147_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1072ui_story.fillRatio = var_150_9
			end

			local var_150_10 = 0
			local var_150_11 = 0.75

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_12 = arg_147_1:FormatText(StoryNameCfg[384].name)

				arg_147_1.leftNameTxt_.text = var_150_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_13 = arg_147_1:GetWordFromCfg(122012042)
				local var_150_14 = arg_147_1:FormatText(var_150_13.content)

				arg_147_1.text_.text = var_150_14

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_15 = 30
				local var_150_16 = utf8.len(var_150_14)
				local var_150_17 = var_150_15 <= 0 and var_150_11 or var_150_11 * (var_150_16 / var_150_15)

				if var_150_17 > 0 and var_150_11 < var_150_17 then
					arg_147_1.talkMaxDuration = var_150_17

					if var_150_17 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_17 + var_150_10
					end
				end

				arg_147_1.text_.text = var_150_14
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012042", "story_v_out_122012.awb") ~= 0 then
					local var_150_18 = manager.audio:GetVoiceLength("story_v_out_122012", "122012042", "story_v_out_122012.awb") / 1000

					if var_150_18 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_10
					end

					if var_150_13.prefab_name ~= "" and arg_147_1.actors_[var_150_13.prefab_name] ~= nil then
						local var_150_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_13.prefab_name].transform, "story_v_out_122012", "122012042", "story_v_out_122012.awb")

						arg_147_1:RecordAudio("122012042", var_150_19)
						arg_147_1:RecordAudio("122012042", var_150_19)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_122012", "122012042", "story_v_out_122012.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_122012", "122012042", "story_v_out_122012.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_20 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_20 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_10) / var_150_20

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_10 + var_150_20 and arg_147_1.time_ < var_150_10 + var_150_20 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play122012043 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 122012043
		arg_151_1.duration_ = 8.8

		local var_151_0 = {
			ja = 8.8,
			ko = 7.6,
			zh = 7.6
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
				arg_151_0:Play122012044(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1072ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1072ui_story == nil then
				arg_151_1.var_.characterEffect1072ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1072ui_story then
					arg_151_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1072ui_story then
				arg_151_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_154_4 = 0

			if var_154_4 < arg_151_1.time_ and arg_151_1.time_ <= var_154_4 + arg_154_0 then
				arg_151_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_154_5 = arg_151_1.actors_["1071ui_story"]
			local var_154_6 = 0

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1071ui_story == nil then
				arg_151_1.var_.characterEffect1071ui_story = var_154_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_7 = 0.200000002980232

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_7 then
				local var_154_8 = (arg_151_1.time_ - var_154_6) / var_154_7

				if arg_151_1.var_.characterEffect1071ui_story then
					local var_154_9 = Mathf.Lerp(0, 0.5, var_154_8)

					arg_151_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1071ui_story.fillRatio = var_154_9
				end
			end

			if arg_151_1.time_ >= var_154_6 + var_154_7 and arg_151_1.time_ < var_154_6 + var_154_7 + arg_154_0 and arg_151_1.var_.characterEffect1071ui_story then
				local var_154_10 = 0.5

				arg_151_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1071ui_story.fillRatio = var_154_10
			end

			local var_154_11 = 0
			local var_154_12 = 0.5

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_13 = arg_151_1:FormatText(StoryNameCfg[379].name)

				arg_151_1.leftNameTxt_.text = var_154_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_14 = arg_151_1:GetWordFromCfg(122012043)
				local var_154_15 = arg_151_1:FormatText(var_154_14.content)

				arg_151_1.text_.text = var_154_15

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_16 = 20
				local var_154_17 = utf8.len(var_154_15)
				local var_154_18 = var_154_16 <= 0 and var_154_12 or var_154_12 * (var_154_17 / var_154_16)

				if var_154_18 > 0 and var_154_12 < var_154_18 then
					arg_151_1.talkMaxDuration = var_154_18

					if var_154_18 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_11
					end
				end

				arg_151_1.text_.text = var_154_15
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012043", "story_v_out_122012.awb") ~= 0 then
					local var_154_19 = manager.audio:GetVoiceLength("story_v_out_122012", "122012043", "story_v_out_122012.awb") / 1000

					if var_154_19 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_11
					end

					if var_154_14.prefab_name ~= "" and arg_151_1.actors_[var_154_14.prefab_name] ~= nil then
						local var_154_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_14.prefab_name].transform, "story_v_out_122012", "122012043", "story_v_out_122012.awb")

						arg_151_1:RecordAudio("122012043", var_154_20)
						arg_151_1:RecordAudio("122012043", var_154_20)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_122012", "122012043", "story_v_out_122012.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_122012", "122012043", "story_v_out_122012.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_21 = math.max(var_154_12, arg_151_1.talkMaxDuration)

			if var_154_11 <= arg_151_1.time_ and arg_151_1.time_ < var_154_11 + var_154_21 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_11) / var_154_21

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_11 + var_154_21 and arg_151_1.time_ < var_154_11 + var_154_21 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play122012044 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 122012044
		arg_155_1.duration_ = 7.966

		local var_155_0 = {
			ja = 7.966,
			ko = 7.3,
			zh = 7.3
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
				arg_155_0:Play122012045(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1072ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1072ui_story == nil then
				arg_155_1.var_.characterEffect1072ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1072ui_story then
					arg_155_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1072ui_story then
				arg_155_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_158_4 = 0

			if var_158_4 < arg_155_1.time_ and arg_155_1.time_ <= var_158_4 + arg_158_0 then
				arg_155_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072actionlink/1072action465")
			end

			local var_158_5 = 0

			if var_158_5 < arg_155_1.time_ and arg_155_1.time_ <= var_158_5 + arg_158_0 then
				arg_155_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_158_6 = 0
			local var_158_7 = 1

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				local var_158_8 = "stop"
				local var_158_9 = "effect"

				arg_155_1:AudioAction(var_158_8, var_158_9, "se_story_122_01", "se_story_122_01_battleground_loop", "")
			end

			local var_158_10 = 0
			local var_158_11 = 0.725

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_12 = arg_155_1:FormatText(StoryNameCfg[379].name)

				arg_155_1.leftNameTxt_.text = var_158_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_13 = arg_155_1:GetWordFromCfg(122012044)
				local var_158_14 = arg_155_1:FormatText(var_158_13.content)

				arg_155_1.text_.text = var_158_14

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_15 = 29
				local var_158_16 = utf8.len(var_158_14)
				local var_158_17 = var_158_15 <= 0 and var_158_11 or var_158_11 * (var_158_16 / var_158_15)

				if var_158_17 > 0 and var_158_11 < var_158_17 then
					arg_155_1.talkMaxDuration = var_158_17

					if var_158_17 + var_158_10 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_17 + var_158_10
					end
				end

				arg_155_1.text_.text = var_158_14
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012044", "story_v_out_122012.awb") ~= 0 then
					local var_158_18 = manager.audio:GetVoiceLength("story_v_out_122012", "122012044", "story_v_out_122012.awb") / 1000

					if var_158_18 + var_158_10 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_18 + var_158_10
					end

					if var_158_13.prefab_name ~= "" and arg_155_1.actors_[var_158_13.prefab_name] ~= nil then
						local var_158_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_13.prefab_name].transform, "story_v_out_122012", "122012044", "story_v_out_122012.awb")

						arg_155_1:RecordAudio("122012044", var_158_19)
						arg_155_1:RecordAudio("122012044", var_158_19)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_122012", "122012044", "story_v_out_122012.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_122012", "122012044", "story_v_out_122012.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_20 = math.max(var_158_11, arg_155_1.talkMaxDuration)

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_20 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_10) / var_158_20

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_10 + var_158_20 and arg_155_1.time_ < var_158_10 + var_158_20 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play122012045 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 122012045
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play122012046(arg_159_1)
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

			local var_162_15 = arg_159_1.actors_["1071ui_story"].transform
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 then
				arg_159_1.var_.moveOldPos1071ui_story = var_162_15.localPosition
			end

			local var_162_17 = 0.001

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17
				local var_162_19 = Vector3.New(0, 100, 0)

				var_162_15.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1071ui_story, var_162_19, var_162_18)

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

			local var_162_24 = arg_159_1.actors_["1071ui_story"]
			local var_162_25 = 0

			if var_162_25 < arg_159_1.time_ and arg_159_1.time_ <= var_162_25 + arg_162_0 and arg_159_1.var_.characterEffect1071ui_story == nil then
				arg_159_1.var_.characterEffect1071ui_story = var_162_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_26 = 0.200000002980232

			if var_162_25 <= arg_159_1.time_ and arg_159_1.time_ < var_162_25 + var_162_26 then
				local var_162_27 = (arg_159_1.time_ - var_162_25) / var_162_26

				if arg_159_1.var_.characterEffect1071ui_story then
					local var_162_28 = Mathf.Lerp(0, 0.5, var_162_27)

					arg_159_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1071ui_story.fillRatio = var_162_28
				end
			end

			if arg_159_1.time_ >= var_162_25 + var_162_26 and arg_159_1.time_ < var_162_25 + var_162_26 + arg_162_0 and arg_159_1.var_.characterEffect1071ui_story then
				local var_162_29 = 0.5

				arg_159_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1071ui_story.fillRatio = var_162_29
			end

			local var_162_30 = 0
			local var_162_31 = 0.85

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

				local var_162_32 = arg_159_1:GetWordFromCfg(122012045)
				local var_162_33 = arg_159_1:FormatText(var_162_32.content)

				arg_159_1.text_.text = var_162_33

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_34 = 34
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
	Play122012046 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 122012046
		arg_163_1.duration_ = 3.566

		local var_163_0 = {
			ja = 3.566,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_163_0:Play122012047(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1072ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1072ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(-0.7, -0.71, -6)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1072ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1072ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect1072ui_story == nil then
				arg_163_1.var_.characterEffect1072ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect1072ui_story then
					arg_163_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect1072ui_story then
				arg_163_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_166_13 = 0

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				arg_163_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_166_15 = arg_163_1.actors_["1071ui_story"].transform
			local var_166_16 = 0

			if var_166_16 < arg_163_1.time_ and arg_163_1.time_ <= var_166_16 + arg_166_0 then
				arg_163_1.var_.moveOldPos1071ui_story = var_166_15.localPosition
			end

			local var_166_17 = 0.001

			if var_166_16 <= arg_163_1.time_ and arg_163_1.time_ < var_166_16 + var_166_17 then
				local var_166_18 = (arg_163_1.time_ - var_166_16) / var_166_17
				local var_166_19 = Vector3.New(0.7, -1.05, -6.2)

				var_166_15.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1071ui_story, var_166_19, var_166_18)

				local var_166_20 = manager.ui.mainCamera.transform.position - var_166_15.position

				var_166_15.forward = Vector3.New(var_166_20.x, var_166_20.y, var_166_20.z)

				local var_166_21 = var_166_15.localEulerAngles

				var_166_21.z = 0
				var_166_21.x = 0
				var_166_15.localEulerAngles = var_166_21
			end

			if arg_163_1.time_ >= var_166_16 + var_166_17 and arg_163_1.time_ < var_166_16 + var_166_17 + arg_166_0 then
				var_166_15.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_166_22 = manager.ui.mainCamera.transform.position - var_166_15.position

				var_166_15.forward = Vector3.New(var_166_22.x, var_166_22.y, var_166_22.z)

				local var_166_23 = var_166_15.localEulerAngles

				var_166_23.z = 0
				var_166_23.x = 0
				var_166_15.localEulerAngles = var_166_23
			end

			local var_166_24 = arg_163_1.actors_["1071ui_story"]
			local var_166_25 = 0

			if var_166_25 < arg_163_1.time_ and arg_163_1.time_ <= var_166_25 + arg_166_0 and arg_163_1.var_.characterEffect1071ui_story == nil then
				arg_163_1.var_.characterEffect1071ui_story = var_166_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_26 = 0.200000002980232

			if var_166_25 <= arg_163_1.time_ and arg_163_1.time_ < var_166_25 + var_166_26 then
				local var_166_27 = (arg_163_1.time_ - var_166_25) / var_166_26

				if arg_163_1.var_.characterEffect1071ui_story then
					local var_166_28 = Mathf.Lerp(0, 0.5, var_166_27)

					arg_163_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1071ui_story.fillRatio = var_166_28
				end
			end

			if arg_163_1.time_ >= var_166_25 + var_166_26 and arg_163_1.time_ < var_166_25 + var_166_26 + arg_166_0 and arg_163_1.var_.characterEffect1071ui_story then
				local var_166_29 = 0.5

				arg_163_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1071ui_story.fillRatio = var_166_29
			end

			local var_166_30 = 0
			local var_166_31 = 0.25

			if var_166_30 < arg_163_1.time_ and arg_163_1.time_ <= var_166_30 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_32 = arg_163_1:FormatText(StoryNameCfg[379].name)

				arg_163_1.leftNameTxt_.text = var_166_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_33 = arg_163_1:GetWordFromCfg(122012046)
				local var_166_34 = arg_163_1:FormatText(var_166_33.content)

				arg_163_1.text_.text = var_166_34

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_35 = 10
				local var_166_36 = utf8.len(var_166_34)
				local var_166_37 = var_166_35 <= 0 and var_166_31 or var_166_31 * (var_166_36 / var_166_35)

				if var_166_37 > 0 and var_166_31 < var_166_37 then
					arg_163_1.talkMaxDuration = var_166_37

					if var_166_37 + var_166_30 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_37 + var_166_30
					end
				end

				arg_163_1.text_.text = var_166_34
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012046", "story_v_out_122012.awb") ~= 0 then
					local var_166_38 = manager.audio:GetVoiceLength("story_v_out_122012", "122012046", "story_v_out_122012.awb") / 1000

					if var_166_38 + var_166_30 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_38 + var_166_30
					end

					if var_166_33.prefab_name ~= "" and arg_163_1.actors_[var_166_33.prefab_name] ~= nil then
						local var_166_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_33.prefab_name].transform, "story_v_out_122012", "122012046", "story_v_out_122012.awb")

						arg_163_1:RecordAudio("122012046", var_166_39)
						arg_163_1:RecordAudio("122012046", var_166_39)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_122012", "122012046", "story_v_out_122012.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_122012", "122012046", "story_v_out_122012.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_40 = math.max(var_166_31, arg_163_1.talkMaxDuration)

			if var_166_30 <= arg_163_1.time_ and arg_163_1.time_ < var_166_30 + var_166_40 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_30) / var_166_40

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_30 + var_166_40 and arg_163_1.time_ < var_166_30 + var_166_40 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play122012047 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 122012047
		arg_167_1.duration_ = 7.4

		local var_167_0 = {
			ja = 7.4,
			ko = 5.7,
			zh = 5.7
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
				arg_167_0:Play122012048(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1071ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1071ui_story == nil then
				arg_167_1.var_.characterEffect1071ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1071ui_story then
					arg_167_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1071ui_story then
				arg_167_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_170_4 = arg_167_1.actors_["1072ui_story"]
			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 and arg_167_1.var_.characterEffect1072ui_story == nil then
				arg_167_1.var_.characterEffect1072ui_story = var_170_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_6 = 0.200000002980232

			if var_170_5 <= arg_167_1.time_ and arg_167_1.time_ < var_170_5 + var_170_6 then
				local var_170_7 = (arg_167_1.time_ - var_170_5) / var_170_6

				if arg_167_1.var_.characterEffect1072ui_story then
					local var_170_8 = Mathf.Lerp(0, 0.5, var_170_7)

					arg_167_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1072ui_story.fillRatio = var_170_8
				end
			end

			if arg_167_1.time_ >= var_170_5 + var_170_6 and arg_167_1.time_ < var_170_5 + var_170_6 + arg_170_0 and arg_167_1.var_.characterEffect1072ui_story then
				local var_170_9 = 0.5

				arg_167_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1072ui_story.fillRatio = var_170_9
			end

			local var_170_10 = 0
			local var_170_11 = 0.875

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_12 = arg_167_1:FormatText(StoryNameCfg[384].name)

				arg_167_1.leftNameTxt_.text = var_170_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_13 = arg_167_1:GetWordFromCfg(122012047)
				local var_170_14 = arg_167_1:FormatText(var_170_13.content)

				arg_167_1.text_.text = var_170_14

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_15 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012047", "story_v_out_122012.awb") ~= 0 then
					local var_170_18 = manager.audio:GetVoiceLength("story_v_out_122012", "122012047", "story_v_out_122012.awb") / 1000

					if var_170_18 + var_170_10 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_18 + var_170_10
					end

					if var_170_13.prefab_name ~= "" and arg_167_1.actors_[var_170_13.prefab_name] ~= nil then
						local var_170_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_13.prefab_name].transform, "story_v_out_122012", "122012047", "story_v_out_122012.awb")

						arg_167_1:RecordAudio("122012047", var_170_19)
						arg_167_1:RecordAudio("122012047", var_170_19)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_122012", "122012047", "story_v_out_122012.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_122012", "122012047", "story_v_out_122012.awb")
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
	Play122012048 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 122012048
		arg_171_1.duration_ = 3.3

		local var_171_0 = {
			ja = 3.3,
			ko = 2.366,
			zh = 2.366
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
				arg_171_0:Play122012049(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1072ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1072ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, 100, 0)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1072ui_story, var_174_4, var_174_3)

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

			local var_174_9 = arg_171_1.actors_["1072ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect1072ui_story == nil then
				arg_171_1.var_.characterEffect1072ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect1072ui_story then
					local var_174_13 = Mathf.Lerp(0, 0.5, var_174_12)

					arg_171_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1072ui_story.fillRatio = var_174_13
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect1072ui_story then
				local var_174_14 = 0.5

				arg_171_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1072ui_story.fillRatio = var_174_14
			end

			local var_174_15 = arg_171_1.actors_["1184ui_story"].transform
			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.var_.moveOldPos1184ui_story = var_174_15.localPosition
			end

			local var_174_17 = 0.001

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Vector3.New(-0.7, -0.97, -6)

				var_174_15.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1184ui_story, var_174_19, var_174_18)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_15.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_15.localEulerAngles = var_174_21
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				var_174_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_174_22 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_22.x, var_174_22.y, var_174_22.z)

				local var_174_23 = var_174_15.localEulerAngles

				var_174_23.z = 0
				var_174_23.x = 0
				var_174_15.localEulerAngles = var_174_23
			end

			local var_174_24 = arg_171_1.actors_["1184ui_story"]
			local var_174_25 = 0

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 and arg_171_1.var_.characterEffect1184ui_story == nil then
				arg_171_1.var_.characterEffect1184ui_story = var_174_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_26 = 0.200000002980232

			if var_174_25 <= arg_171_1.time_ and arg_171_1.time_ < var_174_25 + var_174_26 then
				local var_174_27 = (arg_171_1.time_ - var_174_25) / var_174_26

				if arg_171_1.var_.characterEffect1184ui_story then
					arg_171_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_25 + var_174_26 and arg_171_1.time_ < var_174_25 + var_174_26 + arg_174_0 and arg_171_1.var_.characterEffect1184ui_story then
				arg_171_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_174_28 = 0

			if var_174_28 < arg_171_1.time_ and arg_171_1.time_ <= var_174_28 + arg_174_0 then
				arg_171_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_174_29 = 0

			if var_174_29 < arg_171_1.time_ and arg_171_1.time_ <= var_174_29 + arg_174_0 then
				arg_171_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_30 = arg_171_1.actors_["1071ui_story"]
			local var_174_31 = 0

			if var_174_31 < arg_171_1.time_ and arg_171_1.time_ <= var_174_31 + arg_174_0 and arg_171_1.var_.characterEffect1071ui_story == nil then
				arg_171_1.var_.characterEffect1071ui_story = var_174_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_32 = 0.200000002980232

			if var_174_31 <= arg_171_1.time_ and arg_171_1.time_ < var_174_31 + var_174_32 then
				local var_174_33 = (arg_171_1.time_ - var_174_31) / var_174_32

				if arg_171_1.var_.characterEffect1071ui_story then
					local var_174_34 = Mathf.Lerp(0, 0.5, var_174_33)

					arg_171_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1071ui_story.fillRatio = var_174_34
				end
			end

			if arg_171_1.time_ >= var_174_31 + var_174_32 and arg_171_1.time_ < var_174_31 + var_174_32 + arg_174_0 and arg_171_1.var_.characterEffect1071ui_story then
				local var_174_35 = 0.5

				arg_171_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1071ui_story.fillRatio = var_174_35
			end

			local var_174_36 = 0
			local var_174_37 = 0.3

			if var_174_36 < arg_171_1.time_ and arg_171_1.time_ <= var_174_36 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_38 = arg_171_1:FormatText(StoryNameCfg[6].name)

				arg_171_1.leftNameTxt_.text = var_174_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_39 = arg_171_1:GetWordFromCfg(122012048)
				local var_174_40 = arg_171_1:FormatText(var_174_39.content)

				arg_171_1.text_.text = var_174_40

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_41 = 12
				local var_174_42 = utf8.len(var_174_40)
				local var_174_43 = var_174_41 <= 0 and var_174_37 or var_174_37 * (var_174_42 / var_174_41)

				if var_174_43 > 0 and var_174_37 < var_174_43 then
					arg_171_1.talkMaxDuration = var_174_43

					if var_174_43 + var_174_36 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_43 + var_174_36
					end
				end

				arg_171_1.text_.text = var_174_40
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012048", "story_v_out_122012.awb") ~= 0 then
					local var_174_44 = manager.audio:GetVoiceLength("story_v_out_122012", "122012048", "story_v_out_122012.awb") / 1000

					if var_174_44 + var_174_36 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_44 + var_174_36
					end

					if var_174_39.prefab_name ~= "" and arg_171_1.actors_[var_174_39.prefab_name] ~= nil then
						local var_174_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_39.prefab_name].transform, "story_v_out_122012", "122012048", "story_v_out_122012.awb")

						arg_171_1:RecordAudio("122012048", var_174_45)
						arg_171_1:RecordAudio("122012048", var_174_45)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_122012", "122012048", "story_v_out_122012.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_122012", "122012048", "story_v_out_122012.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_46 = math.max(var_174_37, arg_171_1.talkMaxDuration)

			if var_174_36 <= arg_171_1.time_ and arg_171_1.time_ < var_174_36 + var_174_46 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_36) / var_174_46

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_36 + var_174_46 and arg_171_1.time_ < var_174_36 + var_174_46 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play122012049 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 122012049
		arg_175_1.duration_ = 11.166

		local var_175_0 = {
			ja = 11.166,
			ko = 9.633,
			zh = 9.633
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
				arg_175_0:Play122012050(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1071ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1071ui_story == nil then
				arg_175_1.var_.characterEffect1071ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1071ui_story then
					arg_175_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1071ui_story then
				arg_175_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_178_4 = 0

			if var_178_4 < arg_175_1.time_ and arg_175_1.time_ <= var_178_4 + arg_178_0 then
				arg_175_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_178_5 = arg_175_1.actors_["1184ui_story"]
			local var_178_6 = 0

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 and arg_175_1.var_.characterEffect1184ui_story == nil then
				arg_175_1.var_.characterEffect1184ui_story = var_178_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_7 = 0.200000002980232

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_7 then
				local var_178_8 = (arg_175_1.time_ - var_178_6) / var_178_7

				if arg_175_1.var_.characterEffect1184ui_story then
					local var_178_9 = Mathf.Lerp(0, 0.5, var_178_8)

					arg_175_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1184ui_story.fillRatio = var_178_9
				end
			end

			if arg_175_1.time_ >= var_178_6 + var_178_7 and arg_175_1.time_ < var_178_6 + var_178_7 + arg_178_0 and arg_175_1.var_.characterEffect1184ui_story then
				local var_178_10 = 0.5

				arg_175_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1184ui_story.fillRatio = var_178_10
			end

			local var_178_11 = 0
			local var_178_12 = 1.175

			if var_178_11 < arg_175_1.time_ and arg_175_1.time_ <= var_178_11 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_13 = arg_175_1:FormatText(StoryNameCfg[384].name)

				arg_175_1.leftNameTxt_.text = var_178_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_14 = arg_175_1:GetWordFromCfg(122012049)
				local var_178_15 = arg_175_1:FormatText(var_178_14.content)

				arg_175_1.text_.text = var_178_15

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_16 = 47
				local var_178_17 = utf8.len(var_178_15)
				local var_178_18 = var_178_16 <= 0 and var_178_12 or var_178_12 * (var_178_17 / var_178_16)

				if var_178_18 > 0 and var_178_12 < var_178_18 then
					arg_175_1.talkMaxDuration = var_178_18

					if var_178_18 + var_178_11 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_18 + var_178_11
					end
				end

				arg_175_1.text_.text = var_178_15
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012049", "story_v_out_122012.awb") ~= 0 then
					local var_178_19 = manager.audio:GetVoiceLength("story_v_out_122012", "122012049", "story_v_out_122012.awb") / 1000

					if var_178_19 + var_178_11 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_19 + var_178_11
					end

					if var_178_14.prefab_name ~= "" and arg_175_1.actors_[var_178_14.prefab_name] ~= nil then
						local var_178_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_14.prefab_name].transform, "story_v_out_122012", "122012049", "story_v_out_122012.awb")

						arg_175_1:RecordAudio("122012049", var_178_20)
						arg_175_1:RecordAudio("122012049", var_178_20)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_122012", "122012049", "story_v_out_122012.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_122012", "122012049", "story_v_out_122012.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_21 = math.max(var_178_12, arg_175_1.talkMaxDuration)

			if var_178_11 <= arg_175_1.time_ and arg_175_1.time_ < var_178_11 + var_178_21 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_11) / var_178_21

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_11 + var_178_21 and arg_175_1.time_ < var_178_11 + var_178_21 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play122012050 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 122012050
		arg_179_1.duration_ = 7.866

		local var_179_0 = {
			ja = 7,
			ko = 7.866,
			zh = 7.866
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
				arg_179_0:Play122012051(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1184ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1184ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 100, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1184ui_story, var_182_4, var_182_3)

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

			local var_182_9 = arg_179_1.actors_["1184ui_story"]
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 and arg_179_1.var_.characterEffect1184ui_story == nil then
				arg_179_1.var_.characterEffect1184ui_story = var_182_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_11 = 0.200000002980232

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11

				if arg_179_1.var_.characterEffect1184ui_story then
					local var_182_13 = Mathf.Lerp(0, 0.5, var_182_12)

					arg_179_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1184ui_story.fillRatio = var_182_13
				end
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 and arg_179_1.var_.characterEffect1184ui_story then
				local var_182_14 = 0.5

				arg_179_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1184ui_story.fillRatio = var_182_14
			end

			local var_182_15 = arg_179_1.actors_["1072ui_story"].transform
			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 then
				arg_179_1.var_.moveOldPos1072ui_story = var_182_15.localPosition
			end

			local var_182_17 = 0.001

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17
				local var_182_19 = Vector3.New(-0.7, -0.71, -6)

				var_182_15.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1072ui_story, var_182_19, var_182_18)

				local var_182_20 = manager.ui.mainCamera.transform.position - var_182_15.position

				var_182_15.forward = Vector3.New(var_182_20.x, var_182_20.y, var_182_20.z)

				local var_182_21 = var_182_15.localEulerAngles

				var_182_21.z = 0
				var_182_21.x = 0
				var_182_15.localEulerAngles = var_182_21
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 then
				var_182_15.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_182_22 = manager.ui.mainCamera.transform.position - var_182_15.position

				var_182_15.forward = Vector3.New(var_182_22.x, var_182_22.y, var_182_22.z)

				local var_182_23 = var_182_15.localEulerAngles

				var_182_23.z = 0
				var_182_23.x = 0
				var_182_15.localEulerAngles = var_182_23
			end

			local var_182_24 = arg_179_1.actors_["1072ui_story"]
			local var_182_25 = 0

			if var_182_25 < arg_179_1.time_ and arg_179_1.time_ <= var_182_25 + arg_182_0 and arg_179_1.var_.characterEffect1072ui_story == nil then
				arg_179_1.var_.characterEffect1072ui_story = var_182_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_26 = 0.200000002980232

			if var_182_25 <= arg_179_1.time_ and arg_179_1.time_ < var_182_25 + var_182_26 then
				local var_182_27 = (arg_179_1.time_ - var_182_25) / var_182_26

				if arg_179_1.var_.characterEffect1072ui_story then
					arg_179_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_25 + var_182_26 and arg_179_1.time_ < var_182_25 + var_182_26 + arg_182_0 and arg_179_1.var_.characterEffect1072ui_story then
				arg_179_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_182_28 = 0

			if var_182_28 < arg_179_1.time_ and arg_179_1.time_ <= var_182_28 + arg_182_0 then
				arg_179_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_182_29 = 0

			if var_182_29 < arg_179_1.time_ and arg_179_1.time_ <= var_182_29 + arg_182_0 then
				arg_179_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_30 = arg_179_1.actors_["1071ui_story"]
			local var_182_31 = 0

			if var_182_31 < arg_179_1.time_ and arg_179_1.time_ <= var_182_31 + arg_182_0 and arg_179_1.var_.characterEffect1071ui_story == nil then
				arg_179_1.var_.characterEffect1071ui_story = var_182_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_32 = 0.200000002980232

			if var_182_31 <= arg_179_1.time_ and arg_179_1.time_ < var_182_31 + var_182_32 then
				local var_182_33 = (arg_179_1.time_ - var_182_31) / var_182_32

				if arg_179_1.var_.characterEffect1071ui_story then
					local var_182_34 = Mathf.Lerp(0, 0.5, var_182_33)

					arg_179_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1071ui_story.fillRatio = var_182_34
				end
			end

			if arg_179_1.time_ >= var_182_31 + var_182_32 and arg_179_1.time_ < var_182_31 + var_182_32 + arg_182_0 and arg_179_1.var_.characterEffect1071ui_story then
				local var_182_35 = 0.5

				arg_179_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1071ui_story.fillRatio = var_182_35
			end

			local var_182_36 = 0
			local var_182_37 = 1.05

			if var_182_36 < arg_179_1.time_ and arg_179_1.time_ <= var_182_36 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_38 = arg_179_1:FormatText(StoryNameCfg[379].name)

				arg_179_1.leftNameTxt_.text = var_182_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_39 = arg_179_1:GetWordFromCfg(122012050)
				local var_182_40 = arg_179_1:FormatText(var_182_39.content)

				arg_179_1.text_.text = var_182_40

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_41 = 42
				local var_182_42 = utf8.len(var_182_40)
				local var_182_43 = var_182_41 <= 0 and var_182_37 or var_182_37 * (var_182_42 / var_182_41)

				if var_182_43 > 0 and var_182_37 < var_182_43 then
					arg_179_1.talkMaxDuration = var_182_43

					if var_182_43 + var_182_36 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_43 + var_182_36
					end
				end

				arg_179_1.text_.text = var_182_40
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012050", "story_v_out_122012.awb") ~= 0 then
					local var_182_44 = manager.audio:GetVoiceLength("story_v_out_122012", "122012050", "story_v_out_122012.awb") / 1000

					if var_182_44 + var_182_36 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_44 + var_182_36
					end

					if var_182_39.prefab_name ~= "" and arg_179_1.actors_[var_182_39.prefab_name] ~= nil then
						local var_182_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_39.prefab_name].transform, "story_v_out_122012", "122012050", "story_v_out_122012.awb")

						arg_179_1:RecordAudio("122012050", var_182_45)
						arg_179_1:RecordAudio("122012050", var_182_45)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_122012", "122012050", "story_v_out_122012.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_122012", "122012050", "story_v_out_122012.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_46 = math.max(var_182_37, arg_179_1.talkMaxDuration)

			if var_182_36 <= arg_179_1.time_ and arg_179_1.time_ < var_182_36 + var_182_46 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_36) / var_182_46

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_36 + var_182_46 and arg_179_1.time_ < var_182_36 + var_182_46 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play122012051 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 122012051
		arg_183_1.duration_ = 10.1

		local var_183_0 = {
			ja = 10.1,
			ko = 9.833,
			zh = 9.833
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
				arg_183_0:Play122012052(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1072ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1072ui_story == nil then
				arg_183_1.var_.characterEffect1072ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1072ui_story then
					arg_183_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1072ui_story then
				arg_183_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_186_4 = 0

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_1")
			end

			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_186_6 = 0
			local var_186_7 = 1.15

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_8 = arg_183_1:FormatText(StoryNameCfg[379].name)

				arg_183_1.leftNameTxt_.text = var_186_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_9 = arg_183_1:GetWordFromCfg(122012051)
				local var_186_10 = arg_183_1:FormatText(var_186_9.content)

				arg_183_1.text_.text = var_186_10

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_11 = 47
				local var_186_12 = utf8.len(var_186_10)
				local var_186_13 = var_186_11 <= 0 and var_186_7 or var_186_7 * (var_186_12 / var_186_11)

				if var_186_13 > 0 and var_186_7 < var_186_13 then
					arg_183_1.talkMaxDuration = var_186_13

					if var_186_13 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_13 + var_186_6
					end
				end

				arg_183_1.text_.text = var_186_10
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012051", "story_v_out_122012.awb") ~= 0 then
					local var_186_14 = manager.audio:GetVoiceLength("story_v_out_122012", "122012051", "story_v_out_122012.awb") / 1000

					if var_186_14 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_14 + var_186_6
					end

					if var_186_9.prefab_name ~= "" and arg_183_1.actors_[var_186_9.prefab_name] ~= nil then
						local var_186_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_9.prefab_name].transform, "story_v_out_122012", "122012051", "story_v_out_122012.awb")

						arg_183_1:RecordAudio("122012051", var_186_15)
						arg_183_1:RecordAudio("122012051", var_186_15)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_122012", "122012051", "story_v_out_122012.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_122012", "122012051", "story_v_out_122012.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_16 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_16 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_16

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_16 and arg_183_1.time_ < var_186_6 + var_186_16 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play122012052 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 122012052
		arg_187_1.duration_ = 8

		local var_187_0 = {
			ja = 8,
			ko = 7.433,
			zh = 7.433
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
				arg_187_0:Play122012053(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_2")
			end

			local var_190_2 = 0
			local var_190_3 = 0.875

			if var_190_2 < arg_187_1.time_ and arg_187_1.time_ <= var_190_2 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_4 = arg_187_1:FormatText(StoryNameCfg[379].name)

				arg_187_1.leftNameTxt_.text = var_190_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_5 = arg_187_1:GetWordFromCfg(122012052)
				local var_190_6 = arg_187_1:FormatText(var_190_5.content)

				arg_187_1.text_.text = var_190_6

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_7 = 35
				local var_190_8 = utf8.len(var_190_6)
				local var_190_9 = var_190_7 <= 0 and var_190_3 or var_190_3 * (var_190_8 / var_190_7)

				if var_190_9 > 0 and var_190_3 < var_190_9 then
					arg_187_1.talkMaxDuration = var_190_9

					if var_190_9 + var_190_2 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_9 + var_190_2
					end
				end

				arg_187_1.text_.text = var_190_6
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012052", "story_v_out_122012.awb") ~= 0 then
					local var_190_10 = manager.audio:GetVoiceLength("story_v_out_122012", "122012052", "story_v_out_122012.awb") / 1000

					if var_190_10 + var_190_2 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_10 + var_190_2
					end

					if var_190_5.prefab_name ~= "" and arg_187_1.actors_[var_190_5.prefab_name] ~= nil then
						local var_190_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_5.prefab_name].transform, "story_v_out_122012", "122012052", "story_v_out_122012.awb")

						arg_187_1:RecordAudio("122012052", var_190_11)
						arg_187_1:RecordAudio("122012052", var_190_11)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_122012", "122012052", "story_v_out_122012.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_122012", "122012052", "story_v_out_122012.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_12 = math.max(var_190_3, arg_187_1.talkMaxDuration)

			if var_190_2 <= arg_187_1.time_ and arg_187_1.time_ < var_190_2 + var_190_12 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_2) / var_190_12

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_2 + var_190_12 and arg_187_1.time_ < var_190_2 + var_190_12 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play122012053 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 122012053
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play122012054(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1071ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1071ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0, 100, 0)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1071ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0, 100, 0)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["1072ui_story"].transform
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1.var_.moveOldPos1072ui_story = var_194_9.localPosition
			end

			local var_194_11 = 0.001

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11
				local var_194_13 = Vector3.New(0, 100, 0)

				var_194_9.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1072ui_story, var_194_13, var_194_12)

				local var_194_14 = manager.ui.mainCamera.transform.position - var_194_9.position

				var_194_9.forward = Vector3.New(var_194_14.x, var_194_14.y, var_194_14.z)

				local var_194_15 = var_194_9.localEulerAngles

				var_194_15.z = 0
				var_194_15.x = 0
				var_194_9.localEulerAngles = var_194_15
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 then
				var_194_9.localPosition = Vector3.New(0, 100, 0)

				local var_194_16 = manager.ui.mainCamera.transform.position - var_194_9.position

				var_194_9.forward = Vector3.New(var_194_16.x, var_194_16.y, var_194_16.z)

				local var_194_17 = var_194_9.localEulerAngles

				var_194_17.z = 0
				var_194_17.x = 0
				var_194_9.localEulerAngles = var_194_17
			end

			local var_194_18 = 0
			local var_194_19 = 0.925

			if var_194_18 < arg_191_1.time_ and arg_191_1.time_ <= var_194_18 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_20 = arg_191_1:GetWordFromCfg(122012053)
				local var_194_21 = arg_191_1:FormatText(var_194_20.content)

				arg_191_1.text_.text = var_194_21

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_22 = 37
				local var_194_23 = utf8.len(var_194_21)
				local var_194_24 = var_194_22 <= 0 and var_194_19 or var_194_19 * (var_194_23 / var_194_22)

				if var_194_24 > 0 and var_194_19 < var_194_24 then
					arg_191_1.talkMaxDuration = var_194_24

					if var_194_24 + var_194_18 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_24 + var_194_18
					end
				end

				arg_191_1.text_.text = var_194_21
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_25 = math.max(var_194_19, arg_191_1.talkMaxDuration)

			if var_194_18 <= arg_191_1.time_ and arg_191_1.time_ < var_194_18 + var_194_25 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_18) / var_194_25

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_18 + var_194_25 and arg_191_1.time_ < var_194_18 + var_194_25 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play122012054 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 122012054
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play122012055(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 1

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_2 = arg_195_1:GetWordFromCfg(122012054)
				local var_198_3 = arg_195_1:FormatText(var_198_2.content)

				arg_195_1.text_.text = var_198_3

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_4 = 40
				local var_198_5 = utf8.len(var_198_3)
				local var_198_6 = var_198_4 <= 0 and var_198_1 or var_198_1 * (var_198_5 / var_198_4)

				if var_198_6 > 0 and var_198_1 < var_198_6 then
					arg_195_1.talkMaxDuration = var_198_6

					if var_198_6 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_6 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_3
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_7 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_7 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_7

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_7 and arg_195_1.time_ < var_198_0 + var_198_7 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play122012055 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 122012055
		arg_199_1.duration_ = 10.1

		local var_199_0 = {
			ja = 10.1,
			ko = 7.9,
			zh = 7.9
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
				arg_199_0:Play122012056(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1071ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1071ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0.7, -1.05, -6.2)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1071ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1071ui_story"]
			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 and arg_199_1.var_.characterEffect1071ui_story == nil then
				arg_199_1.var_.characterEffect1071ui_story = var_202_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_11 = 0.200000002980232

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11

				if arg_199_1.var_.characterEffect1071ui_story then
					arg_199_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 and arg_199_1.var_.characterEffect1071ui_story then
				arg_199_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_202_13 = 0

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 then
				arg_199_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_202_14 = arg_199_1.actors_["1072ui_story"].transform
			local var_202_15 = 0

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 then
				arg_199_1.var_.moveOldPos1072ui_story = var_202_14.localPosition
			end

			local var_202_16 = 0.001

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_16 then
				local var_202_17 = (arg_199_1.time_ - var_202_15) / var_202_16
				local var_202_18 = Vector3.New(-0.7, -0.71, -6)

				var_202_14.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1072ui_story, var_202_18, var_202_17)

				local var_202_19 = manager.ui.mainCamera.transform.position - var_202_14.position

				var_202_14.forward = Vector3.New(var_202_19.x, var_202_19.y, var_202_19.z)

				local var_202_20 = var_202_14.localEulerAngles

				var_202_20.z = 0
				var_202_20.x = 0
				var_202_14.localEulerAngles = var_202_20
			end

			if arg_199_1.time_ >= var_202_15 + var_202_16 and arg_199_1.time_ < var_202_15 + var_202_16 + arg_202_0 then
				var_202_14.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_202_21 = manager.ui.mainCamera.transform.position - var_202_14.position

				var_202_14.forward = Vector3.New(var_202_21.x, var_202_21.y, var_202_21.z)

				local var_202_22 = var_202_14.localEulerAngles

				var_202_22.z = 0
				var_202_22.x = 0
				var_202_14.localEulerAngles = var_202_22
			end

			local var_202_23 = arg_199_1.actors_["1072ui_story"]
			local var_202_24 = 0

			if var_202_24 < arg_199_1.time_ and arg_199_1.time_ <= var_202_24 + arg_202_0 and arg_199_1.var_.characterEffect1072ui_story == nil then
				arg_199_1.var_.characterEffect1072ui_story = var_202_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_25 = 0.034000001847744

			if var_202_24 <= arg_199_1.time_ and arg_199_1.time_ < var_202_24 + var_202_25 then
				local var_202_26 = (arg_199_1.time_ - var_202_24) / var_202_25

				if arg_199_1.var_.characterEffect1072ui_story then
					local var_202_27 = Mathf.Lerp(0, 0.5, var_202_26)

					arg_199_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1072ui_story.fillRatio = var_202_27
				end
			end

			if arg_199_1.time_ >= var_202_24 + var_202_25 and arg_199_1.time_ < var_202_24 + var_202_25 + arg_202_0 and arg_199_1.var_.characterEffect1072ui_story then
				local var_202_28 = 0.5

				arg_199_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1072ui_story.fillRatio = var_202_28
			end

			local var_202_29 = 0
			local var_202_30 = 0.975

			if var_202_29 < arg_199_1.time_ and arg_199_1.time_ <= var_202_29 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_31 = arg_199_1:FormatText(StoryNameCfg[384].name)

				arg_199_1.leftNameTxt_.text = var_202_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_32 = arg_199_1:GetWordFromCfg(122012055)
				local var_202_33 = arg_199_1:FormatText(var_202_32.content)

				arg_199_1.text_.text = var_202_33

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_34 = 39
				local var_202_35 = utf8.len(var_202_33)
				local var_202_36 = var_202_34 <= 0 and var_202_30 or var_202_30 * (var_202_35 / var_202_34)

				if var_202_36 > 0 and var_202_30 < var_202_36 then
					arg_199_1.talkMaxDuration = var_202_36

					if var_202_36 + var_202_29 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_36 + var_202_29
					end
				end

				arg_199_1.text_.text = var_202_33
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012055", "story_v_out_122012.awb") ~= 0 then
					local var_202_37 = manager.audio:GetVoiceLength("story_v_out_122012", "122012055", "story_v_out_122012.awb") / 1000

					if var_202_37 + var_202_29 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_37 + var_202_29
					end

					if var_202_32.prefab_name ~= "" and arg_199_1.actors_[var_202_32.prefab_name] ~= nil then
						local var_202_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_32.prefab_name].transform, "story_v_out_122012", "122012055", "story_v_out_122012.awb")

						arg_199_1:RecordAudio("122012055", var_202_38)
						arg_199_1:RecordAudio("122012055", var_202_38)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_122012", "122012055", "story_v_out_122012.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_122012", "122012055", "story_v_out_122012.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_39 = math.max(var_202_30, arg_199_1.talkMaxDuration)

			if var_202_29 <= arg_199_1.time_ and arg_199_1.time_ < var_202_29 + var_202_39 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_29) / var_202_39

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_29 + var_202_39 and arg_199_1.time_ < var_202_29 + var_202_39 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play122012056 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 122012056
		arg_203_1.duration_ = 7.966

		local var_203_0 = {
			ja = 7.966,
			ko = 6.133,
			zh = 6.133
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
				arg_203_0:Play122012057(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1072ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1072ui_story == nil then
				arg_203_1.var_.characterEffect1072ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1072ui_story then
					arg_203_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1072ui_story then
				arg_203_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_206_4 = 0

			if var_206_4 < arg_203_1.time_ and arg_203_1.time_ <= var_206_4 + arg_206_0 then
				arg_203_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_206_5 = 0

			if var_206_5 < arg_203_1.time_ and arg_203_1.time_ <= var_206_5 + arg_206_0 then
				arg_203_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_206_6 = arg_203_1.actors_["1071ui_story"]
			local var_206_7 = 0

			if var_206_7 < arg_203_1.time_ and arg_203_1.time_ <= var_206_7 + arg_206_0 and arg_203_1.var_.characterEffect1071ui_story == nil then
				arg_203_1.var_.characterEffect1071ui_story = var_206_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_8 = 0.200000002980232

			if var_206_7 <= arg_203_1.time_ and arg_203_1.time_ < var_206_7 + var_206_8 then
				local var_206_9 = (arg_203_1.time_ - var_206_7) / var_206_8

				if arg_203_1.var_.characterEffect1071ui_story then
					local var_206_10 = Mathf.Lerp(0, 0.5, var_206_9)

					arg_203_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1071ui_story.fillRatio = var_206_10
				end
			end

			if arg_203_1.time_ >= var_206_7 + var_206_8 and arg_203_1.time_ < var_206_7 + var_206_8 + arg_206_0 and arg_203_1.var_.characterEffect1071ui_story then
				local var_206_11 = 0.5

				arg_203_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1071ui_story.fillRatio = var_206_11
			end

			local var_206_12 = 0
			local var_206_13 = 0.825

			if var_206_12 < arg_203_1.time_ and arg_203_1.time_ <= var_206_12 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_14 = arg_203_1:FormatText(StoryNameCfg[379].name)

				arg_203_1.leftNameTxt_.text = var_206_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_15 = arg_203_1:GetWordFromCfg(122012056)
				local var_206_16 = arg_203_1:FormatText(var_206_15.content)

				arg_203_1.text_.text = var_206_16

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_17 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012056", "story_v_out_122012.awb") ~= 0 then
					local var_206_20 = manager.audio:GetVoiceLength("story_v_out_122012", "122012056", "story_v_out_122012.awb") / 1000

					if var_206_20 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_12
					end

					if var_206_15.prefab_name ~= "" and arg_203_1.actors_[var_206_15.prefab_name] ~= nil then
						local var_206_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_15.prefab_name].transform, "story_v_out_122012", "122012056", "story_v_out_122012.awb")

						arg_203_1:RecordAudio("122012056", var_206_21)
						arg_203_1:RecordAudio("122012056", var_206_21)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_122012", "122012056", "story_v_out_122012.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_122012", "122012056", "story_v_out_122012.awb")
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
	Play122012057 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 122012057
		arg_207_1.duration_ = 7.133

		local var_207_0 = {
			ja = 7.133,
			ko = 6.966,
			zh = 6.966
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
				arg_207_0:Play122012058(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.875

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[379].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(122012057)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 35
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012057", "story_v_out_122012.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_122012", "122012057", "story_v_out_122012.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_122012", "122012057", "story_v_out_122012.awb")

						arg_207_1:RecordAudio("122012057", var_210_9)
						arg_207_1:RecordAudio("122012057", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_122012", "122012057", "story_v_out_122012.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_122012", "122012057", "story_v_out_122012.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play122012058 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 122012058
		arg_211_1.duration_ = 12.866

		local var_211_0 = {
			ja = 7.5,
			ko = 12.866,
			zh = 12.866
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
				arg_211_0:Play122012059(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1072ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1072ui_story == nil then
				arg_211_1.var_.characterEffect1072ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1072ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1072ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1072ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1072ui_story.fillRatio = var_214_5
			end

			local var_214_6 = 0

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action432")
			end

			local var_214_7 = arg_211_1.actors_["1071ui_story"]
			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect1071ui_story == nil then
				arg_211_1.var_.characterEffect1071ui_story = var_214_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_9 = 0.200000002980232

			if var_214_8 <= arg_211_1.time_ and arg_211_1.time_ < var_214_8 + var_214_9 then
				local var_214_10 = (arg_211_1.time_ - var_214_8) / var_214_9

				if arg_211_1.var_.characterEffect1071ui_story then
					arg_211_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_8 + var_214_9 and arg_211_1.time_ < var_214_8 + var_214_9 + arg_214_0 and arg_211_1.var_.characterEffect1071ui_story then
				arg_211_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_214_11 = 0
			local var_214_12 = 1.3

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_13 = arg_211_1:FormatText(StoryNameCfg[384].name)

				arg_211_1.leftNameTxt_.text = var_214_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_14 = arg_211_1:GetWordFromCfg(122012058)
				local var_214_15 = arg_211_1:FormatText(var_214_14.content)

				arg_211_1.text_.text = var_214_15

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_16 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012058", "story_v_out_122012.awb") ~= 0 then
					local var_214_19 = manager.audio:GetVoiceLength("story_v_out_122012", "122012058", "story_v_out_122012.awb") / 1000

					if var_214_19 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_11
					end

					if var_214_14.prefab_name ~= "" and arg_211_1.actors_[var_214_14.prefab_name] ~= nil then
						local var_214_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_14.prefab_name].transform, "story_v_out_122012", "122012058", "story_v_out_122012.awb")

						arg_211_1:RecordAudio("122012058", var_214_20)
						arg_211_1:RecordAudio("122012058", var_214_20)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_122012", "122012058", "story_v_out_122012.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_122012", "122012058", "story_v_out_122012.awb")
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
	Play122012059 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 122012059
		arg_215_1.duration_ = 11.166

		local var_215_0 = {
			ja = 11.166,
			ko = 6.4,
			zh = 6.4
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
				arg_215_0:Play122012060(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1072ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1072ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(0, 100, 0)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1072ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, 100, 0)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["1072ui_story"]
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 and arg_215_1.var_.characterEffect1072ui_story == nil then
				arg_215_1.var_.characterEffect1072ui_story = var_218_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_11 = 0.200000002980232

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11

				if arg_215_1.var_.characterEffect1072ui_story then
					local var_218_13 = Mathf.Lerp(0, 0.5, var_218_12)

					arg_215_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1072ui_story.fillRatio = var_218_13
				end
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 and arg_215_1.var_.characterEffect1072ui_story then
				local var_218_14 = 0.5

				arg_215_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1072ui_story.fillRatio = var_218_14
			end

			local var_218_15 = arg_215_1.actors_["1184ui_story"].transform
			local var_218_16 = 0

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				arg_215_1.var_.moveOldPos1184ui_story = var_218_15.localPosition
			end

			local var_218_17 = 0.001

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_17 then
				local var_218_18 = (arg_215_1.time_ - var_218_16) / var_218_17
				local var_218_19 = Vector3.New(-0.7, -0.97, -6)

				var_218_15.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1184ui_story, var_218_19, var_218_18)

				local var_218_20 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_20.x, var_218_20.y, var_218_20.z)

				local var_218_21 = var_218_15.localEulerAngles

				var_218_21.z = 0
				var_218_21.x = 0
				var_218_15.localEulerAngles = var_218_21
			end

			if arg_215_1.time_ >= var_218_16 + var_218_17 and arg_215_1.time_ < var_218_16 + var_218_17 + arg_218_0 then
				var_218_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_218_22 = manager.ui.mainCamera.transform.position - var_218_15.position

				var_218_15.forward = Vector3.New(var_218_22.x, var_218_22.y, var_218_22.z)

				local var_218_23 = var_218_15.localEulerAngles

				var_218_23.z = 0
				var_218_23.x = 0
				var_218_15.localEulerAngles = var_218_23
			end

			local var_218_24 = arg_215_1.actors_["1184ui_story"]
			local var_218_25 = 0

			if var_218_25 < arg_215_1.time_ and arg_215_1.time_ <= var_218_25 + arg_218_0 and arg_215_1.var_.characterEffect1184ui_story == nil then
				arg_215_1.var_.characterEffect1184ui_story = var_218_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_26 = 0.200000002980232

			if var_218_25 <= arg_215_1.time_ and arg_215_1.time_ < var_218_25 + var_218_26 then
				local var_218_27 = (arg_215_1.time_ - var_218_25) / var_218_26

				if arg_215_1.var_.characterEffect1184ui_story then
					arg_215_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_25 + var_218_26 and arg_215_1.time_ < var_218_25 + var_218_26 + arg_218_0 and arg_215_1.var_.characterEffect1184ui_story then
				arg_215_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_218_28 = 0

			if var_218_28 < arg_215_1.time_ and arg_215_1.time_ <= var_218_28 + arg_218_0 then
				arg_215_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_218_29 = 0

			if var_218_29 < arg_215_1.time_ and arg_215_1.time_ <= var_218_29 + arg_218_0 then
				arg_215_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_218_30 = arg_215_1.actors_["1071ui_story"]
			local var_218_31 = 0

			if var_218_31 < arg_215_1.time_ and arg_215_1.time_ <= var_218_31 + arg_218_0 and arg_215_1.var_.characterEffect1071ui_story == nil then
				arg_215_1.var_.characterEffect1071ui_story = var_218_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_32 = 0.200000002980232

			if var_218_31 <= arg_215_1.time_ and arg_215_1.time_ < var_218_31 + var_218_32 then
				local var_218_33 = (arg_215_1.time_ - var_218_31) / var_218_32

				if arg_215_1.var_.characterEffect1071ui_story then
					local var_218_34 = Mathf.Lerp(0, 0.5, var_218_33)

					arg_215_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1071ui_story.fillRatio = var_218_34
				end
			end

			if arg_215_1.time_ >= var_218_31 + var_218_32 and arg_215_1.time_ < var_218_31 + var_218_32 + arg_218_0 and arg_215_1.var_.characterEffect1071ui_story then
				local var_218_35 = 0.5

				arg_215_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1071ui_story.fillRatio = var_218_35
			end

			local var_218_36 = 0
			local var_218_37 = 0.7

			if var_218_36 < arg_215_1.time_ and arg_215_1.time_ <= var_218_36 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_38 = arg_215_1:FormatText(StoryNameCfg[6].name)

				arg_215_1.leftNameTxt_.text = var_218_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_39 = arg_215_1:GetWordFromCfg(122012059)
				local var_218_40 = arg_215_1:FormatText(var_218_39.content)

				arg_215_1.text_.text = var_218_40

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_41 = 28
				local var_218_42 = utf8.len(var_218_40)
				local var_218_43 = var_218_41 <= 0 and var_218_37 or var_218_37 * (var_218_42 / var_218_41)

				if var_218_43 > 0 and var_218_37 < var_218_43 then
					arg_215_1.talkMaxDuration = var_218_43

					if var_218_43 + var_218_36 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_43 + var_218_36
					end
				end

				arg_215_1.text_.text = var_218_40
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012059", "story_v_out_122012.awb") ~= 0 then
					local var_218_44 = manager.audio:GetVoiceLength("story_v_out_122012", "122012059", "story_v_out_122012.awb") / 1000

					if var_218_44 + var_218_36 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_44 + var_218_36
					end

					if var_218_39.prefab_name ~= "" and arg_215_1.actors_[var_218_39.prefab_name] ~= nil then
						local var_218_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_39.prefab_name].transform, "story_v_out_122012", "122012059", "story_v_out_122012.awb")

						arg_215_1:RecordAudio("122012059", var_218_45)
						arg_215_1:RecordAudio("122012059", var_218_45)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_122012", "122012059", "story_v_out_122012.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_122012", "122012059", "story_v_out_122012.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_46 = math.max(var_218_37, arg_215_1.talkMaxDuration)

			if var_218_36 <= arg_215_1.time_ and arg_215_1.time_ < var_218_36 + var_218_46 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_36) / var_218_46

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_36 + var_218_46 and arg_215_1.time_ < var_218_36 + var_218_46 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play122012060 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 122012060
		arg_219_1.duration_ = 7.7

		local var_219_0 = {
			ja = 7.7,
			ko = 7.166,
			zh = 7.166
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
				arg_219_0:Play122012061(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1071ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1071ui_story == nil then
				arg_219_1.var_.characterEffect1071ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1071ui_story then
					arg_219_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1071ui_story then
				arg_219_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_222_4 = 0

			if var_222_4 < arg_219_1.time_ and arg_219_1.time_ <= var_222_4 + arg_222_0 then
				arg_219_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_2")
			end

			local var_222_5 = arg_219_1.actors_["1184ui_story"]
			local var_222_6 = 0

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 and arg_219_1.var_.characterEffect1184ui_story == nil then
				arg_219_1.var_.characterEffect1184ui_story = var_222_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_7 = 0.200000002980232

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_7 then
				local var_222_8 = (arg_219_1.time_ - var_222_6) / var_222_7

				if arg_219_1.var_.characterEffect1184ui_story then
					local var_222_9 = Mathf.Lerp(0, 0.5, var_222_8)

					arg_219_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1184ui_story.fillRatio = var_222_9
				end
			end

			if arg_219_1.time_ >= var_222_6 + var_222_7 and arg_219_1.time_ < var_222_6 + var_222_7 + arg_222_0 and arg_219_1.var_.characterEffect1184ui_story then
				local var_222_10 = 0.5

				arg_219_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1184ui_story.fillRatio = var_222_10
			end

			local var_222_11 = 0
			local var_222_12 = 0.875

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_13 = arg_219_1:FormatText(StoryNameCfg[384].name)

				arg_219_1.leftNameTxt_.text = var_222_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_14 = arg_219_1:GetWordFromCfg(122012060)
				local var_222_15 = arg_219_1:FormatText(var_222_14.content)

				arg_219_1.text_.text = var_222_15

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_16 = 35
				local var_222_17 = utf8.len(var_222_15)
				local var_222_18 = var_222_16 <= 0 and var_222_12 or var_222_12 * (var_222_17 / var_222_16)

				if var_222_18 > 0 and var_222_12 < var_222_18 then
					arg_219_1.talkMaxDuration = var_222_18

					if var_222_18 + var_222_11 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_18 + var_222_11
					end
				end

				arg_219_1.text_.text = var_222_15
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012060", "story_v_out_122012.awb") ~= 0 then
					local var_222_19 = manager.audio:GetVoiceLength("story_v_out_122012", "122012060", "story_v_out_122012.awb") / 1000

					if var_222_19 + var_222_11 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_11
					end

					if var_222_14.prefab_name ~= "" and arg_219_1.actors_[var_222_14.prefab_name] ~= nil then
						local var_222_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_14.prefab_name].transform, "story_v_out_122012", "122012060", "story_v_out_122012.awb")

						arg_219_1:RecordAudio("122012060", var_222_20)
						arg_219_1:RecordAudio("122012060", var_222_20)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_122012", "122012060", "story_v_out_122012.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_122012", "122012060", "story_v_out_122012.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_21 = math.max(var_222_12, arg_219_1.talkMaxDuration)

			if var_222_11 <= arg_219_1.time_ and arg_219_1.time_ < var_222_11 + var_222_21 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_11) / var_222_21

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_11 + var_222_21 and arg_219_1.time_ < var_222_11 + var_222_21 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play122012061 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 122012061
		arg_223_1.duration_ = 8

		local var_223_0 = {
			ja = 8,
			ko = 6.6,
			zh = 6.6
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
				arg_223_0:Play122012062(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 0.8

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_2 = arg_223_1:FormatText(StoryNameCfg[384].name)

				arg_223_1.leftNameTxt_.text = var_226_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_3 = arg_223_1:GetWordFromCfg(122012061)
				local var_226_4 = arg_223_1:FormatText(var_226_3.content)

				arg_223_1.text_.text = var_226_4

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_5 = 32
				local var_226_6 = utf8.len(var_226_4)
				local var_226_7 = var_226_5 <= 0 and var_226_1 or var_226_1 * (var_226_6 / var_226_5)

				if var_226_7 > 0 and var_226_1 < var_226_7 then
					arg_223_1.talkMaxDuration = var_226_7

					if var_226_7 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_7 + var_226_0
					end
				end

				arg_223_1.text_.text = var_226_4
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012061", "story_v_out_122012.awb") ~= 0 then
					local var_226_8 = manager.audio:GetVoiceLength("story_v_out_122012", "122012061", "story_v_out_122012.awb") / 1000

					if var_226_8 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_0
					end

					if var_226_3.prefab_name ~= "" and arg_223_1.actors_[var_226_3.prefab_name] ~= nil then
						local var_226_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_3.prefab_name].transform, "story_v_out_122012", "122012061", "story_v_out_122012.awb")

						arg_223_1:RecordAudio("122012061", var_226_9)
						arg_223_1:RecordAudio("122012061", var_226_9)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_122012", "122012061", "story_v_out_122012.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_122012", "122012061", "story_v_out_122012.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_10 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_10 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_10

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_10 and arg_223_1.time_ < var_226_0 + var_226_10 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play122012062 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 122012062
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play122012063(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1071ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1071ui_story == nil then
				arg_227_1.var_.characterEffect1071ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1071ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1071ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1071ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1071ui_story.fillRatio = var_230_5
			end

			local var_230_6 = 0
			local var_230_7 = 1.45

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_8 = arg_227_1:GetWordFromCfg(122012062)
				local var_230_9 = arg_227_1:FormatText(var_230_8.content)

				arg_227_1.text_.text = var_230_9

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_10 = 58
				local var_230_11 = utf8.len(var_230_9)
				local var_230_12 = var_230_10 <= 0 and var_230_7 or var_230_7 * (var_230_11 / var_230_10)

				if var_230_12 > 0 and var_230_7 < var_230_12 then
					arg_227_1.talkMaxDuration = var_230_12

					if var_230_12 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_12 + var_230_6
					end
				end

				arg_227_1.text_.text = var_230_9
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_13 = math.max(var_230_7, arg_227_1.talkMaxDuration)

			if var_230_6 <= arg_227_1.time_ and arg_227_1.time_ < var_230_6 + var_230_13 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_6) / var_230_13

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_6 + var_230_13 and arg_227_1.time_ < var_230_6 + var_230_13 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play122012063 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 122012063
		arg_231_1.duration_ = 5.1

		local var_231_0 = {
			ja = 3.8,
			ko = 5.1,
			zh = 5.1
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
			arg_231_1.auto_ = false
		end

		function arg_231_1.playNext_(arg_233_0)
			arg_231_1.onStoryFinished_()
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1071ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1071ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0.7, -1.05, -6.2)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1071ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1071ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1071ui_story == nil then
				arg_231_1.var_.characterEffect1071ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1071ui_story then
					arg_231_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1071ui_story then
				arg_231_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_234_13 = 0

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_234_15 = 0
			local var_234_16 = 0.425

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_17 = arg_231_1:FormatText(StoryNameCfg[384].name)

				arg_231_1.leftNameTxt_.text = var_234_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_18 = arg_231_1:GetWordFromCfg(122012063)
				local var_234_19 = arg_231_1:FormatText(var_234_18.content)

				arg_231_1.text_.text = var_234_19

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_20 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012063", "story_v_out_122012.awb") ~= 0 then
					local var_234_23 = manager.audio:GetVoiceLength("story_v_out_122012", "122012063", "story_v_out_122012.awb") / 1000

					if var_234_23 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_23 + var_234_15
					end

					if var_234_18.prefab_name ~= "" and arg_231_1.actors_[var_234_18.prefab_name] ~= nil then
						local var_234_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_18.prefab_name].transform, "story_v_out_122012", "122012063", "story_v_out_122012.awb")

						arg_231_1:RecordAudio("122012063", var_234_24)
						arg_231_1:RecordAudio("122012063", var_234_24)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_122012", "122012063", "story_v_out_122012.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_122012", "122012063", "story_v_out_122012.awb")
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
	Play122012025 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 122012025
		arg_235_1.duration_ = 3.933

		local var_235_0 = {
			ja = 3.933,
			ko = 1.5,
			zh = 1.5
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
				arg_235_0:Play122012026(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1071ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1071ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0, -1.05, -6.2)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1071ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["1071ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect1071ui_story == nil then
				arg_235_1.var_.characterEffect1071ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect1071ui_story then
					arg_235_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect1071ui_story then
				arg_235_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_238_13 = 0

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_238_15 = 0
			local var_238_16 = 0.2

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_17 = arg_235_1:FormatText(StoryNameCfg[384].name)

				arg_235_1.leftNameTxt_.text = var_238_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_18 = arg_235_1:GetWordFromCfg(122012025)
				local var_238_19 = arg_235_1:FormatText(var_238_18.content)

				arg_235_1.text_.text = var_238_19

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_20 = 8
				local var_238_21 = utf8.len(var_238_19)
				local var_238_22 = var_238_20 <= 0 and var_238_16 or var_238_16 * (var_238_21 / var_238_20)

				if var_238_22 > 0 and var_238_16 < var_238_22 then
					arg_235_1.talkMaxDuration = var_238_22

					if var_238_22 + var_238_15 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_22 + var_238_15
					end
				end

				arg_235_1.text_.text = var_238_19
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012025", "story_v_out_122012.awb") ~= 0 then
					local var_238_23 = manager.audio:GetVoiceLength("story_v_out_122012", "122012025", "story_v_out_122012.awb") / 1000

					if var_238_23 + var_238_15 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_23 + var_238_15
					end

					if var_238_18.prefab_name ~= "" and arg_235_1.actors_[var_238_18.prefab_name] ~= nil then
						local var_238_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_18.prefab_name].transform, "story_v_out_122012", "122012025", "story_v_out_122012.awb")

						arg_235_1:RecordAudio("122012025", var_238_24)
						arg_235_1:RecordAudio("122012025", var_238_24)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_122012", "122012025", "story_v_out_122012.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_122012", "122012025", "story_v_out_122012.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_25 = math.max(var_238_16, arg_235_1.talkMaxDuration)

			if var_238_15 <= arg_235_1.time_ and arg_235_1.time_ < var_238_15 + var_238_25 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_15) / var_238_25

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_15 + var_238_25 and arg_235_1.time_ < var_238_15 + var_238_25 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play122012026 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 122012026
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play122012027(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1071ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story == nil then
				arg_239_1.var_.characterEffect1071ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1071ui_story then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1071ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1071ui_story.fillRatio = var_242_5
			end

			local var_242_6 = 0
			local var_242_7 = 0.375

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(122012026)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 15
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_14 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_14 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_14

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_14 and arg_239_1.time_ < var_242_6 + var_242_14 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play122012027 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 122012027
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play122012028(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.8

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

				local var_246_3 = arg_243_1:GetWordFromCfg(122012027)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 32
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
	Play122012028 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 122012028
		arg_247_1.duration_ = 4.833

		local var_247_0 = {
			ja = 4.833,
			ko = 4.433,
			zh = 4.433
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
				arg_247_0:Play122012029(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1071ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1071ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, -1.05, -6.2)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1071ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = arg_247_1.actors_["1071ui_story"]
			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 and arg_247_1.var_.characterEffect1071ui_story == nil then
				arg_247_1.var_.characterEffect1071ui_story = var_250_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_11 = 0.200000002980232

			if var_250_10 <= arg_247_1.time_ and arg_247_1.time_ < var_250_10 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_10) / var_250_11

				if arg_247_1.var_.characterEffect1071ui_story then
					arg_247_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_10 + var_250_11 and arg_247_1.time_ < var_250_10 + var_250_11 + arg_250_0 and arg_247_1.var_.characterEffect1071ui_story then
				arg_247_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_250_13 = 0

			if var_250_13 < arg_247_1.time_ and arg_247_1.time_ <= var_250_13 + arg_250_0 then
				arg_247_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 then
				arg_247_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_250_15 = 0
			local var_250_16 = 0.525

			if var_250_15 < arg_247_1.time_ and arg_247_1.time_ <= var_250_15 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_17 = arg_247_1:FormatText(StoryNameCfg[384].name)

				arg_247_1.leftNameTxt_.text = var_250_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_18 = arg_247_1:GetWordFromCfg(122012028)
				local var_250_19 = arg_247_1:FormatText(var_250_18.content)

				arg_247_1.text_.text = var_250_19

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_20 = 21
				local var_250_21 = utf8.len(var_250_19)
				local var_250_22 = var_250_20 <= 0 and var_250_16 or var_250_16 * (var_250_21 / var_250_20)

				if var_250_22 > 0 and var_250_16 < var_250_22 then
					arg_247_1.talkMaxDuration = var_250_22

					if var_250_22 + var_250_15 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_22 + var_250_15
					end
				end

				arg_247_1.text_.text = var_250_19
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122012", "122012028", "story_v_out_122012.awb") ~= 0 then
					local var_250_23 = manager.audio:GetVoiceLength("story_v_out_122012", "122012028", "story_v_out_122012.awb") / 1000

					if var_250_23 + var_250_15 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_23 + var_250_15
					end

					if var_250_18.prefab_name ~= "" and arg_247_1.actors_[var_250_18.prefab_name] ~= nil then
						local var_250_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_18.prefab_name].transform, "story_v_out_122012", "122012028", "story_v_out_122012.awb")

						arg_247_1:RecordAudio("122012028", var_250_24)
						arg_247_1:RecordAudio("122012028", var_250_24)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_122012", "122012028", "story_v_out_122012.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_122012", "122012028", "story_v_out_122012.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_25 = math.max(var_250_16, arg_247_1.talkMaxDuration)

			if var_250_15 <= arg_247_1.time_ and arg_247_1.time_ < var_250_15 + var_250_25 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_15) / var_250_25

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_15 + var_250_25 and arg_247_1.time_ < var_250_15 + var_250_25 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play122012029 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 122012029
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play122012030(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1071ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1071ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0, 100, 0)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1071ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, 100, 0)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1071ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.characterEffect1071ui_story == nil then
				arg_251_1.var_.characterEffect1071ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect1071ui_story then
					local var_254_13 = Mathf.Lerp(0, 0.5, var_254_12)

					arg_251_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1071ui_story.fillRatio = var_254_13
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect1071ui_story then
				local var_254_14 = 0.5

				arg_251_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1071ui_story.fillRatio = var_254_14
			end

			local var_254_15 = 0
			local var_254_16 = 1.225

			if var_254_15 < arg_251_1.time_ and arg_251_1.time_ <= var_254_15 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_17 = arg_251_1:GetWordFromCfg(122012029)
				local var_254_18 = arg_251_1:FormatText(var_254_17.content)

				arg_251_1.text_.text = var_254_18

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_19 = 49
				local var_254_20 = utf8.len(var_254_18)
				local var_254_21 = var_254_19 <= 0 and var_254_16 or var_254_16 * (var_254_20 / var_254_19)

				if var_254_21 > 0 and var_254_16 < var_254_21 then
					arg_251_1.talkMaxDuration = var_254_21

					if var_254_21 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_21 + var_254_15
					end
				end

				arg_251_1.text_.text = var_254_18
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_22 = math.max(var_254_16, arg_251_1.talkMaxDuration)

			if var_254_15 <= arg_251_1.time_ and arg_251_1.time_ < var_254_15 + var_254_22 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_15) / var_254_22

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_15 + var_254_22 and arg_251_1.time_ < var_254_15 + var_254_22 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J10i"
	},
	voices = {
		"story_v_out_122012.awb"
	}
}
