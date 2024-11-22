return {
	Play410041001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410041001
		arg_1_1.duration_ = 5.865999999999

		local var_1_0 = {
			zh = 2.999999999999,
			ja = 5.865999999999
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
				arg_1_0:Play410041002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J02f"

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
				local var_4_5 = arg_1_1.bgs_.J02f

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
					if iter_4_0 ~= "J02f" then
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

			local var_4_22 = "10064"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10064"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10064 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10064", 3)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_3" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(0, -570, 192.5)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10064, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_4_31 = arg_1_1.actors_["10064"]
			local var_4_32 = 2

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps10064 == nil then
				arg_1_1.var_.actorSpriteComps10064 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.034

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps10064 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps10064 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps10064 = nil
			end

			local var_4_37 = 0

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				arg_1_1.screenFilterGo_:SetActive(true)

				arg_1_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_4_38 = 0.0166666666666667

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				arg_1_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_4_39)
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 then
				arg_1_1.screenFilterEffect_.weight = 1
			end

			local var_4_40 = 0
			local var_4_41 = 1

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				local var_4_42 = "play"
				local var_4_43 = "music"

				arg_1_1:AudioAction(var_4_42, var_4_43, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_44 = 1.56666666666667
			local var_4_45 = 1

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "music"

				arg_1_1:AudioAction(var_4_46, var_4_47, "bgm_activity_2_0_story_oldtown", "bgm_activity_2_0_story_oldtown", "bgm_activity_2_0_story_oldtown.awb")
			end

			local var_4_48 = 1.999999999999
			local var_4_49 = 1

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				local var_4_50 = "play"
				local var_4_51 = "effect"

				arg_1_1:AudioAction(var_4_50, var_4_51, "se_story_side_1094", "se_story_1094_gun", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_52 = 1.999999999999
			local var_4_53 = 0.075

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_54 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_54:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_55 = arg_1_1:FormatText(StoryNameCfg[584].name)

				arg_1_1.leftNameTxt_.text = var_4_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_56 = arg_1_1:GetWordFromCfg(410041001)
				local var_4_57 = arg_1_1:FormatText(var_4_56.content)

				arg_1_1.text_.text = var_4_57

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_58 = 3
				local var_4_59 = utf8.len(var_4_57)
				local var_4_60 = var_4_58 <= 0 and var_4_53 or var_4_53 * (var_4_59 / var_4_58)

				if var_4_60 > 0 and var_4_53 < var_4_60 then
					arg_1_1.talkMaxDuration = var_4_60
					var_4_52 = var_4_52 + 0.3

					if var_4_60 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_52
					end
				end

				arg_1_1.text_.text = var_4_57
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041001", "story_v_out_410041.awb") ~= 0 then
					local var_4_61 = manager.audio:GetVoiceLength("story_v_out_410041", "410041001", "story_v_out_410041.awb") / 1000

					if var_4_61 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_52
					end

					if var_4_56.prefab_name ~= "" and arg_1_1.actors_[var_4_56.prefab_name] ~= nil then
						local var_4_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_56.prefab_name].transform, "story_v_out_410041", "410041001", "story_v_out_410041.awb")

						arg_1_1:RecordAudio("410041001", var_4_62)
						arg_1_1:RecordAudio("410041001", var_4_62)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410041", "410041001", "story_v_out_410041.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410041", "410041001", "story_v_out_410041.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_63 = var_4_52 + 0.3
			local var_4_64 = math.max(var_4_53, arg_1_1.talkMaxDuration)

			if var_4_63 <= arg_1_1.time_ and arg_1_1.time_ < var_4_63 + var_4_64 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_63) / var_4_64

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_63 + var_4_64 and arg_1_1.time_ < var_4_63 + var_4_64 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410041002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410041002
		arg_7_1.duration_ = 5.066

		local var_7_0 = {
			zh = 2.433,
			ja = 5.066
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
				arg_7_0:Play410041003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.2

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[584].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(410041002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 8
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041002", "story_v_out_410041.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_410041", "410041002", "story_v_out_410041.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_410041", "410041002", "story_v_out_410041.awb")

						arg_7_1:RecordAudio("410041002", var_10_9)
						arg_7_1:RecordAudio("410041002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410041", "410041002", "story_v_out_410041.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410041", "410041002", "story_v_out_410041.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410041003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410041003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410041004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10064"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos10064 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10064", 7)

				local var_14_2 = var_14_0.childCount

				for iter_14_0 = 0, var_14_2 - 1 do
					local var_14_3 = var_14_0:GetChild(iter_14_0)

					if var_14_3.name == "split_3" or not string.find(var_14_3.name, "split") then
						var_14_3.gameObject:SetActive(true)
					else
						var_14_3.gameObject:SetActive(false)
					end
				end
			end

			local var_14_4 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_4 then
				local var_14_5 = (arg_11_1.time_ - var_14_1) / var_14_4
				local var_14_6 = Vector3.New(0, -2000, 192.5)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10064, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_14_7 = 0
			local var_14_8 = 1.175

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(410041003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 47
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_8 or var_14_8 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_8 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_7
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_8, arg_11_1.talkMaxDuration)

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_7) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_7 + var_14_14 and arg_11_1.time_ < var_14_7 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410041004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410041004
		arg_15_1.duration_ = 4.166

		local var_15_0 = {
			zh = 1.9,
			ja = 4.166
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
				arg_15_0:Play410041005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10064"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos10064 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10064", 3)

				local var_18_2 = var_18_0.childCount

				for iter_18_0 = 0, var_18_2 - 1 do
					local var_18_3 = var_18_0:GetChild(iter_18_0)

					if var_18_3.name == "split_3" or not string.find(var_18_3.name, "split") then
						var_18_3.gameObject:SetActive(true)
					else
						var_18_3.gameObject:SetActive(false)
					end
				end
			end

			local var_18_4 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_4 then
				local var_18_5 = (arg_15_1.time_ - var_18_1) / var_18_4
				local var_18_6 = Vector3.New(0, -570, 192.5)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10064, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_18_7 = arg_15_1.actors_["10064"]
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps10064 == nil then
				arg_15_1.var_.actorSpriteComps10064 = var_18_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_9 = 0.034

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_8) / var_18_9

				if arg_15_1.var_.actorSpriteComps10064 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_18_2 then
							local var_18_11 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_10)

							iter_18_2.color = Color.New(var_18_11, var_18_11, var_18_11)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_8 + var_18_9 and arg_15_1.time_ < var_18_8 + var_18_9 + arg_18_0 and arg_15_1.var_.actorSpriteComps10064 then
				local var_18_12 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_12, var_18_12, var_18_12)
					end
				end

				arg_15_1.var_.actorSpriteComps10064 = nil
			end

			local var_18_13 = 0
			local var_18_14 = 0.125

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_15 = arg_15_1:FormatText(StoryNameCfg[584].name)

				arg_15_1.leftNameTxt_.text = var_18_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_16 = arg_15_1:GetWordFromCfg(410041004)
				local var_18_17 = arg_15_1:FormatText(var_18_16.content)

				arg_15_1.text_.text = var_18_17

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_18 = 5
				local var_18_19 = utf8.len(var_18_17)
				local var_18_20 = var_18_18 <= 0 and var_18_14 or var_18_14 * (var_18_19 / var_18_18)

				if var_18_20 > 0 and var_18_14 < var_18_20 then
					arg_15_1.talkMaxDuration = var_18_20

					if var_18_20 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_13
					end
				end

				arg_15_1.text_.text = var_18_17
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041004", "story_v_out_410041.awb") ~= 0 then
					local var_18_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041004", "story_v_out_410041.awb") / 1000

					if var_18_21 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_13
					end

					if var_18_16.prefab_name ~= "" and arg_15_1.actors_[var_18_16.prefab_name] ~= nil then
						local var_18_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_16.prefab_name].transform, "story_v_out_410041", "410041004", "story_v_out_410041.awb")

						arg_15_1:RecordAudio("410041004", var_18_22)
						arg_15_1:RecordAudio("410041004", var_18_22)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410041", "410041004", "story_v_out_410041.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410041", "410041004", "story_v_out_410041.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_23 = math.max(var_18_14, arg_15_1.talkMaxDuration)

			if var_18_13 <= arg_15_1.time_ and arg_15_1.time_ < var_18_13 + var_18_23 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_13) / var_18_23

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_13 + var_18_23 and arg_15_1.time_ < var_18_13 + var_18_23 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410041005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410041005
		arg_19_1.duration_ = 3

		local var_19_0 = {
			zh = 2.233,
			ja = 3
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
				arg_19_0:Play410041006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10064"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10064 == nil then
				arg_19_1.var_.actorSpriteComps10064 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10064 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10064 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10064 = nil
			end

			local var_22_6 = 0
			local var_22_7 = 0.25

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[595].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1012_split_3")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(410041005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041005", "story_v_out_410041.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_410041", "410041005", "story_v_out_410041.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_410041", "410041005", "story_v_out_410041.awb")

						arg_19_1:RecordAudio("410041005", var_22_15)
						arg_19_1:RecordAudio("410041005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410041", "410041005", "story_v_out_410041.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410041", "410041005", "story_v_out_410041.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410041006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410041006
		arg_23_1.duration_ = 9.3

		local var_23_0 = {
			zh = 2.1,
			ja = 9.3
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
				arg_23_0:Play410041007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10064"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10064 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10064", 3)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "split_3" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(0, -570, 192.5)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10064, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_26_7 = arg_23_1.actors_["10064"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps10064 == nil then
				arg_23_1.var_.actorSpriteComps10064 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps10064 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 1, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps10064 then
				local var_26_12 = 1

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps10064 = nil
			end

			local var_26_13 = 0
			local var_26_14 = 0.3

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_15 = arg_23_1:FormatText(StoryNameCfg[584].name)

				arg_23_1.leftNameTxt_.text = var_26_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_16 = arg_23_1:GetWordFromCfg(410041006)
				local var_26_17 = arg_23_1:FormatText(var_26_16.content)

				arg_23_1.text_.text = var_26_17

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_18 = 12
				local var_26_19 = utf8.len(var_26_17)
				local var_26_20 = var_26_18 <= 0 and var_26_14 or var_26_14 * (var_26_19 / var_26_18)

				if var_26_20 > 0 and var_26_14 < var_26_20 then
					arg_23_1.talkMaxDuration = var_26_20

					if var_26_20 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_13
					end
				end

				arg_23_1.text_.text = var_26_17
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041006", "story_v_out_410041.awb") ~= 0 then
					local var_26_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041006", "story_v_out_410041.awb") / 1000

					if var_26_21 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_13
					end

					if var_26_16.prefab_name ~= "" and arg_23_1.actors_[var_26_16.prefab_name] ~= nil then
						local var_26_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_16.prefab_name].transform, "story_v_out_410041", "410041006", "story_v_out_410041.awb")

						arg_23_1:RecordAudio("410041006", var_26_22)
						arg_23_1:RecordAudio("410041006", var_26_22)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410041", "410041006", "story_v_out_410041.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410041", "410041006", "story_v_out_410041.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_23 = math.max(var_26_14, arg_23_1.talkMaxDuration)

			if var_26_13 <= arg_23_1.time_ and arg_23_1.time_ < var_26_13 + var_26_23 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_13) / var_26_23

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_13 + var_26_23 and arg_23_1.time_ < var_26_13 + var_26_23 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410041007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410041007
		arg_27_1.duration_ = 11.033

		local var_27_0 = {
			zh = 4.466,
			ja = 11.033
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
				arg_27_0:Play410041008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10064"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps10064 == nil then
				arg_27_1.var_.actorSpriteComps10064 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps10064 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10064 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps10064 = nil
			end

			local var_30_6 = 0
			local var_30_7 = 0.55

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[595].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1012_split_3")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(410041007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041007", "story_v_out_410041.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_410041", "410041007", "story_v_out_410041.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_410041", "410041007", "story_v_out_410041.awb")

						arg_27_1:RecordAudio("410041007", var_30_15)
						arg_27_1:RecordAudio("410041007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410041", "410041007", "story_v_out_410041.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410041", "410041007", "story_v_out_410041.awb")
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
	Play410041008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410041008
		arg_31_1.duration_ = 2.366

		local var_31_0 = {
			zh = 0.999999999999,
			ja = 2.366
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
				arg_31_0:Play410041009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10064"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10064 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10064", 3)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_3" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -570, 192.5)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10064, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_34_7 = arg_31_1.actors_["10064"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps10064 == nil then
				arg_31_1.var_.actorSpriteComps10064 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps10064 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps10064 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps10064 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.075

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[584].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410041008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 3
				local var_34_19 = utf8.len(var_34_17)
				local var_34_20 = var_34_18 <= 0 and var_34_14 or var_34_14 * (var_34_19 / var_34_18)

				if var_34_20 > 0 and var_34_14 < var_34_20 then
					arg_31_1.talkMaxDuration = var_34_20

					if var_34_20 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_13
					end
				end

				arg_31_1.text_.text = var_34_17
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041008", "story_v_out_410041.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041008", "story_v_out_410041.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410041", "410041008", "story_v_out_410041.awb")

						arg_31_1:RecordAudio("410041008", var_34_22)
						arg_31_1:RecordAudio("410041008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410041", "410041008", "story_v_out_410041.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410041", "410041008", "story_v_out_410041.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_23 = math.max(var_34_14, arg_31_1.talkMaxDuration)

			if var_34_13 <= arg_31_1.time_ and arg_31_1.time_ < var_34_13 + var_34_23 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_13) / var_34_23

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_13 + var_34_23 and arg_31_1.time_ < var_34_13 + var_34_23 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410041009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410041009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play410041010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10064"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos10064 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10064", 7)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_3" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(0, -2000, 192.5)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10064, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_38_7 = 0
			local var_38_8 = 1.025

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(410041009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 41
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_8 or var_38_8 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_8 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_7 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_7
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_8, arg_35_1.talkMaxDuration)

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_7) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_7 + var_38_14 and arg_35_1.time_ < var_38_7 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410041010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410041010
		arg_39_1.duration_ = 4.666

		local var_39_0 = {
			zh = 2.5,
			ja = 4.666
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
				arg_39_0:Play410041011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10064"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10064 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10064", 3)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_3" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(0, -570, 192.5)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10064, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_42_7 = arg_39_1.actors_["10064"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps10064 == nil then
				arg_39_1.var_.actorSpriteComps10064 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps10064 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps10064 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps10064 = nil
			end

			local var_42_13 = 0
			local var_42_14 = 0.125

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_15 = arg_39_1:FormatText(StoryNameCfg[584].name)

				arg_39_1.leftNameTxt_.text = var_42_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_16 = arg_39_1:GetWordFromCfg(410041010)
				local var_42_17 = arg_39_1:FormatText(var_42_16.content)

				arg_39_1.text_.text = var_42_17

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_18 = 5
				local var_42_19 = utf8.len(var_42_17)
				local var_42_20 = var_42_18 <= 0 and var_42_14 or var_42_14 * (var_42_19 / var_42_18)

				if var_42_20 > 0 and var_42_14 < var_42_20 then
					arg_39_1.talkMaxDuration = var_42_20

					if var_42_20 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_13
					end
				end

				arg_39_1.text_.text = var_42_17
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041010", "story_v_out_410041.awb") ~= 0 then
					local var_42_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041010", "story_v_out_410041.awb") / 1000

					if var_42_21 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_13
					end

					if var_42_16.prefab_name ~= "" and arg_39_1.actors_[var_42_16.prefab_name] ~= nil then
						local var_42_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_16.prefab_name].transform, "story_v_out_410041", "410041010", "story_v_out_410041.awb")

						arg_39_1:RecordAudio("410041010", var_42_22)
						arg_39_1:RecordAudio("410041010", var_42_22)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410041", "410041010", "story_v_out_410041.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410041", "410041010", "story_v_out_410041.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_23 = math.max(var_42_14, arg_39_1.talkMaxDuration)

			if var_42_13 <= arg_39_1.time_ and arg_39_1.time_ < var_42_13 + var_42_23 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_13) / var_42_23

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_13 + var_42_23 and arg_39_1.time_ < var_42_13 + var_42_23 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410041011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410041011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play410041012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10064"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10064 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10064", 7)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "split_3" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(0, -2000, 192.5)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10064, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_46_7 = 0
			local var_46_8 = 1

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(410041011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 40
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_8 or var_46_8 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_8 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_7 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_7
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_8, arg_43_1.talkMaxDuration)

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_7) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_7 + var_46_14 and arg_43_1.time_ < var_46_7 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410041012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410041012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play410041013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.375

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(410041012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 55
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410041013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410041013
		arg_51_1.duration_ = 2.5

		local var_51_0 = {
			zh = 1.166,
			ja = 2.5
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
				arg_51_0:Play410041014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10064"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10064 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10064", 3)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "split_3" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(0, -570, 192.5)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10064, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_54_7 = arg_51_1.actors_["10064"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps10064 == nil then
				arg_51_1.var_.actorSpriteComps10064 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps10064 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps10064 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps10064 = nil
			end

			local var_54_13 = 0
			local var_54_14 = 0.125

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_15 = arg_51_1:FormatText(StoryNameCfg[584].name)

				arg_51_1.leftNameTxt_.text = var_54_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_16 = arg_51_1:GetWordFromCfg(410041013)
				local var_54_17 = arg_51_1:FormatText(var_54_16.content)

				arg_51_1.text_.text = var_54_17

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_18 = 5
				local var_54_19 = utf8.len(var_54_17)
				local var_54_20 = var_54_18 <= 0 and var_54_14 or var_54_14 * (var_54_19 / var_54_18)

				if var_54_20 > 0 and var_54_14 < var_54_20 then
					arg_51_1.talkMaxDuration = var_54_20

					if var_54_20 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_13
					end
				end

				arg_51_1.text_.text = var_54_17
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041013", "story_v_out_410041.awb") ~= 0 then
					local var_54_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041013", "story_v_out_410041.awb") / 1000

					if var_54_21 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_21 + var_54_13
					end

					if var_54_16.prefab_name ~= "" and arg_51_1.actors_[var_54_16.prefab_name] ~= nil then
						local var_54_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_16.prefab_name].transform, "story_v_out_410041", "410041013", "story_v_out_410041.awb")

						arg_51_1:RecordAudio("410041013", var_54_22)
						arg_51_1:RecordAudio("410041013", var_54_22)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410041", "410041013", "story_v_out_410041.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410041", "410041013", "story_v_out_410041.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_23 = math.max(var_54_14, arg_51_1.talkMaxDuration)

			if var_54_13 <= arg_51_1.time_ and arg_51_1.time_ < var_54_13 + var_54_23 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_13) / var_54_23

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_13 + var_54_23 and arg_51_1.time_ < var_54_13 + var_54_23 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410041014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410041014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410041015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10064"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10064 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10064", 7)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "split_3" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(0, -2000, 192.5)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10064, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_58_7 = 0
			local var_58_8 = 1

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 then
				local var_58_9 = "play"
				local var_58_10 = "effect"

				arg_55_1:AudioAction(var_58_9, var_58_10, "se_story_120_00", "se_story_120_00_gunshot", "")
			end

			local var_58_11 = 0
			local var_58_12 = 1.325

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_13 = arg_55_1:GetWordFromCfg(410041014)
				local var_58_14 = arg_55_1:FormatText(var_58_13.content)

				arg_55_1.text_.text = var_58_14

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_15 = 53
				local var_58_16 = utf8.len(var_58_14)
				local var_58_17 = var_58_15 <= 0 and var_58_12 or var_58_12 * (var_58_16 / var_58_15)

				if var_58_17 > 0 and var_58_12 < var_58_17 then
					arg_55_1.talkMaxDuration = var_58_17

					if var_58_17 + var_58_11 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_17 + var_58_11
					end
				end

				arg_55_1.text_.text = var_58_14
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_18 = math.max(var_58_12, arg_55_1.talkMaxDuration)

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_18 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_11) / var_58_18

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_11 + var_58_18 and arg_55_1.time_ < var_58_11 + var_58_18 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410041015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410041015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play410041016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.15

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(410041015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 46
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410041016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410041016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play410041017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_2 = "play"
				local var_66_3 = "effect"

				arg_63_1:AudioAction(var_66_2, var_66_3, "se_story_side_1094", "se_story_1094_gun", "")
			end

			local var_66_4 = 0
			local var_66_5 = 1.325

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_6 = arg_63_1:GetWordFromCfg(410041016)
				local var_66_7 = arg_63_1:FormatText(var_66_6.content)

				arg_63_1.text_.text = var_66_7

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_8 = 53
				local var_66_9 = utf8.len(var_66_7)
				local var_66_10 = var_66_8 <= 0 and var_66_5 or var_66_5 * (var_66_9 / var_66_8)

				if var_66_10 > 0 and var_66_5 < var_66_10 then
					arg_63_1.talkMaxDuration = var_66_10

					if var_66_10 + var_66_4 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_10 + var_66_4
					end
				end

				arg_63_1.text_.text = var_66_7
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_11 = math.max(var_66_5, arg_63_1.talkMaxDuration)

			if var_66_4 <= arg_63_1.time_ and arg_63_1.time_ < var_66_4 + var_66_11 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_4) / var_66_11

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_4 + var_66_11 and arg_63_1.time_ < var_66_4 + var_66_11 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410041017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410041017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play410041018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_1 = 0.5

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_1 then
				local var_70_2 = (arg_67_1.time_ - var_70_0) / var_70_1
				local var_70_3 = Color.New(1, 1, 1)

				var_70_3.a = Mathf.Lerp(1, 0, var_70_2)
				arg_67_1.mask_.color = var_70_3
			end

			if arg_67_1.time_ >= var_70_0 + var_70_1 and arg_67_1.time_ < var_70_0 + var_70_1 + arg_70_0 then
				local var_70_4 = Color.New(1, 1, 1)
				local var_70_5 = 0

				arg_67_1.mask_.enabled = false
				var_70_4.a = var_70_5
				arg_67_1.mask_.color = var_70_4
			end

			local var_70_6 = 0
			local var_70_7 = 1.3

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_8 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_8:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_8:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_8:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(410041017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 52
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13
					var_70_6 = var_70_6 + 0.3

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

			local var_70_14 = var_70_6 + 0.3
			local var_70_15 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_14) / var_70_15

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410041018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 410041018
		arg_73_1.duration_ = 2.733

		local var_73_0 = {
			zh = 1.5,
			ja = 2.733
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
				arg_73_0:Play410041019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10064"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos10064 = var_76_0.localPosition
				var_76_0.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("10064", 3)

				local var_76_2 = var_76_0.childCount

				for iter_76_0 = 0, var_76_2 - 1 do
					local var_76_3 = var_76_0:GetChild(iter_76_0)

					if var_76_3.name == "split_3" or not string.find(var_76_3.name, "split") then
						var_76_3.gameObject:SetActive(true)
					else
						var_76_3.gameObject:SetActive(false)
					end
				end
			end

			local var_76_4 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_4 then
				local var_76_5 = (arg_73_1.time_ - var_76_1) / var_76_4
				local var_76_6 = Vector3.New(0, -570, 192.5)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10064, var_76_6, var_76_5)
			end

			if arg_73_1.time_ >= var_76_1 + var_76_4 and arg_73_1.time_ < var_76_1 + var_76_4 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_76_7 = arg_73_1.actors_["10064"]
			local var_76_8 = 0

			if var_76_8 < arg_73_1.time_ and arg_73_1.time_ <= var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps10064 == nil then
				arg_73_1.var_.actorSpriteComps10064 = var_76_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_9 = 0.034

			if var_76_8 <= arg_73_1.time_ and arg_73_1.time_ < var_76_8 + var_76_9 then
				local var_76_10 = (arg_73_1.time_ - var_76_8) / var_76_9

				if arg_73_1.var_.actorSpriteComps10064 then
					for iter_76_1, iter_76_2 in pairs(arg_73_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_76_2 then
							local var_76_11 = Mathf.Lerp(iter_76_2.color.r, 1, var_76_10)

							iter_76_2.color = Color.New(var_76_11, var_76_11, var_76_11)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_8 + var_76_9 and arg_73_1.time_ < var_76_8 + var_76_9 + arg_76_0 and arg_73_1.var_.actorSpriteComps10064 then
				local var_76_12 = 1

				for iter_76_3, iter_76_4 in pairs(arg_73_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_76_4 then
						iter_76_4.color = Color.New(var_76_12, var_76_12, var_76_12)
					end
				end

				arg_73_1.var_.actorSpriteComps10064 = nil
			end

			local var_76_13 = 0
			local var_76_14 = 0.15

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_15 = arg_73_1:FormatText(StoryNameCfg[584].name)

				arg_73_1.leftNameTxt_.text = var_76_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_16 = arg_73_1:GetWordFromCfg(410041018)
				local var_76_17 = arg_73_1:FormatText(var_76_16.content)

				arg_73_1.text_.text = var_76_17

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_18 = 6
				local var_76_19 = utf8.len(var_76_17)
				local var_76_20 = var_76_18 <= 0 and var_76_14 or var_76_14 * (var_76_19 / var_76_18)

				if var_76_20 > 0 and var_76_14 < var_76_20 then
					arg_73_1.talkMaxDuration = var_76_20

					if var_76_20 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_13
					end
				end

				arg_73_1.text_.text = var_76_17
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041018", "story_v_out_410041.awb") ~= 0 then
					local var_76_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041018", "story_v_out_410041.awb") / 1000

					if var_76_21 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_21 + var_76_13
					end

					if var_76_16.prefab_name ~= "" and arg_73_1.actors_[var_76_16.prefab_name] ~= nil then
						local var_76_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_16.prefab_name].transform, "story_v_out_410041", "410041018", "story_v_out_410041.awb")

						arg_73_1:RecordAudio("410041018", var_76_22)
						arg_73_1:RecordAudio("410041018", var_76_22)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_410041", "410041018", "story_v_out_410041.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_410041", "410041018", "story_v_out_410041.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_23 = math.max(var_76_14, arg_73_1.talkMaxDuration)

			if var_76_13 <= arg_73_1.time_ and arg_73_1.time_ < var_76_13 + var_76_23 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_13) / var_76_23

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_13 + var_76_23 and arg_73_1.time_ < var_76_13 + var_76_23 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play410041019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 410041019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play410041020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10064"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10064 = var_80_0.localPosition
				var_80_0.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10064", 7)

				local var_80_2 = var_80_0.childCount

				for iter_80_0 = 0, var_80_2 - 1 do
					local var_80_3 = var_80_0:GetChild(iter_80_0)

					if var_80_3.name == "split_3" or not string.find(var_80_3.name, "split") then
						var_80_3.gameObject:SetActive(true)
					else
						var_80_3.gameObject:SetActive(false)
					end
				end
			end

			local var_80_4 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_1) / var_80_4
				local var_80_6 = Vector3.New(0, -2000, 192.5)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10064, var_80_6, var_80_5)
			end

			if arg_77_1.time_ >= var_80_1 + var_80_4 and arg_77_1.time_ < var_80_1 + var_80_4 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_80_7 = 0
			local var_80_8 = 1.6

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(410041019)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 64
				local var_80_12 = utf8.len(var_80_10)
				local var_80_13 = var_80_11 <= 0 and var_80_8 or var_80_8 * (var_80_12 / var_80_11)

				if var_80_13 > 0 and var_80_8 < var_80_13 then
					arg_77_1.talkMaxDuration = var_80_13

					if var_80_13 + var_80_7 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_7
					end
				end

				arg_77_1.text_.text = var_80_10
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_14 = math.max(var_80_8, arg_77_1.talkMaxDuration)

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_14 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_7) / var_80_14

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_7 + var_80_14 and arg_77_1.time_ < var_80_7 + var_80_14 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play410041020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 410041020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play410041021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_1 = 1

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_1 then
				local var_84_2 = (arg_81_1.time_ - var_84_0) / var_84_1
				local var_84_3 = Color.New(1, 1, 1)

				var_84_3.a = Mathf.Lerp(1, 0, var_84_2)
				arg_81_1.mask_.color = var_84_3
			end

			if arg_81_1.time_ >= var_84_0 + var_84_1 and arg_81_1.time_ < var_84_0 + var_84_1 + arg_84_0 then
				local var_84_4 = Color.New(1, 1, 1)
				local var_84_5 = 0

				arg_81_1.mask_.enabled = false
				var_84_4.a = var_84_5
				arg_81_1.mask_.color = var_84_4
			end

			local var_84_6 = 0
			local var_84_7 = 1

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				local var_84_8 = "play"
				local var_84_9 = "effect"

				arg_81_1:AudioAction(var_84_8, var_84_9, "se_story_side_1094", "se_story_1094_gun", "")
			end

			local var_84_10 = 0
			local var_84_11 = 0.075

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				arg_81_1.dialog_:SetActive(true)

				local var_84_12 = LeanTween.value(arg_81_1.dialog_, 0, 1, 0.3)

				var_84_12:setOnUpdate(LuaHelper.FloatAction(function(arg_85_0)
					arg_81_1.dialogCg_.alpha = arg_85_0
				end))
				var_84_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_81_1.dialog_)
					var_84_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_81_1.duration_ = arg_81_1.duration_ + 0.3

				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_13 = arg_81_1:GetWordFromCfg(410041020)
				local var_84_14 = arg_81_1:FormatText(var_84_13.content)

				arg_81_1.text_.text = var_84_14

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_15 = 3
				local var_84_16 = utf8.len(var_84_14)
				local var_84_17 = var_84_15 <= 0 and var_84_11 or var_84_11 * (var_84_16 / var_84_15)

				if var_84_17 > 0 and var_84_11 < var_84_17 then
					arg_81_1.talkMaxDuration = var_84_17
					var_84_10 = var_84_10 + 0.3

					if var_84_17 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_17 + var_84_10
					end
				end

				arg_81_1.text_.text = var_84_14
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_18 = var_84_10 + 0.3
			local var_84_19 = math.max(var_84_11, arg_81_1.talkMaxDuration)

			if var_84_18 <= arg_81_1.time_ and arg_81_1.time_ < var_84_18 + var_84_19 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_18) / var_84_19

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_18 + var_84_19 and arg_81_1.time_ < var_84_18 + var_84_19 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play410041021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410041021
		arg_87_1.duration_ = 8.999999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play410041022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 2

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				local var_90_1 = manager.ui.mainCamera.transform.localPosition
				local var_90_2 = Vector3.New(0, 0, 10) + Vector3.New(var_90_1.x, var_90_1.y, 0)
				local var_90_3 = arg_87_1.bgs_.J02f

				var_90_3.transform.localPosition = var_90_2
				var_90_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_90_4 = var_90_3:GetComponent("SpriteRenderer")

				if var_90_4 and var_90_4.sprite then
					local var_90_5 = (var_90_3.transform.localPosition - var_90_1).z
					local var_90_6 = manager.ui.mainCameraCom_
					local var_90_7 = 2 * var_90_5 * Mathf.Tan(var_90_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_90_8 = var_90_7 * var_90_6.aspect
					local var_90_9 = var_90_4.sprite.bounds.size.x
					local var_90_10 = var_90_4.sprite.bounds.size.y
					local var_90_11 = var_90_8 / var_90_9
					local var_90_12 = var_90_7 / var_90_10
					local var_90_13 = var_90_12 < var_90_11 and var_90_11 or var_90_12

					var_90_3.transform.localScale = Vector3.New(var_90_13, var_90_13, 0)
				end

				for iter_90_0, iter_90_1 in pairs(arg_87_1.bgs_) do
					if iter_90_0 ~= "J02f" then
						iter_90_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1.mask_.enabled = true
				arg_87_1.mask_.raycastTarget = true

				arg_87_1:SetGaussion(false)
			end

			local var_90_15 = 2

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15
				local var_90_17 = Color.New(0, 0, 0)

				var_90_17.a = Mathf.Lerp(0, 1, var_90_16)
				arg_87_1.mask_.color = var_90_17
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 then
				local var_90_18 = Color.New(0, 0, 0)

				var_90_18.a = 1
				arg_87_1.mask_.color = var_90_18
			end

			local var_90_19 = 2

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.mask_.enabled = true
				arg_87_1.mask_.raycastTarget = true

				arg_87_1:SetGaussion(false)
			end

			local var_90_20 = 2

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_20 then
				local var_90_21 = (arg_87_1.time_ - var_90_19) / var_90_20
				local var_90_22 = Color.New(0, 0, 0)

				var_90_22.a = Mathf.Lerp(1, 0, var_90_21)
				arg_87_1.mask_.color = var_90_22
			end

			if arg_87_1.time_ >= var_90_19 + var_90_20 and arg_87_1.time_ < var_90_19 + var_90_20 + arg_90_0 then
				local var_90_23 = Color.New(0, 0, 0)
				local var_90_24 = 0

				arg_87_1.mask_.enabled = false
				var_90_23.a = var_90_24
				arg_87_1.mask_.color = var_90_23
			end

			if arg_87_1.frameCnt_ <= 1 then
				arg_87_1.dialog_:SetActive(false)
			end

			local var_90_25 = 3.999999999999
			local var_90_26 = 1.35

			if var_90_25 < arg_87_1.time_ and arg_87_1.time_ <= var_90_25 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0

				arg_87_1.dialog_:SetActive(true)

				local var_90_27 = LeanTween.value(arg_87_1.dialog_, 0, 1, 0.3)

				var_90_27:setOnUpdate(LuaHelper.FloatAction(function(arg_91_0)
					arg_87_1.dialogCg_.alpha = arg_91_0
				end))
				var_90_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_87_1.dialog_)
					var_90_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_87_1.duration_ = arg_87_1.duration_ + 0.3

				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_28 = arg_87_1:GetWordFromCfg(410041021)
				local var_90_29 = arg_87_1:FormatText(var_90_28.content)

				arg_87_1.text_.text = var_90_29

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_30 = 54
				local var_90_31 = utf8.len(var_90_29)
				local var_90_32 = var_90_30 <= 0 and var_90_26 or var_90_26 * (var_90_31 / var_90_30)

				if var_90_32 > 0 and var_90_26 < var_90_32 then
					arg_87_1.talkMaxDuration = var_90_32
					var_90_25 = var_90_25 + 0.3

					if var_90_32 + var_90_25 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_32 + var_90_25
					end
				end

				arg_87_1.text_.text = var_90_29
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_33 = var_90_25 + 0.3
			local var_90_34 = math.max(var_90_26, arg_87_1.talkMaxDuration)

			if var_90_33 <= arg_87_1.time_ and arg_87_1.time_ < var_90_33 + var_90_34 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_33) / var_90_34

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_33 + var_90_34 and arg_87_1.time_ < var_90_33 + var_90_34 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410041022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 410041022
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play410041023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "1012"

			if arg_93_1.actors_[var_96_0] == nil then
				local var_96_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_96_0), arg_93_1.canvasGo_.transform)

				var_96_1.transform:SetSiblingIndex(1)

				var_96_1.name = var_96_0
				var_96_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_93_1.actors_[var_96_0] = var_96_1
			end

			local var_96_2 = arg_93_1.actors_["1012"].transform
			local var_96_3 = 0

			if var_96_3 < arg_93_1.time_ and arg_93_1.time_ <= var_96_3 + arg_96_0 then
				arg_93_1.var_.moveOldPos1012 = var_96_2.localPosition
				var_96_2.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("1012", 4)

				local var_96_4 = var_96_2.childCount

				for iter_96_0 = 0, var_96_4 - 1 do
					local var_96_5 = var_96_2:GetChild(iter_96_0)

					if var_96_5.name == "" or not string.find(var_96_5.name, "split") then
						var_96_5.gameObject:SetActive(true)
					else
						var_96_5.gameObject:SetActive(false)
					end
				end
			end

			local var_96_6 = 0.001

			if var_96_3 <= arg_93_1.time_ and arg_93_1.time_ < var_96_3 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_3) / var_96_6
				local var_96_8 = Vector3.New(390, -465, 300)

				var_96_2.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1012, var_96_8, var_96_7)
			end

			if arg_93_1.time_ >= var_96_3 + var_96_6 and arg_93_1.time_ < var_96_3 + var_96_6 + arg_96_0 then
				var_96_2.localPosition = Vector3.New(390, -465, 300)
			end

			local var_96_9 = arg_93_1.actors_["1012"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.actorSpriteComps1012 == nil then
				arg_93_1.var_.actorSpriteComps1012 = var_96_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_11 = 0.034

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.actorSpriteComps1012 then
					for iter_96_1, iter_96_2 in pairs(arg_93_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_96_2 then
							local var_96_13 = Mathf.Lerp(iter_96_2.color.r, 0.5, var_96_12)

							iter_96_2.color = Color.New(var_96_13, var_96_13, var_96_13)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.actorSpriteComps1012 then
				local var_96_14 = 0.5

				for iter_96_3, iter_96_4 in pairs(arg_93_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_96_4 then
						iter_96_4.color = Color.New(var_96_14, var_96_14, var_96_14)
					end
				end

				arg_93_1.var_.actorSpriteComps1012 = nil
			end

			local var_96_15 = arg_93_1.actors_["10064"].transform
			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 then
				arg_93_1.var_.moveOldPos10064 = var_96_15.localPosition
				var_96_15.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("10064", 2)

				local var_96_17 = var_96_15.childCount

				for iter_96_5 = 0, var_96_17 - 1 do
					local var_96_18 = var_96_15:GetChild(iter_96_5)

					if var_96_18.name == "split_3" or not string.find(var_96_18.name, "split") then
						var_96_18.gameObject:SetActive(true)
					else
						var_96_18.gameObject:SetActive(false)
					end
				end
			end

			local var_96_19 = 0.001

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_19 then
				local var_96_20 = (arg_93_1.time_ - var_96_16) / var_96_19
				local var_96_21 = Vector3.New(-390, -570, 192.5)

				var_96_15.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10064, var_96_21, var_96_20)
			end

			if arg_93_1.time_ >= var_96_16 + var_96_19 and arg_93_1.time_ < var_96_16 + var_96_19 + arg_96_0 then
				var_96_15.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_96_22 = arg_93_1.actors_["10064"]
			local var_96_23 = 0

			if var_96_23 < arg_93_1.time_ and arg_93_1.time_ <= var_96_23 + arg_96_0 and arg_93_1.var_.actorSpriteComps10064 == nil then
				arg_93_1.var_.actorSpriteComps10064 = var_96_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_24 = 0.034

			if var_96_23 <= arg_93_1.time_ and arg_93_1.time_ < var_96_23 + var_96_24 then
				local var_96_25 = (arg_93_1.time_ - var_96_23) / var_96_24

				if arg_93_1.var_.actorSpriteComps10064 then
					for iter_96_6, iter_96_7 in pairs(arg_93_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_96_7 then
							local var_96_26 = Mathf.Lerp(iter_96_7.color.r, 0.5, var_96_25)

							iter_96_7.color = Color.New(var_96_26, var_96_26, var_96_26)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_23 + var_96_24 and arg_93_1.time_ < var_96_23 + var_96_24 + arg_96_0 and arg_93_1.var_.actorSpriteComps10064 then
				local var_96_27 = 0.5

				for iter_96_8, iter_96_9 in pairs(arg_93_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_96_9 then
						iter_96_9.color = Color.New(var_96_27, var_96_27, var_96_27)
					end
				end

				arg_93_1.var_.actorSpriteComps10064 = nil
			end

			local var_96_28 = 0
			local var_96_29 = 1.35

			if var_96_28 < arg_93_1.time_ and arg_93_1.time_ <= var_96_28 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_30 = arg_93_1:GetWordFromCfg(410041022)
				local var_96_31 = arg_93_1:FormatText(var_96_30.content)

				arg_93_1.text_.text = var_96_31

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_32 = 54
				local var_96_33 = utf8.len(var_96_31)
				local var_96_34 = var_96_32 <= 0 and var_96_29 or var_96_29 * (var_96_33 / var_96_32)

				if var_96_34 > 0 and var_96_29 < var_96_34 then
					arg_93_1.talkMaxDuration = var_96_34

					if var_96_34 + var_96_28 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_34 + var_96_28
					end
				end

				arg_93_1.text_.text = var_96_31
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_35 = math.max(var_96_29, arg_93_1.talkMaxDuration)

			if var_96_28 <= arg_93_1.time_ and arg_93_1.time_ < var_96_28 + var_96_35 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_28) / var_96_35

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_28 + var_96_35 and arg_93_1.time_ < var_96_28 + var_96_35 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play410041023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 410041023
		arg_97_1.duration_ = 3.8

		local var_97_0 = {
			zh = 2.633,
			ja = 3.8
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
				arg_97_0:Play410041024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1012"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1012 = var_100_0.localPosition
				var_100_0.localScale = Vector3.New(1, 1, 1)

				arg_97_1:CheckSpriteTmpPos("1012", 4)

				local var_100_2 = var_100_0.childCount

				for iter_100_0 = 0, var_100_2 - 1 do
					local var_100_3 = var_100_0:GetChild(iter_100_0)

					if var_100_3.name == "" or not string.find(var_100_3.name, "split") then
						var_100_3.gameObject:SetActive(true)
					else
						var_100_3.gameObject:SetActive(false)
					end
				end
			end

			local var_100_4 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_4 then
				local var_100_5 = (arg_97_1.time_ - var_100_1) / var_100_4
				local var_100_6 = Vector3.New(390, -465, 300)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1012, var_100_6, var_100_5)
			end

			if arg_97_1.time_ >= var_100_1 + var_100_4 and arg_97_1.time_ < var_100_1 + var_100_4 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_100_7 = arg_97_1.actors_["1012"]
			local var_100_8 = 0

			if var_100_8 < arg_97_1.time_ and arg_97_1.time_ <= var_100_8 + arg_100_0 and arg_97_1.var_.actorSpriteComps1012 == nil then
				arg_97_1.var_.actorSpriteComps1012 = var_100_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_9 = 0.034

			if var_100_8 <= arg_97_1.time_ and arg_97_1.time_ < var_100_8 + var_100_9 then
				local var_100_10 = (arg_97_1.time_ - var_100_8) / var_100_9

				if arg_97_1.var_.actorSpriteComps1012 then
					for iter_100_1, iter_100_2 in pairs(arg_97_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_100_2 then
							local var_100_11 = Mathf.Lerp(iter_100_2.color.r, 1, var_100_10)

							iter_100_2.color = Color.New(var_100_11, var_100_11, var_100_11)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_8 + var_100_9 and arg_97_1.time_ < var_100_8 + var_100_9 + arg_100_0 and arg_97_1.var_.actorSpriteComps1012 then
				local var_100_12 = 1

				for iter_100_3, iter_100_4 in pairs(arg_97_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_100_4 then
						iter_100_4.color = Color.New(var_100_12, var_100_12, var_100_12)
					end
				end

				arg_97_1.var_.actorSpriteComps1012 = nil
			end

			local var_100_13 = 0
			local var_100_14 = 0.1

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_15 = arg_97_1:FormatText(StoryNameCfg[595].name)

				arg_97_1.leftNameTxt_.text = var_100_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_16 = arg_97_1:GetWordFromCfg(410041023)
				local var_100_17 = arg_97_1:FormatText(var_100_16.content)

				arg_97_1.text_.text = var_100_17

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_18 = 4
				local var_100_19 = utf8.len(var_100_17)
				local var_100_20 = var_100_18 <= 0 and var_100_14 or var_100_14 * (var_100_19 / var_100_18)

				if var_100_20 > 0 and var_100_14 < var_100_20 then
					arg_97_1.talkMaxDuration = var_100_20

					if var_100_20 + var_100_13 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_20 + var_100_13
					end
				end

				arg_97_1.text_.text = var_100_17
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041023", "story_v_out_410041.awb") ~= 0 then
					local var_100_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041023", "story_v_out_410041.awb") / 1000

					if var_100_21 + var_100_13 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_21 + var_100_13
					end

					if var_100_16.prefab_name ~= "" and arg_97_1.actors_[var_100_16.prefab_name] ~= nil then
						local var_100_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_16.prefab_name].transform, "story_v_out_410041", "410041023", "story_v_out_410041.awb")

						arg_97_1:RecordAudio("410041023", var_100_22)
						arg_97_1:RecordAudio("410041023", var_100_22)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_410041", "410041023", "story_v_out_410041.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_410041", "410041023", "story_v_out_410041.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_23 = math.max(var_100_14, arg_97_1.talkMaxDuration)

			if var_100_13 <= arg_97_1.time_ and arg_97_1.time_ < var_100_13 + var_100_23 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_13) / var_100_23

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_13 + var_100_23 and arg_97_1.time_ < var_100_13 + var_100_23 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play410041024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 410041024
		arg_101_1.duration_ = 2.7

		local var_101_0 = {
			zh = 2.7,
			ja = 2.366
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
				arg_101_0:Play410041025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1012"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1012 = var_104_0.localPosition
				var_104_0.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("1012", 4)

				local var_104_2 = var_104_0.childCount

				for iter_104_0 = 0, var_104_2 - 1 do
					local var_104_3 = var_104_0:GetChild(iter_104_0)

					if var_104_3.name == "" or not string.find(var_104_3.name, "split") then
						var_104_3.gameObject:SetActive(true)
					else
						var_104_3.gameObject:SetActive(false)
					end
				end
			end

			local var_104_4 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_4 then
				local var_104_5 = (arg_101_1.time_ - var_104_1) / var_104_4
				local var_104_6 = Vector3.New(390, -465, 300)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1012, var_104_6, var_104_5)
			end

			if arg_101_1.time_ >= var_104_1 + var_104_4 and arg_101_1.time_ < var_104_1 + var_104_4 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_104_7 = arg_101_1.actors_["1012"]
			local var_104_8 = 0

			if var_104_8 < arg_101_1.time_ and arg_101_1.time_ <= var_104_8 + arg_104_0 and arg_101_1.var_.actorSpriteComps1012 == nil then
				arg_101_1.var_.actorSpriteComps1012 = var_104_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_9 = 0.034

			if var_104_8 <= arg_101_1.time_ and arg_101_1.time_ < var_104_8 + var_104_9 then
				local var_104_10 = (arg_101_1.time_ - var_104_8) / var_104_9

				if arg_101_1.var_.actorSpriteComps1012 then
					for iter_104_1, iter_104_2 in pairs(arg_101_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_104_2 then
							local var_104_11 = Mathf.Lerp(iter_104_2.color.r, 0.5, var_104_10)

							iter_104_2.color = Color.New(var_104_11, var_104_11, var_104_11)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_8 + var_104_9 and arg_101_1.time_ < var_104_8 + var_104_9 + arg_104_0 and arg_101_1.var_.actorSpriteComps1012 then
				local var_104_12 = 0.5

				for iter_104_3, iter_104_4 in pairs(arg_101_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_104_4 then
						iter_104_4.color = Color.New(var_104_12, var_104_12, var_104_12)
					end
				end

				arg_101_1.var_.actorSpriteComps1012 = nil
			end

			local var_104_13 = arg_101_1.actors_["10064"].transform
			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1.var_.moveOldPos10064 = var_104_13.localPosition
				var_104_13.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("10064", 2)

				local var_104_15 = var_104_13.childCount

				for iter_104_5 = 0, var_104_15 - 1 do
					local var_104_16 = var_104_13:GetChild(iter_104_5)

					if var_104_16.name == "split_3" or not string.find(var_104_16.name, "split") then
						var_104_16.gameObject:SetActive(true)
					else
						var_104_16.gameObject:SetActive(false)
					end
				end
			end

			local var_104_17 = 0.001

			if var_104_14 <= arg_101_1.time_ and arg_101_1.time_ < var_104_14 + var_104_17 then
				local var_104_18 = (arg_101_1.time_ - var_104_14) / var_104_17
				local var_104_19 = Vector3.New(-390, -570, 192.5)

				var_104_13.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10064, var_104_19, var_104_18)
			end

			if arg_101_1.time_ >= var_104_14 + var_104_17 and arg_101_1.time_ < var_104_14 + var_104_17 + arg_104_0 then
				var_104_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_104_20 = arg_101_1.actors_["10064"]
			local var_104_21 = 0

			if var_104_21 < arg_101_1.time_ and arg_101_1.time_ <= var_104_21 + arg_104_0 and arg_101_1.var_.actorSpriteComps10064 == nil then
				arg_101_1.var_.actorSpriteComps10064 = var_104_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_22 = 0.034

			if var_104_21 <= arg_101_1.time_ and arg_101_1.time_ < var_104_21 + var_104_22 then
				local var_104_23 = (arg_101_1.time_ - var_104_21) / var_104_22

				if arg_101_1.var_.actorSpriteComps10064 then
					for iter_104_6, iter_104_7 in pairs(arg_101_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_104_7 then
							local var_104_24 = Mathf.Lerp(iter_104_7.color.r, 1, var_104_23)

							iter_104_7.color = Color.New(var_104_24, var_104_24, var_104_24)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_21 + var_104_22 and arg_101_1.time_ < var_104_21 + var_104_22 + arg_104_0 and arg_101_1.var_.actorSpriteComps10064 then
				local var_104_25 = 1

				for iter_104_8, iter_104_9 in pairs(arg_101_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_104_9 then
						iter_104_9.color = Color.New(var_104_25, var_104_25, var_104_25)
					end
				end

				arg_101_1.var_.actorSpriteComps10064 = nil
			end

			local var_104_26 = 0
			local var_104_27 = 0.1

			if var_104_26 < arg_101_1.time_ and arg_101_1.time_ <= var_104_26 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_28 = arg_101_1:FormatText(StoryNameCfg[584].name)

				arg_101_1.leftNameTxt_.text = var_104_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_29 = arg_101_1:GetWordFromCfg(410041024)
				local var_104_30 = arg_101_1:FormatText(var_104_29.content)

				arg_101_1.text_.text = var_104_30

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_31 = 4
				local var_104_32 = utf8.len(var_104_30)
				local var_104_33 = var_104_31 <= 0 and var_104_27 or var_104_27 * (var_104_32 / var_104_31)

				if var_104_33 > 0 and var_104_27 < var_104_33 then
					arg_101_1.talkMaxDuration = var_104_33

					if var_104_33 + var_104_26 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_33 + var_104_26
					end
				end

				arg_101_1.text_.text = var_104_30
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041024", "story_v_out_410041.awb") ~= 0 then
					local var_104_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041024", "story_v_out_410041.awb") / 1000

					if var_104_34 + var_104_26 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_34 + var_104_26
					end

					if var_104_29.prefab_name ~= "" and arg_101_1.actors_[var_104_29.prefab_name] ~= nil then
						local var_104_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_29.prefab_name].transform, "story_v_out_410041", "410041024", "story_v_out_410041.awb")

						arg_101_1:RecordAudio("410041024", var_104_35)
						arg_101_1:RecordAudio("410041024", var_104_35)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_410041", "410041024", "story_v_out_410041.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_410041", "410041024", "story_v_out_410041.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_36 = math.max(var_104_27, arg_101_1.talkMaxDuration)

			if var_104_26 <= arg_101_1.time_ and arg_101_1.time_ < var_104_26 + var_104_36 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_26) / var_104_36

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_26 + var_104_36 and arg_101_1.time_ < var_104_26 + var_104_36 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play410041025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 410041025
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play410041026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10064"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps10064 == nil then
				arg_105_1.var_.actorSpriteComps10064 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.034

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps10064 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 0.5, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps10064 then
				local var_108_5 = 0.5

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps10064 = nil
			end

			local var_108_6 = 0
			local var_108_7 = 0.675

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_8 = arg_105_1:GetWordFromCfg(410041025)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 27
				local var_108_11 = utf8.len(var_108_9)
				local var_108_12 = var_108_10 <= 0 and var_108_7 or var_108_7 * (var_108_11 / var_108_10)

				if var_108_12 > 0 and var_108_7 < var_108_12 then
					arg_105_1.talkMaxDuration = var_108_12

					if var_108_12 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_9
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_13 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_13 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_13

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_13 and arg_105_1.time_ < var_108_6 + var_108_13 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play410041026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 410041026
		arg_109_1.duration_ = 4.166

		local var_109_0 = {
			zh = 1.633,
			ja = 4.166
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
				arg_109_0:Play410041027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1012"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1012 = var_112_0.localPosition
				var_112_0.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("1012", 4)

				local var_112_2 = var_112_0.childCount

				for iter_112_0 = 0, var_112_2 - 1 do
					local var_112_3 = var_112_0:GetChild(iter_112_0)

					if var_112_3.name == "split_3" or not string.find(var_112_3.name, "split") then
						var_112_3.gameObject:SetActive(true)
					else
						var_112_3.gameObject:SetActive(false)
					end
				end
			end

			local var_112_4 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_4 then
				local var_112_5 = (arg_109_1.time_ - var_112_1) / var_112_4
				local var_112_6 = Vector3.New(390, -465, 300)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1012, var_112_6, var_112_5)
			end

			if arg_109_1.time_ >= var_112_1 + var_112_4 and arg_109_1.time_ < var_112_1 + var_112_4 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_112_7 = arg_109_1.actors_["1012"]
			local var_112_8 = 0

			if var_112_8 < arg_109_1.time_ and arg_109_1.time_ <= var_112_8 + arg_112_0 and arg_109_1.var_.actorSpriteComps1012 == nil then
				arg_109_1.var_.actorSpriteComps1012 = var_112_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_9 = 0.034

			if var_112_8 <= arg_109_1.time_ and arg_109_1.time_ < var_112_8 + var_112_9 then
				local var_112_10 = (arg_109_1.time_ - var_112_8) / var_112_9

				if arg_109_1.var_.actorSpriteComps1012 then
					for iter_112_1, iter_112_2 in pairs(arg_109_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_112_2 then
							local var_112_11 = Mathf.Lerp(iter_112_2.color.r, 1, var_112_10)

							iter_112_2.color = Color.New(var_112_11, var_112_11, var_112_11)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_8 + var_112_9 and arg_109_1.time_ < var_112_8 + var_112_9 + arg_112_0 and arg_109_1.var_.actorSpriteComps1012 then
				local var_112_12 = 1

				for iter_112_3, iter_112_4 in pairs(arg_109_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_112_4 then
						iter_112_4.color = Color.New(var_112_12, var_112_12, var_112_12)
					end
				end

				arg_109_1.var_.actorSpriteComps1012 = nil
			end

			local var_112_13 = 0
			local var_112_14 = 0.15

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_15 = arg_109_1:FormatText(StoryNameCfg[595].name)

				arg_109_1.leftNameTxt_.text = var_112_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_16 = arg_109_1:GetWordFromCfg(410041026)
				local var_112_17 = arg_109_1:FormatText(var_112_16.content)

				arg_109_1.text_.text = var_112_17

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_18 = 6
				local var_112_19 = utf8.len(var_112_17)
				local var_112_20 = var_112_18 <= 0 and var_112_14 or var_112_14 * (var_112_19 / var_112_18)

				if var_112_20 > 0 and var_112_14 < var_112_20 then
					arg_109_1.talkMaxDuration = var_112_20

					if var_112_20 + var_112_13 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_20 + var_112_13
					end
				end

				arg_109_1.text_.text = var_112_17
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041026", "story_v_out_410041.awb") ~= 0 then
					local var_112_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041026", "story_v_out_410041.awb") / 1000

					if var_112_21 + var_112_13 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_21 + var_112_13
					end

					if var_112_16.prefab_name ~= "" and arg_109_1.actors_[var_112_16.prefab_name] ~= nil then
						local var_112_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_16.prefab_name].transform, "story_v_out_410041", "410041026", "story_v_out_410041.awb")

						arg_109_1:RecordAudio("410041026", var_112_22)
						arg_109_1:RecordAudio("410041026", var_112_22)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_410041", "410041026", "story_v_out_410041.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_410041", "410041026", "story_v_out_410041.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_23 = math.max(var_112_14, arg_109_1.talkMaxDuration)

			if var_112_13 <= arg_109_1.time_ and arg_109_1.time_ < var_112_13 + var_112_23 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_13) / var_112_23

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_13 + var_112_23 and arg_109_1.time_ < var_112_13 + var_112_23 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play410041027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410041027
		arg_113_1.duration_ = 3.566

		local var_113_0 = {
			zh = 1.2,
			ja = 3.566
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
				arg_113_0:Play410041028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1012"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos1012 = var_116_0.localPosition
				var_116_0.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("1012", 4)

				local var_116_2 = var_116_0.childCount

				for iter_116_0 = 0, var_116_2 - 1 do
					local var_116_3 = var_116_0:GetChild(iter_116_0)

					if var_116_3.name == "" or not string.find(var_116_3.name, "split") then
						var_116_3.gameObject:SetActive(true)
					else
						var_116_3.gameObject:SetActive(false)
					end
				end
			end

			local var_116_4 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_4 then
				local var_116_5 = (arg_113_1.time_ - var_116_1) / var_116_4
				local var_116_6 = Vector3.New(390, -465, 300)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1012, var_116_6, var_116_5)
			end

			if arg_113_1.time_ >= var_116_1 + var_116_4 and arg_113_1.time_ < var_116_1 + var_116_4 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_116_7 = arg_113_1.actors_["1012"]
			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 and arg_113_1.var_.actorSpriteComps1012 == nil then
				arg_113_1.var_.actorSpriteComps1012 = var_116_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_9 = 0.034

			if var_116_8 <= arg_113_1.time_ and arg_113_1.time_ < var_116_8 + var_116_9 then
				local var_116_10 = (arg_113_1.time_ - var_116_8) / var_116_9

				if arg_113_1.var_.actorSpriteComps1012 then
					for iter_116_1, iter_116_2 in pairs(arg_113_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_116_2 then
							local var_116_11 = Mathf.Lerp(iter_116_2.color.r, 0.5, var_116_10)

							iter_116_2.color = Color.New(var_116_11, var_116_11, var_116_11)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_8 + var_116_9 and arg_113_1.time_ < var_116_8 + var_116_9 + arg_116_0 and arg_113_1.var_.actorSpriteComps1012 then
				local var_116_12 = 0.5

				for iter_116_3, iter_116_4 in pairs(arg_113_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_116_4 then
						iter_116_4.color = Color.New(var_116_12, var_116_12, var_116_12)
					end
				end

				arg_113_1.var_.actorSpriteComps1012 = nil
			end

			local var_116_13 = arg_113_1.actors_["10064"].transform
			local var_116_14 = 0

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1.var_.moveOldPos10064 = var_116_13.localPosition
				var_116_13.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("10064", 2)

				local var_116_15 = var_116_13.childCount

				for iter_116_5 = 0, var_116_15 - 1 do
					local var_116_16 = var_116_13:GetChild(iter_116_5)

					if var_116_16.name == "split_3" or not string.find(var_116_16.name, "split") then
						var_116_16.gameObject:SetActive(true)
					else
						var_116_16.gameObject:SetActive(false)
					end
				end
			end

			local var_116_17 = 0.001

			if var_116_14 <= arg_113_1.time_ and arg_113_1.time_ < var_116_14 + var_116_17 then
				local var_116_18 = (arg_113_1.time_ - var_116_14) / var_116_17
				local var_116_19 = Vector3.New(-390, -570, 192.5)

				var_116_13.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10064, var_116_19, var_116_18)
			end

			if arg_113_1.time_ >= var_116_14 + var_116_17 and arg_113_1.time_ < var_116_14 + var_116_17 + arg_116_0 then
				var_116_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_116_20 = arg_113_1.actors_["10064"]
			local var_116_21 = 0

			if var_116_21 < arg_113_1.time_ and arg_113_1.time_ <= var_116_21 + arg_116_0 and arg_113_1.var_.actorSpriteComps10064 == nil then
				arg_113_1.var_.actorSpriteComps10064 = var_116_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_22 = 0.034

			if var_116_21 <= arg_113_1.time_ and arg_113_1.time_ < var_116_21 + var_116_22 then
				local var_116_23 = (arg_113_1.time_ - var_116_21) / var_116_22

				if arg_113_1.var_.actorSpriteComps10064 then
					for iter_116_6, iter_116_7 in pairs(arg_113_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_116_7 then
							local var_116_24 = Mathf.Lerp(iter_116_7.color.r, 1, var_116_23)

							iter_116_7.color = Color.New(var_116_24, var_116_24, var_116_24)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_21 + var_116_22 and arg_113_1.time_ < var_116_21 + var_116_22 + arg_116_0 and arg_113_1.var_.actorSpriteComps10064 then
				local var_116_25 = 1

				for iter_116_8, iter_116_9 in pairs(arg_113_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_116_9 then
						iter_116_9.color = Color.New(var_116_25, var_116_25, var_116_25)
					end
				end

				arg_113_1.var_.actorSpriteComps10064 = nil
			end

			local var_116_26 = 0
			local var_116_27 = 0.1

			if var_116_26 < arg_113_1.time_ and arg_113_1.time_ <= var_116_26 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_28 = arg_113_1:FormatText(StoryNameCfg[584].name)

				arg_113_1.leftNameTxt_.text = var_116_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_29 = arg_113_1:GetWordFromCfg(410041027)
				local var_116_30 = arg_113_1:FormatText(var_116_29.content)

				arg_113_1.text_.text = var_116_30

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_31 = 4
				local var_116_32 = utf8.len(var_116_30)
				local var_116_33 = var_116_31 <= 0 and var_116_27 or var_116_27 * (var_116_32 / var_116_31)

				if var_116_33 > 0 and var_116_27 < var_116_33 then
					arg_113_1.talkMaxDuration = var_116_33

					if var_116_33 + var_116_26 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_33 + var_116_26
					end
				end

				arg_113_1.text_.text = var_116_30
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041027", "story_v_out_410041.awb") ~= 0 then
					local var_116_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041027", "story_v_out_410041.awb") / 1000

					if var_116_34 + var_116_26 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_34 + var_116_26
					end

					if var_116_29.prefab_name ~= "" and arg_113_1.actors_[var_116_29.prefab_name] ~= nil then
						local var_116_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_29.prefab_name].transform, "story_v_out_410041", "410041027", "story_v_out_410041.awb")

						arg_113_1:RecordAudio("410041027", var_116_35)
						arg_113_1:RecordAudio("410041027", var_116_35)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_410041", "410041027", "story_v_out_410041.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_410041", "410041027", "story_v_out_410041.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_36 = math.max(var_116_27, arg_113_1.talkMaxDuration)

			if var_116_26 <= arg_113_1.time_ and arg_113_1.time_ < var_116_26 + var_116_36 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_26) / var_116_36

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_26 + var_116_36 and arg_113_1.time_ < var_116_26 + var_116_36 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play410041028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410041028
		arg_117_1.duration_ = 12.166

		local var_117_0 = {
			zh = 6.333,
			ja = 12.166
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
				arg_117_0:Play410041029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1012"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1012 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1012", 4)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "split_3" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(390, -465, 300)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1012, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_120_7 = arg_117_1.actors_["1012"]
			local var_120_8 = 0

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 and arg_117_1.var_.actorSpriteComps1012 == nil then
				arg_117_1.var_.actorSpriteComps1012 = var_120_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_9 = 0.034

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_9 then
				local var_120_10 = (arg_117_1.time_ - var_120_8) / var_120_9

				if arg_117_1.var_.actorSpriteComps1012 then
					for iter_120_1, iter_120_2 in pairs(arg_117_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_120_2 then
							local var_120_11 = Mathf.Lerp(iter_120_2.color.r, 1, var_120_10)

							iter_120_2.color = Color.New(var_120_11, var_120_11, var_120_11)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_8 + var_120_9 and arg_117_1.time_ < var_120_8 + var_120_9 + arg_120_0 and arg_117_1.var_.actorSpriteComps1012 then
				local var_120_12 = 1

				for iter_120_3, iter_120_4 in pairs(arg_117_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_120_4 then
						iter_120_4.color = Color.New(var_120_12, var_120_12, var_120_12)
					end
				end

				arg_117_1.var_.actorSpriteComps1012 = nil
			end

			local var_120_13 = arg_117_1.actors_["10064"].transform
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1.var_.moveOldPos10064 = var_120_13.localPosition
				var_120_13.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("10064", 2)

				local var_120_15 = var_120_13.childCount

				for iter_120_5 = 0, var_120_15 - 1 do
					local var_120_16 = var_120_13:GetChild(iter_120_5)

					if var_120_16.name == "split_3" or not string.find(var_120_16.name, "split") then
						var_120_16.gameObject:SetActive(true)
					else
						var_120_16.gameObject:SetActive(false)
					end
				end
			end

			local var_120_17 = 0.001

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_17 then
				local var_120_18 = (arg_117_1.time_ - var_120_14) / var_120_17
				local var_120_19 = Vector3.New(-390, -570, 192.5)

				var_120_13.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10064, var_120_19, var_120_18)
			end

			if arg_117_1.time_ >= var_120_14 + var_120_17 and arg_117_1.time_ < var_120_14 + var_120_17 + arg_120_0 then
				var_120_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_120_20 = arg_117_1.actors_["10064"]
			local var_120_21 = 0

			if var_120_21 < arg_117_1.time_ and arg_117_1.time_ <= var_120_21 + arg_120_0 and arg_117_1.var_.actorSpriteComps10064 == nil then
				arg_117_1.var_.actorSpriteComps10064 = var_120_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_22 = 0.034

			if var_120_21 <= arg_117_1.time_ and arg_117_1.time_ < var_120_21 + var_120_22 then
				local var_120_23 = (arg_117_1.time_ - var_120_21) / var_120_22

				if arg_117_1.var_.actorSpriteComps10064 then
					for iter_120_6, iter_120_7 in pairs(arg_117_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_120_7 then
							local var_120_24 = Mathf.Lerp(iter_120_7.color.r, 0.5, var_120_23)

							iter_120_7.color = Color.New(var_120_24, var_120_24, var_120_24)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_21 + var_120_22 and arg_117_1.time_ < var_120_21 + var_120_22 + arg_120_0 and arg_117_1.var_.actorSpriteComps10064 then
				local var_120_25 = 0.5

				for iter_120_8, iter_120_9 in pairs(arg_117_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_120_9 then
						iter_120_9.color = Color.New(var_120_25, var_120_25, var_120_25)
					end
				end

				arg_117_1.var_.actorSpriteComps10064 = nil
			end

			local var_120_26 = 0
			local var_120_27 = 0.8

			if var_120_26 < arg_117_1.time_ and arg_117_1.time_ <= var_120_26 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_28 = arg_117_1:FormatText(StoryNameCfg[595].name)

				arg_117_1.leftNameTxt_.text = var_120_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_29 = arg_117_1:GetWordFromCfg(410041028)
				local var_120_30 = arg_117_1:FormatText(var_120_29.content)

				arg_117_1.text_.text = var_120_30

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_31 = 32
				local var_120_32 = utf8.len(var_120_30)
				local var_120_33 = var_120_31 <= 0 and var_120_27 or var_120_27 * (var_120_32 / var_120_31)

				if var_120_33 > 0 and var_120_27 < var_120_33 then
					arg_117_1.talkMaxDuration = var_120_33

					if var_120_33 + var_120_26 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_33 + var_120_26
					end
				end

				arg_117_1.text_.text = var_120_30
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041028", "story_v_out_410041.awb") ~= 0 then
					local var_120_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041028", "story_v_out_410041.awb") / 1000

					if var_120_34 + var_120_26 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_34 + var_120_26
					end

					if var_120_29.prefab_name ~= "" and arg_117_1.actors_[var_120_29.prefab_name] ~= nil then
						local var_120_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_29.prefab_name].transform, "story_v_out_410041", "410041028", "story_v_out_410041.awb")

						arg_117_1:RecordAudio("410041028", var_120_35)
						arg_117_1:RecordAudio("410041028", var_120_35)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_410041", "410041028", "story_v_out_410041.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_410041", "410041028", "story_v_out_410041.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_36 = math.max(var_120_27, arg_117_1.talkMaxDuration)

			if var_120_26 <= arg_117_1.time_ and arg_117_1.time_ < var_120_26 + var_120_36 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_26) / var_120_36

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_26 + var_120_36 and arg_117_1.time_ < var_120_26 + var_120_36 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play410041029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410041029
		arg_121_1.duration_ = 9

		local var_121_0 = {
			zh = 6.866,
			ja = 9
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
				arg_121_0:Play410041030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1012"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1012 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("1012", 4)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "split_3" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(390, -465, 300)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1012, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_124_7 = arg_121_1.actors_["1012"]
			local var_124_8 = 0

			if var_124_8 < arg_121_1.time_ and arg_121_1.time_ <= var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps1012 == nil then
				arg_121_1.var_.actorSpriteComps1012 = var_124_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_9 = 0.034

			if var_124_8 <= arg_121_1.time_ and arg_121_1.time_ < var_124_8 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_8) / var_124_9

				if arg_121_1.var_.actorSpriteComps1012 then
					for iter_124_1, iter_124_2 in pairs(arg_121_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_124_2 then
							local var_124_11 = Mathf.Lerp(iter_124_2.color.r, 0.5, var_124_10)

							iter_124_2.color = Color.New(var_124_11, var_124_11, var_124_11)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_8 + var_124_9 and arg_121_1.time_ < var_124_8 + var_124_9 + arg_124_0 and arg_121_1.var_.actorSpriteComps1012 then
				local var_124_12 = 0.5

				for iter_124_3, iter_124_4 in pairs(arg_121_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_124_4 then
						iter_124_4.color = Color.New(var_124_12, var_124_12, var_124_12)
					end
				end

				arg_121_1.var_.actorSpriteComps1012 = nil
			end

			local var_124_13 = arg_121_1.actors_["10064"].transform
			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1.var_.moveOldPos10064 = var_124_13.localPosition
				var_124_13.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("10064", 2)

				local var_124_15 = var_124_13.childCount

				for iter_124_5 = 0, var_124_15 - 1 do
					local var_124_16 = var_124_13:GetChild(iter_124_5)

					if var_124_16.name == "split_3" or not string.find(var_124_16.name, "split") then
						var_124_16.gameObject:SetActive(true)
					else
						var_124_16.gameObject:SetActive(false)
					end
				end
			end

			local var_124_17 = 0.001

			if var_124_14 <= arg_121_1.time_ and arg_121_1.time_ < var_124_14 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_14) / var_124_17
				local var_124_19 = Vector3.New(-390, -570, 192.5)

				var_124_13.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10064, var_124_19, var_124_18)
			end

			if arg_121_1.time_ >= var_124_14 + var_124_17 and arg_121_1.time_ < var_124_14 + var_124_17 + arg_124_0 then
				var_124_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_124_20 = arg_121_1.actors_["10064"]
			local var_124_21 = 0

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 and arg_121_1.var_.actorSpriteComps10064 == nil then
				arg_121_1.var_.actorSpriteComps10064 = var_124_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_22 = 0.034

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_22 then
				local var_124_23 = (arg_121_1.time_ - var_124_21) / var_124_22

				if arg_121_1.var_.actorSpriteComps10064 then
					for iter_124_6, iter_124_7 in pairs(arg_121_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_124_7 then
							local var_124_24 = Mathf.Lerp(iter_124_7.color.r, 1, var_124_23)

							iter_124_7.color = Color.New(var_124_24, var_124_24, var_124_24)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_21 + var_124_22 and arg_121_1.time_ < var_124_21 + var_124_22 + arg_124_0 and arg_121_1.var_.actorSpriteComps10064 then
				local var_124_25 = 1

				for iter_124_8, iter_124_9 in pairs(arg_121_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_124_9 then
						iter_124_9.color = Color.New(var_124_25, var_124_25, var_124_25)
					end
				end

				arg_121_1.var_.actorSpriteComps10064 = nil
			end

			local var_124_26 = 0
			local var_124_27 = 0.875

			if var_124_26 < arg_121_1.time_ and arg_121_1.time_ <= var_124_26 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_28 = arg_121_1:FormatText(StoryNameCfg[584].name)

				arg_121_1.leftNameTxt_.text = var_124_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_29 = arg_121_1:GetWordFromCfg(410041029)
				local var_124_30 = arg_121_1:FormatText(var_124_29.content)

				arg_121_1.text_.text = var_124_30

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_31 = 35
				local var_124_32 = utf8.len(var_124_30)
				local var_124_33 = var_124_31 <= 0 and var_124_27 or var_124_27 * (var_124_32 / var_124_31)

				if var_124_33 > 0 and var_124_27 < var_124_33 then
					arg_121_1.talkMaxDuration = var_124_33

					if var_124_33 + var_124_26 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_33 + var_124_26
					end
				end

				arg_121_1.text_.text = var_124_30
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041029", "story_v_out_410041.awb") ~= 0 then
					local var_124_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041029", "story_v_out_410041.awb") / 1000

					if var_124_34 + var_124_26 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_34 + var_124_26
					end

					if var_124_29.prefab_name ~= "" and arg_121_1.actors_[var_124_29.prefab_name] ~= nil then
						local var_124_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_29.prefab_name].transform, "story_v_out_410041", "410041029", "story_v_out_410041.awb")

						arg_121_1:RecordAudio("410041029", var_124_35)
						arg_121_1:RecordAudio("410041029", var_124_35)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_410041", "410041029", "story_v_out_410041.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_410041", "410041029", "story_v_out_410041.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_36 = math.max(var_124_27, arg_121_1.talkMaxDuration)

			if var_124_26 <= arg_121_1.time_ and arg_121_1.time_ < var_124_26 + var_124_36 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_26) / var_124_36

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_26 + var_124_36 and arg_121_1.time_ < var_124_26 + var_124_36 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play410041030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410041030
		arg_125_1.duration_ = 9

		local var_125_0 = {
			zh = 4.133,
			ja = 9
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
				arg_125_0:Play410041031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1012"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1012 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1012", 4)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "split_3" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(390, -465, 300)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1012, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_128_7 = arg_125_1.actors_["1012"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps1012 == nil then
				arg_125_1.var_.actorSpriteComps1012 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.034

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps1012 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps1012 then
				local var_128_12 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps1012 = nil
			end

			local var_128_13 = arg_125_1.actors_["10064"].transform
			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1.var_.moveOldPos10064 = var_128_13.localPosition
				var_128_13.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10064", 2)

				local var_128_15 = var_128_13.childCount

				for iter_128_5 = 0, var_128_15 - 1 do
					local var_128_16 = var_128_13:GetChild(iter_128_5)

					if var_128_16.name == "split_3" or not string.find(var_128_16.name, "split") then
						var_128_16.gameObject:SetActive(true)
					else
						var_128_16.gameObject:SetActive(false)
					end
				end
			end

			local var_128_17 = 0.001

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_14) / var_128_17
				local var_128_19 = Vector3.New(-390, -570, 192.5)

				var_128_13.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10064, var_128_19, var_128_18)
			end

			if arg_125_1.time_ >= var_128_14 + var_128_17 and arg_125_1.time_ < var_128_14 + var_128_17 + arg_128_0 then
				var_128_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_128_20 = arg_125_1.actors_["10064"]
			local var_128_21 = 0

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 and arg_125_1.var_.actorSpriteComps10064 == nil then
				arg_125_1.var_.actorSpriteComps10064 = var_128_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_22 = 0.034

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_22 then
				local var_128_23 = (arg_125_1.time_ - var_128_21) / var_128_22

				if arg_125_1.var_.actorSpriteComps10064 then
					for iter_128_6, iter_128_7 in pairs(arg_125_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_128_7 then
							local var_128_24 = Mathf.Lerp(iter_128_7.color.r, 0.5, var_128_23)

							iter_128_7.color = Color.New(var_128_24, var_128_24, var_128_24)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_21 + var_128_22 and arg_125_1.time_ < var_128_21 + var_128_22 + arg_128_0 and arg_125_1.var_.actorSpriteComps10064 then
				local var_128_25 = 0.5

				for iter_128_8, iter_128_9 in pairs(arg_125_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_128_9 then
						iter_128_9.color = Color.New(var_128_25, var_128_25, var_128_25)
					end
				end

				arg_125_1.var_.actorSpriteComps10064 = nil
			end

			local var_128_26 = 0
			local var_128_27 = 0.525

			if var_128_26 < arg_125_1.time_ and arg_125_1.time_ <= var_128_26 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_28 = arg_125_1:FormatText(StoryNameCfg[595].name)

				arg_125_1.leftNameTxt_.text = var_128_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_29 = arg_125_1:GetWordFromCfg(410041030)
				local var_128_30 = arg_125_1:FormatText(var_128_29.content)

				arg_125_1.text_.text = var_128_30

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_31 = 21
				local var_128_32 = utf8.len(var_128_30)
				local var_128_33 = var_128_31 <= 0 and var_128_27 or var_128_27 * (var_128_32 / var_128_31)

				if var_128_33 > 0 and var_128_27 < var_128_33 then
					arg_125_1.talkMaxDuration = var_128_33

					if var_128_33 + var_128_26 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_33 + var_128_26
					end
				end

				arg_125_1.text_.text = var_128_30
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041030", "story_v_out_410041.awb") ~= 0 then
					local var_128_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041030", "story_v_out_410041.awb") / 1000

					if var_128_34 + var_128_26 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_34 + var_128_26
					end

					if var_128_29.prefab_name ~= "" and arg_125_1.actors_[var_128_29.prefab_name] ~= nil then
						local var_128_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_29.prefab_name].transform, "story_v_out_410041", "410041030", "story_v_out_410041.awb")

						arg_125_1:RecordAudio("410041030", var_128_35)
						arg_125_1:RecordAudio("410041030", var_128_35)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410041", "410041030", "story_v_out_410041.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410041", "410041030", "story_v_out_410041.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_36 = math.max(var_128_27, arg_125_1.talkMaxDuration)

			if var_128_26 <= arg_125_1.time_ and arg_125_1.time_ < var_128_26 + var_128_36 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_26) / var_128_36

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_26 + var_128_36 and arg_125_1.time_ < var_128_26 + var_128_36 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410041031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410041031
		arg_129_1.duration_ = 13.866

		local var_129_0 = {
			zh = 7,
			ja = 13.866
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
				arg_129_0:Play410041032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1012"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1012 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("1012", 4)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "split_3" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(390, -465, 300)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1012, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_132_7 = arg_129_1.actors_["1012"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and arg_129_1.var_.actorSpriteComps1012 == nil then
				arg_129_1.var_.actorSpriteComps1012 = var_132_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_9 = 0.034

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.actorSpriteComps1012 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_132_2 then
							local var_132_11 = Mathf.Lerp(iter_132_2.color.r, 0.5, var_132_10)

							iter_132_2.color = Color.New(var_132_11, var_132_11, var_132_11)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and arg_129_1.var_.actorSpriteComps1012 then
				local var_132_12 = 0.5

				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_132_4 then
						iter_132_4.color = Color.New(var_132_12, var_132_12, var_132_12)
					end
				end

				arg_129_1.var_.actorSpriteComps1012 = nil
			end

			local var_132_13 = arg_129_1.actors_["10064"].transform
			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1.var_.moveOldPos10064 = var_132_13.localPosition
				var_132_13.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10064", 2)

				local var_132_15 = var_132_13.childCount

				for iter_132_5 = 0, var_132_15 - 1 do
					local var_132_16 = var_132_13:GetChild(iter_132_5)

					if var_132_16.name == "split_3" or not string.find(var_132_16.name, "split") then
						var_132_16.gameObject:SetActive(true)
					else
						var_132_16.gameObject:SetActive(false)
					end
				end
			end

			local var_132_17 = 0.001

			if var_132_14 <= arg_129_1.time_ and arg_129_1.time_ < var_132_14 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_14) / var_132_17
				local var_132_19 = Vector3.New(-390, -570, 192.5)

				var_132_13.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10064, var_132_19, var_132_18)
			end

			if arg_129_1.time_ >= var_132_14 + var_132_17 and arg_129_1.time_ < var_132_14 + var_132_17 + arg_132_0 then
				var_132_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_132_20 = arg_129_1.actors_["10064"]
			local var_132_21 = 0

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 and arg_129_1.var_.actorSpriteComps10064 == nil then
				arg_129_1.var_.actorSpriteComps10064 = var_132_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_22 = 0.034

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_22 then
				local var_132_23 = (arg_129_1.time_ - var_132_21) / var_132_22

				if arg_129_1.var_.actorSpriteComps10064 then
					for iter_132_6, iter_132_7 in pairs(arg_129_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_132_7 then
							local var_132_24 = Mathf.Lerp(iter_132_7.color.r, 1, var_132_23)

							iter_132_7.color = Color.New(var_132_24, var_132_24, var_132_24)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_21 + var_132_22 and arg_129_1.time_ < var_132_21 + var_132_22 + arg_132_0 and arg_129_1.var_.actorSpriteComps10064 then
				local var_132_25 = 1

				for iter_132_8, iter_132_9 in pairs(arg_129_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_132_9 then
						iter_132_9.color = Color.New(var_132_25, var_132_25, var_132_25)
					end
				end

				arg_129_1.var_.actorSpriteComps10064 = nil
			end

			local var_132_26 = 0
			local var_132_27 = 0.675

			if var_132_26 < arg_129_1.time_ and arg_129_1.time_ <= var_132_26 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_28 = arg_129_1:FormatText(StoryNameCfg[584].name)

				arg_129_1.leftNameTxt_.text = var_132_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_29 = arg_129_1:GetWordFromCfg(410041031)
				local var_132_30 = arg_129_1:FormatText(var_132_29.content)

				arg_129_1.text_.text = var_132_30

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_31 = 27
				local var_132_32 = utf8.len(var_132_30)
				local var_132_33 = var_132_31 <= 0 and var_132_27 or var_132_27 * (var_132_32 / var_132_31)

				if var_132_33 > 0 and var_132_27 < var_132_33 then
					arg_129_1.talkMaxDuration = var_132_33

					if var_132_33 + var_132_26 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_33 + var_132_26
					end
				end

				arg_129_1.text_.text = var_132_30
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041031", "story_v_out_410041.awb") ~= 0 then
					local var_132_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041031", "story_v_out_410041.awb") / 1000

					if var_132_34 + var_132_26 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_34 + var_132_26
					end

					if var_132_29.prefab_name ~= "" and arg_129_1.actors_[var_132_29.prefab_name] ~= nil then
						local var_132_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_29.prefab_name].transform, "story_v_out_410041", "410041031", "story_v_out_410041.awb")

						arg_129_1:RecordAudio("410041031", var_132_35)
						arg_129_1:RecordAudio("410041031", var_132_35)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410041", "410041031", "story_v_out_410041.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410041", "410041031", "story_v_out_410041.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_36 = math.max(var_132_27, arg_129_1.talkMaxDuration)

			if var_132_26 <= arg_129_1.time_ and arg_129_1.time_ < var_132_26 + var_132_36 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_26) / var_132_36

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_26 + var_132_36 and arg_129_1.time_ < var_132_26 + var_132_36 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play410041032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410041032
		arg_133_1.duration_ = 16.233

		local var_133_0 = {
			zh = 10.666,
			ja = 16.233
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
				arg_133_0:Play410041033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1.5

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[584].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(410041032)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 60
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041032", "story_v_out_410041.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_410041", "410041032", "story_v_out_410041.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_410041", "410041032", "story_v_out_410041.awb")

						arg_133_1:RecordAudio("410041032", var_136_9)
						arg_133_1:RecordAudio("410041032", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410041", "410041032", "story_v_out_410041.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410041", "410041032", "story_v_out_410041.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410041033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410041033
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play410041034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10064"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.actorSpriteComps10064 == nil then
				arg_137_1.var_.actorSpriteComps10064 = var_140_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_2 = 0.034

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.actorSpriteComps10064 then
					for iter_140_0, iter_140_1 in pairs(arg_137_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_140_1 then
							local var_140_4 = Mathf.Lerp(iter_140_1.color.r, 0.5, var_140_3)

							iter_140_1.color = Color.New(var_140_4, var_140_4, var_140_4)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.actorSpriteComps10064 then
				local var_140_5 = 0.5

				for iter_140_2, iter_140_3 in pairs(arg_137_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_140_3 then
						iter_140_3.color = Color.New(var_140_5, var_140_5, var_140_5)
					end
				end

				arg_137_1.var_.actorSpriteComps10064 = nil
			end

			local var_140_6 = 0
			local var_140_7 = 1.25

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_8 = arg_137_1:GetWordFromCfg(410041033)
				local var_140_9 = arg_137_1:FormatText(var_140_8.content)

				arg_137_1.text_.text = var_140_9

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_10 = 50
				local var_140_11 = utf8.len(var_140_9)
				local var_140_12 = var_140_10 <= 0 and var_140_7 or var_140_7 * (var_140_11 / var_140_10)

				if var_140_12 > 0 and var_140_7 < var_140_12 then
					arg_137_1.talkMaxDuration = var_140_12

					if var_140_12 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_12 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_9
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_13 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_13 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_13

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_13 and arg_137_1.time_ < var_140_6 + var_140_13 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play410041034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410041034
		arg_141_1.duration_ = 3.066

		local var_141_0 = {
			zh = 3.066,
			ja = 2.5
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
				arg_141_0:Play410041035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1012"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1012 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1012", 4)

				local var_144_2 = var_144_0.childCount

				for iter_144_0 = 0, var_144_2 - 1 do
					local var_144_3 = var_144_0:GetChild(iter_144_0)

					if var_144_3.name == "split_1" or not string.find(var_144_3.name, "split") then
						var_144_3.gameObject:SetActive(true)
					else
						var_144_3.gameObject:SetActive(false)
					end
				end
			end

			local var_144_4 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_1) / var_144_4
				local var_144_6 = Vector3.New(390, -465, 300)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1012, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_144_7 = arg_141_1.actors_["1012"]
			local var_144_8 = 0

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 and arg_141_1.var_.actorSpriteComps1012 == nil then
				arg_141_1.var_.actorSpriteComps1012 = var_144_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_9 = 0.034

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_9 then
				local var_144_10 = (arg_141_1.time_ - var_144_8) / var_144_9

				if arg_141_1.var_.actorSpriteComps1012 then
					for iter_144_1, iter_144_2 in pairs(arg_141_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_144_2 then
							local var_144_11 = Mathf.Lerp(iter_144_2.color.r, 1, var_144_10)

							iter_144_2.color = Color.New(var_144_11, var_144_11, var_144_11)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_8 + var_144_9 and arg_141_1.time_ < var_144_8 + var_144_9 + arg_144_0 and arg_141_1.var_.actorSpriteComps1012 then
				local var_144_12 = 1

				for iter_144_3, iter_144_4 in pairs(arg_141_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_144_4 then
						iter_144_4.color = Color.New(var_144_12, var_144_12, var_144_12)
					end
				end

				arg_141_1.var_.actorSpriteComps1012 = nil
			end

			local var_144_13 = 0
			local var_144_14 = 0.25

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_15 = arg_141_1:FormatText(StoryNameCfg[595].name)

				arg_141_1.leftNameTxt_.text = var_144_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_16 = arg_141_1:GetWordFromCfg(410041034)
				local var_144_17 = arg_141_1:FormatText(var_144_16.content)

				arg_141_1.text_.text = var_144_17

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_18 = 10
				local var_144_19 = utf8.len(var_144_17)
				local var_144_20 = var_144_18 <= 0 and var_144_14 or var_144_14 * (var_144_19 / var_144_18)

				if var_144_20 > 0 and var_144_14 < var_144_20 then
					arg_141_1.talkMaxDuration = var_144_20

					if var_144_20 + var_144_13 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_20 + var_144_13
					end
				end

				arg_141_1.text_.text = var_144_17
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041034", "story_v_out_410041.awb") ~= 0 then
					local var_144_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041034", "story_v_out_410041.awb") / 1000

					if var_144_21 + var_144_13 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_21 + var_144_13
					end

					if var_144_16.prefab_name ~= "" and arg_141_1.actors_[var_144_16.prefab_name] ~= nil then
						local var_144_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_16.prefab_name].transform, "story_v_out_410041", "410041034", "story_v_out_410041.awb")

						arg_141_1:RecordAudio("410041034", var_144_22)
						arg_141_1:RecordAudio("410041034", var_144_22)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_410041", "410041034", "story_v_out_410041.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_410041", "410041034", "story_v_out_410041.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_23 = math.max(var_144_14, arg_141_1.talkMaxDuration)

			if var_144_13 <= arg_141_1.time_ and arg_141_1.time_ < var_144_13 + var_144_23 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_13) / var_144_23

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_13 + var_144_23 and arg_141_1.time_ < var_144_13 + var_144_23 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410041035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410041035
		arg_145_1.duration_ = 6.666

		local var_145_0 = {
			zh = 6.233,
			ja = 6.666
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play410041036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1012"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1012 = var_148_0.localPosition
				var_148_0.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("1012", 4)

				local var_148_2 = var_148_0.childCount

				for iter_148_0 = 0, var_148_2 - 1 do
					local var_148_3 = var_148_0:GetChild(iter_148_0)

					if var_148_3.name == "split_3" or not string.find(var_148_3.name, "split") then
						var_148_3.gameObject:SetActive(true)
					else
						var_148_3.gameObject:SetActive(false)
					end
				end
			end

			local var_148_4 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_4 then
				local var_148_5 = (arg_145_1.time_ - var_148_1) / var_148_4
				local var_148_6 = Vector3.New(390, -465, 300)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1012, var_148_6, var_148_5)
			end

			if arg_145_1.time_ >= var_148_1 + var_148_4 and arg_145_1.time_ < var_148_1 + var_148_4 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_148_7 = arg_145_1.actors_["1012"]
			local var_148_8 = 0

			if var_148_8 < arg_145_1.time_ and arg_145_1.time_ <= var_148_8 + arg_148_0 and arg_145_1.var_.actorSpriteComps1012 == nil then
				arg_145_1.var_.actorSpriteComps1012 = var_148_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_9 = 0.034

			if var_148_8 <= arg_145_1.time_ and arg_145_1.time_ < var_148_8 + var_148_9 then
				local var_148_10 = (arg_145_1.time_ - var_148_8) / var_148_9

				if arg_145_1.var_.actorSpriteComps1012 then
					for iter_148_1, iter_148_2 in pairs(arg_145_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_148_2 then
							local var_148_11 = Mathf.Lerp(iter_148_2.color.r, 0.5, var_148_10)

							iter_148_2.color = Color.New(var_148_11, var_148_11, var_148_11)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_8 + var_148_9 and arg_145_1.time_ < var_148_8 + var_148_9 + arg_148_0 and arg_145_1.var_.actorSpriteComps1012 then
				local var_148_12 = 0.5

				for iter_148_3, iter_148_4 in pairs(arg_145_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_148_4 then
						iter_148_4.color = Color.New(var_148_12, var_148_12, var_148_12)
					end
				end

				arg_145_1.var_.actorSpriteComps1012 = nil
			end

			local var_148_13 = arg_145_1.actors_["10064"].transform
			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1.var_.moveOldPos10064 = var_148_13.localPosition
				var_148_13.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("10064", 2)

				local var_148_15 = var_148_13.childCount

				for iter_148_5 = 0, var_148_15 - 1 do
					local var_148_16 = var_148_13:GetChild(iter_148_5)

					if var_148_16.name == "split_3" or not string.find(var_148_16.name, "split") then
						var_148_16.gameObject:SetActive(true)
					else
						var_148_16.gameObject:SetActive(false)
					end
				end
			end

			local var_148_17 = 0.001

			if var_148_14 <= arg_145_1.time_ and arg_145_1.time_ < var_148_14 + var_148_17 then
				local var_148_18 = (arg_145_1.time_ - var_148_14) / var_148_17
				local var_148_19 = Vector3.New(-390, -570, 192.5)

				var_148_13.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10064, var_148_19, var_148_18)
			end

			if arg_145_1.time_ >= var_148_14 + var_148_17 and arg_145_1.time_ < var_148_14 + var_148_17 + arg_148_0 then
				var_148_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_148_20 = arg_145_1.actors_["10064"]
			local var_148_21 = 0

			if var_148_21 < arg_145_1.time_ and arg_145_1.time_ <= var_148_21 + arg_148_0 and arg_145_1.var_.actorSpriteComps10064 == nil then
				arg_145_1.var_.actorSpriteComps10064 = var_148_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_22 = 0.034

			if var_148_21 <= arg_145_1.time_ and arg_145_1.time_ < var_148_21 + var_148_22 then
				local var_148_23 = (arg_145_1.time_ - var_148_21) / var_148_22

				if arg_145_1.var_.actorSpriteComps10064 then
					for iter_148_6, iter_148_7 in pairs(arg_145_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_148_7 then
							local var_148_24 = Mathf.Lerp(iter_148_7.color.r, 1, var_148_23)

							iter_148_7.color = Color.New(var_148_24, var_148_24, var_148_24)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_21 + var_148_22 and arg_145_1.time_ < var_148_21 + var_148_22 + arg_148_0 and arg_145_1.var_.actorSpriteComps10064 then
				local var_148_25 = 1

				for iter_148_8, iter_148_9 in pairs(arg_145_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_148_9 then
						iter_148_9.color = Color.New(var_148_25, var_148_25, var_148_25)
					end
				end

				arg_145_1.var_.actorSpriteComps10064 = nil
			end

			local var_148_26 = 0
			local var_148_27 = 0.425

			if var_148_26 < arg_145_1.time_ and arg_145_1.time_ <= var_148_26 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_28 = arg_145_1:FormatText(StoryNameCfg[584].name)

				arg_145_1.leftNameTxt_.text = var_148_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_29 = arg_145_1:GetWordFromCfg(410041035)
				local var_148_30 = arg_145_1:FormatText(var_148_29.content)

				arg_145_1.text_.text = var_148_30

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_31 = 17
				local var_148_32 = utf8.len(var_148_30)
				local var_148_33 = var_148_31 <= 0 and var_148_27 or var_148_27 * (var_148_32 / var_148_31)

				if var_148_33 > 0 and var_148_27 < var_148_33 then
					arg_145_1.talkMaxDuration = var_148_33

					if var_148_33 + var_148_26 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_33 + var_148_26
					end
				end

				arg_145_1.text_.text = var_148_30
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041035", "story_v_out_410041.awb") ~= 0 then
					local var_148_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041035", "story_v_out_410041.awb") / 1000

					if var_148_34 + var_148_26 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_34 + var_148_26
					end

					if var_148_29.prefab_name ~= "" and arg_145_1.actors_[var_148_29.prefab_name] ~= nil then
						local var_148_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_29.prefab_name].transform, "story_v_out_410041", "410041035", "story_v_out_410041.awb")

						arg_145_1:RecordAudio("410041035", var_148_35)
						arg_145_1:RecordAudio("410041035", var_148_35)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_410041", "410041035", "story_v_out_410041.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_410041", "410041035", "story_v_out_410041.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_36 = math.max(var_148_27, arg_145_1.talkMaxDuration)

			if var_148_26 <= arg_145_1.time_ and arg_145_1.time_ < var_148_26 + var_148_36 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_26) / var_148_36

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_26 + var_148_36 and arg_145_1.time_ < var_148_26 + var_148_36 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410041036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410041036
		arg_149_1.duration_ = 2.266

		local var_149_0 = {
			zh = 2.266,
			ja = 1.966
		}
		local var_149_1 = manager.audio:GetLocalizationFlag()

		if var_149_0[var_149_1] ~= nil then
			arg_149_1.duration_ = var_149_0[var_149_1]
		end

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play410041037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.25

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[584].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(410041036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 10
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041036", "story_v_out_410041.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_410041", "410041036", "story_v_out_410041.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_410041", "410041036", "story_v_out_410041.awb")

						arg_149_1:RecordAudio("410041036", var_152_9)
						arg_149_1:RecordAudio("410041036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_410041", "410041036", "story_v_out_410041.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_410041", "410041036", "story_v_out_410041.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play410041037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410041037
		arg_153_1.duration_ = 6.566

		local var_153_0 = {
			zh = 3.566,
			ja = 6.566
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
				arg_153_0:Play410041038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1012"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1012 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("1012", 4)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "split_4" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(390, -465, 300)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1012, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_156_7 = arg_153_1.actors_["1012"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps1012 == nil then
				arg_153_1.var_.actorSpriteComps1012 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.034

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps1012 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps1012 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps1012 = nil
			end

			local var_156_13 = arg_153_1.actors_["10064"].transform
			local var_156_14 = 0

			if var_156_14 < arg_153_1.time_ and arg_153_1.time_ <= var_156_14 + arg_156_0 then
				arg_153_1.var_.moveOldPos10064 = var_156_13.localPosition
				var_156_13.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("10064", 2)

				local var_156_15 = var_156_13.childCount

				for iter_156_5 = 0, var_156_15 - 1 do
					local var_156_16 = var_156_13:GetChild(iter_156_5)

					if var_156_16.name == "split_3" or not string.find(var_156_16.name, "split") then
						var_156_16.gameObject:SetActive(true)
					else
						var_156_16.gameObject:SetActive(false)
					end
				end
			end

			local var_156_17 = 0.001

			if var_156_14 <= arg_153_1.time_ and arg_153_1.time_ < var_156_14 + var_156_17 then
				local var_156_18 = (arg_153_1.time_ - var_156_14) / var_156_17
				local var_156_19 = Vector3.New(-390, -570, 192.5)

				var_156_13.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10064, var_156_19, var_156_18)
			end

			if arg_153_1.time_ >= var_156_14 + var_156_17 and arg_153_1.time_ < var_156_14 + var_156_17 + arg_156_0 then
				var_156_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_156_20 = arg_153_1.actors_["10064"]
			local var_156_21 = 0

			if var_156_21 < arg_153_1.time_ and arg_153_1.time_ <= var_156_21 + arg_156_0 and arg_153_1.var_.actorSpriteComps10064 == nil then
				arg_153_1.var_.actorSpriteComps10064 = var_156_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_22 = 0.034

			if var_156_21 <= arg_153_1.time_ and arg_153_1.time_ < var_156_21 + var_156_22 then
				local var_156_23 = (arg_153_1.time_ - var_156_21) / var_156_22

				if arg_153_1.var_.actorSpriteComps10064 then
					for iter_156_6, iter_156_7 in pairs(arg_153_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_156_7 then
							local var_156_24 = Mathf.Lerp(iter_156_7.color.r, 0.5, var_156_23)

							iter_156_7.color = Color.New(var_156_24, var_156_24, var_156_24)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_21 + var_156_22 and arg_153_1.time_ < var_156_21 + var_156_22 + arg_156_0 and arg_153_1.var_.actorSpriteComps10064 then
				local var_156_25 = 0.5

				for iter_156_8, iter_156_9 in pairs(arg_153_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_156_9 then
						iter_156_9.color = Color.New(var_156_25, var_156_25, var_156_25)
					end
				end

				arg_153_1.var_.actorSpriteComps10064 = nil
			end

			local var_156_26 = 0
			local var_156_27 = 0.3

			if var_156_26 < arg_153_1.time_ and arg_153_1.time_ <= var_156_26 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_28 = arg_153_1:FormatText(StoryNameCfg[595].name)

				arg_153_1.leftNameTxt_.text = var_156_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_29 = arg_153_1:GetWordFromCfg(410041037)
				local var_156_30 = arg_153_1:FormatText(var_156_29.content)

				arg_153_1.text_.text = var_156_30

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_31 = 12
				local var_156_32 = utf8.len(var_156_30)
				local var_156_33 = var_156_31 <= 0 and var_156_27 or var_156_27 * (var_156_32 / var_156_31)

				if var_156_33 > 0 and var_156_27 < var_156_33 then
					arg_153_1.talkMaxDuration = var_156_33

					if var_156_33 + var_156_26 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_33 + var_156_26
					end
				end

				arg_153_1.text_.text = var_156_30
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041037", "story_v_out_410041.awb") ~= 0 then
					local var_156_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041037", "story_v_out_410041.awb") / 1000

					if var_156_34 + var_156_26 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_34 + var_156_26
					end

					if var_156_29.prefab_name ~= "" and arg_153_1.actors_[var_156_29.prefab_name] ~= nil then
						local var_156_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_29.prefab_name].transform, "story_v_out_410041", "410041037", "story_v_out_410041.awb")

						arg_153_1:RecordAudio("410041037", var_156_35)
						arg_153_1:RecordAudio("410041037", var_156_35)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410041", "410041037", "story_v_out_410041.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410041", "410041037", "story_v_out_410041.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_36 = math.max(var_156_27, arg_153_1.talkMaxDuration)

			if var_156_26 <= arg_153_1.time_ and arg_153_1.time_ < var_156_26 + var_156_36 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_26) / var_156_36

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_26 + var_156_36 and arg_153_1.time_ < var_156_26 + var_156_36 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play410041038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 410041038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play410041039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1012"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1012 = var_160_0.localPosition
				var_160_0.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("1012", 7)

				local var_160_2 = var_160_0.childCount

				for iter_160_0 = 0, var_160_2 - 1 do
					local var_160_3 = var_160_0:GetChild(iter_160_0)

					if var_160_3.name == "split_3" or not string.find(var_160_3.name, "split") then
						var_160_3.gameObject:SetActive(true)
					else
						var_160_3.gameObject:SetActive(false)
					end
				end
			end

			local var_160_4 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_4 then
				local var_160_5 = (arg_157_1.time_ - var_160_1) / var_160_4
				local var_160_6 = Vector3.New(0, -2000, 300)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1012, var_160_6, var_160_5)
			end

			if arg_157_1.time_ >= var_160_1 + var_160_4 and arg_157_1.time_ < var_160_1 + var_160_4 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_160_7 = arg_157_1.actors_["1012"]
			local var_160_8 = 0

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 and arg_157_1.var_.actorSpriteComps1012 == nil then
				arg_157_1.var_.actorSpriteComps1012 = var_160_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_9 = 0.034

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_9 then
				local var_160_10 = (arg_157_1.time_ - var_160_8) / var_160_9

				if arg_157_1.var_.actorSpriteComps1012 then
					for iter_160_1, iter_160_2 in pairs(arg_157_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_160_2 then
							local var_160_11 = Mathf.Lerp(iter_160_2.color.r, 0.5, var_160_10)

							iter_160_2.color = Color.New(var_160_11, var_160_11, var_160_11)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_8 + var_160_9 and arg_157_1.time_ < var_160_8 + var_160_9 + arg_160_0 and arg_157_1.var_.actorSpriteComps1012 then
				local var_160_12 = 0.5

				for iter_160_3, iter_160_4 in pairs(arg_157_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_160_4 then
						iter_160_4.color = Color.New(var_160_12, var_160_12, var_160_12)
					end
				end

				arg_157_1.var_.actorSpriteComps1012 = nil
			end

			local var_160_13 = arg_157_1.actors_["10064"].transform
			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1.var_.moveOldPos10064 = var_160_13.localPosition
				var_160_13.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("10064", 7)

				local var_160_15 = var_160_13.childCount

				for iter_160_5 = 0, var_160_15 - 1 do
					local var_160_16 = var_160_13:GetChild(iter_160_5)

					if var_160_16.name == "split_3" or not string.find(var_160_16.name, "split") then
						var_160_16.gameObject:SetActive(true)
					else
						var_160_16.gameObject:SetActive(false)
					end
				end
			end

			local var_160_17 = 0.001

			if var_160_14 <= arg_157_1.time_ and arg_157_1.time_ < var_160_14 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_14) / var_160_17
				local var_160_19 = Vector3.New(0, -2000, 192.5)

				var_160_13.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10064, var_160_19, var_160_18)
			end

			if arg_157_1.time_ >= var_160_14 + var_160_17 and arg_157_1.time_ < var_160_14 + var_160_17 + arg_160_0 then
				var_160_13.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_160_20 = arg_157_1.actors_["10064"]
			local var_160_21 = 0

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 and arg_157_1.var_.actorSpriteComps10064 == nil then
				arg_157_1.var_.actorSpriteComps10064 = var_160_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_22 = 0.034

			if var_160_21 <= arg_157_1.time_ and arg_157_1.time_ < var_160_21 + var_160_22 then
				local var_160_23 = (arg_157_1.time_ - var_160_21) / var_160_22

				if arg_157_1.var_.actorSpriteComps10064 then
					for iter_160_6, iter_160_7 in pairs(arg_157_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_160_7 then
							local var_160_24 = Mathf.Lerp(iter_160_7.color.r, 1, var_160_23)

							iter_160_7.color = Color.New(var_160_24, var_160_24, var_160_24)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_21 + var_160_22 and arg_157_1.time_ < var_160_21 + var_160_22 + arg_160_0 and arg_157_1.var_.actorSpriteComps10064 then
				local var_160_25 = 1

				for iter_160_8, iter_160_9 in pairs(arg_157_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_160_9 then
						iter_160_9.color = Color.New(var_160_25, var_160_25, var_160_25)
					end
				end

				arg_157_1.var_.actorSpriteComps10064 = nil
			end

			local var_160_26 = 0
			local var_160_27 = 0.8

			if var_160_26 < arg_157_1.time_ and arg_157_1.time_ <= var_160_26 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_28 = arg_157_1:GetWordFromCfg(410041038)
				local var_160_29 = arg_157_1:FormatText(var_160_28.content)

				arg_157_1.text_.text = var_160_29

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_30 = 32
				local var_160_31 = utf8.len(var_160_29)
				local var_160_32 = var_160_30 <= 0 and var_160_27 or var_160_27 * (var_160_31 / var_160_30)

				if var_160_32 > 0 and var_160_27 < var_160_32 then
					arg_157_1.talkMaxDuration = var_160_32

					if var_160_32 + var_160_26 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_32 + var_160_26
					end
				end

				arg_157_1.text_.text = var_160_29
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_33 = math.max(var_160_27, arg_157_1.talkMaxDuration)

			if var_160_26 <= arg_157_1.time_ and arg_157_1.time_ < var_160_26 + var_160_33 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_26) / var_160_33

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_26 + var_160_33 and arg_157_1.time_ < var_160_26 + var_160_33 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play410041039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410041039
		arg_161_1.duration_ = 6.2

		local var_161_0 = {
			zh = 3.666,
			ja = 6.2
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
				arg_161_0:Play410041040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1012"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1012 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1012", 4)

				local var_164_2 = var_164_0.childCount

				for iter_164_0 = 0, var_164_2 - 1 do
					local var_164_3 = var_164_0:GetChild(iter_164_0)

					if var_164_3.name == "split_1" or not string.find(var_164_3.name, "split") then
						var_164_3.gameObject:SetActive(true)
					else
						var_164_3.gameObject:SetActive(false)
					end
				end
			end

			local var_164_4 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_4 then
				local var_164_5 = (arg_161_1.time_ - var_164_1) / var_164_4
				local var_164_6 = Vector3.New(390, -465, 300)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1012, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_164_7 = arg_161_1.actors_["1012"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 and arg_161_1.var_.actorSpriteComps1012 == nil then
				arg_161_1.var_.actorSpriteComps1012 = var_164_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_9 = 0.034

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_8) / var_164_9

				if arg_161_1.var_.actorSpriteComps1012 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_164_2 then
							local var_164_11 = Mathf.Lerp(iter_164_2.color.r, 1, var_164_10)

							iter_164_2.color = Color.New(var_164_11, var_164_11, var_164_11)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_9 and arg_161_1.time_ < var_164_8 + var_164_9 + arg_164_0 and arg_161_1.var_.actorSpriteComps1012 then
				local var_164_12 = 1

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_12, var_164_12, var_164_12)
					end
				end

				arg_161_1.var_.actorSpriteComps1012 = nil
			end

			local var_164_13 = arg_161_1.actors_["10064"].transform
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1.var_.moveOldPos10064 = var_164_13.localPosition
				var_164_13.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("10064", 2)

				local var_164_15 = var_164_13.childCount

				for iter_164_5 = 0, var_164_15 - 1 do
					local var_164_16 = var_164_13:GetChild(iter_164_5)

					if var_164_16.name == "split_3" or not string.find(var_164_16.name, "split") then
						var_164_16.gameObject:SetActive(true)
					else
						var_164_16.gameObject:SetActive(false)
					end
				end
			end

			local var_164_17 = 0.001

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_17 then
				local var_164_18 = (arg_161_1.time_ - var_164_14) / var_164_17
				local var_164_19 = Vector3.New(-390, -570, 192.5)

				var_164_13.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10064, var_164_19, var_164_18)
			end

			if arg_161_1.time_ >= var_164_14 + var_164_17 and arg_161_1.time_ < var_164_14 + var_164_17 + arg_164_0 then
				var_164_13.localPosition = Vector3.New(-390, -570, 192.5)
			end

			local var_164_20 = arg_161_1.actors_["10064"]
			local var_164_21 = 0

			if var_164_21 < arg_161_1.time_ and arg_161_1.time_ <= var_164_21 + arg_164_0 and arg_161_1.var_.actorSpriteComps10064 == nil then
				arg_161_1.var_.actorSpriteComps10064 = var_164_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_22 = 0.034

			if var_164_21 <= arg_161_1.time_ and arg_161_1.time_ < var_164_21 + var_164_22 then
				local var_164_23 = (arg_161_1.time_ - var_164_21) / var_164_22

				if arg_161_1.var_.actorSpriteComps10064 then
					for iter_164_6, iter_164_7 in pairs(arg_161_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_164_7 then
							local var_164_24 = Mathf.Lerp(iter_164_7.color.r, 0.5, var_164_23)

							iter_164_7.color = Color.New(var_164_24, var_164_24, var_164_24)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_21 + var_164_22 and arg_161_1.time_ < var_164_21 + var_164_22 + arg_164_0 and arg_161_1.var_.actorSpriteComps10064 then
				local var_164_25 = 0.5

				for iter_164_8, iter_164_9 in pairs(arg_161_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_164_9 then
						iter_164_9.color = Color.New(var_164_25, var_164_25, var_164_25)
					end
				end

				arg_161_1.var_.actorSpriteComps10064 = nil
			end

			local var_164_26 = 0
			local var_164_27 = 0.475

			if var_164_26 < arg_161_1.time_ and arg_161_1.time_ <= var_164_26 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_28 = arg_161_1:FormatText(StoryNameCfg[595].name)

				arg_161_1.leftNameTxt_.text = var_164_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_29 = arg_161_1:GetWordFromCfg(410041039)
				local var_164_30 = arg_161_1:FormatText(var_164_29.content)

				arg_161_1.text_.text = var_164_30

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_31 = 19
				local var_164_32 = utf8.len(var_164_30)
				local var_164_33 = var_164_31 <= 0 and var_164_27 or var_164_27 * (var_164_32 / var_164_31)

				if var_164_33 > 0 and var_164_27 < var_164_33 then
					arg_161_1.talkMaxDuration = var_164_33

					if var_164_33 + var_164_26 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_33 + var_164_26
					end
				end

				arg_161_1.text_.text = var_164_30
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041039", "story_v_out_410041.awb") ~= 0 then
					local var_164_34 = manager.audio:GetVoiceLength("story_v_out_410041", "410041039", "story_v_out_410041.awb") / 1000

					if var_164_34 + var_164_26 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_34 + var_164_26
					end

					if var_164_29.prefab_name ~= "" and arg_161_1.actors_[var_164_29.prefab_name] ~= nil then
						local var_164_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_29.prefab_name].transform, "story_v_out_410041", "410041039", "story_v_out_410041.awb")

						arg_161_1:RecordAudio("410041039", var_164_35)
						arg_161_1:RecordAudio("410041039", var_164_35)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_410041", "410041039", "story_v_out_410041.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_410041", "410041039", "story_v_out_410041.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_36 = math.max(var_164_27, arg_161_1.talkMaxDuration)

			if var_164_26 <= arg_161_1.time_ and arg_161_1.time_ < var_164_26 + var_164_36 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_26) / var_164_36

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_26 + var_164_36 and arg_161_1.time_ < var_164_26 + var_164_36 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play410041040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 410041040
		arg_165_1.duration_ = 9.399999999999

		local var_165_0 = {
			zh = 6.065999999999,
			ja = 9.399999999999
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
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play410041041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = "ST61a"

			if arg_165_1.bgs_[var_168_0] == nil then
				local var_168_1 = Object.Instantiate(arg_165_1.paintGo_)

				var_168_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_168_0)
				var_168_1.name = var_168_0
				var_168_1.transform.parent = arg_165_1.stage_.transform
				var_168_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_165_1.bgs_[var_168_0] = var_168_1
			end

			local var_168_2 = 2

			if var_168_2 < arg_165_1.time_ and arg_165_1.time_ <= var_168_2 + arg_168_0 then
				local var_168_3 = manager.ui.mainCamera.transform.localPosition
				local var_168_4 = Vector3.New(0, 0, 10) + Vector3.New(var_168_3.x, var_168_3.y, 0)
				local var_168_5 = arg_165_1.bgs_.ST61a

				var_168_5.transform.localPosition = var_168_4
				var_168_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_168_6 = var_168_5:GetComponent("SpriteRenderer")

				if var_168_6 and var_168_6.sprite then
					local var_168_7 = (var_168_5.transform.localPosition - var_168_3).z
					local var_168_8 = manager.ui.mainCameraCom_
					local var_168_9 = 2 * var_168_7 * Mathf.Tan(var_168_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_168_10 = var_168_9 * var_168_8.aspect
					local var_168_11 = var_168_6.sprite.bounds.size.x
					local var_168_12 = var_168_6.sprite.bounds.size.y
					local var_168_13 = var_168_10 / var_168_11
					local var_168_14 = var_168_9 / var_168_12
					local var_168_15 = var_168_14 < var_168_13 and var_168_13 or var_168_14

					var_168_5.transform.localScale = Vector3.New(var_168_15, var_168_15, 0)
				end

				for iter_168_0, iter_168_1 in pairs(arg_165_1.bgs_) do
					if iter_168_0 ~= "ST61a" then
						iter_168_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_168_16 = 0

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_17 = 2

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17
				local var_168_19 = Color.New(0, 0, 0)

				var_168_19.a = Mathf.Lerp(0, 1, var_168_18)
				arg_165_1.mask_.color = var_168_19
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 then
				local var_168_20 = Color.New(0, 0, 0)

				var_168_20.a = 1
				arg_165_1.mask_.color = var_168_20
			end

			local var_168_21 = 2

			if var_168_21 < arg_165_1.time_ and arg_165_1.time_ <= var_168_21 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_22 = 2

			if var_168_21 <= arg_165_1.time_ and arg_165_1.time_ < var_168_21 + var_168_22 then
				local var_168_23 = (arg_165_1.time_ - var_168_21) / var_168_22
				local var_168_24 = Color.New(0, 0, 0)

				var_168_24.a = Mathf.Lerp(1, 0, var_168_23)
				arg_165_1.mask_.color = var_168_24
			end

			if arg_165_1.time_ >= var_168_21 + var_168_22 and arg_165_1.time_ < var_168_21 + var_168_22 + arg_168_0 then
				local var_168_25 = Color.New(0, 0, 0)
				local var_168_26 = 0

				arg_165_1.mask_.enabled = false
				var_168_25.a = var_168_26
				arg_165_1.mask_.color = var_168_25
			end

			local var_168_27 = "1060"

			if arg_165_1.actors_[var_168_27] == nil then
				local var_168_28 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_168_27), arg_165_1.canvasGo_.transform)

				var_168_28.transform:SetSiblingIndex(1)

				var_168_28.name = var_168_27
				var_168_28.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_165_1.actors_[var_168_27] = var_168_28
			end

			local var_168_29 = arg_165_1.actors_["1060"].transform
			local var_168_30 = 4

			if var_168_30 < arg_165_1.time_ and arg_165_1.time_ <= var_168_30 + arg_168_0 then
				arg_165_1.var_.moveOldPos1060 = var_168_29.localPosition
				var_168_29.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("1060", 2)

				local var_168_31 = var_168_29.childCount

				for iter_168_2 = 0, var_168_31 - 1 do
					local var_168_32 = var_168_29:GetChild(iter_168_2)

					if var_168_32.name == "" or not string.find(var_168_32.name, "split") then
						var_168_32.gameObject:SetActive(true)
					else
						var_168_32.gameObject:SetActive(false)
					end
				end
			end

			local var_168_33 = 0.001

			if var_168_30 <= arg_165_1.time_ and arg_165_1.time_ < var_168_30 + var_168_33 then
				local var_168_34 = (arg_165_1.time_ - var_168_30) / var_168_33
				local var_168_35 = Vector3.New(-390, -435, -40)

				var_168_29.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1060, var_168_35, var_168_34)
			end

			if arg_165_1.time_ >= var_168_30 + var_168_33 and arg_165_1.time_ < var_168_30 + var_168_33 + arg_168_0 then
				var_168_29.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_168_36 = "1056"

			if arg_165_1.actors_[var_168_36] == nil then
				local var_168_37 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_168_36), arg_165_1.canvasGo_.transform)

				var_168_37.transform:SetSiblingIndex(1)

				var_168_37.name = var_168_36
				var_168_37.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_165_1.actors_[var_168_36] = var_168_37
			end

			local var_168_38 = arg_165_1.actors_["1056"].transform
			local var_168_39 = 4

			if var_168_39 < arg_165_1.time_ and arg_165_1.time_ <= var_168_39 + arg_168_0 then
				arg_165_1.var_.moveOldPos1056 = var_168_38.localPosition
				var_168_38.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("1056", 4)

				local var_168_40 = var_168_38.childCount

				for iter_168_3 = 0, var_168_40 - 1 do
					local var_168_41 = var_168_38:GetChild(iter_168_3)

					if var_168_41.name == "" or not string.find(var_168_41.name, "split") then
						var_168_41.gameObject:SetActive(true)
					else
						var_168_41.gameObject:SetActive(false)
					end
				end
			end

			local var_168_42 = 0.001

			if var_168_39 <= arg_165_1.time_ and arg_165_1.time_ < var_168_39 + var_168_42 then
				local var_168_43 = (arg_165_1.time_ - var_168_39) / var_168_42
				local var_168_44 = Vector3.New(390, -350, -180)

				var_168_38.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1056, var_168_44, var_168_43)
			end

			if arg_165_1.time_ >= var_168_39 + var_168_42 and arg_165_1.time_ < var_168_39 + var_168_42 + arg_168_0 then
				var_168_38.localPosition = Vector3.New(390, -350, -180)
			end

			local var_168_45 = arg_165_1.actors_["1012"].transform
			local var_168_46 = 1.999999999999

			if var_168_46 < arg_165_1.time_ and arg_165_1.time_ <= var_168_46 + arg_168_0 then
				arg_165_1.var_.moveOldPos1012 = var_168_45.localPosition
				var_168_45.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("1012", 7)

				local var_168_47 = var_168_45.childCount

				for iter_168_4 = 0, var_168_47 - 1 do
					local var_168_48 = var_168_45:GetChild(iter_168_4)

					if var_168_48.name == "" or not string.find(var_168_48.name, "split") then
						var_168_48.gameObject:SetActive(true)
					else
						var_168_48.gameObject:SetActive(false)
					end
				end
			end

			local var_168_49 = 0.001

			if var_168_46 <= arg_165_1.time_ and arg_165_1.time_ < var_168_46 + var_168_49 then
				local var_168_50 = (arg_165_1.time_ - var_168_46) / var_168_49
				local var_168_51 = Vector3.New(0, -2000, 300)

				var_168_45.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1012, var_168_51, var_168_50)
			end

			if arg_165_1.time_ >= var_168_46 + var_168_49 and arg_165_1.time_ < var_168_46 + var_168_49 + arg_168_0 then
				var_168_45.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_168_52 = arg_165_1.actors_["1060"]
			local var_168_53 = 4

			if var_168_53 < arg_165_1.time_ and arg_165_1.time_ <= var_168_53 + arg_168_0 and arg_165_1.var_.actorSpriteComps1060 == nil then
				arg_165_1.var_.actorSpriteComps1060 = var_168_52:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_54 = 0.034

			if var_168_53 <= arg_165_1.time_ and arg_165_1.time_ < var_168_53 + var_168_54 then
				local var_168_55 = (arg_165_1.time_ - var_168_53) / var_168_54

				if arg_165_1.var_.actorSpriteComps1060 then
					for iter_168_5, iter_168_6 in pairs(arg_165_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_168_6 then
							local var_168_56 = Mathf.Lerp(iter_168_6.color.r, 1, var_168_55)

							iter_168_6.color = Color.New(var_168_56, var_168_56, var_168_56)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_53 + var_168_54 and arg_165_1.time_ < var_168_53 + var_168_54 + arg_168_0 and arg_165_1.var_.actorSpriteComps1060 then
				local var_168_57 = 1

				for iter_168_7, iter_168_8 in pairs(arg_165_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_168_8 then
						iter_168_8.color = Color.New(var_168_57, var_168_57, var_168_57)
					end
				end

				arg_165_1.var_.actorSpriteComps1060 = nil
			end

			local var_168_58 = arg_165_1.actors_["1056"]
			local var_168_59 = 4

			if var_168_59 < arg_165_1.time_ and arg_165_1.time_ <= var_168_59 + arg_168_0 and arg_165_1.var_.actorSpriteComps1056 == nil then
				arg_165_1.var_.actorSpriteComps1056 = var_168_58:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_60 = 0.034

			if var_168_59 <= arg_165_1.time_ and arg_165_1.time_ < var_168_59 + var_168_60 then
				local var_168_61 = (arg_165_1.time_ - var_168_59) / var_168_60

				if arg_165_1.var_.actorSpriteComps1056 then
					for iter_168_9, iter_168_10 in pairs(arg_165_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_168_10 then
							local var_168_62 = Mathf.Lerp(iter_168_10.color.r, 0.5, var_168_61)

							iter_168_10.color = Color.New(var_168_62, var_168_62, var_168_62)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_59 + var_168_60 and arg_165_1.time_ < var_168_59 + var_168_60 + arg_168_0 and arg_165_1.var_.actorSpriteComps1056 then
				local var_168_63 = 0.5

				for iter_168_11, iter_168_12 in pairs(arg_165_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_168_12 then
						iter_168_12.color = Color.New(var_168_63, var_168_63, var_168_63)
					end
				end

				arg_165_1.var_.actorSpriteComps1056 = nil
			end

			local var_168_64 = arg_165_1.actors_["1060"].transform
			local var_168_65 = 2

			if var_168_65 < arg_165_1.time_ and arg_165_1.time_ <= var_168_65 + arg_168_0 then
				arg_165_1.var_.moveOldPos1060 = var_168_64.localPosition
				var_168_64.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("1060", 7)

				local var_168_66 = var_168_64.childCount

				for iter_168_13 = 0, var_168_66 - 1 do
					local var_168_67 = var_168_64:GetChild(iter_168_13)

					if var_168_67.name == "" or not string.find(var_168_67.name, "split") then
						var_168_67.gameObject:SetActive(true)
					else
						var_168_67.gameObject:SetActive(false)
					end
				end
			end

			local var_168_68 = 0.001

			if var_168_65 <= arg_165_1.time_ and arg_165_1.time_ < var_168_65 + var_168_68 then
				local var_168_69 = (arg_165_1.time_ - var_168_65) / var_168_68
				local var_168_70 = Vector3.New(0, -2000, -40)

				var_168_64.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1060, var_168_70, var_168_69)
			end

			if arg_165_1.time_ >= var_168_65 + var_168_68 and arg_165_1.time_ < var_168_65 + var_168_68 + arg_168_0 then
				var_168_64.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_168_71 = 1.999999999999

			if var_168_71 < arg_165_1.time_ and arg_165_1.time_ <= var_168_71 + arg_168_0 then
				arg_165_1.screenFilterGo_:SetActive(false)
			end

			local var_168_72 = 0.0166666666666667

			if var_168_71 <= arg_165_1.time_ and arg_165_1.time_ < var_168_71 + var_168_72 then
				local var_168_73 = (arg_165_1.time_ - var_168_71) / var_168_72

				arg_165_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_168_73)
			end

			if arg_165_1.time_ >= var_168_71 + var_168_72 and arg_165_1.time_ < var_168_71 + var_168_72 + arg_168_0 then
				arg_165_1.screenFilterEffect_.weight = 0
			end

			local var_168_74 = arg_165_1.actors_["10064"].transform
			local var_168_75 = 2

			if var_168_75 < arg_165_1.time_ and arg_165_1.time_ <= var_168_75 + arg_168_0 then
				arg_165_1.var_.moveOldPos10064 = var_168_74.localPosition
				var_168_74.localScale = Vector3.New(1, 1, 1)

				arg_165_1:CheckSpriteTmpPos("10064", 7)

				local var_168_76 = var_168_74.childCount

				for iter_168_14 = 0, var_168_76 - 1 do
					local var_168_77 = var_168_74:GetChild(iter_168_14)

					if var_168_77.name == "split_3" or not string.find(var_168_77.name, "split") then
						var_168_77.gameObject:SetActive(true)
					else
						var_168_77.gameObject:SetActive(false)
					end
				end
			end

			local var_168_78 = 0.001

			if var_168_75 <= arg_165_1.time_ and arg_165_1.time_ < var_168_75 + var_168_78 then
				local var_168_79 = (arg_165_1.time_ - var_168_75) / var_168_78
				local var_168_80 = Vector3.New(0, -2000, 192.5)

				var_168_74.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos10064, var_168_80, var_168_79)
			end

			if arg_165_1.time_ >= var_168_75 + var_168_78 and arg_165_1.time_ < var_168_75 + var_168_78 + arg_168_0 then
				var_168_74.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_168_81 = 0
			local var_168_82 = 0.133333333333333

			if var_168_81 < arg_165_1.time_ and arg_165_1.time_ <= var_168_81 + arg_168_0 then
				local var_168_83 = "play"
				local var_168_84 = "music"

				arg_165_1:AudioAction(var_168_83, var_168_84, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_168_85 = 0.3
			local var_168_86 = 1

			if var_168_85 < arg_165_1.time_ and arg_165_1.time_ <= var_168_85 + arg_168_0 then
				local var_168_87 = "play"
				local var_168_88 = "music"

				arg_165_1:AudioAction(var_168_87, var_168_88, "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism.awb")
			end

			if arg_165_1.frameCnt_ <= 1 then
				arg_165_1.dialog_:SetActive(false)
			end

			local var_168_89 = 3.999999999999
			local var_168_90 = 0.225

			if var_168_89 < arg_165_1.time_ and arg_165_1.time_ <= var_168_89 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0

				arg_165_1.dialog_:SetActive(true)

				local var_168_91 = LeanTween.value(arg_165_1.dialog_, 0, 1, 0.3)

				var_168_91:setOnUpdate(LuaHelper.FloatAction(function(arg_169_0)
					arg_165_1.dialogCg_.alpha = arg_169_0
				end))
				var_168_91:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_165_1.dialog_)
					var_168_91:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_165_1.duration_ = arg_165_1.duration_ + 0.3

				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_92 = arg_165_1:FormatText(StoryNameCfg[584].name)

				arg_165_1.leftNameTxt_.text = var_168_92

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_93 = arg_165_1:GetWordFromCfg(410041040)
				local var_168_94 = arg_165_1:FormatText(var_168_93.content)

				arg_165_1.text_.text = var_168_94

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_95 = 9
				local var_168_96 = utf8.len(var_168_94)
				local var_168_97 = var_168_95 <= 0 and var_168_90 or var_168_90 * (var_168_96 / var_168_95)

				if var_168_97 > 0 and var_168_90 < var_168_97 then
					arg_165_1.talkMaxDuration = var_168_97
					var_168_89 = var_168_89 + 0.3

					if var_168_97 + var_168_89 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_97 + var_168_89
					end
				end

				arg_165_1.text_.text = var_168_94
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041040", "story_v_out_410041.awb") ~= 0 then
					local var_168_98 = manager.audio:GetVoiceLength("story_v_out_410041", "410041040", "story_v_out_410041.awb") / 1000

					if var_168_98 + var_168_89 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_98 + var_168_89
					end

					if var_168_93.prefab_name ~= "" and arg_165_1.actors_[var_168_93.prefab_name] ~= nil then
						local var_168_99 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_93.prefab_name].transform, "story_v_out_410041", "410041040", "story_v_out_410041.awb")

						arg_165_1:RecordAudio("410041040", var_168_99)
						arg_165_1:RecordAudio("410041040", var_168_99)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_410041", "410041040", "story_v_out_410041.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_410041", "410041040", "story_v_out_410041.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_100 = var_168_89 + 0.3
			local var_168_101 = math.max(var_168_90, arg_165_1.talkMaxDuration)

			if var_168_100 <= arg_165_1.time_ and arg_165_1.time_ < var_168_100 + var_168_101 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_100) / var_168_101

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_100 + var_168_101 and arg_165_1.time_ < var_168_100 + var_168_101 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play410041041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410041041
		arg_171_1.duration_ = 8.966

		local var_171_0 = {
			zh = 7.4,
			ja = 8.966
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
				arg_171_0:Play410041042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1060"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1060 = var_174_0.localPosition
				var_174_0.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("1060", 2)

				local var_174_2 = var_174_0.childCount

				for iter_174_0 = 0, var_174_2 - 1 do
					local var_174_3 = var_174_0:GetChild(iter_174_0)

					if var_174_3.name == "" or not string.find(var_174_3.name, "split") then
						var_174_3.gameObject:SetActive(true)
					else
						var_174_3.gameObject:SetActive(false)
					end
				end
			end

			local var_174_4 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_4 then
				local var_174_5 = (arg_171_1.time_ - var_174_1) / var_174_4
				local var_174_6 = Vector3.New(-390, -435, -40)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1060, var_174_6, var_174_5)
			end

			if arg_171_1.time_ >= var_174_1 + var_174_4 and arg_171_1.time_ < var_174_1 + var_174_4 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_174_7 = arg_171_1.actors_["1060"]
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps1060 == nil then
				arg_171_1.var_.actorSpriteComps1060 = var_174_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_9 = 0.034

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_8) / var_174_9

				if arg_171_1.var_.actorSpriteComps1060 then
					for iter_174_1, iter_174_2 in pairs(arg_171_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_174_2 then
							local var_174_11 = Mathf.Lerp(iter_174_2.color.r, 1, var_174_10)

							iter_174_2.color = Color.New(var_174_11, var_174_11, var_174_11)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_8 + var_174_9 and arg_171_1.time_ < var_174_8 + var_174_9 + arg_174_0 and arg_171_1.var_.actorSpriteComps1060 then
				local var_174_12 = 1

				for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_174_4 then
						iter_174_4.color = Color.New(var_174_12, var_174_12, var_174_12)
					end
				end

				arg_171_1.var_.actorSpriteComps1060 = nil
			end

			local var_174_13 = 0
			local var_174_14 = 0.75

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_15 = arg_171_1:FormatText(StoryNameCfg[584].name)

				arg_171_1.leftNameTxt_.text = var_174_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_16 = arg_171_1:GetWordFromCfg(410041041)
				local var_174_17 = arg_171_1:FormatText(var_174_16.content)

				arg_171_1.text_.text = var_174_17

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_18 = 30
				local var_174_19 = utf8.len(var_174_17)
				local var_174_20 = var_174_18 <= 0 and var_174_14 or var_174_14 * (var_174_19 / var_174_18)

				if var_174_20 > 0 and var_174_14 < var_174_20 then
					arg_171_1.talkMaxDuration = var_174_20

					if var_174_20 + var_174_13 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_13
					end
				end

				arg_171_1.text_.text = var_174_17
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041041", "story_v_out_410041.awb") ~= 0 then
					local var_174_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041041", "story_v_out_410041.awb") / 1000

					if var_174_21 + var_174_13 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_21 + var_174_13
					end

					if var_174_16.prefab_name ~= "" and arg_171_1.actors_[var_174_16.prefab_name] ~= nil then
						local var_174_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_16.prefab_name].transform, "story_v_out_410041", "410041041", "story_v_out_410041.awb")

						arg_171_1:RecordAudio("410041041", var_174_22)
						arg_171_1:RecordAudio("410041041", var_174_22)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410041", "410041041", "story_v_out_410041.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410041", "410041041", "story_v_out_410041.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_23 = math.max(var_174_14, arg_171_1.talkMaxDuration)

			if var_174_13 <= arg_171_1.time_ and arg_171_1.time_ < var_174_13 + var_174_23 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_13) / var_174_23

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_13 + var_174_23 and arg_171_1.time_ < var_174_13 + var_174_23 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410041042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410041042
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play410041043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1060"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.actorSpriteComps1060 == nil then
				arg_175_1.var_.actorSpriteComps1060 = var_178_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_2 = 0.034

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.actorSpriteComps1060 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_178_1 then
							local var_178_4 = Mathf.Lerp(iter_178_1.color.r, 0.5, var_178_3)

							iter_178_1.color = Color.New(var_178_4, var_178_4, var_178_4)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.actorSpriteComps1060 then
				local var_178_5 = 0.5

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_5, var_178_5, var_178_5)
					end
				end

				arg_175_1.var_.actorSpriteComps1060 = nil
			end

			local var_178_6 = 0
			local var_178_7 = 1

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_8 = arg_175_1:GetWordFromCfg(410041042)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 40
				local var_178_11 = utf8.len(var_178_9)
				local var_178_12 = var_178_10 <= 0 and var_178_7 or var_178_7 * (var_178_11 / var_178_10)

				if var_178_12 > 0 and var_178_7 < var_178_12 then
					arg_175_1.talkMaxDuration = var_178_12

					if var_178_12 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_12 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_9
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_13 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_13 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_13

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_13 and arg_175_1.time_ < var_178_6 + var_178_13 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410041043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410041043
		arg_179_1.duration_ = 4.866

		local var_179_0 = {
			zh = 4.866,
			ja = 4.1
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
				arg_179_0:Play410041044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1056"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1056 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("1056", 4)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "split_1" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(390, -350, -180)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1056, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_182_7 = arg_179_1.actors_["1056"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps1056 == nil then
				arg_179_1.var_.actorSpriteComps1056 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.034

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps1056 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps1056 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps1056 = nil
			end

			local var_182_13 = 0
			local var_182_14 = 0.65

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_15 = arg_179_1:FormatText(StoryNameCfg[605].name)

				arg_179_1.leftNameTxt_.text = var_182_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_16 = arg_179_1:GetWordFromCfg(410041043)
				local var_182_17 = arg_179_1:FormatText(var_182_16.content)

				arg_179_1.text_.text = var_182_17

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_18 = 26
				local var_182_19 = utf8.len(var_182_17)
				local var_182_20 = var_182_18 <= 0 and var_182_14 or var_182_14 * (var_182_19 / var_182_18)

				if var_182_20 > 0 and var_182_14 < var_182_20 then
					arg_179_1.talkMaxDuration = var_182_20

					if var_182_20 + var_182_13 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_20 + var_182_13
					end
				end

				arg_179_1.text_.text = var_182_17
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041043", "story_v_out_410041.awb") ~= 0 then
					local var_182_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041043", "story_v_out_410041.awb") / 1000

					if var_182_21 + var_182_13 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_21 + var_182_13
					end

					if var_182_16.prefab_name ~= "" and arg_179_1.actors_[var_182_16.prefab_name] ~= nil then
						local var_182_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_16.prefab_name].transform, "story_v_out_410041", "410041043", "story_v_out_410041.awb")

						arg_179_1:RecordAudio("410041043", var_182_22)
						arg_179_1:RecordAudio("410041043", var_182_22)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410041", "410041043", "story_v_out_410041.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410041", "410041043", "story_v_out_410041.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_23 = math.max(var_182_14, arg_179_1.talkMaxDuration)

			if var_182_13 <= arg_179_1.time_ and arg_179_1.time_ < var_182_13 + var_182_23 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_13) / var_182_23

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_13 + var_182_23 and arg_179_1.time_ < var_182_13 + var_182_23 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play410041044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410041044
		arg_183_1.duration_ = 14

		local var_183_0 = {
			zh = 10.633,
			ja = 14
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
				arg_183_0:Play410041045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1060"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1060 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("1060", 2)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "split_2" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(-390, -435, -40)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1060, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_186_7 = arg_183_1.actors_["1060"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps1060 == nil then
				arg_183_1.var_.actorSpriteComps1060 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps1060 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 1, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps1060 then
				local var_186_12 = 1

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps1060 = nil
			end

			local var_186_13 = arg_183_1.actors_["1056"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 and arg_183_1.var_.actorSpriteComps1056 == nil then
				arg_183_1.var_.actorSpriteComps1056 = var_186_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_15 = 0.034

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_15 then
				local var_186_16 = (arg_183_1.time_ - var_186_14) / var_186_15

				if arg_183_1.var_.actorSpriteComps1056 then
					for iter_186_5, iter_186_6 in pairs(arg_183_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_186_6 then
							local var_186_17 = Mathf.Lerp(iter_186_6.color.r, 0.5, var_186_16)

							iter_186_6.color = Color.New(var_186_17, var_186_17, var_186_17)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.actorSpriteComps1056 then
				local var_186_18 = 0.5

				for iter_186_7, iter_186_8 in pairs(arg_183_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_186_8 then
						iter_186_8.color = Color.New(var_186_18, var_186_18, var_186_18)
					end
				end

				arg_183_1.var_.actorSpriteComps1056 = nil
			end

			local var_186_19 = 0
			local var_186_20 = 1.45

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[584].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(410041044)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 57
				local var_186_25 = utf8.len(var_186_23)
				local var_186_26 = var_186_24 <= 0 and var_186_20 or var_186_20 * (var_186_25 / var_186_24)

				if var_186_26 > 0 and var_186_20 < var_186_26 then
					arg_183_1.talkMaxDuration = var_186_26

					if var_186_26 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_26 + var_186_19
					end
				end

				arg_183_1.text_.text = var_186_23
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041044", "story_v_out_410041.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041044", "story_v_out_410041.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_410041", "410041044", "story_v_out_410041.awb")

						arg_183_1:RecordAudio("410041044", var_186_28)
						arg_183_1:RecordAudio("410041044", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410041", "410041044", "story_v_out_410041.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410041", "410041044", "story_v_out_410041.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_29 = math.max(var_186_20, arg_183_1.talkMaxDuration)

			if var_186_19 <= arg_183_1.time_ and arg_183_1.time_ < var_186_19 + var_186_29 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_19) / var_186_29

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_19 + var_186_29 and arg_183_1.time_ < var_186_19 + var_186_29 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play410041045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410041045
		arg_187_1.duration_ = 8.733

		local var_187_0 = {
			zh = 7.966,
			ja = 8.733
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
				arg_187_0:Play410041046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1060"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1060 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1060", 2)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(-390, -435, -40)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1060, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_190_7 = arg_187_1.actors_["1060"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps1060 == nil then
				arg_187_1.var_.actorSpriteComps1060 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.034

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps1060 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps1060 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps1060 = nil
			end

			local var_190_13 = 0
			local var_190_14 = 0.95

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_15 = arg_187_1:FormatText(StoryNameCfg[584].name)

				arg_187_1.leftNameTxt_.text = var_190_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_16 = arg_187_1:GetWordFromCfg(410041045)
				local var_190_17 = arg_187_1:FormatText(var_190_16.content)

				arg_187_1.text_.text = var_190_17

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_18 = 38
				local var_190_19 = utf8.len(var_190_17)
				local var_190_20 = var_190_18 <= 0 and var_190_14 or var_190_14 * (var_190_19 / var_190_18)

				if var_190_20 > 0 and var_190_14 < var_190_20 then
					arg_187_1.talkMaxDuration = var_190_20

					if var_190_20 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_13
					end
				end

				arg_187_1.text_.text = var_190_17
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041045", "story_v_out_410041.awb") ~= 0 then
					local var_190_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041045", "story_v_out_410041.awb") / 1000

					if var_190_21 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_21 + var_190_13
					end

					if var_190_16.prefab_name ~= "" and arg_187_1.actors_[var_190_16.prefab_name] ~= nil then
						local var_190_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_16.prefab_name].transform, "story_v_out_410041", "410041045", "story_v_out_410041.awb")

						arg_187_1:RecordAudio("410041045", var_190_22)
						arg_187_1:RecordAudio("410041045", var_190_22)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410041", "410041045", "story_v_out_410041.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410041", "410041045", "story_v_out_410041.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_23 = math.max(var_190_14, arg_187_1.talkMaxDuration)

			if var_190_13 <= arg_187_1.time_ and arg_187_1.time_ < var_190_13 + var_190_23 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_13) / var_190_23

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_13 + var_190_23 and arg_187_1.time_ < var_190_13 + var_190_23 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410041046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410041046
		arg_191_1.duration_ = 7.5

		local var_191_0 = {
			zh = 4.566,
			ja = 7.5
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play410041047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1056"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1056 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1056", 4)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "split_4" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(390, -350, -180)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1056, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_194_7 = arg_191_1.actors_["1056"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps1056 == nil then
				arg_191_1.var_.actorSpriteComps1056 = var_194_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_9 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_8) / var_194_9

				if arg_191_1.var_.actorSpriteComps1056 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_194_2 then
							local var_194_11 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_10)

							iter_194_2.color = Color.New(var_194_11, var_194_11, var_194_11)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_9 and arg_191_1.time_ < var_194_8 + var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps1056 then
				local var_194_12 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_12, var_194_12, var_194_12)
					end
				end

				arg_191_1.var_.actorSpriteComps1056 = nil
			end

			local var_194_13 = arg_191_1.actors_["1060"]
			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 and arg_191_1.var_.actorSpriteComps1060 == nil then
				arg_191_1.var_.actorSpriteComps1060 = var_194_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_15 = 0.034

			if var_194_14 <= arg_191_1.time_ and arg_191_1.time_ < var_194_14 + var_194_15 then
				local var_194_16 = (arg_191_1.time_ - var_194_14) / var_194_15

				if arg_191_1.var_.actorSpriteComps1060 then
					for iter_194_5, iter_194_6 in pairs(arg_191_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_194_6 then
							local var_194_17 = Mathf.Lerp(iter_194_6.color.r, 0.5, var_194_16)

							iter_194_6.color = Color.New(var_194_17, var_194_17, var_194_17)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_14 + var_194_15 and arg_191_1.time_ < var_194_14 + var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps1060 then
				local var_194_18 = 0.5

				for iter_194_7, iter_194_8 in pairs(arg_191_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_194_8 then
						iter_194_8.color = Color.New(var_194_18, var_194_18, var_194_18)
					end
				end

				arg_191_1.var_.actorSpriteComps1060 = nil
			end

			local var_194_19 = 0
			local var_194_20 = 0.525

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_21 = arg_191_1:FormatText(StoryNameCfg[605].name)

				arg_191_1.leftNameTxt_.text = var_194_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_22 = arg_191_1:GetWordFromCfg(410041046)
				local var_194_23 = arg_191_1:FormatText(var_194_22.content)

				arg_191_1.text_.text = var_194_23

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_24 = 21
				local var_194_25 = utf8.len(var_194_23)
				local var_194_26 = var_194_24 <= 0 and var_194_20 or var_194_20 * (var_194_25 / var_194_24)

				if var_194_26 > 0 and var_194_20 < var_194_26 then
					arg_191_1.talkMaxDuration = var_194_26

					if var_194_26 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_26 + var_194_19
					end
				end

				arg_191_1.text_.text = var_194_23
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041046", "story_v_out_410041.awb") ~= 0 then
					local var_194_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041046", "story_v_out_410041.awb") / 1000

					if var_194_27 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_27 + var_194_19
					end

					if var_194_22.prefab_name ~= "" and arg_191_1.actors_[var_194_22.prefab_name] ~= nil then
						local var_194_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_22.prefab_name].transform, "story_v_out_410041", "410041046", "story_v_out_410041.awb")

						arg_191_1:RecordAudio("410041046", var_194_28)
						arg_191_1:RecordAudio("410041046", var_194_28)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410041", "410041046", "story_v_out_410041.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410041", "410041046", "story_v_out_410041.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_29 = math.max(var_194_20, arg_191_1.talkMaxDuration)

			if var_194_19 <= arg_191_1.time_ and arg_191_1.time_ < var_194_19 + var_194_29 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_19) / var_194_29

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_19 + var_194_29 and arg_191_1.time_ < var_194_19 + var_194_29 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410041047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410041047
		arg_195_1.duration_ = 7.5

		local var_195_0 = {
			zh = 3.3,
			ja = 7.5
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
				arg_195_0:Play410041048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1060"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1060 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("1060", 2)

				local var_198_2 = var_198_0.childCount

				for iter_198_0 = 0, var_198_2 - 1 do
					local var_198_3 = var_198_0:GetChild(iter_198_0)

					if var_198_3.name == "" or not string.find(var_198_3.name, "split") then
						var_198_3.gameObject:SetActive(true)
					else
						var_198_3.gameObject:SetActive(false)
					end
				end
			end

			local var_198_4 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_4 then
				local var_198_5 = (arg_195_1.time_ - var_198_1) / var_198_4
				local var_198_6 = Vector3.New(-390, -435, -40)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1060, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_198_7 = arg_195_1.actors_["1060"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps1060 == nil then
				arg_195_1.var_.actorSpriteComps1060 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.034

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps1060 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 1, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps1060 then
				local var_198_12 = 1

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps1060 = nil
			end

			local var_198_13 = arg_195_1.actors_["1056"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps1056 == nil then
				arg_195_1.var_.actorSpriteComps1056 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.034

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps1056 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 0.5, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps1056 then
				local var_198_18 = 0.5

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps1056 = nil
			end

			local var_198_19 = 0
			local var_198_20 = 0.375

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_21 = arg_195_1:FormatText(StoryNameCfg[584].name)

				arg_195_1.leftNameTxt_.text = var_198_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_22 = arg_195_1:GetWordFromCfg(410041047)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 15
				local var_198_25 = utf8.len(var_198_23)
				local var_198_26 = var_198_24 <= 0 and var_198_20 or var_198_20 * (var_198_25 / var_198_24)

				if var_198_26 > 0 and var_198_20 < var_198_26 then
					arg_195_1.talkMaxDuration = var_198_26

					if var_198_26 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_26 + var_198_19
					end
				end

				arg_195_1.text_.text = var_198_23
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041047", "story_v_out_410041.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041047", "story_v_out_410041.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_410041", "410041047", "story_v_out_410041.awb")

						arg_195_1:RecordAudio("410041047", var_198_28)
						arg_195_1:RecordAudio("410041047", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410041", "410041047", "story_v_out_410041.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410041", "410041047", "story_v_out_410041.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_29 = math.max(var_198_20, arg_195_1.talkMaxDuration)

			if var_198_19 <= arg_195_1.time_ and arg_195_1.time_ < var_198_19 + var_198_29 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_19) / var_198_29

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_19 + var_198_29 and arg_195_1.time_ < var_198_19 + var_198_29 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play410041048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410041048
		arg_199_1.duration_ = 10.633

		local var_199_0 = {
			zh = 8.1,
			ja = 10.633
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
				arg_199_0:Play410041049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1060"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1060 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1060", 2)

				local var_202_2 = var_202_0.childCount

				for iter_202_0 = 0, var_202_2 - 1 do
					local var_202_3 = var_202_0:GetChild(iter_202_0)

					if var_202_3.name == "" or not string.find(var_202_3.name, "split") then
						var_202_3.gameObject:SetActive(true)
					else
						var_202_3.gameObject:SetActive(false)
					end
				end
			end

			local var_202_4 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_1) / var_202_4
				local var_202_6 = Vector3.New(-390, -435, -40)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1060, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_202_7 = arg_199_1.actors_["1060"]
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1060 == nil then
				arg_199_1.var_.actorSpriteComps1060 = var_202_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_9 = 0.034

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9

				if arg_199_1.var_.actorSpriteComps1060 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_202_2 then
							local var_202_11 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_10)

							iter_202_2.color = Color.New(var_202_11, var_202_11, var_202_11)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps1060 then
				local var_202_12 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_12, var_202_12, var_202_12)
					end
				end

				arg_199_1.var_.actorSpriteComps1060 = nil
			end

			local var_202_13 = 0
			local var_202_14 = 1.075

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_15 = arg_199_1:FormatText(StoryNameCfg[584].name)

				arg_199_1.leftNameTxt_.text = var_202_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_16 = arg_199_1:GetWordFromCfg(410041048)
				local var_202_17 = arg_199_1:FormatText(var_202_16.content)

				arg_199_1.text_.text = var_202_17

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_18 = 43
				local var_202_19 = utf8.len(var_202_17)
				local var_202_20 = var_202_18 <= 0 and var_202_14 or var_202_14 * (var_202_19 / var_202_18)

				if var_202_20 > 0 and var_202_14 < var_202_20 then
					arg_199_1.talkMaxDuration = var_202_20

					if var_202_20 + var_202_13 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_13
					end
				end

				arg_199_1.text_.text = var_202_17
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041048", "story_v_out_410041.awb") ~= 0 then
					local var_202_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041048", "story_v_out_410041.awb") / 1000

					if var_202_21 + var_202_13 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_21 + var_202_13
					end

					if var_202_16.prefab_name ~= "" and arg_199_1.actors_[var_202_16.prefab_name] ~= nil then
						local var_202_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_16.prefab_name].transform, "story_v_out_410041", "410041048", "story_v_out_410041.awb")

						arg_199_1:RecordAudio("410041048", var_202_22)
						arg_199_1:RecordAudio("410041048", var_202_22)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410041", "410041048", "story_v_out_410041.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410041", "410041048", "story_v_out_410041.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_23 = math.max(var_202_14, arg_199_1.talkMaxDuration)

			if var_202_13 <= arg_199_1.time_ and arg_199_1.time_ < var_202_13 + var_202_23 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_13) / var_202_23

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_13 + var_202_23 and arg_199_1.time_ < var_202_13 + var_202_23 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play410041049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410041049
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play410041050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1060"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps1060 == nil then
				arg_203_1.var_.actorSpriteComps1060 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 0.034

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps1060 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_206_1 then
							local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 0.5, var_206_3)

							iter_206_1.color = Color.New(var_206_4, var_206_4, var_206_4)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps1060 then
				local var_206_5 = 0.5

				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_206_3 then
						iter_206_3.color = Color.New(var_206_5, var_206_5, var_206_5)
					end
				end

				arg_203_1.var_.actorSpriteComps1060 = nil
			end

			local var_206_6 = 0
			local var_206_7 = 1.1

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_8 = arg_203_1:GetWordFromCfg(410041049)
				local var_206_9 = arg_203_1:FormatText(var_206_8.content)

				arg_203_1.text_.text = var_206_9

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_10 = 44
				local var_206_11 = utf8.len(var_206_9)
				local var_206_12 = var_206_10 <= 0 and var_206_7 or var_206_7 * (var_206_11 / var_206_10)

				if var_206_12 > 0 and var_206_7 < var_206_12 then
					arg_203_1.talkMaxDuration = var_206_12

					if var_206_12 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_12 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_9
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_13 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_13 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_13

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_13 and arg_203_1.time_ < var_206_6 + var_206_13 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410041050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410041050
		arg_207_1.duration_ = 11.4

		local var_207_0 = {
			zh = 10.266,
			ja = 11.4
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
				arg_207_0:Play410041051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1056"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1056 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1056", 4)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "split_4" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(390, -350, -180)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1056, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_210_7 = arg_207_1.actors_["1056"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps1056 == nil then
				arg_207_1.var_.actorSpriteComps1056 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.034

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps1056 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 1, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps1056 then
				local var_210_12 = 1

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps1056 = nil
			end

			local var_210_13 = 0
			local var_210_14 = 1.225

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_15 = arg_207_1:FormatText(StoryNameCfg[605].name)

				arg_207_1.leftNameTxt_.text = var_210_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_16 = arg_207_1:GetWordFromCfg(410041050)
				local var_210_17 = arg_207_1:FormatText(var_210_16.content)

				arg_207_1.text_.text = var_210_17

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_18 = 49
				local var_210_19 = utf8.len(var_210_17)
				local var_210_20 = var_210_18 <= 0 and var_210_14 or var_210_14 * (var_210_19 / var_210_18)

				if var_210_20 > 0 and var_210_14 < var_210_20 then
					arg_207_1.talkMaxDuration = var_210_20

					if var_210_20 + var_210_13 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_13
					end
				end

				arg_207_1.text_.text = var_210_17
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041050", "story_v_out_410041.awb") ~= 0 then
					local var_210_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041050", "story_v_out_410041.awb") / 1000

					if var_210_21 + var_210_13 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_21 + var_210_13
					end

					if var_210_16.prefab_name ~= "" and arg_207_1.actors_[var_210_16.prefab_name] ~= nil then
						local var_210_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_16.prefab_name].transform, "story_v_out_410041", "410041050", "story_v_out_410041.awb")

						arg_207_1:RecordAudio("410041050", var_210_22)
						arg_207_1:RecordAudio("410041050", var_210_22)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_410041", "410041050", "story_v_out_410041.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_410041", "410041050", "story_v_out_410041.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_23 = math.max(var_210_14, arg_207_1.talkMaxDuration)

			if var_210_13 <= arg_207_1.time_ and arg_207_1.time_ < var_210_13 + var_210_23 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_13) / var_210_23

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_13 + var_210_23 and arg_207_1.time_ < var_210_13 + var_210_23 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410041051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410041051
		arg_211_1.duration_ = 1.9

		local var_211_0 = {
			zh = 1.433,
			ja = 1.9
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
				arg_211_0:Play410041052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1060"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1060 = var_214_0.localPosition
				var_214_0.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("1060", 2)

				local var_214_2 = var_214_0.childCount

				for iter_214_0 = 0, var_214_2 - 1 do
					local var_214_3 = var_214_0:GetChild(iter_214_0)

					if var_214_3.name == "split_4" or not string.find(var_214_3.name, "split") then
						var_214_3.gameObject:SetActive(true)
					else
						var_214_3.gameObject:SetActive(false)
					end
				end
			end

			local var_214_4 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_4 then
				local var_214_5 = (arg_211_1.time_ - var_214_1) / var_214_4
				local var_214_6 = Vector3.New(-390, -435, -40)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1060, var_214_6, var_214_5)
			end

			if arg_211_1.time_ >= var_214_1 + var_214_4 and arg_211_1.time_ < var_214_1 + var_214_4 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_214_7 = arg_211_1.actors_["1060"]
			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 and arg_211_1.var_.actorSpriteComps1060 == nil then
				arg_211_1.var_.actorSpriteComps1060 = var_214_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_9 = 0.034

			if var_214_8 <= arg_211_1.time_ and arg_211_1.time_ < var_214_8 + var_214_9 then
				local var_214_10 = (arg_211_1.time_ - var_214_8) / var_214_9

				if arg_211_1.var_.actorSpriteComps1060 then
					for iter_214_1, iter_214_2 in pairs(arg_211_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_214_2 then
							local var_214_11 = Mathf.Lerp(iter_214_2.color.r, 1, var_214_10)

							iter_214_2.color = Color.New(var_214_11, var_214_11, var_214_11)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_8 + var_214_9 and arg_211_1.time_ < var_214_8 + var_214_9 + arg_214_0 and arg_211_1.var_.actorSpriteComps1060 then
				local var_214_12 = 1

				for iter_214_3, iter_214_4 in pairs(arg_211_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_214_4 then
						iter_214_4.color = Color.New(var_214_12, var_214_12, var_214_12)
					end
				end

				arg_211_1.var_.actorSpriteComps1060 = nil
			end

			local var_214_13 = arg_211_1.actors_["1056"]
			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 and arg_211_1.var_.actorSpriteComps1056 == nil then
				arg_211_1.var_.actorSpriteComps1056 = var_214_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_15 = 0.034

			if var_214_14 <= arg_211_1.time_ and arg_211_1.time_ < var_214_14 + var_214_15 then
				local var_214_16 = (arg_211_1.time_ - var_214_14) / var_214_15

				if arg_211_1.var_.actorSpriteComps1056 then
					for iter_214_5, iter_214_6 in pairs(arg_211_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_214_6 then
							local var_214_17 = Mathf.Lerp(iter_214_6.color.r, 0.5, var_214_16)

							iter_214_6.color = Color.New(var_214_17, var_214_17, var_214_17)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_14 + var_214_15 and arg_211_1.time_ < var_214_14 + var_214_15 + arg_214_0 and arg_211_1.var_.actorSpriteComps1056 then
				local var_214_18 = 0.5

				for iter_214_7, iter_214_8 in pairs(arg_211_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_214_8 then
						iter_214_8.color = Color.New(var_214_18, var_214_18, var_214_18)
					end
				end

				arg_211_1.var_.actorSpriteComps1056 = nil
			end

			local var_214_19 = 0
			local var_214_20 = 0.125

			if var_214_19 < arg_211_1.time_ and arg_211_1.time_ <= var_214_19 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_21 = arg_211_1:FormatText(StoryNameCfg[584].name)

				arg_211_1.leftNameTxt_.text = var_214_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_22 = arg_211_1:GetWordFromCfg(410041051)
				local var_214_23 = arg_211_1:FormatText(var_214_22.content)

				arg_211_1.text_.text = var_214_23

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_24 = 5
				local var_214_25 = utf8.len(var_214_23)
				local var_214_26 = var_214_24 <= 0 and var_214_20 or var_214_20 * (var_214_25 / var_214_24)

				if var_214_26 > 0 and var_214_20 < var_214_26 then
					arg_211_1.talkMaxDuration = var_214_26

					if var_214_26 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_26 + var_214_19
					end
				end

				arg_211_1.text_.text = var_214_23
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041051", "story_v_out_410041.awb") ~= 0 then
					local var_214_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041051", "story_v_out_410041.awb") / 1000

					if var_214_27 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_27 + var_214_19
					end

					if var_214_22.prefab_name ~= "" and arg_211_1.actors_[var_214_22.prefab_name] ~= nil then
						local var_214_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_22.prefab_name].transform, "story_v_out_410041", "410041051", "story_v_out_410041.awb")

						arg_211_1:RecordAudio("410041051", var_214_28)
						arg_211_1:RecordAudio("410041051", var_214_28)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_410041", "410041051", "story_v_out_410041.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_410041", "410041051", "story_v_out_410041.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_29 = math.max(var_214_20, arg_211_1.talkMaxDuration)

			if var_214_19 <= arg_211_1.time_ and arg_211_1.time_ < var_214_19 + var_214_29 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_19) / var_214_29

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_19 + var_214_29 and arg_211_1.time_ < var_214_19 + var_214_29 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410041052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410041052
		arg_215_1.duration_ = 6.2

		local var_215_0 = {
			zh = 6.2,
			ja = 5.966
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
				arg_215_0:Play410041053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1056"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1056 = var_218_0.localPosition
				var_218_0.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("1056", 4)

				local var_218_2 = var_218_0.childCount

				for iter_218_0 = 0, var_218_2 - 1 do
					local var_218_3 = var_218_0:GetChild(iter_218_0)

					if var_218_3.name == "split_1" or not string.find(var_218_3.name, "split") then
						var_218_3.gameObject:SetActive(true)
					else
						var_218_3.gameObject:SetActive(false)
					end
				end
			end

			local var_218_4 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_4 then
				local var_218_5 = (arg_215_1.time_ - var_218_1) / var_218_4
				local var_218_6 = Vector3.New(390, -350, -180)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1056, var_218_6, var_218_5)
			end

			if arg_215_1.time_ >= var_218_1 + var_218_4 and arg_215_1.time_ < var_218_1 + var_218_4 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_218_7 = arg_215_1.actors_["1056"]
			local var_218_8 = 0

			if var_218_8 < arg_215_1.time_ and arg_215_1.time_ <= var_218_8 + arg_218_0 and arg_215_1.var_.actorSpriteComps1056 == nil then
				arg_215_1.var_.actorSpriteComps1056 = var_218_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_9 = 0.034

			if var_218_8 <= arg_215_1.time_ and arg_215_1.time_ < var_218_8 + var_218_9 then
				local var_218_10 = (arg_215_1.time_ - var_218_8) / var_218_9

				if arg_215_1.var_.actorSpriteComps1056 then
					for iter_218_1, iter_218_2 in pairs(arg_215_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_218_2 then
							local var_218_11 = Mathf.Lerp(iter_218_2.color.r, 1, var_218_10)

							iter_218_2.color = Color.New(var_218_11, var_218_11, var_218_11)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_8 + var_218_9 and arg_215_1.time_ < var_218_8 + var_218_9 + arg_218_0 and arg_215_1.var_.actorSpriteComps1056 then
				local var_218_12 = 1

				for iter_218_3, iter_218_4 in pairs(arg_215_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_218_4 then
						iter_218_4.color = Color.New(var_218_12, var_218_12, var_218_12)
					end
				end

				arg_215_1.var_.actorSpriteComps1056 = nil
			end

			local var_218_13 = arg_215_1.actors_["1060"]
			local var_218_14 = 0

			if var_218_14 < arg_215_1.time_ and arg_215_1.time_ <= var_218_14 + arg_218_0 and arg_215_1.var_.actorSpriteComps1060 == nil then
				arg_215_1.var_.actorSpriteComps1060 = var_218_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_15 = 0.034

			if var_218_14 <= arg_215_1.time_ and arg_215_1.time_ < var_218_14 + var_218_15 then
				local var_218_16 = (arg_215_1.time_ - var_218_14) / var_218_15

				if arg_215_1.var_.actorSpriteComps1060 then
					for iter_218_5, iter_218_6 in pairs(arg_215_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_218_6 then
							local var_218_17 = Mathf.Lerp(iter_218_6.color.r, 0.5, var_218_16)

							iter_218_6.color = Color.New(var_218_17, var_218_17, var_218_17)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_14 + var_218_15 and arg_215_1.time_ < var_218_14 + var_218_15 + arg_218_0 and arg_215_1.var_.actorSpriteComps1060 then
				local var_218_18 = 0.5

				for iter_218_7, iter_218_8 in pairs(arg_215_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_218_8 then
						iter_218_8.color = Color.New(var_218_18, var_218_18, var_218_18)
					end
				end

				arg_215_1.var_.actorSpriteComps1060 = nil
			end

			local var_218_19 = 0
			local var_218_20 = 0.7

			if var_218_19 < arg_215_1.time_ and arg_215_1.time_ <= var_218_19 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_21 = arg_215_1:FormatText(StoryNameCfg[605].name)

				arg_215_1.leftNameTxt_.text = var_218_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_22 = arg_215_1:GetWordFromCfg(410041052)
				local var_218_23 = arg_215_1:FormatText(var_218_22.content)

				arg_215_1.text_.text = var_218_23

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_24 = 28
				local var_218_25 = utf8.len(var_218_23)
				local var_218_26 = var_218_24 <= 0 and var_218_20 or var_218_20 * (var_218_25 / var_218_24)

				if var_218_26 > 0 and var_218_20 < var_218_26 then
					arg_215_1.talkMaxDuration = var_218_26

					if var_218_26 + var_218_19 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_26 + var_218_19
					end
				end

				arg_215_1.text_.text = var_218_23
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041052", "story_v_out_410041.awb") ~= 0 then
					local var_218_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041052", "story_v_out_410041.awb") / 1000

					if var_218_27 + var_218_19 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_27 + var_218_19
					end

					if var_218_22.prefab_name ~= "" and arg_215_1.actors_[var_218_22.prefab_name] ~= nil then
						local var_218_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_22.prefab_name].transform, "story_v_out_410041", "410041052", "story_v_out_410041.awb")

						arg_215_1:RecordAudio("410041052", var_218_28)
						arg_215_1:RecordAudio("410041052", var_218_28)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_410041", "410041052", "story_v_out_410041.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_410041", "410041052", "story_v_out_410041.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_29 = math.max(var_218_20, arg_215_1.talkMaxDuration)

			if var_218_19 <= arg_215_1.time_ and arg_215_1.time_ < var_218_19 + var_218_29 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_19) / var_218_29

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_19 + var_218_29 and arg_215_1.time_ < var_218_19 + var_218_29 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410041053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410041053
		arg_219_1.duration_ = 9.6

		local var_219_0 = {
			zh = 8.9,
			ja = 9.6
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
				arg_219_0:Play410041054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1056"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1056 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1056", 4)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "split_2" or not string.find(var_222_3.name, "split") then
						var_222_3.gameObject:SetActive(true)
					else
						var_222_3.gameObject:SetActive(false)
					end
				end
			end

			local var_222_4 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_1) / var_222_4
				local var_222_6 = Vector3.New(390, -350, -180)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1056, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_222_7 = arg_219_1.actors_["1056"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps1056 == nil then
				arg_219_1.var_.actorSpriteComps1056 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps1056 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 1, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps1056 then
				local var_222_12 = 1

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps1056 = nil
			end

			local var_222_13 = 0
			local var_222_14 = 1.15

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_15 = arg_219_1:FormatText(StoryNameCfg[605].name)

				arg_219_1.leftNameTxt_.text = var_222_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(410041053)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 46
				local var_222_19 = utf8.len(var_222_17)
				local var_222_20 = var_222_18 <= 0 and var_222_14 or var_222_14 * (var_222_19 / var_222_18)

				if var_222_20 > 0 and var_222_14 < var_222_20 then
					arg_219_1.talkMaxDuration = var_222_20

					if var_222_20 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_13
					end
				end

				arg_219_1.text_.text = var_222_17
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041053", "story_v_out_410041.awb") ~= 0 then
					local var_222_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041053", "story_v_out_410041.awb") / 1000

					if var_222_21 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_21 + var_222_13
					end

					if var_222_16.prefab_name ~= "" and arg_219_1.actors_[var_222_16.prefab_name] ~= nil then
						local var_222_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_16.prefab_name].transform, "story_v_out_410041", "410041053", "story_v_out_410041.awb")

						arg_219_1:RecordAudio("410041053", var_222_22)
						arg_219_1:RecordAudio("410041053", var_222_22)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410041", "410041053", "story_v_out_410041.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410041", "410041053", "story_v_out_410041.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_23 = math.max(var_222_14, arg_219_1.talkMaxDuration)

			if var_222_13 <= arg_219_1.time_ and arg_219_1.time_ < var_222_13 + var_222_23 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_13) / var_222_23

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_13 + var_222_23 and arg_219_1.time_ < var_222_13 + var_222_23 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play410041054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410041054
		arg_223_1.duration_ = 13.2

		local var_223_0 = {
			zh = 8.6,
			ja = 13.2
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
				arg_223_0:Play410041055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1056"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1056 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("1056", 4)

				local var_226_2 = var_226_0.childCount

				for iter_226_0 = 0, var_226_2 - 1 do
					local var_226_3 = var_226_0:GetChild(iter_226_0)

					if var_226_3.name == "" or not string.find(var_226_3.name, "split") then
						var_226_3.gameObject:SetActive(true)
					else
						var_226_3.gameObject:SetActive(false)
					end
				end
			end

			local var_226_4 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_4 then
				local var_226_5 = (arg_223_1.time_ - var_226_1) / var_226_4
				local var_226_6 = Vector3.New(390, -350, -180)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1056, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_226_7 = arg_223_1.actors_["1056"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps1056 == nil then
				arg_223_1.var_.actorSpriteComps1056 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.034

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps1056 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 1, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps1056 then
				local var_226_12 = 1

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps1056 = nil
			end

			local var_226_13 = 0
			local var_226_14 = 1.175

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_15 = arg_223_1:FormatText(StoryNameCfg[605].name)

				arg_223_1.leftNameTxt_.text = var_226_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_16 = arg_223_1:GetWordFromCfg(410041054)
				local var_226_17 = arg_223_1:FormatText(var_226_16.content)

				arg_223_1.text_.text = var_226_17

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_18 = 47
				local var_226_19 = utf8.len(var_226_17)
				local var_226_20 = var_226_18 <= 0 and var_226_14 or var_226_14 * (var_226_19 / var_226_18)

				if var_226_20 > 0 and var_226_14 < var_226_20 then
					arg_223_1.talkMaxDuration = var_226_20

					if var_226_20 + var_226_13 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_20 + var_226_13
					end
				end

				arg_223_1.text_.text = var_226_17
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041054", "story_v_out_410041.awb") ~= 0 then
					local var_226_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041054", "story_v_out_410041.awb") / 1000

					if var_226_21 + var_226_13 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_21 + var_226_13
					end

					if var_226_16.prefab_name ~= "" and arg_223_1.actors_[var_226_16.prefab_name] ~= nil then
						local var_226_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_16.prefab_name].transform, "story_v_out_410041", "410041054", "story_v_out_410041.awb")

						arg_223_1:RecordAudio("410041054", var_226_22)
						arg_223_1:RecordAudio("410041054", var_226_22)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_410041", "410041054", "story_v_out_410041.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_410041", "410041054", "story_v_out_410041.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_23 = math.max(var_226_14, arg_223_1.talkMaxDuration)

			if var_226_13 <= arg_223_1.time_ and arg_223_1.time_ < var_226_13 + var_226_23 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_13) / var_226_23

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_13 + var_226_23 and arg_223_1.time_ < var_226_13 + var_226_23 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play410041055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410041055
		arg_227_1.duration_ = 13.333

		local var_227_0 = {
			zh = 8.3,
			ja = 13.333
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
				arg_227_0:Play410041056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1056"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1056 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("1056", 4)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "split_1" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(390, -350, -180)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1056, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_230_7 = arg_227_1.actors_["1056"]
			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps1056 == nil then
				arg_227_1.var_.actorSpriteComps1056 = var_230_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_9 = 0.034

			if var_230_8 <= arg_227_1.time_ and arg_227_1.time_ < var_230_8 + var_230_9 then
				local var_230_10 = (arg_227_1.time_ - var_230_8) / var_230_9

				if arg_227_1.var_.actorSpriteComps1056 then
					for iter_230_1, iter_230_2 in pairs(arg_227_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_230_2 then
							local var_230_11 = Mathf.Lerp(iter_230_2.color.r, 1, var_230_10)

							iter_230_2.color = Color.New(var_230_11, var_230_11, var_230_11)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_8 + var_230_9 and arg_227_1.time_ < var_230_8 + var_230_9 + arg_230_0 and arg_227_1.var_.actorSpriteComps1056 then
				local var_230_12 = 1

				for iter_230_3, iter_230_4 in pairs(arg_227_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_230_4 then
						iter_230_4.color = Color.New(var_230_12, var_230_12, var_230_12)
					end
				end

				arg_227_1.var_.actorSpriteComps1056 = nil
			end

			local var_230_13 = 0
			local var_230_14 = 1.125

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_15 = arg_227_1:FormatText(StoryNameCfg[605].name)

				arg_227_1.leftNameTxt_.text = var_230_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_16 = arg_227_1:GetWordFromCfg(410041055)
				local var_230_17 = arg_227_1:FormatText(var_230_16.content)

				arg_227_1.text_.text = var_230_17

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_18 = 45
				local var_230_19 = utf8.len(var_230_17)
				local var_230_20 = var_230_18 <= 0 and var_230_14 or var_230_14 * (var_230_19 / var_230_18)

				if var_230_20 > 0 and var_230_14 < var_230_20 then
					arg_227_1.talkMaxDuration = var_230_20

					if var_230_20 + var_230_13 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_13
					end
				end

				arg_227_1.text_.text = var_230_17
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041055", "story_v_out_410041.awb") ~= 0 then
					local var_230_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041055", "story_v_out_410041.awb") / 1000

					if var_230_21 + var_230_13 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_21 + var_230_13
					end

					if var_230_16.prefab_name ~= "" and arg_227_1.actors_[var_230_16.prefab_name] ~= nil then
						local var_230_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_16.prefab_name].transform, "story_v_out_410041", "410041055", "story_v_out_410041.awb")

						arg_227_1:RecordAudio("410041055", var_230_22)
						arg_227_1:RecordAudio("410041055", var_230_22)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_410041", "410041055", "story_v_out_410041.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_410041", "410041055", "story_v_out_410041.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_23 = math.max(var_230_14, arg_227_1.talkMaxDuration)

			if var_230_13 <= arg_227_1.time_ and arg_227_1.time_ < var_230_13 + var_230_23 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_13) / var_230_23

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_13 + var_230_23 and arg_227_1.time_ < var_230_13 + var_230_23 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play410041056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410041056
		arg_231_1.duration_ = 7.333

		local var_231_0 = {
			zh = 4.066,
			ja = 7.333
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
				arg_231_0:Play410041057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1060"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1060 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1060", 2)

				local var_234_2 = var_234_0.childCount

				for iter_234_0 = 0, var_234_2 - 1 do
					local var_234_3 = var_234_0:GetChild(iter_234_0)

					if var_234_3.name == "" or not string.find(var_234_3.name, "split") then
						var_234_3.gameObject:SetActive(true)
					else
						var_234_3.gameObject:SetActive(false)
					end
				end
			end

			local var_234_4 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_4 then
				local var_234_5 = (arg_231_1.time_ - var_234_1) / var_234_4
				local var_234_6 = Vector3.New(-390, -435, -40)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1060, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_234_7 = arg_231_1.actors_["1060"]
			local var_234_8 = 0

			if var_234_8 < arg_231_1.time_ and arg_231_1.time_ <= var_234_8 + arg_234_0 and arg_231_1.var_.actorSpriteComps1060 == nil then
				arg_231_1.var_.actorSpriteComps1060 = var_234_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_9 = 0.034

			if var_234_8 <= arg_231_1.time_ and arg_231_1.time_ < var_234_8 + var_234_9 then
				local var_234_10 = (arg_231_1.time_ - var_234_8) / var_234_9

				if arg_231_1.var_.actorSpriteComps1060 then
					for iter_234_1, iter_234_2 in pairs(arg_231_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_234_2 then
							local var_234_11 = Mathf.Lerp(iter_234_2.color.r, 1, var_234_10)

							iter_234_2.color = Color.New(var_234_11, var_234_11, var_234_11)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_8 + var_234_9 and arg_231_1.time_ < var_234_8 + var_234_9 + arg_234_0 and arg_231_1.var_.actorSpriteComps1060 then
				local var_234_12 = 1

				for iter_234_3, iter_234_4 in pairs(arg_231_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_234_4 then
						iter_234_4.color = Color.New(var_234_12, var_234_12, var_234_12)
					end
				end

				arg_231_1.var_.actorSpriteComps1060 = nil
			end

			local var_234_13 = arg_231_1.actors_["1056"]
			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 and arg_231_1.var_.actorSpriteComps1056 == nil then
				arg_231_1.var_.actorSpriteComps1056 = var_234_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_15 = 0.034

			if var_234_14 <= arg_231_1.time_ and arg_231_1.time_ < var_234_14 + var_234_15 then
				local var_234_16 = (arg_231_1.time_ - var_234_14) / var_234_15

				if arg_231_1.var_.actorSpriteComps1056 then
					for iter_234_5, iter_234_6 in pairs(arg_231_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_234_6 then
							local var_234_17 = Mathf.Lerp(iter_234_6.color.r, 0.5, var_234_16)

							iter_234_6.color = Color.New(var_234_17, var_234_17, var_234_17)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_14 + var_234_15 and arg_231_1.time_ < var_234_14 + var_234_15 + arg_234_0 and arg_231_1.var_.actorSpriteComps1056 then
				local var_234_18 = 0.5

				for iter_234_7, iter_234_8 in pairs(arg_231_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_234_8 then
						iter_234_8.color = Color.New(var_234_18, var_234_18, var_234_18)
					end
				end

				arg_231_1.var_.actorSpriteComps1056 = nil
			end

			local var_234_19 = 0
			local var_234_20 = 0.375

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_21 = arg_231_1:FormatText(StoryNameCfg[584].name)

				arg_231_1.leftNameTxt_.text = var_234_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_22 = arg_231_1:GetWordFromCfg(410041056)
				local var_234_23 = arg_231_1:FormatText(var_234_22.content)

				arg_231_1.text_.text = var_234_23

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_24 = 15
				local var_234_25 = utf8.len(var_234_23)
				local var_234_26 = var_234_24 <= 0 and var_234_20 or var_234_20 * (var_234_25 / var_234_24)

				if var_234_26 > 0 and var_234_20 < var_234_26 then
					arg_231_1.talkMaxDuration = var_234_26

					if var_234_26 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_26 + var_234_19
					end
				end

				arg_231_1.text_.text = var_234_23
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041056", "story_v_out_410041.awb") ~= 0 then
					local var_234_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041056", "story_v_out_410041.awb") / 1000

					if var_234_27 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_27 + var_234_19
					end

					if var_234_22.prefab_name ~= "" and arg_231_1.actors_[var_234_22.prefab_name] ~= nil then
						local var_234_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_22.prefab_name].transform, "story_v_out_410041", "410041056", "story_v_out_410041.awb")

						arg_231_1:RecordAudio("410041056", var_234_28)
						arg_231_1:RecordAudio("410041056", var_234_28)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_410041", "410041056", "story_v_out_410041.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_410041", "410041056", "story_v_out_410041.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_29 = math.max(var_234_20, arg_231_1.talkMaxDuration)

			if var_234_19 <= arg_231_1.time_ and arg_231_1.time_ < var_234_19 + var_234_29 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_19) / var_234_29

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_19 + var_234_29 and arg_231_1.time_ < var_234_19 + var_234_29 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410041057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410041057
		arg_235_1.duration_ = 11.866

		local var_235_0 = {
			zh = 10.966,
			ja = 11.866
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
				arg_235_0:Play410041058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1060"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1060 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("1060", 2)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(-390, -435, -40)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1060, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_238_7 = arg_235_1.actors_["1060"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps1060 == nil then
				arg_235_1.var_.actorSpriteComps1060 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.034

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps1060 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 1, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps1060 then
				local var_238_12 = 1

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps1060 = nil
			end

			local var_238_13 = 0
			local var_238_14 = 1.425

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_15 = arg_235_1:FormatText(StoryNameCfg[584].name)

				arg_235_1.leftNameTxt_.text = var_238_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_16 = arg_235_1:GetWordFromCfg(410041057)
				local var_238_17 = arg_235_1:FormatText(var_238_16.content)

				arg_235_1.text_.text = var_238_17

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_18 = 57
				local var_238_19 = utf8.len(var_238_17)
				local var_238_20 = var_238_18 <= 0 and var_238_14 or var_238_14 * (var_238_19 / var_238_18)

				if var_238_20 > 0 and var_238_14 < var_238_20 then
					arg_235_1.talkMaxDuration = var_238_20

					if var_238_20 + var_238_13 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_20 + var_238_13
					end
				end

				arg_235_1.text_.text = var_238_17
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041057", "story_v_out_410041.awb") ~= 0 then
					local var_238_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041057", "story_v_out_410041.awb") / 1000

					if var_238_21 + var_238_13 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_21 + var_238_13
					end

					if var_238_16.prefab_name ~= "" and arg_235_1.actors_[var_238_16.prefab_name] ~= nil then
						local var_238_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_16.prefab_name].transform, "story_v_out_410041", "410041057", "story_v_out_410041.awb")

						arg_235_1:RecordAudio("410041057", var_238_22)
						arg_235_1:RecordAudio("410041057", var_238_22)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410041", "410041057", "story_v_out_410041.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410041", "410041057", "story_v_out_410041.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_23 = math.max(var_238_14, arg_235_1.talkMaxDuration)

			if var_238_13 <= arg_235_1.time_ and arg_235_1.time_ < var_238_13 + var_238_23 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_13) / var_238_23

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_13 + var_238_23 and arg_235_1.time_ < var_238_13 + var_238_23 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play410041058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410041058
		arg_239_1.duration_ = 6.566

		local var_239_0 = {
			zh = 4.533,
			ja = 6.566
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
				arg_239_0:Play410041059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1056"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1056 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("1056", 4)

				local var_242_2 = var_242_0.childCount

				for iter_242_0 = 0, var_242_2 - 1 do
					local var_242_3 = var_242_0:GetChild(iter_242_0)

					if var_242_3.name == "split_1" or not string.find(var_242_3.name, "split") then
						var_242_3.gameObject:SetActive(true)
					else
						var_242_3.gameObject:SetActive(false)
					end
				end
			end

			local var_242_4 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_1) / var_242_4
				local var_242_6 = Vector3.New(390, -350, -180)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1056, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_242_7 = arg_239_1.actors_["1056"]
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps1056 == nil then
				arg_239_1.var_.actorSpriteComps1056 = var_242_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_9 = 0.034

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_9 then
				local var_242_10 = (arg_239_1.time_ - var_242_8) / var_242_9

				if arg_239_1.var_.actorSpriteComps1056 then
					for iter_242_1, iter_242_2 in pairs(arg_239_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_242_2 then
							local var_242_11 = Mathf.Lerp(iter_242_2.color.r, 1, var_242_10)

							iter_242_2.color = Color.New(var_242_11, var_242_11, var_242_11)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_8 + var_242_9 and arg_239_1.time_ < var_242_8 + var_242_9 + arg_242_0 and arg_239_1.var_.actorSpriteComps1056 then
				local var_242_12 = 1

				for iter_242_3, iter_242_4 in pairs(arg_239_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_242_4 then
						iter_242_4.color = Color.New(var_242_12, var_242_12, var_242_12)
					end
				end

				arg_239_1.var_.actorSpriteComps1056 = nil
			end

			local var_242_13 = arg_239_1.actors_["1060"]
			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 and arg_239_1.var_.actorSpriteComps1060 == nil then
				arg_239_1.var_.actorSpriteComps1060 = var_242_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_15 = 0.034

			if var_242_14 <= arg_239_1.time_ and arg_239_1.time_ < var_242_14 + var_242_15 then
				local var_242_16 = (arg_239_1.time_ - var_242_14) / var_242_15

				if arg_239_1.var_.actorSpriteComps1060 then
					for iter_242_5, iter_242_6 in pairs(arg_239_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_242_6 then
							local var_242_17 = Mathf.Lerp(iter_242_6.color.r, 0.5, var_242_16)

							iter_242_6.color = Color.New(var_242_17, var_242_17, var_242_17)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_14 + var_242_15 and arg_239_1.time_ < var_242_14 + var_242_15 + arg_242_0 and arg_239_1.var_.actorSpriteComps1060 then
				local var_242_18 = 0.5

				for iter_242_7, iter_242_8 in pairs(arg_239_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_242_8 then
						iter_242_8.color = Color.New(var_242_18, var_242_18, var_242_18)
					end
				end

				arg_239_1.var_.actorSpriteComps1060 = nil
			end

			local var_242_19 = 0
			local var_242_20 = 0.575

			if var_242_19 < arg_239_1.time_ and arg_239_1.time_ <= var_242_19 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_21 = arg_239_1:FormatText(StoryNameCfg[605].name)

				arg_239_1.leftNameTxt_.text = var_242_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_22 = arg_239_1:GetWordFromCfg(410041058)
				local var_242_23 = arg_239_1:FormatText(var_242_22.content)

				arg_239_1.text_.text = var_242_23

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_24 = 23
				local var_242_25 = utf8.len(var_242_23)
				local var_242_26 = var_242_24 <= 0 and var_242_20 or var_242_20 * (var_242_25 / var_242_24)

				if var_242_26 > 0 and var_242_20 < var_242_26 then
					arg_239_1.talkMaxDuration = var_242_26

					if var_242_26 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_26 + var_242_19
					end
				end

				arg_239_1.text_.text = var_242_23
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041058", "story_v_out_410041.awb") ~= 0 then
					local var_242_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041058", "story_v_out_410041.awb") / 1000

					if var_242_27 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_27 + var_242_19
					end

					if var_242_22.prefab_name ~= "" and arg_239_1.actors_[var_242_22.prefab_name] ~= nil then
						local var_242_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_22.prefab_name].transform, "story_v_out_410041", "410041058", "story_v_out_410041.awb")

						arg_239_1:RecordAudio("410041058", var_242_28)
						arg_239_1:RecordAudio("410041058", var_242_28)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_410041", "410041058", "story_v_out_410041.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_410041", "410041058", "story_v_out_410041.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_29 = math.max(var_242_20, arg_239_1.talkMaxDuration)

			if var_242_19 <= arg_239_1.time_ and arg_239_1.time_ < var_242_19 + var_242_29 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_19) / var_242_29

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_19 + var_242_29 and arg_239_1.time_ < var_242_19 + var_242_29 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410041059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410041059
		arg_243_1.duration_ = 7.2

		local var_243_0 = {
			zh = 3.633,
			ja = 7.2
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
				arg_243_0:Play410041060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1056"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1056 = var_246_0.localPosition
				var_246_0.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("1056", 4)

				local var_246_2 = var_246_0.childCount

				for iter_246_0 = 0, var_246_2 - 1 do
					local var_246_3 = var_246_0:GetChild(iter_246_0)

					if var_246_3.name == "" or not string.find(var_246_3.name, "split") then
						var_246_3.gameObject:SetActive(true)
					else
						var_246_3.gameObject:SetActive(false)
					end
				end
			end

			local var_246_4 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_4 then
				local var_246_5 = (arg_243_1.time_ - var_246_1) / var_246_4
				local var_246_6 = Vector3.New(390, -350, -180)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1056, var_246_6, var_246_5)
			end

			if arg_243_1.time_ >= var_246_1 + var_246_4 and arg_243_1.time_ < var_246_1 + var_246_4 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_246_7 = arg_243_1.actors_["1056"]
			local var_246_8 = 0

			if var_246_8 < arg_243_1.time_ and arg_243_1.time_ <= var_246_8 + arg_246_0 and arg_243_1.var_.actorSpriteComps1056 == nil then
				arg_243_1.var_.actorSpriteComps1056 = var_246_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_9 = 0.034

			if var_246_8 <= arg_243_1.time_ and arg_243_1.time_ < var_246_8 + var_246_9 then
				local var_246_10 = (arg_243_1.time_ - var_246_8) / var_246_9

				if arg_243_1.var_.actorSpriteComps1056 then
					for iter_246_1, iter_246_2 in pairs(arg_243_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_246_2 then
							local var_246_11 = Mathf.Lerp(iter_246_2.color.r, 1, var_246_10)

							iter_246_2.color = Color.New(var_246_11, var_246_11, var_246_11)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_8 + var_246_9 and arg_243_1.time_ < var_246_8 + var_246_9 + arg_246_0 and arg_243_1.var_.actorSpriteComps1056 then
				local var_246_12 = 1

				for iter_246_3, iter_246_4 in pairs(arg_243_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_246_4 then
						iter_246_4.color = Color.New(var_246_12, var_246_12, var_246_12)
					end
				end

				arg_243_1.var_.actorSpriteComps1056 = nil
			end

			local var_246_13 = 0
			local var_246_14 = 0.525

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_15 = arg_243_1:FormatText(StoryNameCfg[605].name)

				arg_243_1.leftNameTxt_.text = var_246_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_16 = arg_243_1:GetWordFromCfg(410041059)
				local var_246_17 = arg_243_1:FormatText(var_246_16.content)

				arg_243_1.text_.text = var_246_17

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_18 = 21
				local var_246_19 = utf8.len(var_246_17)
				local var_246_20 = var_246_18 <= 0 and var_246_14 or var_246_14 * (var_246_19 / var_246_18)

				if var_246_20 > 0 and var_246_14 < var_246_20 then
					arg_243_1.talkMaxDuration = var_246_20

					if var_246_20 + var_246_13 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_20 + var_246_13
					end
				end

				arg_243_1.text_.text = var_246_17
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041059", "story_v_out_410041.awb") ~= 0 then
					local var_246_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041059", "story_v_out_410041.awb") / 1000

					if var_246_21 + var_246_13 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_21 + var_246_13
					end

					if var_246_16.prefab_name ~= "" and arg_243_1.actors_[var_246_16.prefab_name] ~= nil then
						local var_246_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_16.prefab_name].transform, "story_v_out_410041", "410041059", "story_v_out_410041.awb")

						arg_243_1:RecordAudio("410041059", var_246_22)
						arg_243_1:RecordAudio("410041059", var_246_22)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_410041", "410041059", "story_v_out_410041.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_410041", "410041059", "story_v_out_410041.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_23 = math.max(var_246_14, arg_243_1.talkMaxDuration)

			if var_246_13 <= arg_243_1.time_ and arg_243_1.time_ < var_246_13 + var_246_23 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_13) / var_246_23

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_13 + var_246_23 and arg_243_1.time_ < var_246_13 + var_246_23 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play410041060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410041060
		arg_247_1.duration_ = 4.4

		local var_247_0 = {
			zh = 1.833,
			ja = 4.4
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
				arg_247_0:Play410041061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1060"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1060 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1060", 2)

				local var_250_2 = var_250_0.childCount

				for iter_250_0 = 0, var_250_2 - 1 do
					local var_250_3 = var_250_0:GetChild(iter_250_0)

					if var_250_3.name == "split_2" or not string.find(var_250_3.name, "split") then
						var_250_3.gameObject:SetActive(true)
					else
						var_250_3.gameObject:SetActive(false)
					end
				end
			end

			local var_250_4 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_1) / var_250_4
				local var_250_6 = Vector3.New(-390, -435, -40)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1060, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_250_7 = arg_247_1.actors_["1060"]
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 and arg_247_1.var_.actorSpriteComps1060 == nil then
				arg_247_1.var_.actorSpriteComps1060 = var_250_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_9 = 0.034

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_9 then
				local var_250_10 = (arg_247_1.time_ - var_250_8) / var_250_9

				if arg_247_1.var_.actorSpriteComps1060 then
					for iter_250_1, iter_250_2 in pairs(arg_247_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_250_2 then
							local var_250_11 = Mathf.Lerp(iter_250_2.color.r, 1, var_250_10)

							iter_250_2.color = Color.New(var_250_11, var_250_11, var_250_11)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_8 + var_250_9 and arg_247_1.time_ < var_250_8 + var_250_9 + arg_250_0 and arg_247_1.var_.actorSpriteComps1060 then
				local var_250_12 = 1

				for iter_250_3, iter_250_4 in pairs(arg_247_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_250_4 then
						iter_250_4.color = Color.New(var_250_12, var_250_12, var_250_12)
					end
				end

				arg_247_1.var_.actorSpriteComps1060 = nil
			end

			local var_250_13 = arg_247_1.actors_["1056"]
			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 and arg_247_1.var_.actorSpriteComps1056 == nil then
				arg_247_1.var_.actorSpriteComps1056 = var_250_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_15 = 0.034

			if var_250_14 <= arg_247_1.time_ and arg_247_1.time_ < var_250_14 + var_250_15 then
				local var_250_16 = (arg_247_1.time_ - var_250_14) / var_250_15

				if arg_247_1.var_.actorSpriteComps1056 then
					for iter_250_5, iter_250_6 in pairs(arg_247_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_250_6 then
							local var_250_17 = Mathf.Lerp(iter_250_6.color.r, 0.5, var_250_16)

							iter_250_6.color = Color.New(var_250_17, var_250_17, var_250_17)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_14 + var_250_15 and arg_247_1.time_ < var_250_14 + var_250_15 + arg_250_0 and arg_247_1.var_.actorSpriteComps1056 then
				local var_250_18 = 0.5

				for iter_250_7, iter_250_8 in pairs(arg_247_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_250_8 then
						iter_250_8.color = Color.New(var_250_18, var_250_18, var_250_18)
					end
				end

				arg_247_1.var_.actorSpriteComps1056 = nil
			end

			local var_250_19 = 0
			local var_250_20 = 0.15

			if var_250_19 < arg_247_1.time_ and arg_247_1.time_ <= var_250_19 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_21 = arg_247_1:FormatText(StoryNameCfg[584].name)

				arg_247_1.leftNameTxt_.text = var_250_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_22 = arg_247_1:GetWordFromCfg(410041060)
				local var_250_23 = arg_247_1:FormatText(var_250_22.content)

				arg_247_1.text_.text = var_250_23

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_24 = 6
				local var_250_25 = utf8.len(var_250_23)
				local var_250_26 = var_250_24 <= 0 and var_250_20 or var_250_20 * (var_250_25 / var_250_24)

				if var_250_26 > 0 and var_250_20 < var_250_26 then
					arg_247_1.talkMaxDuration = var_250_26

					if var_250_26 + var_250_19 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_26 + var_250_19
					end
				end

				arg_247_1.text_.text = var_250_23
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041060", "story_v_out_410041.awb") ~= 0 then
					local var_250_27 = manager.audio:GetVoiceLength("story_v_out_410041", "410041060", "story_v_out_410041.awb") / 1000

					if var_250_27 + var_250_19 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_27 + var_250_19
					end

					if var_250_22.prefab_name ~= "" and arg_247_1.actors_[var_250_22.prefab_name] ~= nil then
						local var_250_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_22.prefab_name].transform, "story_v_out_410041", "410041060", "story_v_out_410041.awb")

						arg_247_1:RecordAudio("410041060", var_250_28)
						arg_247_1:RecordAudio("410041060", var_250_28)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410041", "410041060", "story_v_out_410041.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410041", "410041060", "story_v_out_410041.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_29 = math.max(var_250_20, arg_247_1.talkMaxDuration)

			if var_250_19 <= arg_247_1.time_ and arg_247_1.time_ < var_250_19 + var_250_29 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_19) / var_250_29

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_19 + var_250_29 and arg_247_1.time_ < var_250_19 + var_250_29 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410041061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410041061
		arg_251_1.duration_ = 7.5

		local var_251_0 = {
			zh = 4.333,
			ja = 7.5
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
			arg_251_1.auto_ = false
		end

		function arg_251_1.playNext_(arg_253_0)
			arg_251_1.onStoryFinished_()
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1060"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1060 = var_254_0.localPosition
				var_254_0.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("1060", 2)

				local var_254_2 = var_254_0.childCount

				for iter_254_0 = 0, var_254_2 - 1 do
					local var_254_3 = var_254_0:GetChild(iter_254_0)

					if var_254_3.name == "" or not string.find(var_254_3.name, "split") then
						var_254_3.gameObject:SetActive(true)
					else
						var_254_3.gameObject:SetActive(false)
					end
				end
			end

			local var_254_4 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_4 then
				local var_254_5 = (arg_251_1.time_ - var_254_1) / var_254_4
				local var_254_6 = Vector3.New(-390, -435, -40)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1060, var_254_6, var_254_5)
			end

			if arg_251_1.time_ >= var_254_1 + var_254_4 and arg_251_1.time_ < var_254_1 + var_254_4 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_254_7 = arg_251_1.actors_["1060"]
			local var_254_8 = 0

			if var_254_8 < arg_251_1.time_ and arg_251_1.time_ <= var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps1060 == nil then
				arg_251_1.var_.actorSpriteComps1060 = var_254_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_9 = 0.034

			if var_254_8 <= arg_251_1.time_ and arg_251_1.time_ < var_254_8 + var_254_9 then
				local var_254_10 = (arg_251_1.time_ - var_254_8) / var_254_9

				if arg_251_1.var_.actorSpriteComps1060 then
					for iter_254_1, iter_254_2 in pairs(arg_251_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_254_2 then
							local var_254_11 = Mathf.Lerp(iter_254_2.color.r, 1, var_254_10)

							iter_254_2.color = Color.New(var_254_11, var_254_11, var_254_11)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_8 + var_254_9 and arg_251_1.time_ < var_254_8 + var_254_9 + arg_254_0 and arg_251_1.var_.actorSpriteComps1060 then
				local var_254_12 = 1

				for iter_254_3, iter_254_4 in pairs(arg_251_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_254_4 then
						iter_254_4.color = Color.New(var_254_12, var_254_12, var_254_12)
					end
				end

				arg_251_1.var_.actorSpriteComps1060 = nil
			end

			local var_254_13 = 0
			local var_254_14 = 0.5

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_15 = arg_251_1:FormatText(StoryNameCfg[584].name)

				arg_251_1.leftNameTxt_.text = var_254_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_16 = arg_251_1:GetWordFromCfg(410041061)
				local var_254_17 = arg_251_1:FormatText(var_254_16.content)

				arg_251_1.text_.text = var_254_17

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_18 = 20
				local var_254_19 = utf8.len(var_254_17)
				local var_254_20 = var_254_18 <= 0 and var_254_14 or var_254_14 * (var_254_19 / var_254_18)

				if var_254_20 > 0 and var_254_14 < var_254_20 then
					arg_251_1.talkMaxDuration = var_254_20

					if var_254_20 + var_254_13 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_20 + var_254_13
					end
				end

				arg_251_1.text_.text = var_254_17
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410041", "410041061", "story_v_out_410041.awb") ~= 0 then
					local var_254_21 = manager.audio:GetVoiceLength("story_v_out_410041", "410041061", "story_v_out_410041.awb") / 1000

					if var_254_21 + var_254_13 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_21 + var_254_13
					end

					if var_254_16.prefab_name ~= "" and arg_251_1.actors_[var_254_16.prefab_name] ~= nil then
						local var_254_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_16.prefab_name].transform, "story_v_out_410041", "410041061", "story_v_out_410041.awb")

						arg_251_1:RecordAudio("410041061", var_254_22)
						arg_251_1:RecordAudio("410041061", var_254_22)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410041", "410041061", "story_v_out_410041.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410041", "410041061", "story_v_out_410041.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_23 = math.max(var_254_14, arg_251_1.talkMaxDuration)

			if var_254_13 <= arg_251_1.time_ and arg_251_1.time_ < var_254_13 + var_254_23 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_13) / var_254_23

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_13 + var_254_23 and arg_251_1.time_ < var_254_13 + var_254_23 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J02f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST61a"
	},
	voices = {
		"story_v_out_410041.awb"
	}
}
