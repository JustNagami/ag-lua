return {
	Play117061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117061001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117061002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A02d"

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
				local var_4_5 = arg_1_1.bgs_.A02d

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
					if iter_4_0 ~= "A02d" then
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

			local var_4_22 = manager.ui.mainCamera.transform
			local var_4_23 = 0

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				local var_4_24 = arg_1_1.var_.effecthuo

				if not var_4_24 then
					var_4_24 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_4_24.name = "huo"
					arg_1_1.var_.effecthuo = var_4_24
				end

				local var_4_25 = var_4_22:Find("")

				if var_4_25 then
					var_4_24.transform.parent = var_4_25
				else
					var_4_24.transform.parent = var_4_22
				end

				var_4_24.transform.localPosition = Vector3.New(0, 0, 0.03)
				var_4_24.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_4_26 = 0
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "effect"

				arg_1_1:AudioAction(var_4_28, var_4_29, "se_story_17", "se_story_17_fire_loop", "")
			end

			local var_4_30 = 0
			local var_4_31 = 0.466666666666667

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_34 = 2
			local var_4_35 = 1

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "music"

				arg_1_1:AudioAction(var_4_36, var_4_37, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 0.675

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(117061001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 27
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play117061002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117061002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play117061003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = manager.ui.mainCamera.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				local var_10_2 = arg_7_1.var_.effecthuo

				if var_10_2 then
					Object.Destroy(var_10_2)

					arg_7_1.var_.effecthuo = nil
				end
			end

			local var_10_3 = 0
			local var_10_4 = 1.45

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_5 = arg_7_1:GetWordFromCfg(117061002)
				local var_10_6 = arg_7_1:FormatText(var_10_5.content)

				arg_7_1.text_.text = var_10_6

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_7 = 58
				local var_10_8 = utf8.len(var_10_6)
				local var_10_9 = var_10_7 <= 0 and var_10_4 or var_10_4 * (var_10_8 / var_10_7)

				if var_10_9 > 0 and var_10_4 < var_10_9 then
					arg_7_1.talkMaxDuration = var_10_9

					if var_10_9 + var_10_3 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_9 + var_10_3
					end
				end

				arg_7_1.text_.text = var_10_6
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_4, arg_7_1.talkMaxDuration)

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_3) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_3 + var_10_10 and arg_7_1.time_ < var_10_3 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play117061003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117061003
		arg_11_1.duration_ = 6.366

		local var_11_0 = {
			zh = 4.133,
			ja = 6.366
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
				arg_11_0:Play117061004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1033"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["1033"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos1033 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1033", 3)

				local var_14_4 = var_14_2.childCount

				for iter_14_0 = 0, var_14_4 - 1 do
					local var_14_5 = var_14_2:GetChild(iter_14_0)

					if var_14_5.name == "split_6" or not string.find(var_14_5.name, "split") then
						var_14_5.gameObject:SetActive(true)
					else
						var_14_5.gameObject:SetActive(false)
					end
				end
			end

			local var_14_6 = 0.001

			if var_14_3 <= arg_11_1.time_ and arg_11_1.time_ < var_14_3 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_3) / var_14_6
				local var_14_8 = Vector3.New(0, -420, 0)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1033, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(0, -420, 0)
			end

			local var_14_9 = arg_11_1.actors_["1033"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				local var_14_11 = var_14_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_11 then
					arg_11_1.var_.alphaOldValue1033 = var_14_11.alpha
					arg_11_1.var_.characterEffect1033 = var_14_11
				end

				arg_11_1.var_.alphaOldValue1033 = 0
			end

			local var_14_12 = 0.333333333333333

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_12 then
				local var_14_13 = (arg_11_1.time_ - var_14_10) / var_14_12
				local var_14_14 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1033, 1, var_14_13)

				if arg_11_1.var_.characterEffect1033 then
					arg_11_1.var_.characterEffect1033.alpha = var_14_14
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_12 and arg_11_1.time_ < var_14_10 + var_14_12 + arg_14_0 and arg_11_1.var_.characterEffect1033 then
				arg_11_1.var_.characterEffect1033.alpha = 1
			end

			local var_14_15 = arg_11_1.actors_["1033"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 == nil then
				arg_11_1.var_.actorSpriteComps1033 = var_14_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_17 = 0.2

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.actorSpriteComps1033 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_14_2 then
							local var_14_19 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_18)

							iter_14_2.color = Color.New(var_14_19, var_14_19, var_14_19)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 then
				local var_14_20 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_20, var_14_20, var_14_20)
					end
				end

				arg_11_1.var_.actorSpriteComps1033 = nil
			end

			local var_14_21 = 0
			local var_14_22 = 0.45

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_23 = arg_11_1:FormatText(StoryNameCfg[236].name)

				arg_11_1.leftNameTxt_.text = var_14_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_24 = arg_11_1:GetWordFromCfg(117061003)
				local var_14_25 = arg_11_1:FormatText(var_14_24.content)

				arg_11_1.text_.text = var_14_25

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_26 = 17
				local var_14_27 = utf8.len(var_14_25)
				local var_14_28 = var_14_26 <= 0 and var_14_22 or var_14_22 * (var_14_27 / var_14_26)

				if var_14_28 > 0 and var_14_22 < var_14_28 then
					arg_11_1.talkMaxDuration = var_14_28

					if var_14_28 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_21
					end
				end

				arg_11_1.text_.text = var_14_25
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061003", "story_v_out_117061.awb") ~= 0 then
					local var_14_29 = manager.audio:GetVoiceLength("story_v_out_117061", "117061003", "story_v_out_117061.awb") / 1000

					if var_14_29 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_29 + var_14_21
					end

					if var_14_24.prefab_name ~= "" and arg_11_1.actors_[var_14_24.prefab_name] ~= nil then
						local var_14_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_24.prefab_name].transform, "story_v_out_117061", "117061003", "story_v_out_117061.awb")

						arg_11_1:RecordAudio("117061003", var_14_30)
						arg_11_1:RecordAudio("117061003", var_14_30)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117061", "117061003", "story_v_out_117061.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117061", "117061003", "story_v_out_117061.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_31 = math.max(var_14_22, arg_11_1.talkMaxDuration)

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_31 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_21) / var_14_31

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_21 + var_14_31 and arg_11_1.time_ < var_14_21 + var_14_31 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117061004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117061004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play117061005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1033"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				local var_18_2 = var_18_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_18_2 then
					arg_15_1.var_.alphaOldValue1033 = var_18_2.alpha
					arg_15_1.var_.characterEffect1033 = var_18_2
				end

				arg_15_1.var_.alphaOldValue1033 = 1
			end

			local var_18_3 = 0.333333333333333

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_3 then
				local var_18_4 = (arg_15_1.time_ - var_18_1) / var_18_3
				local var_18_5 = Mathf.Lerp(arg_15_1.var_.alphaOldValue1033, 0, var_18_4)

				if arg_15_1.var_.characterEffect1033 then
					arg_15_1.var_.characterEffect1033.alpha = var_18_5
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_3 and arg_15_1.time_ < var_18_1 + var_18_3 + arg_18_0 and arg_15_1.var_.characterEffect1033 then
				arg_15_1.var_.characterEffect1033.alpha = 0
			end

			local var_18_6 = 0
			local var_18_7 = 0.525

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

				local var_18_8 = arg_15_1:GetWordFromCfg(117061004)
				local var_18_9 = arg_15_1:FormatText(var_18_8.content)

				arg_15_1.text_.text = var_18_9

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_10 = 21
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
	Play117061005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117061005
		arg_19_1.duration_ = 2.333

		local var_19_0 = {
			zh = 1.633,
			ja = 2.333
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
				arg_19_0:Play117061006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1132"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_22_0), arg_19_1.canvasGo_.transform)

				var_22_1.transform:SetSiblingIndex(1)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_19_1.actors_[var_22_0] = var_22_1
			end

			local var_22_2 = arg_19_1.actors_["1132"].transform
			local var_22_3 = 0

			if var_22_3 < arg_19_1.time_ and arg_19_1.time_ <= var_22_3 + arg_22_0 then
				arg_19_1.var_.moveOldPos1132 = var_22_2.localPosition
				var_22_2.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1132", 2)

				local var_22_4 = var_22_2.childCount

				for iter_22_0 = 0, var_22_4 - 1 do
					local var_22_5 = var_22_2:GetChild(iter_22_0)

					if var_22_5.name == "split_6" or not string.find(var_22_5.name, "split") then
						var_22_5.gameObject:SetActive(true)
					else
						var_22_5.gameObject:SetActive(false)
					end
				end
			end

			local var_22_6 = 0.001

			if var_22_3 <= arg_19_1.time_ and arg_19_1.time_ < var_22_3 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_3) / var_22_6
				local var_22_8 = Vector3.New(-390, -413, -185)

				var_22_2.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1132, var_22_8, var_22_7)
			end

			if arg_19_1.time_ >= var_22_3 + var_22_6 and arg_19_1.time_ < var_22_3 + var_22_6 + arg_22_0 then
				var_22_2.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_22_9 = arg_19_1.actors_["1033"].transform
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1.var_.moveOldPos1033 = var_22_9.localPosition
				var_22_9.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1033", 4)

				local var_22_11 = var_22_9.childCount

				for iter_22_1 = 0, var_22_11 - 1 do
					local var_22_12 = var_22_9:GetChild(iter_22_1)

					if var_22_12.name == "split_6" or not string.find(var_22_12.name, "split") then
						var_22_12.gameObject:SetActive(true)
					else
						var_22_12.gameObject:SetActive(false)
					end
				end
			end

			local var_22_13 = 0.001

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_13 then
				local var_22_14 = (arg_19_1.time_ - var_22_10) / var_22_13
				local var_22_15 = Vector3.New(390, -420, 0)

				var_22_9.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1033, var_22_15, var_22_14)
			end

			if arg_19_1.time_ >= var_22_10 + var_22_13 and arg_19_1.time_ < var_22_10 + var_22_13 + arg_22_0 then
				var_22_9.localPosition = Vector3.New(390, -420, 0)
			end

			local var_22_16 = arg_19_1.actors_["1132"]
			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 and arg_19_1.var_.actorSpriteComps1132 == nil then
				arg_19_1.var_.actorSpriteComps1132 = var_22_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_18 = 0.2

			if var_22_17 <= arg_19_1.time_ and arg_19_1.time_ < var_22_17 + var_22_18 then
				local var_22_19 = (arg_19_1.time_ - var_22_17) / var_22_18

				if arg_19_1.var_.actorSpriteComps1132 then
					for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_22_3 then
							local var_22_20 = Mathf.Lerp(iter_22_3.color.r, 1, var_22_19)

							iter_22_3.color = Color.New(var_22_20, var_22_20, var_22_20)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_17 + var_22_18 and arg_19_1.time_ < var_22_17 + var_22_18 + arg_22_0 and arg_19_1.var_.actorSpriteComps1132 then
				local var_22_21 = 1

				for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_22_5 then
						iter_22_5.color = Color.New(var_22_21, var_22_21, var_22_21)
					end
				end

				arg_19_1.var_.actorSpriteComps1132 = nil
			end

			local var_22_22 = arg_19_1.actors_["1033"]
			local var_22_23 = 0

			if var_22_23 < arg_19_1.time_ and arg_19_1.time_ <= var_22_23 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 == nil then
				arg_19_1.var_.actorSpriteComps1033 = var_22_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_24 = 0.2

			if var_22_23 <= arg_19_1.time_ and arg_19_1.time_ < var_22_23 + var_22_24 then
				local var_22_25 = (arg_19_1.time_ - var_22_23) / var_22_24

				if arg_19_1.var_.actorSpriteComps1033 then
					for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_22_7 then
							local var_22_26 = Mathf.Lerp(iter_22_7.color.r, 0.5, var_22_25)

							iter_22_7.color = Color.New(var_22_26, var_22_26, var_22_26)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_23 + var_22_24 and arg_19_1.time_ < var_22_23 + var_22_24 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 then
				local var_22_27 = 0.5

				for iter_22_8, iter_22_9 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_22_9 then
						iter_22_9.color = Color.New(var_22_27, var_22_27, var_22_27)
					end
				end

				arg_19_1.var_.actorSpriteComps1033 = nil
			end

			local var_22_28 = arg_19_1.actors_["1132"]
			local var_22_29 = 0

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				local var_22_30 = var_22_28:GetComponentInChildren(typeof(CanvasGroup))

				if var_22_30 then
					arg_19_1.var_.alphaOldValue1132 = var_22_30.alpha
					arg_19_1.var_.characterEffect1132 = var_22_30
				end

				arg_19_1.var_.alphaOldValue1132 = 0
			end

			local var_22_31 = 0.333333333333333

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_31 then
				local var_22_32 = (arg_19_1.time_ - var_22_29) / var_22_31
				local var_22_33 = Mathf.Lerp(arg_19_1.var_.alphaOldValue1132, 1, var_22_32)

				if arg_19_1.var_.characterEffect1132 then
					arg_19_1.var_.characterEffect1132.alpha = var_22_33
				end
			end

			if arg_19_1.time_ >= var_22_29 + var_22_31 and arg_19_1.time_ < var_22_29 + var_22_31 + arg_22_0 and arg_19_1.var_.characterEffect1132 then
				arg_19_1.var_.characterEffect1132.alpha = 1
			end

			local var_22_34 = arg_19_1.actors_["1033"]
			local var_22_35 = 0

			if var_22_35 < arg_19_1.time_ and arg_19_1.time_ <= var_22_35 + arg_22_0 then
				local var_22_36 = var_22_34:GetComponentInChildren(typeof(CanvasGroup))

				if var_22_36 then
					arg_19_1.var_.alphaOldValue1033 = var_22_36.alpha
					arg_19_1.var_.characterEffect1033 = var_22_36
				end

				arg_19_1.var_.alphaOldValue1033 = 0
			end

			local var_22_37 = 0.333333333333333

			if var_22_35 <= arg_19_1.time_ and arg_19_1.time_ < var_22_35 + var_22_37 then
				local var_22_38 = (arg_19_1.time_ - var_22_35) / var_22_37
				local var_22_39 = Mathf.Lerp(arg_19_1.var_.alphaOldValue1033, 1, var_22_38)

				if arg_19_1.var_.characterEffect1033 then
					arg_19_1.var_.characterEffect1033.alpha = var_22_39
				end
			end

			if arg_19_1.time_ >= var_22_35 + var_22_37 and arg_19_1.time_ < var_22_35 + var_22_37 + arg_22_0 and arg_19_1.var_.characterEffect1033 then
				arg_19_1.var_.characterEffect1033.alpha = 1
			end

			local var_22_40 = 0
			local var_22_41 = 0.2

			if var_22_40 < arg_19_1.time_ and arg_19_1.time_ <= var_22_40 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_42 = arg_19_1:FormatText(StoryNameCfg[61].name)

				arg_19_1.leftNameTxt_.text = var_22_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_43 = arg_19_1:GetWordFromCfg(117061005)
				local var_22_44 = arg_19_1:FormatText(var_22_43.content)

				arg_19_1.text_.text = var_22_44

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_45 = 8
				local var_22_46 = utf8.len(var_22_44)
				local var_22_47 = var_22_45 <= 0 and var_22_41 or var_22_41 * (var_22_46 / var_22_45)

				if var_22_47 > 0 and var_22_41 < var_22_47 then
					arg_19_1.talkMaxDuration = var_22_47

					if var_22_47 + var_22_40 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_47 + var_22_40
					end
				end

				arg_19_1.text_.text = var_22_44
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061005", "story_v_out_117061.awb") ~= 0 then
					local var_22_48 = manager.audio:GetVoiceLength("story_v_out_117061", "117061005", "story_v_out_117061.awb") / 1000

					if var_22_48 + var_22_40 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_48 + var_22_40
					end

					if var_22_43.prefab_name ~= "" and arg_19_1.actors_[var_22_43.prefab_name] ~= nil then
						local var_22_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_43.prefab_name].transform, "story_v_out_117061", "117061005", "story_v_out_117061.awb")

						arg_19_1:RecordAudio("117061005", var_22_49)
						arg_19_1:RecordAudio("117061005", var_22_49)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_117061", "117061005", "story_v_out_117061.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_117061", "117061005", "story_v_out_117061.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_50 = math.max(var_22_41, arg_19_1.talkMaxDuration)

			if var_22_40 <= arg_19_1.time_ and arg_19_1.time_ < var_22_40 + var_22_50 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_40) / var_22_50

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_40 + var_22_50 and arg_19_1.time_ < var_22_40 + var_22_50 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play117061006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117061006
		arg_23_1.duration_ = 8.333

		local var_23_0 = {
			zh = 4.266,
			ja = 8.333
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
				arg_23_0:Play117061007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1132"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps1132 == nil then
				arg_23_1.var_.actorSpriteComps1132 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps1132 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 0.5, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps1132 then
				local var_26_5 = 0.5

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps1132 = nil
			end

			local var_26_6 = arg_23_1.actors_["1033"]
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 and arg_23_1.var_.actorSpriteComps1033 == nil then
				arg_23_1.var_.actorSpriteComps1033 = var_26_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_8 = 0.2

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8

				if arg_23_1.var_.actorSpriteComps1033 then
					for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_26_5 then
							local var_26_10 = Mathf.Lerp(iter_26_5.color.r, 1, var_26_9)

							iter_26_5.color = Color.New(var_26_10, var_26_10, var_26_10)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps1033 then
				local var_26_11 = 1

				for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_26_7 then
						iter_26_7.color = Color.New(var_26_11, var_26_11, var_26_11)
					end
				end

				arg_23_1.var_.actorSpriteComps1033 = nil
			end

			local var_26_12 = 0
			local var_26_13 = 0.625

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_14 = arg_23_1:FormatText(StoryNameCfg[236].name)

				arg_23_1.leftNameTxt_.text = var_26_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(117061006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 25
				local var_26_18 = utf8.len(var_26_16)
				local var_26_19 = var_26_17 <= 0 and var_26_13 or var_26_13 * (var_26_18 / var_26_17)

				if var_26_19 > 0 and var_26_13 < var_26_19 then
					arg_23_1.talkMaxDuration = var_26_19

					if var_26_19 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_12
					end
				end

				arg_23_1.text_.text = var_26_16
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061006", "story_v_out_117061.awb") ~= 0 then
					local var_26_20 = manager.audio:GetVoiceLength("story_v_out_117061", "117061006", "story_v_out_117061.awb") / 1000

					if var_26_20 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_12
					end

					if var_26_15.prefab_name ~= "" and arg_23_1.actors_[var_26_15.prefab_name] ~= nil then
						local var_26_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_15.prefab_name].transform, "story_v_out_117061", "117061006", "story_v_out_117061.awb")

						arg_23_1:RecordAudio("117061006", var_26_21)
						arg_23_1:RecordAudio("117061006", var_26_21)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_117061", "117061006", "story_v_out_117061.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_117061", "117061006", "story_v_out_117061.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_13, arg_23_1.talkMaxDuration)

			if var_26_12 <= arg_23_1.time_ and arg_23_1.time_ < var_26_12 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_12) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_12 + var_26_22 and arg_23_1.time_ < var_26_12 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play117061007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117061007
		arg_27_1.duration_ = 2.9

		local var_27_0 = {
			zh = 1.8,
			ja = 2.9
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
				arg_27_0:Play117061008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1132"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps1132 == nil then
				arg_27_1.var_.actorSpriteComps1132 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps1132 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 1, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps1132 then
				local var_30_5 = 1

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps1132 = nil
			end

			local var_30_6 = arg_27_1.actors_["1033"]
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 == nil then
				arg_27_1.var_.actorSpriteComps1033 = var_30_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_8 = 0.2

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8

				if arg_27_1.var_.actorSpriteComps1033 then
					for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_30_5 then
							local var_30_10 = Mathf.Lerp(iter_30_5.color.r, 0.5, var_30_9)

							iter_30_5.color = Color.New(var_30_10, var_30_10, var_30_10)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 then
				local var_30_11 = 0.5

				for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_30_7 then
						iter_30_7.color = Color.New(var_30_11, var_30_11, var_30_11)
					end
				end

				arg_27_1.var_.actorSpriteComps1033 = nil
			end

			local var_30_12 = 0
			local var_30_13 = 0.275

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[61].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(117061007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 11
				local var_30_18 = utf8.len(var_30_16)
				local var_30_19 = var_30_17 <= 0 and var_30_13 or var_30_13 * (var_30_18 / var_30_17)

				if var_30_19 > 0 and var_30_13 < var_30_19 then
					arg_27_1.talkMaxDuration = var_30_19

					if var_30_19 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_12
					end
				end

				arg_27_1.text_.text = var_30_16
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061007", "story_v_out_117061.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_117061", "117061007", "story_v_out_117061.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_117061", "117061007", "story_v_out_117061.awb")

						arg_27_1:RecordAudio("117061007", var_30_21)
						arg_27_1:RecordAudio("117061007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_117061", "117061007", "story_v_out_117061.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_117061", "117061007", "story_v_out_117061.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_13, arg_27_1.talkMaxDuration)

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_12) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_12 + var_30_22 and arg_27_1.time_ < var_30_12 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play117061008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117061008
		arg_31_1.duration_ = 5.5

		local var_31_0 = {
			zh = 4.666,
			ja = 5.5
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
				arg_31_0:Play117061009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1132"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.actorSpriteComps1132 == nil then
				arg_31_1.var_.actorSpriteComps1132 = var_34_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.actorSpriteComps1132 then
					for iter_34_0, iter_34_1 in pairs(arg_31_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_34_1 then
							local var_34_4 = Mathf.Lerp(iter_34_1.color.r, 0.5, var_34_3)

							iter_34_1.color = Color.New(var_34_4, var_34_4, var_34_4)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.actorSpriteComps1132 then
				local var_34_5 = 0.5

				for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_34_3 then
						iter_34_3.color = Color.New(var_34_5, var_34_5, var_34_5)
					end
				end

				arg_31_1.var_.actorSpriteComps1132 = nil
			end

			local var_34_6 = arg_31_1.actors_["1033"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 == nil then
				arg_31_1.var_.actorSpriteComps1033 = var_34_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_8 = 0.2

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.actorSpriteComps1033 then
					for iter_34_4, iter_34_5 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_34_5 then
							local var_34_10 = Mathf.Lerp(iter_34_5.color.r, 1, var_34_9)

							iter_34_5.color = Color.New(var_34_10, var_34_10, var_34_10)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 then
				local var_34_11 = 1

				for iter_34_6, iter_34_7 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_34_7 then
						iter_34_7.color = Color.New(var_34_11, var_34_11, var_34_11)
					end
				end

				arg_31_1.var_.actorSpriteComps1033 = nil
			end

			local var_34_12 = 0
			local var_34_13 = 0.55

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_14 = arg_31_1:FormatText(StoryNameCfg[236].name)

				arg_31_1.leftNameTxt_.text = var_34_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_15 = arg_31_1:GetWordFromCfg(117061008)
				local var_34_16 = arg_31_1:FormatText(var_34_15.content)

				arg_31_1.text_.text = var_34_16

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_17 = 22
				local var_34_18 = utf8.len(var_34_16)
				local var_34_19 = var_34_17 <= 0 and var_34_13 or var_34_13 * (var_34_18 / var_34_17)

				if var_34_19 > 0 and var_34_13 < var_34_19 then
					arg_31_1.talkMaxDuration = var_34_19

					if var_34_19 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_12
					end
				end

				arg_31_1.text_.text = var_34_16
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061008", "story_v_out_117061.awb") ~= 0 then
					local var_34_20 = manager.audio:GetVoiceLength("story_v_out_117061", "117061008", "story_v_out_117061.awb") / 1000

					if var_34_20 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_12
					end

					if var_34_15.prefab_name ~= "" and arg_31_1.actors_[var_34_15.prefab_name] ~= nil then
						local var_34_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_15.prefab_name].transform, "story_v_out_117061", "117061008", "story_v_out_117061.awb")

						arg_31_1:RecordAudio("117061008", var_34_21)
						arg_31_1:RecordAudio("117061008", var_34_21)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_117061", "117061008", "story_v_out_117061.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_117061", "117061008", "story_v_out_117061.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_22 = math.max(var_34_13, arg_31_1.talkMaxDuration)

			if var_34_12 <= arg_31_1.time_ and arg_31_1.time_ < var_34_12 + var_34_22 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_12) / var_34_22

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_12 + var_34_22 and arg_31_1.time_ < var_34_12 + var_34_22 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play117061009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 117061009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play117061010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1033"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 == nil then
				arg_35_1.var_.actorSpriteComps1033 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps1033 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 0.5, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 then
				local var_38_5 = 0.5

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps1033 = nil
			end

			local var_38_6 = 0
			local var_38_7 = 1.45

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(117061009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 58
				local var_38_11 = utf8.len(var_38_9)
				local var_38_12 = var_38_10 <= 0 and var_38_7 or var_38_7 * (var_38_11 / var_38_10)

				if var_38_12 > 0 and var_38_7 < var_38_12 then
					arg_35_1.talkMaxDuration = var_38_12

					if var_38_12 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_9
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_13 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_13 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_13

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_13 and arg_35_1.time_ < var_38_6 + var_38_13 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play117061010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 117061010
		arg_39_1.duration_ = 7.9

		local var_39_0 = {
			zh = 4.3,
			ja = 7.9
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
				arg_39_0:Play117061011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1033"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.actorSpriteComps1033 == nil then
				arg_39_1.var_.actorSpriteComps1033 = var_42_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.actorSpriteComps1033 then
					for iter_42_0, iter_42_1 in pairs(arg_39_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_42_1 then
							local var_42_4 = Mathf.Lerp(iter_42_1.color.r, 1, var_42_3)

							iter_42_1.color = Color.New(var_42_4, var_42_4, var_42_4)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.actorSpriteComps1033 then
				local var_42_5 = 1

				for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_42_3 then
						iter_42_3.color = Color.New(var_42_5, var_42_5, var_42_5)
					end
				end

				arg_39_1.var_.actorSpriteComps1033 = nil
			end

			local var_42_6 = 0
			local var_42_7 = 0.575

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[236].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(117061010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061010", "story_v_out_117061.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_117061", "117061010", "story_v_out_117061.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_117061", "117061010", "story_v_out_117061.awb")

						arg_39_1:RecordAudio("117061010", var_42_15)
						arg_39_1:RecordAudio("117061010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_117061", "117061010", "story_v_out_117061.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_117061", "117061010", "story_v_out_117061.awb")
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
	Play117061011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 117061011
		arg_43_1.duration_ = 7.433

		local var_43_0 = {
			zh = 7.433,
			ja = 6.2
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
				arg_43_0:Play117061012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1132"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps1132 == nil then
				arg_43_1.var_.actorSpriteComps1132 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps1132 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 1, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps1132 then
				local var_46_5 = 1

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps1132 = nil
			end

			local var_46_6 = arg_43_1.actors_["1033"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.actorSpriteComps1033 == nil then
				arg_43_1.var_.actorSpriteComps1033 = var_46_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_8 = 0.2

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.actorSpriteComps1033 then
					for iter_46_4, iter_46_5 in pairs(arg_43_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_46_5 then
							local var_46_10 = Mathf.Lerp(iter_46_5.color.r, 0.5, var_46_9)

							iter_46_5.color = Color.New(var_46_10, var_46_10, var_46_10)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps1033 then
				local var_46_11 = 0.5

				for iter_46_6, iter_46_7 in pairs(arg_43_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_46_7 then
						iter_46_7.color = Color.New(var_46_11, var_46_11, var_46_11)
					end
				end

				arg_43_1.var_.actorSpriteComps1033 = nil
			end

			local var_46_12 = 0
			local var_46_13 = 1

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_14 = arg_43_1:FormatText(StoryNameCfg[61].name)

				arg_43_1.leftNameTxt_.text = var_46_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_15 = arg_43_1:GetWordFromCfg(117061011)
				local var_46_16 = arg_43_1:FormatText(var_46_15.content)

				arg_43_1.text_.text = var_46_16

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_17 = 40
				local var_46_18 = utf8.len(var_46_16)
				local var_46_19 = var_46_17 <= 0 and var_46_13 or var_46_13 * (var_46_18 / var_46_17)

				if var_46_19 > 0 and var_46_13 < var_46_19 then
					arg_43_1.talkMaxDuration = var_46_19

					if var_46_19 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_12
					end
				end

				arg_43_1.text_.text = var_46_16
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117061", "117061011", "story_v_out_117061.awb") ~= 0 then
					local var_46_20 = manager.audio:GetVoiceLength("story_v_out_117061", "117061011", "story_v_out_117061.awb") / 1000

					if var_46_20 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_12
					end

					if var_46_15.prefab_name ~= "" and arg_43_1.actors_[var_46_15.prefab_name] ~= nil then
						local var_46_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_15.prefab_name].transform, "story_v_out_117061", "117061011", "story_v_out_117061.awb")

						arg_43_1:RecordAudio("117061011", var_46_21)
						arg_43_1:RecordAudio("117061011", var_46_21)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_117061", "117061011", "story_v_out_117061.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_117061", "117061011", "story_v_out_117061.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_13, arg_43_1.talkMaxDuration)

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_12) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_12 + var_46_22 and arg_43_1.time_ < var_46_12 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play117061012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 117061012
		arg_47_1.duration_ = 6

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
			arg_47_1.auto_ = false
		end

		function arg_47_1.playNext_(arg_49_0)
			arg_47_1.onStoryFinished_()
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1132"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				local var_50_2 = var_50_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_50_2 then
					arg_47_1.var_.alphaOldValue1132 = var_50_2.alpha
					arg_47_1.var_.characterEffect1132 = var_50_2
				end

				arg_47_1.var_.alphaOldValue1132 = 1
			end

			local var_50_3 = 0.333333333333333

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_3 then
				local var_50_4 = (arg_47_1.time_ - var_50_1) / var_50_3
				local var_50_5 = Mathf.Lerp(arg_47_1.var_.alphaOldValue1132, 0, var_50_4)

				if arg_47_1.var_.characterEffect1132 then
					arg_47_1.var_.characterEffect1132.alpha = var_50_5
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_3 and arg_47_1.time_ < var_50_1 + var_50_3 + arg_50_0 and arg_47_1.var_.characterEffect1132 then
				arg_47_1.var_.characterEffect1132.alpha = 0
			end

			local var_50_6 = arg_47_1.actors_["1033"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 then
				local var_50_8 = var_50_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_50_8 then
					arg_47_1.var_.alphaOldValue1033 = var_50_8.alpha
					arg_47_1.var_.characterEffect1033 = var_50_8
				end

				arg_47_1.var_.alphaOldValue1033 = 1
			end

			local var_50_9 = 0.333333333333333

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_7) / var_50_9
				local var_50_11 = Mathf.Lerp(arg_47_1.var_.alphaOldValue1033, 0, var_50_10)

				if arg_47_1.var_.characterEffect1033 then
					arg_47_1.var_.characterEffect1033.alpha = var_50_11
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_9 and arg_47_1.time_ < var_50_7 + var_50_9 + arg_50_0 and arg_47_1.var_.characterEffect1033 then
				arg_47_1.var_.characterEffect1033.alpha = 0
			end

			local var_50_12 = manager.ui.mainCamera.transform
			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1.var_.shakeOldPos = var_50_12.localPosition
			end

			local var_50_14 = 1

			if var_50_13 <= arg_47_1.time_ and arg_47_1.time_ < var_50_13 + var_50_14 then
				local var_50_15 = (arg_47_1.time_ - var_50_13) / 0.066
				local var_50_16, var_50_17 = math.modf(var_50_15)

				var_50_12.localPosition = Vector3.New(var_50_17 * 0.13, var_50_17 * 0.13, var_50_17 * 0.13) + arg_47_1.var_.shakeOldPos
			end

			if arg_47_1.time_ >= var_50_13 + var_50_14 and arg_47_1.time_ < var_50_13 + var_50_14 + arg_50_0 then
				var_50_12.localPosition = arg_47_1.var_.shakeOldPos
			end

			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1.allBtn_.enabled = false
			end

			local var_50_19 = 1

			if arg_47_1.time_ >= var_50_18 + var_50_19 and arg_47_1.time_ < var_50_18 + var_50_19 + arg_50_0 then
				arg_47_1.allBtn_.enabled = true
			end

			local var_50_20 = 1
			local var_50_21 = 1

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				local var_50_22 = "play"
				local var_50_23 = "effect"

				arg_47_1:AudioAction(var_50_22, var_50_23, "se_story_17", "se_story_17_fireblast", "")
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_24 = 1
			local var_50_25 = 0.725

			if var_50_24 < arg_47_1.time_ and arg_47_1.time_ <= var_50_24 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_26 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_26:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_27 = arg_47_1:GetWordFromCfg(117061012)
				local var_50_28 = arg_47_1:FormatText(var_50_27.content)

				arg_47_1.text_.text = var_50_28

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_29 = 29
				local var_50_30 = utf8.len(var_50_28)
				local var_50_31 = var_50_29 <= 0 and var_50_25 or var_50_25 * (var_50_30 / var_50_29)

				if var_50_31 > 0 and var_50_25 < var_50_31 then
					arg_47_1.talkMaxDuration = var_50_31
					var_50_24 = var_50_24 + 0.3

					if var_50_31 + var_50_24 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_31 + var_50_24
					end
				end

				arg_47_1.text_.text = var_50_28
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_32 = var_50_24 + 0.3
			local var_50_33 = math.max(var_50_25, arg_47_1.talkMaxDuration)

			if var_50_32 <= arg_47_1.time_ and arg_47_1.time_ < var_50_32 + var_50_33 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_32) / var_50_33

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_32 + var_50_33 and arg_47_1.time_ < var_50_32 + var_50_33 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/A02d"
	},
	voices = {
		"story_v_out_117061.awb"
	}
}
