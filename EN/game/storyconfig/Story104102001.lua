return {
	Play410201001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410201001
		arg_1_1.duration_ = 6.666

		local var_1_0 = {
			ja = 6.666,
			CriLanguages = 6.166,
			zh = 6.166
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
				arg_1_0:Play410201002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST66"

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
				local var_4_5 = arg_1_1.bgs_.ST66

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
					if iter_4_0 ~= "ST66" then
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

			local var_4_22 = "10060"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10060"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10060 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10060", 2)

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
				local var_4_30 = Vector3.New(-390, -400, 0)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10060, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_4_31 = "1061"

			if arg_1_1.actors_[var_4_31] == nil then
				local var_4_32 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_31), arg_1_1.canvasGo_.transform)

				var_4_32.transform:SetSiblingIndex(1)

				var_4_32.name = var_4_31
				var_4_32.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_31] = var_4_32
			end

			local var_4_33 = arg_1_1.actors_["1061"].transform
			local var_4_34 = 2

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.var_.moveOldPos1061 = var_4_33.localPosition
				var_4_33.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1061", 4)

				local var_4_35 = var_4_33.childCount

				for iter_4_3 = 0, var_4_35 - 1 do
					local var_4_36 = var_4_33:GetChild(iter_4_3)

					if var_4_36.name == "" or not string.find(var_4_36.name, "split") then
						var_4_36.gameObject:SetActive(true)
					else
						var_4_36.gameObject:SetActive(false)
					end
				end
			end

			local var_4_37 = 0.001

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_34) / var_4_37
				local var_4_39 = Vector3.New(390, -490, 18)

				var_4_33.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1061, var_4_39, var_4_38)
			end

			if arg_1_1.time_ >= var_4_34 + var_4_37 and arg_1_1.time_ < var_4_34 + var_4_37 + arg_4_0 then
				var_4_33.localPosition = Vector3.New(390, -490, 18)
			end

			local var_4_40 = arg_1_1.actors_["10060"]
			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 and arg_1_1.var_.actorSpriteComps10060 == nil then
				arg_1_1.var_.actorSpriteComps10060 = var_4_40:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_42 = 0.034

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42

				if arg_1_1.var_.actorSpriteComps10060 then
					for iter_4_4, iter_4_5 in pairs(arg_1_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_4_5 then
							local var_4_44 = Mathf.Lerp(iter_4_5.color.r, 1, var_4_43)

							iter_4_5.color = Color.New(var_4_44, var_4_44, var_4_44)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 and arg_1_1.var_.actorSpriteComps10060 then
				local var_4_45 = 1

				for iter_4_6, iter_4_7 in pairs(arg_1_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_4_7 then
						iter_4_7.color = Color.New(var_4_45, var_4_45, var_4_45)
					end
				end

				arg_1_1.var_.actorSpriteComps10060 = nil
			end

			local var_4_46 = arg_1_1.actors_["1061"]
			local var_4_47 = 2

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 and arg_1_1.var_.actorSpriteComps1061 == nil then
				arg_1_1.var_.actorSpriteComps1061 = var_4_46:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_48 = 0.034

			if var_4_47 <= arg_1_1.time_ and arg_1_1.time_ < var_4_47 + var_4_48 then
				local var_4_49 = (arg_1_1.time_ - var_4_47) / var_4_48

				if arg_1_1.var_.actorSpriteComps1061 then
					for iter_4_8, iter_4_9 in pairs(arg_1_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_4_9 then
							local var_4_50 = Mathf.Lerp(iter_4_9.color.r, 0.5, var_4_49)

							iter_4_9.color = Color.New(var_4_50, var_4_50, var_4_50)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_47 + var_4_48 and arg_1_1.time_ < var_4_47 + var_4_48 + arg_4_0 and arg_1_1.var_.actorSpriteComps1061 then
				local var_4_51 = 0.5

				for iter_4_10, iter_4_11 in pairs(arg_1_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_4_11 then
						iter_4_11.color = Color.New(var_4_51, var_4_51, var_4_51)
					end
				end

				arg_1_1.var_.actorSpriteComps1061 = nil
			end

			local var_4_52 = 0
			local var_4_53 = 0.166666666666667

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				local var_4_54 = "play"
				local var_4_55 = "music"

				arg_1_1:AudioAction(var_4_54, var_4_55, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_56 = 0.3
			local var_4_57 = 1

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				local var_4_58 = "play"
				local var_4_59 = "music"

				arg_1_1:AudioAction(var_4_58, var_4_59, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_60 = 2
			local var_4_61 = 0.475

			if var_4_60 < arg_1_1.time_ and arg_1_1.time_ <= var_4_60 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_62 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_62:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_63 = arg_1_1:FormatText(StoryNameCfg[597].name)

				arg_1_1.leftNameTxt_.text = var_4_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_64 = arg_1_1:GetWordFromCfg(410201001)
				local var_4_65 = arg_1_1:FormatText(var_4_64.content)

				arg_1_1.text_.text = var_4_65

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_66 = 19
				local var_4_67 = utf8.len(var_4_65)
				local var_4_68 = var_4_66 <= 0 and var_4_61 or var_4_61 * (var_4_67 / var_4_66)

				if var_4_68 > 0 and var_4_61 < var_4_68 then
					arg_1_1.talkMaxDuration = var_4_68
					var_4_60 = var_4_60 + 0.3

					if var_4_68 + var_4_60 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_68 + var_4_60
					end
				end

				arg_1_1.text_.text = var_4_65
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201001", "story_v_out_410201.awb") ~= 0 then
					local var_4_69 = manager.audio:GetVoiceLength("story_v_out_410201", "410201001", "story_v_out_410201.awb") / 1000

					if var_4_69 + var_4_60 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_69 + var_4_60
					end

					if var_4_64.prefab_name ~= "" and arg_1_1.actors_[var_4_64.prefab_name] ~= nil then
						local var_4_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_64.prefab_name].transform, "story_v_out_410201", "410201001", "story_v_out_410201.awb")

						arg_1_1:RecordAudio("410201001", var_4_70)
						arg_1_1:RecordAudio("410201001", var_4_70)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410201", "410201001", "story_v_out_410201.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410201", "410201001", "story_v_out_410201.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_71 = var_4_60 + 0.3
			local var_4_72 = math.max(var_4_61, arg_1_1.talkMaxDuration)

			if var_4_71 <= arg_1_1.time_ and arg_1_1.time_ < var_4_71 + var_4_72 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_71) / var_4_72

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_71 + var_4_72 and arg_1_1.time_ < var_4_71 + var_4_72 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410201002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410201002
		arg_7_1.duration_ = 12.1

		local var_7_0 = {
			ja = 12.1,
			CriLanguages = 9.566,
			zh = 9.566
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
				arg_7_0:Play410201003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1061"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos1061 = var_10_0.localPosition
				var_10_0.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1061", 4)

				local var_10_2 = var_10_0.childCount

				for iter_10_0 = 0, var_10_2 - 1 do
					local var_10_3 = var_10_0:GetChild(iter_10_0)

					if var_10_3.name == "split_5" or not string.find(var_10_3.name, "split") then
						var_10_3.gameObject:SetActive(true)
					else
						var_10_3.gameObject:SetActive(false)
					end
				end
			end

			local var_10_4 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_4 then
				local var_10_5 = (arg_7_1.time_ - var_10_1) / var_10_4
				local var_10_6 = Vector3.New(390, -490, 18)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1061, var_10_6, var_10_5)
			end

			if arg_7_1.time_ >= var_10_1 + var_10_4 and arg_7_1.time_ < var_10_1 + var_10_4 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_10_7 = arg_7_1.actors_["1061"]
			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 == nil then
				arg_7_1.var_.actorSpriteComps1061 = var_10_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_9 = 0.034

			if var_10_8 <= arg_7_1.time_ and arg_7_1.time_ < var_10_8 + var_10_9 then
				local var_10_10 = (arg_7_1.time_ - var_10_8) / var_10_9

				if arg_7_1.var_.actorSpriteComps1061 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_10_2 then
							local var_10_11 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_10)

							iter_10_2.color = Color.New(var_10_11, var_10_11, var_10_11)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_8 + var_10_9 and arg_7_1.time_ < var_10_8 + var_10_9 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 then
				local var_10_12 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_12, var_10_12, var_10_12)
					end
				end

				arg_7_1.var_.actorSpriteComps1061 = nil
			end

			local var_10_13 = arg_7_1.actors_["10060"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.actorSpriteComps10060 == nil then
				arg_7_1.var_.actorSpriteComps10060 = var_10_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_15 = 0.034

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.actorSpriteComps10060 then
					for iter_10_5, iter_10_6 in pairs(arg_7_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_10_6 then
							local var_10_17 = Mathf.Lerp(iter_10_6.color.r, 0.5, var_10_16)

							iter_10_6.color = Color.New(var_10_17, var_10_17, var_10_17)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.actorSpriteComps10060 then
				local var_10_18 = 0.5

				for iter_10_7, iter_10_8 in pairs(arg_7_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_10_8 then
						iter_10_8.color = Color.New(var_10_18, var_10_18, var_10_18)
					end
				end

				arg_7_1.var_.actorSpriteComps10060 = nil
			end

			local var_10_19 = 0
			local var_10_20 = 1.225

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[612].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(410201002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 49
				local var_10_25 = utf8.len(var_10_23)
				local var_10_26 = var_10_24 <= 0 and var_10_20 or var_10_20 * (var_10_25 / var_10_24)

				if var_10_26 > 0 and var_10_20 < var_10_26 then
					arg_7_1.talkMaxDuration = var_10_26

					if var_10_26 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_23
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201002", "story_v_out_410201.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201002", "story_v_out_410201.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_410201", "410201002", "story_v_out_410201.awb")

						arg_7_1:RecordAudio("410201002", var_10_28)
						arg_7_1:RecordAudio("410201002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410201", "410201002", "story_v_out_410201.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410201", "410201002", "story_v_out_410201.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_29 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_29 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_29

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_29 and arg_7_1.time_ < var_10_19 + var_10_29 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410201003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410201003
		arg_11_1.duration_ = 5.766

		local var_11_0 = {
			ja = 5.766,
			CriLanguages = 3.066,
			zh = 3.066
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
				arg_11_0:Play410201004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.4

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[612].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(410201003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 16
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201003", "story_v_out_410201.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_410201", "410201003", "story_v_out_410201.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_410201", "410201003", "story_v_out_410201.awb")

						arg_11_1:RecordAudio("410201003", var_14_9)
						arg_11_1:RecordAudio("410201003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410201", "410201003", "story_v_out_410201.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410201", "410201003", "story_v_out_410201.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410201004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410201004
		arg_15_1.duration_ = 2.866

		local var_15_0 = {
			ja = 2.866,
			CriLanguages = 2.666,
			zh = 2.666
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
				arg_15_0:Play410201005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10060"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos10060 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10060", 2)

				local var_18_2 = var_18_0.childCount

				for iter_18_0 = 0, var_18_2 - 1 do
					local var_18_3 = var_18_0:GetChild(iter_18_0)

					if var_18_3.name == "" or not string.find(var_18_3.name, "split") then
						var_18_3.gameObject:SetActive(true)
					else
						var_18_3.gameObject:SetActive(false)
					end
				end
			end

			local var_18_4 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_4 then
				local var_18_5 = (arg_15_1.time_ - var_18_1) / var_18_4
				local var_18_6 = Vector3.New(-390, -400, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10060, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_18_7 = arg_15_1.actors_["10060"]
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps10060 == nil then
				arg_15_1.var_.actorSpriteComps10060 = var_18_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_9 = 0.034

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_8) / var_18_9

				if arg_15_1.var_.actorSpriteComps10060 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_18_2 then
							local var_18_11 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_10)

							iter_18_2.color = Color.New(var_18_11, var_18_11, var_18_11)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_8 + var_18_9 and arg_15_1.time_ < var_18_8 + var_18_9 + arg_18_0 and arg_15_1.var_.actorSpriteComps10060 then
				local var_18_12 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_12, var_18_12, var_18_12)
					end
				end

				arg_15_1.var_.actorSpriteComps10060 = nil
			end

			local var_18_13 = arg_15_1.actors_["1061"]
			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 == nil then
				arg_15_1.var_.actorSpriteComps1061 = var_18_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_15 = 0.034

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_15 then
				local var_18_16 = (arg_15_1.time_ - var_18_14) / var_18_15

				if arg_15_1.var_.actorSpriteComps1061 then
					for iter_18_5, iter_18_6 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_18_6 then
							local var_18_17 = Mathf.Lerp(iter_18_6.color.r, 0.5, var_18_16)

							iter_18_6.color = Color.New(var_18_17, var_18_17, var_18_17)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_14 + var_18_15 and arg_15_1.time_ < var_18_14 + var_18_15 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 then
				local var_18_18 = 0.5

				for iter_18_7, iter_18_8 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_18_8 then
						iter_18_8.color = Color.New(var_18_18, var_18_18, var_18_18)
					end
				end

				arg_15_1.var_.actorSpriteComps1061 = nil
			end

			local var_18_19 = 0
			local var_18_20 = 0.2

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[597].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(410201004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201004", "story_v_out_410201.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201004", "story_v_out_410201.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_410201", "410201004", "story_v_out_410201.awb")

						arg_15_1:RecordAudio("410201004", var_18_28)
						arg_15_1:RecordAudio("410201004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410201", "410201004", "story_v_out_410201.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410201", "410201004", "story_v_out_410201.awb")
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
	Play410201005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410201005
		arg_19_1.duration_ = 7.533

		local var_19_0 = {
			ja = 7.4,
			CriLanguages = 7.533,
			zh = 7.533
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
				arg_19_0:Play410201006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1061"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1061 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1061", 4)

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
				local var_22_6 = Vector3.New(390, -490, 18)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1061, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_22_7 = arg_19_1.actors_["1061"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 == nil then
				arg_19_1.var_.actorSpriteComps1061 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps1061 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps1061 = nil
			end

			local var_22_13 = arg_19_1.actors_["10060"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.actorSpriteComps10060 == nil then
				arg_19_1.var_.actorSpriteComps10060 = var_22_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_15 = 0.034

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.actorSpriteComps10060 then
					for iter_22_5, iter_22_6 in pairs(arg_19_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_22_6 then
							local var_22_17 = Mathf.Lerp(iter_22_6.color.r, 0.5, var_22_16)

							iter_22_6.color = Color.New(var_22_17, var_22_17, var_22_17)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.actorSpriteComps10060 then
				local var_22_18 = 0.5

				for iter_22_7, iter_22_8 in pairs(arg_19_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_22_8 then
						iter_22_8.color = Color.New(var_22_18, var_22_18, var_22_18)
					end
				end

				arg_19_1.var_.actorSpriteComps10060 = nil
			end

			local var_22_19 = 0
			local var_22_20 = 0.75

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[612].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(410201005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 30
				local var_22_25 = utf8.len(var_22_23)
				local var_22_26 = var_22_24 <= 0 and var_22_20 or var_22_20 * (var_22_25 / var_22_24)

				if var_22_26 > 0 and var_22_20 < var_22_26 then
					arg_19_1.talkMaxDuration = var_22_26

					if var_22_26 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_26 + var_22_19
					end
				end

				arg_19_1.text_.text = var_22_23
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201005", "story_v_out_410201.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201005", "story_v_out_410201.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_410201", "410201005", "story_v_out_410201.awb")

						arg_19_1:RecordAudio("410201005", var_22_28)
						arg_19_1:RecordAudio("410201005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410201", "410201005", "story_v_out_410201.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410201", "410201005", "story_v_out_410201.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_29 = math.max(var_22_20, arg_19_1.talkMaxDuration)

			if var_22_19 <= arg_19_1.time_ and arg_19_1.time_ < var_22_19 + var_22_29 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_19) / var_22_29

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_19 + var_22_29 and arg_19_1.time_ < var_22_19 + var_22_29 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410201006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410201006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play410201007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10060"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10060 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10060", 7)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(0, -2000, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10060, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_26_7 = arg_23_1.actors_["1061"].transform
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 then
				arg_23_1.var_.moveOldPos1061 = var_26_7.localPosition
				var_26_7.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1061", 7)

				local var_26_9 = var_26_7.childCount

				for iter_26_1 = 0, var_26_9 - 1 do
					local var_26_10 = var_26_7:GetChild(iter_26_1)

					if var_26_10.name == "" or not string.find(var_26_10.name, "split") then
						var_26_10.gameObject:SetActive(true)
					else
						var_26_10.gameObject:SetActive(false)
					end
				end
			end

			local var_26_11 = 0.001

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_8) / var_26_11
				local var_26_13 = Vector3.New(0, -2000, 18)

				var_26_7.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1061, var_26_13, var_26_12)
			end

			if arg_23_1.time_ >= var_26_8 + var_26_11 and arg_23_1.time_ < var_26_8 + var_26_11 + arg_26_0 then
				var_26_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_26_14 = arg_23_1.actors_["10060"]
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 and arg_23_1.var_.actorSpriteComps10060 == nil then
				arg_23_1.var_.actorSpriteComps10060 = var_26_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_16 = 0.034

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16

				if arg_23_1.var_.actorSpriteComps10060 then
					for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_26_3 then
							local var_26_18 = Mathf.Lerp(iter_26_3.color.r, 0.5, var_26_17)

							iter_26_3.color = Color.New(var_26_18, var_26_18, var_26_18)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 and arg_23_1.var_.actorSpriteComps10060 then
				local var_26_19 = 0.5

				for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_26_5 then
						iter_26_5.color = Color.New(var_26_19, var_26_19, var_26_19)
					end
				end

				arg_23_1.var_.actorSpriteComps10060 = nil
			end

			local var_26_20 = arg_23_1.actors_["1061"]
			local var_26_21 = 0

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 == nil then
				arg_23_1.var_.actorSpriteComps1061 = var_26_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_22 = 0.034

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_22 then
				local var_26_23 = (arg_23_1.time_ - var_26_21) / var_26_22

				if arg_23_1.var_.actorSpriteComps1061 then
					for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_26_7 then
							local var_26_24 = Mathf.Lerp(iter_26_7.color.r, 0.5, var_26_23)

							iter_26_7.color = Color.New(var_26_24, var_26_24, var_26_24)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_21 + var_26_22 and arg_23_1.time_ < var_26_21 + var_26_22 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 then
				local var_26_25 = 0.5

				for iter_26_8, iter_26_9 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_26_9 then
						iter_26_9.color = Color.New(var_26_25, var_26_25, var_26_25)
					end
				end

				arg_23_1.var_.actorSpriteComps1061 = nil
			end

			local var_26_26 = 0
			local var_26_27 = 1.25

			if var_26_26 < arg_23_1.time_ and arg_23_1.time_ <= var_26_26 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_28 = arg_23_1:GetWordFromCfg(410201006)
				local var_26_29 = arg_23_1:FormatText(var_26_28.content)

				arg_23_1.text_.text = var_26_29

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_30 = 50
				local var_26_31 = utf8.len(var_26_29)
				local var_26_32 = var_26_30 <= 0 and var_26_27 or var_26_27 * (var_26_31 / var_26_30)

				if var_26_32 > 0 and var_26_27 < var_26_32 then
					arg_23_1.talkMaxDuration = var_26_32

					if var_26_32 + var_26_26 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_32 + var_26_26
					end
				end

				arg_23_1.text_.text = var_26_29
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_33 = math.max(var_26_27, arg_23_1.talkMaxDuration)

			if var_26_26 <= arg_23_1.time_ and arg_23_1.time_ < var_26_26 + var_26_33 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_26) / var_26_33

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_26 + var_26_33 and arg_23_1.time_ < var_26_26 + var_26_33 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410201007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410201007
		arg_27_1.duration_ = 3.2

		local var_27_0 = {
			ja = 3.2,
			CriLanguages = 1.6,
			zh = 1.6
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
				arg_27_0:Play410201008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10060"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10060 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10060", 2)

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
				local var_30_6 = Vector3.New(-390, -400, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10060, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_30_7 = arg_27_1.actors_["1061"].transform
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 then
				arg_27_1.var_.moveOldPos1061 = var_30_7.localPosition
				var_30_7.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1061", 4)

				local var_30_9 = var_30_7.childCount

				for iter_30_1 = 0, var_30_9 - 1 do
					local var_30_10 = var_30_7:GetChild(iter_30_1)

					if var_30_10.name == "" or not string.find(var_30_10.name, "split") then
						var_30_10.gameObject:SetActive(true)
					else
						var_30_10.gameObject:SetActive(false)
					end
				end
			end

			local var_30_11 = 0.001

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_8) / var_30_11
				local var_30_13 = Vector3.New(390, -490, 18)

				var_30_7.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1061, var_30_13, var_30_12)
			end

			if arg_27_1.time_ >= var_30_8 + var_30_11 and arg_27_1.time_ < var_30_8 + var_30_11 + arg_30_0 then
				var_30_7.localPosition = Vector3.New(390, -490, 18)
			end

			local var_30_14 = arg_27_1.actors_["10060"]
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 and arg_27_1.var_.actorSpriteComps10060 == nil then
				arg_27_1.var_.actorSpriteComps10060 = var_30_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_16 = 0.034

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16

				if arg_27_1.var_.actorSpriteComps10060 then
					for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_30_3 then
							local var_30_18 = Mathf.Lerp(iter_30_3.color.r, 0.5, var_30_17)

							iter_30_3.color = Color.New(var_30_18, var_30_18, var_30_18)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 and arg_27_1.var_.actorSpriteComps10060 then
				local var_30_19 = 0.5

				for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_30_5 then
						iter_30_5.color = Color.New(var_30_19, var_30_19, var_30_19)
					end
				end

				arg_27_1.var_.actorSpriteComps10060 = nil
			end

			local var_30_20 = arg_27_1.actors_["1061"]
			local var_30_21 = 0

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 == nil then
				arg_27_1.var_.actorSpriteComps1061 = var_30_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_22 = 0.034

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22

				if arg_27_1.var_.actorSpriteComps1061 then
					for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_30_7 then
							local var_30_24 = Mathf.Lerp(iter_30_7.color.r, 1, var_30_23)

							iter_30_7.color = Color.New(var_30_24, var_30_24, var_30_24)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 then
				local var_30_25 = 1

				for iter_30_8, iter_30_9 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_30_9 then
						iter_30_9.color = Color.New(var_30_25, var_30_25, var_30_25)
					end
				end

				arg_27_1.var_.actorSpriteComps1061 = nil
			end

			local var_30_26 = 0
			local var_30_27 = 0.2

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_28 = arg_27_1:FormatText(StoryNameCfg[612].name)

				arg_27_1.leftNameTxt_.text = var_30_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_29 = arg_27_1:GetWordFromCfg(410201007)
				local var_30_30 = arg_27_1:FormatText(var_30_29.content)

				arg_27_1.text_.text = var_30_30

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_31 = 8
				local var_30_32 = utf8.len(var_30_30)
				local var_30_33 = var_30_31 <= 0 and var_30_27 or var_30_27 * (var_30_32 / var_30_31)

				if var_30_33 > 0 and var_30_27 < var_30_33 then
					arg_27_1.talkMaxDuration = var_30_33

					if var_30_33 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_26
					end
				end

				arg_27_1.text_.text = var_30_30
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201007", "story_v_out_410201.awb") ~= 0 then
					local var_30_34 = manager.audio:GetVoiceLength("story_v_out_410201", "410201007", "story_v_out_410201.awb") / 1000

					if var_30_34 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_34 + var_30_26
					end

					if var_30_29.prefab_name ~= "" and arg_27_1.actors_[var_30_29.prefab_name] ~= nil then
						local var_30_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_29.prefab_name].transform, "story_v_out_410201", "410201007", "story_v_out_410201.awb")

						arg_27_1:RecordAudio("410201007", var_30_35)
						arg_27_1:RecordAudio("410201007", var_30_35)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410201", "410201007", "story_v_out_410201.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410201", "410201007", "story_v_out_410201.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_36 = math.max(var_30_27, arg_27_1.talkMaxDuration)

			if var_30_26 <= arg_27_1.time_ and arg_27_1.time_ < var_30_26 + var_30_36 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_26) / var_30_36

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_26 + var_30_36 and arg_27_1.time_ < var_30_26 + var_30_36 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410201008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410201008
		arg_31_1.duration_ = 8.433

		local var_31_0 = {
			ja = 8.433,
			CriLanguages = 8.133,
			zh = 8.133
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
				arg_31_0:Play410201009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10060", 2)

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
				local var_34_6 = Vector3.New(-390, -400, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_34_7 = arg_31_1.actors_["1061"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1061 == nil then
				arg_31_1.var_.actorSpriteComps1061 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1061 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 0.5, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1061 then
				local var_34_12 = 0.5

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1061 = nil
			end

			local var_34_13 = arg_31_1.actors_["10060"]
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 and arg_31_1.var_.actorSpriteComps10060 == nil then
				arg_31_1.var_.actorSpriteComps10060 = var_34_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_15 = 0.034

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15

				if arg_31_1.var_.actorSpriteComps10060 then
					for iter_34_5, iter_34_6 in pairs(arg_31_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_34_6 then
							local var_34_17 = Mathf.Lerp(iter_34_6.color.r, 1, var_34_16)

							iter_34_6.color = Color.New(var_34_17, var_34_17, var_34_17)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 and arg_31_1.var_.actorSpriteComps10060 then
				local var_34_18 = 1

				for iter_34_7, iter_34_8 in pairs(arg_31_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_34_8 then
						iter_34_8.color = Color.New(var_34_18, var_34_18, var_34_18)
					end
				end

				arg_31_1.var_.actorSpriteComps10060 = nil
			end

			local var_34_19 = 0
			local var_34_20 = 0.925

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_21 = arg_31_1:FormatText(StoryNameCfg[597].name)

				arg_31_1.leftNameTxt_.text = var_34_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_22 = arg_31_1:GetWordFromCfg(410201008)
				local var_34_23 = arg_31_1:FormatText(var_34_22.content)

				arg_31_1.text_.text = var_34_23

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_24 = 37
				local var_34_25 = utf8.len(var_34_23)
				local var_34_26 = var_34_24 <= 0 and var_34_20 or var_34_20 * (var_34_25 / var_34_24)

				if var_34_26 > 0 and var_34_20 < var_34_26 then
					arg_31_1.talkMaxDuration = var_34_26

					if var_34_26 + var_34_19 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_26 + var_34_19
					end
				end

				arg_31_1.text_.text = var_34_23
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201008", "story_v_out_410201.awb") ~= 0 then
					local var_34_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201008", "story_v_out_410201.awb") / 1000

					if var_34_27 + var_34_19 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_27 + var_34_19
					end

					if var_34_22.prefab_name ~= "" and arg_31_1.actors_[var_34_22.prefab_name] ~= nil then
						local var_34_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_22.prefab_name].transform, "story_v_out_410201", "410201008", "story_v_out_410201.awb")

						arg_31_1:RecordAudio("410201008", var_34_28)
						arg_31_1:RecordAudio("410201008", var_34_28)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410201", "410201008", "story_v_out_410201.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410201", "410201008", "story_v_out_410201.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_29 = math.max(var_34_20, arg_31_1.talkMaxDuration)

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_29 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_19) / var_34_29

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_19 + var_34_29 and arg_31_1.time_ < var_34_19 + var_34_29 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410201009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410201009
		arg_35_1.duration_ = 3.033

		local var_35_0 = {
			ja = 2.933,
			CriLanguages = 3.033,
			zh = 3.033
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
				arg_35_0:Play410201010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1061", 4)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(390, -490, 18)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_38_7 = arg_35_1.actors_["1061"]
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 == nil then
				arg_35_1.var_.actorSpriteComps1061 = var_38_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_9 = 0.034

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_8) / var_38_9

				if arg_35_1.var_.actorSpriteComps1061 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_38_2 then
							local var_38_11 = Mathf.Lerp(iter_38_2.color.r, 1, var_38_10)

							iter_38_2.color = Color.New(var_38_11, var_38_11, var_38_11)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_8 + var_38_9 and arg_35_1.time_ < var_38_8 + var_38_9 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 then
				local var_38_12 = 1

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_12, var_38_12, var_38_12)
					end
				end

				arg_35_1.var_.actorSpriteComps1061 = nil
			end

			local var_38_13 = arg_35_1.actors_["10060"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 and arg_35_1.var_.actorSpriteComps10060 == nil then
				arg_35_1.var_.actorSpriteComps10060 = var_38_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_15 = 0.034

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15

				if arg_35_1.var_.actorSpriteComps10060 then
					for iter_38_5, iter_38_6 in pairs(arg_35_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_38_6 then
							local var_38_17 = Mathf.Lerp(iter_38_6.color.r, 0.5, var_38_16)

							iter_38_6.color = Color.New(var_38_17, var_38_17, var_38_17)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 and arg_35_1.var_.actorSpriteComps10060 then
				local var_38_18 = 0.5

				for iter_38_7, iter_38_8 in pairs(arg_35_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_38_8 then
						iter_38_8.color = Color.New(var_38_18, var_38_18, var_38_18)
					end
				end

				arg_35_1.var_.actorSpriteComps10060 = nil
			end

			local var_38_19 = 0
			local var_38_20 = 0.275

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_21 = arg_35_1:FormatText(StoryNameCfg[612].name)

				arg_35_1.leftNameTxt_.text = var_38_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_22 = arg_35_1:GetWordFromCfg(410201009)
				local var_38_23 = arg_35_1:FormatText(var_38_22.content)

				arg_35_1.text_.text = var_38_23

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_24 = 11
				local var_38_25 = utf8.len(var_38_23)
				local var_38_26 = var_38_24 <= 0 and var_38_20 or var_38_20 * (var_38_25 / var_38_24)

				if var_38_26 > 0 and var_38_20 < var_38_26 then
					arg_35_1.talkMaxDuration = var_38_26

					if var_38_26 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_26 + var_38_19
					end
				end

				arg_35_1.text_.text = var_38_23
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201009", "story_v_out_410201.awb") ~= 0 then
					local var_38_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201009", "story_v_out_410201.awb") / 1000

					if var_38_27 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_19
					end

					if var_38_22.prefab_name ~= "" and arg_35_1.actors_[var_38_22.prefab_name] ~= nil then
						local var_38_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_22.prefab_name].transform, "story_v_out_410201", "410201009", "story_v_out_410201.awb")

						arg_35_1:RecordAudio("410201009", var_38_28)
						arg_35_1:RecordAudio("410201009", var_38_28)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410201", "410201009", "story_v_out_410201.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410201", "410201009", "story_v_out_410201.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_29 = math.max(var_38_20, arg_35_1.talkMaxDuration)

			if var_38_19 <= arg_35_1.time_ and arg_35_1.time_ < var_38_19 + var_38_29 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_19) / var_38_29

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_19 + var_38_29 and arg_35_1.time_ < var_38_19 + var_38_29 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410201010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410201010
		arg_39_1.duration_ = 13.466

		local var_39_0 = {
			ja = 13.466,
			CriLanguages = 8.133,
			zh = 8.133
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
				arg_39_0:Play410201011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1061"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.actorSpriteComps1061 == nil then
				arg_39_1.var_.actorSpriteComps1061 = var_42_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_2 = 0.034

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.actorSpriteComps1061 then
					for iter_42_0, iter_42_1 in pairs(arg_39_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_42_1 then
							local var_42_4 = Mathf.Lerp(iter_42_1.color.r, 1, var_42_3)

							iter_42_1.color = Color.New(var_42_4, var_42_4, var_42_4)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.actorSpriteComps1061 then
				local var_42_5 = 1

				for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_42_3 then
						iter_42_3.color = Color.New(var_42_5, var_42_5, var_42_5)
					end
				end

				arg_39_1.var_.actorSpriteComps1061 = nil
			end

			local var_42_6 = 0
			local var_42_7 = 0.75

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[612].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(410201010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201010", "story_v_out_410201.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_410201", "410201010", "story_v_out_410201.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_410201", "410201010", "story_v_out_410201.awb")

						arg_39_1:RecordAudio("410201010", var_42_15)
						arg_39_1:RecordAudio("410201010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410201", "410201010", "story_v_out_410201.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410201", "410201010", "story_v_out_410201.awb")
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
	Play410201011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410201011
		arg_43_1.duration_ = 1.6

		local var_43_0 = {
			ja = 1.6,
			CriLanguages = 1.366,
			zh = 1.366
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
				arg_43_0:Play410201012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10060"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10060 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10060", 2)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(-390, -400, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10060, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_46_7 = arg_43_1.actors_["1061"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 == nil then
				arg_43_1.var_.actorSpriteComps1061 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps1061 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 0.5, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 then
				local var_46_12 = 0.5

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps1061 = nil
			end

			local var_46_13 = arg_43_1.actors_["10060"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps10060 == nil then
				arg_43_1.var_.actorSpriteComps10060 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps10060 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 1, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps10060 then
				local var_46_18 = 1

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps10060 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.125

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[597].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410201011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 5
				local var_46_25 = utf8.len(var_46_23)
				local var_46_26 = var_46_24 <= 0 and var_46_20 or var_46_20 * (var_46_25 / var_46_24)

				if var_46_26 > 0 and var_46_20 < var_46_26 then
					arg_43_1.talkMaxDuration = var_46_26

					if var_46_26 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_26 + var_46_19
					end
				end

				arg_43_1.text_.text = var_46_23
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201011", "story_v_out_410201.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201011", "story_v_out_410201.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410201", "410201011", "story_v_out_410201.awb")

						arg_43_1:RecordAudio("410201011", var_46_28)
						arg_43_1:RecordAudio("410201011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410201", "410201011", "story_v_out_410201.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410201", "410201011", "story_v_out_410201.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_29 = math.max(var_46_20, arg_43_1.talkMaxDuration)

			if var_46_19 <= arg_43_1.time_ and arg_43_1.time_ < var_46_19 + var_46_29 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_19) / var_46_29

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_19 + var_46_29 and arg_43_1.time_ < var_46_19 + var_46_29 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410201012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410201012
		arg_47_1.duration_ = 7.4

		local var_47_0 = {
			ja = 7.4,
			CriLanguages = 7.3,
			zh = 7.3
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
				arg_47_0:Play410201013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1061"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1061 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1061", 4)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(390, -490, 18)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1061, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_50_7 = arg_47_1.actors_["1061"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 == nil then
				arg_47_1.var_.actorSpriteComps1061 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps1061 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps1061 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps1061 = nil
			end

			local var_50_13 = arg_47_1.actors_["10060"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.actorSpriteComps10060 == nil then
				arg_47_1.var_.actorSpriteComps10060 = var_50_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_15 = 0.034

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.actorSpriteComps10060 then
					for iter_50_5, iter_50_6 in pairs(arg_47_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_50_6 then
							local var_50_17 = Mathf.Lerp(iter_50_6.color.r, 0.5, var_50_16)

							iter_50_6.color = Color.New(var_50_17, var_50_17, var_50_17)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps10060 then
				local var_50_18 = 0.5

				for iter_50_7, iter_50_8 in pairs(arg_47_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_50_8 then
						iter_50_8.color = Color.New(var_50_18, var_50_18, var_50_18)
					end
				end

				arg_47_1.var_.actorSpriteComps10060 = nil
			end

			local var_50_19 = 0
			local var_50_20 = 0.75

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[612].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(410201012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201012", "story_v_out_410201.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201012", "story_v_out_410201.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_410201", "410201012", "story_v_out_410201.awb")

						arg_47_1:RecordAudio("410201012", var_50_28)
						arg_47_1:RecordAudio("410201012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410201", "410201012", "story_v_out_410201.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410201", "410201012", "story_v_out_410201.awb")
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
	Play410201013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410201013
		arg_51_1.duration_ = 12.366

		local var_51_0 = {
			ja = 12.366,
			CriLanguages = 7.9,
			zh = 7.9
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
				arg_51_0:Play410201014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10060"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10060 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10060", 2)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(-390, -400, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10060, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_54_7 = arg_51_1.actors_["1061"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 == nil then
				arg_51_1.var_.actorSpriteComps1061 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps1061 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 0.5, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 then
				local var_54_12 = 0.5

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps1061 = nil
			end

			local var_54_13 = arg_51_1.actors_["10060"]
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 and arg_51_1.var_.actorSpriteComps10060 == nil then
				arg_51_1.var_.actorSpriteComps10060 = var_54_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_15 = 0.034

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15

				if arg_51_1.var_.actorSpriteComps10060 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_54_6 then
							local var_54_17 = Mathf.Lerp(iter_54_6.color.r, 1, var_54_16)

							iter_54_6.color = Color.New(var_54_17, var_54_17, var_54_17)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps10060 then
				local var_54_18 = 1

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_18, var_54_18, var_54_18)
					end
				end

				arg_51_1.var_.actorSpriteComps10060 = nil
			end

			local var_54_19 = 0
			local var_54_20 = 1

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_21 = arg_51_1:FormatText(StoryNameCfg[597].name)

				arg_51_1.leftNameTxt_.text = var_54_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_22 = arg_51_1:GetWordFromCfg(410201013)
				local var_54_23 = arg_51_1:FormatText(var_54_22.content)

				arg_51_1.text_.text = var_54_23

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_24 = 40
				local var_54_25 = utf8.len(var_54_23)
				local var_54_26 = var_54_24 <= 0 and var_54_20 or var_54_20 * (var_54_25 / var_54_24)

				if var_54_26 > 0 and var_54_20 < var_54_26 then
					arg_51_1.talkMaxDuration = var_54_26

					if var_54_26 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_26 + var_54_19
					end
				end

				arg_51_1.text_.text = var_54_23
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201013", "story_v_out_410201.awb") ~= 0 then
					local var_54_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201013", "story_v_out_410201.awb") / 1000

					if var_54_27 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_19
					end

					if var_54_22.prefab_name ~= "" and arg_51_1.actors_[var_54_22.prefab_name] ~= nil then
						local var_54_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_22.prefab_name].transform, "story_v_out_410201", "410201013", "story_v_out_410201.awb")

						arg_51_1:RecordAudio("410201013", var_54_28)
						arg_51_1:RecordAudio("410201013", var_54_28)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410201", "410201013", "story_v_out_410201.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410201", "410201013", "story_v_out_410201.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_29 = math.max(var_54_20, arg_51_1.talkMaxDuration)

			if var_54_19 <= arg_51_1.time_ and arg_51_1.time_ < var_54_19 + var_54_29 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_19) / var_54_29

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_19 + var_54_29 and arg_51_1.time_ < var_54_19 + var_54_29 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410201014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410201014
		arg_55_1.duration_ = 16.1

		local var_55_0 = {
			ja = 13.866,
			CriLanguages = 16.1,
			zh = 16.1
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
				arg_55_0:Play410201015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.675

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[597].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(410201014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 67
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201014", "story_v_out_410201.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_410201", "410201014", "story_v_out_410201.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_410201", "410201014", "story_v_out_410201.awb")

						arg_55_1:RecordAudio("410201014", var_58_9)
						arg_55_1:RecordAudio("410201014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410201", "410201014", "story_v_out_410201.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410201", "410201014", "story_v_out_410201.awb")
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
	Play410201015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410201015
		arg_59_1.duration_ = 6.166

		local var_59_0 = {
			ja = 6.166,
			CriLanguages = 2.766,
			zh = 2.766
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
				arg_59_0:Play410201016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10060"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos10060 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10060", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_3" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(-390, -400, 0)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10060, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_62_7 = arg_59_1.actors_["10060"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps10060 == nil then
				arg_59_1.var_.actorSpriteComps10060 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.034

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps10060 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps10060 then
				local var_62_12 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps10060 = nil
			end

			local var_62_13 = 0
			local var_62_14 = 0.3

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_15 = arg_59_1:FormatText(StoryNameCfg[597].name)

				arg_59_1.leftNameTxt_.text = var_62_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_16 = arg_59_1:GetWordFromCfg(410201015)
				local var_62_17 = arg_59_1:FormatText(var_62_16.content)

				arg_59_1.text_.text = var_62_17

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_18 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201015", "story_v_out_410201.awb") ~= 0 then
					local var_62_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201015", "story_v_out_410201.awb") / 1000

					if var_62_21 + var_62_13 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_21 + var_62_13
					end

					if var_62_16.prefab_name ~= "" and arg_59_1.actors_[var_62_16.prefab_name] ~= nil then
						local var_62_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_16.prefab_name].transform, "story_v_out_410201", "410201015", "story_v_out_410201.awb")

						arg_59_1:RecordAudio("410201015", var_62_22)
						arg_59_1:RecordAudio("410201015", var_62_22)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410201", "410201015", "story_v_out_410201.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410201", "410201015", "story_v_out_410201.awb")
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
	Play410201016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410201016
		arg_63_1.duration_ = 16.2

		local var_63_0 = {
			ja = 16.2,
			CriLanguages = 8.333,
			zh = 8.333
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
				arg_63_0:Play410201017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1061"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1061 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("1061", 4)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "split_5" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(390, -490, 18)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1061, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_66_7 = arg_63_1.actors_["1061"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps1061 == nil then
				arg_63_1.var_.actorSpriteComps1061 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.034

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps1061 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 1, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps1061 then
				local var_66_12 = 1

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps1061 = nil
			end

			local var_66_13 = arg_63_1.actors_["10060"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.actorSpriteComps10060 == nil then
				arg_63_1.var_.actorSpriteComps10060 = var_66_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_15 = 0.034

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.actorSpriteComps10060 then
					for iter_66_5, iter_66_6 in pairs(arg_63_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_66_6 then
							local var_66_17 = Mathf.Lerp(iter_66_6.color.r, 0.5, var_66_16)

							iter_66_6.color = Color.New(var_66_17, var_66_17, var_66_17)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps10060 then
				local var_66_18 = 0.5

				for iter_66_7, iter_66_8 in pairs(arg_63_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_66_8 then
						iter_66_8.color = Color.New(var_66_18, var_66_18, var_66_18)
					end
				end

				arg_63_1.var_.actorSpriteComps10060 = nil
			end

			local var_66_19 = 0
			local var_66_20 = 0.675

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_21 = arg_63_1:FormatText(StoryNameCfg[612].name)

				arg_63_1.leftNameTxt_.text = var_66_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_22 = arg_63_1:GetWordFromCfg(410201016)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 27
				local var_66_25 = utf8.len(var_66_23)
				local var_66_26 = var_66_24 <= 0 and var_66_20 or var_66_20 * (var_66_25 / var_66_24)

				if var_66_26 > 0 and var_66_20 < var_66_26 then
					arg_63_1.talkMaxDuration = var_66_26

					if var_66_26 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_26 + var_66_19
					end
				end

				arg_63_1.text_.text = var_66_23
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201016", "story_v_out_410201.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201016", "story_v_out_410201.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_410201", "410201016", "story_v_out_410201.awb")

						arg_63_1:RecordAudio("410201016", var_66_28)
						arg_63_1:RecordAudio("410201016", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410201", "410201016", "story_v_out_410201.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410201", "410201016", "story_v_out_410201.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_29 = math.max(var_66_20, arg_63_1.talkMaxDuration)

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_29 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_19) / var_66_29

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_19 + var_66_29 and arg_63_1.time_ < var_66_19 + var_66_29 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410201017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410201017
		arg_67_1.duration_ = 8.466

		local var_67_0 = {
			ja = 6.2,
			CriLanguages = 8.466,
			zh = 8.466
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
				arg_67_0:Play410201018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10060"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos10060 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("10060", 2)

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
				local var_70_6 = Vector3.New(-390, -400, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10060, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_70_7 = arg_67_1.actors_["1061"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1061 == nil then
				arg_67_1.var_.actorSpriteComps1061 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps1061 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 0.5, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps1061 then
				local var_70_12 = 0.5

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps1061 = nil
			end

			local var_70_13 = arg_67_1.actors_["10060"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.actorSpriteComps10060 == nil then
				arg_67_1.var_.actorSpriteComps10060 = var_70_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_15 = 0.034

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.actorSpriteComps10060 then
					for iter_70_5, iter_70_6 in pairs(arg_67_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_70_6 then
							local var_70_17 = Mathf.Lerp(iter_70_6.color.r, 1, var_70_16)

							iter_70_6.color = Color.New(var_70_17, var_70_17, var_70_17)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.actorSpriteComps10060 then
				local var_70_18 = 1

				for iter_70_7, iter_70_8 in pairs(arg_67_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_70_8 then
						iter_70_8.color = Color.New(var_70_18, var_70_18, var_70_18)
					end
				end

				arg_67_1.var_.actorSpriteComps10060 = nil
			end

			local var_70_19 = 0
			local var_70_20 = 0.6

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[597].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(410201017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 24
				local var_70_25 = utf8.len(var_70_23)
				local var_70_26 = var_70_24 <= 0 and var_70_20 or var_70_20 * (var_70_25 / var_70_24)

				if var_70_26 > 0 and var_70_20 < var_70_26 then
					arg_67_1.talkMaxDuration = var_70_26

					if var_70_26 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_26 + var_70_19
					end
				end

				arg_67_1.text_.text = var_70_23
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201017", "story_v_out_410201.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201017", "story_v_out_410201.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_410201", "410201017", "story_v_out_410201.awb")

						arg_67_1:RecordAudio("410201017", var_70_28)
						arg_67_1:RecordAudio("410201017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410201", "410201017", "story_v_out_410201.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410201", "410201017", "story_v_out_410201.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_29 = math.max(var_70_20, arg_67_1.talkMaxDuration)

			if var_70_19 <= arg_67_1.time_ and arg_67_1.time_ < var_70_19 + var_70_29 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_19) / var_70_29

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_19 + var_70_29 and arg_67_1.time_ < var_70_19 + var_70_29 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410201018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410201018
		arg_71_1.duration_ = 15.466

		local var_71_0 = {
			ja = 15.466,
			CriLanguages = 14.7,
			zh = 14.7
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
				arg_71_0:Play410201019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1061"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1061 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1061", 4)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_5" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(390, -490, 18)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1061, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_74_7 = arg_71_1.actors_["1061"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1061 == nil then
				arg_71_1.var_.actorSpriteComps1061 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1061 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1061 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1061 = nil
			end

			local var_74_13 = arg_71_1.actors_["10060"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 and arg_71_1.var_.actorSpriteComps10060 == nil then
				arg_71_1.var_.actorSpriteComps10060 = var_74_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_15 = 0.034

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_15 then
				local var_74_16 = (arg_71_1.time_ - var_74_14) / var_74_15

				if arg_71_1.var_.actorSpriteComps10060 then
					for iter_74_5, iter_74_6 in pairs(arg_71_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_74_6 then
							local var_74_17 = Mathf.Lerp(iter_74_6.color.r, 0.5, var_74_16)

							iter_74_6.color = Color.New(var_74_17, var_74_17, var_74_17)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 and arg_71_1.var_.actorSpriteComps10060 then
				local var_74_18 = 0.5

				for iter_74_7, iter_74_8 in pairs(arg_71_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_74_8 then
						iter_74_8.color = Color.New(var_74_18, var_74_18, var_74_18)
					end
				end

				arg_71_1.var_.actorSpriteComps10060 = nil
			end

			local var_74_19 = 0
			local var_74_20 = 1.425

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_21 = arg_71_1:FormatText(StoryNameCfg[612].name)

				arg_71_1.leftNameTxt_.text = var_74_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_22 = arg_71_1:GetWordFromCfg(410201018)
				local var_74_23 = arg_71_1:FormatText(var_74_22.content)

				arg_71_1.text_.text = var_74_23

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_24 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201018", "story_v_out_410201.awb") ~= 0 then
					local var_74_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201018", "story_v_out_410201.awb") / 1000

					if var_74_27 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_27 + var_74_19
					end

					if var_74_22.prefab_name ~= "" and arg_71_1.actors_[var_74_22.prefab_name] ~= nil then
						local var_74_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_22.prefab_name].transform, "story_v_out_410201", "410201018", "story_v_out_410201.awb")

						arg_71_1:RecordAudio("410201018", var_74_28)
						arg_71_1:RecordAudio("410201018", var_74_28)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410201", "410201018", "story_v_out_410201.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410201", "410201018", "story_v_out_410201.awb")
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
	Play410201019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410201019
		arg_75_1.duration_ = 3.066

		local var_75_0 = {
			ja = 3.066,
			CriLanguages = 1.833,
			zh = 1.833
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
				arg_75_0:Play410201020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10060"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10060 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10060", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_5" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -400, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10060, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_78_7 = arg_75_1.actors_["1061"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 == nil then
				arg_75_1.var_.actorSpriteComps1061 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps1061 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 0.5, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 then
				local var_78_12 = 0.5

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps1061 = nil
			end

			local var_78_13 = arg_75_1.actors_["10060"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps10060 == nil then
				arg_75_1.var_.actorSpriteComps10060 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps10060 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 1, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps10060 then
				local var_78_18 = 1

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps10060 = nil
			end

			local var_78_19 = 0
			local var_78_20 = 0.275

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_21 = arg_75_1:FormatText(StoryNameCfg[597].name)

				arg_75_1.leftNameTxt_.text = var_78_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_22 = arg_75_1:GetWordFromCfg(410201019)
				local var_78_23 = arg_75_1:FormatText(var_78_22.content)

				arg_75_1.text_.text = var_78_23

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_24 = 11
				local var_78_25 = utf8.len(var_78_23)
				local var_78_26 = var_78_24 <= 0 and var_78_20 or var_78_20 * (var_78_25 / var_78_24)

				if var_78_26 > 0 and var_78_20 < var_78_26 then
					arg_75_1.talkMaxDuration = var_78_26

					if var_78_26 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_26 + var_78_19
					end
				end

				arg_75_1.text_.text = var_78_23
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201019", "story_v_out_410201.awb") ~= 0 then
					local var_78_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201019", "story_v_out_410201.awb") / 1000

					if var_78_27 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_19
					end

					if var_78_22.prefab_name ~= "" and arg_75_1.actors_[var_78_22.prefab_name] ~= nil then
						local var_78_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_22.prefab_name].transform, "story_v_out_410201", "410201019", "story_v_out_410201.awb")

						arg_75_1:RecordAudio("410201019", var_78_28)
						arg_75_1:RecordAudio("410201019", var_78_28)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410201", "410201019", "story_v_out_410201.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410201", "410201019", "story_v_out_410201.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_29 = math.max(var_78_20, arg_75_1.talkMaxDuration)

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_29 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_19) / var_78_29

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_19 + var_78_29 and arg_75_1.time_ < var_78_19 + var_78_29 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410201020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410201020
		arg_79_1.duration_ = 5.666

		local var_79_0 = {
			ja = 5.666,
			CriLanguages = 4.6,
			zh = 4.6
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
				arg_79_0:Play410201021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1061"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1061 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1061", 4)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(390, -490, 18)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1061, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_82_7 = arg_79_1.actors_["1061"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1061 == nil then
				arg_79_1.var_.actorSpriteComps1061 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.034

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps1061 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps1061 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps1061 = nil
			end

			local var_82_13 = arg_79_1.actors_["10060"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.actorSpriteComps10060 == nil then
				arg_79_1.var_.actorSpriteComps10060 = var_82_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_15 = 0.034

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.actorSpriteComps10060 then
					for iter_82_5, iter_82_6 in pairs(arg_79_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_82_6 then
							local var_82_17 = Mathf.Lerp(iter_82_6.color.r, 0.5, var_82_16)

							iter_82_6.color = Color.New(var_82_17, var_82_17, var_82_17)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.actorSpriteComps10060 then
				local var_82_18 = 0.5

				for iter_82_7, iter_82_8 in pairs(arg_79_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_82_8 then
						iter_82_8.color = Color.New(var_82_18, var_82_18, var_82_18)
					end
				end

				arg_79_1.var_.actorSpriteComps10060 = nil
			end

			local var_82_19 = 0
			local var_82_20 = 0.625

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[612].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(410201020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 25
				local var_82_25 = utf8.len(var_82_23)
				local var_82_26 = var_82_24 <= 0 and var_82_20 or var_82_20 * (var_82_25 / var_82_24)

				if var_82_26 > 0 and var_82_20 < var_82_26 then
					arg_79_1.talkMaxDuration = var_82_26

					if var_82_26 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_26 + var_82_19
					end
				end

				arg_79_1.text_.text = var_82_23
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201020", "story_v_out_410201.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201020", "story_v_out_410201.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_410201", "410201020", "story_v_out_410201.awb")

						arg_79_1:RecordAudio("410201020", var_82_28)
						arg_79_1:RecordAudio("410201020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410201", "410201020", "story_v_out_410201.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410201", "410201020", "story_v_out_410201.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_29 = math.max(var_82_20, arg_79_1.talkMaxDuration)

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_29 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_19) / var_82_29

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_19 + var_82_29 and arg_79_1.time_ < var_82_19 + var_82_29 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play410201021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410201021
		arg_83_1.duration_ = 10.166

		local var_83_0 = {
			ja = 10.166,
			CriLanguages = 5.4,
			zh = 5.4
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
				arg_83_0:Play410201022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1061"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1061 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1061", 4)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(390, -490, 18)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1061, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_86_7 = arg_83_1.actors_["1061"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1061 == nil then
				arg_83_1.var_.actorSpriteComps1061 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps1061 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps1061 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps1061 = nil
			end

			local var_86_13 = 0
			local var_86_14 = 0.625

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_15 = arg_83_1:FormatText(StoryNameCfg[612].name)

				arg_83_1.leftNameTxt_.text = var_86_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_16 = arg_83_1:GetWordFromCfg(410201021)
				local var_86_17 = arg_83_1:FormatText(var_86_16.content)

				arg_83_1.text_.text = var_86_17

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_18 = 25
				local var_86_19 = utf8.len(var_86_17)
				local var_86_20 = var_86_18 <= 0 and var_86_14 or var_86_14 * (var_86_19 / var_86_18)

				if var_86_20 > 0 and var_86_14 < var_86_20 then
					arg_83_1.talkMaxDuration = var_86_20

					if var_86_20 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_13
					end
				end

				arg_83_1.text_.text = var_86_17
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201021", "story_v_out_410201.awb") ~= 0 then
					local var_86_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201021", "story_v_out_410201.awb") / 1000

					if var_86_21 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_13
					end

					if var_86_16.prefab_name ~= "" and arg_83_1.actors_[var_86_16.prefab_name] ~= nil then
						local var_86_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_16.prefab_name].transform, "story_v_out_410201", "410201021", "story_v_out_410201.awb")

						arg_83_1:RecordAudio("410201021", var_86_22)
						arg_83_1:RecordAudio("410201021", var_86_22)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410201", "410201021", "story_v_out_410201.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410201", "410201021", "story_v_out_410201.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_23 = math.max(var_86_14, arg_83_1.talkMaxDuration)

			if var_86_13 <= arg_83_1.time_ and arg_83_1.time_ < var_86_13 + var_86_23 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_13) / var_86_23

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_13 + var_86_23 and arg_83_1.time_ < var_86_13 + var_86_23 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410201022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410201022
		arg_87_1.duration_ = 3.833

		local var_87_0 = {
			ja = 3.833,
			CriLanguages = 1.533,
			zh = 1.533
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
				arg_87_0:Play410201023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10060"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10060 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("10060", 2)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(-390, -400, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10060, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_90_7 = arg_87_1.actors_["1061"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 == nil then
				arg_87_1.var_.actorSpriteComps1061 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps1061 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 0.5, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 then
				local var_90_12 = 0.5

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps1061 = nil
			end

			local var_90_13 = arg_87_1.actors_["10060"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps10060 == nil then
				arg_87_1.var_.actorSpriteComps10060 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps10060 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 1, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps10060 then
				local var_90_18 = 1

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps10060 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 0.225

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[597].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410201022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 9
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_20 or var_90_20 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_20 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201022", "story_v_out_410201.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201022", "story_v_out_410201.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410201", "410201022", "story_v_out_410201.awb")

						arg_87_1:RecordAudio("410201022", var_90_28)
						arg_87_1:RecordAudio("410201022", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410201", "410201022", "story_v_out_410201.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410201", "410201022", "story_v_out_410201.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_29 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_29 and arg_87_1.time_ < var_90_19 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410201023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410201023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play410201024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1061"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1061 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1061", 7)

				local var_94_2 = var_94_0.childCount

				for iter_94_0 = 0, var_94_2 - 1 do
					local var_94_3 = var_94_0:GetChild(iter_94_0)

					if var_94_3.name == "" or not string.find(var_94_3.name, "split") then
						var_94_3.gameObject:SetActive(true)
					else
						var_94_3.gameObject:SetActive(false)
					end
				end
			end

			local var_94_4 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_1) / var_94_4
				local var_94_6 = Vector3.New(0, -2000, 18)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1061, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_94_7 = arg_91_1.actors_["10060"].transform
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 then
				arg_91_1.var_.moveOldPos10060 = var_94_7.localPosition
				var_94_7.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("10060", 7)

				local var_94_9 = var_94_7.childCount

				for iter_94_1 = 0, var_94_9 - 1 do
					local var_94_10 = var_94_7:GetChild(iter_94_1)

					if var_94_10.name == "" or not string.find(var_94_10.name, "split") then
						var_94_10.gameObject:SetActive(true)
					else
						var_94_10.gameObject:SetActive(false)
					end
				end
			end

			local var_94_11 = 0.001

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_8) / var_94_11
				local var_94_13 = Vector3.New(0, -2000, 0)

				var_94_7.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10060, var_94_13, var_94_12)
			end

			if arg_91_1.time_ >= var_94_8 + var_94_11 and arg_91_1.time_ < var_94_8 + var_94_11 + arg_94_0 then
				var_94_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_94_14 = 0
			local var_94_15 = 1.275

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_16 = arg_91_1:GetWordFromCfg(410201023)
				local var_94_17 = arg_91_1:FormatText(var_94_16.content)

				arg_91_1.text_.text = var_94_17

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_18 = 51
				local var_94_19 = utf8.len(var_94_17)
				local var_94_20 = var_94_18 <= 0 and var_94_15 or var_94_15 * (var_94_19 / var_94_18)

				if var_94_20 > 0 and var_94_15 < var_94_20 then
					arg_91_1.talkMaxDuration = var_94_20

					if var_94_20 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_14
					end
				end

				arg_91_1.text_.text = var_94_17
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_21 = math.max(var_94_15, arg_91_1.talkMaxDuration)

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_21 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_14) / var_94_21

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_14 + var_94_21 and arg_91_1.time_ < var_94_14 + var_94_21 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410201024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410201024
		arg_95_1.duration_ = 9.1

		local var_95_0 = {
			ja = 9.1,
			CriLanguages = 5.066,
			zh = 5.066
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
				arg_95_0:Play410201025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10060"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10060 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10060", 2)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_4" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(-390, -400, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10060, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_98_7 = arg_95_1.actors_["10060"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps10060 == nil then
				arg_95_1.var_.actorSpriteComps10060 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps10060 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps10060 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps10060 = nil
			end

			local var_98_13 = arg_95_1.actors_["1061"].transform
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1.var_.moveOldPos1061 = var_98_13.localPosition
				var_98_13.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1061", 4)

				local var_98_15 = var_98_13.childCount

				for iter_98_5 = 0, var_98_15 - 1 do
					local var_98_16 = var_98_13:GetChild(iter_98_5)

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
				local var_98_19 = Vector3.New(390, -490, 18)

				var_98_13.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1061, var_98_19, var_98_18)
			end

			if arg_95_1.time_ >= var_98_14 + var_98_17 and arg_95_1.time_ < var_98_14 + var_98_17 + arg_98_0 then
				var_98_13.localPosition = Vector3.New(390, -490, 18)
			end

			local var_98_20 = arg_95_1.actors_["1061"]
			local var_98_21 = 0

			if var_98_21 < arg_95_1.time_ and arg_95_1.time_ <= var_98_21 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 == nil then
				arg_95_1.var_.actorSpriteComps1061 = var_98_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_22 = 0.034

			if var_98_21 <= arg_95_1.time_ and arg_95_1.time_ < var_98_21 + var_98_22 then
				local var_98_23 = (arg_95_1.time_ - var_98_21) / var_98_22

				if arg_95_1.var_.actorSpriteComps1061 then
					for iter_98_6, iter_98_7 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_98_7 then
							local var_98_24 = Mathf.Lerp(iter_98_7.color.r, 0.5, var_98_23)

							iter_98_7.color = Color.New(var_98_24, var_98_24, var_98_24)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_21 + var_98_22 and arg_95_1.time_ < var_98_21 + var_98_22 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 then
				local var_98_25 = 0.5

				for iter_98_8, iter_98_9 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_98_9 then
						iter_98_9.color = Color.New(var_98_25, var_98_25, var_98_25)
					end
				end

				arg_95_1.var_.actorSpriteComps1061 = nil
			end

			local var_98_26 = 0
			local var_98_27 = 0.675

			if var_98_26 < arg_95_1.time_ and arg_95_1.time_ <= var_98_26 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_28 = arg_95_1:FormatText(StoryNameCfg[597].name)

				arg_95_1.leftNameTxt_.text = var_98_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_29 = arg_95_1:GetWordFromCfg(410201024)
				local var_98_30 = arg_95_1:FormatText(var_98_29.content)

				arg_95_1.text_.text = var_98_30

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_31 = 27
				local var_98_32 = utf8.len(var_98_30)
				local var_98_33 = var_98_31 <= 0 and var_98_27 or var_98_27 * (var_98_32 / var_98_31)

				if var_98_33 > 0 and var_98_27 < var_98_33 then
					arg_95_1.talkMaxDuration = var_98_33

					if var_98_33 + var_98_26 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_33 + var_98_26
					end
				end

				arg_95_1.text_.text = var_98_30
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201024", "story_v_out_410201.awb") ~= 0 then
					local var_98_34 = manager.audio:GetVoiceLength("story_v_out_410201", "410201024", "story_v_out_410201.awb") / 1000

					if var_98_34 + var_98_26 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_34 + var_98_26
					end

					if var_98_29.prefab_name ~= "" and arg_95_1.actors_[var_98_29.prefab_name] ~= nil then
						local var_98_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_29.prefab_name].transform, "story_v_out_410201", "410201024", "story_v_out_410201.awb")

						arg_95_1:RecordAudio("410201024", var_98_35)
						arg_95_1:RecordAudio("410201024", var_98_35)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410201", "410201024", "story_v_out_410201.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410201", "410201024", "story_v_out_410201.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_36 = math.max(var_98_27, arg_95_1.talkMaxDuration)

			if var_98_26 <= arg_95_1.time_ and arg_95_1.time_ < var_98_26 + var_98_36 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_26) / var_98_36

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_26 + var_98_36 and arg_95_1.time_ < var_98_26 + var_98_36 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410201025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410201025
		arg_99_1.duration_ = 8.033

		local var_99_0 = {
			ja = 8.033,
			CriLanguages = 2.133,
			zh = 2.133
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
				arg_99_0:Play410201026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1061"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1061 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1061", 4)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(390, -490, 18)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1061, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_102_7 = arg_99_1.actors_["10060"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps10060 == nil then
				arg_99_1.var_.actorSpriteComps10060 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.034

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps10060 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 0.5, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps10060 then
				local var_102_12 = 0.5

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps10060 = nil
			end

			local var_102_13 = arg_99_1.actors_["1061"]
			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 and arg_99_1.var_.actorSpriteComps1061 == nil then
				arg_99_1.var_.actorSpriteComps1061 = var_102_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_15 = 0.034

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15

				if arg_99_1.var_.actorSpriteComps1061 then
					for iter_102_5, iter_102_6 in pairs(arg_99_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_102_6 then
							local var_102_17 = Mathf.Lerp(iter_102_6.color.r, 1, var_102_16)

							iter_102_6.color = Color.New(var_102_17, var_102_17, var_102_17)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 and arg_99_1.var_.actorSpriteComps1061 then
				local var_102_18 = 1

				for iter_102_7, iter_102_8 in pairs(arg_99_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_102_8 then
						iter_102_8.color = Color.New(var_102_18, var_102_18, var_102_18)
					end
				end

				arg_99_1.var_.actorSpriteComps1061 = nil
			end

			local var_102_19 = 0
			local var_102_20 = 0.225

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[612].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(410201025)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 9
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201025", "story_v_out_410201.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201025", "story_v_out_410201.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_410201", "410201025", "story_v_out_410201.awb")

						arg_99_1:RecordAudio("410201025", var_102_28)
						arg_99_1:RecordAudio("410201025", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410201", "410201025", "story_v_out_410201.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410201", "410201025", "story_v_out_410201.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410201026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410201026
		arg_103_1.duration_ = 17.433

		local var_103_0 = {
			ja = 17.433,
			CriLanguages = 14.166,
			zh = 14.166
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
				arg_103_0:Play410201027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10060"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10060 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("10060", 2)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(-390, -400, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10060, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_106_7 = arg_103_1.actors_["10060"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps10060 == nil then
				arg_103_1.var_.actorSpriteComps10060 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.034

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps10060 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps10060 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps10060 = nil
			end

			local var_106_13 = arg_103_1.actors_["1061"]
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 and arg_103_1.var_.actorSpriteComps1061 == nil then
				arg_103_1.var_.actorSpriteComps1061 = var_106_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_15 = 0.034

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15

				if arg_103_1.var_.actorSpriteComps1061 then
					for iter_106_5, iter_106_6 in pairs(arg_103_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_106_6 then
							local var_106_17 = Mathf.Lerp(iter_106_6.color.r, 0.5, var_106_16)

							iter_106_6.color = Color.New(var_106_17, var_106_17, var_106_17)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 and arg_103_1.var_.actorSpriteComps1061 then
				local var_106_18 = 0.5

				for iter_106_7, iter_106_8 in pairs(arg_103_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_106_8 then
						iter_106_8.color = Color.New(var_106_18, var_106_18, var_106_18)
					end
				end

				arg_103_1.var_.actorSpriteComps1061 = nil
			end

			local var_106_19 = 0
			local var_106_20 = 1.3

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_21 = arg_103_1:FormatText(StoryNameCfg[597].name)

				arg_103_1.leftNameTxt_.text = var_106_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_22 = arg_103_1:GetWordFromCfg(410201026)
				local var_106_23 = arg_103_1:FormatText(var_106_22.content)

				arg_103_1.text_.text = var_106_23

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_24 = 52
				local var_106_25 = utf8.len(var_106_23)
				local var_106_26 = var_106_24 <= 0 and var_106_20 or var_106_20 * (var_106_25 / var_106_24)

				if var_106_26 > 0 and var_106_20 < var_106_26 then
					arg_103_1.talkMaxDuration = var_106_26

					if var_106_26 + var_106_19 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_26 + var_106_19
					end
				end

				arg_103_1.text_.text = var_106_23
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201026", "story_v_out_410201.awb") ~= 0 then
					local var_106_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201026", "story_v_out_410201.awb") / 1000

					if var_106_27 + var_106_19 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_27 + var_106_19
					end

					if var_106_22.prefab_name ~= "" and arg_103_1.actors_[var_106_22.prefab_name] ~= nil then
						local var_106_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_22.prefab_name].transform, "story_v_out_410201", "410201026", "story_v_out_410201.awb")

						arg_103_1:RecordAudio("410201026", var_106_28)
						arg_103_1:RecordAudio("410201026", var_106_28)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410201", "410201026", "story_v_out_410201.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410201", "410201026", "story_v_out_410201.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_29 = math.max(var_106_20, arg_103_1.talkMaxDuration)

			if var_106_19 <= arg_103_1.time_ and arg_103_1.time_ < var_106_19 + var_106_29 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_19) / var_106_29

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_19 + var_106_29 and arg_103_1.time_ < var_106_19 + var_106_29 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410201027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410201027
		arg_107_1.duration_ = 3.5

		local var_107_0 = {
			ja = 3.5,
			CriLanguages = 1.4,
			zh = 1.4
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
				arg_107_0:Play410201028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1061"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1061 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1061", 4)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_9" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(390, -490, 18)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1061, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_110_7 = arg_107_1.actors_["10060"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps10060 == nil then
				arg_107_1.var_.actorSpriteComps10060 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.034

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps10060 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 0.5, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps10060 then
				local var_110_12 = 0.5

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps10060 = nil
			end

			local var_110_13 = arg_107_1.actors_["1061"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 == nil then
				arg_107_1.var_.actorSpriteComps1061 = var_110_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_15 = 0.034

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.actorSpriteComps1061 then
					for iter_110_5, iter_110_6 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_110_6 then
							local var_110_17 = Mathf.Lerp(iter_110_6.color.r, 1, var_110_16)

							iter_110_6.color = Color.New(var_110_17, var_110_17, var_110_17)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 then
				local var_110_18 = 1

				for iter_110_7, iter_110_8 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_110_8 then
						iter_110_8.color = Color.New(var_110_18, var_110_18, var_110_18)
					end
				end

				arg_107_1.var_.actorSpriteComps1061 = nil
			end

			local var_110_19 = 0
			local var_110_20 = 0.125

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[612].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(410201027)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 5
				local var_110_25 = utf8.len(var_110_23)
				local var_110_26 = var_110_24 <= 0 and var_110_20 or var_110_20 * (var_110_25 / var_110_24)

				if var_110_26 > 0 and var_110_20 < var_110_26 then
					arg_107_1.talkMaxDuration = var_110_26

					if var_110_26 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_26 + var_110_19
					end
				end

				arg_107_1.text_.text = var_110_23
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201027", "story_v_out_410201.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201027", "story_v_out_410201.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_410201", "410201027", "story_v_out_410201.awb")

						arg_107_1:RecordAudio("410201027", var_110_28)
						arg_107_1:RecordAudio("410201027", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410201", "410201027", "story_v_out_410201.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410201", "410201027", "story_v_out_410201.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_29 = math.max(var_110_20, arg_107_1.talkMaxDuration)

			if var_110_19 <= arg_107_1.time_ and arg_107_1.time_ < var_110_19 + var_110_29 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_19) / var_110_29

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_19 + var_110_29 and arg_107_1.time_ < var_110_19 + var_110_29 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410201028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410201028
		arg_111_1.duration_ = 17.266

		local var_111_0 = {
			ja = 17.266,
			CriLanguages = 12.1,
			zh = 12.1
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
				arg_111_0:Play410201029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10060"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos10060 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("10060", 2)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(-390, -400, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10060, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_114_7 = arg_111_1.actors_["10060"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps10060 == nil then
				arg_111_1.var_.actorSpriteComps10060 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps10060 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps10060 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps10060 = nil
			end

			local var_114_13 = arg_111_1.actors_["1061"]
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 and arg_111_1.var_.actorSpriteComps1061 == nil then
				arg_111_1.var_.actorSpriteComps1061 = var_114_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_15 = 0.034

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15

				if arg_111_1.var_.actorSpriteComps1061 then
					for iter_114_5, iter_114_6 in pairs(arg_111_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_114_6 then
							local var_114_17 = Mathf.Lerp(iter_114_6.color.r, 0.5, var_114_16)

							iter_114_6.color = Color.New(var_114_17, var_114_17, var_114_17)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 and arg_111_1.var_.actorSpriteComps1061 then
				local var_114_18 = 0.5

				for iter_114_7, iter_114_8 in pairs(arg_111_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_114_8 then
						iter_114_8.color = Color.New(var_114_18, var_114_18, var_114_18)
					end
				end

				arg_111_1.var_.actorSpriteComps1061 = nil
			end

			local var_114_19 = 0
			local var_114_20 = 1.375

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[597].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(410201028)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 55
				local var_114_25 = utf8.len(var_114_23)
				local var_114_26 = var_114_24 <= 0 and var_114_20 or var_114_20 * (var_114_25 / var_114_24)

				if var_114_26 > 0 and var_114_20 < var_114_26 then
					arg_111_1.talkMaxDuration = var_114_26

					if var_114_26 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_26 + var_114_19
					end
				end

				arg_111_1.text_.text = var_114_23
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201028", "story_v_out_410201.awb") ~= 0 then
					local var_114_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201028", "story_v_out_410201.awb") / 1000

					if var_114_27 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_27 + var_114_19
					end

					if var_114_22.prefab_name ~= "" and arg_111_1.actors_[var_114_22.prefab_name] ~= nil then
						local var_114_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_22.prefab_name].transform, "story_v_out_410201", "410201028", "story_v_out_410201.awb")

						arg_111_1:RecordAudio("410201028", var_114_28)
						arg_111_1:RecordAudio("410201028", var_114_28)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410201", "410201028", "story_v_out_410201.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410201", "410201028", "story_v_out_410201.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_29 = math.max(var_114_20, arg_111_1.talkMaxDuration)

			if var_114_19 <= arg_111_1.time_ and arg_111_1.time_ < var_114_19 + var_114_29 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_19) / var_114_29

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_19 + var_114_29 and arg_111_1.time_ < var_114_19 + var_114_29 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410201029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410201029
		arg_115_1.duration_ = 11.066

		local var_115_0 = {
			ja = 11.033,
			CriLanguages = 11.066,
			zh = 11.066
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
				arg_115_0:Play410201030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1.025

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[597].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(410201029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 41
				local var_118_6 = utf8.len(var_118_4)
				local var_118_7 = var_118_5 <= 0 and var_118_1 or var_118_1 * (var_118_6 / var_118_5)

				if var_118_7 > 0 and var_118_1 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_4
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201029", "story_v_out_410201.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_410201", "410201029", "story_v_out_410201.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_410201", "410201029", "story_v_out_410201.awb")

						arg_115_1:RecordAudio("410201029", var_118_9)
						arg_115_1:RecordAudio("410201029", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410201", "410201029", "story_v_out_410201.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410201", "410201029", "story_v_out_410201.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_10 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_10 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_10

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_10 and arg_115_1.time_ < var_118_0 + var_118_10 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410201030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410201030
		arg_119_1.duration_ = 10.566

		local var_119_0 = {
			ja = 9.766,
			CriLanguages = 10.566,
			zh = 10.566
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
				arg_119_0:Play410201031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10060"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10060 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("10060", 2)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(-390, -400, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10060, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_122_7 = arg_119_1.actors_["10060"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10060 == nil then
				arg_119_1.var_.actorSpriteComps10060 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps10060 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps10060 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps10060 = nil
			end

			local var_122_13 = 0
			local var_122_14 = 0.8

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_15 = arg_119_1:FormatText(StoryNameCfg[597].name)

				arg_119_1.leftNameTxt_.text = var_122_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_16 = arg_119_1:GetWordFromCfg(410201030)
				local var_122_17 = arg_119_1:FormatText(var_122_16.content)

				arg_119_1.text_.text = var_122_17

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_18 = 32
				local var_122_19 = utf8.len(var_122_17)
				local var_122_20 = var_122_18 <= 0 and var_122_14 or var_122_14 * (var_122_19 / var_122_18)

				if var_122_20 > 0 and var_122_14 < var_122_20 then
					arg_119_1.talkMaxDuration = var_122_20

					if var_122_20 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_13
					end
				end

				arg_119_1.text_.text = var_122_17
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201030", "story_v_out_410201.awb") ~= 0 then
					local var_122_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201030", "story_v_out_410201.awb") / 1000

					if var_122_21 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_13
					end

					if var_122_16.prefab_name ~= "" and arg_119_1.actors_[var_122_16.prefab_name] ~= nil then
						local var_122_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_16.prefab_name].transform, "story_v_out_410201", "410201030", "story_v_out_410201.awb")

						arg_119_1:RecordAudio("410201030", var_122_22)
						arg_119_1:RecordAudio("410201030", var_122_22)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410201", "410201030", "story_v_out_410201.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410201", "410201030", "story_v_out_410201.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_23 = math.max(var_122_14, arg_119_1.talkMaxDuration)

			if var_122_13 <= arg_119_1.time_ and arg_119_1.time_ < var_122_13 + var_122_23 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_13) / var_122_23

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_13 + var_122_23 and arg_119_1.time_ < var_122_13 + var_122_23 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410201031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410201031
		arg_123_1.duration_ = 13.866

		local var_123_0 = {
			ja = 13.866,
			CriLanguages = 6.9,
			zh = 6.9
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
				arg_123_0:Play410201032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1061"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1061 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1061", 4)

				local var_126_2 = var_126_0.childCount

				for iter_126_0 = 0, var_126_2 - 1 do
					local var_126_3 = var_126_0:GetChild(iter_126_0)

					if var_126_3.name == "" or not string.find(var_126_3.name, "split") then
						var_126_3.gameObject:SetActive(true)
					else
						var_126_3.gameObject:SetActive(false)
					end
				end
			end

			local var_126_4 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_4 then
				local var_126_5 = (arg_123_1.time_ - var_126_1) / var_126_4
				local var_126_6 = Vector3.New(390, -490, 18)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1061, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_126_7 = arg_123_1.actors_["1061"]
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 == nil then
				arg_123_1.var_.actorSpriteComps1061 = var_126_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_9 = 0.034

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_8) / var_126_9

				if arg_123_1.var_.actorSpriteComps1061 then
					for iter_126_1, iter_126_2 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_126_2 then
							local var_126_11 = Mathf.Lerp(iter_126_2.color.r, 1, var_126_10)

							iter_126_2.color = Color.New(var_126_11, var_126_11, var_126_11)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_8 + var_126_9 and arg_123_1.time_ < var_126_8 + var_126_9 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 then
				local var_126_12 = 1

				for iter_126_3, iter_126_4 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_126_4 then
						iter_126_4.color = Color.New(var_126_12, var_126_12, var_126_12)
					end
				end

				arg_123_1.var_.actorSpriteComps1061 = nil
			end

			local var_126_13 = arg_123_1.actors_["10060"]
			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 and arg_123_1.var_.actorSpriteComps10060 == nil then
				arg_123_1.var_.actorSpriteComps10060 = var_126_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_15 = 0.034

			if var_126_14 <= arg_123_1.time_ and arg_123_1.time_ < var_126_14 + var_126_15 then
				local var_126_16 = (arg_123_1.time_ - var_126_14) / var_126_15

				if arg_123_1.var_.actorSpriteComps10060 then
					for iter_126_5, iter_126_6 in pairs(arg_123_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_126_6 then
							local var_126_17 = Mathf.Lerp(iter_126_6.color.r, 0.5, var_126_16)

							iter_126_6.color = Color.New(var_126_17, var_126_17, var_126_17)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_14 + var_126_15 and arg_123_1.time_ < var_126_14 + var_126_15 + arg_126_0 and arg_123_1.var_.actorSpriteComps10060 then
				local var_126_18 = 0.5

				for iter_126_7, iter_126_8 in pairs(arg_123_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_126_8 then
						iter_126_8.color = Color.New(var_126_18, var_126_18, var_126_18)
					end
				end

				arg_123_1.var_.actorSpriteComps10060 = nil
			end

			local var_126_19 = 0
			local var_126_20 = 0.55

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_21 = arg_123_1:FormatText(StoryNameCfg[612].name)

				arg_123_1.leftNameTxt_.text = var_126_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_22 = arg_123_1:GetWordFromCfg(410201031)
				local var_126_23 = arg_123_1:FormatText(var_126_22.content)

				arg_123_1.text_.text = var_126_23

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_24 = 22
				local var_126_25 = utf8.len(var_126_23)
				local var_126_26 = var_126_24 <= 0 and var_126_20 or var_126_20 * (var_126_25 / var_126_24)

				if var_126_26 > 0 and var_126_20 < var_126_26 then
					arg_123_1.talkMaxDuration = var_126_26

					if var_126_26 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_26 + var_126_19
					end
				end

				arg_123_1.text_.text = var_126_23
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201031", "story_v_out_410201.awb") ~= 0 then
					local var_126_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201031", "story_v_out_410201.awb") / 1000

					if var_126_27 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_27 + var_126_19
					end

					if var_126_22.prefab_name ~= "" and arg_123_1.actors_[var_126_22.prefab_name] ~= nil then
						local var_126_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_22.prefab_name].transform, "story_v_out_410201", "410201031", "story_v_out_410201.awb")

						arg_123_1:RecordAudio("410201031", var_126_28)
						arg_123_1:RecordAudio("410201031", var_126_28)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_410201", "410201031", "story_v_out_410201.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_410201", "410201031", "story_v_out_410201.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_29 = math.max(var_126_20, arg_123_1.talkMaxDuration)

			if var_126_19 <= arg_123_1.time_ and arg_123_1.time_ < var_126_19 + var_126_29 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_19) / var_126_29

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_19 + var_126_29 and arg_123_1.time_ < var_126_19 + var_126_29 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410201032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410201032
		arg_127_1.duration_ = 10.966

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play410201033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 1.175

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[612].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(410201032)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201032", "story_v_out_410201.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_410201", "410201032", "story_v_out_410201.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_410201", "410201032", "story_v_out_410201.awb")

						arg_127_1:RecordAudio("410201032", var_130_9)
						arg_127_1:RecordAudio("410201032", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_410201", "410201032", "story_v_out_410201.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_410201", "410201032", "story_v_out_410201.awb")
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
	Play410201033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410201033
		arg_131_1.duration_ = 1.733

		local var_131_0 = {
			ja = 1.366,
			CriLanguages = 1.733,
			zh = 1.733
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
				arg_131_0:Play410201034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10060"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10060 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10060", 2)

				local var_134_2 = var_134_0.childCount

				for iter_134_0 = 0, var_134_2 - 1 do
					local var_134_3 = var_134_0:GetChild(iter_134_0)

					if var_134_3.name == "" or not string.find(var_134_3.name, "split") then
						var_134_3.gameObject:SetActive(true)
					else
						var_134_3.gameObject:SetActive(false)
					end
				end
			end

			local var_134_4 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_4 then
				local var_134_5 = (arg_131_1.time_ - var_134_1) / var_134_4
				local var_134_6 = Vector3.New(-390, -400, 0)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10060, var_134_6, var_134_5)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_4 and arg_131_1.time_ < var_134_1 + var_134_4 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_134_7 = arg_131_1.actors_["10060"]
			local var_134_8 = 0

			if var_134_8 < arg_131_1.time_ and arg_131_1.time_ <= var_134_8 + arg_134_0 and arg_131_1.var_.actorSpriteComps10060 == nil then
				arg_131_1.var_.actorSpriteComps10060 = var_134_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_9 = 0.034

			if var_134_8 <= arg_131_1.time_ and arg_131_1.time_ < var_134_8 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_8) / var_134_9

				if arg_131_1.var_.actorSpriteComps10060 then
					for iter_134_1, iter_134_2 in pairs(arg_131_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_134_2 then
							local var_134_11 = Mathf.Lerp(iter_134_2.color.r, 1, var_134_10)

							iter_134_2.color = Color.New(var_134_11, var_134_11, var_134_11)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_8 + var_134_9 and arg_131_1.time_ < var_134_8 + var_134_9 + arg_134_0 and arg_131_1.var_.actorSpriteComps10060 then
				local var_134_12 = 1

				for iter_134_3, iter_134_4 in pairs(arg_131_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_134_4 then
						iter_134_4.color = Color.New(var_134_12, var_134_12, var_134_12)
					end
				end

				arg_131_1.var_.actorSpriteComps10060 = nil
			end

			local var_134_13 = arg_131_1.actors_["1061"]
			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 and arg_131_1.var_.actorSpriteComps1061 == nil then
				arg_131_1.var_.actorSpriteComps1061 = var_134_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_15 = 0.034

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_14) / var_134_15

				if arg_131_1.var_.actorSpriteComps1061 then
					for iter_134_5, iter_134_6 in pairs(arg_131_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_134_6 then
							local var_134_17 = Mathf.Lerp(iter_134_6.color.r, 0.5, var_134_16)

							iter_134_6.color = Color.New(var_134_17, var_134_17, var_134_17)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_14 + var_134_15 and arg_131_1.time_ < var_134_14 + var_134_15 + arg_134_0 and arg_131_1.var_.actorSpriteComps1061 then
				local var_134_18 = 0.5

				for iter_134_7, iter_134_8 in pairs(arg_131_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_134_8 then
						iter_134_8.color = Color.New(var_134_18, var_134_18, var_134_18)
					end
				end

				arg_131_1.var_.actorSpriteComps1061 = nil
			end

			local var_134_19 = 0
			local var_134_20 = 0.05

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_21 = arg_131_1:FormatText(StoryNameCfg[597].name)

				arg_131_1.leftNameTxt_.text = var_134_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_22 = arg_131_1:GetWordFromCfg(410201033)
				local var_134_23 = arg_131_1:FormatText(var_134_22.content)

				arg_131_1.text_.text = var_134_23

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_24 = 2
				local var_134_25 = utf8.len(var_134_23)
				local var_134_26 = var_134_24 <= 0 and var_134_20 or var_134_20 * (var_134_25 / var_134_24)

				if var_134_26 > 0 and var_134_20 < var_134_26 then
					arg_131_1.talkMaxDuration = var_134_26

					if var_134_26 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_26 + var_134_19
					end
				end

				arg_131_1.text_.text = var_134_23
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201033", "story_v_out_410201.awb") ~= 0 then
					local var_134_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201033", "story_v_out_410201.awb") / 1000

					if var_134_27 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_27 + var_134_19
					end

					if var_134_22.prefab_name ~= "" and arg_131_1.actors_[var_134_22.prefab_name] ~= nil then
						local var_134_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_22.prefab_name].transform, "story_v_out_410201", "410201033", "story_v_out_410201.awb")

						arg_131_1:RecordAudio("410201033", var_134_28)
						arg_131_1:RecordAudio("410201033", var_134_28)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_410201", "410201033", "story_v_out_410201.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_410201", "410201033", "story_v_out_410201.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_29 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_29 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_29

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_29 and arg_131_1.time_ < var_134_19 + var_134_29 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play410201034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410201034
		arg_135_1.duration_ = 17.966

		local var_135_0 = {
			ja = 17.966,
			CriLanguages = 8.566,
			zh = 8.566
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
				arg_135_0:Play410201035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1061"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1061 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("1061", 4)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(390, -490, 18)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1061, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_138_7 = arg_135_1.actors_["10060"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps10060 == nil then
				arg_135_1.var_.actorSpriteComps10060 = var_138_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_9 = 0.034

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.actorSpriteComps10060 then
					for iter_138_1, iter_138_2 in pairs(arg_135_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_138_2 then
							local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 0.5, var_138_10)

							iter_138_2.color = Color.New(var_138_11, var_138_11, var_138_11)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps10060 then
				local var_138_12 = 0.5

				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_138_4 then
						iter_138_4.color = Color.New(var_138_12, var_138_12, var_138_12)
					end
				end

				arg_135_1.var_.actorSpriteComps10060 = nil
			end

			local var_138_13 = arg_135_1.actors_["1061"]
			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 and arg_135_1.var_.actorSpriteComps1061 == nil then
				arg_135_1.var_.actorSpriteComps1061 = var_138_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_15 = 0.034

			if var_138_14 <= arg_135_1.time_ and arg_135_1.time_ < var_138_14 + var_138_15 then
				local var_138_16 = (arg_135_1.time_ - var_138_14) / var_138_15

				if arg_135_1.var_.actorSpriteComps1061 then
					for iter_138_5, iter_138_6 in pairs(arg_135_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_138_6 then
							local var_138_17 = Mathf.Lerp(iter_138_6.color.r, 1, var_138_16)

							iter_138_6.color = Color.New(var_138_17, var_138_17, var_138_17)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_14 + var_138_15 and arg_135_1.time_ < var_138_14 + var_138_15 + arg_138_0 and arg_135_1.var_.actorSpriteComps1061 then
				local var_138_18 = 1

				for iter_138_7, iter_138_8 in pairs(arg_135_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_138_8 then
						iter_138_8.color = Color.New(var_138_18, var_138_18, var_138_18)
					end
				end

				arg_135_1.var_.actorSpriteComps1061 = nil
			end

			local var_138_19 = 0
			local var_138_20 = 0.975

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_21 = arg_135_1:FormatText(StoryNameCfg[612].name)

				arg_135_1.leftNameTxt_.text = var_138_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_22 = arg_135_1:GetWordFromCfg(410201034)
				local var_138_23 = arg_135_1:FormatText(var_138_22.content)

				arg_135_1.text_.text = var_138_23

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_24 = 39
				local var_138_25 = utf8.len(var_138_23)
				local var_138_26 = var_138_24 <= 0 and var_138_20 or var_138_20 * (var_138_25 / var_138_24)

				if var_138_26 > 0 and var_138_20 < var_138_26 then
					arg_135_1.talkMaxDuration = var_138_26

					if var_138_26 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_26 + var_138_19
					end
				end

				arg_135_1.text_.text = var_138_23
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201034", "story_v_out_410201.awb") ~= 0 then
					local var_138_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201034", "story_v_out_410201.awb") / 1000

					if var_138_27 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_27 + var_138_19
					end

					if var_138_22.prefab_name ~= "" and arg_135_1.actors_[var_138_22.prefab_name] ~= nil then
						local var_138_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_22.prefab_name].transform, "story_v_out_410201", "410201034", "story_v_out_410201.awb")

						arg_135_1:RecordAudio("410201034", var_138_28)
						arg_135_1:RecordAudio("410201034", var_138_28)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410201", "410201034", "story_v_out_410201.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410201", "410201034", "story_v_out_410201.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_29 = math.max(var_138_20, arg_135_1.talkMaxDuration)

			if var_138_19 <= arg_135_1.time_ and arg_135_1.time_ < var_138_19 + var_138_29 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_19) / var_138_29

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_19 + var_138_29 and arg_135_1.time_ < var_138_19 + var_138_29 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play410201035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410201035
		arg_139_1.duration_ = 1.4

		local var_139_0 = {
			ja = 1.066,
			CriLanguages = 1.4,
			zh = 1.4
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
				arg_139_0:Play410201036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10060"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos10060 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10060", 2)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(-390, -400, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10060, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_142_7 = arg_139_1.actors_["10060"]
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 and arg_139_1.var_.actorSpriteComps10060 == nil then
				arg_139_1.var_.actorSpriteComps10060 = var_142_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_9 = 0.034

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_8) / var_142_9

				if arg_139_1.var_.actorSpriteComps10060 then
					for iter_142_1, iter_142_2 in pairs(arg_139_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_142_2 then
							local var_142_11 = Mathf.Lerp(iter_142_2.color.r, 1, var_142_10)

							iter_142_2.color = Color.New(var_142_11, var_142_11, var_142_11)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_8 + var_142_9 and arg_139_1.time_ < var_142_8 + var_142_9 + arg_142_0 and arg_139_1.var_.actorSpriteComps10060 then
				local var_142_12 = 1

				for iter_142_3, iter_142_4 in pairs(arg_139_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_142_4 then
						iter_142_4.color = Color.New(var_142_12, var_142_12, var_142_12)
					end
				end

				arg_139_1.var_.actorSpriteComps10060 = nil
			end

			local var_142_13 = arg_139_1.actors_["1061"]
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 and arg_139_1.var_.actorSpriteComps1061 == nil then
				arg_139_1.var_.actorSpriteComps1061 = var_142_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_15 = 0.034

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_15 then
				local var_142_16 = (arg_139_1.time_ - var_142_14) / var_142_15

				if arg_139_1.var_.actorSpriteComps1061 then
					for iter_142_5, iter_142_6 in pairs(arg_139_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_142_6 then
							local var_142_17 = Mathf.Lerp(iter_142_6.color.r, 0.5, var_142_16)

							iter_142_6.color = Color.New(var_142_17, var_142_17, var_142_17)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_14 + var_142_15 and arg_139_1.time_ < var_142_14 + var_142_15 + arg_142_0 and arg_139_1.var_.actorSpriteComps1061 then
				local var_142_18 = 0.5

				for iter_142_7, iter_142_8 in pairs(arg_139_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_142_8 then
						iter_142_8.color = Color.New(var_142_18, var_142_18, var_142_18)
					end
				end

				arg_139_1.var_.actorSpriteComps1061 = nil
			end

			local var_142_19 = 0
			local var_142_20 = 0.1

			if var_142_19 < arg_139_1.time_ and arg_139_1.time_ <= var_142_19 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_21 = arg_139_1:FormatText(StoryNameCfg[597].name)

				arg_139_1.leftNameTxt_.text = var_142_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_22 = arg_139_1:GetWordFromCfg(410201035)
				local var_142_23 = arg_139_1:FormatText(var_142_22.content)

				arg_139_1.text_.text = var_142_23

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_24 = 4
				local var_142_25 = utf8.len(var_142_23)
				local var_142_26 = var_142_24 <= 0 and var_142_20 or var_142_20 * (var_142_25 / var_142_24)

				if var_142_26 > 0 and var_142_20 < var_142_26 then
					arg_139_1.talkMaxDuration = var_142_26

					if var_142_26 + var_142_19 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_26 + var_142_19
					end
				end

				arg_139_1.text_.text = var_142_23
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201035", "story_v_out_410201.awb") ~= 0 then
					local var_142_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201035", "story_v_out_410201.awb") / 1000

					if var_142_27 + var_142_19 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_27 + var_142_19
					end

					if var_142_22.prefab_name ~= "" and arg_139_1.actors_[var_142_22.prefab_name] ~= nil then
						local var_142_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_22.prefab_name].transform, "story_v_out_410201", "410201035", "story_v_out_410201.awb")

						arg_139_1:RecordAudio("410201035", var_142_28)
						arg_139_1:RecordAudio("410201035", var_142_28)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410201", "410201035", "story_v_out_410201.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410201", "410201035", "story_v_out_410201.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_29 = math.max(var_142_20, arg_139_1.talkMaxDuration)

			if var_142_19 <= arg_139_1.time_ and arg_139_1.time_ < var_142_19 + var_142_29 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_19) / var_142_29

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_19 + var_142_29 and arg_139_1.time_ < var_142_19 + var_142_29 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410201036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410201036
		arg_143_1.duration_ = 17.166

		local var_143_0 = {
			ja = 17.166,
			CriLanguages = 13.066,
			zh = 13.066
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
				arg_143_0:Play410201037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1061"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1061 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("1061", 4)

				local var_146_2 = var_146_0.childCount

				for iter_146_0 = 0, var_146_2 - 1 do
					local var_146_3 = var_146_0:GetChild(iter_146_0)

					if var_146_3.name == "" or not string.find(var_146_3.name, "split") then
						var_146_3.gameObject:SetActive(true)
					else
						var_146_3.gameObject:SetActive(false)
					end
				end
			end

			local var_146_4 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_4 then
				local var_146_5 = (arg_143_1.time_ - var_146_1) / var_146_4
				local var_146_6 = Vector3.New(390, -490, 18)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1061, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_146_7 = arg_143_1.actors_["10060"]
			local var_146_8 = 0

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 and arg_143_1.var_.actorSpriteComps10060 == nil then
				arg_143_1.var_.actorSpriteComps10060 = var_146_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_9 = 0.034

			if var_146_8 <= arg_143_1.time_ and arg_143_1.time_ < var_146_8 + var_146_9 then
				local var_146_10 = (arg_143_1.time_ - var_146_8) / var_146_9

				if arg_143_1.var_.actorSpriteComps10060 then
					for iter_146_1, iter_146_2 in pairs(arg_143_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_146_2 then
							local var_146_11 = Mathf.Lerp(iter_146_2.color.r, 0.5, var_146_10)

							iter_146_2.color = Color.New(var_146_11, var_146_11, var_146_11)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_8 + var_146_9 and arg_143_1.time_ < var_146_8 + var_146_9 + arg_146_0 and arg_143_1.var_.actorSpriteComps10060 then
				local var_146_12 = 0.5

				for iter_146_3, iter_146_4 in pairs(arg_143_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_146_4 then
						iter_146_4.color = Color.New(var_146_12, var_146_12, var_146_12)
					end
				end

				arg_143_1.var_.actorSpriteComps10060 = nil
			end

			local var_146_13 = arg_143_1.actors_["1061"]
			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 and arg_143_1.var_.actorSpriteComps1061 == nil then
				arg_143_1.var_.actorSpriteComps1061 = var_146_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_15 = 0.034

			if var_146_14 <= arg_143_1.time_ and arg_143_1.time_ < var_146_14 + var_146_15 then
				local var_146_16 = (arg_143_1.time_ - var_146_14) / var_146_15

				if arg_143_1.var_.actorSpriteComps1061 then
					for iter_146_5, iter_146_6 in pairs(arg_143_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_146_6 then
							local var_146_17 = Mathf.Lerp(iter_146_6.color.r, 1, var_146_16)

							iter_146_6.color = Color.New(var_146_17, var_146_17, var_146_17)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_14 + var_146_15 and arg_143_1.time_ < var_146_14 + var_146_15 + arg_146_0 and arg_143_1.var_.actorSpriteComps1061 then
				local var_146_18 = 1

				for iter_146_7, iter_146_8 in pairs(arg_143_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_146_8 then
						iter_146_8.color = Color.New(var_146_18, var_146_18, var_146_18)
					end
				end

				arg_143_1.var_.actorSpriteComps1061 = nil
			end

			local var_146_19 = 0
			local var_146_20 = 1.5

			if var_146_19 < arg_143_1.time_ and arg_143_1.time_ <= var_146_19 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_21 = arg_143_1:FormatText(StoryNameCfg[612].name)

				arg_143_1.leftNameTxt_.text = var_146_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_22 = arg_143_1:GetWordFromCfg(410201036)
				local var_146_23 = arg_143_1:FormatText(var_146_22.content)

				arg_143_1.text_.text = var_146_23

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_24 = 60
				local var_146_25 = utf8.len(var_146_23)
				local var_146_26 = var_146_24 <= 0 and var_146_20 or var_146_20 * (var_146_25 / var_146_24)

				if var_146_26 > 0 and var_146_20 < var_146_26 then
					arg_143_1.talkMaxDuration = var_146_26

					if var_146_26 + var_146_19 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_26 + var_146_19
					end
				end

				arg_143_1.text_.text = var_146_23
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201036", "story_v_out_410201.awb") ~= 0 then
					local var_146_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201036", "story_v_out_410201.awb") / 1000

					if var_146_27 + var_146_19 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_27 + var_146_19
					end

					if var_146_22.prefab_name ~= "" and arg_143_1.actors_[var_146_22.prefab_name] ~= nil then
						local var_146_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_22.prefab_name].transform, "story_v_out_410201", "410201036", "story_v_out_410201.awb")

						arg_143_1:RecordAudio("410201036", var_146_28)
						arg_143_1:RecordAudio("410201036", var_146_28)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_410201", "410201036", "story_v_out_410201.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_410201", "410201036", "story_v_out_410201.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_29 = math.max(var_146_20, arg_143_1.talkMaxDuration)

			if var_146_19 <= arg_143_1.time_ and arg_143_1.time_ < var_146_19 + var_146_29 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_19) / var_146_29

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_19 + var_146_29 and arg_143_1.time_ < var_146_19 + var_146_29 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410201037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410201037
		arg_147_1.duration_ = 6.966

		local var_147_0 = {
			ja = 3.266,
			CriLanguages = 6.966,
			zh = 6.966
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
				arg_147_0:Play410201038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10060"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10060 = var_150_0.localPosition
				var_150_0.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10060", 2)

				local var_150_2 = var_150_0.childCount

				for iter_150_0 = 0, var_150_2 - 1 do
					local var_150_3 = var_150_0:GetChild(iter_150_0)

					if var_150_3.name == "" or not string.find(var_150_3.name, "split") then
						var_150_3.gameObject:SetActive(true)
					else
						var_150_3.gameObject:SetActive(false)
					end
				end
			end

			local var_150_4 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_4 then
				local var_150_5 = (arg_147_1.time_ - var_150_1) / var_150_4
				local var_150_6 = Vector3.New(-390, -400, 0)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10060, var_150_6, var_150_5)
			end

			if arg_147_1.time_ >= var_150_1 + var_150_4 and arg_147_1.time_ < var_150_1 + var_150_4 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_150_7 = arg_147_1.actors_["10060"]
			local var_150_8 = 0

			if var_150_8 < arg_147_1.time_ and arg_147_1.time_ <= var_150_8 + arg_150_0 and arg_147_1.var_.actorSpriteComps10060 == nil then
				arg_147_1.var_.actorSpriteComps10060 = var_150_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_9 = 0.034

			if var_150_8 <= arg_147_1.time_ and arg_147_1.time_ < var_150_8 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_8) / var_150_9

				if arg_147_1.var_.actorSpriteComps10060 then
					for iter_150_1, iter_150_2 in pairs(arg_147_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_150_2 then
							local var_150_11 = Mathf.Lerp(iter_150_2.color.r, 1, var_150_10)

							iter_150_2.color = Color.New(var_150_11, var_150_11, var_150_11)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_8 + var_150_9 and arg_147_1.time_ < var_150_8 + var_150_9 + arg_150_0 and arg_147_1.var_.actorSpriteComps10060 then
				local var_150_12 = 1

				for iter_150_3, iter_150_4 in pairs(arg_147_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_150_4 then
						iter_150_4.color = Color.New(var_150_12, var_150_12, var_150_12)
					end
				end

				arg_147_1.var_.actorSpriteComps10060 = nil
			end

			local var_150_13 = arg_147_1.actors_["1061"]
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 == nil then
				arg_147_1.var_.actorSpriteComps1061 = var_150_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_15 = 0.034

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15

				if arg_147_1.var_.actorSpriteComps1061 then
					for iter_150_5, iter_150_6 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_150_6 then
							local var_150_17 = Mathf.Lerp(iter_150_6.color.r, 0.5, var_150_16)

							iter_150_6.color = Color.New(var_150_17, var_150_17, var_150_17)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 then
				local var_150_18 = 0.5

				for iter_150_7, iter_150_8 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_150_8 then
						iter_150_8.color = Color.New(var_150_18, var_150_18, var_150_18)
					end
				end

				arg_147_1.var_.actorSpriteComps1061 = nil
			end

			local var_150_19 = 0
			local var_150_20 = 0.425

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[597].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(410201037)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 17
				local var_150_25 = utf8.len(var_150_23)
				local var_150_26 = var_150_24 <= 0 and var_150_20 or var_150_20 * (var_150_25 / var_150_24)

				if var_150_26 > 0 and var_150_20 < var_150_26 then
					arg_147_1.talkMaxDuration = var_150_26

					if var_150_26 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_26 + var_150_19
					end
				end

				arg_147_1.text_.text = var_150_23
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201037", "story_v_out_410201.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201037", "story_v_out_410201.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_410201", "410201037", "story_v_out_410201.awb")

						arg_147_1:RecordAudio("410201037", var_150_28)
						arg_147_1:RecordAudio("410201037", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410201", "410201037", "story_v_out_410201.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410201", "410201037", "story_v_out_410201.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_29 = math.max(var_150_20, arg_147_1.talkMaxDuration)

			if var_150_19 <= arg_147_1.time_ and arg_147_1.time_ < var_150_19 + var_150_29 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_19) / var_150_29

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_19 + var_150_29 and arg_147_1.time_ < var_150_19 + var_150_29 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410201038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410201038
		arg_151_1.duration_ = 13.133

		local var_151_0 = {
			ja = 13.133,
			CriLanguages = 9.333,
			zh = 9.333
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
				arg_151_0:Play410201039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1061"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1061 = var_154_0.localPosition
				var_154_0.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1061", 4)

				local var_154_2 = var_154_0.childCount

				for iter_154_0 = 0, var_154_2 - 1 do
					local var_154_3 = var_154_0:GetChild(iter_154_0)

					if var_154_3.name == "split_5" or not string.find(var_154_3.name, "split") then
						var_154_3.gameObject:SetActive(true)
					else
						var_154_3.gameObject:SetActive(false)
					end
				end
			end

			local var_154_4 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_4 then
				local var_154_5 = (arg_151_1.time_ - var_154_1) / var_154_4
				local var_154_6 = Vector3.New(390, -490, 18)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1061, var_154_6, var_154_5)
			end

			if arg_151_1.time_ >= var_154_1 + var_154_4 and arg_151_1.time_ < var_154_1 + var_154_4 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_154_7 = arg_151_1.actors_["10060"]
			local var_154_8 = 0

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps10060 == nil then
				arg_151_1.var_.actorSpriteComps10060 = var_154_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_9 = 0.034

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_8) / var_154_9

				if arg_151_1.var_.actorSpriteComps10060 then
					for iter_154_1, iter_154_2 in pairs(arg_151_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_154_2 then
							local var_154_11 = Mathf.Lerp(iter_154_2.color.r, 0.5, var_154_10)

							iter_154_2.color = Color.New(var_154_11, var_154_11, var_154_11)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_8 + var_154_9 and arg_151_1.time_ < var_154_8 + var_154_9 + arg_154_0 and arg_151_1.var_.actorSpriteComps10060 then
				local var_154_12 = 0.5

				for iter_154_3, iter_154_4 in pairs(arg_151_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_154_4 then
						iter_154_4.color = Color.New(var_154_12, var_154_12, var_154_12)
					end
				end

				arg_151_1.var_.actorSpriteComps10060 = nil
			end

			local var_154_13 = arg_151_1.actors_["1061"]
			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 and arg_151_1.var_.actorSpriteComps1061 == nil then
				arg_151_1.var_.actorSpriteComps1061 = var_154_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_15 = 0.034

			if var_154_14 <= arg_151_1.time_ and arg_151_1.time_ < var_154_14 + var_154_15 then
				local var_154_16 = (arg_151_1.time_ - var_154_14) / var_154_15

				if arg_151_1.var_.actorSpriteComps1061 then
					for iter_154_5, iter_154_6 in pairs(arg_151_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_154_6 then
							local var_154_17 = Mathf.Lerp(iter_154_6.color.r, 1, var_154_16)

							iter_154_6.color = Color.New(var_154_17, var_154_17, var_154_17)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_14 + var_154_15 and arg_151_1.time_ < var_154_14 + var_154_15 + arg_154_0 and arg_151_1.var_.actorSpriteComps1061 then
				local var_154_18 = 1

				for iter_154_7, iter_154_8 in pairs(arg_151_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_154_8 then
						iter_154_8.color = Color.New(var_154_18, var_154_18, var_154_18)
					end
				end

				arg_151_1.var_.actorSpriteComps1061 = nil
			end

			local var_154_19 = 0
			local var_154_20 = 1.2

			if var_154_19 < arg_151_1.time_ and arg_151_1.time_ <= var_154_19 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_21 = arg_151_1:FormatText(StoryNameCfg[612].name)

				arg_151_1.leftNameTxt_.text = var_154_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_22 = arg_151_1:GetWordFromCfg(410201038)
				local var_154_23 = arg_151_1:FormatText(var_154_22.content)

				arg_151_1.text_.text = var_154_23

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_24 = 49
				local var_154_25 = utf8.len(var_154_23)
				local var_154_26 = var_154_24 <= 0 and var_154_20 or var_154_20 * (var_154_25 / var_154_24)

				if var_154_26 > 0 and var_154_20 < var_154_26 then
					arg_151_1.talkMaxDuration = var_154_26

					if var_154_26 + var_154_19 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_26 + var_154_19
					end
				end

				arg_151_1.text_.text = var_154_23
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201038", "story_v_out_410201.awb") ~= 0 then
					local var_154_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201038", "story_v_out_410201.awb") / 1000

					if var_154_27 + var_154_19 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_27 + var_154_19
					end

					if var_154_22.prefab_name ~= "" and arg_151_1.actors_[var_154_22.prefab_name] ~= nil then
						local var_154_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_22.prefab_name].transform, "story_v_out_410201", "410201038", "story_v_out_410201.awb")

						arg_151_1:RecordAudio("410201038", var_154_28)
						arg_151_1:RecordAudio("410201038", var_154_28)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410201", "410201038", "story_v_out_410201.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410201", "410201038", "story_v_out_410201.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_29 = math.max(var_154_20, arg_151_1.talkMaxDuration)

			if var_154_19 <= arg_151_1.time_ and arg_151_1.time_ < var_154_19 + var_154_29 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_19) / var_154_29

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_19 + var_154_29 and arg_151_1.time_ < var_154_19 + var_154_29 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410201039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410201039
		arg_155_1.duration_ = 9.033

		local var_155_0 = {
			ja = 9.033,
			CriLanguages = 7.5,
			zh = 7.5
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
				arg_155_0:Play410201040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1061"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1061 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("1061", 4)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "split_5" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(390, -490, 18)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1061, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_158_7 = arg_155_1.actors_["1061"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 == nil then
				arg_155_1.var_.actorSpriteComps1061 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.034

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps1061 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps1061 = nil
			end

			local var_158_13 = 0
			local var_158_14 = 0.825

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_15 = arg_155_1:FormatText(StoryNameCfg[612].name)

				arg_155_1.leftNameTxt_.text = var_158_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_16 = arg_155_1:GetWordFromCfg(410201039)
				local var_158_17 = arg_155_1:FormatText(var_158_16.content)

				arg_155_1.text_.text = var_158_17

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_18 = 33
				local var_158_19 = utf8.len(var_158_17)
				local var_158_20 = var_158_18 <= 0 and var_158_14 or var_158_14 * (var_158_19 / var_158_18)

				if var_158_20 > 0 and var_158_14 < var_158_20 then
					arg_155_1.talkMaxDuration = var_158_20

					if var_158_20 + var_158_13 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_13
					end
				end

				arg_155_1.text_.text = var_158_17
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201039", "story_v_out_410201.awb") ~= 0 then
					local var_158_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201039", "story_v_out_410201.awb") / 1000

					if var_158_21 + var_158_13 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_21 + var_158_13
					end

					if var_158_16.prefab_name ~= "" and arg_155_1.actors_[var_158_16.prefab_name] ~= nil then
						local var_158_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_16.prefab_name].transform, "story_v_out_410201", "410201039", "story_v_out_410201.awb")

						arg_155_1:RecordAudio("410201039", var_158_22)
						arg_155_1:RecordAudio("410201039", var_158_22)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410201", "410201039", "story_v_out_410201.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410201", "410201039", "story_v_out_410201.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_23 = math.max(var_158_14, arg_155_1.talkMaxDuration)

			if var_158_13 <= arg_155_1.time_ and arg_155_1.time_ < var_158_13 + var_158_23 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_13) / var_158_23

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_13 + var_158_23 and arg_155_1.time_ < var_158_13 + var_158_23 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410201040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410201040
		arg_159_1.duration_ = 2.566

		local var_159_0 = {
			ja = 0.999999999999,
			CriLanguages = 2.566,
			zh = 2.566
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
				arg_159_0:Play410201041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10060"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10060 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("10060", 2)

				local var_162_2 = var_162_0.childCount

				for iter_162_0 = 0, var_162_2 - 1 do
					local var_162_3 = var_162_0:GetChild(iter_162_0)

					if var_162_3.name == "split_5" or not string.find(var_162_3.name, "split") then
						var_162_3.gameObject:SetActive(true)
					else
						var_162_3.gameObject:SetActive(false)
					end
				end
			end

			local var_162_4 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_1) / var_162_4
				local var_162_6 = Vector3.New(-390, -400, 0)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10060, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_162_7 = arg_159_1.actors_["10060"]
			local var_162_8 = 0

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps10060 == nil then
				arg_159_1.var_.actorSpriteComps10060 = var_162_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_9 = 0.034

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_8) / var_162_9

				if arg_159_1.var_.actorSpriteComps10060 then
					for iter_162_1, iter_162_2 in pairs(arg_159_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_162_2 then
							local var_162_11 = Mathf.Lerp(iter_162_2.color.r, 1, var_162_10)

							iter_162_2.color = Color.New(var_162_11, var_162_11, var_162_11)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_8 + var_162_9 and arg_159_1.time_ < var_162_8 + var_162_9 + arg_162_0 and arg_159_1.var_.actorSpriteComps10060 then
				local var_162_12 = 1

				for iter_162_3, iter_162_4 in pairs(arg_159_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_162_4 then
						iter_162_4.color = Color.New(var_162_12, var_162_12, var_162_12)
					end
				end

				arg_159_1.var_.actorSpriteComps10060 = nil
			end

			local var_162_13 = arg_159_1.actors_["1061"]
			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 and arg_159_1.var_.actorSpriteComps1061 == nil then
				arg_159_1.var_.actorSpriteComps1061 = var_162_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_15 = 0.034

			if var_162_14 <= arg_159_1.time_ and arg_159_1.time_ < var_162_14 + var_162_15 then
				local var_162_16 = (arg_159_1.time_ - var_162_14) / var_162_15

				if arg_159_1.var_.actorSpriteComps1061 then
					for iter_162_5, iter_162_6 in pairs(arg_159_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_162_6 then
							local var_162_17 = Mathf.Lerp(iter_162_6.color.r, 0.5, var_162_16)

							iter_162_6.color = Color.New(var_162_17, var_162_17, var_162_17)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_14 + var_162_15 and arg_159_1.time_ < var_162_14 + var_162_15 + arg_162_0 and arg_159_1.var_.actorSpriteComps1061 then
				local var_162_18 = 0.5

				for iter_162_7, iter_162_8 in pairs(arg_159_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_162_8 then
						iter_162_8.color = Color.New(var_162_18, var_162_18, var_162_18)
					end
				end

				arg_159_1.var_.actorSpriteComps1061 = nil
			end

			local var_162_19 = 0
			local var_162_20 = 0.125

			if var_162_19 < arg_159_1.time_ and arg_159_1.time_ <= var_162_19 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_21 = arg_159_1:FormatText(StoryNameCfg[597].name)

				arg_159_1.leftNameTxt_.text = var_162_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_22 = arg_159_1:GetWordFromCfg(410201040)
				local var_162_23 = arg_159_1:FormatText(var_162_22.content)

				arg_159_1.text_.text = var_162_23

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_24 = 5
				local var_162_25 = utf8.len(var_162_23)
				local var_162_26 = var_162_24 <= 0 and var_162_20 or var_162_20 * (var_162_25 / var_162_24)

				if var_162_26 > 0 and var_162_20 < var_162_26 then
					arg_159_1.talkMaxDuration = var_162_26

					if var_162_26 + var_162_19 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_26 + var_162_19
					end
				end

				arg_159_1.text_.text = var_162_23
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201040", "story_v_out_410201.awb") ~= 0 then
					local var_162_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201040", "story_v_out_410201.awb") / 1000

					if var_162_27 + var_162_19 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_27 + var_162_19
					end

					if var_162_22.prefab_name ~= "" and arg_159_1.actors_[var_162_22.prefab_name] ~= nil then
						local var_162_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_22.prefab_name].transform, "story_v_out_410201", "410201040", "story_v_out_410201.awb")

						arg_159_1:RecordAudio("410201040", var_162_28)
						arg_159_1:RecordAudio("410201040", var_162_28)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410201", "410201040", "story_v_out_410201.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410201", "410201040", "story_v_out_410201.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_29 = math.max(var_162_20, arg_159_1.talkMaxDuration)

			if var_162_19 <= arg_159_1.time_ and arg_159_1.time_ < var_162_19 + var_162_29 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_19) / var_162_29

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_19 + var_162_29 and arg_159_1.time_ < var_162_19 + var_162_29 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play410201041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410201041
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play410201042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10060"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos10060 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10060", 7)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(0, -2000, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10060, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_166_7 = arg_163_1.actors_["1061"].transform
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 then
				arg_163_1.var_.moveOldPos1061 = var_166_7.localPosition
				var_166_7.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("1061", 7)

				local var_166_9 = var_166_7.childCount

				for iter_166_1 = 0, var_166_9 - 1 do
					local var_166_10 = var_166_7:GetChild(iter_166_1)

					if var_166_10.name == "" or not string.find(var_166_10.name, "split") then
						var_166_10.gameObject:SetActive(true)
					else
						var_166_10.gameObject:SetActive(false)
					end
				end
			end

			local var_166_11 = 0.001

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_8) / var_166_11
				local var_166_13 = Vector3.New(0, -2000, 18)

				var_166_7.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1061, var_166_13, var_166_12)
			end

			if arg_163_1.time_ >= var_166_8 + var_166_11 and arg_163_1.time_ < var_166_8 + var_166_11 + arg_166_0 then
				var_166_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_166_14 = arg_163_1.actors_["10060"]
			local var_166_15 = 0

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 and arg_163_1.var_.actorSpriteComps10060 == nil then
				arg_163_1.var_.actorSpriteComps10060 = var_166_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_16 = 0.034

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_16 then
				local var_166_17 = (arg_163_1.time_ - var_166_15) / var_166_16

				if arg_163_1.var_.actorSpriteComps10060 then
					for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_166_3 then
							local var_166_18 = Mathf.Lerp(iter_166_3.color.r, 0.5, var_166_17)

							iter_166_3.color = Color.New(var_166_18, var_166_18, var_166_18)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_15 + var_166_16 and arg_163_1.time_ < var_166_15 + var_166_16 + arg_166_0 and arg_163_1.var_.actorSpriteComps10060 then
				local var_166_19 = 0.5

				for iter_166_4, iter_166_5 in pairs(arg_163_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_166_5 then
						iter_166_5.color = Color.New(var_166_19, var_166_19, var_166_19)
					end
				end

				arg_163_1.var_.actorSpriteComps10060 = nil
			end

			local var_166_20 = arg_163_1.actors_["1061"]
			local var_166_21 = 0

			if var_166_21 < arg_163_1.time_ and arg_163_1.time_ <= var_166_21 + arg_166_0 and arg_163_1.var_.actorSpriteComps1061 == nil then
				arg_163_1.var_.actorSpriteComps1061 = var_166_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_22 = 0.034

			if var_166_21 <= arg_163_1.time_ and arg_163_1.time_ < var_166_21 + var_166_22 then
				local var_166_23 = (arg_163_1.time_ - var_166_21) / var_166_22

				if arg_163_1.var_.actorSpriteComps1061 then
					for iter_166_6, iter_166_7 in pairs(arg_163_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_166_7 then
							local var_166_24 = Mathf.Lerp(iter_166_7.color.r, 0.5, var_166_23)

							iter_166_7.color = Color.New(var_166_24, var_166_24, var_166_24)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_21 + var_166_22 and arg_163_1.time_ < var_166_21 + var_166_22 + arg_166_0 and arg_163_1.var_.actorSpriteComps1061 then
				local var_166_25 = 0.5

				for iter_166_8, iter_166_9 in pairs(arg_163_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_166_9 then
						iter_166_9.color = Color.New(var_166_25, var_166_25, var_166_25)
					end
				end

				arg_163_1.var_.actorSpriteComps1061 = nil
			end

			local var_166_26 = 0
			local var_166_27 = 1.425

			if var_166_26 < arg_163_1.time_ and arg_163_1.time_ <= var_166_26 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_28 = arg_163_1:GetWordFromCfg(410201041)
				local var_166_29 = arg_163_1:FormatText(var_166_28.content)

				arg_163_1.text_.text = var_166_29

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_30 = 57
				local var_166_31 = utf8.len(var_166_29)
				local var_166_32 = var_166_30 <= 0 and var_166_27 or var_166_27 * (var_166_31 / var_166_30)

				if var_166_32 > 0 and var_166_27 < var_166_32 then
					arg_163_1.talkMaxDuration = var_166_32

					if var_166_32 + var_166_26 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_32 + var_166_26
					end
				end

				arg_163_1.text_.text = var_166_29
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_33 = math.max(var_166_27, arg_163_1.talkMaxDuration)

			if var_166_26 <= arg_163_1.time_ and arg_163_1.time_ < var_166_26 + var_166_33 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_26) / var_166_33

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_26 + var_166_33 and arg_163_1.time_ < var_166_26 + var_166_33 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play410201042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410201042
		arg_167_1.duration_ = 6.6

		local var_167_0 = {
			ja = 6.6,
			CriLanguages = 2.466,
			zh = 2.466
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
				arg_167_0:Play410201043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = "10062"

			if arg_167_1.actors_[var_170_0] == nil then
				local var_170_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_170_0), arg_167_1.canvasGo_.transform)

				var_170_1.transform:SetSiblingIndex(1)

				var_170_1.name = var_170_0
				var_170_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_167_1.actors_[var_170_0] = var_170_1
			end

			local var_170_2 = arg_167_1.actors_["10062"].transform
			local var_170_3 = 0

			if var_170_3 < arg_167_1.time_ and arg_167_1.time_ <= var_170_3 + arg_170_0 then
				arg_167_1.var_.moveOldPos10062 = var_170_2.localPosition
				var_170_2.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10062", 2)

				local var_170_4 = var_170_2.childCount

				for iter_170_0 = 0, var_170_4 - 1 do
					local var_170_5 = var_170_2:GetChild(iter_170_0)

					if var_170_5.name == "" or not string.find(var_170_5.name, "split") then
						var_170_5.gameObject:SetActive(true)
					else
						var_170_5.gameObject:SetActive(false)
					end
				end
			end

			local var_170_6 = 0.001

			if var_170_3 <= arg_167_1.time_ and arg_167_1.time_ < var_170_3 + var_170_6 then
				local var_170_7 = (arg_167_1.time_ - var_170_3) / var_170_6
				local var_170_8 = Vector3.New(-390, -350, -180)

				var_170_2.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10062, var_170_8, var_170_7)
			end

			if arg_167_1.time_ >= var_170_3 + var_170_6 and arg_167_1.time_ < var_170_3 + var_170_6 + arg_170_0 then
				var_170_2.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_170_9 = arg_167_1.actors_["10060"].transform
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1.var_.moveOldPos10060 = var_170_9.localPosition
				var_170_9.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10060", 4)

				local var_170_11 = var_170_9.childCount

				for iter_170_1 = 0, var_170_11 - 1 do
					local var_170_12 = var_170_9:GetChild(iter_170_1)

					if var_170_12.name == "" or not string.find(var_170_12.name, "split") then
						var_170_12.gameObject:SetActive(true)
					else
						var_170_12.gameObject:SetActive(false)
					end
				end
			end

			local var_170_13 = 0.001

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_13 then
				local var_170_14 = (arg_167_1.time_ - var_170_10) / var_170_13
				local var_170_15 = Vector3.New(390, -400, 0)

				var_170_9.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10060, var_170_15, var_170_14)
			end

			if arg_167_1.time_ >= var_170_10 + var_170_13 and arg_167_1.time_ < var_170_10 + var_170_13 + arg_170_0 then
				var_170_9.localPosition = Vector3.New(390, -400, 0)
			end

			local var_170_16 = arg_167_1.actors_["10062"]
			local var_170_17 = 0

			if var_170_17 < arg_167_1.time_ and arg_167_1.time_ <= var_170_17 + arg_170_0 and arg_167_1.var_.actorSpriteComps10062 == nil then
				arg_167_1.var_.actorSpriteComps10062 = var_170_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_18 = 0.034

			if var_170_17 <= arg_167_1.time_ and arg_167_1.time_ < var_170_17 + var_170_18 then
				local var_170_19 = (arg_167_1.time_ - var_170_17) / var_170_18

				if arg_167_1.var_.actorSpriteComps10062 then
					for iter_170_2, iter_170_3 in pairs(arg_167_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_170_3 then
							local var_170_20 = Mathf.Lerp(iter_170_3.color.r, 1, var_170_19)

							iter_170_3.color = Color.New(var_170_20, var_170_20, var_170_20)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_17 + var_170_18 and arg_167_1.time_ < var_170_17 + var_170_18 + arg_170_0 and arg_167_1.var_.actorSpriteComps10062 then
				local var_170_21 = 1

				for iter_170_4, iter_170_5 in pairs(arg_167_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_170_5 then
						iter_170_5.color = Color.New(var_170_21, var_170_21, var_170_21)
					end
				end

				arg_167_1.var_.actorSpriteComps10062 = nil
			end

			local var_170_22 = arg_167_1.actors_["10060"]
			local var_170_23 = 0

			if var_170_23 < arg_167_1.time_ and arg_167_1.time_ <= var_170_23 + arg_170_0 and arg_167_1.var_.actorSpriteComps10060 == nil then
				arg_167_1.var_.actorSpriteComps10060 = var_170_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_24 = 0.034

			if var_170_23 <= arg_167_1.time_ and arg_167_1.time_ < var_170_23 + var_170_24 then
				local var_170_25 = (arg_167_1.time_ - var_170_23) / var_170_24

				if arg_167_1.var_.actorSpriteComps10060 then
					for iter_170_6, iter_170_7 in pairs(arg_167_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_170_7 then
							local var_170_26 = Mathf.Lerp(iter_170_7.color.r, 0.5, var_170_25)

							iter_170_7.color = Color.New(var_170_26, var_170_26, var_170_26)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_23 + var_170_24 and arg_167_1.time_ < var_170_23 + var_170_24 + arg_170_0 and arg_167_1.var_.actorSpriteComps10060 then
				local var_170_27 = 0.5

				for iter_170_8, iter_170_9 in pairs(arg_167_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_170_9 then
						iter_170_9.color = Color.New(var_170_27, var_170_27, var_170_27)
					end
				end

				arg_167_1.var_.actorSpriteComps10060 = nil
			end

			local var_170_28 = 0
			local var_170_29 = 0.275

			if var_170_28 < arg_167_1.time_ and arg_167_1.time_ <= var_170_28 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_30 = arg_167_1:FormatText(StoryNameCfg[600].name)

				arg_167_1.leftNameTxt_.text = var_170_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_31 = arg_167_1:GetWordFromCfg(410201042)
				local var_170_32 = arg_167_1:FormatText(var_170_31.content)

				arg_167_1.text_.text = var_170_32

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_33 = 11
				local var_170_34 = utf8.len(var_170_32)
				local var_170_35 = var_170_33 <= 0 and var_170_29 or var_170_29 * (var_170_34 / var_170_33)

				if var_170_35 > 0 and var_170_29 < var_170_35 then
					arg_167_1.talkMaxDuration = var_170_35

					if var_170_35 + var_170_28 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_35 + var_170_28
					end
				end

				arg_167_1.text_.text = var_170_32
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201042", "story_v_out_410201.awb") ~= 0 then
					local var_170_36 = manager.audio:GetVoiceLength("story_v_out_410201", "410201042", "story_v_out_410201.awb") / 1000

					if var_170_36 + var_170_28 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_36 + var_170_28
					end

					if var_170_31.prefab_name ~= "" and arg_167_1.actors_[var_170_31.prefab_name] ~= nil then
						local var_170_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_31.prefab_name].transform, "story_v_out_410201", "410201042", "story_v_out_410201.awb")

						arg_167_1:RecordAudio("410201042", var_170_37)
						arg_167_1:RecordAudio("410201042", var_170_37)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410201", "410201042", "story_v_out_410201.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410201", "410201042", "story_v_out_410201.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_38 = math.max(var_170_29, arg_167_1.talkMaxDuration)

			if var_170_28 <= arg_167_1.time_ and arg_167_1.time_ < var_170_28 + var_170_38 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_28) / var_170_38

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_28 + var_170_38 and arg_167_1.time_ < var_170_28 + var_170_38 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play410201043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410201043
		arg_171_1.duration_ = 7.166

		local var_171_0 = {
			ja = 7.166,
			CriLanguages = 4.433,
			zh = 4.433
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
				arg_171_0:Play410201044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10060"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos10060 = var_174_0.localPosition
				var_174_0.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("10060", 4)

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
				local var_174_6 = Vector3.New(390, -400, 0)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10060, var_174_6, var_174_5)
			end

			if arg_171_1.time_ >= var_174_1 + var_174_4 and arg_171_1.time_ < var_174_1 + var_174_4 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_174_7 = arg_171_1.actors_["10062"]
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps10062 == nil then
				arg_171_1.var_.actorSpriteComps10062 = var_174_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_9 = 0.034

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_8) / var_174_9

				if arg_171_1.var_.actorSpriteComps10062 then
					for iter_174_1, iter_174_2 in pairs(arg_171_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_174_2 then
							local var_174_11 = Mathf.Lerp(iter_174_2.color.r, 0.5, var_174_10)

							iter_174_2.color = Color.New(var_174_11, var_174_11, var_174_11)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_8 + var_174_9 and arg_171_1.time_ < var_174_8 + var_174_9 + arg_174_0 and arg_171_1.var_.actorSpriteComps10062 then
				local var_174_12 = 0.5

				for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_174_4 then
						iter_174_4.color = Color.New(var_174_12, var_174_12, var_174_12)
					end
				end

				arg_171_1.var_.actorSpriteComps10062 = nil
			end

			local var_174_13 = arg_171_1.actors_["10060"]
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 and arg_171_1.var_.actorSpriteComps10060 == nil then
				arg_171_1.var_.actorSpriteComps10060 = var_174_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_15 = 0.034

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15

				if arg_171_1.var_.actorSpriteComps10060 then
					for iter_174_5, iter_174_6 in pairs(arg_171_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_174_6 then
							local var_174_17 = Mathf.Lerp(iter_174_6.color.r, 1, var_174_16)

							iter_174_6.color = Color.New(var_174_17, var_174_17, var_174_17)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 and arg_171_1.var_.actorSpriteComps10060 then
				local var_174_18 = 1

				for iter_174_7, iter_174_8 in pairs(arg_171_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_174_8 then
						iter_174_8.color = Color.New(var_174_18, var_174_18, var_174_18)
					end
				end

				arg_171_1.var_.actorSpriteComps10060 = nil
			end

			local var_174_19 = 0
			local var_174_20 = 0.575

			if var_174_19 < arg_171_1.time_ and arg_171_1.time_ <= var_174_19 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_21 = arg_171_1:FormatText(StoryNameCfg[597].name)

				arg_171_1.leftNameTxt_.text = var_174_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_22 = arg_171_1:GetWordFromCfg(410201043)
				local var_174_23 = arg_171_1:FormatText(var_174_22.content)

				arg_171_1.text_.text = var_174_23

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_24 = 23
				local var_174_25 = utf8.len(var_174_23)
				local var_174_26 = var_174_24 <= 0 and var_174_20 or var_174_20 * (var_174_25 / var_174_24)

				if var_174_26 > 0 and var_174_20 < var_174_26 then
					arg_171_1.talkMaxDuration = var_174_26

					if var_174_26 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_26 + var_174_19
					end
				end

				arg_171_1.text_.text = var_174_23
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201043", "story_v_out_410201.awb") ~= 0 then
					local var_174_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201043", "story_v_out_410201.awb") / 1000

					if var_174_27 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_27 + var_174_19
					end

					if var_174_22.prefab_name ~= "" and arg_171_1.actors_[var_174_22.prefab_name] ~= nil then
						local var_174_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_22.prefab_name].transform, "story_v_out_410201", "410201043", "story_v_out_410201.awb")

						arg_171_1:RecordAudio("410201043", var_174_28)
						arg_171_1:RecordAudio("410201043", var_174_28)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410201", "410201043", "story_v_out_410201.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410201", "410201043", "story_v_out_410201.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_29 = math.max(var_174_20, arg_171_1.talkMaxDuration)

			if var_174_19 <= arg_171_1.time_ and arg_171_1.time_ < var_174_19 + var_174_29 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_19) / var_174_29

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_19 + var_174_29 and arg_171_1.time_ < var_174_19 + var_174_29 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410201044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410201044
		arg_175_1.duration_ = 15.6

		local var_175_0 = {
			ja = 15.6,
			CriLanguages = 7.2,
			zh = 7.2
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
				arg_175_0:Play410201045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10062"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.actorSpriteComps10062 == nil then
				arg_175_1.var_.actorSpriteComps10062 = var_178_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_2 = 0.034

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.actorSpriteComps10062 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_178_1 then
							local var_178_4 = Mathf.Lerp(iter_178_1.color.r, 1, var_178_3)

							iter_178_1.color = Color.New(var_178_4, var_178_4, var_178_4)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.actorSpriteComps10062 then
				local var_178_5 = 1

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_5, var_178_5, var_178_5)
					end
				end

				arg_175_1.var_.actorSpriteComps10062 = nil
			end

			local var_178_6 = arg_175_1.actors_["10060"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 and arg_175_1.var_.actorSpriteComps10060 == nil then
				arg_175_1.var_.actorSpriteComps10060 = var_178_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_8 = 0.034

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_8 then
				local var_178_9 = (arg_175_1.time_ - var_178_7) / var_178_8

				if arg_175_1.var_.actorSpriteComps10060 then
					for iter_178_4, iter_178_5 in pairs(arg_175_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_178_5 then
							local var_178_10 = Mathf.Lerp(iter_178_5.color.r, 0.5, var_178_9)

							iter_178_5.color = Color.New(var_178_10, var_178_10, var_178_10)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_8 and arg_175_1.time_ < var_178_7 + var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps10060 then
				local var_178_11 = 0.5

				for iter_178_6, iter_178_7 in pairs(arg_175_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_178_7 then
						iter_178_7.color = Color.New(var_178_11, var_178_11, var_178_11)
					end
				end

				arg_175_1.var_.actorSpriteComps10060 = nil
			end

			local var_178_12 = 0
			local var_178_13 = 0.7

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_14 = arg_175_1:FormatText(StoryNameCfg[600].name)

				arg_175_1.leftNameTxt_.text = var_178_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_15 = arg_175_1:GetWordFromCfg(410201044)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 28
				local var_178_18 = utf8.len(var_178_16)
				local var_178_19 = var_178_17 <= 0 and var_178_13 or var_178_13 * (var_178_18 / var_178_17)

				if var_178_19 > 0 and var_178_13 < var_178_19 then
					arg_175_1.talkMaxDuration = var_178_19

					if var_178_19 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_19 + var_178_12
					end
				end

				arg_175_1.text_.text = var_178_16
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201044", "story_v_out_410201.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_410201", "410201044", "story_v_out_410201.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_410201", "410201044", "story_v_out_410201.awb")

						arg_175_1:RecordAudio("410201044", var_178_21)
						arg_175_1:RecordAudio("410201044", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410201", "410201044", "story_v_out_410201.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410201", "410201044", "story_v_out_410201.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_22 = math.max(var_178_13, arg_175_1.talkMaxDuration)

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_22 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_12) / var_178_22

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_12 + var_178_22 and arg_175_1.time_ < var_178_12 + var_178_22 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410201045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410201045
		arg_179_1.duration_ = 16.2

		local var_179_0 = {
			ja = 16.2,
			CriLanguages = 9.5,
			zh = 9.5
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
				arg_179_0:Play410201046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10062"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10062 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10062", 2)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(-390, -350, -180)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10062, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_182_7 = arg_179_1.actors_["10062"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps10062 == nil then
				arg_179_1.var_.actorSpriteComps10062 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.034

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps10062 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps10062 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps10062 = nil
			end

			local var_182_13 = 0
			local var_182_14 = 1.075

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_15 = arg_179_1:FormatText(StoryNameCfg[600].name)

				arg_179_1.leftNameTxt_.text = var_182_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_16 = arg_179_1:GetWordFromCfg(410201045)
				local var_182_17 = arg_179_1:FormatText(var_182_16.content)

				arg_179_1.text_.text = var_182_17

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_18 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201045", "story_v_out_410201.awb") ~= 0 then
					local var_182_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201045", "story_v_out_410201.awb") / 1000

					if var_182_21 + var_182_13 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_21 + var_182_13
					end

					if var_182_16.prefab_name ~= "" and arg_179_1.actors_[var_182_16.prefab_name] ~= nil then
						local var_182_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_16.prefab_name].transform, "story_v_out_410201", "410201045", "story_v_out_410201.awb")

						arg_179_1:RecordAudio("410201045", var_182_22)
						arg_179_1:RecordAudio("410201045", var_182_22)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410201", "410201045", "story_v_out_410201.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410201", "410201045", "story_v_out_410201.awb")
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
	Play410201046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410201046
		arg_183_1.duration_ = 3.966

		local var_183_0 = {
			ja = 3.966,
			CriLanguages = 3.4,
			zh = 3.4
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
				arg_183_0:Play410201047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10060"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10060 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10060", 4)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "split_5" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(390, -400, 0)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10060, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_186_7 = arg_183_1.actors_["10062"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10062 == nil then
				arg_183_1.var_.actorSpriteComps10062 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps10062 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 0.5, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps10062 then
				local var_186_12 = 0.5

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps10062 = nil
			end

			local var_186_13 = arg_183_1.actors_["10060"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 and arg_183_1.var_.actorSpriteComps10060 == nil then
				arg_183_1.var_.actorSpriteComps10060 = var_186_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_15 = 0.034

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_15 then
				local var_186_16 = (arg_183_1.time_ - var_186_14) / var_186_15

				if arg_183_1.var_.actorSpriteComps10060 then
					for iter_186_5, iter_186_6 in pairs(arg_183_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_186_6 then
							local var_186_17 = Mathf.Lerp(iter_186_6.color.r, 1, var_186_16)

							iter_186_6.color = Color.New(var_186_17, var_186_17, var_186_17)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.actorSpriteComps10060 then
				local var_186_18 = 1

				for iter_186_7, iter_186_8 in pairs(arg_183_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_186_8 then
						iter_186_8.color = Color.New(var_186_18, var_186_18, var_186_18)
					end
				end

				arg_183_1.var_.actorSpriteComps10060 = nil
			end

			local var_186_19 = 0
			local var_186_20 = 0.4

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[597].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(410201046)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201046", "story_v_out_410201.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201046", "story_v_out_410201.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_410201", "410201046", "story_v_out_410201.awb")

						arg_183_1:RecordAudio("410201046", var_186_28)
						arg_183_1:RecordAudio("410201046", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410201", "410201046", "story_v_out_410201.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410201", "410201046", "story_v_out_410201.awb")
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
	Play410201047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410201047
		arg_187_1.duration_ = 5.366

		local var_187_0 = {
			ja = 5.366,
			CriLanguages = 4.633,
			zh = 4.633
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
				arg_187_0:Play410201048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10062"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.actorSpriteComps10062 == nil then
				arg_187_1.var_.actorSpriteComps10062 = var_190_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_2 = 0.034

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.actorSpriteComps10062 then
					for iter_190_0, iter_190_1 in pairs(arg_187_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_190_1 then
							local var_190_4 = Mathf.Lerp(iter_190_1.color.r, 1, var_190_3)

							iter_190_1.color = Color.New(var_190_4, var_190_4, var_190_4)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.actorSpriteComps10062 then
				local var_190_5 = 1

				for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_190_3 then
						iter_190_3.color = Color.New(var_190_5, var_190_5, var_190_5)
					end
				end

				arg_187_1.var_.actorSpriteComps10062 = nil
			end

			local var_190_6 = arg_187_1.actors_["10060"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.actorSpriteComps10060 == nil then
				arg_187_1.var_.actorSpriteComps10060 = var_190_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_8 = 0.034

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.actorSpriteComps10060 then
					for iter_190_4, iter_190_5 in pairs(arg_187_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_190_5 then
							local var_190_10 = Mathf.Lerp(iter_190_5.color.r, 0.5, var_190_9)

							iter_190_5.color = Color.New(var_190_10, var_190_10, var_190_10)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10060 then
				local var_190_11 = 0.5

				for iter_190_6, iter_190_7 in pairs(arg_187_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_190_7 then
						iter_190_7.color = Color.New(var_190_11, var_190_11, var_190_11)
					end
				end

				arg_187_1.var_.actorSpriteComps10060 = nil
			end

			local var_190_12 = 0
			local var_190_13 = 0.375

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_14 = arg_187_1:FormatText(StoryNameCfg[600].name)

				arg_187_1.leftNameTxt_.text = var_190_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(410201047)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 15
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_13 or var_190_13 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_13 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_12
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201047", "story_v_out_410201.awb") ~= 0 then
					local var_190_20 = manager.audio:GetVoiceLength("story_v_out_410201", "410201047", "story_v_out_410201.awb") / 1000

					if var_190_20 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_12
					end

					if var_190_15.prefab_name ~= "" and arg_187_1.actors_[var_190_15.prefab_name] ~= nil then
						local var_190_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_15.prefab_name].transform, "story_v_out_410201", "410201047", "story_v_out_410201.awb")

						arg_187_1:RecordAudio("410201047", var_190_21)
						arg_187_1:RecordAudio("410201047", var_190_21)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410201", "410201047", "story_v_out_410201.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410201", "410201047", "story_v_out_410201.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_13, arg_187_1.talkMaxDuration)

			if var_190_12 <= arg_187_1.time_ and arg_187_1.time_ < var_190_12 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_12) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_12 + var_190_22 and arg_187_1.time_ < var_190_12 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410201048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410201048
		arg_191_1.duration_ = 20.333

		local var_191_0 = {
			ja = 20.333,
			CriLanguages = 6.533,
			zh = 6.533
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
				arg_191_0:Play410201049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10062"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10062 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10062", 2)

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
				local var_194_6 = Vector3.New(-390, -350, -180)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10062, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_194_7 = arg_191_1.actors_["10062"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 == nil then
				arg_191_1.var_.actorSpriteComps10062 = var_194_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_9 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_8) / var_194_9

				if arg_191_1.var_.actorSpriteComps10062 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_194_2 then
							local var_194_11 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_10)

							iter_194_2.color = Color.New(var_194_11, var_194_11, var_194_11)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_9 and arg_191_1.time_ < var_194_8 + var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 then
				local var_194_12 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_12, var_194_12, var_194_12)
					end
				end

				arg_191_1.var_.actorSpriteComps10062 = nil
			end

			local var_194_13 = 0
			local var_194_14 = 0.7

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_15 = arg_191_1:FormatText(StoryNameCfg[600].name)

				arg_191_1.leftNameTxt_.text = var_194_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_16 = arg_191_1:GetWordFromCfg(410201048)
				local var_194_17 = arg_191_1:FormatText(var_194_16.content)

				arg_191_1.text_.text = var_194_17

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_18 = 28
				local var_194_19 = utf8.len(var_194_17)
				local var_194_20 = var_194_18 <= 0 and var_194_14 or var_194_14 * (var_194_19 / var_194_18)

				if var_194_20 > 0 and var_194_14 < var_194_20 then
					arg_191_1.talkMaxDuration = var_194_20

					if var_194_20 + var_194_13 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_13
					end
				end

				arg_191_1.text_.text = var_194_17
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201048", "story_v_out_410201.awb") ~= 0 then
					local var_194_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201048", "story_v_out_410201.awb") / 1000

					if var_194_21 + var_194_13 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_21 + var_194_13
					end

					if var_194_16.prefab_name ~= "" and arg_191_1.actors_[var_194_16.prefab_name] ~= nil then
						local var_194_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_16.prefab_name].transform, "story_v_out_410201", "410201048", "story_v_out_410201.awb")

						arg_191_1:RecordAudio("410201048", var_194_22)
						arg_191_1:RecordAudio("410201048", var_194_22)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410201", "410201048", "story_v_out_410201.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410201", "410201048", "story_v_out_410201.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_23 = math.max(var_194_14, arg_191_1.talkMaxDuration)

			if var_194_13 <= arg_191_1.time_ and arg_191_1.time_ < var_194_13 + var_194_23 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_13) / var_194_23

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_13 + var_194_23 and arg_191_1.time_ < var_194_13 + var_194_23 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410201049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410201049
		arg_195_1.duration_ = 2.7

		local var_195_0 = {
			ja = 2.566,
			CriLanguages = 2.7,
			zh = 2.7
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
				arg_195_0:Play410201050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10060"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10060 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10060", 4)

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
				local var_198_6 = Vector3.New(390, -400, 0)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10060, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_198_7 = arg_195_1.actors_["10062"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps10062 == nil then
				arg_195_1.var_.actorSpriteComps10062 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.034

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps10062 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 0.5, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps10062 then
				local var_198_12 = 0.5

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps10062 = nil
			end

			local var_198_13 = arg_195_1.actors_["10060"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps10060 == nil then
				arg_195_1.var_.actorSpriteComps10060 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.034

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps10060 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 1, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps10060 then
				local var_198_18 = 1

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps10060 = nil
			end

			local var_198_19 = 0
			local var_198_20 = 0.15

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_21 = arg_195_1:FormatText(StoryNameCfg[597].name)

				arg_195_1.leftNameTxt_.text = var_198_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_22 = arg_195_1:GetWordFromCfg(410201049)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201049", "story_v_out_410201.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_410201", "410201049", "story_v_out_410201.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_410201", "410201049", "story_v_out_410201.awb")

						arg_195_1:RecordAudio("410201049", var_198_28)
						arg_195_1:RecordAudio("410201049", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410201", "410201049", "story_v_out_410201.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410201", "410201049", "story_v_out_410201.awb")
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
	Play410201050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410201050
		arg_199_1.duration_ = 9.166

		local var_199_0 = {
			ja = 8.3,
			CriLanguages = 9.166,
			zh = 9.166
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
				arg_199_0:Play410201051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.75

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[597].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(410201050)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 30
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201050", "story_v_out_410201.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_410201", "410201050", "story_v_out_410201.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_410201", "410201050", "story_v_out_410201.awb")

						arg_199_1:RecordAudio("410201050", var_202_9)
						arg_199_1:RecordAudio("410201050", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410201", "410201050", "story_v_out_410201.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410201", "410201050", "story_v_out_410201.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_10 and arg_199_1.time_ < var_202_0 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play410201051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410201051
		arg_203_1.duration_ = 9.433

		local var_203_0 = {
			ja = 9.433,
			CriLanguages = 4.333,
			zh = 4.333
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
				arg_203_0:Play410201052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10062"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10062 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10062", 7)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(0, -2000, -180)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10062, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_206_7 = arg_203_1.actors_["10060"].transform
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 then
				arg_203_1.var_.moveOldPos10060 = var_206_7.localPosition
				var_206_7.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10060", 7)

				local var_206_9 = var_206_7.childCount

				for iter_206_1 = 0, var_206_9 - 1 do
					local var_206_10 = var_206_7:GetChild(iter_206_1)

					if var_206_10.name == "" or not string.find(var_206_10.name, "split") then
						var_206_10.gameObject:SetActive(true)
					else
						var_206_10.gameObject:SetActive(false)
					end
				end
			end

			local var_206_11 = 0.001

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_8) / var_206_11
				local var_206_13 = Vector3.New(0, -2000, 0)

				var_206_7.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10060, var_206_13, var_206_12)
			end

			if arg_203_1.time_ >= var_206_8 + var_206_11 and arg_203_1.time_ < var_206_8 + var_206_11 + arg_206_0 then
				var_206_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_206_14 = arg_203_1.actors_["1061"].transform
			local var_206_15 = 0

			if var_206_15 < arg_203_1.time_ and arg_203_1.time_ <= var_206_15 + arg_206_0 then
				arg_203_1.var_.moveOldPos1061 = var_206_14.localPosition
				var_206_14.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("1061", 3)

				local var_206_16 = var_206_14.childCount

				for iter_206_2 = 0, var_206_16 - 1 do
					local var_206_17 = var_206_14:GetChild(iter_206_2)

					if var_206_17.name == "" or not string.find(var_206_17.name, "split") then
						var_206_17.gameObject:SetActive(true)
					else
						var_206_17.gameObject:SetActive(false)
					end
				end
			end

			local var_206_18 = 0.001

			if var_206_15 <= arg_203_1.time_ and arg_203_1.time_ < var_206_15 + var_206_18 then
				local var_206_19 = (arg_203_1.time_ - var_206_15) / var_206_18
				local var_206_20 = Vector3.New(0, -490, 18)

				var_206_14.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1061, var_206_20, var_206_19)
			end

			if arg_203_1.time_ >= var_206_15 + var_206_18 and arg_203_1.time_ < var_206_15 + var_206_18 + arg_206_0 then
				var_206_14.localPosition = Vector3.New(0, -490, 18)
			end

			local var_206_21 = arg_203_1.actors_["10062"]
			local var_206_22 = 0

			if var_206_22 < arg_203_1.time_ and arg_203_1.time_ <= var_206_22 + arg_206_0 and arg_203_1.var_.actorSpriteComps10062 == nil then
				arg_203_1.var_.actorSpriteComps10062 = var_206_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_23 = 0.034

			if var_206_22 <= arg_203_1.time_ and arg_203_1.time_ < var_206_22 + var_206_23 then
				local var_206_24 = (arg_203_1.time_ - var_206_22) / var_206_23

				if arg_203_1.var_.actorSpriteComps10062 then
					for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_206_4 then
							local var_206_25 = Mathf.Lerp(iter_206_4.color.r, 0.5, var_206_24)

							iter_206_4.color = Color.New(var_206_25, var_206_25, var_206_25)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_22 + var_206_23 and arg_203_1.time_ < var_206_22 + var_206_23 + arg_206_0 and arg_203_1.var_.actorSpriteComps10062 then
				local var_206_26 = 0.5

				for iter_206_5, iter_206_6 in pairs(arg_203_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_206_6 then
						iter_206_6.color = Color.New(var_206_26, var_206_26, var_206_26)
					end
				end

				arg_203_1.var_.actorSpriteComps10062 = nil
			end

			local var_206_27 = arg_203_1.actors_["10060"]
			local var_206_28 = 0

			if var_206_28 < arg_203_1.time_ and arg_203_1.time_ <= var_206_28 + arg_206_0 and arg_203_1.var_.actorSpriteComps10060 == nil then
				arg_203_1.var_.actorSpriteComps10060 = var_206_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_29 = 0.034

			if var_206_28 <= arg_203_1.time_ and arg_203_1.time_ < var_206_28 + var_206_29 then
				local var_206_30 = (arg_203_1.time_ - var_206_28) / var_206_29

				if arg_203_1.var_.actorSpriteComps10060 then
					for iter_206_7, iter_206_8 in pairs(arg_203_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_206_8 then
							local var_206_31 = Mathf.Lerp(iter_206_8.color.r, 0.5, var_206_30)

							iter_206_8.color = Color.New(var_206_31, var_206_31, var_206_31)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_28 + var_206_29 and arg_203_1.time_ < var_206_28 + var_206_29 + arg_206_0 and arg_203_1.var_.actorSpriteComps10060 then
				local var_206_32 = 0.5

				for iter_206_9, iter_206_10 in pairs(arg_203_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_206_10 then
						iter_206_10.color = Color.New(var_206_32, var_206_32, var_206_32)
					end
				end

				arg_203_1.var_.actorSpriteComps10060 = nil
			end

			local var_206_33 = arg_203_1.actors_["1061"]
			local var_206_34 = 0

			if var_206_34 < arg_203_1.time_ and arg_203_1.time_ <= var_206_34 + arg_206_0 and arg_203_1.var_.actorSpriteComps1061 == nil then
				arg_203_1.var_.actorSpriteComps1061 = var_206_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_35 = 0.034

			if var_206_34 <= arg_203_1.time_ and arg_203_1.time_ < var_206_34 + var_206_35 then
				local var_206_36 = (arg_203_1.time_ - var_206_34) / var_206_35

				if arg_203_1.var_.actorSpriteComps1061 then
					for iter_206_11, iter_206_12 in pairs(arg_203_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_206_12 then
							local var_206_37 = Mathf.Lerp(iter_206_12.color.r, 1, var_206_36)

							iter_206_12.color = Color.New(var_206_37, var_206_37, var_206_37)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_34 + var_206_35 and arg_203_1.time_ < var_206_34 + var_206_35 + arg_206_0 and arg_203_1.var_.actorSpriteComps1061 then
				local var_206_38 = 1

				for iter_206_13, iter_206_14 in pairs(arg_203_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_206_14 then
						iter_206_14.color = Color.New(var_206_38, var_206_38, var_206_38)
					end
				end

				arg_203_1.var_.actorSpriteComps1061 = nil
			end

			local var_206_39 = 0
			local var_206_40 = 0.425

			if var_206_39 < arg_203_1.time_ and arg_203_1.time_ <= var_206_39 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_41 = arg_203_1:FormatText(StoryNameCfg[612].name)

				arg_203_1.leftNameTxt_.text = var_206_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_42 = arg_203_1:GetWordFromCfg(410201051)
				local var_206_43 = arg_203_1:FormatText(var_206_42.content)

				arg_203_1.text_.text = var_206_43

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_44 = 17
				local var_206_45 = utf8.len(var_206_43)
				local var_206_46 = var_206_44 <= 0 and var_206_40 or var_206_40 * (var_206_45 / var_206_44)

				if var_206_46 > 0 and var_206_40 < var_206_46 then
					arg_203_1.talkMaxDuration = var_206_46

					if var_206_46 + var_206_39 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_46 + var_206_39
					end
				end

				arg_203_1.text_.text = var_206_43
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201051", "story_v_out_410201.awb") ~= 0 then
					local var_206_47 = manager.audio:GetVoiceLength("story_v_out_410201", "410201051", "story_v_out_410201.awb") / 1000

					if var_206_47 + var_206_39 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_47 + var_206_39
					end

					if var_206_42.prefab_name ~= "" and arg_203_1.actors_[var_206_42.prefab_name] ~= nil then
						local var_206_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_42.prefab_name].transform, "story_v_out_410201", "410201051", "story_v_out_410201.awb")

						arg_203_1:RecordAudio("410201051", var_206_48)
						arg_203_1:RecordAudio("410201051", var_206_48)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410201", "410201051", "story_v_out_410201.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410201", "410201051", "story_v_out_410201.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_49 = math.max(var_206_40, arg_203_1.talkMaxDuration)

			if var_206_39 <= arg_203_1.time_ and arg_203_1.time_ < var_206_39 + var_206_49 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_39) / var_206_49

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_39 + var_206_49 and arg_203_1.time_ < var_206_39 + var_206_49 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410201052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410201052
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play410201053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1061"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1061 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1061", 7)

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
				local var_210_6 = Vector3.New(0, -2000, 18)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1061, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_210_7 = arg_207_1.actors_["1061"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps1061 == nil then
				arg_207_1.var_.actorSpriteComps1061 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.034

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps1061 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 0.5, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps1061 then
				local var_210_12 = 0.5

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps1061 = nil
			end

			local var_210_13 = 0
			local var_210_14 = 0.925

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(410201052)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 37
				local var_210_18 = utf8.len(var_210_16)
				local var_210_19 = var_210_17 <= 0 and var_210_14 or var_210_14 * (var_210_18 / var_210_17)

				if var_210_19 > 0 and var_210_14 < var_210_19 then
					arg_207_1.talkMaxDuration = var_210_19

					if var_210_19 + var_210_13 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_19 + var_210_13
					end
				end

				arg_207_1.text_.text = var_210_16
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_20 = math.max(var_210_14, arg_207_1.talkMaxDuration)

			if var_210_13 <= arg_207_1.time_ and arg_207_1.time_ < var_210_13 + var_210_20 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_13) / var_210_20

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_13 + var_210_20 and arg_207_1.time_ < var_210_13 + var_210_20 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410201053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410201053
		arg_211_1.duration_ = 9

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410201054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = "ST63"

			if arg_211_1.bgs_[var_214_0] == nil then
				local var_214_1 = Object.Instantiate(arg_211_1.paintGo_)

				var_214_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_214_0)
				var_214_1.name = var_214_0
				var_214_1.transform.parent = arg_211_1.stage_.transform
				var_214_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_211_1.bgs_[var_214_0] = var_214_1
			end

			local var_214_2 = 2

			if var_214_2 < arg_211_1.time_ and arg_211_1.time_ <= var_214_2 + arg_214_0 then
				local var_214_3 = manager.ui.mainCamera.transform.localPosition
				local var_214_4 = Vector3.New(0, 0, 10) + Vector3.New(var_214_3.x, var_214_3.y, 0)
				local var_214_5 = arg_211_1.bgs_.ST63

				var_214_5.transform.localPosition = var_214_4
				var_214_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_214_6 = var_214_5:GetComponent("SpriteRenderer")

				if var_214_6 and var_214_6.sprite then
					local var_214_7 = (var_214_5.transform.localPosition - var_214_3).z
					local var_214_8 = manager.ui.mainCameraCom_
					local var_214_9 = 2 * var_214_7 * Mathf.Tan(var_214_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_214_10 = var_214_9 * var_214_8.aspect
					local var_214_11 = var_214_6.sprite.bounds.size.x
					local var_214_12 = var_214_6.sprite.bounds.size.y
					local var_214_13 = var_214_10 / var_214_11
					local var_214_14 = var_214_9 / var_214_12
					local var_214_15 = var_214_14 < var_214_13 and var_214_13 or var_214_14

					var_214_5.transform.localScale = Vector3.New(var_214_15, var_214_15, 0)
				end

				for iter_214_0, iter_214_1 in pairs(arg_211_1.bgs_) do
					if iter_214_0 ~= "ST63" then
						iter_214_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_214_16 = 0

			if var_214_16 < arg_211_1.time_ and arg_211_1.time_ <= var_214_16 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_17 = 2

			if var_214_16 <= arg_211_1.time_ and arg_211_1.time_ < var_214_16 + var_214_17 then
				local var_214_18 = (arg_211_1.time_ - var_214_16) / var_214_17
				local var_214_19 = Color.New(0, 0, 0)

				var_214_19.a = Mathf.Lerp(0, 1, var_214_18)
				arg_211_1.mask_.color = var_214_19
			end

			if arg_211_1.time_ >= var_214_16 + var_214_17 and arg_211_1.time_ < var_214_16 + var_214_17 + arg_214_0 then
				local var_214_20 = Color.New(0, 0, 0)

				var_214_20.a = 1
				arg_211_1.mask_.color = var_214_20
			end

			local var_214_21 = 2

			if var_214_21 < arg_211_1.time_ and arg_211_1.time_ <= var_214_21 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_22 = 2

			if var_214_21 <= arg_211_1.time_ and arg_211_1.time_ < var_214_21 + var_214_22 then
				local var_214_23 = (arg_211_1.time_ - var_214_21) / var_214_22
				local var_214_24 = Color.New(0, 0, 0)

				var_214_24.a = Mathf.Lerp(1, 0, var_214_23)
				arg_211_1.mask_.color = var_214_24
			end

			if arg_211_1.time_ >= var_214_21 + var_214_22 and arg_211_1.time_ < var_214_21 + var_214_22 + arg_214_0 then
				local var_214_25 = Color.New(0, 0, 0)
				local var_214_26 = 0

				arg_211_1.mask_.enabled = false
				var_214_25.a = var_214_26
				arg_211_1.mask_.color = var_214_25
			end

			if arg_211_1.frameCnt_ <= 1 then
				arg_211_1.dialog_:SetActive(false)
			end

			local var_214_27 = 4
			local var_214_28 = 1.05

			if var_214_27 < arg_211_1.time_ and arg_211_1.time_ <= var_214_27 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				arg_211_1.dialog_:SetActive(true)

				local var_214_29 = LeanTween.value(arg_211_1.dialog_, 0, 1, 0.3)

				var_214_29:setOnUpdate(LuaHelper.FloatAction(function(arg_215_0)
					arg_211_1.dialogCg_.alpha = arg_215_0
				end))
				var_214_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_211_1.dialog_)
					var_214_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_211_1.duration_ = arg_211_1.duration_ + 0.3

				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_30 = arg_211_1:GetWordFromCfg(410201053)
				local var_214_31 = arg_211_1:FormatText(var_214_30.content)

				arg_211_1.text_.text = var_214_31

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_32 = 42
				local var_214_33 = utf8.len(var_214_31)
				local var_214_34 = var_214_32 <= 0 and var_214_28 or var_214_28 * (var_214_33 / var_214_32)

				if var_214_34 > 0 and var_214_28 < var_214_34 then
					arg_211_1.talkMaxDuration = var_214_34
					var_214_27 = var_214_27 + 0.3

					if var_214_34 + var_214_27 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_34 + var_214_27
					end
				end

				arg_211_1.text_.text = var_214_31
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_35 = var_214_27 + 0.3
			local var_214_36 = math.max(var_214_28, arg_211_1.talkMaxDuration)

			if var_214_35 <= arg_211_1.time_ and arg_211_1.time_ < var_214_35 + var_214_36 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_35) / var_214_36

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_35 + var_214_36 and arg_211_1.time_ < var_214_35 + var_214_36 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410201054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410201054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play410201055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1.025

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

				local var_220_2 = arg_217_1:GetWordFromCfg(410201054)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 41
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
	Play410201055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 410201055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play410201056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.8

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

				local var_224_2 = arg_221_1:GetWordFromCfg(410201055)
				local var_224_3 = arg_221_1:FormatText(var_224_2.content)

				arg_221_1.text_.text = var_224_3

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_4 = 32
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
	Play410201056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 410201056
		arg_225_1.duration_ = 6.333

		local var_225_0 = {
			ja = 6.333,
			CriLanguages = 2.633,
			zh = 2.633
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
				arg_225_0:Play410201057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1061"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1061 = var_228_0.localPosition
				var_228_0.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("1061", 3)

				local var_228_2 = var_228_0.childCount

				for iter_228_0 = 0, var_228_2 - 1 do
					local var_228_3 = var_228_0:GetChild(iter_228_0)

					if var_228_3.name == "" or not string.find(var_228_3.name, "split") then
						var_228_3.gameObject:SetActive(true)
					else
						var_228_3.gameObject:SetActive(false)
					end
				end
			end

			local var_228_4 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_4 then
				local var_228_5 = (arg_225_1.time_ - var_228_1) / var_228_4
				local var_228_6 = Vector3.New(0, -490, 18)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1061, var_228_6, var_228_5)
			end

			if arg_225_1.time_ >= var_228_1 + var_228_4 and arg_225_1.time_ < var_228_1 + var_228_4 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_228_7 = arg_225_1.actors_["1061"]
			local var_228_8 = 0

			if var_228_8 < arg_225_1.time_ and arg_225_1.time_ <= var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps1061 == nil then
				arg_225_1.var_.actorSpriteComps1061 = var_228_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_9 = 0.034

			if var_228_8 <= arg_225_1.time_ and arg_225_1.time_ < var_228_8 + var_228_9 then
				local var_228_10 = (arg_225_1.time_ - var_228_8) / var_228_9

				if arg_225_1.var_.actorSpriteComps1061 then
					for iter_228_1, iter_228_2 in pairs(arg_225_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_228_2 then
							local var_228_11 = Mathf.Lerp(iter_228_2.color.r, 1, var_228_10)

							iter_228_2.color = Color.New(var_228_11, var_228_11, var_228_11)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_8 + var_228_9 and arg_225_1.time_ < var_228_8 + var_228_9 + arg_228_0 and arg_225_1.var_.actorSpriteComps1061 then
				local var_228_12 = 1

				for iter_228_3, iter_228_4 in pairs(arg_225_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_228_4 then
						iter_228_4.color = Color.New(var_228_12, var_228_12, var_228_12)
					end
				end

				arg_225_1.var_.actorSpriteComps1061 = nil
			end

			local var_228_13 = 0
			local var_228_14 = 0.225

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_15 = arg_225_1:FormatText(StoryNameCfg[612].name)

				arg_225_1.leftNameTxt_.text = var_228_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_16 = arg_225_1:GetWordFromCfg(410201056)
				local var_228_17 = arg_225_1:FormatText(var_228_16.content)

				arg_225_1.text_.text = var_228_17

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_18 = 9
				local var_228_19 = utf8.len(var_228_17)
				local var_228_20 = var_228_18 <= 0 and var_228_14 or var_228_14 * (var_228_19 / var_228_18)

				if var_228_20 > 0 and var_228_14 < var_228_20 then
					arg_225_1.talkMaxDuration = var_228_20

					if var_228_20 + var_228_13 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_13
					end
				end

				arg_225_1.text_.text = var_228_17
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201056", "story_v_out_410201.awb") ~= 0 then
					local var_228_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201056", "story_v_out_410201.awb") / 1000

					if var_228_21 + var_228_13 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_13
					end

					if var_228_16.prefab_name ~= "" and arg_225_1.actors_[var_228_16.prefab_name] ~= nil then
						local var_228_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_16.prefab_name].transform, "story_v_out_410201", "410201056", "story_v_out_410201.awb")

						arg_225_1:RecordAudio("410201056", var_228_22)
						arg_225_1:RecordAudio("410201056", var_228_22)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_410201", "410201056", "story_v_out_410201.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_410201", "410201056", "story_v_out_410201.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_23 = math.max(var_228_14, arg_225_1.talkMaxDuration)

			if var_228_13 <= arg_225_1.time_ and arg_225_1.time_ < var_228_13 + var_228_23 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_13) / var_228_23

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_13 + var_228_23 and arg_225_1.time_ < var_228_13 + var_228_23 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play410201057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 410201057
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play410201058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1061"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.actorSpriteComps1061 == nil then
				arg_229_1.var_.actorSpriteComps1061 = var_232_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_2 = 0.034

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.actorSpriteComps1061 then
					for iter_232_0, iter_232_1 in pairs(arg_229_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_232_1 then
							local var_232_4 = Mathf.Lerp(iter_232_1.color.r, 0.5, var_232_3)

							iter_232_1.color = Color.New(var_232_4, var_232_4, var_232_4)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.actorSpriteComps1061 then
				local var_232_5 = 0.5

				for iter_232_2, iter_232_3 in pairs(arg_229_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_232_3 then
						iter_232_3.color = Color.New(var_232_5, var_232_5, var_232_5)
					end
				end

				arg_229_1.var_.actorSpriteComps1061 = nil
			end

			local var_232_6 = arg_229_1.actors_["1061"].transform
			local var_232_7 = 0

			if var_232_7 < arg_229_1.time_ and arg_229_1.time_ <= var_232_7 + arg_232_0 then
				arg_229_1.var_.moveOldPos1061 = var_232_6.localPosition
				var_232_6.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("1061", 7)

				local var_232_8 = var_232_6.childCount

				for iter_232_4 = 0, var_232_8 - 1 do
					local var_232_9 = var_232_6:GetChild(iter_232_4)

					if var_232_9.name == "" or not string.find(var_232_9.name, "split") then
						var_232_9.gameObject:SetActive(true)
					else
						var_232_9.gameObject:SetActive(false)
					end
				end
			end

			local var_232_10 = 0.001

			if var_232_7 <= arg_229_1.time_ and arg_229_1.time_ < var_232_7 + var_232_10 then
				local var_232_11 = (arg_229_1.time_ - var_232_7) / var_232_10
				local var_232_12 = Vector3.New(0, -2000, 18)

				var_232_6.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1061, var_232_12, var_232_11)
			end

			if arg_229_1.time_ >= var_232_7 + var_232_10 and arg_229_1.time_ < var_232_7 + var_232_10 + arg_232_0 then
				var_232_6.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_232_13 = 0
			local var_232_14 = 1.225

			if var_232_13 < arg_229_1.time_ and arg_229_1.time_ <= var_232_13 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_15 = arg_229_1:GetWordFromCfg(410201057)
				local var_232_16 = arg_229_1:FormatText(var_232_15.content)

				arg_229_1.text_.text = var_232_16

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_17 = 49
				local var_232_18 = utf8.len(var_232_16)
				local var_232_19 = var_232_17 <= 0 and var_232_14 or var_232_14 * (var_232_18 / var_232_17)

				if var_232_19 > 0 and var_232_14 < var_232_19 then
					arg_229_1.talkMaxDuration = var_232_19

					if var_232_19 + var_232_13 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_13
					end
				end

				arg_229_1.text_.text = var_232_16
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_20 = math.max(var_232_14, arg_229_1.talkMaxDuration)

			if var_232_13 <= arg_229_1.time_ and arg_229_1.time_ < var_232_13 + var_232_20 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_13) / var_232_20

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_13 + var_232_20 and arg_229_1.time_ < var_232_13 + var_232_20 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play410201058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 410201058
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play410201059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.166666666666667

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				local var_236_2 = "play"
				local var_236_3 = "effect"

				arg_233_1:AudioAction(var_236_2, var_236_3, "se_story_129", "se_story_129_glass", "")
			end

			local var_236_4 = 0
			local var_236_5 = 1.125

			if var_236_4 < arg_233_1.time_ and arg_233_1.time_ <= var_236_4 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_6 = arg_233_1:GetWordFromCfg(410201058)
				local var_236_7 = arg_233_1:FormatText(var_236_6.content)

				arg_233_1.text_.text = var_236_7

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_8 = 45
				local var_236_9 = utf8.len(var_236_7)
				local var_236_10 = var_236_8 <= 0 and var_236_5 or var_236_5 * (var_236_9 / var_236_8)

				if var_236_10 > 0 and var_236_5 < var_236_10 then
					arg_233_1.talkMaxDuration = var_236_10

					if var_236_10 + var_236_4 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_10 + var_236_4
					end
				end

				arg_233_1.text_.text = var_236_7
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_11 = math.max(var_236_5, arg_233_1.talkMaxDuration)

			if var_236_4 <= arg_233_1.time_ and arg_233_1.time_ < var_236_4 + var_236_11 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_4) / var_236_11

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_4 + var_236_11 and arg_233_1.time_ < var_236_4 + var_236_11 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play410201059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 410201059
		arg_237_1.duration_ = 5.6

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play410201060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.mask_.enabled = true
				arg_237_1.mask_.raycastTarget = true

				arg_237_1:SetGaussion(false)
			end

			local var_240_1 = 1

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_1 then
				local var_240_2 = (arg_237_1.time_ - var_240_0) / var_240_1
				local var_240_3 = Color.New(1, 1, 1)

				var_240_3.a = Mathf.Lerp(1, 0, var_240_2)
				arg_237_1.mask_.color = var_240_3
			end

			if arg_237_1.time_ >= var_240_0 + var_240_1 and arg_237_1.time_ < var_240_0 + var_240_1 + arg_240_0 then
				local var_240_4 = Color.New(1, 1, 1)
				local var_240_5 = 0

				arg_237_1.mask_.enabled = false
				var_240_4.a = var_240_5
				arg_237_1.mask_.color = var_240_4
			end

			local var_240_6 = manager.ui.mainCamera.transform
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 then
				arg_237_1.var_.shakeOldPos = var_240_6.localPosition
			end

			local var_240_8 = 1

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / 0.066
				local var_240_10, var_240_11 = math.modf(var_240_9)

				var_240_6.localPosition = Vector3.New(var_240_11 * 0.13, var_240_11 * 0.13, var_240_11 * 0.13) + arg_237_1.var_.shakeOldPos
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 then
				var_240_6.localPosition = arg_237_1.var_.shakeOldPos
			end

			local var_240_12 = 0

			if var_240_12 < arg_237_1.time_ and arg_237_1.time_ <= var_240_12 + arg_240_0 then
				arg_237_1.allBtn_.enabled = false
			end

			local var_240_13 = 1

			if arg_237_1.time_ >= var_240_12 + var_240_13 and arg_237_1.time_ < var_240_12 + var_240_13 + arg_240_0 then
				arg_237_1.allBtn_.enabled = true
			end

			if arg_237_1.frameCnt_ <= 1 then
				arg_237_1.dialog_:SetActive(false)
			end

			local var_240_14 = 0.6
			local var_240_15 = 1.7

			if var_240_14 < arg_237_1.time_ and arg_237_1.time_ <= var_240_14 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0

				arg_237_1.dialog_:SetActive(true)

				local var_240_16 = LeanTween.value(arg_237_1.dialog_, 0, 1, 0.3)

				var_240_16:setOnUpdate(LuaHelper.FloatAction(function(arg_241_0)
					arg_237_1.dialogCg_.alpha = arg_241_0
				end))
				var_240_16:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_237_1.dialog_)
					var_240_16:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_237_1.duration_ = arg_237_1.duration_ + 0.3

				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_17 = arg_237_1:GetWordFromCfg(410201059)
				local var_240_18 = arg_237_1:FormatText(var_240_17.content)

				arg_237_1.text_.text = var_240_18

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_19 = 68
				local var_240_20 = utf8.len(var_240_18)
				local var_240_21 = var_240_19 <= 0 and var_240_15 or var_240_15 * (var_240_20 / var_240_19)

				if var_240_21 > 0 and var_240_15 < var_240_21 then
					arg_237_1.talkMaxDuration = var_240_21
					var_240_14 = var_240_14 + 0.3

					if var_240_21 + var_240_14 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_21 + var_240_14
					end
				end

				arg_237_1.text_.text = var_240_18
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_22 = var_240_14 + 0.3
			local var_240_23 = math.max(var_240_15, arg_237_1.talkMaxDuration)

			if var_240_22 <= arg_237_1.time_ and arg_237_1.time_ < var_240_22 + var_240_23 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_22) / var_240_23

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_22 + var_240_23 and arg_237_1.time_ < var_240_22 + var_240_23 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play410201060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410201060
		arg_243_1.duration_ = 4.3

		local var_243_0 = {
			ja = 4.266,
			CriLanguages = 4.3,
			zh = 4.3
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
				arg_243_0:Play410201061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1061"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1061 = var_246_0.localPosition
				var_246_0.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("1061", 3)

				local var_246_2 = var_246_0.childCount

				for iter_246_0 = 0, var_246_2 - 1 do
					local var_246_3 = var_246_0:GetChild(iter_246_0)

					if var_246_3.name == "split_5" or not string.find(var_246_3.name, "split") then
						var_246_3.gameObject:SetActive(true)
					else
						var_246_3.gameObject:SetActive(false)
					end
				end
			end

			local var_246_4 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_4 then
				local var_246_5 = (arg_243_1.time_ - var_246_1) / var_246_4
				local var_246_6 = Vector3.New(0, -490, 18)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1061, var_246_6, var_246_5)
			end

			if arg_243_1.time_ >= var_246_1 + var_246_4 and arg_243_1.time_ < var_246_1 + var_246_4 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_246_7 = arg_243_1.actors_["1061"]
			local var_246_8 = 0

			if var_246_8 < arg_243_1.time_ and arg_243_1.time_ <= var_246_8 + arg_246_0 and arg_243_1.var_.actorSpriteComps1061 == nil then
				arg_243_1.var_.actorSpriteComps1061 = var_246_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_9 = 0.034

			if var_246_8 <= arg_243_1.time_ and arg_243_1.time_ < var_246_8 + var_246_9 then
				local var_246_10 = (arg_243_1.time_ - var_246_8) / var_246_9

				if arg_243_1.var_.actorSpriteComps1061 then
					for iter_246_1, iter_246_2 in pairs(arg_243_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_246_2 then
							local var_246_11 = Mathf.Lerp(iter_246_2.color.r, 1, var_246_10)

							iter_246_2.color = Color.New(var_246_11, var_246_11, var_246_11)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_8 + var_246_9 and arg_243_1.time_ < var_246_8 + var_246_9 + arg_246_0 and arg_243_1.var_.actorSpriteComps1061 then
				local var_246_12 = 1

				for iter_246_3, iter_246_4 in pairs(arg_243_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_246_4 then
						iter_246_4.color = Color.New(var_246_12, var_246_12, var_246_12)
					end
				end

				arg_243_1.var_.actorSpriteComps1061 = nil
			end

			local var_246_13 = 0
			local var_246_14 = 0.375

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_15 = arg_243_1:FormatText(StoryNameCfg[612].name)

				arg_243_1.leftNameTxt_.text = var_246_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_16 = arg_243_1:GetWordFromCfg(410201060)
				local var_246_17 = arg_243_1:FormatText(var_246_16.content)

				arg_243_1.text_.text = var_246_17

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_18 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201060", "story_v_out_410201.awb") ~= 0 then
					local var_246_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201060", "story_v_out_410201.awb") / 1000

					if var_246_21 + var_246_13 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_21 + var_246_13
					end

					if var_246_16.prefab_name ~= "" and arg_243_1.actors_[var_246_16.prefab_name] ~= nil then
						local var_246_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_16.prefab_name].transform, "story_v_out_410201", "410201060", "story_v_out_410201.awb")

						arg_243_1:RecordAudio("410201060", var_246_22)
						arg_243_1:RecordAudio("410201060", var_246_22)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_410201", "410201060", "story_v_out_410201.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_410201", "410201060", "story_v_out_410201.awb")
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
	Play410201061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410201061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play410201062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1061"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 == nil then
				arg_247_1.var_.actorSpriteComps1061 = var_250_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_2 = 0.034

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.actorSpriteComps1061 then
					for iter_250_0, iter_250_1 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_250_1 then
							local var_250_4 = Mathf.Lerp(iter_250_1.color.r, 0.5, var_250_3)

							iter_250_1.color = Color.New(var_250_4, var_250_4, var_250_4)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 then
				local var_250_5 = 0.5

				for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_250_3 then
						iter_250_3.color = Color.New(var_250_5, var_250_5, var_250_5)
					end
				end

				arg_247_1.var_.actorSpriteComps1061 = nil
			end

			local var_250_6 = arg_247_1.actors_["1061"].transform
			local var_250_7 = 0

			if var_250_7 < arg_247_1.time_ and arg_247_1.time_ <= var_250_7 + arg_250_0 then
				arg_247_1.var_.moveOldPos1061 = var_250_6.localPosition
				var_250_6.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1061", 7)

				local var_250_8 = var_250_6.childCount

				for iter_250_4 = 0, var_250_8 - 1 do
					local var_250_9 = var_250_6:GetChild(iter_250_4)

					if var_250_9.name == "split_5" or not string.find(var_250_9.name, "split") then
						var_250_9.gameObject:SetActive(true)
					else
						var_250_9.gameObject:SetActive(false)
					end
				end
			end

			local var_250_10 = 0.001

			if var_250_7 <= arg_247_1.time_ and arg_247_1.time_ < var_250_7 + var_250_10 then
				local var_250_11 = (arg_247_1.time_ - var_250_7) / var_250_10
				local var_250_12 = Vector3.New(0, -2000, 18)

				var_250_6.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1061, var_250_12, var_250_11)
			end

			if arg_247_1.time_ >= var_250_7 + var_250_10 and arg_247_1.time_ < var_250_7 + var_250_10 + arg_250_0 then
				var_250_6.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_250_13 = 0
			local var_250_14 = 1.425

			if var_250_13 < arg_247_1.time_ and arg_247_1.time_ <= var_250_13 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_15 = arg_247_1:GetWordFromCfg(410201061)
				local var_250_16 = arg_247_1:FormatText(var_250_15.content)

				arg_247_1.text_.text = var_250_16

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_17 = 57
				local var_250_18 = utf8.len(var_250_16)
				local var_250_19 = var_250_17 <= 0 and var_250_14 or var_250_14 * (var_250_18 / var_250_17)

				if var_250_19 > 0 and var_250_14 < var_250_19 then
					arg_247_1.talkMaxDuration = var_250_19

					if var_250_19 + var_250_13 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_19 + var_250_13
					end
				end

				arg_247_1.text_.text = var_250_16
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_20 = math.max(var_250_14, arg_247_1.talkMaxDuration)

			if var_250_13 <= arg_247_1.time_ and arg_247_1.time_ < var_250_13 + var_250_20 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_13) / var_250_20

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_13 + var_250_20 and arg_247_1.time_ < var_250_13 + var_250_20 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410201062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410201062
		arg_251_1.duration_ = 2.533

		local var_251_0 = {
			ja = 0.999999999999,
			CriLanguages = 2.533,
			zh = 2.533
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
				arg_251_0:Play410201063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1061"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1061 = var_254_0.localPosition
				var_254_0.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("1061", 3)

				local var_254_2 = var_254_0.childCount

				for iter_254_0 = 0, var_254_2 - 1 do
					local var_254_3 = var_254_0:GetChild(iter_254_0)

					if var_254_3.name == "split_9" or not string.find(var_254_3.name, "split") then
						var_254_3.gameObject:SetActive(true)
					else
						var_254_3.gameObject:SetActive(false)
					end
				end
			end

			local var_254_4 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_4 then
				local var_254_5 = (arg_251_1.time_ - var_254_1) / var_254_4
				local var_254_6 = Vector3.New(0, -490, 18)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1061, var_254_6, var_254_5)
			end

			if arg_251_1.time_ >= var_254_1 + var_254_4 and arg_251_1.time_ < var_254_1 + var_254_4 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_254_7 = arg_251_1.actors_["1061"]
			local var_254_8 = 0

			if var_254_8 < arg_251_1.time_ and arg_251_1.time_ <= var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps1061 == nil then
				arg_251_1.var_.actorSpriteComps1061 = var_254_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_9 = 0.034

			if var_254_8 <= arg_251_1.time_ and arg_251_1.time_ < var_254_8 + var_254_9 then
				local var_254_10 = (arg_251_1.time_ - var_254_8) / var_254_9

				if arg_251_1.var_.actorSpriteComps1061 then
					for iter_254_1, iter_254_2 in pairs(arg_251_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_254_2 then
							local var_254_11 = Mathf.Lerp(iter_254_2.color.r, 1, var_254_10)

							iter_254_2.color = Color.New(var_254_11, var_254_11, var_254_11)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_8 + var_254_9 and arg_251_1.time_ < var_254_8 + var_254_9 + arg_254_0 and arg_251_1.var_.actorSpriteComps1061 then
				local var_254_12 = 1

				for iter_254_3, iter_254_4 in pairs(arg_251_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_254_4 then
						iter_254_4.color = Color.New(var_254_12, var_254_12, var_254_12)
					end
				end

				arg_251_1.var_.actorSpriteComps1061 = nil
			end

			local var_254_13 = 0
			local var_254_14 = 0.075

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_15 = arg_251_1:FormatText(StoryNameCfg[612].name)

				arg_251_1.leftNameTxt_.text = var_254_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_16 = arg_251_1:GetWordFromCfg(410201062)
				local var_254_17 = arg_251_1:FormatText(var_254_16.content)

				arg_251_1.text_.text = var_254_17

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_18 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201062", "story_v_out_410201.awb") ~= 0 then
					local var_254_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201062", "story_v_out_410201.awb") / 1000

					if var_254_21 + var_254_13 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_21 + var_254_13
					end

					if var_254_16.prefab_name ~= "" and arg_251_1.actors_[var_254_16.prefab_name] ~= nil then
						local var_254_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_16.prefab_name].transform, "story_v_out_410201", "410201062", "story_v_out_410201.awb")

						arg_251_1:RecordAudio("410201062", var_254_22)
						arg_251_1:RecordAudio("410201062", var_254_22)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410201", "410201062", "story_v_out_410201.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410201", "410201062", "story_v_out_410201.awb")
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
	Play410201063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410201063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play410201064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1061"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1061 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1061", 7)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(0, -2000, 18)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1061, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_258_7 = 0
			local var_258_8 = 1.35

			if var_258_7 < arg_255_1.time_ and arg_255_1.time_ <= var_258_7 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(410201063)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 54
				local var_258_12 = utf8.len(var_258_10)
				local var_258_13 = var_258_11 <= 0 and var_258_8 or var_258_8 * (var_258_12 / var_258_11)

				if var_258_13 > 0 and var_258_8 < var_258_13 then
					arg_255_1.talkMaxDuration = var_258_13

					if var_258_13 + var_258_7 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_7
					end
				end

				arg_255_1.text_.text = var_258_10
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_14 = math.max(var_258_8, arg_255_1.talkMaxDuration)

			if var_258_7 <= arg_255_1.time_ and arg_255_1.time_ < var_258_7 + var_258_14 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_7) / var_258_14

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_7 + var_258_14 and arg_255_1.time_ < var_258_7 + var_258_14 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play410201064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410201064
		arg_259_1.duration_ = 5.4

		local var_259_0 = {
			ja = 3.5,
			CriLanguages = 5.4,
			zh = 5.4
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
				arg_259_0:Play410201065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = "L03f"

			if arg_259_1.bgs_[var_262_0] == nil then
				local var_262_1 = Object.Instantiate(arg_259_1.paintGo_)

				var_262_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_262_0)
				var_262_1.name = var_262_0
				var_262_1.transform.parent = arg_259_1.stage_.transform
				var_262_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_259_1.bgs_[var_262_0] = var_262_1
			end

			local var_262_2 = 0

			if var_262_2 < arg_259_1.time_ and arg_259_1.time_ <= var_262_2 + arg_262_0 then
				local var_262_3 = manager.ui.mainCamera.transform.localPosition
				local var_262_4 = Vector3.New(0, 0, 10) + Vector3.New(var_262_3.x, var_262_3.y, 0)
				local var_262_5 = arg_259_1.bgs_.L03f

				var_262_5.transform.localPosition = var_262_4
				var_262_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_262_6 = var_262_5:GetComponent("SpriteRenderer")

				if var_262_6 and var_262_6.sprite then
					local var_262_7 = (var_262_5.transform.localPosition - var_262_3).z
					local var_262_8 = manager.ui.mainCameraCom_
					local var_262_9 = 2 * var_262_7 * Mathf.Tan(var_262_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_262_10 = var_262_9 * var_262_8.aspect
					local var_262_11 = var_262_6.sprite.bounds.size.x
					local var_262_12 = var_262_6.sprite.bounds.size.y
					local var_262_13 = var_262_10 / var_262_11
					local var_262_14 = var_262_9 / var_262_12
					local var_262_15 = var_262_14 < var_262_13 and var_262_13 or var_262_14

					var_262_5.transform.localScale = Vector3.New(var_262_15, var_262_15, 0)
				end

				for iter_262_0, iter_262_1 in pairs(arg_259_1.bgs_) do
					if iter_262_0 ~= "L03f" then
						iter_262_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_262_16 = 0

			if var_262_16 < arg_259_1.time_ and arg_259_1.time_ <= var_262_16 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_17 = 2

			if var_262_16 <= arg_259_1.time_ and arg_259_1.time_ < var_262_16 + var_262_17 then
				local var_262_18 = (arg_259_1.time_ - var_262_16) / var_262_17
				local var_262_19 = Color.New(1, 1, 1)

				var_262_19.a = Mathf.Lerp(1, 0, var_262_18)
				arg_259_1.mask_.color = var_262_19
			end

			if arg_259_1.time_ >= var_262_16 + var_262_17 and arg_259_1.time_ < var_262_16 + var_262_17 + arg_262_0 then
				local var_262_20 = Color.New(1, 1, 1)
				local var_262_21 = 0

				arg_259_1.mask_.enabled = false
				var_262_20.a = var_262_21
				arg_259_1.mask_.color = var_262_20
			end

			local var_262_22 = "10059"

			if arg_259_1.actors_[var_262_22] == nil then
				local var_262_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_262_22), arg_259_1.canvasGo_.transform)

				var_262_23.transform:SetSiblingIndex(1)

				var_262_23.name = var_262_22
				var_262_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_259_1.actors_[var_262_22] = var_262_23
			end

			local var_262_24 = arg_259_1.actors_["10059"].transform
			local var_262_25 = 2

			if var_262_25 < arg_259_1.time_ and arg_259_1.time_ <= var_262_25 + arg_262_0 then
				arg_259_1.var_.moveOldPos10059 = var_262_24.localPosition
				var_262_24.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10059", 3)

				local var_262_26 = var_262_24.childCount

				for iter_262_2 = 0, var_262_26 - 1 do
					local var_262_27 = var_262_24:GetChild(iter_262_2)

					if var_262_27.name == "split_5" or not string.find(var_262_27.name, "split") then
						var_262_27.gameObject:SetActive(true)
					else
						var_262_27.gameObject:SetActive(false)
					end
				end
			end

			local var_262_28 = 0.001

			if var_262_25 <= arg_259_1.time_ and arg_259_1.time_ < var_262_25 + var_262_28 then
				local var_262_29 = (arg_259_1.time_ - var_262_25) / var_262_28
				local var_262_30 = Vector3.New(0, -530, 35)

				var_262_24.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10059, var_262_30, var_262_29)
			end

			if arg_259_1.time_ >= var_262_25 + var_262_28 and arg_259_1.time_ < var_262_25 + var_262_28 + arg_262_0 then
				var_262_24.localPosition = Vector3.New(0, -530, 35)
			end

			local var_262_31 = arg_259_1.actors_["10059"]
			local var_262_32 = 2

			if var_262_32 < arg_259_1.time_ and arg_259_1.time_ <= var_262_32 + arg_262_0 and arg_259_1.var_.actorSpriteComps10059 == nil then
				arg_259_1.var_.actorSpriteComps10059 = var_262_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_33 = 0.034

			if var_262_32 <= arg_259_1.time_ and arg_259_1.time_ < var_262_32 + var_262_33 then
				local var_262_34 = (arg_259_1.time_ - var_262_32) / var_262_33

				if arg_259_1.var_.actorSpriteComps10059 then
					for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_262_4 then
							local var_262_35 = Mathf.Lerp(iter_262_4.color.r, 1, var_262_34)

							iter_262_4.color = Color.New(var_262_35, var_262_35, var_262_35)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_32 + var_262_33 and arg_259_1.time_ < var_262_32 + var_262_33 + arg_262_0 and arg_259_1.var_.actorSpriteComps10059 then
				local var_262_36 = 1

				for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_262_6 then
						iter_262_6.color = Color.New(var_262_36, var_262_36, var_262_36)
					end
				end

				arg_259_1.var_.actorSpriteComps10059 = nil
			end

			if arg_259_1.frameCnt_ <= 1 then
				arg_259_1.dialog_:SetActive(false)
			end

			local var_262_37 = 2
			local var_262_38 = 0.175

			if var_262_37 < arg_259_1.time_ and arg_259_1.time_ <= var_262_37 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0

				arg_259_1.dialog_:SetActive(true)

				local var_262_39 = LeanTween.value(arg_259_1.dialog_, 0, 1, 0.3)

				var_262_39:setOnUpdate(LuaHelper.FloatAction(function(arg_263_0)
					arg_259_1.dialogCg_.alpha = arg_263_0
				end))
				var_262_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_259_1.dialog_)
					var_262_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_259_1.duration_ = arg_259_1.duration_ + 0.3

				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_40 = arg_259_1:FormatText(StoryNameCfg[596].name)

				arg_259_1.leftNameTxt_.text = var_262_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_41 = arg_259_1:GetWordFromCfg(410201064)
				local var_262_42 = arg_259_1:FormatText(var_262_41.content)

				arg_259_1.text_.text = var_262_42

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_43 = 7
				local var_262_44 = utf8.len(var_262_42)
				local var_262_45 = var_262_43 <= 0 and var_262_38 or var_262_38 * (var_262_44 / var_262_43)

				if var_262_45 > 0 and var_262_38 < var_262_45 then
					arg_259_1.talkMaxDuration = var_262_45
					var_262_37 = var_262_37 + 0.3

					if var_262_45 + var_262_37 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_45 + var_262_37
					end
				end

				arg_259_1.text_.text = var_262_42
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201064", "story_v_out_410201.awb") ~= 0 then
					local var_262_46 = manager.audio:GetVoiceLength("story_v_out_410201", "410201064", "story_v_out_410201.awb") / 1000

					if var_262_46 + var_262_37 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_46 + var_262_37
					end

					if var_262_41.prefab_name ~= "" and arg_259_1.actors_[var_262_41.prefab_name] ~= nil then
						local var_262_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_41.prefab_name].transform, "story_v_out_410201", "410201064", "story_v_out_410201.awb")

						arg_259_1:RecordAudio("410201064", var_262_47)
						arg_259_1:RecordAudio("410201064", var_262_47)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410201", "410201064", "story_v_out_410201.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410201", "410201064", "story_v_out_410201.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_48 = var_262_37 + 0.3
			local var_262_49 = math.max(var_262_38, arg_259_1.talkMaxDuration)

			if var_262_48 <= arg_259_1.time_ and arg_259_1.time_ < var_262_48 + var_262_49 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_48) / var_262_49

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_48 + var_262_49 and arg_259_1.time_ < var_262_48 + var_262_49 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410201065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 410201065
		arg_265_1.duration_ = 1.5

		local var_265_0 = {
			ja = 1.5,
			CriLanguages = 1.333,
			zh = 1.333
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play410201066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["10059"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos10059 = var_268_0.localPosition
				var_268_0.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("10059", 7)

				local var_268_2 = var_268_0.childCount

				for iter_268_0 = 0, var_268_2 - 1 do
					local var_268_3 = var_268_0:GetChild(iter_268_0)

					if var_268_3.name == "" or not string.find(var_268_3.name, "split") then
						var_268_3.gameObject:SetActive(true)
					else
						var_268_3.gameObject:SetActive(false)
					end
				end
			end

			local var_268_4 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_1) / var_268_4
				local var_268_6 = Vector3.New(0, -2000, 35)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10059, var_268_6, var_268_5)
			end

			if arg_265_1.time_ >= var_268_1 + var_268_4 and arg_265_1.time_ < var_268_1 + var_268_4 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_268_7 = arg_265_1.actors_["10060"].transform
			local var_268_8 = 0

			if var_268_8 < arg_265_1.time_ and arg_265_1.time_ <= var_268_8 + arg_268_0 then
				arg_265_1.var_.moveOldPos10060 = var_268_7.localPosition
				var_268_7.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("10060", 3)

				local var_268_9 = var_268_7.childCount

				for iter_268_1 = 0, var_268_9 - 1 do
					local var_268_10 = var_268_7:GetChild(iter_268_1)

					if var_268_10.name == "split_5" or not string.find(var_268_10.name, "split") then
						var_268_10.gameObject:SetActive(true)
					else
						var_268_10.gameObject:SetActive(false)
					end
				end
			end

			local var_268_11 = 0.001

			if var_268_8 <= arg_265_1.time_ and arg_265_1.time_ < var_268_8 + var_268_11 then
				local var_268_12 = (arg_265_1.time_ - var_268_8) / var_268_11
				local var_268_13 = Vector3.New(0, -400, 0)

				var_268_7.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10060, var_268_13, var_268_12)
			end

			if arg_265_1.time_ >= var_268_8 + var_268_11 and arg_265_1.time_ < var_268_8 + var_268_11 + arg_268_0 then
				var_268_7.localPosition = Vector3.New(0, -400, 0)
			end

			local var_268_14 = arg_265_1.actors_["10059"]
			local var_268_15 = 0

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 and arg_265_1.var_.actorSpriteComps10059 == nil then
				arg_265_1.var_.actorSpriteComps10059 = var_268_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_16 = 0.034

			if var_268_15 <= arg_265_1.time_ and arg_265_1.time_ < var_268_15 + var_268_16 then
				local var_268_17 = (arg_265_1.time_ - var_268_15) / var_268_16

				if arg_265_1.var_.actorSpriteComps10059 then
					for iter_268_2, iter_268_3 in pairs(arg_265_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_268_3 then
							local var_268_18 = Mathf.Lerp(iter_268_3.color.r, 0.5, var_268_17)

							iter_268_3.color = Color.New(var_268_18, var_268_18, var_268_18)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_15 + var_268_16 and arg_265_1.time_ < var_268_15 + var_268_16 + arg_268_0 and arg_265_1.var_.actorSpriteComps10059 then
				local var_268_19 = 0.5

				for iter_268_4, iter_268_5 in pairs(arg_265_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_268_5 then
						iter_268_5.color = Color.New(var_268_19, var_268_19, var_268_19)
					end
				end

				arg_265_1.var_.actorSpriteComps10059 = nil
			end

			local var_268_20 = arg_265_1.actors_["10060"]
			local var_268_21 = 0

			if var_268_21 < arg_265_1.time_ and arg_265_1.time_ <= var_268_21 + arg_268_0 and arg_265_1.var_.actorSpriteComps10060 == nil then
				arg_265_1.var_.actorSpriteComps10060 = var_268_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_22 = 0.034

			if var_268_21 <= arg_265_1.time_ and arg_265_1.time_ < var_268_21 + var_268_22 then
				local var_268_23 = (arg_265_1.time_ - var_268_21) / var_268_22

				if arg_265_1.var_.actorSpriteComps10060 then
					for iter_268_6, iter_268_7 in pairs(arg_265_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_268_7 then
							local var_268_24 = Mathf.Lerp(iter_268_7.color.r, 1, var_268_23)

							iter_268_7.color = Color.New(var_268_24, var_268_24, var_268_24)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_21 + var_268_22 and arg_265_1.time_ < var_268_21 + var_268_22 + arg_268_0 and arg_265_1.var_.actorSpriteComps10060 then
				local var_268_25 = 1

				for iter_268_8, iter_268_9 in pairs(arg_265_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_268_9 then
						iter_268_9.color = Color.New(var_268_25, var_268_25, var_268_25)
					end
				end

				arg_265_1.var_.actorSpriteComps10060 = nil
			end

			local var_268_26 = 0
			local var_268_27 = 0.15

			if var_268_26 < arg_265_1.time_ and arg_265_1.time_ <= var_268_26 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_28 = arg_265_1:FormatText(StoryNameCfg[597].name)

				arg_265_1.leftNameTxt_.text = var_268_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_29 = arg_265_1:GetWordFromCfg(410201065)
				local var_268_30 = arg_265_1:FormatText(var_268_29.content)

				arg_265_1.text_.text = var_268_30

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_31 = 6
				local var_268_32 = utf8.len(var_268_30)
				local var_268_33 = var_268_31 <= 0 and var_268_27 or var_268_27 * (var_268_32 / var_268_31)

				if var_268_33 > 0 and var_268_27 < var_268_33 then
					arg_265_1.talkMaxDuration = var_268_33

					if var_268_33 + var_268_26 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_33 + var_268_26
					end
				end

				arg_265_1.text_.text = var_268_30
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201065", "story_v_out_410201.awb") ~= 0 then
					local var_268_34 = manager.audio:GetVoiceLength("story_v_out_410201", "410201065", "story_v_out_410201.awb") / 1000

					if var_268_34 + var_268_26 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_34 + var_268_26
					end

					if var_268_29.prefab_name ~= "" and arg_265_1.actors_[var_268_29.prefab_name] ~= nil then
						local var_268_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_29.prefab_name].transform, "story_v_out_410201", "410201065", "story_v_out_410201.awb")

						arg_265_1:RecordAudio("410201065", var_268_35)
						arg_265_1:RecordAudio("410201065", var_268_35)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_410201", "410201065", "story_v_out_410201.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_410201", "410201065", "story_v_out_410201.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_36 = math.max(var_268_27, arg_265_1.talkMaxDuration)

			if var_268_26 <= arg_265_1.time_ and arg_265_1.time_ < var_268_26 + var_268_36 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_26) / var_268_36

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_26 + var_268_36 and arg_265_1.time_ < var_268_26 + var_268_36 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play410201066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 410201066
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play410201067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10060"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos10060 = var_272_0.localPosition
				var_272_0.localScale = Vector3.New(1, 1, 1)

				arg_269_1:CheckSpriteTmpPos("10060", 7)

				local var_272_2 = var_272_0.childCount

				for iter_272_0 = 0, var_272_2 - 1 do
					local var_272_3 = var_272_0:GetChild(iter_272_0)

					if var_272_3.name == "" or not string.find(var_272_3.name, "split") then
						var_272_3.gameObject:SetActive(true)
					else
						var_272_3.gameObject:SetActive(false)
					end
				end
			end

			local var_272_4 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_4 then
				local var_272_5 = (arg_269_1.time_ - var_272_1) / var_272_4
				local var_272_6 = Vector3.New(0, -2000, 0)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos10060, var_272_6, var_272_5)
			end

			if arg_269_1.time_ >= var_272_1 + var_272_4 and arg_269_1.time_ < var_272_1 + var_272_4 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_272_7 = arg_269_1.actors_["10060"]
			local var_272_8 = 0

			if var_272_8 < arg_269_1.time_ and arg_269_1.time_ <= var_272_8 + arg_272_0 and arg_269_1.var_.actorSpriteComps10060 == nil then
				arg_269_1.var_.actorSpriteComps10060 = var_272_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_9 = 0.034

			if var_272_8 <= arg_269_1.time_ and arg_269_1.time_ < var_272_8 + var_272_9 then
				local var_272_10 = (arg_269_1.time_ - var_272_8) / var_272_9

				if arg_269_1.var_.actorSpriteComps10060 then
					for iter_272_1, iter_272_2 in pairs(arg_269_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_272_2 then
							local var_272_11 = Mathf.Lerp(iter_272_2.color.r, 0.5, var_272_10)

							iter_272_2.color = Color.New(var_272_11, var_272_11, var_272_11)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_8 + var_272_9 and arg_269_1.time_ < var_272_8 + var_272_9 + arg_272_0 and arg_269_1.var_.actorSpriteComps10060 then
				local var_272_12 = 0.5

				for iter_272_3, iter_272_4 in pairs(arg_269_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_272_4 then
						iter_272_4.color = Color.New(var_272_12, var_272_12, var_272_12)
					end
				end

				arg_269_1.var_.actorSpriteComps10060 = nil
			end

			local var_272_13 = 0
			local var_272_14 = 0.975

			if var_272_13 < arg_269_1.time_ and arg_269_1.time_ <= var_272_13 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_15 = arg_269_1:GetWordFromCfg(410201066)
				local var_272_16 = arg_269_1:FormatText(var_272_15.content)

				arg_269_1.text_.text = var_272_16

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_17 = 39
				local var_272_18 = utf8.len(var_272_16)
				local var_272_19 = var_272_17 <= 0 and var_272_14 or var_272_14 * (var_272_18 / var_272_17)

				if var_272_19 > 0 and var_272_14 < var_272_19 then
					arg_269_1.talkMaxDuration = var_272_19

					if var_272_19 + var_272_13 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_19 + var_272_13
					end
				end

				arg_269_1.text_.text = var_272_16
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_20 = math.max(var_272_14, arg_269_1.talkMaxDuration)

			if var_272_13 <= arg_269_1.time_ and arg_269_1.time_ < var_272_13 + var_272_20 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_13) / var_272_20

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_13 + var_272_20 and arg_269_1.time_ < var_272_13 + var_272_20 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play410201067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 410201067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play410201068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1.525

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_2 = arg_273_1:GetWordFromCfg(410201067)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 61
				local var_276_5 = utf8.len(var_276_3)
				local var_276_6 = var_276_4 <= 0 and var_276_1 or var_276_1 * (var_276_5 / var_276_4)

				if var_276_6 > 0 and var_276_1 < var_276_6 then
					arg_273_1.talkMaxDuration = var_276_6

					if var_276_6 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_6 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_3
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_7 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_7 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_7

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_7 and arg_273_1.time_ < var_276_0 + var_276_7 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play410201068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 410201068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play410201069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.475

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_2 = arg_277_1:GetWordFromCfg(410201068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 19
				local var_280_5 = utf8.len(var_280_3)
				local var_280_6 = var_280_4 <= 0 and var_280_1 or var_280_1 * (var_280_5 / var_280_4)

				if var_280_6 > 0 and var_280_1 < var_280_6 then
					arg_277_1.talkMaxDuration = var_280_6

					if var_280_6 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_6 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_3
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_7 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_7 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_7

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_7 and arg_277_1.time_ < var_280_0 + var_280_7 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play410201069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 410201069
		arg_281_1.duration_ = 3.5

		local var_281_0 = {
			ja = 3.5,
			CriLanguages = 2.533,
			zh = 2.533
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
			arg_281_1.auto_ = false
		end

		function arg_281_1.playNext_(arg_283_0)
			arg_281_1.onStoryFinished_()
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10059"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos10059 = var_284_0.localPosition
				var_284_0.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("10059", 3)

				local var_284_2 = var_284_0.childCount

				for iter_284_0 = 0, var_284_2 - 1 do
					local var_284_3 = var_284_0:GetChild(iter_284_0)

					if var_284_3.name == "split_3" or not string.find(var_284_3.name, "split") then
						var_284_3.gameObject:SetActive(true)
					else
						var_284_3.gameObject:SetActive(false)
					end
				end
			end

			local var_284_4 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_4 then
				local var_284_5 = (arg_281_1.time_ - var_284_1) / var_284_4
				local var_284_6 = Vector3.New(0, -530, 35)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10059, var_284_6, var_284_5)
			end

			if arg_281_1.time_ >= var_284_1 + var_284_4 and arg_281_1.time_ < var_284_1 + var_284_4 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, -530, 35)
			end

			local var_284_7 = arg_281_1.actors_["10059"]
			local var_284_8 = 0

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 and arg_281_1.var_.actorSpriteComps10059 == nil then
				arg_281_1.var_.actorSpriteComps10059 = var_284_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_9 = 0.034

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_9 then
				local var_284_10 = (arg_281_1.time_ - var_284_8) / var_284_9

				if arg_281_1.var_.actorSpriteComps10059 then
					for iter_284_1, iter_284_2 in pairs(arg_281_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_284_2 then
							local var_284_11 = Mathf.Lerp(iter_284_2.color.r, 1, var_284_10)

							iter_284_2.color = Color.New(var_284_11, var_284_11, var_284_11)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_8 + var_284_9 and arg_281_1.time_ < var_284_8 + var_284_9 + arg_284_0 and arg_281_1.var_.actorSpriteComps10059 then
				local var_284_12 = 1

				for iter_284_3, iter_284_4 in pairs(arg_281_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_284_4 then
						iter_284_4.color = Color.New(var_284_12, var_284_12, var_284_12)
					end
				end

				arg_281_1.var_.actorSpriteComps10059 = nil
			end

			local var_284_13 = 0
			local var_284_14 = 0.3

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_15 = arg_281_1:FormatText(StoryNameCfg[596].name)

				arg_281_1.leftNameTxt_.text = var_284_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_16 = arg_281_1:GetWordFromCfg(410201069)
				local var_284_17 = arg_281_1:FormatText(var_284_16.content)

				arg_281_1.text_.text = var_284_17

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_18 = 12
				local var_284_19 = utf8.len(var_284_17)
				local var_284_20 = var_284_18 <= 0 and var_284_14 or var_284_14 * (var_284_19 / var_284_18)

				if var_284_20 > 0 and var_284_14 < var_284_20 then
					arg_281_1.talkMaxDuration = var_284_20

					if var_284_20 + var_284_13 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_20 + var_284_13
					end
				end

				arg_281_1.text_.text = var_284_17
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410201", "410201069", "story_v_out_410201.awb") ~= 0 then
					local var_284_21 = manager.audio:GetVoiceLength("story_v_out_410201", "410201069", "story_v_out_410201.awb") / 1000

					if var_284_21 + var_284_13 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_21 + var_284_13
					end

					if var_284_16.prefab_name ~= "" and arg_281_1.actors_[var_284_16.prefab_name] ~= nil then
						local var_284_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_16.prefab_name].transform, "story_v_out_410201", "410201069", "story_v_out_410201.awb")

						arg_281_1:RecordAudio("410201069", var_284_22)
						arg_281_1:RecordAudio("410201069", var_284_22)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_410201", "410201069", "story_v_out_410201.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_410201", "410201069", "story_v_out_410201.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_23 = math.max(var_284_14, arg_281_1.talkMaxDuration)

			if var_284_13 <= arg_281_1.time_ and arg_281_1.time_ < var_284_13 + var_284_23 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_13) / var_284_23

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_13 + var_284_23 and arg_281_1.time_ < var_284_13 + var_284_23 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST66",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST63",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L03f"
	},
	voices = {
		"story_v_out_410201.awb"
	}
}
