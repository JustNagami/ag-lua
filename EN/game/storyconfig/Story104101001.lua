return {
	Play410101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410101001
		arg_1_1.duration_ = 4.5

		local var_1_0 = {
			zh = 4.5,
			ja = 4.1
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
				arg_1_0:Play410101002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J02c"

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
				local var_4_5 = arg_1_1.bgs_.J02c

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
					if iter_4_0 ~= "J02c" then
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

					if var_4_27.name == "" or not string.find(var_4_27.name, "split") then
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

			local var_4_38 = 0.0339999999999998

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

				arg_1_1:AudioAction(var_4_46, var_4_47, "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_48 = 2
			local var_4_49 = 0.25

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_50 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_50:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_51 = arg_1_1:FormatText(StoryNameCfg[584].name)

				arg_1_1.leftNameTxt_.text = var_4_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_52 = arg_1_1:GetWordFromCfg(410101001)
				local var_4_53 = arg_1_1:FormatText(var_4_52.content)

				arg_1_1.text_.text = var_4_53

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_54 = 10
				local var_4_55 = utf8.len(var_4_53)
				local var_4_56 = var_4_54 <= 0 and var_4_49 or var_4_49 * (var_4_55 / var_4_54)

				if var_4_56 > 0 and var_4_49 < var_4_56 then
					arg_1_1.talkMaxDuration = var_4_56
					var_4_48 = var_4_48 + 0.3

					if var_4_56 + var_4_48 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_56 + var_4_48
					end
				end

				arg_1_1.text_.text = var_4_53
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101001", "story_v_out_410101.awb") ~= 0 then
					local var_4_57 = manager.audio:GetVoiceLength("story_v_out_410101", "410101001", "story_v_out_410101.awb") / 1000

					if var_4_57 + var_4_48 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_48
					end

					if var_4_52.prefab_name ~= "" and arg_1_1.actors_[var_4_52.prefab_name] ~= nil then
						local var_4_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_52.prefab_name].transform, "story_v_out_410101", "410101001", "story_v_out_410101.awb")

						arg_1_1:RecordAudio("410101001", var_4_58)
						arg_1_1:RecordAudio("410101001", var_4_58)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410101", "410101001", "story_v_out_410101.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410101", "410101001", "story_v_out_410101.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_59 = var_4_48 + 0.3
			local var_4_60 = math.max(var_4_49, arg_1_1.talkMaxDuration)

			if var_4_59 <= arg_1_1.time_ and arg_1_1.time_ < var_4_59 + var_4_60 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_59) / var_4_60

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_59 + var_4_60 and arg_1_1.time_ < var_4_59 + var_4_60 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410101002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410101002
		arg_7_1.duration_ = 6.266

		local var_7_0 = {
			zh = 3.633,
			ja = 6.266
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
				arg_7_0:Play410101003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["10064"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.actorSpriteComps10064 == nil then
				arg_7_1.var_.actorSpriteComps10064 = var_10_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_2 = 0.034

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.actorSpriteComps10064 then
					for iter_10_0, iter_10_1 in pairs(arg_7_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_10_1 then
							local var_10_4 = Mathf.Lerp(iter_10_1.color.r, 0.5, var_10_3)

							iter_10_1.color = Color.New(var_10_4, var_10_4, var_10_4)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.actorSpriteComps10064 then
				local var_10_5 = 0.5

				for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_10_3 then
						iter_10_3.color = Color.New(var_10_5, var_10_5, var_10_5)
					end
				end

				arg_7_1.var_.actorSpriteComps10064 = nil
			end

			local var_10_6 = 0
			local var_10_7 = 0.475

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[595].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1012_split_1")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(410101002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 19
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101002", "story_v_out_410101.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_410101", "410101002", "story_v_out_410101.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_410101", "410101002", "story_v_out_410101.awb")

						arg_7_1:RecordAudio("410101002", var_10_15)
						arg_7_1:RecordAudio("410101002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410101", "410101002", "story_v_out_410101.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410101", "410101002", "story_v_out_410101.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_16 and arg_7_1.time_ < var_10_6 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410101003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410101003
		arg_11_1.duration_ = 6.933

		local var_11_0 = {
			zh = 5.333,
			ja = 6.933
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
				arg_11_0:Play410101004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10064"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos10064 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10064", 3)

				local var_14_2 = var_14_0.childCount

				for iter_14_0 = 0, var_14_2 - 1 do
					local var_14_3 = var_14_0:GetChild(iter_14_0)

					if var_14_3.name == "" or not string.find(var_14_3.name, "split") then
						var_14_3.gameObject:SetActive(true)
					else
						var_14_3.gameObject:SetActive(false)
					end
				end
			end

			local var_14_4 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_4 then
				local var_14_5 = (arg_11_1.time_ - var_14_1) / var_14_4
				local var_14_6 = Vector3.New(0, -570, 192.5)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10064, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_14_7 = arg_11_1.actors_["10064"]
			local var_14_8 = 0

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 and arg_11_1.var_.actorSpriteComps10064 == nil then
				arg_11_1.var_.actorSpriteComps10064 = var_14_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_9 = 0.034

			if var_14_8 <= arg_11_1.time_ and arg_11_1.time_ < var_14_8 + var_14_9 then
				local var_14_10 = (arg_11_1.time_ - var_14_8) / var_14_9

				if arg_11_1.var_.actorSpriteComps10064 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_14_2 then
							local var_14_11 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_10)

							iter_14_2.color = Color.New(var_14_11, var_14_11, var_14_11)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_8 + var_14_9 and arg_11_1.time_ < var_14_8 + var_14_9 + arg_14_0 and arg_11_1.var_.actorSpriteComps10064 then
				local var_14_12 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_12, var_14_12, var_14_12)
					end
				end

				arg_11_1.var_.actorSpriteComps10064 = nil
			end

			local var_14_13 = 0
			local var_14_14 = 0.725

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_15 = arg_11_1:FormatText(StoryNameCfg[584].name)

				arg_11_1.leftNameTxt_.text = var_14_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_16 = arg_11_1:GetWordFromCfg(410101003)
				local var_14_17 = arg_11_1:FormatText(var_14_16.content)

				arg_11_1.text_.text = var_14_17

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_18 = 29
				local var_14_19 = utf8.len(var_14_17)
				local var_14_20 = var_14_18 <= 0 and var_14_14 or var_14_14 * (var_14_19 / var_14_18)

				if var_14_20 > 0 and var_14_14 < var_14_20 then
					arg_11_1.talkMaxDuration = var_14_20

					if var_14_20 + var_14_13 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_20 + var_14_13
					end
				end

				arg_11_1.text_.text = var_14_17
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101003", "story_v_out_410101.awb") ~= 0 then
					local var_14_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101003", "story_v_out_410101.awb") / 1000

					if var_14_21 + var_14_13 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_21 + var_14_13
					end

					if var_14_16.prefab_name ~= "" and arg_11_1.actors_[var_14_16.prefab_name] ~= nil then
						local var_14_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_16.prefab_name].transform, "story_v_out_410101", "410101003", "story_v_out_410101.awb")

						arg_11_1:RecordAudio("410101003", var_14_22)
						arg_11_1:RecordAudio("410101003", var_14_22)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410101", "410101003", "story_v_out_410101.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410101", "410101003", "story_v_out_410101.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_23 = math.max(var_14_14, arg_11_1.talkMaxDuration)

			if var_14_13 <= arg_11_1.time_ and arg_11_1.time_ < var_14_13 + var_14_23 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_13) / var_14_23

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_13 + var_14_23 and arg_11_1.time_ < var_14_13 + var_14_23 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410101004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410101004
		arg_15_1.duration_ = 10.333

		local var_15_0 = {
			zh = 6.033,
			ja = 10.333
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
				arg_15_0:Play410101005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10064"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps10064 == nil then
				arg_15_1.var_.actorSpriteComps10064 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.034

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps10064 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 0.5, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps10064 then
				local var_18_5 = 0.5

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps10064 = nil
			end

			local var_18_6 = 0
			local var_18_7 = 0.875

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[595].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1012_split_3")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(410101004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 35
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101004", "story_v_out_410101.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_410101", "410101004", "story_v_out_410101.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_410101", "410101004", "story_v_out_410101.awb")

						arg_15_1:RecordAudio("410101004", var_18_15)
						arg_15_1:RecordAudio("410101004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410101", "410101004", "story_v_out_410101.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410101", "410101004", "story_v_out_410101.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410101005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410101005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play410101006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10064"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10064 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10064", 7)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(0, -2000, 192.5)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10064, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_22_7 = arg_19_1.actors_["10064"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps10064 == nil then
				arg_19_1.var_.actorSpriteComps10064 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps10064 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps10064 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps10064 = nil
			end

			local var_22_13 = 0
			local var_22_14 = 1.6

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(410101005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 64
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_14 or var_22_14 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_14 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19

					if var_22_19 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_13
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_20 = math.max(var_22_14, arg_19_1.talkMaxDuration)

			if var_22_13 <= arg_19_1.time_ and arg_19_1.time_ < var_22_13 + var_22_20 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_13) / var_22_20

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_13 + var_22_20 and arg_19_1.time_ < var_22_13 + var_22_20 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410101006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410101006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play410101007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1060"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_26_0), arg_23_1.canvasGo_.transform)

				var_26_1.transform:SetSiblingIndex(1)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_23_1.actors_[var_26_0] = var_26_1
			end

			local var_26_2 = arg_23_1.actors_["1060"].transform
			local var_26_3 = 0

			if var_26_3 < arg_23_1.time_ and arg_23_1.time_ <= var_26_3 + arg_26_0 then
				arg_23_1.var_.moveOldPos1060 = var_26_2.localPosition
				var_26_2.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1060", 7)

				local var_26_4 = var_26_2.childCount

				for iter_26_0 = 0, var_26_4 - 1 do
					local var_26_5 = var_26_2:GetChild(iter_26_0)

					if var_26_5.name == "" or not string.find(var_26_5.name, "split") then
						var_26_5.gameObject:SetActive(true)
					else
						var_26_5.gameObject:SetActive(false)
					end
				end
			end

			local var_26_6 = 0.001

			if var_26_3 <= arg_23_1.time_ and arg_23_1.time_ < var_26_3 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_3) / var_26_6
				local var_26_8 = Vector3.New(0, -2000, -40)

				var_26_2.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1060, var_26_8, var_26_7)
			end

			if arg_23_1.time_ >= var_26_3 + var_26_6 and arg_23_1.time_ < var_26_3 + var_26_6 + arg_26_0 then
				var_26_2.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_26_9 = 0
			local var_26_10 = 1.525

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

				local var_26_11 = arg_23_1:GetWordFromCfg(410101006)
				local var_26_12 = arg_23_1:FormatText(var_26_11.content)

				arg_23_1.text_.text = var_26_12

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_13 = 61
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
	Play410101007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410101007
		arg_27_1.duration_ = 4.266

		local var_27_0 = {
			zh = 1.833,
			ja = 4.266
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
				arg_27_0:Play410101008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10064"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10064 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10064", 3)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(0, -570, 192.5)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10064, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -570, 192.5)
			end

			local var_30_7 = arg_27_1.actors_["10064"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10064 == nil then
				arg_27_1.var_.actorSpriteComps10064 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.034

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps10064 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps10064 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps10064 = nil
			end

			local var_30_13 = 0
			local var_30_14 = 0.275

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_15 = arg_27_1:FormatText(StoryNameCfg[584].name)

				arg_27_1.leftNameTxt_.text = var_30_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_16 = arg_27_1:GetWordFromCfg(410101007)
				local var_30_17 = arg_27_1:FormatText(var_30_16.content)

				arg_27_1.text_.text = var_30_17

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_18 = 11
				local var_30_19 = utf8.len(var_30_17)
				local var_30_20 = var_30_18 <= 0 and var_30_14 or var_30_14 * (var_30_19 / var_30_18)

				if var_30_20 > 0 and var_30_14 < var_30_20 then
					arg_27_1.talkMaxDuration = var_30_20

					if var_30_20 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_13
					end
				end

				arg_27_1.text_.text = var_30_17
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101007", "story_v_out_410101.awb") ~= 0 then
					local var_30_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101007", "story_v_out_410101.awb") / 1000

					if var_30_21 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_13
					end

					if var_30_16.prefab_name ~= "" and arg_27_1.actors_[var_30_16.prefab_name] ~= nil then
						local var_30_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_16.prefab_name].transform, "story_v_out_410101", "410101007", "story_v_out_410101.awb")

						arg_27_1:RecordAudio("410101007", var_30_22)
						arg_27_1:RecordAudio("410101007", var_30_22)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410101", "410101007", "story_v_out_410101.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410101", "410101007", "story_v_out_410101.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_23 = math.max(var_30_14, arg_27_1.talkMaxDuration)

			if var_30_13 <= arg_27_1.time_ and arg_27_1.time_ < var_30_13 + var_30_23 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_13) / var_30_23

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_13 + var_30_23 and arg_27_1.time_ < var_30_13 + var_30_23 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410101008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410101008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play410101009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10064"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10064 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10064", 7)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -2000, 192.5)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10064, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_34_7 = 0
			local var_34_8 = 0.35

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(410101008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 14
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_8 or var_34_8 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_8 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_7 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_7
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_14 = math.max(var_34_8, arg_31_1.talkMaxDuration)

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_14 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_7) / var_34_14

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_7 + var_34_14 and arg_31_1.time_ < var_34_7 + var_34_14 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410101009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410101009
		arg_35_1.duration_ = 9

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play410101010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "STblack"

			if arg_35_1.bgs_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(arg_35_1.paintGo_)

				var_38_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_38_0)
				var_38_1.name = var_38_0
				var_38_1.transform.parent = arg_35_1.stage_.transform
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.bgs_[var_38_0] = var_38_1
			end

			local var_38_2 = 2

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 then
				local var_38_3 = manager.ui.mainCamera.transform.localPosition
				local var_38_4 = Vector3.New(0, 0, 10) + Vector3.New(var_38_3.x, var_38_3.y, 0)
				local var_38_5 = arg_35_1.bgs_.STblack

				var_38_5.transform.localPosition = var_38_4
				var_38_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_6 = var_38_5:GetComponent("SpriteRenderer")

				if var_38_6 and var_38_6.sprite then
					local var_38_7 = (var_38_5.transform.localPosition - var_38_3).z
					local var_38_8 = manager.ui.mainCameraCom_
					local var_38_9 = 2 * var_38_7 * Mathf.Tan(var_38_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_10 = var_38_9 * var_38_8.aspect
					local var_38_11 = var_38_6.sprite.bounds.size.x
					local var_38_12 = var_38_6.sprite.bounds.size.y
					local var_38_13 = var_38_10 / var_38_11
					local var_38_14 = var_38_9 / var_38_12
					local var_38_15 = var_38_14 < var_38_13 and var_38_13 or var_38_14

					var_38_5.transform.localScale = Vector3.New(var_38_15, var_38_15, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "STblack" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_17 = 2

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Color.New(0, 0, 0)

				var_38_19.a = Mathf.Lerp(0, 1, var_38_18)
				arg_35_1.mask_.color = var_38_19
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				local var_38_20 = Color.New(0, 0, 0)

				var_38_20.a = 1
				arg_35_1.mask_.color = var_38_20
			end

			local var_38_21 = 2

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_22 = 2

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22
				local var_38_24 = Color.New(0, 0, 0)

				var_38_24.a = Mathf.Lerp(1, 0, var_38_23)
				arg_35_1.mask_.color = var_38_24
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 then
				local var_38_25 = Color.New(0, 0, 0)
				local var_38_26 = 0

				arg_35_1.mask_.enabled = false
				var_38_25.a = var_38_26
				arg_35_1.mask_.color = var_38_25
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_27 = 4
			local var_38_28 = 1.65

			if var_38_27 < arg_35_1.time_ and arg_35_1.time_ <= var_38_27 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_29 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_29:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_30 = arg_35_1:GetWordFromCfg(410101009)
				local var_38_31 = arg_35_1:FormatText(var_38_30.content)

				arg_35_1.text_.text = var_38_31

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_32 = 66
				local var_38_33 = utf8.len(var_38_31)
				local var_38_34 = var_38_32 <= 0 and var_38_28 or var_38_28 * (var_38_33 / var_38_32)

				if var_38_34 > 0 and var_38_28 < var_38_34 then
					arg_35_1.talkMaxDuration = var_38_34
					var_38_27 = var_38_27 + 0.3

					if var_38_34 + var_38_27 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_27
					end
				end

				arg_35_1.text_.text = var_38_31
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_35 = var_38_27 + 0.3
			local var_38_36 = math.max(var_38_28, arg_35_1.talkMaxDuration)

			if var_38_35 <= arg_35_1.time_ and arg_35_1.time_ < var_38_35 + var_38_36 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_35) / var_38_36

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_35 + var_38_36 and arg_35_1.time_ < var_38_35 + var_38_36 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410101010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 410101010
		arg_41_1.duration_ = 8.5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play410101011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = "ST31a"

			if arg_41_1.bgs_[var_44_0] == nil then
				local var_44_1 = Object.Instantiate(arg_41_1.paintGo_)

				var_44_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_44_0)
				var_44_1.name = var_44_0
				var_44_1.transform.parent = arg_41_1.stage_.transform
				var_44_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_41_1.bgs_[var_44_0] = var_44_1
			end

			local var_44_2 = 0

			if var_44_2 < arg_41_1.time_ and arg_41_1.time_ <= var_44_2 + arg_44_0 then
				local var_44_3 = manager.ui.mainCamera.transform.localPosition
				local var_44_4 = Vector3.New(0, 0, 10) + Vector3.New(var_44_3.x, var_44_3.y, 0)
				local var_44_5 = arg_41_1.bgs_.ST31a

				var_44_5.transform.localPosition = var_44_4
				var_44_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_44_6 = var_44_5:GetComponent("SpriteRenderer")

				if var_44_6 and var_44_6.sprite then
					local var_44_7 = (var_44_5.transform.localPosition - var_44_3).z
					local var_44_8 = manager.ui.mainCameraCom_
					local var_44_9 = 2 * var_44_7 * Mathf.Tan(var_44_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_44_10 = var_44_9 * var_44_8.aspect
					local var_44_11 = var_44_6.sprite.bounds.size.x
					local var_44_12 = var_44_6.sprite.bounds.size.y
					local var_44_13 = var_44_10 / var_44_11
					local var_44_14 = var_44_9 / var_44_12
					local var_44_15 = var_44_14 < var_44_13 and var_44_13 or var_44_14

					var_44_5.transform.localScale = Vector3.New(var_44_15, var_44_15, 0)
				end

				for iter_44_0, iter_44_1 in pairs(arg_41_1.bgs_) do
					if iter_44_0 ~= "ST31a" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_16 = 0

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = true

				arg_41_1:SetGaussion(false)
			end

			local var_44_17 = 3.5

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_17 then
				local var_44_18 = (arg_41_1.time_ - var_44_16) / var_44_17
				local var_44_19 = Color.New(0, 0, 0)

				var_44_19.a = Mathf.Lerp(1, 0, var_44_18)
				arg_41_1.mask_.color = var_44_19
			end

			if arg_41_1.time_ >= var_44_16 + var_44_17 and arg_41_1.time_ < var_44_16 + var_44_17 + arg_44_0 then
				local var_44_20 = Color.New(0, 0, 0)
				local var_44_21 = 0

				arg_41_1.mask_.enabled = false
				var_44_20.a = var_44_21
				arg_41_1.mask_.color = var_44_20
			end

			if arg_41_1.frameCnt_ <= 1 then
				arg_41_1.dialog_:SetActive(false)
			end

			local var_44_22 = 3.5
			local var_44_23 = 0.625

			if var_44_22 < arg_41_1.time_ and arg_41_1.time_ <= var_44_22 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_24 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_24:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_25 = arg_41_1:GetWordFromCfg(410101010)
				local var_44_26 = arg_41_1:FormatText(var_44_25.content)

				arg_41_1.text_.text = var_44_26

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_27 = 25
				local var_44_28 = utf8.len(var_44_26)
				local var_44_29 = var_44_27 <= 0 and var_44_23 or var_44_23 * (var_44_28 / var_44_27)

				if var_44_29 > 0 and var_44_23 < var_44_29 then
					arg_41_1.talkMaxDuration = var_44_29
					var_44_22 = var_44_22 + 0.3

					if var_44_29 + var_44_22 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_29 + var_44_22
					end
				end

				arg_41_1.text_.text = var_44_26
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_30 = var_44_22 + 0.3
			local var_44_31 = math.max(var_44_23, arg_41_1.talkMaxDuration)

			if var_44_30 <= arg_41_1.time_ and arg_41_1.time_ < var_44_30 + var_44_31 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_30) / var_44_31

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_30 + var_44_31 and arg_41_1.time_ < var_44_30 + var_44_31 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play410101011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410101011
		arg_47_1.duration_ = 1.3

		local var_47_0 = {
			zh = 1.3,
			ja = 1.266
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
				arg_47_0:Play410101012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1012"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_50_0), arg_47_1.canvasGo_.transform)

				var_50_1.transform:SetSiblingIndex(1)

				var_50_1.name = var_50_0
				var_50_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_47_1.actors_[var_50_0] = var_50_1
			end

			local var_50_2 = arg_47_1.actors_["1012"].transform
			local var_50_3 = 0

			if var_50_3 < arg_47_1.time_ and arg_47_1.time_ <= var_50_3 + arg_50_0 then
				arg_47_1.var_.moveOldPos1012 = var_50_2.localPosition
				var_50_2.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1012", 3)

				local var_50_4 = var_50_2.childCount

				for iter_50_0 = 0, var_50_4 - 1 do
					local var_50_5 = var_50_2:GetChild(iter_50_0)

					if var_50_5.name == "split_3" or not string.find(var_50_5.name, "split") then
						var_50_5.gameObject:SetActive(true)
					else
						var_50_5.gameObject:SetActive(false)
					end
				end
			end

			local var_50_6 = 0.001

			if var_50_3 <= arg_47_1.time_ and arg_47_1.time_ < var_50_3 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_3) / var_50_6
				local var_50_8 = Vector3.New(0, -465, 300)

				var_50_2.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1012, var_50_8, var_50_7)
			end

			if arg_47_1.time_ >= var_50_3 + var_50_6 and arg_47_1.time_ < var_50_3 + var_50_6 + arg_50_0 then
				var_50_2.localPosition = Vector3.New(0, -465, 300)
			end

			local var_50_9 = arg_47_1.actors_["1012"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.actorSpriteComps1012 == nil then
				arg_47_1.var_.actorSpriteComps1012 = var_50_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_11 = 0.034

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.actorSpriteComps1012 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_50_2 then
							local var_50_13 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_12)

							iter_50_2.color = Color.New(var_50_13, var_50_13, var_50_13)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.actorSpriteComps1012 then
				local var_50_14 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_14, var_50_14, var_50_14)
					end
				end

				arg_47_1.var_.actorSpriteComps1012 = nil
			end

			local var_50_15 = manager.ui.mainCamera.transform
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.var_.shakeOldPos = var_50_15.localPosition
			end

			local var_50_17 = 0.5

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / 0.066
				local var_50_19, var_50_20 = math.modf(var_50_18)

				var_50_15.localPosition = Vector3.New(var_50_20 * 0.13, var_50_20 * 0.13, var_50_20 * 0.13) + arg_47_1.var_.shakeOldPos
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				var_50_15.localPosition = arg_47_1.var_.shakeOldPos
			end

			local var_50_21 = 0
			local var_50_22 = 1

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				local var_50_23 = "play"
				local var_50_24 = "effect"

				arg_47_1:AudioAction(var_50_23, var_50_24, "se_story_122_02", "se_story_122_02_table", "")
			end

			local var_50_25 = 0
			local var_50_26 = 0.075

			if var_50_25 < arg_47_1.time_ and arg_47_1.time_ <= var_50_25 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_27 = arg_47_1:FormatText(StoryNameCfg[595].name)

				arg_47_1.leftNameTxt_.text = var_50_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_28 = arg_47_1:GetWordFromCfg(410101011)
				local var_50_29 = arg_47_1:FormatText(var_50_28.content)

				arg_47_1.text_.text = var_50_29

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_30 = 3
				local var_50_31 = utf8.len(var_50_29)
				local var_50_32 = var_50_30 <= 0 and var_50_26 or var_50_26 * (var_50_31 / var_50_30)

				if var_50_32 > 0 and var_50_26 < var_50_32 then
					arg_47_1.talkMaxDuration = var_50_32

					if var_50_32 + var_50_25 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_32 + var_50_25
					end
				end

				arg_47_1.text_.text = var_50_29
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101011", "story_v_out_410101.awb") ~= 0 then
					local var_50_33 = manager.audio:GetVoiceLength("story_v_out_410101", "410101011", "story_v_out_410101.awb") / 1000

					if var_50_33 + var_50_25 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_33 + var_50_25
					end

					if var_50_28.prefab_name ~= "" and arg_47_1.actors_[var_50_28.prefab_name] ~= nil then
						local var_50_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_28.prefab_name].transform, "story_v_out_410101", "410101011", "story_v_out_410101.awb")

						arg_47_1:RecordAudio("410101011", var_50_34)
						arg_47_1:RecordAudio("410101011", var_50_34)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410101", "410101011", "story_v_out_410101.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410101", "410101011", "story_v_out_410101.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_35 = math.max(var_50_26, arg_47_1.talkMaxDuration)

			if var_50_25 <= arg_47_1.time_ and arg_47_1.time_ < var_50_25 + var_50_35 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_25) / var_50_35

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_25 + var_50_35 and arg_47_1.time_ < var_50_25 + var_50_35 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410101012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410101012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play410101013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1012"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.actorSpriteComps1012 == nil then
				arg_51_1.var_.actorSpriteComps1012 = var_54_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_2 = 0.034

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.actorSpriteComps1012 then
					for iter_54_0, iter_54_1 in pairs(arg_51_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_54_1 then
							local var_54_4 = Mathf.Lerp(iter_54_1.color.r, 0.5, var_54_3)

							iter_54_1.color = Color.New(var_54_4, var_54_4, var_54_4)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.actorSpriteComps1012 then
				local var_54_5 = 0.5

				for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_54_3 then
						iter_54_3.color = Color.New(var_54_5, var_54_5, var_54_5)
					end
				end

				arg_51_1.var_.actorSpriteComps1012 = nil
			end

			local var_54_6 = 0
			local var_54_7 = 1.1

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_8 = arg_51_1:GetWordFromCfg(410101012)
				local var_54_9 = arg_51_1:FormatText(var_54_8.content)

				arg_51_1.text_.text = var_54_9

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_10 = 44
				local var_54_11 = utf8.len(var_54_9)
				local var_54_12 = var_54_10 <= 0 and var_54_7 or var_54_7 * (var_54_11 / var_54_10)

				if var_54_12 > 0 and var_54_7 < var_54_12 then
					arg_51_1.talkMaxDuration = var_54_12

					if var_54_12 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_9
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_13 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_13 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_13

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_13 and arg_51_1.time_ < var_54_6 + var_54_13 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410101013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410101013
		arg_55_1.duration_ = 12

		local var_55_0 = {
			zh = 10.2,
			ja = 12
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
				arg_55_0:Play410101014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1012"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1012 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1012", 2)

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
				local var_58_6 = Vector3.New(-390, -465, 300)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1012, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_58_7 = arg_55_1.actors_["1012"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1012 == nil then
				arg_55_1.var_.actorSpriteComps1012 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps1012 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps1012 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps1012 = nil
			end

			local var_58_13 = arg_55_1.actors_["10064"].transform
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.var_.moveOldPos10064 = var_58_13.localPosition
				var_58_13.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10064", 4)

				local var_58_15 = var_58_13.childCount

				for iter_58_5 = 0, var_58_15 - 1 do
					local var_58_16 = var_58_13:GetChild(iter_58_5)

					if var_58_16.name == "" or not string.find(var_58_16.name, "split") then
						var_58_16.gameObject:SetActive(true)
					else
						var_58_16.gameObject:SetActive(false)
					end
				end
			end

			local var_58_17 = 0.001

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_14) / var_58_17
				local var_58_19 = Vector3.New(390, -570, 192.5)

				var_58_13.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10064, var_58_19, var_58_18)
			end

			if arg_55_1.time_ >= var_58_14 + var_58_17 and arg_55_1.time_ < var_58_14 + var_58_17 + arg_58_0 then
				var_58_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_58_20 = arg_55_1.actors_["10064"]
			local var_58_21 = 0

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 and arg_55_1.var_.actorSpriteComps10064 == nil then
				arg_55_1.var_.actorSpriteComps10064 = var_58_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_22 = 0.034

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_22 then
				local var_58_23 = (arg_55_1.time_ - var_58_21) / var_58_22

				if arg_55_1.var_.actorSpriteComps10064 then
					for iter_58_6, iter_58_7 in pairs(arg_55_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_58_7 then
							local var_58_24 = Mathf.Lerp(iter_58_7.color.r, 0.5, var_58_23)

							iter_58_7.color = Color.New(var_58_24, var_58_24, var_58_24)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_21 + var_58_22 and arg_55_1.time_ < var_58_21 + var_58_22 + arg_58_0 and arg_55_1.var_.actorSpriteComps10064 then
				local var_58_25 = 0.5

				for iter_58_8, iter_58_9 in pairs(arg_55_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_58_9 then
						iter_58_9.color = Color.New(var_58_25, var_58_25, var_58_25)
					end
				end

				arg_55_1.var_.actorSpriteComps10064 = nil
			end

			local var_58_26 = 0
			local var_58_27 = 1

			if var_58_26 < arg_55_1.time_ and arg_55_1.time_ <= var_58_26 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_28 = arg_55_1:FormatText(StoryNameCfg[595].name)

				arg_55_1.leftNameTxt_.text = var_58_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_29 = arg_55_1:GetWordFromCfg(410101013)
				local var_58_30 = arg_55_1:FormatText(var_58_29.content)

				arg_55_1.text_.text = var_58_30

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_31 = 40
				local var_58_32 = utf8.len(var_58_30)
				local var_58_33 = var_58_31 <= 0 and var_58_27 or var_58_27 * (var_58_32 / var_58_31)

				if var_58_33 > 0 and var_58_27 < var_58_33 then
					arg_55_1.talkMaxDuration = var_58_33

					if var_58_33 + var_58_26 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_33 + var_58_26
					end
				end

				arg_55_1.text_.text = var_58_30
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101013", "story_v_out_410101.awb") ~= 0 then
					local var_58_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101013", "story_v_out_410101.awb") / 1000

					if var_58_34 + var_58_26 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_34 + var_58_26
					end

					if var_58_29.prefab_name ~= "" and arg_55_1.actors_[var_58_29.prefab_name] ~= nil then
						local var_58_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_29.prefab_name].transform, "story_v_out_410101", "410101013", "story_v_out_410101.awb")

						arg_55_1:RecordAudio("410101013", var_58_35)
						arg_55_1:RecordAudio("410101013", var_58_35)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410101", "410101013", "story_v_out_410101.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410101", "410101013", "story_v_out_410101.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_36 = math.max(var_58_27, arg_55_1.talkMaxDuration)

			if var_58_26 <= arg_55_1.time_ and arg_55_1.time_ < var_58_26 + var_58_36 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_26) / var_58_36

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_26 + var_58_36 and arg_55_1.time_ < var_58_26 + var_58_36 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410101014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410101014
		arg_59_1.duration_ = 17.166

		local var_59_0 = {
			zh = 9.666,
			ja = 17.166
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
				arg_59_0:Play410101015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.05

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[595].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(410101014)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101014", "story_v_out_410101.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101014", "story_v_out_410101.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_410101", "410101014", "story_v_out_410101.awb")

						arg_59_1:RecordAudio("410101014", var_62_9)
						arg_59_1:RecordAudio("410101014", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410101", "410101014", "story_v_out_410101.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410101", "410101014", "story_v_out_410101.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410101015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410101015
		arg_63_1.duration_ = 15.633

		local var_63_0 = {
			zh = 12.5,
			ja = 15.633
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
				arg_63_0:Play410101016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1.25

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[595].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(410101015)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 50
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101015", "story_v_out_410101.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101015", "story_v_out_410101.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_410101", "410101015", "story_v_out_410101.awb")

						arg_63_1:RecordAudio("410101015", var_66_9)
						arg_63_1:RecordAudio("410101015", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410101", "410101015", "story_v_out_410101.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410101", "410101015", "story_v_out_410101.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410101016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410101016
		arg_67_1.duration_ = 11.233

		local var_67_0 = {
			zh = 6.1,
			ja = 11.233
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
				arg_67_0:Play410101017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1012"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1012 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1012", 2)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "split_3" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(-390, -465, 300)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1012, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_70_7 = arg_67_1.actors_["1012"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1012 == nil then
				arg_67_1.var_.actorSpriteComps1012 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps1012 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 0.5, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps1012 then
				local var_70_12 = 0.5

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps1012 = nil
			end

			local var_70_13 = arg_67_1.actors_["10064"].transform
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1.var_.moveOldPos10064 = var_70_13.localPosition
				var_70_13.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("10064", 4)

				local var_70_15 = var_70_13.childCount

				for iter_70_5 = 0, var_70_15 - 1 do
					local var_70_16 = var_70_13:GetChild(iter_70_5)

					if var_70_16.name == "" or not string.find(var_70_16.name, "split") then
						var_70_16.gameObject:SetActive(true)
					else
						var_70_16.gameObject:SetActive(false)
					end
				end
			end

			local var_70_17 = 0.001

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_14) / var_70_17
				local var_70_19 = Vector3.New(390, -570, 192.5)

				var_70_13.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10064, var_70_19, var_70_18)
			end

			if arg_67_1.time_ >= var_70_14 + var_70_17 and arg_67_1.time_ < var_70_14 + var_70_17 + arg_70_0 then
				var_70_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_70_20 = arg_67_1.actors_["10064"]
			local var_70_21 = 0

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 and arg_67_1.var_.actorSpriteComps10064 == nil then
				arg_67_1.var_.actorSpriteComps10064 = var_70_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_22 = 0.034

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22

				if arg_67_1.var_.actorSpriteComps10064 then
					for iter_70_6, iter_70_7 in pairs(arg_67_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_70_7 then
							local var_70_24 = Mathf.Lerp(iter_70_7.color.r, 1, var_70_23)

							iter_70_7.color = Color.New(var_70_24, var_70_24, var_70_24)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 and arg_67_1.var_.actorSpriteComps10064 then
				local var_70_25 = 1

				for iter_70_8, iter_70_9 in pairs(arg_67_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_70_9 then
						iter_70_9.color = Color.New(var_70_25, var_70_25, var_70_25)
					end
				end

				arg_67_1.var_.actorSpriteComps10064 = nil
			end

			local var_70_26 = 0
			local var_70_27 = 0.65

			if var_70_26 < arg_67_1.time_ and arg_67_1.time_ <= var_70_26 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_28 = arg_67_1:FormatText(StoryNameCfg[584].name)

				arg_67_1.leftNameTxt_.text = var_70_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_29 = arg_67_1:GetWordFromCfg(410101016)
				local var_70_30 = arg_67_1:FormatText(var_70_29.content)

				arg_67_1.text_.text = var_70_30

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_31 = 26
				local var_70_32 = utf8.len(var_70_30)
				local var_70_33 = var_70_31 <= 0 and var_70_27 or var_70_27 * (var_70_32 / var_70_31)

				if var_70_33 > 0 and var_70_27 < var_70_33 then
					arg_67_1.talkMaxDuration = var_70_33

					if var_70_33 + var_70_26 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_33 + var_70_26
					end
				end

				arg_67_1.text_.text = var_70_30
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101016", "story_v_out_410101.awb") ~= 0 then
					local var_70_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101016", "story_v_out_410101.awb") / 1000

					if var_70_34 + var_70_26 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_34 + var_70_26
					end

					if var_70_29.prefab_name ~= "" and arg_67_1.actors_[var_70_29.prefab_name] ~= nil then
						local var_70_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_29.prefab_name].transform, "story_v_out_410101", "410101016", "story_v_out_410101.awb")

						arg_67_1:RecordAudio("410101016", var_70_35)
						arg_67_1:RecordAudio("410101016", var_70_35)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410101", "410101016", "story_v_out_410101.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410101", "410101016", "story_v_out_410101.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_36 = math.max(var_70_27, arg_67_1.talkMaxDuration)

			if var_70_26 <= arg_67_1.time_ and arg_67_1.time_ < var_70_26 + var_70_36 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_26) / var_70_36

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_26 + var_70_36 and arg_67_1.time_ < var_70_26 + var_70_36 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410101017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410101017
		arg_71_1.duration_ = 11.733

		local var_71_0 = {
			zh = 4,
			ja = 11.733
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
				arg_71_0:Play410101018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1012"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1012 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1012", 2)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(-390, -465, 300)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1012, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_74_7 = arg_71_1.actors_["1012"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1012 == nil then
				arg_71_1.var_.actorSpriteComps1012 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1012 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1012 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1012 = nil
			end

			local var_74_13 = arg_71_1.actors_["10064"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 and arg_71_1.var_.actorSpriteComps10064 == nil then
				arg_71_1.var_.actorSpriteComps10064 = var_74_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_15 = 0.034

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_15 then
				local var_74_16 = (arg_71_1.time_ - var_74_14) / var_74_15

				if arg_71_1.var_.actorSpriteComps10064 then
					for iter_74_5, iter_74_6 in pairs(arg_71_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_74_6 then
							local var_74_17 = Mathf.Lerp(iter_74_6.color.r, 0.5, var_74_16)

							iter_74_6.color = Color.New(var_74_17, var_74_17, var_74_17)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 and arg_71_1.var_.actorSpriteComps10064 then
				local var_74_18 = 0.5

				for iter_74_7, iter_74_8 in pairs(arg_71_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_74_8 then
						iter_74_8.color = Color.New(var_74_18, var_74_18, var_74_18)
					end
				end

				arg_71_1.var_.actorSpriteComps10064 = nil
			end

			local var_74_19 = 0
			local var_74_20 = 0.475

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_21 = arg_71_1:FormatText(StoryNameCfg[595].name)

				arg_71_1.leftNameTxt_.text = var_74_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_22 = arg_71_1:GetWordFromCfg(410101017)
				local var_74_23 = arg_71_1:FormatText(var_74_22.content)

				arg_71_1.text_.text = var_74_23

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_24 = 19
				local var_74_25 = utf8.len(var_74_23)
				local var_74_26 = var_74_24 <= 0 and var_74_20 or var_74_20 * (var_74_25 / var_74_24)

				if var_74_26 > 0 and var_74_20 < var_74_26 then
					arg_71_1.talkMaxDuration = var_74_26

					if var_74_26 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_26 + var_74_19
					end
				end

				arg_71_1.text_.text = var_74_23
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101017", "story_v_out_410101.awb") ~= 0 then
					local var_74_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101017", "story_v_out_410101.awb") / 1000

					if var_74_27 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_27 + var_74_19
					end

					if var_74_22.prefab_name ~= "" and arg_71_1.actors_[var_74_22.prefab_name] ~= nil then
						local var_74_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_22.prefab_name].transform, "story_v_out_410101", "410101017", "story_v_out_410101.awb")

						arg_71_1:RecordAudio("410101017", var_74_28)
						arg_71_1:RecordAudio("410101017", var_74_28)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410101", "410101017", "story_v_out_410101.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410101", "410101017", "story_v_out_410101.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_29 = math.max(var_74_20, arg_71_1.talkMaxDuration)

			if var_74_19 <= arg_71_1.time_ and arg_71_1.time_ < var_74_19 + var_74_29 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_19) / var_74_29

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_19 + var_74_29 and arg_71_1.time_ < var_74_19 + var_74_29 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410101018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410101018
		arg_75_1.duration_ = 20.766

		local var_75_0 = {
			zh = 8.433,
			ja = 20.766
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
				arg_75_0:Play410101019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1012"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1012 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1012", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_1" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -465, 300)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1012, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_78_7 = arg_75_1.actors_["1012"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1012 == nil then
				arg_75_1.var_.actorSpriteComps1012 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps1012 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 0.5, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps1012 then
				local var_78_12 = 0.5

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps1012 = nil
			end

			local var_78_13 = arg_75_1.actors_["10064"].transform
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1.var_.moveOldPos10064 = var_78_13.localPosition
				var_78_13.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10064", 4)

				local var_78_15 = var_78_13.childCount

				for iter_78_5 = 0, var_78_15 - 1 do
					local var_78_16 = var_78_13:GetChild(iter_78_5)

					if var_78_16.name == "" or not string.find(var_78_16.name, "split") then
						var_78_16.gameObject:SetActive(true)
					else
						var_78_16.gameObject:SetActive(false)
					end
				end
			end

			local var_78_17 = 0.001

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_14) / var_78_17
				local var_78_19 = Vector3.New(390, -570, 192.5)

				var_78_13.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10064, var_78_19, var_78_18)
			end

			if arg_75_1.time_ >= var_78_14 + var_78_17 and arg_75_1.time_ < var_78_14 + var_78_17 + arg_78_0 then
				var_78_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_78_20 = arg_75_1.actors_["10064"]
			local var_78_21 = 0

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 and arg_75_1.var_.actorSpriteComps10064 == nil then
				arg_75_1.var_.actorSpriteComps10064 = var_78_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_22 = 0.034

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_21) / var_78_22

				if arg_75_1.var_.actorSpriteComps10064 then
					for iter_78_6, iter_78_7 in pairs(arg_75_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_78_7 then
							local var_78_24 = Mathf.Lerp(iter_78_7.color.r, 1, var_78_23)

							iter_78_7.color = Color.New(var_78_24, var_78_24, var_78_24)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_21 + var_78_22 and arg_75_1.time_ < var_78_21 + var_78_22 + arg_78_0 and arg_75_1.var_.actorSpriteComps10064 then
				local var_78_25 = 1

				for iter_78_8, iter_78_9 in pairs(arg_75_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_78_9 then
						iter_78_9.color = Color.New(var_78_25, var_78_25, var_78_25)
					end
				end

				arg_75_1.var_.actorSpriteComps10064 = nil
			end

			local var_78_26 = 0
			local var_78_27 = 1.025

			if var_78_26 < arg_75_1.time_ and arg_75_1.time_ <= var_78_26 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_28 = arg_75_1:FormatText(StoryNameCfg[584].name)

				arg_75_1.leftNameTxt_.text = var_78_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_29 = arg_75_1:GetWordFromCfg(410101018)
				local var_78_30 = arg_75_1:FormatText(var_78_29.content)

				arg_75_1.text_.text = var_78_30

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_31 = 41
				local var_78_32 = utf8.len(var_78_30)
				local var_78_33 = var_78_31 <= 0 and var_78_27 or var_78_27 * (var_78_32 / var_78_31)

				if var_78_33 > 0 and var_78_27 < var_78_33 then
					arg_75_1.talkMaxDuration = var_78_33

					if var_78_33 + var_78_26 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_33 + var_78_26
					end
				end

				arg_75_1.text_.text = var_78_30
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101018", "story_v_out_410101.awb") ~= 0 then
					local var_78_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101018", "story_v_out_410101.awb") / 1000

					if var_78_34 + var_78_26 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_34 + var_78_26
					end

					if var_78_29.prefab_name ~= "" and arg_75_1.actors_[var_78_29.prefab_name] ~= nil then
						local var_78_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_29.prefab_name].transform, "story_v_out_410101", "410101018", "story_v_out_410101.awb")

						arg_75_1:RecordAudio("410101018", var_78_35)
						arg_75_1:RecordAudio("410101018", var_78_35)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410101", "410101018", "story_v_out_410101.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410101", "410101018", "story_v_out_410101.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_36 = math.max(var_78_27, arg_75_1.talkMaxDuration)

			if var_78_26 <= arg_75_1.time_ and arg_75_1.time_ < var_78_26 + var_78_36 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_26) / var_78_36

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_26 + var_78_36 and arg_75_1.time_ < var_78_26 + var_78_36 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410101019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410101019
		arg_79_1.duration_ = 13

		local var_79_0 = {
			zh = 5.2,
			ja = 13
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
				arg_79_0:Play410101020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.675

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[584].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(410101019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101019", "story_v_out_410101.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101019", "story_v_out_410101.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_410101", "410101019", "story_v_out_410101.awb")

						arg_79_1:RecordAudio("410101019", var_82_9)
						arg_79_1:RecordAudio("410101019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410101", "410101019", "story_v_out_410101.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410101", "410101019", "story_v_out_410101.awb")
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
	Play410101020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410101020
		arg_83_1.duration_ = 6.633

		local var_83_0 = {
			zh = 6.633,
			ja = 4.966
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
				arg_83_0:Play410101021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1012"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1012 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1012", 2)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "split_1" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(-390, -465, 300)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1012, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_86_7 = arg_83_1.actors_["1012"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1012 == nil then
				arg_83_1.var_.actorSpriteComps1012 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps1012 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps1012 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps1012 = nil
			end

			local var_86_13 = arg_83_1.actors_["10064"].transform
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.var_.moveOldPos10064 = var_86_13.localPosition
				var_86_13.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10064", 4)

				local var_86_15 = var_86_13.childCount

				for iter_86_5 = 0, var_86_15 - 1 do
					local var_86_16 = var_86_13:GetChild(iter_86_5)

					if var_86_16.name == "" or not string.find(var_86_16.name, "split") then
						var_86_16.gameObject:SetActive(true)
					else
						var_86_16.gameObject:SetActive(false)
					end
				end
			end

			local var_86_17 = 0.001

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_14) / var_86_17
				local var_86_19 = Vector3.New(390, -570, 192.5)

				var_86_13.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10064, var_86_19, var_86_18)
			end

			if arg_83_1.time_ >= var_86_14 + var_86_17 and arg_83_1.time_ < var_86_14 + var_86_17 + arg_86_0 then
				var_86_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_86_20 = arg_83_1.actors_["10064"]
			local var_86_21 = 0

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 and arg_83_1.var_.actorSpriteComps10064 == nil then
				arg_83_1.var_.actorSpriteComps10064 = var_86_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_22 = 0.034

			if var_86_21 <= arg_83_1.time_ and arg_83_1.time_ < var_86_21 + var_86_22 then
				local var_86_23 = (arg_83_1.time_ - var_86_21) / var_86_22

				if arg_83_1.var_.actorSpriteComps10064 then
					for iter_86_6, iter_86_7 in pairs(arg_83_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_86_7 then
							local var_86_24 = Mathf.Lerp(iter_86_7.color.r, 0.5, var_86_23)

							iter_86_7.color = Color.New(var_86_24, var_86_24, var_86_24)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_21 + var_86_22 and arg_83_1.time_ < var_86_21 + var_86_22 + arg_86_0 and arg_83_1.var_.actorSpriteComps10064 then
				local var_86_25 = 0.5

				for iter_86_8, iter_86_9 in pairs(arg_83_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_86_9 then
						iter_86_9.color = Color.New(var_86_25, var_86_25, var_86_25)
					end
				end

				arg_83_1.var_.actorSpriteComps10064 = nil
			end

			local var_86_26 = 0
			local var_86_27 = 0.725

			if var_86_26 < arg_83_1.time_ and arg_83_1.time_ <= var_86_26 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_28 = arg_83_1:FormatText(StoryNameCfg[595].name)

				arg_83_1.leftNameTxt_.text = var_86_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_29 = arg_83_1:GetWordFromCfg(410101020)
				local var_86_30 = arg_83_1:FormatText(var_86_29.content)

				arg_83_1.text_.text = var_86_30

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_31 = 29
				local var_86_32 = utf8.len(var_86_30)
				local var_86_33 = var_86_31 <= 0 and var_86_27 or var_86_27 * (var_86_32 / var_86_31)

				if var_86_33 > 0 and var_86_27 < var_86_33 then
					arg_83_1.talkMaxDuration = var_86_33

					if var_86_33 + var_86_26 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_33 + var_86_26
					end
				end

				arg_83_1.text_.text = var_86_30
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101020", "story_v_out_410101.awb") ~= 0 then
					local var_86_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101020", "story_v_out_410101.awb") / 1000

					if var_86_34 + var_86_26 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_34 + var_86_26
					end

					if var_86_29.prefab_name ~= "" and arg_83_1.actors_[var_86_29.prefab_name] ~= nil then
						local var_86_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_29.prefab_name].transform, "story_v_out_410101", "410101020", "story_v_out_410101.awb")

						arg_83_1:RecordAudio("410101020", var_86_35)
						arg_83_1:RecordAudio("410101020", var_86_35)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410101", "410101020", "story_v_out_410101.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410101", "410101020", "story_v_out_410101.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_36 = math.max(var_86_27, arg_83_1.talkMaxDuration)

			if var_86_26 <= arg_83_1.time_ and arg_83_1.time_ < var_86_26 + var_86_36 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_26) / var_86_36

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_26 + var_86_36 and arg_83_1.time_ < var_86_26 + var_86_36 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410101021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410101021
		arg_87_1.duration_ = 11.066

		local var_87_0 = {
			zh = 5.5,
			ja = 11.066
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
				arg_87_0:Play410101022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.575

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[595].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(410101021)
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101021", "story_v_out_410101.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101021", "story_v_out_410101.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_410101", "410101021", "story_v_out_410101.awb")

						arg_87_1:RecordAudio("410101021", var_90_9)
						arg_87_1:RecordAudio("410101021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410101", "410101021", "story_v_out_410101.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410101", "410101021", "story_v_out_410101.awb")
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
	Play410101022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410101022
		arg_91_1.duration_ = 13.566

		local var_91_0 = {
			zh = 3.2,
			ja = 13.566
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
				arg_91_0:Play410101023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1012"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1012 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1012", 2)

				local var_94_2 = var_94_0.childCount

				for iter_94_0 = 0, var_94_2 - 1 do
					local var_94_3 = var_94_0:GetChild(iter_94_0)

					if var_94_3.name == "split_1" or not string.find(var_94_3.name, "split") then
						var_94_3.gameObject:SetActive(true)
					else
						var_94_3.gameObject:SetActive(false)
					end
				end
			end

			local var_94_4 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_1) / var_94_4
				local var_94_6 = Vector3.New(-390, -465, 300)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1012, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_94_7 = arg_91_1.actors_["1012"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1012 == nil then
				arg_91_1.var_.actorSpriteComps1012 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.034

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps1012 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 0.5, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps1012 then
				local var_94_12 = 0.5

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps1012 = nil
			end

			local var_94_13 = arg_91_1.actors_["10064"].transform
			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.var_.moveOldPos10064 = var_94_13.localPosition
				var_94_13.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("10064", 4)

				local var_94_15 = var_94_13.childCount

				for iter_94_5 = 0, var_94_15 - 1 do
					local var_94_16 = var_94_13:GetChild(iter_94_5)

					if var_94_16.name == "" or not string.find(var_94_16.name, "split") then
						var_94_16.gameObject:SetActive(true)
					else
						var_94_16.gameObject:SetActive(false)
					end
				end
			end

			local var_94_17 = 0.001

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_14) / var_94_17
				local var_94_19 = Vector3.New(390, -570, 192.5)

				var_94_13.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10064, var_94_19, var_94_18)
			end

			if arg_91_1.time_ >= var_94_14 + var_94_17 and arg_91_1.time_ < var_94_14 + var_94_17 + arg_94_0 then
				var_94_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_94_20 = arg_91_1.actors_["10064"]
			local var_94_21 = 0

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 and arg_91_1.var_.actorSpriteComps10064 == nil then
				arg_91_1.var_.actorSpriteComps10064 = var_94_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_22 = 0.034

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_22 then
				local var_94_23 = (arg_91_1.time_ - var_94_21) / var_94_22

				if arg_91_1.var_.actorSpriteComps10064 then
					for iter_94_6, iter_94_7 in pairs(arg_91_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_94_7 then
							local var_94_24 = Mathf.Lerp(iter_94_7.color.r, 1, var_94_23)

							iter_94_7.color = Color.New(var_94_24, var_94_24, var_94_24)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_21 + var_94_22 and arg_91_1.time_ < var_94_21 + var_94_22 + arg_94_0 and arg_91_1.var_.actorSpriteComps10064 then
				local var_94_25 = 1

				for iter_94_8, iter_94_9 in pairs(arg_91_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_94_9 then
						iter_94_9.color = Color.New(var_94_25, var_94_25, var_94_25)
					end
				end

				arg_91_1.var_.actorSpriteComps10064 = nil
			end

			local var_94_26 = 0
			local var_94_27 = 0.45

			if var_94_26 < arg_91_1.time_ and arg_91_1.time_ <= var_94_26 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_28 = arg_91_1:FormatText(StoryNameCfg[584].name)

				arg_91_1.leftNameTxt_.text = var_94_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_29 = arg_91_1:GetWordFromCfg(410101022)
				local var_94_30 = arg_91_1:FormatText(var_94_29.content)

				arg_91_1.text_.text = var_94_30

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_31 = 18
				local var_94_32 = utf8.len(var_94_30)
				local var_94_33 = var_94_31 <= 0 and var_94_27 or var_94_27 * (var_94_32 / var_94_31)

				if var_94_33 > 0 and var_94_27 < var_94_33 then
					arg_91_1.talkMaxDuration = var_94_33

					if var_94_33 + var_94_26 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_33 + var_94_26
					end
				end

				arg_91_1.text_.text = var_94_30
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101022", "story_v_out_410101.awb") ~= 0 then
					local var_94_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101022", "story_v_out_410101.awb") / 1000

					if var_94_34 + var_94_26 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_34 + var_94_26
					end

					if var_94_29.prefab_name ~= "" and arg_91_1.actors_[var_94_29.prefab_name] ~= nil then
						local var_94_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_29.prefab_name].transform, "story_v_out_410101", "410101022", "story_v_out_410101.awb")

						arg_91_1:RecordAudio("410101022", var_94_35)
						arg_91_1:RecordAudio("410101022", var_94_35)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410101", "410101022", "story_v_out_410101.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410101", "410101022", "story_v_out_410101.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_36 = math.max(var_94_27, arg_91_1.talkMaxDuration)

			if var_94_26 <= arg_91_1.time_ and arg_91_1.time_ < var_94_26 + var_94_36 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_26) / var_94_36

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_26 + var_94_36 and arg_91_1.time_ < var_94_26 + var_94_36 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410101023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410101023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play410101024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.mask_.enabled = true
				arg_95_1.mask_.raycastTarget = true

				arg_95_1:SetGaussion(false)
			end

			local var_98_1 = 0.5

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_1 then
				local var_98_2 = (arg_95_1.time_ - var_98_0) / var_98_1
				local var_98_3 = Color.New(1, 1, 1)

				var_98_3.a = Mathf.Lerp(1, 0, var_98_2)
				arg_95_1.mask_.color = var_98_3
			end

			if arg_95_1.time_ >= var_98_0 + var_98_1 and arg_95_1.time_ < var_98_0 + var_98_1 + arg_98_0 then
				local var_98_4 = Color.New(1, 1, 1)
				local var_98_5 = 0

				arg_95_1.mask_.enabled = false
				var_98_4.a = var_98_5
				arg_95_1.mask_.color = var_98_4
			end

			local var_98_6 = arg_95_1.actors_["1012"].transform
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 then
				arg_95_1.var_.moveOldPos1012 = var_98_6.localPosition
				var_98_6.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1012", 7)

				local var_98_8 = var_98_6.childCount

				for iter_98_0 = 0, var_98_8 - 1 do
					local var_98_9 = var_98_6:GetChild(iter_98_0)

					if var_98_9.name == "split_1" or not string.find(var_98_9.name, "split") then
						var_98_9.gameObject:SetActive(true)
					else
						var_98_9.gameObject:SetActive(false)
					end
				end
			end

			local var_98_10 = 0.001

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_10 then
				local var_98_11 = (arg_95_1.time_ - var_98_7) / var_98_10
				local var_98_12 = Vector3.New(0, -2000, 300)

				var_98_6.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1012, var_98_12, var_98_11)
			end

			if arg_95_1.time_ >= var_98_7 + var_98_10 and arg_95_1.time_ < var_98_7 + var_98_10 + arg_98_0 then
				var_98_6.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_98_13 = arg_95_1.actors_["10064"].transform
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1.var_.moveOldPos10064 = var_98_13.localPosition
				var_98_13.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10064", 7)

				local var_98_15 = var_98_13.childCount

				for iter_98_1 = 0, var_98_15 - 1 do
					local var_98_16 = var_98_13:GetChild(iter_98_1)

					if var_98_16.name == "" or not string.find(var_98_16.name, "split") then
						var_98_16.gameObject:SetActive(true)
					else
						var_98_16.gameObject:SetActive(false)
					end
				end
			end

			local var_98_17 = 0.001

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_14) / var_98_17
				local var_98_19 = Vector3.New(0, -2000, 192.5)

				var_98_13.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10064, var_98_19, var_98_18)
			end

			if arg_95_1.time_ >= var_98_14 + var_98_17 and arg_95_1.time_ < var_98_14 + var_98_17 + arg_98_0 then
				var_98_13.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_98_20 = 0
			local var_98_21 = 1.2

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0

				arg_95_1.dialog_:SetActive(true)

				local var_98_22 = LeanTween.value(arg_95_1.dialog_, 0, 1, 0.3)

				var_98_22:setOnUpdate(LuaHelper.FloatAction(function(arg_99_0)
					arg_95_1.dialogCg_.alpha = arg_99_0
				end))
				var_98_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_95_1.dialog_)
					var_98_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_95_1.duration_ = arg_95_1.duration_ + 0.3

				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_23 = arg_95_1:GetWordFromCfg(410101023)
				local var_98_24 = arg_95_1:FormatText(var_98_23.content)

				arg_95_1.text_.text = var_98_24

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_25 = 48
				local var_98_26 = utf8.len(var_98_24)
				local var_98_27 = var_98_25 <= 0 and var_98_21 or var_98_21 * (var_98_26 / var_98_25)

				if var_98_27 > 0 and var_98_21 < var_98_27 then
					arg_95_1.talkMaxDuration = var_98_27
					var_98_20 = var_98_20 + 0.3

					if var_98_27 + var_98_20 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_20
					end
				end

				arg_95_1.text_.text = var_98_24
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_28 = var_98_20 + 0.3
			local var_98_29 = math.max(var_98_21, arg_95_1.talkMaxDuration)

			if var_98_28 <= arg_95_1.time_ and arg_95_1.time_ < var_98_28 + var_98_29 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_28) / var_98_29

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_28 + var_98_29 and arg_95_1.time_ < var_98_28 + var_98_29 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410101024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 410101024
		arg_101_1.duration_ = 5.233

		local var_101_0 = {
			zh = 2.266,
			ja = 5.233
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
				arg_101_0:Play410101025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1012"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1012 = var_104_0.localPosition
				var_104_0.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("1012", 2)

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
				local var_104_6 = Vector3.New(-390, -465, 300)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1012, var_104_6, var_104_5)
			end

			if arg_101_1.time_ >= var_104_1 + var_104_4 and arg_101_1.time_ < var_104_1 + var_104_4 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(-390, -465, 300)
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
							local var_104_11 = Mathf.Lerp(iter_104_2.color.r, 1, var_104_10)

							iter_104_2.color = Color.New(var_104_11, var_104_11, var_104_11)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_8 + var_104_9 and arg_101_1.time_ < var_104_8 + var_104_9 + arg_104_0 and arg_101_1.var_.actorSpriteComps1012 then
				local var_104_12 = 1

				for iter_104_3, iter_104_4 in pairs(arg_101_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_104_4 then
						iter_104_4.color = Color.New(var_104_12, var_104_12, var_104_12)
					end
				end

				arg_101_1.var_.actorSpriteComps1012 = nil
			end

			local var_104_13 = 0
			local var_104_14 = 0.125

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_15 = arg_101_1:FormatText(StoryNameCfg[595].name)

				arg_101_1.leftNameTxt_.text = var_104_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_16 = arg_101_1:GetWordFromCfg(410101024)
				local var_104_17 = arg_101_1:FormatText(var_104_16.content)

				arg_101_1.text_.text = var_104_17

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_18 = 5
				local var_104_19 = utf8.len(var_104_17)
				local var_104_20 = var_104_18 <= 0 and var_104_14 or var_104_14 * (var_104_19 / var_104_18)

				if var_104_20 > 0 and var_104_14 < var_104_20 then
					arg_101_1.talkMaxDuration = var_104_20

					if var_104_20 + var_104_13 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_20 + var_104_13
					end
				end

				arg_101_1.text_.text = var_104_17
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101024", "story_v_out_410101.awb") ~= 0 then
					local var_104_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101024", "story_v_out_410101.awb") / 1000

					if var_104_21 + var_104_13 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_21 + var_104_13
					end

					if var_104_16.prefab_name ~= "" and arg_101_1.actors_[var_104_16.prefab_name] ~= nil then
						local var_104_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_16.prefab_name].transform, "story_v_out_410101", "410101024", "story_v_out_410101.awb")

						arg_101_1:RecordAudio("410101024", var_104_22)
						arg_101_1:RecordAudio("410101024", var_104_22)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_410101", "410101024", "story_v_out_410101.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_410101", "410101024", "story_v_out_410101.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_23 = math.max(var_104_14, arg_101_1.talkMaxDuration)

			if var_104_13 <= arg_101_1.time_ and arg_101_1.time_ < var_104_13 + var_104_23 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_13) / var_104_23

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_13 + var_104_23 and arg_101_1.time_ < var_104_13 + var_104_23 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play410101025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 410101025
		arg_105_1.duration_ = 4.8

		local var_105_0 = {
			zh = 2.366,
			ja = 4.8
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
				arg_105_0:Play410101026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1012"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1012 = var_108_0.localPosition
				var_108_0.localScale = Vector3.New(1, 1, 1)

				arg_105_1:CheckSpriteTmpPos("1012", 2)

				local var_108_2 = var_108_0.childCount

				for iter_108_0 = 0, var_108_2 - 1 do
					local var_108_3 = var_108_0:GetChild(iter_108_0)

					if var_108_3.name == "split_1" or not string.find(var_108_3.name, "split") then
						var_108_3.gameObject:SetActive(true)
					else
						var_108_3.gameObject:SetActive(false)
					end
				end
			end

			local var_108_4 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_4 then
				local var_108_5 = (arg_105_1.time_ - var_108_1) / var_108_4
				local var_108_6 = Vector3.New(-390, -465, 300)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1012, var_108_6, var_108_5)
			end

			if arg_105_1.time_ >= var_108_1 + var_108_4 and arg_105_1.time_ < var_108_1 + var_108_4 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_108_7 = arg_105_1.actors_["1012"]
			local var_108_8 = 0

			if var_108_8 < arg_105_1.time_ and arg_105_1.time_ <= var_108_8 + arg_108_0 and arg_105_1.var_.actorSpriteComps1012 == nil then
				arg_105_1.var_.actorSpriteComps1012 = var_108_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_9 = 0.034

			if var_108_8 <= arg_105_1.time_ and arg_105_1.time_ < var_108_8 + var_108_9 then
				local var_108_10 = (arg_105_1.time_ - var_108_8) / var_108_9

				if arg_105_1.var_.actorSpriteComps1012 then
					for iter_108_1, iter_108_2 in pairs(arg_105_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_108_2 then
							local var_108_11 = Mathf.Lerp(iter_108_2.color.r, 0.5, var_108_10)

							iter_108_2.color = Color.New(var_108_11, var_108_11, var_108_11)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_8 + var_108_9 and arg_105_1.time_ < var_108_8 + var_108_9 + arg_108_0 and arg_105_1.var_.actorSpriteComps1012 then
				local var_108_12 = 0.5

				for iter_108_3, iter_108_4 in pairs(arg_105_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_108_4 then
						iter_108_4.color = Color.New(var_108_12, var_108_12, var_108_12)
					end
				end

				arg_105_1.var_.actorSpriteComps1012 = nil
			end

			local var_108_13 = arg_105_1.actors_["10064"].transform
			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1.var_.moveOldPos10064 = var_108_13.localPosition
				var_108_13.localScale = Vector3.New(1, 1, 1)

				arg_105_1:CheckSpriteTmpPos("10064", 4)

				local var_108_15 = var_108_13.childCount

				for iter_108_5 = 0, var_108_15 - 1 do
					local var_108_16 = var_108_13:GetChild(iter_108_5)

					if var_108_16.name == "" or not string.find(var_108_16.name, "split") then
						var_108_16.gameObject:SetActive(true)
					else
						var_108_16.gameObject:SetActive(false)
					end
				end
			end

			local var_108_17 = 0.001

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_14) / var_108_17
				local var_108_19 = Vector3.New(390, -570, 192.5)

				var_108_13.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10064, var_108_19, var_108_18)
			end

			if arg_105_1.time_ >= var_108_14 + var_108_17 and arg_105_1.time_ < var_108_14 + var_108_17 + arg_108_0 then
				var_108_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_108_20 = arg_105_1.actors_["10064"]
			local var_108_21 = 0

			if var_108_21 < arg_105_1.time_ and arg_105_1.time_ <= var_108_21 + arg_108_0 and arg_105_1.var_.actorSpriteComps10064 == nil then
				arg_105_1.var_.actorSpriteComps10064 = var_108_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_22 = 0.034

			if var_108_21 <= arg_105_1.time_ and arg_105_1.time_ < var_108_21 + var_108_22 then
				local var_108_23 = (arg_105_1.time_ - var_108_21) / var_108_22

				if arg_105_1.var_.actorSpriteComps10064 then
					for iter_108_6, iter_108_7 in pairs(arg_105_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_108_7 then
							local var_108_24 = Mathf.Lerp(iter_108_7.color.r, 1, var_108_23)

							iter_108_7.color = Color.New(var_108_24, var_108_24, var_108_24)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_21 + var_108_22 and arg_105_1.time_ < var_108_21 + var_108_22 + arg_108_0 and arg_105_1.var_.actorSpriteComps10064 then
				local var_108_25 = 1

				for iter_108_8, iter_108_9 in pairs(arg_105_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_108_9 then
						iter_108_9.color = Color.New(var_108_25, var_108_25, var_108_25)
					end
				end

				arg_105_1.var_.actorSpriteComps10064 = nil
			end

			local var_108_26 = 0
			local var_108_27 = 0.3

			if var_108_26 < arg_105_1.time_ and arg_105_1.time_ <= var_108_26 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_28 = arg_105_1:FormatText(StoryNameCfg[584].name)

				arg_105_1.leftNameTxt_.text = var_108_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_29 = arg_105_1:GetWordFromCfg(410101025)
				local var_108_30 = arg_105_1:FormatText(var_108_29.content)

				arg_105_1.text_.text = var_108_30

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_31 = 12
				local var_108_32 = utf8.len(var_108_30)
				local var_108_33 = var_108_31 <= 0 and var_108_27 or var_108_27 * (var_108_32 / var_108_31)

				if var_108_33 > 0 and var_108_27 < var_108_33 then
					arg_105_1.talkMaxDuration = var_108_33

					if var_108_33 + var_108_26 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_33 + var_108_26
					end
				end

				arg_105_1.text_.text = var_108_30
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101025", "story_v_out_410101.awb") ~= 0 then
					local var_108_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101025", "story_v_out_410101.awb") / 1000

					if var_108_34 + var_108_26 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_34 + var_108_26
					end

					if var_108_29.prefab_name ~= "" and arg_105_1.actors_[var_108_29.prefab_name] ~= nil then
						local var_108_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_29.prefab_name].transform, "story_v_out_410101", "410101025", "story_v_out_410101.awb")

						arg_105_1:RecordAudio("410101025", var_108_35)
						arg_105_1:RecordAudio("410101025", var_108_35)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_410101", "410101025", "story_v_out_410101.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_410101", "410101025", "story_v_out_410101.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_36 = math.max(var_108_27, arg_105_1.talkMaxDuration)

			if var_108_26 <= arg_105_1.time_ and arg_105_1.time_ < var_108_26 + var_108_36 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_26) / var_108_36

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_26 + var_108_36 and arg_105_1.time_ < var_108_26 + var_108_36 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play410101026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 410101026
		arg_109_1.duration_ = 12.366

		local var_109_0 = {
			zh = 2.566,
			ja = 12.366
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
				arg_109_0:Play410101027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1012"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1012 = var_112_0.localPosition
				var_112_0.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("1012", 2)

				local var_112_2 = var_112_0.childCount

				for iter_112_0 = 0, var_112_2 - 1 do
					local var_112_3 = var_112_0:GetChild(iter_112_0)

					if var_112_3.name == "split_1" or not string.find(var_112_3.name, "split") then
						var_112_3.gameObject:SetActive(true)
					else
						var_112_3.gameObject:SetActive(false)
					end
				end
			end

			local var_112_4 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_4 then
				local var_112_5 = (arg_109_1.time_ - var_112_1) / var_112_4
				local var_112_6 = Vector3.New(-390, -465, 300)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1012, var_112_6, var_112_5)
			end

			if arg_109_1.time_ >= var_112_1 + var_112_4 and arg_109_1.time_ < var_112_1 + var_112_4 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(-390, -465, 300)
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

			local var_112_13 = arg_109_1.actors_["10064"].transform
			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				arg_109_1.var_.moveOldPos10064 = var_112_13.localPosition
				var_112_13.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("10064", 4)

				local var_112_15 = var_112_13.childCount

				for iter_112_5 = 0, var_112_15 - 1 do
					local var_112_16 = var_112_13:GetChild(iter_112_5)

					if var_112_16.name == "" or not string.find(var_112_16.name, "split") then
						var_112_16.gameObject:SetActive(true)
					else
						var_112_16.gameObject:SetActive(false)
					end
				end
			end

			local var_112_17 = 0.001

			if var_112_14 <= arg_109_1.time_ and arg_109_1.time_ < var_112_14 + var_112_17 then
				local var_112_18 = (arg_109_1.time_ - var_112_14) / var_112_17
				local var_112_19 = Vector3.New(390, -570, 192.5)

				var_112_13.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10064, var_112_19, var_112_18)
			end

			if arg_109_1.time_ >= var_112_14 + var_112_17 and arg_109_1.time_ < var_112_14 + var_112_17 + arg_112_0 then
				var_112_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_112_20 = arg_109_1.actors_["10064"]
			local var_112_21 = 0

			if var_112_21 < arg_109_1.time_ and arg_109_1.time_ <= var_112_21 + arg_112_0 and arg_109_1.var_.actorSpriteComps10064 == nil then
				arg_109_1.var_.actorSpriteComps10064 = var_112_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_22 = 0.034

			if var_112_21 <= arg_109_1.time_ and arg_109_1.time_ < var_112_21 + var_112_22 then
				local var_112_23 = (arg_109_1.time_ - var_112_21) / var_112_22

				if arg_109_1.var_.actorSpriteComps10064 then
					for iter_112_6, iter_112_7 in pairs(arg_109_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_112_7 then
							local var_112_24 = Mathf.Lerp(iter_112_7.color.r, 0.5, var_112_23)

							iter_112_7.color = Color.New(var_112_24, var_112_24, var_112_24)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_21 + var_112_22 and arg_109_1.time_ < var_112_21 + var_112_22 + arg_112_0 and arg_109_1.var_.actorSpriteComps10064 then
				local var_112_25 = 0.5

				for iter_112_8, iter_112_9 in pairs(arg_109_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_112_9 then
						iter_112_9.color = Color.New(var_112_25, var_112_25, var_112_25)
					end
				end

				arg_109_1.var_.actorSpriteComps10064 = nil
			end

			local var_112_26 = 0
			local var_112_27 = 0.325

			if var_112_26 < arg_109_1.time_ and arg_109_1.time_ <= var_112_26 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_28 = arg_109_1:FormatText(StoryNameCfg[595].name)

				arg_109_1.leftNameTxt_.text = var_112_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_29 = arg_109_1:GetWordFromCfg(410101026)
				local var_112_30 = arg_109_1:FormatText(var_112_29.content)

				arg_109_1.text_.text = var_112_30

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_31 = 13
				local var_112_32 = utf8.len(var_112_30)
				local var_112_33 = var_112_31 <= 0 and var_112_27 or var_112_27 * (var_112_32 / var_112_31)

				if var_112_33 > 0 and var_112_27 < var_112_33 then
					arg_109_1.talkMaxDuration = var_112_33

					if var_112_33 + var_112_26 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_33 + var_112_26
					end
				end

				arg_109_1.text_.text = var_112_30
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101026", "story_v_out_410101.awb") ~= 0 then
					local var_112_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101026", "story_v_out_410101.awb") / 1000

					if var_112_34 + var_112_26 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_34 + var_112_26
					end

					if var_112_29.prefab_name ~= "" and arg_109_1.actors_[var_112_29.prefab_name] ~= nil then
						local var_112_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_29.prefab_name].transform, "story_v_out_410101", "410101026", "story_v_out_410101.awb")

						arg_109_1:RecordAudio("410101026", var_112_35)
						arg_109_1:RecordAudio("410101026", var_112_35)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_410101", "410101026", "story_v_out_410101.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_410101", "410101026", "story_v_out_410101.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_36 = math.max(var_112_27, arg_109_1.talkMaxDuration)

			if var_112_26 <= arg_109_1.time_ and arg_109_1.time_ < var_112_26 + var_112_36 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_26) / var_112_36

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_26 + var_112_36 and arg_109_1.time_ < var_112_26 + var_112_36 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play410101027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410101027
		arg_113_1.duration_ = 23.7

		local var_113_0 = {
			zh = 14.833,
			ja = 23.7
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
				arg_113_0:Play410101028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.6

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[595].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(410101027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 64
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101027", "story_v_out_410101.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101027", "story_v_out_410101.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_410101", "410101027", "story_v_out_410101.awb")

						arg_113_1:RecordAudio("410101027", var_116_9)
						arg_113_1:RecordAudio("410101027", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_410101", "410101027", "story_v_out_410101.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_410101", "410101027", "story_v_out_410101.awb")
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
	Play410101028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410101028
		arg_117_1.duration_ = 14.9

		local var_117_0 = {
			zh = 9.6,
			ja = 14.9
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
				arg_117_0:Play410101029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1.075

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[595].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(410101028)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101028", "story_v_out_410101.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101028", "story_v_out_410101.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_410101", "410101028", "story_v_out_410101.awb")

						arg_117_1:RecordAudio("410101028", var_120_9)
						arg_117_1:RecordAudio("410101028", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_410101", "410101028", "story_v_out_410101.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_410101", "410101028", "story_v_out_410101.awb")
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
	Play410101029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410101029
		arg_121_1.duration_ = 20.766

		local var_121_0 = {
			zh = 11.933,
			ja = 20.766
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
				arg_121_0:Play410101030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1.475

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[595].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(410101029)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101029", "story_v_out_410101.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101029", "story_v_out_410101.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_410101", "410101029", "story_v_out_410101.awb")

						arg_121_1:RecordAudio("410101029", var_124_9)
						arg_121_1:RecordAudio("410101029", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_410101", "410101029", "story_v_out_410101.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_410101", "410101029", "story_v_out_410101.awb")
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
	Play410101030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410101030
		arg_125_1.duration_ = 7.966

		local var_125_0 = {
			zh = 7.966,
			ja = 7.8
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
				arg_125_0:Play410101031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1012"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1012 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1012", 2)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "split_1" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(-390, -465, 300)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1012, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(-390, -465, 300)
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
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 0.5, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps1012 then
				local var_128_12 = 0.5

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

				arg_125_1:CheckSpriteTmpPos("10064", 4)

				local var_128_15 = var_128_13.childCount

				for iter_128_5 = 0, var_128_15 - 1 do
					local var_128_16 = var_128_13:GetChild(iter_128_5)

					if var_128_16.name == "" or not string.find(var_128_16.name, "split") then
						var_128_16.gameObject:SetActive(true)
					else
						var_128_16.gameObject:SetActive(false)
					end
				end
			end

			local var_128_17 = 0.001

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_14) / var_128_17
				local var_128_19 = Vector3.New(390, -570, 192.5)

				var_128_13.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10064, var_128_19, var_128_18)
			end

			if arg_125_1.time_ >= var_128_14 + var_128_17 and arg_125_1.time_ < var_128_14 + var_128_17 + arg_128_0 then
				var_128_13.localPosition = Vector3.New(390, -570, 192.5)
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
							local var_128_24 = Mathf.Lerp(iter_128_7.color.r, 1, var_128_23)

							iter_128_7.color = Color.New(var_128_24, var_128_24, var_128_24)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_21 + var_128_22 and arg_125_1.time_ < var_128_21 + var_128_22 + arg_128_0 and arg_125_1.var_.actorSpriteComps10064 then
				local var_128_25 = 1

				for iter_128_8, iter_128_9 in pairs(arg_125_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_128_9 then
						iter_128_9.color = Color.New(var_128_25, var_128_25, var_128_25)
					end
				end

				arg_125_1.var_.actorSpriteComps10064 = nil
			end

			local var_128_26 = 0
			local var_128_27 = 0.725

			if var_128_26 < arg_125_1.time_ and arg_125_1.time_ <= var_128_26 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_28 = arg_125_1:FormatText(StoryNameCfg[584].name)

				arg_125_1.leftNameTxt_.text = var_128_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_29 = arg_125_1:GetWordFromCfg(410101030)
				local var_128_30 = arg_125_1:FormatText(var_128_29.content)

				arg_125_1.text_.text = var_128_30

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_31 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101030", "story_v_out_410101.awb") ~= 0 then
					local var_128_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101030", "story_v_out_410101.awb") / 1000

					if var_128_34 + var_128_26 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_34 + var_128_26
					end

					if var_128_29.prefab_name ~= "" and arg_125_1.actors_[var_128_29.prefab_name] ~= nil then
						local var_128_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_29.prefab_name].transform, "story_v_out_410101", "410101030", "story_v_out_410101.awb")

						arg_125_1:RecordAudio("410101030", var_128_35)
						arg_125_1:RecordAudio("410101030", var_128_35)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410101", "410101030", "story_v_out_410101.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410101", "410101030", "story_v_out_410101.awb")
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
	Play410101031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410101031
		arg_129_1.duration_ = 5.266

		local var_129_0 = {
			zh = 5.266,
			ja = 3.766
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
				arg_129_0:Play410101032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.55

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[584].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(410101031)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 22
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101031", "story_v_out_410101.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101031", "story_v_out_410101.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_410101", "410101031", "story_v_out_410101.awb")

						arg_129_1:RecordAudio("410101031", var_132_9)
						arg_129_1:RecordAudio("410101031", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410101", "410101031", "story_v_out_410101.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410101", "410101031", "story_v_out_410101.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_10 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_10 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_10

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_10 and arg_129_1.time_ < var_132_0 + var_132_10 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play410101032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410101032
		arg_133_1.duration_ = 8.9

		local var_133_0 = {
			zh = 1.733,
			ja = 8.9
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
				arg_133_0:Play410101033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1012"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1012 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("1012", 2)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "split_3" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(-390, -465, 300)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1012, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_136_7 = arg_133_1.actors_["1012"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps1012 == nil then
				arg_133_1.var_.actorSpriteComps1012 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.034

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps1012 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 1, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps1012 then
				local var_136_12 = 1

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps1012 = nil
			end

			local var_136_13 = arg_133_1.actors_["10064"].transform
			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1.var_.moveOldPos10064 = var_136_13.localPosition
				var_136_13.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10064", 4)

				local var_136_15 = var_136_13.childCount

				for iter_136_5 = 0, var_136_15 - 1 do
					local var_136_16 = var_136_13:GetChild(iter_136_5)

					if var_136_16.name == "" or not string.find(var_136_16.name, "split") then
						var_136_16.gameObject:SetActive(true)
					else
						var_136_16.gameObject:SetActive(false)
					end
				end
			end

			local var_136_17 = 0.001

			if var_136_14 <= arg_133_1.time_ and arg_133_1.time_ < var_136_14 + var_136_17 then
				local var_136_18 = (arg_133_1.time_ - var_136_14) / var_136_17
				local var_136_19 = Vector3.New(390, -570, 192.5)

				var_136_13.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10064, var_136_19, var_136_18)
			end

			if arg_133_1.time_ >= var_136_14 + var_136_17 and arg_133_1.time_ < var_136_14 + var_136_17 + arg_136_0 then
				var_136_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_136_20 = arg_133_1.actors_["10064"]
			local var_136_21 = 0

			if var_136_21 < arg_133_1.time_ and arg_133_1.time_ <= var_136_21 + arg_136_0 and arg_133_1.var_.actorSpriteComps10064 == nil then
				arg_133_1.var_.actorSpriteComps10064 = var_136_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_22 = 0.034

			if var_136_21 <= arg_133_1.time_ and arg_133_1.time_ < var_136_21 + var_136_22 then
				local var_136_23 = (arg_133_1.time_ - var_136_21) / var_136_22

				if arg_133_1.var_.actorSpriteComps10064 then
					for iter_136_6, iter_136_7 in pairs(arg_133_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_136_7 then
							local var_136_24 = Mathf.Lerp(iter_136_7.color.r, 0.5, var_136_23)

							iter_136_7.color = Color.New(var_136_24, var_136_24, var_136_24)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_21 + var_136_22 and arg_133_1.time_ < var_136_21 + var_136_22 + arg_136_0 and arg_133_1.var_.actorSpriteComps10064 then
				local var_136_25 = 0.5

				for iter_136_8, iter_136_9 in pairs(arg_133_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_136_9 then
						iter_136_9.color = Color.New(var_136_25, var_136_25, var_136_25)
					end
				end

				arg_133_1.var_.actorSpriteComps10064 = nil
			end

			local var_136_26 = 0
			local var_136_27 = 0.2

			if var_136_26 < arg_133_1.time_ and arg_133_1.time_ <= var_136_26 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_28 = arg_133_1:FormatText(StoryNameCfg[595].name)

				arg_133_1.leftNameTxt_.text = var_136_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_29 = arg_133_1:GetWordFromCfg(410101032)
				local var_136_30 = arg_133_1:FormatText(var_136_29.content)

				arg_133_1.text_.text = var_136_30

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_31 = 8
				local var_136_32 = utf8.len(var_136_30)
				local var_136_33 = var_136_31 <= 0 and var_136_27 or var_136_27 * (var_136_32 / var_136_31)

				if var_136_33 > 0 and var_136_27 < var_136_33 then
					arg_133_1.talkMaxDuration = var_136_33

					if var_136_33 + var_136_26 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_33 + var_136_26
					end
				end

				arg_133_1.text_.text = var_136_30
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101032", "story_v_out_410101.awb") ~= 0 then
					local var_136_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101032", "story_v_out_410101.awb") / 1000

					if var_136_34 + var_136_26 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_34 + var_136_26
					end

					if var_136_29.prefab_name ~= "" and arg_133_1.actors_[var_136_29.prefab_name] ~= nil then
						local var_136_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_29.prefab_name].transform, "story_v_out_410101", "410101032", "story_v_out_410101.awb")

						arg_133_1:RecordAudio("410101032", var_136_35)
						arg_133_1:RecordAudio("410101032", var_136_35)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410101", "410101032", "story_v_out_410101.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410101", "410101032", "story_v_out_410101.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_36 = math.max(var_136_27, arg_133_1.talkMaxDuration)

			if var_136_26 <= arg_133_1.time_ and arg_133_1.time_ < var_136_26 + var_136_36 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_26) / var_136_36

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_26 + var_136_36 and arg_133_1.time_ < var_136_26 + var_136_36 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410101033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410101033
		arg_137_1.duration_ = 2.733

		local var_137_0 = {
			zh = 1.3,
			ja = 2.733
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play410101034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1012"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1012 = var_140_0.localPosition
				var_140_0.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("1012", 2)

				local var_140_2 = var_140_0.childCount

				for iter_140_0 = 0, var_140_2 - 1 do
					local var_140_3 = var_140_0:GetChild(iter_140_0)

					if var_140_3.name == "split_1" or not string.find(var_140_3.name, "split") then
						var_140_3.gameObject:SetActive(true)
					else
						var_140_3.gameObject:SetActive(false)
					end
				end
			end

			local var_140_4 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_4 then
				local var_140_5 = (arg_137_1.time_ - var_140_1) / var_140_4
				local var_140_6 = Vector3.New(-390, -465, 300)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1012, var_140_6, var_140_5)
			end

			if arg_137_1.time_ >= var_140_1 + var_140_4 and arg_137_1.time_ < var_140_1 + var_140_4 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(-390, -465, 300)
			end

			local var_140_7 = arg_137_1.actors_["1012"]
			local var_140_8 = 0

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 and arg_137_1.var_.actorSpriteComps1012 == nil then
				arg_137_1.var_.actorSpriteComps1012 = var_140_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_9 = 0.034

			if var_140_8 <= arg_137_1.time_ and arg_137_1.time_ < var_140_8 + var_140_9 then
				local var_140_10 = (arg_137_1.time_ - var_140_8) / var_140_9

				if arg_137_1.var_.actorSpriteComps1012 then
					for iter_140_1, iter_140_2 in pairs(arg_137_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_140_2 then
							local var_140_11 = Mathf.Lerp(iter_140_2.color.r, 0.5, var_140_10)

							iter_140_2.color = Color.New(var_140_11, var_140_11, var_140_11)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_8 + var_140_9 and arg_137_1.time_ < var_140_8 + var_140_9 + arg_140_0 and arg_137_1.var_.actorSpriteComps1012 then
				local var_140_12 = 0.5

				for iter_140_3, iter_140_4 in pairs(arg_137_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_140_4 then
						iter_140_4.color = Color.New(var_140_12, var_140_12, var_140_12)
					end
				end

				arg_137_1.var_.actorSpriteComps1012 = nil
			end

			local var_140_13 = arg_137_1.actors_["10064"].transform
			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1.var_.moveOldPos10064 = var_140_13.localPosition
				var_140_13.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("10064", 4)

				local var_140_15 = var_140_13.childCount

				for iter_140_5 = 0, var_140_15 - 1 do
					local var_140_16 = var_140_13:GetChild(iter_140_5)

					if var_140_16.name == "" or not string.find(var_140_16.name, "split") then
						var_140_16.gameObject:SetActive(true)
					else
						var_140_16.gameObject:SetActive(false)
					end
				end
			end

			local var_140_17 = 0.001

			if var_140_14 <= arg_137_1.time_ and arg_137_1.time_ < var_140_14 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_14) / var_140_17
				local var_140_19 = Vector3.New(390, -570, 192.5)

				var_140_13.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10064, var_140_19, var_140_18)
			end

			if arg_137_1.time_ >= var_140_14 + var_140_17 and arg_137_1.time_ < var_140_14 + var_140_17 + arg_140_0 then
				var_140_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_140_20 = arg_137_1.actors_["10064"]
			local var_140_21 = 0

			if var_140_21 < arg_137_1.time_ and arg_137_1.time_ <= var_140_21 + arg_140_0 and arg_137_1.var_.actorSpriteComps10064 == nil then
				arg_137_1.var_.actorSpriteComps10064 = var_140_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_22 = 0.034

			if var_140_21 <= arg_137_1.time_ and arg_137_1.time_ < var_140_21 + var_140_22 then
				local var_140_23 = (arg_137_1.time_ - var_140_21) / var_140_22

				if arg_137_1.var_.actorSpriteComps10064 then
					for iter_140_6, iter_140_7 in pairs(arg_137_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_140_7 then
							local var_140_24 = Mathf.Lerp(iter_140_7.color.r, 1, var_140_23)

							iter_140_7.color = Color.New(var_140_24, var_140_24, var_140_24)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_21 + var_140_22 and arg_137_1.time_ < var_140_21 + var_140_22 + arg_140_0 and arg_137_1.var_.actorSpriteComps10064 then
				local var_140_25 = 1

				for iter_140_8, iter_140_9 in pairs(arg_137_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_140_9 then
						iter_140_9.color = Color.New(var_140_25, var_140_25, var_140_25)
					end
				end

				arg_137_1.var_.actorSpriteComps10064 = nil
			end

			local var_140_26 = 0
			local var_140_27 = 0.125

			if var_140_26 < arg_137_1.time_ and arg_137_1.time_ <= var_140_26 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_28 = arg_137_1:FormatText(StoryNameCfg[584].name)

				arg_137_1.leftNameTxt_.text = var_140_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_29 = arg_137_1:GetWordFromCfg(410101033)
				local var_140_30 = arg_137_1:FormatText(var_140_29.content)

				arg_137_1.text_.text = var_140_30

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_31 = 5
				local var_140_32 = utf8.len(var_140_30)
				local var_140_33 = var_140_31 <= 0 and var_140_27 or var_140_27 * (var_140_32 / var_140_31)

				if var_140_33 > 0 and var_140_27 < var_140_33 then
					arg_137_1.talkMaxDuration = var_140_33

					if var_140_33 + var_140_26 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_33 + var_140_26
					end
				end

				arg_137_1.text_.text = var_140_30
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101033", "story_v_out_410101.awb") ~= 0 then
					local var_140_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101033", "story_v_out_410101.awb") / 1000

					if var_140_34 + var_140_26 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_34 + var_140_26
					end

					if var_140_29.prefab_name ~= "" and arg_137_1.actors_[var_140_29.prefab_name] ~= nil then
						local var_140_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_29.prefab_name].transform, "story_v_out_410101", "410101033", "story_v_out_410101.awb")

						arg_137_1:RecordAudio("410101033", var_140_35)
						arg_137_1:RecordAudio("410101033", var_140_35)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_410101", "410101033", "story_v_out_410101.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_410101", "410101033", "story_v_out_410101.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_36 = math.max(var_140_27, arg_137_1.talkMaxDuration)

			if var_140_26 <= arg_137_1.time_ and arg_137_1.time_ < var_140_26 + var_140_36 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_26) / var_140_36

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_26 + var_140_36 and arg_137_1.time_ < var_140_26 + var_140_36 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play410101034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410101034
		arg_141_1.duration_ = 12.9

		local var_141_0 = {
			zh = 5.6,
			ja = 12.9
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
				arg_141_0:Play410101035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1012"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1012 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1012", 2)

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
				local var_144_6 = Vector3.New(-390, -465, 300)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1012, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(-390, -465, 300)
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

			local var_144_13 = arg_141_1.actors_["10064"].transform
			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1.var_.moveOldPos10064 = var_144_13.localPosition
				var_144_13.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10064", 4)

				local var_144_15 = var_144_13.childCount

				for iter_144_5 = 0, var_144_15 - 1 do
					local var_144_16 = var_144_13:GetChild(iter_144_5)

					if var_144_16.name == "" or not string.find(var_144_16.name, "split") then
						var_144_16.gameObject:SetActive(true)
					else
						var_144_16.gameObject:SetActive(false)
					end
				end
			end

			local var_144_17 = 0.001

			if var_144_14 <= arg_141_1.time_ and arg_141_1.time_ < var_144_14 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_14) / var_144_17
				local var_144_19 = Vector3.New(390, -570, 192.5)

				var_144_13.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10064, var_144_19, var_144_18)
			end

			if arg_141_1.time_ >= var_144_14 + var_144_17 and arg_141_1.time_ < var_144_14 + var_144_17 + arg_144_0 then
				var_144_13.localPosition = Vector3.New(390, -570, 192.5)
			end

			local var_144_20 = arg_141_1.actors_["10064"]
			local var_144_21 = 0

			if var_144_21 < arg_141_1.time_ and arg_141_1.time_ <= var_144_21 + arg_144_0 and arg_141_1.var_.actorSpriteComps10064 == nil then
				arg_141_1.var_.actorSpriteComps10064 = var_144_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_22 = 0.034

			if var_144_21 <= arg_141_1.time_ and arg_141_1.time_ < var_144_21 + var_144_22 then
				local var_144_23 = (arg_141_1.time_ - var_144_21) / var_144_22

				if arg_141_1.var_.actorSpriteComps10064 then
					for iter_144_6, iter_144_7 in pairs(arg_141_1.var_.actorSpriteComps10064:ToTable()) do
						if iter_144_7 then
							local var_144_24 = Mathf.Lerp(iter_144_7.color.r, 0.5, var_144_23)

							iter_144_7.color = Color.New(var_144_24, var_144_24, var_144_24)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_21 + var_144_22 and arg_141_1.time_ < var_144_21 + var_144_22 + arg_144_0 and arg_141_1.var_.actorSpriteComps10064 then
				local var_144_25 = 0.5

				for iter_144_8, iter_144_9 in pairs(arg_141_1.var_.actorSpriteComps10064:ToTable()) do
					if iter_144_9 then
						iter_144_9.color = Color.New(var_144_25, var_144_25, var_144_25)
					end
				end

				arg_141_1.var_.actorSpriteComps10064 = nil
			end

			local var_144_26 = 0
			local var_144_27 = 0.7

			if var_144_26 < arg_141_1.time_ and arg_141_1.time_ <= var_144_26 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_28 = arg_141_1:FormatText(StoryNameCfg[595].name)

				arg_141_1.leftNameTxt_.text = var_144_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_29 = arg_141_1:GetWordFromCfg(410101034)
				local var_144_30 = arg_141_1:FormatText(var_144_29.content)

				arg_141_1.text_.text = var_144_30

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_31 = 28
				local var_144_32 = utf8.len(var_144_30)
				local var_144_33 = var_144_31 <= 0 and var_144_27 or var_144_27 * (var_144_32 / var_144_31)

				if var_144_33 > 0 and var_144_27 < var_144_33 then
					arg_141_1.talkMaxDuration = var_144_33

					if var_144_33 + var_144_26 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_33 + var_144_26
					end
				end

				arg_141_1.text_.text = var_144_30
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101034", "story_v_out_410101.awb") ~= 0 then
					local var_144_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101034", "story_v_out_410101.awb") / 1000

					if var_144_34 + var_144_26 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_34 + var_144_26
					end

					if var_144_29.prefab_name ~= "" and arg_141_1.actors_[var_144_29.prefab_name] ~= nil then
						local var_144_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_29.prefab_name].transform, "story_v_out_410101", "410101034", "story_v_out_410101.awb")

						arg_141_1:RecordAudio("410101034", var_144_35)
						arg_141_1:RecordAudio("410101034", var_144_35)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_410101", "410101034", "story_v_out_410101.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_410101", "410101034", "story_v_out_410101.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_36 = math.max(var_144_27, arg_141_1.talkMaxDuration)

			if var_144_26 <= arg_141_1.time_ and arg_141_1.time_ < var_144_26 + var_144_36 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_26) / var_144_36

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_26 + var_144_36 and arg_141_1.time_ < var_144_26 + var_144_36 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410101035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410101035
		arg_145_1.duration_ = 12.666

		local var_145_0 = {
			zh = 9.2,
			ja = 12.666
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
				arg_145_0:Play410101036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.05

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[595].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(410101035)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 42
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101035", "story_v_out_410101.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101035", "story_v_out_410101.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_410101", "410101035", "story_v_out_410101.awb")

						arg_145_1:RecordAudio("410101035", var_148_9)
						arg_145_1:RecordAudio("410101035", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_410101", "410101035", "story_v_out_410101.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_410101", "410101035", "story_v_out_410101.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410101036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410101036
		arg_149_1.duration_ = 15.3

		local var_149_0 = {
			zh = 5.8,
			ja = 15.3
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
				arg_149_0:Play410101037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.8

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[595].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(410101036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101036", "story_v_out_410101.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101036", "story_v_out_410101.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_410101", "410101036", "story_v_out_410101.awb")

						arg_149_1:RecordAudio("410101036", var_152_9)
						arg_149_1:RecordAudio("410101036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_410101", "410101036", "story_v_out_410101.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_410101", "410101036", "story_v_out_410101.awb")
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
	Play410101037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410101037
		arg_153_1.duration_ = 18.866

		local var_153_0 = {
			zh = 10.833,
			ja = 18.866
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
				arg_153_0:Play410101038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1.15

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[595].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(410101037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101037", "story_v_out_410101.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101037", "story_v_out_410101.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_410101", "410101037", "story_v_out_410101.awb")

						arg_153_1:RecordAudio("410101037", var_156_9)
						arg_153_1:RecordAudio("410101037", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410101", "410101037", "story_v_out_410101.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410101", "410101037", "story_v_out_410101.awb")
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
	Play410101038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 410101038
		arg_157_1.duration_ = 15.3

		local var_157_0 = {
			zh = 6.766,
			ja = 15.3
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play410101039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.775

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[595].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(410101038)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 31
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101038", "story_v_out_410101.awb") ~= 0 then
					local var_160_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101038", "story_v_out_410101.awb") / 1000

					if var_160_8 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_0
					end

					if var_160_3.prefab_name ~= "" and arg_157_1.actors_[var_160_3.prefab_name] ~= nil then
						local var_160_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_3.prefab_name].transform, "story_v_out_410101", "410101038", "story_v_out_410101.awb")

						arg_157_1:RecordAudio("410101038", var_160_9)
						arg_157_1:RecordAudio("410101038", var_160_9)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_410101", "410101038", "story_v_out_410101.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_410101", "410101038", "story_v_out_410101.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_10 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_10 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_10

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_10 and arg_157_1.time_ < var_160_0 + var_160_10 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play410101039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410101039
		arg_161_1.duration_ = 9

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play410101040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = "L02g"

			if arg_161_1.bgs_[var_164_0] == nil then
				local var_164_1 = Object.Instantiate(arg_161_1.paintGo_)

				var_164_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_164_0)
				var_164_1.name = var_164_0
				var_164_1.transform.parent = arg_161_1.stage_.transform
				var_164_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_161_1.bgs_[var_164_0] = var_164_1
			end

			local var_164_2 = 2

			if var_164_2 < arg_161_1.time_ and arg_161_1.time_ <= var_164_2 + arg_164_0 then
				local var_164_3 = manager.ui.mainCamera.transform.localPosition
				local var_164_4 = Vector3.New(0, 0, 10) + Vector3.New(var_164_3.x, var_164_3.y, 0)
				local var_164_5 = arg_161_1.bgs_.L02g

				var_164_5.transform.localPosition = var_164_4
				var_164_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_164_6 = var_164_5:GetComponent("SpriteRenderer")

				if var_164_6 and var_164_6.sprite then
					local var_164_7 = (var_164_5.transform.localPosition - var_164_3).z
					local var_164_8 = manager.ui.mainCameraCom_
					local var_164_9 = 2 * var_164_7 * Mathf.Tan(var_164_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_164_10 = var_164_9 * var_164_8.aspect
					local var_164_11 = var_164_6.sprite.bounds.size.x
					local var_164_12 = var_164_6.sprite.bounds.size.y
					local var_164_13 = var_164_10 / var_164_11
					local var_164_14 = var_164_9 / var_164_12
					local var_164_15 = var_164_14 < var_164_13 and var_164_13 or var_164_14

					var_164_5.transform.localScale = Vector3.New(var_164_15, var_164_15, 0)
				end

				for iter_164_0, iter_164_1 in pairs(arg_161_1.bgs_) do
					if iter_164_0 ~= "L02g" then
						iter_164_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_164_16 = 0

			if var_164_16 < arg_161_1.time_ and arg_161_1.time_ <= var_164_16 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_17 = 2

			if var_164_16 <= arg_161_1.time_ and arg_161_1.time_ < var_164_16 + var_164_17 then
				local var_164_18 = (arg_161_1.time_ - var_164_16) / var_164_17
				local var_164_19 = Color.New(0, 0, 0)

				var_164_19.a = Mathf.Lerp(0, 1, var_164_18)
				arg_161_1.mask_.color = var_164_19
			end

			if arg_161_1.time_ >= var_164_16 + var_164_17 and arg_161_1.time_ < var_164_16 + var_164_17 + arg_164_0 then
				local var_164_20 = Color.New(0, 0, 0)

				var_164_20.a = 1
				arg_161_1.mask_.color = var_164_20
			end

			local var_164_21 = 2

			if var_164_21 < arg_161_1.time_ and arg_161_1.time_ <= var_164_21 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_22 = 2

			if var_164_21 <= arg_161_1.time_ and arg_161_1.time_ < var_164_21 + var_164_22 then
				local var_164_23 = (arg_161_1.time_ - var_164_21) / var_164_22
				local var_164_24 = Color.New(0, 0, 0)

				var_164_24.a = Mathf.Lerp(1, 0, var_164_23)
				arg_161_1.mask_.color = var_164_24
			end

			if arg_161_1.time_ >= var_164_21 + var_164_22 and arg_161_1.time_ < var_164_21 + var_164_22 + arg_164_0 then
				local var_164_25 = Color.New(0, 0, 0)
				local var_164_26 = 0

				arg_161_1.mask_.enabled = false
				var_164_25.a = var_164_26
				arg_161_1.mask_.color = var_164_25
			end

			local var_164_27 = arg_161_1.actors_["1012"].transform
			local var_164_28 = 2

			if var_164_28 < arg_161_1.time_ and arg_161_1.time_ <= var_164_28 + arg_164_0 then
				arg_161_1.var_.moveOldPos1012 = var_164_27.localPosition
				var_164_27.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1012", 7)

				local var_164_29 = var_164_27.childCount

				for iter_164_2 = 0, var_164_29 - 1 do
					local var_164_30 = var_164_27:GetChild(iter_164_2)

					if var_164_30.name == "" or not string.find(var_164_30.name, "split") then
						var_164_30.gameObject:SetActive(true)
					else
						var_164_30.gameObject:SetActive(false)
					end
				end
			end

			local var_164_31 = 0.001

			if var_164_28 <= arg_161_1.time_ and arg_161_1.time_ < var_164_28 + var_164_31 then
				local var_164_32 = (arg_161_1.time_ - var_164_28) / var_164_31
				local var_164_33 = Vector3.New(0, -2000, 300)

				var_164_27.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1012, var_164_33, var_164_32)
			end

			if arg_161_1.time_ >= var_164_28 + var_164_31 and arg_161_1.time_ < var_164_28 + var_164_31 + arg_164_0 then
				var_164_27.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_164_34 = arg_161_1.actors_["10064"].transform
			local var_164_35 = 2

			if var_164_35 < arg_161_1.time_ and arg_161_1.time_ <= var_164_35 + arg_164_0 then
				arg_161_1.var_.moveOldPos10064 = var_164_34.localPosition
				var_164_34.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("10064", 7)

				local var_164_36 = var_164_34.childCount

				for iter_164_3 = 0, var_164_36 - 1 do
					local var_164_37 = var_164_34:GetChild(iter_164_3)

					if var_164_37.name == "" or not string.find(var_164_37.name, "split") then
						var_164_37.gameObject:SetActive(true)
					else
						var_164_37.gameObject:SetActive(false)
					end
				end
			end

			local var_164_38 = 0.001

			if var_164_35 <= arg_161_1.time_ and arg_161_1.time_ < var_164_35 + var_164_38 then
				local var_164_39 = (arg_161_1.time_ - var_164_35) / var_164_38
				local var_164_40 = Vector3.New(0, -2000, 192.5)

				var_164_34.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10064, var_164_40, var_164_39)
			end

			if arg_161_1.time_ >= var_164_35 + var_164_38 and arg_161_1.time_ < var_164_35 + var_164_38 + arg_164_0 then
				var_164_34.localPosition = Vector3.New(0, -2000, 192.5)
			end

			local var_164_41 = 2

			if var_164_41 < arg_161_1.time_ and arg_161_1.time_ <= var_164_41 + arg_164_0 then
				arg_161_1.screenFilterGo_:SetActive(false)
			end

			local var_164_42 = 0.0339999999999998

			if var_164_41 <= arg_161_1.time_ and arg_161_1.time_ < var_164_41 + var_164_42 then
				local var_164_43 = (arg_161_1.time_ - var_164_41) / var_164_42

				arg_161_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_164_43)
			end

			if arg_161_1.time_ >= var_164_41 + var_164_42 and arg_161_1.time_ < var_164_41 + var_164_42 + arg_164_0 then
				arg_161_1.screenFilterEffect_.weight = 0
			end

			local var_164_44 = 0
			local var_164_45 = 0.133333333333333

			if var_164_44 < arg_161_1.time_ and arg_161_1.time_ <= var_164_44 + arg_164_0 then
				local var_164_46 = "play"
				local var_164_47 = "music"

				arg_161_1:AudioAction(var_164_46, var_164_47, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_164_48 = 0.3
			local var_164_49 = 1

			if var_164_48 < arg_161_1.time_ and arg_161_1.time_ <= var_164_48 + arg_164_0 then
				local var_164_50 = "play"
				local var_164_51 = "music"

				arg_161_1:AudioAction(var_164_50, var_164_51, "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum.awb")
			end

			if arg_161_1.frameCnt_ <= 1 then
				arg_161_1.dialog_:SetActive(false)
			end

			local var_164_52 = 4
			local var_164_53 = 1.25

			if var_164_52 < arg_161_1.time_ and arg_161_1.time_ <= var_164_52 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0

				arg_161_1.dialog_:SetActive(true)

				local var_164_54 = LeanTween.value(arg_161_1.dialog_, 0, 1, 0.3)

				var_164_54:setOnUpdate(LuaHelper.FloatAction(function(arg_165_0)
					arg_161_1.dialogCg_.alpha = arg_165_0
				end))
				var_164_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_161_1.dialog_)
					var_164_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_161_1.duration_ = arg_161_1.duration_ + 0.3

				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_55 = arg_161_1:GetWordFromCfg(410101039)
				local var_164_56 = arg_161_1:FormatText(var_164_55.content)

				arg_161_1.text_.text = var_164_56

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_57 = 50
				local var_164_58 = utf8.len(var_164_56)
				local var_164_59 = var_164_57 <= 0 and var_164_53 or var_164_53 * (var_164_58 / var_164_57)

				if var_164_59 > 0 and var_164_53 < var_164_59 then
					arg_161_1.talkMaxDuration = var_164_59
					var_164_52 = var_164_52 + 0.3

					if var_164_59 + var_164_52 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_59 + var_164_52
					end
				end

				arg_161_1.text_.text = var_164_56
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_60 = var_164_52 + 0.3
			local var_164_61 = math.max(var_164_53, arg_161_1.talkMaxDuration)

			if var_164_60 <= arg_161_1.time_ and arg_161_1.time_ < var_164_60 + var_164_61 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_60) / var_164_61

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_60 + var_164_61 and arg_161_1.time_ < var_164_60 + var_164_61 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play410101040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410101040
		arg_167_1.duration_ = 13.2

		local var_167_0 = {
			zh = 9,
			ja = 13.2
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
				arg_167_0:Play410101041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1060"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1060 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("1060", 3)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(0, -435, -40)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1060, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_170_7 = arg_167_1.actors_["1060"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1060 == nil then
				arg_167_1.var_.actorSpriteComps1060 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.034

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps1060 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 1, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps1060 then
				local var_170_12 = 1

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps1060 = nil
			end

			local var_170_13 = 0
			local var_170_14 = 1.05

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_15 = arg_167_1:FormatText(StoryNameCfg[584].name)

				arg_167_1.leftNameTxt_.text = var_170_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_16 = arg_167_1:GetWordFromCfg(410101040)
				local var_170_17 = arg_167_1:FormatText(var_170_16.content)

				arg_167_1.text_.text = var_170_17

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_18 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101040", "story_v_out_410101.awb") ~= 0 then
					local var_170_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101040", "story_v_out_410101.awb") / 1000

					if var_170_21 + var_170_13 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_21 + var_170_13
					end

					if var_170_16.prefab_name ~= "" and arg_167_1.actors_[var_170_16.prefab_name] ~= nil then
						local var_170_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_16.prefab_name].transform, "story_v_out_410101", "410101040", "story_v_out_410101.awb")

						arg_167_1:RecordAudio("410101040", var_170_22)
						arg_167_1:RecordAudio("410101040", var_170_22)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410101", "410101040", "story_v_out_410101.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410101", "410101040", "story_v_out_410101.awb")
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
	Play410101041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410101041
		arg_171_1.duration_ = 16.766

		local var_171_0 = {
			zh = 13.533,
			ja = 16.766
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
				arg_171_0:Play410101042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.6

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[584].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(410101041)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 64
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101041", "story_v_out_410101.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101041", "story_v_out_410101.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_410101", "410101041", "story_v_out_410101.awb")

						arg_171_1:RecordAudio("410101041", var_174_9)
						arg_171_1:RecordAudio("410101041", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410101", "410101041", "story_v_out_410101.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410101", "410101041", "story_v_out_410101.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410101042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410101042
		arg_175_1.duration_ = 14.133

		local var_175_0 = {
			zh = 6.133,
			ja = 14.133
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
				arg_175_0:Play410101043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.725

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[584].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(410101042)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 29
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101042", "story_v_out_410101.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101042", "story_v_out_410101.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_410101", "410101042", "story_v_out_410101.awb")

						arg_175_1:RecordAudio("410101042", var_178_9)
						arg_175_1:RecordAudio("410101042", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410101", "410101042", "story_v_out_410101.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410101", "410101042", "story_v_out_410101.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410101043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410101043
		arg_179_1.duration_ = 18.066

		local var_179_0 = {
			zh = 10.7,
			ja = 18.066
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
				arg_179_0:Play410101044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.125

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[584].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(410101043)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 45
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101043", "story_v_out_410101.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101043", "story_v_out_410101.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_410101", "410101043", "story_v_out_410101.awb")

						arg_179_1:RecordAudio("410101043", var_182_9)
						arg_179_1:RecordAudio("410101043", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410101", "410101043", "story_v_out_410101.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410101", "410101043", "story_v_out_410101.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play410101044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410101044
		arg_183_1.duration_ = 13.4

		local var_183_0 = {
			zh = 7.5,
			ja = 13.4
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
				arg_183_0:Play410101045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.75

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[584].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(410101044)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101044", "story_v_out_410101.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101044", "story_v_out_410101.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_410101", "410101044", "story_v_out_410101.awb")

						arg_183_1:RecordAudio("410101044", var_186_9)
						arg_183_1:RecordAudio("410101044", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410101", "410101044", "story_v_out_410101.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410101", "410101044", "story_v_out_410101.awb")
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
	Play410101045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410101045
		arg_187_1.duration_ = 14.333

		local var_187_0 = {
			zh = 7.766,
			ja = 14.333
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
				arg_187_0:Play410101046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.75

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[584].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(410101045)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 30
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101045", "story_v_out_410101.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101045", "story_v_out_410101.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_410101", "410101045", "story_v_out_410101.awb")

						arg_187_1:RecordAudio("410101045", var_190_9)
						arg_187_1:RecordAudio("410101045", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410101", "410101045", "story_v_out_410101.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410101", "410101045", "story_v_out_410101.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410101046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410101046
		arg_191_1.duration_ = 4.833

		local var_191_0 = {
			zh = 2.466,
			ja = 4.833
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
				arg_191_0:Play410101047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1060"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1060 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1060", 2)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(-390, -435, -40)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1060, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_194_7 = arg_191_1.actors_["1012"].transform
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 then
				arg_191_1.var_.moveOldPos1012 = var_194_7.localPosition
				var_194_7.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1012", 4)

				local var_194_9 = var_194_7.childCount

				for iter_194_1 = 0, var_194_9 - 1 do
					local var_194_10 = var_194_7:GetChild(iter_194_1)

					if var_194_10.name == "" or not string.find(var_194_10.name, "split") then
						var_194_10.gameObject:SetActive(true)
					else
						var_194_10.gameObject:SetActive(false)
					end
				end
			end

			local var_194_11 = 0.001

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_8) / var_194_11
				local var_194_13 = Vector3.New(390, -465, 300)

				var_194_7.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1012, var_194_13, var_194_12)
			end

			if arg_191_1.time_ >= var_194_8 + var_194_11 and arg_191_1.time_ < var_194_8 + var_194_11 + arg_194_0 then
				var_194_7.localPosition = Vector3.New(390, -465, 300)
			end

			local var_194_14 = arg_191_1.actors_["1060"]
			local var_194_15 = 0

			if var_194_15 < arg_191_1.time_ and arg_191_1.time_ <= var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps1060 == nil then
				arg_191_1.var_.actorSpriteComps1060 = var_194_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_16 = 0.034

			if var_194_15 <= arg_191_1.time_ and arg_191_1.time_ < var_194_15 + var_194_16 then
				local var_194_17 = (arg_191_1.time_ - var_194_15) / var_194_16

				if arg_191_1.var_.actorSpriteComps1060 then
					for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_194_3 then
							local var_194_18 = Mathf.Lerp(iter_194_3.color.r, 0.5, var_194_17)

							iter_194_3.color = Color.New(var_194_18, var_194_18, var_194_18)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_15 + var_194_16 and arg_191_1.time_ < var_194_15 + var_194_16 + arg_194_0 and arg_191_1.var_.actorSpriteComps1060 then
				local var_194_19 = 0.5

				for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_194_5 then
						iter_194_5.color = Color.New(var_194_19, var_194_19, var_194_19)
					end
				end

				arg_191_1.var_.actorSpriteComps1060 = nil
			end

			local var_194_20 = arg_191_1.actors_["1012"]
			local var_194_21 = 0

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 and arg_191_1.var_.actorSpriteComps1012 == nil then
				arg_191_1.var_.actorSpriteComps1012 = var_194_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_22 = 0.034

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_21) / var_194_22

				if arg_191_1.var_.actorSpriteComps1012 then
					for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_194_7 then
							local var_194_24 = Mathf.Lerp(iter_194_7.color.r, 1, var_194_23)

							iter_194_7.color = Color.New(var_194_24, var_194_24, var_194_24)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_21 + var_194_22 and arg_191_1.time_ < var_194_21 + var_194_22 + arg_194_0 and arg_191_1.var_.actorSpriteComps1012 then
				local var_194_25 = 1

				for iter_194_8, iter_194_9 in pairs(arg_191_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_194_9 then
						iter_194_9.color = Color.New(var_194_25, var_194_25, var_194_25)
					end
				end

				arg_191_1.var_.actorSpriteComps1012 = nil
			end

			local var_194_26 = 0
			local var_194_27 = 0.175

			if var_194_26 < arg_191_1.time_ and arg_191_1.time_ <= var_194_26 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_28 = arg_191_1:FormatText(StoryNameCfg[595].name)

				arg_191_1.leftNameTxt_.text = var_194_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_29 = arg_191_1:GetWordFromCfg(410101046)
				local var_194_30 = arg_191_1:FormatText(var_194_29.content)

				arg_191_1.text_.text = var_194_30

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_31 = 7
				local var_194_32 = utf8.len(var_194_30)
				local var_194_33 = var_194_31 <= 0 and var_194_27 or var_194_27 * (var_194_32 / var_194_31)

				if var_194_33 > 0 and var_194_27 < var_194_33 then
					arg_191_1.talkMaxDuration = var_194_33

					if var_194_33 + var_194_26 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_33 + var_194_26
					end
				end

				arg_191_1.text_.text = var_194_30
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101046", "story_v_out_410101.awb") ~= 0 then
					local var_194_34 = manager.audio:GetVoiceLength("story_v_out_410101", "410101046", "story_v_out_410101.awb") / 1000

					if var_194_34 + var_194_26 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_34 + var_194_26
					end

					if var_194_29.prefab_name ~= "" and arg_191_1.actors_[var_194_29.prefab_name] ~= nil then
						local var_194_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_29.prefab_name].transform, "story_v_out_410101", "410101046", "story_v_out_410101.awb")

						arg_191_1:RecordAudio("410101046", var_194_35)
						arg_191_1:RecordAudio("410101046", var_194_35)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410101", "410101046", "story_v_out_410101.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410101", "410101046", "story_v_out_410101.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_36 = math.max(var_194_27, arg_191_1.talkMaxDuration)

			if var_194_26 <= arg_191_1.time_ and arg_191_1.time_ < var_194_26 + var_194_36 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_26) / var_194_36

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_26 + var_194_36 and arg_191_1.time_ < var_194_26 + var_194_36 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410101047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410101047
		arg_195_1.duration_ = 10.633

		local var_195_0 = {
			zh = 3.233,
			ja = 10.633
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
				arg_195_0:Play410101048(arg_195_1)
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

			local var_198_13 = arg_195_1.actors_["1012"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps1012 == nil then
				arg_195_1.var_.actorSpriteComps1012 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.034

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps1012 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 0.5, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps1012 then
				local var_198_18 = 0.5

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps1012 = nil
			end

			local var_198_19 = 0
			local var_198_20 = 0.425

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

				local var_198_22 = arg_195_1:GetWordFromCfg(410101047)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101047", "story_v_out_410101.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101047", "story_v_out_410101.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_410101", "410101047", "story_v_out_410101.awb")

						arg_195_1:RecordAudio("410101047", var_198_28)
						arg_195_1:RecordAudio("410101047", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410101", "410101047", "story_v_out_410101.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410101", "410101047", "story_v_out_410101.awb")
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
	Play410101048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410101048
		arg_199_1.duration_ = 9.3

		local var_199_0 = {
			zh = 4.4,
			ja = 9.3
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
				arg_199_0:Play410101049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1012"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1012 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1012", 4)

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
				local var_202_6 = Vector3.New(390, -465, 300)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1012, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_202_7 = arg_199_1.actors_["1012"]
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1012 == nil then
				arg_199_1.var_.actorSpriteComps1012 = var_202_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_9 = 0.034

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9

				if arg_199_1.var_.actorSpriteComps1012 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_202_2 then
							local var_202_11 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_10)

							iter_202_2.color = Color.New(var_202_11, var_202_11, var_202_11)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps1012 then
				local var_202_12 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_12, var_202_12, var_202_12)
					end
				end

				arg_199_1.var_.actorSpriteComps1012 = nil
			end

			local var_202_13 = arg_199_1.actors_["1060"]
			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 and arg_199_1.var_.actorSpriteComps1060 == nil then
				arg_199_1.var_.actorSpriteComps1060 = var_202_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_15 = 0.034

			if var_202_14 <= arg_199_1.time_ and arg_199_1.time_ < var_202_14 + var_202_15 then
				local var_202_16 = (arg_199_1.time_ - var_202_14) / var_202_15

				if arg_199_1.var_.actorSpriteComps1060 then
					for iter_202_5, iter_202_6 in pairs(arg_199_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_202_6 then
							local var_202_17 = Mathf.Lerp(iter_202_6.color.r, 0.5, var_202_16)

							iter_202_6.color = Color.New(var_202_17, var_202_17, var_202_17)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_14 + var_202_15 and arg_199_1.time_ < var_202_14 + var_202_15 + arg_202_0 and arg_199_1.var_.actorSpriteComps1060 then
				local var_202_18 = 0.5

				for iter_202_7, iter_202_8 in pairs(arg_199_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_202_8 then
						iter_202_8.color = Color.New(var_202_18, var_202_18, var_202_18)
					end
				end

				arg_199_1.var_.actorSpriteComps1060 = nil
			end

			local var_202_19 = 0
			local var_202_20 = 0.5

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_21 = arg_199_1:FormatText(StoryNameCfg[595].name)

				arg_199_1.leftNameTxt_.text = var_202_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_22 = arg_199_1:GetWordFromCfg(410101048)
				local var_202_23 = arg_199_1:FormatText(var_202_22.content)

				arg_199_1.text_.text = var_202_23

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_24 = 20
				local var_202_25 = utf8.len(var_202_23)
				local var_202_26 = var_202_24 <= 0 and var_202_20 or var_202_20 * (var_202_25 / var_202_24)

				if var_202_26 > 0 and var_202_20 < var_202_26 then
					arg_199_1.talkMaxDuration = var_202_26

					if var_202_26 + var_202_19 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_26 + var_202_19
					end
				end

				arg_199_1.text_.text = var_202_23
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101048", "story_v_out_410101.awb") ~= 0 then
					local var_202_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101048", "story_v_out_410101.awb") / 1000

					if var_202_27 + var_202_19 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_27 + var_202_19
					end

					if var_202_22.prefab_name ~= "" and arg_199_1.actors_[var_202_22.prefab_name] ~= nil then
						local var_202_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_22.prefab_name].transform, "story_v_out_410101", "410101048", "story_v_out_410101.awb")

						arg_199_1:RecordAudio("410101048", var_202_28)
						arg_199_1:RecordAudio("410101048", var_202_28)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410101", "410101048", "story_v_out_410101.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410101", "410101048", "story_v_out_410101.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_29 = math.max(var_202_20, arg_199_1.talkMaxDuration)

			if var_202_19 <= arg_199_1.time_ and arg_199_1.time_ < var_202_19 + var_202_29 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_19) / var_202_29

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_19 + var_202_29 and arg_199_1.time_ < var_202_19 + var_202_29 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play410101049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410101049
		arg_203_1.duration_ = 13.933

		local var_203_0 = {
			zh = 5.7,
			ja = 13.933
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
				arg_203_0:Play410101050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.7

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[595].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(410101049)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101049", "story_v_out_410101.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101049", "story_v_out_410101.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_410101", "410101049", "story_v_out_410101.awb")

						arg_203_1:RecordAudio("410101049", var_206_9)
						arg_203_1:RecordAudio("410101049", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410101", "410101049", "story_v_out_410101.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410101", "410101049", "story_v_out_410101.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410101050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410101050
		arg_207_1.duration_ = 2.033

		local var_207_0 = {
			zh = 2.033,
			ja = 1.833
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
				arg_207_0:Play410101051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1060"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1060 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1060", 2)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(-390, -435, -40)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1060, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_210_7 = arg_207_1.actors_["1060"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps1060 == nil then
				arg_207_1.var_.actorSpriteComps1060 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.034

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps1060 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 1, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps1060 then
				local var_210_12 = 1

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps1060 = nil
			end

			local var_210_13 = arg_207_1.actors_["1012"]
			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 and arg_207_1.var_.actorSpriteComps1012 == nil then
				arg_207_1.var_.actorSpriteComps1012 = var_210_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_15 = 0.034

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_15 then
				local var_210_16 = (arg_207_1.time_ - var_210_14) / var_210_15

				if arg_207_1.var_.actorSpriteComps1012 then
					for iter_210_5, iter_210_6 in pairs(arg_207_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_210_6 then
							local var_210_17 = Mathf.Lerp(iter_210_6.color.r, 0.5, var_210_16)

							iter_210_6.color = Color.New(var_210_17, var_210_17, var_210_17)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_14 + var_210_15 and arg_207_1.time_ < var_210_14 + var_210_15 + arg_210_0 and arg_207_1.var_.actorSpriteComps1012 then
				local var_210_18 = 0.5

				for iter_210_7, iter_210_8 in pairs(arg_207_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_210_8 then
						iter_210_8.color = Color.New(var_210_18, var_210_18, var_210_18)
					end
				end

				arg_207_1.var_.actorSpriteComps1012 = nil
			end

			local var_210_19 = 0
			local var_210_20 = 0.2

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_21 = arg_207_1:FormatText(StoryNameCfg[584].name)

				arg_207_1.leftNameTxt_.text = var_210_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_22 = arg_207_1:GetWordFromCfg(410101050)
				local var_210_23 = arg_207_1:FormatText(var_210_22.content)

				arg_207_1.text_.text = var_210_23

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_24 = 8
				local var_210_25 = utf8.len(var_210_23)
				local var_210_26 = var_210_24 <= 0 and var_210_20 or var_210_20 * (var_210_25 / var_210_24)

				if var_210_26 > 0 and var_210_20 < var_210_26 then
					arg_207_1.talkMaxDuration = var_210_26

					if var_210_26 + var_210_19 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_26 + var_210_19
					end
				end

				arg_207_1.text_.text = var_210_23
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101050", "story_v_out_410101.awb") ~= 0 then
					local var_210_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101050", "story_v_out_410101.awb") / 1000

					if var_210_27 + var_210_19 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_27 + var_210_19
					end

					if var_210_22.prefab_name ~= "" and arg_207_1.actors_[var_210_22.prefab_name] ~= nil then
						local var_210_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_22.prefab_name].transform, "story_v_out_410101", "410101050", "story_v_out_410101.awb")

						arg_207_1:RecordAudio("410101050", var_210_28)
						arg_207_1:RecordAudio("410101050", var_210_28)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_410101", "410101050", "story_v_out_410101.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_410101", "410101050", "story_v_out_410101.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_29 = math.max(var_210_20, arg_207_1.talkMaxDuration)

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_29 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_19) / var_210_29

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_19 + var_210_29 and arg_207_1.time_ < var_210_19 + var_210_29 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410101051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410101051
		arg_211_1.duration_ = 15.5

		local var_211_0 = {
			zh = 10.9,
			ja = 15.5
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
				arg_211_0:Play410101052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1012"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1012 = var_214_0.localPosition
				var_214_0.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("1012", 4)

				local var_214_2 = var_214_0.childCount

				for iter_214_0 = 0, var_214_2 - 1 do
					local var_214_3 = var_214_0:GetChild(iter_214_0)

					if var_214_3.name == "" or not string.find(var_214_3.name, "split") then
						var_214_3.gameObject:SetActive(true)
					else
						var_214_3.gameObject:SetActive(false)
					end
				end
			end

			local var_214_4 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_4 then
				local var_214_5 = (arg_211_1.time_ - var_214_1) / var_214_4
				local var_214_6 = Vector3.New(390, -465, 300)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1012, var_214_6, var_214_5)
			end

			if arg_211_1.time_ >= var_214_1 + var_214_4 and arg_211_1.time_ < var_214_1 + var_214_4 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_214_7 = arg_211_1.actors_["1012"]
			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 and arg_211_1.var_.actorSpriteComps1012 == nil then
				arg_211_1.var_.actorSpriteComps1012 = var_214_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_9 = 0.034

			if var_214_8 <= arg_211_1.time_ and arg_211_1.time_ < var_214_8 + var_214_9 then
				local var_214_10 = (arg_211_1.time_ - var_214_8) / var_214_9

				if arg_211_1.var_.actorSpriteComps1012 then
					for iter_214_1, iter_214_2 in pairs(arg_211_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_214_2 then
							local var_214_11 = Mathf.Lerp(iter_214_2.color.r, 1, var_214_10)

							iter_214_2.color = Color.New(var_214_11, var_214_11, var_214_11)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_8 + var_214_9 and arg_211_1.time_ < var_214_8 + var_214_9 + arg_214_0 and arg_211_1.var_.actorSpriteComps1012 then
				local var_214_12 = 1

				for iter_214_3, iter_214_4 in pairs(arg_211_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_214_4 then
						iter_214_4.color = Color.New(var_214_12, var_214_12, var_214_12)
					end
				end

				arg_211_1.var_.actorSpriteComps1012 = nil
			end

			local var_214_13 = arg_211_1.actors_["1060"]
			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 and arg_211_1.var_.actorSpriteComps1060 == nil then
				arg_211_1.var_.actorSpriteComps1060 = var_214_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_15 = 0.034

			if var_214_14 <= arg_211_1.time_ and arg_211_1.time_ < var_214_14 + var_214_15 then
				local var_214_16 = (arg_211_1.time_ - var_214_14) / var_214_15

				if arg_211_1.var_.actorSpriteComps1060 then
					for iter_214_5, iter_214_6 in pairs(arg_211_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_214_6 then
							local var_214_17 = Mathf.Lerp(iter_214_6.color.r, 0.5, var_214_16)

							iter_214_6.color = Color.New(var_214_17, var_214_17, var_214_17)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_14 + var_214_15 and arg_211_1.time_ < var_214_14 + var_214_15 + arg_214_0 and arg_211_1.var_.actorSpriteComps1060 then
				local var_214_18 = 0.5

				for iter_214_7, iter_214_8 in pairs(arg_211_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_214_8 then
						iter_214_8.color = Color.New(var_214_18, var_214_18, var_214_18)
					end
				end

				arg_211_1.var_.actorSpriteComps1060 = nil
			end

			local var_214_19 = 0
			local var_214_20 = 1.15

			if var_214_19 < arg_211_1.time_ and arg_211_1.time_ <= var_214_19 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_21 = arg_211_1:FormatText(StoryNameCfg[595].name)

				arg_211_1.leftNameTxt_.text = var_214_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_22 = arg_211_1:GetWordFromCfg(410101051)
				local var_214_23 = arg_211_1:FormatText(var_214_22.content)

				arg_211_1.text_.text = var_214_23

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_24 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101051", "story_v_out_410101.awb") ~= 0 then
					local var_214_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101051", "story_v_out_410101.awb") / 1000

					if var_214_27 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_27 + var_214_19
					end

					if var_214_22.prefab_name ~= "" and arg_211_1.actors_[var_214_22.prefab_name] ~= nil then
						local var_214_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_22.prefab_name].transform, "story_v_out_410101", "410101051", "story_v_out_410101.awb")

						arg_211_1:RecordAudio("410101051", var_214_28)
						arg_211_1:RecordAudio("410101051", var_214_28)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_410101", "410101051", "story_v_out_410101.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_410101", "410101051", "story_v_out_410101.awb")
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
	Play410101052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410101052
		arg_215_1.duration_ = 4.6

		local var_215_0 = {
			zh = 4.366,
			ja = 4.6
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
				arg_215_0:Play410101053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.3

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[595].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(410101052)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 12
				local var_218_6 = utf8.len(var_218_4)
				local var_218_7 = var_218_5 <= 0 and var_218_1 or var_218_1 * (var_218_6 / var_218_5)

				if var_218_7 > 0 and var_218_1 < var_218_7 then
					arg_215_1.talkMaxDuration = var_218_7

					if var_218_7 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_7 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_4
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101052", "story_v_out_410101.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101052", "story_v_out_410101.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_410101", "410101052", "story_v_out_410101.awb")

						arg_215_1:RecordAudio("410101052", var_218_9)
						arg_215_1:RecordAudio("410101052", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_410101", "410101052", "story_v_out_410101.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_410101", "410101052", "story_v_out_410101.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_10 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_10 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_10

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_10 and arg_215_1.time_ < var_218_0 + var_218_10 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410101053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410101053
		arg_219_1.duration_ = 5.533

		local var_219_0 = {
			zh = 1.9,
			ja = 5.533
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
				arg_219_0:Play410101054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1060"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1060 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1060", 2)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "" or not string.find(var_222_3.name, "split") then
						var_222_3.gameObject:SetActive(true)
					else
						var_222_3.gameObject:SetActive(false)
					end
				end
			end

			local var_222_4 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_1) / var_222_4
				local var_222_6 = Vector3.New(-390, -435, -40)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1060, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_222_7 = arg_219_1.actors_["1060"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps1060 == nil then
				arg_219_1.var_.actorSpriteComps1060 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps1060 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 1, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps1060 then
				local var_222_12 = 1

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps1060 = nil
			end

			local var_222_13 = arg_219_1.actors_["1012"]
			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 and arg_219_1.var_.actorSpriteComps1012 == nil then
				arg_219_1.var_.actorSpriteComps1012 = var_222_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_15 = 0.034

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15

				if arg_219_1.var_.actorSpriteComps1012 then
					for iter_222_5, iter_222_6 in pairs(arg_219_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_222_6 then
							local var_222_17 = Mathf.Lerp(iter_222_6.color.r, 0.5, var_222_16)

							iter_222_6.color = Color.New(var_222_17, var_222_17, var_222_17)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 and arg_219_1.var_.actorSpriteComps1012 then
				local var_222_18 = 0.5

				for iter_222_7, iter_222_8 in pairs(arg_219_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_222_8 then
						iter_222_8.color = Color.New(var_222_18, var_222_18, var_222_18)
					end
				end

				arg_219_1.var_.actorSpriteComps1012 = nil
			end

			local var_222_19 = 0
			local var_222_20 = 0.125

			if var_222_19 < arg_219_1.time_ and arg_219_1.time_ <= var_222_19 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_21 = arg_219_1:FormatText(StoryNameCfg[584].name)

				arg_219_1.leftNameTxt_.text = var_222_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_22 = arg_219_1:GetWordFromCfg(410101053)
				local var_222_23 = arg_219_1:FormatText(var_222_22.content)

				arg_219_1.text_.text = var_222_23

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_24 = 5
				local var_222_25 = utf8.len(var_222_23)
				local var_222_26 = var_222_24 <= 0 and var_222_20 or var_222_20 * (var_222_25 / var_222_24)

				if var_222_26 > 0 and var_222_20 < var_222_26 then
					arg_219_1.talkMaxDuration = var_222_26

					if var_222_26 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_26 + var_222_19
					end
				end

				arg_219_1.text_.text = var_222_23
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101053", "story_v_out_410101.awb") ~= 0 then
					local var_222_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101053", "story_v_out_410101.awb") / 1000

					if var_222_27 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_27 + var_222_19
					end

					if var_222_22.prefab_name ~= "" and arg_219_1.actors_[var_222_22.prefab_name] ~= nil then
						local var_222_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_22.prefab_name].transform, "story_v_out_410101", "410101053", "story_v_out_410101.awb")

						arg_219_1:RecordAudio("410101053", var_222_28)
						arg_219_1:RecordAudio("410101053", var_222_28)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410101", "410101053", "story_v_out_410101.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410101", "410101053", "story_v_out_410101.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_29 = math.max(var_222_20, arg_219_1.talkMaxDuration)

			if var_222_19 <= arg_219_1.time_ and arg_219_1.time_ < var_222_19 + var_222_29 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_19) / var_222_29

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_19 + var_222_29 and arg_219_1.time_ < var_222_19 + var_222_29 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play410101054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410101054
		arg_223_1.duration_ = 8.366

		local var_223_0 = {
			zh = 1.3,
			ja = 8.366
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
				arg_223_0:Play410101055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1012"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1012 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("1012", 4)

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
				local var_226_6 = Vector3.New(390, -465, 300)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1012, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_226_7 = arg_223_1.actors_["1012"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps1012 == nil then
				arg_223_1.var_.actorSpriteComps1012 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.034

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps1012 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 1, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps1012 then
				local var_226_12 = 1

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps1012 = nil
			end

			local var_226_13 = arg_223_1.actors_["1060"]
			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 and arg_223_1.var_.actorSpriteComps1060 == nil then
				arg_223_1.var_.actorSpriteComps1060 = var_226_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_15 = 0.034

			if var_226_14 <= arg_223_1.time_ and arg_223_1.time_ < var_226_14 + var_226_15 then
				local var_226_16 = (arg_223_1.time_ - var_226_14) / var_226_15

				if arg_223_1.var_.actorSpriteComps1060 then
					for iter_226_5, iter_226_6 in pairs(arg_223_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_226_6 then
							local var_226_17 = Mathf.Lerp(iter_226_6.color.r, 0.5, var_226_16)

							iter_226_6.color = Color.New(var_226_17, var_226_17, var_226_17)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_14 + var_226_15 and arg_223_1.time_ < var_226_14 + var_226_15 + arg_226_0 and arg_223_1.var_.actorSpriteComps1060 then
				local var_226_18 = 0.5

				for iter_226_7, iter_226_8 in pairs(arg_223_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_226_8 then
						iter_226_8.color = Color.New(var_226_18, var_226_18, var_226_18)
					end
				end

				arg_223_1.var_.actorSpriteComps1060 = nil
			end

			local var_226_19 = 0
			local var_226_20 = 0.1

			if var_226_19 < arg_223_1.time_ and arg_223_1.time_ <= var_226_19 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_21 = arg_223_1:FormatText(StoryNameCfg[595].name)

				arg_223_1.leftNameTxt_.text = var_226_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_22 = arg_223_1:GetWordFromCfg(410101054)
				local var_226_23 = arg_223_1:FormatText(var_226_22.content)

				arg_223_1.text_.text = var_226_23

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_24 = 4
				local var_226_25 = utf8.len(var_226_23)
				local var_226_26 = var_226_24 <= 0 and var_226_20 or var_226_20 * (var_226_25 / var_226_24)

				if var_226_26 > 0 and var_226_20 < var_226_26 then
					arg_223_1.talkMaxDuration = var_226_26

					if var_226_26 + var_226_19 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_26 + var_226_19
					end
				end

				arg_223_1.text_.text = var_226_23
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101054", "story_v_out_410101.awb") ~= 0 then
					local var_226_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101054", "story_v_out_410101.awb") / 1000

					if var_226_27 + var_226_19 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_27 + var_226_19
					end

					if var_226_22.prefab_name ~= "" and arg_223_1.actors_[var_226_22.prefab_name] ~= nil then
						local var_226_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_22.prefab_name].transform, "story_v_out_410101", "410101054", "story_v_out_410101.awb")

						arg_223_1:RecordAudio("410101054", var_226_28)
						arg_223_1:RecordAudio("410101054", var_226_28)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_410101", "410101054", "story_v_out_410101.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_410101", "410101054", "story_v_out_410101.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_29 = math.max(var_226_20, arg_223_1.talkMaxDuration)

			if var_226_19 <= arg_223_1.time_ and arg_223_1.time_ < var_226_19 + var_226_29 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_19) / var_226_29

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_19 + var_226_29 and arg_223_1.time_ < var_226_19 + var_226_29 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play410101055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410101055
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play410101056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1012"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.actorSpriteComps1012 == nil then
				arg_227_1.var_.actorSpriteComps1012 = var_230_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_2 = 0.034

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.actorSpriteComps1012 then
					for iter_230_0, iter_230_1 in pairs(arg_227_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_230_1 then
							local var_230_4 = Mathf.Lerp(iter_230_1.color.r, 0.5, var_230_3)

							iter_230_1.color = Color.New(var_230_4, var_230_4, var_230_4)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.actorSpriteComps1012 then
				local var_230_5 = 0.5

				for iter_230_2, iter_230_3 in pairs(arg_227_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_230_3 then
						iter_230_3.color = Color.New(var_230_5, var_230_5, var_230_5)
					end
				end

				arg_227_1.var_.actorSpriteComps1012 = nil
			end

			local var_230_6 = 0
			local var_230_7 = 0.725

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

				local var_230_8 = arg_227_1:GetWordFromCfg(410101055)
				local var_230_9 = arg_227_1:FormatText(var_230_8.content)

				arg_227_1.text_.text = var_230_9

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_10 = 29
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
	Play410101056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410101056
		arg_231_1.duration_ = 5.633

		local var_231_0 = {
			zh = 2.833,
			ja = 5.633
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
				arg_231_0:Play410101057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1012"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1012 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1012", 4)

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
				local var_234_6 = Vector3.New(390, -465, 300)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1012, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_234_7 = arg_231_1.actors_["1012"]
			local var_234_8 = 0

			if var_234_8 < arg_231_1.time_ and arg_231_1.time_ <= var_234_8 + arg_234_0 and arg_231_1.var_.actorSpriteComps1012 == nil then
				arg_231_1.var_.actorSpriteComps1012 = var_234_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_9 = 0.034

			if var_234_8 <= arg_231_1.time_ and arg_231_1.time_ < var_234_8 + var_234_9 then
				local var_234_10 = (arg_231_1.time_ - var_234_8) / var_234_9

				if arg_231_1.var_.actorSpriteComps1012 then
					for iter_234_1, iter_234_2 in pairs(arg_231_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_234_2 then
							local var_234_11 = Mathf.Lerp(iter_234_2.color.r, 1, var_234_10)

							iter_234_2.color = Color.New(var_234_11, var_234_11, var_234_11)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_8 + var_234_9 and arg_231_1.time_ < var_234_8 + var_234_9 + arg_234_0 and arg_231_1.var_.actorSpriteComps1012 then
				local var_234_12 = 1

				for iter_234_3, iter_234_4 in pairs(arg_231_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_234_4 then
						iter_234_4.color = Color.New(var_234_12, var_234_12, var_234_12)
					end
				end

				arg_231_1.var_.actorSpriteComps1012 = nil
			end

			local var_234_13 = 0
			local var_234_14 = 0.375

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_15 = arg_231_1:FormatText(StoryNameCfg[595].name)

				arg_231_1.leftNameTxt_.text = var_234_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_16 = arg_231_1:GetWordFromCfg(410101056)
				local var_234_17 = arg_231_1:FormatText(var_234_16.content)

				arg_231_1.text_.text = var_234_17

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_18 = 15
				local var_234_19 = utf8.len(var_234_17)
				local var_234_20 = var_234_18 <= 0 and var_234_14 or var_234_14 * (var_234_19 / var_234_18)

				if var_234_20 > 0 and var_234_14 < var_234_20 then
					arg_231_1.talkMaxDuration = var_234_20

					if var_234_20 + var_234_13 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_13
					end
				end

				arg_231_1.text_.text = var_234_17
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101056", "story_v_out_410101.awb") ~= 0 then
					local var_234_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101056", "story_v_out_410101.awb") / 1000

					if var_234_21 + var_234_13 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_21 + var_234_13
					end

					if var_234_16.prefab_name ~= "" and arg_231_1.actors_[var_234_16.prefab_name] ~= nil then
						local var_234_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_16.prefab_name].transform, "story_v_out_410101", "410101056", "story_v_out_410101.awb")

						arg_231_1:RecordAudio("410101056", var_234_22)
						arg_231_1:RecordAudio("410101056", var_234_22)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_410101", "410101056", "story_v_out_410101.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_410101", "410101056", "story_v_out_410101.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_23 = math.max(var_234_14, arg_231_1.talkMaxDuration)

			if var_234_13 <= arg_231_1.time_ and arg_231_1.time_ < var_234_13 + var_234_23 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_13) / var_234_23

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_13 + var_234_23 and arg_231_1.time_ < var_234_13 + var_234_23 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410101057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410101057
		arg_235_1.duration_ = 12.366

		local var_235_0 = {
			zh = 6.066,
			ja = 12.366
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
				arg_235_0:Play410101058(arg_235_1)
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

			local var_238_13 = arg_235_1.actors_["1012"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.actorSpriteComps1012 == nil then
				arg_235_1.var_.actorSpriteComps1012 = var_238_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_15 = 0.034

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.actorSpriteComps1012 then
					for iter_238_5, iter_238_6 in pairs(arg_235_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_238_6 then
							local var_238_17 = Mathf.Lerp(iter_238_6.color.r, 0.5, var_238_16)

							iter_238_6.color = Color.New(var_238_17, var_238_17, var_238_17)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps1012 then
				local var_238_18 = 0.5

				for iter_238_7, iter_238_8 in pairs(arg_235_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_238_8 then
						iter_238_8.color = Color.New(var_238_18, var_238_18, var_238_18)
					end
				end

				arg_235_1.var_.actorSpriteComps1012 = nil
			end

			local var_238_19 = 0
			local var_238_20 = 0.725

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[584].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(410101057)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 29
				local var_238_25 = utf8.len(var_238_23)
				local var_238_26 = var_238_24 <= 0 and var_238_20 or var_238_20 * (var_238_25 / var_238_24)

				if var_238_26 > 0 and var_238_20 < var_238_26 then
					arg_235_1.talkMaxDuration = var_238_26

					if var_238_26 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_26 + var_238_19
					end
				end

				arg_235_1.text_.text = var_238_23
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101057", "story_v_out_410101.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101057", "story_v_out_410101.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_410101", "410101057", "story_v_out_410101.awb")

						arg_235_1:RecordAudio("410101057", var_238_28)
						arg_235_1:RecordAudio("410101057", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410101", "410101057", "story_v_out_410101.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410101", "410101057", "story_v_out_410101.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_29 = math.max(var_238_20, arg_235_1.talkMaxDuration)

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_29 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_19) / var_238_29

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_19 + var_238_29 and arg_235_1.time_ < var_238_19 + var_238_29 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play410101058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410101058
		arg_239_1.duration_ = 12.166

		local var_239_0 = {
			zh = 8.433,
			ja = 12.166
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
				arg_239_0:Play410101059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1060"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.actorSpriteComps1060 == nil then
				arg_239_1.var_.actorSpriteComps1060 = var_242_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_2 = 0.034

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.actorSpriteComps1060 then
					for iter_242_0, iter_242_1 in pairs(arg_239_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_242_1 then
							local var_242_4 = Mathf.Lerp(iter_242_1.color.r, 0.5, var_242_3)

							iter_242_1.color = Color.New(var_242_4, var_242_4, var_242_4)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.actorSpriteComps1060 then
				local var_242_5 = 0.5

				for iter_242_2, iter_242_3 in pairs(arg_239_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_242_3 then
						iter_242_3.color = Color.New(var_242_5, var_242_5, var_242_5)
					end
				end

				arg_239_1.var_.actorSpriteComps1060 = nil
			end

			local var_242_6 = arg_239_1.actors_["1012"]
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 and arg_239_1.var_.actorSpriteComps1012 == nil then
				arg_239_1.var_.actorSpriteComps1012 = var_242_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_8 = 0.034

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_8 then
				local var_242_9 = (arg_239_1.time_ - var_242_7) / var_242_8

				if arg_239_1.var_.actorSpriteComps1012 then
					for iter_242_4, iter_242_5 in pairs(arg_239_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_242_5 then
							local var_242_10 = Mathf.Lerp(iter_242_5.color.r, 1, var_242_9)

							iter_242_5.color = Color.New(var_242_10, var_242_10, var_242_10)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_7 + var_242_8 and arg_239_1.time_ < var_242_7 + var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps1012 then
				local var_242_11 = 1

				for iter_242_6, iter_242_7 in pairs(arg_239_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_242_7 then
						iter_242_7.color = Color.New(var_242_11, var_242_11, var_242_11)
					end
				end

				arg_239_1.var_.actorSpriteComps1012 = nil
			end

			local var_242_12 = 0
			local var_242_13 = 1

			if var_242_12 < arg_239_1.time_ and arg_239_1.time_ <= var_242_12 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_14 = arg_239_1:FormatText(StoryNameCfg[595].name)

				arg_239_1.leftNameTxt_.text = var_242_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_15 = arg_239_1:GetWordFromCfg(410101058)
				local var_242_16 = arg_239_1:FormatText(var_242_15.content)

				arg_239_1.text_.text = var_242_16

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_17 = 40
				local var_242_18 = utf8.len(var_242_16)
				local var_242_19 = var_242_17 <= 0 and var_242_13 or var_242_13 * (var_242_18 / var_242_17)

				if var_242_19 > 0 and var_242_13 < var_242_19 then
					arg_239_1.talkMaxDuration = var_242_19

					if var_242_19 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_19 + var_242_12
					end
				end

				arg_239_1.text_.text = var_242_16
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101058", "story_v_out_410101.awb") ~= 0 then
					local var_242_20 = manager.audio:GetVoiceLength("story_v_out_410101", "410101058", "story_v_out_410101.awb") / 1000

					if var_242_20 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_20 + var_242_12
					end

					if var_242_15.prefab_name ~= "" and arg_239_1.actors_[var_242_15.prefab_name] ~= nil then
						local var_242_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_15.prefab_name].transform, "story_v_out_410101", "410101058", "story_v_out_410101.awb")

						arg_239_1:RecordAudio("410101058", var_242_21)
						arg_239_1:RecordAudio("410101058", var_242_21)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_410101", "410101058", "story_v_out_410101.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_410101", "410101058", "story_v_out_410101.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_22 = math.max(var_242_13, arg_239_1.talkMaxDuration)

			if var_242_12 <= arg_239_1.time_ and arg_239_1.time_ < var_242_12 + var_242_22 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_12) / var_242_22

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_12 + var_242_22 and arg_239_1.time_ < var_242_12 + var_242_22 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410101059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410101059
		arg_243_1.duration_ = 12.466

		local var_243_0 = {
			zh = 8.266,
			ja = 12.466
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
				arg_243_0:Play410101060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 1.1

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[595].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(410101059)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101059", "story_v_out_410101.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101059", "story_v_out_410101.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_410101", "410101059", "story_v_out_410101.awb")

						arg_243_1:RecordAudio("410101059", var_246_9)
						arg_243_1:RecordAudio("410101059", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_410101", "410101059", "story_v_out_410101.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_410101", "410101059", "story_v_out_410101.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play410101060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410101060
		arg_247_1.duration_ = 8.133

		local var_247_0 = {
			zh = 7.333,
			ja = 8.133
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
				arg_247_0:Play410101061(arg_247_1)
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

					if var_250_3.name == "" or not string.find(var_250_3.name, "split") then
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

			local var_250_13 = arg_247_1.actors_["1012"]
			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 and arg_247_1.var_.actorSpriteComps1012 == nil then
				arg_247_1.var_.actorSpriteComps1012 = var_250_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_15 = 0.034

			if var_250_14 <= arg_247_1.time_ and arg_247_1.time_ < var_250_14 + var_250_15 then
				local var_250_16 = (arg_247_1.time_ - var_250_14) / var_250_15

				if arg_247_1.var_.actorSpriteComps1012 then
					for iter_250_5, iter_250_6 in pairs(arg_247_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_250_6 then
							local var_250_17 = Mathf.Lerp(iter_250_6.color.r, 0.5, var_250_16)

							iter_250_6.color = Color.New(var_250_17, var_250_17, var_250_17)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_14 + var_250_15 and arg_247_1.time_ < var_250_14 + var_250_15 + arg_250_0 and arg_247_1.var_.actorSpriteComps1012 then
				local var_250_18 = 0.5

				for iter_250_7, iter_250_8 in pairs(arg_247_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_250_8 then
						iter_250_8.color = Color.New(var_250_18, var_250_18, var_250_18)
					end
				end

				arg_247_1.var_.actorSpriteComps1012 = nil
			end

			local var_250_19 = 0
			local var_250_20 = 0.825

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

				local var_250_22 = arg_247_1:GetWordFromCfg(410101060)
				local var_250_23 = arg_247_1:FormatText(var_250_22.content)

				arg_247_1.text_.text = var_250_23

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_24 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101060", "story_v_out_410101.awb") ~= 0 then
					local var_250_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101060", "story_v_out_410101.awb") / 1000

					if var_250_27 + var_250_19 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_27 + var_250_19
					end

					if var_250_22.prefab_name ~= "" and arg_247_1.actors_[var_250_22.prefab_name] ~= nil then
						local var_250_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_22.prefab_name].transform, "story_v_out_410101", "410101060", "story_v_out_410101.awb")

						arg_247_1:RecordAudio("410101060", var_250_28)
						arg_247_1:RecordAudio("410101060", var_250_28)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410101", "410101060", "story_v_out_410101.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410101", "410101060", "story_v_out_410101.awb")
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
	Play410101061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410101061
		arg_251_1.duration_ = 11.833

		local var_251_0 = {
			zh = 6.866,
			ja = 11.833
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
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play410101062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1060"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps1060 == nil then
				arg_251_1.var_.actorSpriteComps1060 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.034

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps1060 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_254_1 then
							local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

							iter_254_1.color = Color.New(var_254_4, var_254_4, var_254_4)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps1060 then
				local var_254_5 = 0.5

				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_254_3 then
						iter_254_3.color = Color.New(var_254_5, var_254_5, var_254_5)
					end
				end

				arg_251_1.var_.actorSpriteComps1060 = nil
			end

			local var_254_6 = arg_251_1.actors_["1012"]
			local var_254_7 = 0

			if var_254_7 < arg_251_1.time_ and arg_251_1.time_ <= var_254_7 + arg_254_0 and arg_251_1.var_.actorSpriteComps1012 == nil then
				arg_251_1.var_.actorSpriteComps1012 = var_254_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_8 = 0.034

			if var_254_7 <= arg_251_1.time_ and arg_251_1.time_ < var_254_7 + var_254_8 then
				local var_254_9 = (arg_251_1.time_ - var_254_7) / var_254_8

				if arg_251_1.var_.actorSpriteComps1012 then
					for iter_254_4, iter_254_5 in pairs(arg_251_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_254_5 then
							local var_254_10 = Mathf.Lerp(iter_254_5.color.r, 1, var_254_9)

							iter_254_5.color = Color.New(var_254_10, var_254_10, var_254_10)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_7 + var_254_8 and arg_251_1.time_ < var_254_7 + var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps1012 then
				local var_254_11 = 1

				for iter_254_6, iter_254_7 in pairs(arg_251_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_254_7 then
						iter_254_7.color = Color.New(var_254_11, var_254_11, var_254_11)
					end
				end

				arg_251_1.var_.actorSpriteComps1012 = nil
			end

			local var_254_12 = 0
			local var_254_13 = 0.875

			if var_254_12 < arg_251_1.time_ and arg_251_1.time_ <= var_254_12 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_14 = arg_251_1:FormatText(StoryNameCfg[595].name)

				arg_251_1.leftNameTxt_.text = var_254_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_15 = arg_251_1:GetWordFromCfg(410101061)
				local var_254_16 = arg_251_1:FormatText(var_254_15.content)

				arg_251_1.text_.text = var_254_16

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_17 = 35
				local var_254_18 = utf8.len(var_254_16)
				local var_254_19 = var_254_17 <= 0 and var_254_13 or var_254_13 * (var_254_18 / var_254_17)

				if var_254_19 > 0 and var_254_13 < var_254_19 then
					arg_251_1.talkMaxDuration = var_254_19

					if var_254_19 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_19 + var_254_12
					end
				end

				arg_251_1.text_.text = var_254_16
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101061", "story_v_out_410101.awb") ~= 0 then
					local var_254_20 = manager.audio:GetVoiceLength("story_v_out_410101", "410101061", "story_v_out_410101.awb") / 1000

					if var_254_20 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_20 + var_254_12
					end

					if var_254_15.prefab_name ~= "" and arg_251_1.actors_[var_254_15.prefab_name] ~= nil then
						local var_254_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_15.prefab_name].transform, "story_v_out_410101", "410101061", "story_v_out_410101.awb")

						arg_251_1:RecordAudio("410101061", var_254_21)
						arg_251_1:RecordAudio("410101061", var_254_21)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410101", "410101061", "story_v_out_410101.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410101", "410101061", "story_v_out_410101.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_22 = math.max(var_254_13, arg_251_1.talkMaxDuration)

			if var_254_12 <= arg_251_1.time_ and arg_251_1.time_ < var_254_12 + var_254_22 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_12) / var_254_22

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_12 + var_254_22 and arg_251_1.time_ < var_254_12 + var_254_22 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410101062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410101062
		arg_255_1.duration_ = 13.033

		local var_255_0 = {
			zh = 6.3,
			ja = 13.033
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
				arg_255_0:Play410101063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.825

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[595].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(410101062)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 33
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101062", "story_v_out_410101.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_410101", "410101062", "story_v_out_410101.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_410101", "410101062", "story_v_out_410101.awb")

						arg_255_1:RecordAudio("410101062", var_258_9)
						arg_255_1:RecordAudio("410101062", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_410101", "410101062", "story_v_out_410101.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_410101", "410101062", "story_v_out_410101.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play410101063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410101063
		arg_259_1.duration_ = 4.466

		local var_259_0 = {
			zh = 2.866,
			ja = 4.466
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
				arg_259_0:Play410101064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1060"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1060 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1060", 2)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(-390, -435, -40)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1060, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_262_7 = arg_259_1.actors_["1060"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps1060 == nil then
				arg_259_1.var_.actorSpriteComps1060 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.034

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps1060 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 1, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps1060 then
				local var_262_12 = 1

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps1060 = nil
			end

			local var_262_13 = arg_259_1.actors_["1012"]
			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 and arg_259_1.var_.actorSpriteComps1012 == nil then
				arg_259_1.var_.actorSpriteComps1012 = var_262_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_15 = 0.034

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15

				if arg_259_1.var_.actorSpriteComps1012 then
					for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_262_6 then
							local var_262_17 = Mathf.Lerp(iter_262_6.color.r, 0.5, var_262_16)

							iter_262_6.color = Color.New(var_262_17, var_262_17, var_262_17)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1012 then
				local var_262_18 = 0.5

				for iter_262_7, iter_262_8 in pairs(arg_259_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_262_8 then
						iter_262_8.color = Color.New(var_262_18, var_262_18, var_262_18)
					end
				end

				arg_259_1.var_.actorSpriteComps1012 = nil
			end

			local var_262_19 = 0
			local var_262_20 = 0.3

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_21 = arg_259_1:FormatText(StoryNameCfg[584].name)

				arg_259_1.leftNameTxt_.text = var_262_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_22 = arg_259_1:GetWordFromCfg(410101063)
				local var_262_23 = arg_259_1:FormatText(var_262_22.content)

				arg_259_1.text_.text = var_262_23

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_24 = 12
				local var_262_25 = utf8.len(var_262_23)
				local var_262_26 = var_262_24 <= 0 and var_262_20 or var_262_20 * (var_262_25 / var_262_24)

				if var_262_26 > 0 and var_262_20 < var_262_26 then
					arg_259_1.talkMaxDuration = var_262_26

					if var_262_26 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_26 + var_262_19
					end
				end

				arg_259_1.text_.text = var_262_23
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101063", "story_v_out_410101.awb") ~= 0 then
					local var_262_27 = manager.audio:GetVoiceLength("story_v_out_410101", "410101063", "story_v_out_410101.awb") / 1000

					if var_262_27 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_27 + var_262_19
					end

					if var_262_22.prefab_name ~= "" and arg_259_1.actors_[var_262_22.prefab_name] ~= nil then
						local var_262_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_22.prefab_name].transform, "story_v_out_410101", "410101063", "story_v_out_410101.awb")

						arg_259_1:RecordAudio("410101063", var_262_28)
						arg_259_1:RecordAudio("410101063", var_262_28)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410101", "410101063", "story_v_out_410101.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410101", "410101063", "story_v_out_410101.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_29 = math.max(var_262_20, arg_259_1.talkMaxDuration)

			if var_262_19 <= arg_259_1.time_ and arg_259_1.time_ < var_262_19 + var_262_29 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_19) / var_262_29

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_19 + var_262_29 and arg_259_1.time_ < var_262_19 + var_262_29 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410101064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410101064
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play410101065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1012"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1012 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1012", 7)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(0, -2000, 300)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1012, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_266_7 = arg_263_1.actors_["1060"].transform
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 then
				arg_263_1.var_.moveOldPos1060 = var_266_7.localPosition
				var_266_7.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1060", 7)

				local var_266_9 = var_266_7.childCount

				for iter_266_1 = 0, var_266_9 - 1 do
					local var_266_10 = var_266_7:GetChild(iter_266_1)

					if var_266_10.name == "" or not string.find(var_266_10.name, "split") then
						var_266_10.gameObject:SetActive(true)
					else
						var_266_10.gameObject:SetActive(false)
					end
				end
			end

			local var_266_11 = 0.001

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_8) / var_266_11
				local var_266_13 = Vector3.New(0, -2000, -40)

				var_266_7.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1060, var_266_13, var_266_12)
			end

			if arg_263_1.time_ >= var_266_8 + var_266_11 and arg_263_1.time_ < var_266_8 + var_266_11 + arg_266_0 then
				var_266_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_266_14 = 0
			local var_266_15 = 1.175

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_16 = arg_263_1:GetWordFromCfg(410101064)
				local var_266_17 = arg_263_1:FormatText(var_266_16.content)

				arg_263_1.text_.text = var_266_17

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_18 = 47
				local var_266_19 = utf8.len(var_266_17)
				local var_266_20 = var_266_18 <= 0 and var_266_15 or var_266_15 * (var_266_19 / var_266_18)

				if var_266_20 > 0 and var_266_15 < var_266_20 then
					arg_263_1.talkMaxDuration = var_266_20

					if var_266_20 + var_266_14 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_14
					end
				end

				arg_263_1.text_.text = var_266_17
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_21 = math.max(var_266_15, arg_263_1.talkMaxDuration)

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_21 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_14) / var_266_21

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_14 + var_266_21 and arg_263_1.time_ < var_266_14 + var_266_21 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play410101065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410101065
		arg_267_1.duration_ = 4.666

		local var_267_0 = {
			zh = 4.666,
			ja = 3.666
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
				arg_267_0:Play410101066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1012"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1012 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1012", 3)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(0, -465, 300)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1012, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, -465, 300)
			end

			local var_270_7 = arg_267_1.actors_["1012"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps1012 == nil then
				arg_267_1.var_.actorSpriteComps1012 = var_270_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_9 = 0.034

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.actorSpriteComps1012 then
					for iter_270_1, iter_270_2 in pairs(arg_267_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_270_2 then
							local var_270_11 = Mathf.Lerp(iter_270_2.color.r, 1, var_270_10)

							iter_270_2.color = Color.New(var_270_11, var_270_11, var_270_11)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps1012 then
				local var_270_12 = 1

				for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_270_4 then
						iter_270_4.color = Color.New(var_270_12, var_270_12, var_270_12)
					end
				end

				arg_267_1.var_.actorSpriteComps1012 = nil
			end

			local var_270_13 = 0
			local var_270_14 = 0.6

			if var_270_13 < arg_267_1.time_ and arg_267_1.time_ <= var_270_13 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_15 = arg_267_1:FormatText(StoryNameCfg[595].name)

				arg_267_1.leftNameTxt_.text = var_270_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_16 = arg_267_1:GetWordFromCfg(410101065)
				local var_270_17 = arg_267_1:FormatText(var_270_16.content)

				arg_267_1.text_.text = var_270_17

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_18 = 24
				local var_270_19 = utf8.len(var_270_17)
				local var_270_20 = var_270_18 <= 0 and var_270_14 or var_270_14 * (var_270_19 / var_270_18)

				if var_270_20 > 0 and var_270_14 < var_270_20 then
					arg_267_1.talkMaxDuration = var_270_20

					if var_270_20 + var_270_13 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_13
					end
				end

				arg_267_1.text_.text = var_270_17
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101065", "story_v_out_410101.awb") ~= 0 then
					local var_270_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101065", "story_v_out_410101.awb") / 1000

					if var_270_21 + var_270_13 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_21 + var_270_13
					end

					if var_270_16.prefab_name ~= "" and arg_267_1.actors_[var_270_16.prefab_name] ~= nil then
						local var_270_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_16.prefab_name].transform, "story_v_out_410101", "410101065", "story_v_out_410101.awb")

						arg_267_1:RecordAudio("410101065", var_270_22)
						arg_267_1:RecordAudio("410101065", var_270_22)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410101", "410101065", "story_v_out_410101.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410101", "410101065", "story_v_out_410101.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_23 = math.max(var_270_14, arg_267_1.talkMaxDuration)

			if var_270_13 <= arg_267_1.time_ and arg_267_1.time_ < var_270_13 + var_270_23 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_13) / var_270_23

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_13 + var_270_23 and arg_267_1.time_ < var_270_13 + var_270_23 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410101066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410101066
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play410101067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1012"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.actorSpriteComps1012 == nil then
				arg_271_1.var_.actorSpriteComps1012 = var_274_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_2 = 0.034

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.actorSpriteComps1012 then
					for iter_274_0, iter_274_1 in pairs(arg_271_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_274_1 then
							local var_274_4 = Mathf.Lerp(iter_274_1.color.r, 0.5, var_274_3)

							iter_274_1.color = Color.New(var_274_4, var_274_4, var_274_4)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.actorSpriteComps1012 then
				local var_274_5 = 0.5

				for iter_274_2, iter_274_3 in pairs(arg_271_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_274_3 then
						iter_274_3.color = Color.New(var_274_5, var_274_5, var_274_5)
					end
				end

				arg_271_1.var_.actorSpriteComps1012 = nil
			end

			local var_274_6 = 0
			local var_274_7 = 1.05

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_8 = arg_271_1:GetWordFromCfg(410101066)
				local var_274_9 = arg_271_1:FormatText(var_274_8.content)

				arg_271_1.text_.text = var_274_9

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_10 = 42
				local var_274_11 = utf8.len(var_274_9)
				local var_274_12 = var_274_10 <= 0 and var_274_7 or var_274_7 * (var_274_11 / var_274_10)

				if var_274_12 > 0 and var_274_7 < var_274_12 then
					arg_271_1.talkMaxDuration = var_274_12

					if var_274_12 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_12 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_9
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_13 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_13 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_13

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_13 and arg_271_1.time_ < var_274_6 + var_274_13 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410101067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410101067
		arg_275_1.duration_ = 8.5

		local var_275_0 = {
			zh = 3.066,
			ja = 8.5
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
			arg_275_1.auto_ = false
		end

		function arg_275_1.playNext_(arg_277_0)
			arg_275_1.onStoryFinished_()
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1012"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1012 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1012", 3)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_3" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(0, -465, 300)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1012, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, -465, 300)
			end

			local var_278_7 = arg_275_1.actors_["1012"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1012 == nil then
				arg_275_1.var_.actorSpriteComps1012 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.034

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1012 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1012 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1012 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 0.25

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[595].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(410101067)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 10
				local var_278_19 = utf8.len(var_278_17)
				local var_278_20 = var_278_18 <= 0 and var_278_14 or var_278_14 * (var_278_19 / var_278_18)

				if var_278_20 > 0 and var_278_14 < var_278_20 then
					arg_275_1.talkMaxDuration = var_278_20

					if var_278_20 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_13
					end
				end

				arg_275_1.text_.text = var_278_17
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410101", "410101067", "story_v_out_410101.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_410101", "410101067", "story_v_out_410101.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_410101", "410101067", "story_v_out_410101.awb")

						arg_275_1:RecordAudio("410101067", var_278_22)
						arg_275_1:RecordAudio("410101067", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_410101", "410101067", "story_v_out_410101.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_410101", "410101067", "story_v_out_410101.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_23 = math.max(var_278_14, arg_275_1.talkMaxDuration)

			if var_278_13 <= arg_275_1.time_ and arg_275_1.time_ < var_278_13 + var_278_23 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_13) / var_278_23

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_13 + var_278_23 and arg_275_1.time_ < var_278_13 + var_278_23 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J02c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L02g"
	},
	voices = {
		"story_v_out_410101.awb"
	}
}
