return {
	Play410251001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410251001
		arg_1_1.duration_ = 6.266

		local var_1_0 = {
			ja = 6.266,
			CriLanguages = 4.5,
			zh = 4.5
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
				arg_1_0:Play410251002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST62"

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
				local var_4_5 = arg_1_1.bgs_.ST62

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
					if iter_4_0 ~= "ST62" then
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

			local var_4_22 = "1056"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["1056"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos1056 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1056", 2)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_2" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(-390, -350, -180)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1056, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_4_31 = "1060"

			if arg_1_1.actors_[var_4_31] == nil then
				local var_4_32 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_31), arg_1_1.canvasGo_.transform)

				var_4_32.transform:SetSiblingIndex(1)

				var_4_32.name = var_4_31
				var_4_32.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_31] = var_4_32
			end

			local var_4_33 = arg_1_1.actors_["1060"].transform
			local var_4_34 = 2

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.var_.moveOldPos1060 = var_4_33.localPosition
				var_4_33.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1060", 4)

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
				local var_4_39 = Vector3.New(390, -435, -40)

				var_4_33.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1060, var_4_39, var_4_38)
			end

			if arg_1_1.time_ >= var_4_34 + var_4_37 and arg_1_1.time_ < var_4_34 + var_4_37 + arg_4_0 then
				var_4_33.localPosition = Vector3.New(390, -435, -40)
			end

			local var_4_40 = arg_1_1.actors_["1056"]
			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 and arg_1_1.var_.actorSpriteComps1056 == nil then
				arg_1_1.var_.actorSpriteComps1056 = var_4_40:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_42 = 0.034

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42

				if arg_1_1.var_.actorSpriteComps1056 then
					for iter_4_4, iter_4_5 in pairs(arg_1_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_4_5 then
							local var_4_44 = Mathf.Lerp(iter_4_5.color.r, 1, var_4_43)

							iter_4_5.color = Color.New(var_4_44, var_4_44, var_4_44)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 and arg_1_1.var_.actorSpriteComps1056 then
				local var_4_45 = 1

				for iter_4_6, iter_4_7 in pairs(arg_1_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_4_7 then
						iter_4_7.color = Color.New(var_4_45, var_4_45, var_4_45)
					end
				end

				arg_1_1.var_.actorSpriteComps1056 = nil
			end

			local var_4_46 = arg_1_1.actors_["1060"]
			local var_4_47 = 2

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 and arg_1_1.var_.actorSpriteComps1060 == nil then
				arg_1_1.var_.actorSpriteComps1060 = var_4_46:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_48 = 0.034

			if var_4_47 <= arg_1_1.time_ and arg_1_1.time_ < var_4_47 + var_4_48 then
				local var_4_49 = (arg_1_1.time_ - var_4_47) / var_4_48

				if arg_1_1.var_.actorSpriteComps1060 then
					for iter_4_8, iter_4_9 in pairs(arg_1_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_4_9 then
							local var_4_50 = Mathf.Lerp(iter_4_9.color.r, 0.5, var_4_49)

							iter_4_9.color = Color.New(var_4_50, var_4_50, var_4_50)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_47 + var_4_48 and arg_1_1.time_ < var_4_47 + var_4_48 + arg_4_0 and arg_1_1.var_.actorSpriteComps1060 then
				local var_4_51 = 0.5

				for iter_4_10, iter_4_11 in pairs(arg_1_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_4_11 then
						iter_4_11.color = Color.New(var_4_51, var_4_51, var_4_51)
					end
				end

				arg_1_1.var_.actorSpriteComps1060 = nil
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
			local var_4_61 = 0.25

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

				local var_4_63 = arg_1_1:FormatText(StoryNameCfg[605].name)

				arg_1_1.leftNameTxt_.text = var_4_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_64 = arg_1_1:GetWordFromCfg(410251001)
				local var_4_65 = arg_1_1:FormatText(var_4_64.content)

				arg_1_1.text_.text = var_4_65

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_66 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251001", "story_v_out_410251.awb") ~= 0 then
					local var_4_69 = manager.audio:GetVoiceLength("story_v_out_410251", "410251001", "story_v_out_410251.awb") / 1000

					if var_4_69 + var_4_60 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_69 + var_4_60
					end

					if var_4_64.prefab_name ~= "" and arg_1_1.actors_[var_4_64.prefab_name] ~= nil then
						local var_4_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_64.prefab_name].transform, "story_v_out_410251", "410251001", "story_v_out_410251.awb")

						arg_1_1:RecordAudio("410251001", var_4_70)
						arg_1_1:RecordAudio("410251001", var_4_70)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410251", "410251001", "story_v_out_410251.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410251", "410251001", "story_v_out_410251.awb")
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
	Play410251002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410251002
		arg_7_1.duration_ = 5.933

		local var_7_0 = {
			ja = 5.933,
			CriLanguages = 3,
			zh = 3
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
				arg_7_0:Play410251003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1060"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos1060 = var_10_0.localPosition
				var_10_0.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1060", 4)

				local var_10_2 = var_10_0.childCount

				for iter_10_0 = 0, var_10_2 - 1 do
					local var_10_3 = var_10_0:GetChild(iter_10_0)

					if var_10_3.name == "" or not string.find(var_10_3.name, "split") then
						var_10_3.gameObject:SetActive(true)
					else
						var_10_3.gameObject:SetActive(false)
					end
				end
			end

			local var_10_4 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_4 then
				local var_10_5 = (arg_7_1.time_ - var_10_1) / var_10_4
				local var_10_6 = Vector3.New(390, -435, -40)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1060, var_10_6, var_10_5)
			end

			if arg_7_1.time_ >= var_10_1 + var_10_4 and arg_7_1.time_ < var_10_1 + var_10_4 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_10_7 = arg_7_1.actors_["1060"]
			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 == nil then
				arg_7_1.var_.actorSpriteComps1060 = var_10_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_9 = 0.034

			if var_10_8 <= arg_7_1.time_ and arg_7_1.time_ < var_10_8 + var_10_9 then
				local var_10_10 = (arg_7_1.time_ - var_10_8) / var_10_9

				if arg_7_1.var_.actorSpriteComps1060 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_10_2 then
							local var_10_11 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_10)

							iter_10_2.color = Color.New(var_10_11, var_10_11, var_10_11)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_8 + var_10_9 and arg_7_1.time_ < var_10_8 + var_10_9 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 then
				local var_10_12 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_12, var_10_12, var_10_12)
					end
				end

				arg_7_1.var_.actorSpriteComps1060 = nil
			end

			local var_10_13 = arg_7_1.actors_["1056"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.actorSpriteComps1056 == nil then
				arg_7_1.var_.actorSpriteComps1056 = var_10_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_15 = 0.034

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.actorSpriteComps1056 then
					for iter_10_5, iter_10_6 in pairs(arg_7_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_10_6 then
							local var_10_17 = Mathf.Lerp(iter_10_6.color.r, 0.5, var_10_16)

							iter_10_6.color = Color.New(var_10_17, var_10_17, var_10_17)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.actorSpriteComps1056 then
				local var_10_18 = 0.5

				for iter_10_7, iter_10_8 in pairs(arg_7_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_10_8 then
						iter_10_8.color = Color.New(var_10_18, var_10_18, var_10_18)
					end
				end

				arg_7_1.var_.actorSpriteComps1056 = nil
			end

			local var_10_19 = 0
			local var_10_20 = 0.375

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[584].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(410251002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251002", "story_v_out_410251.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251002", "story_v_out_410251.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_410251", "410251002", "story_v_out_410251.awb")

						arg_7_1:RecordAudio("410251002", var_10_28)
						arg_7_1:RecordAudio("410251002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410251", "410251002", "story_v_out_410251.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410251", "410251002", "story_v_out_410251.awb")
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
	Play410251003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410251003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410251004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1060"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.actorSpriteComps1060 == nil then
				arg_11_1.var_.actorSpriteComps1060 = var_14_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_2 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.actorSpriteComps1060 then
					for iter_14_0, iter_14_1 in pairs(arg_11_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_14_1 then
							local var_14_4 = Mathf.Lerp(iter_14_1.color.r, 0.5, var_14_3)

							iter_14_1.color = Color.New(var_14_4, var_14_4, var_14_4)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.actorSpriteComps1060 then
				local var_14_5 = 0.5

				for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_14_3 then
						iter_14_3.color = Color.New(var_14_5, var_14_5, var_14_5)
					end
				end

				arg_11_1.var_.actorSpriteComps1060 = nil
			end

			local var_14_6 = 0
			local var_14_7 = 1.375

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_8 = arg_11_1:GetWordFromCfg(410251003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 55
				local var_14_11 = utf8.len(var_14_9)
				local var_14_12 = var_14_10 <= 0 and var_14_7 or var_14_7 * (var_14_11 / var_14_10)

				if var_14_12 > 0 and var_14_7 < var_14_12 then
					arg_11_1.talkMaxDuration = var_14_12

					if var_14_12 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_9
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_13 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_13 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_13

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_13 and arg_11_1.time_ < var_14_6 + var_14_13 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410251004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410251004
		arg_15_1.duration_ = 7.9

		local var_15_0 = {
			ja = 7.9,
			CriLanguages = 7,
			zh = 7
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
				arg_15_0:Play410251005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1056"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1056 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1056", 2)

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
				local var_18_6 = Vector3.New(-390, -350, -180)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1056, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_18_7 = arg_15_1.actors_["1056"]
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps1056 == nil then
				arg_15_1.var_.actorSpriteComps1056 = var_18_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_9 = 0.034

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_8) / var_18_9

				if arg_15_1.var_.actorSpriteComps1056 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_18_2 then
							local var_18_11 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_10)

							iter_18_2.color = Color.New(var_18_11, var_18_11, var_18_11)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_8 + var_18_9 and arg_15_1.time_ < var_18_8 + var_18_9 + arg_18_0 and arg_15_1.var_.actorSpriteComps1056 then
				local var_18_12 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_12, var_18_12, var_18_12)
					end
				end

				arg_15_1.var_.actorSpriteComps1056 = nil
			end

			local var_18_13 = 0
			local var_18_14 = 0.825

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_15 = arg_15_1:FormatText(StoryNameCfg[605].name)

				arg_15_1.leftNameTxt_.text = var_18_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_16 = arg_15_1:GetWordFromCfg(410251004)
				local var_18_17 = arg_15_1:FormatText(var_18_16.content)

				arg_15_1.text_.text = var_18_17

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_18 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251004", "story_v_out_410251.awb") ~= 0 then
					local var_18_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251004", "story_v_out_410251.awb") / 1000

					if var_18_21 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_13
					end

					if var_18_16.prefab_name ~= "" and arg_15_1.actors_[var_18_16.prefab_name] ~= nil then
						local var_18_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_16.prefab_name].transform, "story_v_out_410251", "410251004", "story_v_out_410251.awb")

						arg_15_1:RecordAudio("410251004", var_18_22)
						arg_15_1:RecordAudio("410251004", var_18_22)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410251", "410251004", "story_v_out_410251.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410251", "410251004", "story_v_out_410251.awb")
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
	Play410251005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410251005
		arg_19_1.duration_ = 14.733

		local var_19_0 = {
			ja = 14.733,
			CriLanguages = 10.2,
			zh = 10.2
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
				arg_19_0:Play410251006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 1.4

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[605].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(410251005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 56
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251005", "story_v_out_410251.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251005", "story_v_out_410251.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_410251", "410251005", "story_v_out_410251.awb")

						arg_19_1:RecordAudio("410251005", var_22_9)
						arg_19_1:RecordAudio("410251005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410251", "410251005", "story_v_out_410251.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410251", "410251005", "story_v_out_410251.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410251006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410251006
		arg_23_1.duration_ = 8.8

		local var_23_0 = {
			ja = 8.8,
			CriLanguages = 5.2,
			zh = 5.2
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
				arg_23_0:Play410251007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1056"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1056 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1056", 2)

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
				local var_26_6 = Vector3.New(-390, -350, -180)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1056, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_26_7 = arg_23_1.actors_["1056"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps1056 == nil then
				arg_23_1.var_.actorSpriteComps1056 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps1056 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 1, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps1056 then
				local var_26_12 = 1

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps1056 = nil
			end

			local var_26_13 = 0
			local var_26_14 = 0.675

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_15 = arg_23_1:FormatText(StoryNameCfg[605].name)

				arg_23_1.leftNameTxt_.text = var_26_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_16 = arg_23_1:GetWordFromCfg(410251006)
				local var_26_17 = arg_23_1:FormatText(var_26_16.content)

				arg_23_1.text_.text = var_26_17

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_18 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251006", "story_v_out_410251.awb") ~= 0 then
					local var_26_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251006", "story_v_out_410251.awb") / 1000

					if var_26_21 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_13
					end

					if var_26_16.prefab_name ~= "" and arg_23_1.actors_[var_26_16.prefab_name] ~= nil then
						local var_26_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_16.prefab_name].transform, "story_v_out_410251", "410251006", "story_v_out_410251.awb")

						arg_23_1:RecordAudio("410251006", var_26_22)
						arg_23_1:RecordAudio("410251006", var_26_22)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410251", "410251006", "story_v_out_410251.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410251", "410251006", "story_v_out_410251.awb")
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
	Play410251007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410251007
		arg_27_1.duration_ = 15.266

		local var_27_0 = {
			ja = 15.266,
			CriLanguages = 7.866,
			zh = 7.866
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
				arg_27_0:Play410251008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1060"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1060 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1060", 4)

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
				local var_30_6 = Vector3.New(390, -435, -40)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1060, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_30_7 = arg_27_1.actors_["1060"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps1060 == nil then
				arg_27_1.var_.actorSpriteComps1060 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.034

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps1060 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps1060 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps1060 = nil
			end

			local var_30_13 = arg_27_1.actors_["1056"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.actorSpriteComps1056 == nil then
				arg_27_1.var_.actorSpriteComps1056 = var_30_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_15 = 0.034

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.actorSpriteComps1056 then
					for iter_30_5, iter_30_6 in pairs(arg_27_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_30_6 then
							local var_30_17 = Mathf.Lerp(iter_30_6.color.r, 0.5, var_30_16)

							iter_30_6.color = Color.New(var_30_17, var_30_17, var_30_17)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.actorSpriteComps1056 then
				local var_30_18 = 0.5

				for iter_30_7, iter_30_8 in pairs(arg_27_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_30_8 then
						iter_30_8.color = Color.New(var_30_18, var_30_18, var_30_18)
					end
				end

				arg_27_1.var_.actorSpriteComps1056 = nil
			end

			local var_30_19 = 0
			local var_30_20 = 1.075

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[584].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(410251007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 43
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251007", "story_v_out_410251.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251007", "story_v_out_410251.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_out_410251", "410251007", "story_v_out_410251.awb")

						arg_27_1:RecordAudio("410251007", var_30_28)
						arg_27_1:RecordAudio("410251007", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410251", "410251007", "story_v_out_410251.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410251", "410251007", "story_v_out_410251.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_29 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_29 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_29

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_29 and arg_27_1.time_ < var_30_19 + var_30_29 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410251008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410251008
		arg_31_1.duration_ = 4.866

		local var_31_0 = {
			ja = 4.866,
			CriLanguages = 3.866,
			zh = 3.866
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
				arg_31_0:Play410251009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1056"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1056 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1056", 2)

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
				local var_34_6 = Vector3.New(-390, -350, -180)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1056, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_34_7 = arg_31_1.actors_["1056"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1056 == nil then
				arg_31_1.var_.actorSpriteComps1056 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1056 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1056 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1056 = nil
			end

			local var_34_13 = arg_31_1.actors_["1060"]
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 == nil then
				arg_31_1.var_.actorSpriteComps1060 = var_34_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_15 = 0.034

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15

				if arg_31_1.var_.actorSpriteComps1060 then
					for iter_34_5, iter_34_6 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_34_6 then
							local var_34_17 = Mathf.Lerp(iter_34_6.color.r, 0.5, var_34_16)

							iter_34_6.color = Color.New(var_34_17, var_34_17, var_34_17)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 then
				local var_34_18 = 0.5

				for iter_34_7, iter_34_8 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_34_8 then
						iter_34_8.color = Color.New(var_34_18, var_34_18, var_34_18)
					end
				end

				arg_31_1.var_.actorSpriteComps1060 = nil
			end

			local var_34_19 = 0
			local var_34_20 = 0.5

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_21 = arg_31_1:FormatText(StoryNameCfg[605].name)

				arg_31_1.leftNameTxt_.text = var_34_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_22 = arg_31_1:GetWordFromCfg(410251008)
				local var_34_23 = arg_31_1:FormatText(var_34_22.content)

				arg_31_1.text_.text = var_34_23

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251008", "story_v_out_410251.awb") ~= 0 then
					local var_34_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251008", "story_v_out_410251.awb") / 1000

					if var_34_27 + var_34_19 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_27 + var_34_19
					end

					if var_34_22.prefab_name ~= "" and arg_31_1.actors_[var_34_22.prefab_name] ~= nil then
						local var_34_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_22.prefab_name].transform, "story_v_out_410251", "410251008", "story_v_out_410251.awb")

						arg_31_1:RecordAudio("410251008", var_34_28)
						arg_31_1:RecordAudio("410251008", var_34_28)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410251", "410251008", "story_v_out_410251.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410251", "410251008", "story_v_out_410251.awb")
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
	Play410251009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410251009
		arg_35_1.duration_ = 12.966

		local var_35_0 = {
			ja = 12.966,
			CriLanguages = 7.7,
			zh = 7.7
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
				arg_35_0:Play410251010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1060"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1060 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1060", 4)

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
				local var_38_6 = Vector3.New(390, -435, -40)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1060, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_38_7 = arg_35_1.actors_["1060"]
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 == nil then
				arg_35_1.var_.actorSpriteComps1060 = var_38_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_9 = 0.034

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_8) / var_38_9

				if arg_35_1.var_.actorSpriteComps1060 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_38_2 then
							local var_38_11 = Mathf.Lerp(iter_38_2.color.r, 1, var_38_10)

							iter_38_2.color = Color.New(var_38_11, var_38_11, var_38_11)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_8 + var_38_9 and arg_35_1.time_ < var_38_8 + var_38_9 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 then
				local var_38_12 = 1

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_12, var_38_12, var_38_12)
					end
				end

				arg_35_1.var_.actorSpriteComps1060 = nil
			end

			local var_38_13 = arg_35_1.actors_["1056"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 == nil then
				arg_35_1.var_.actorSpriteComps1056 = var_38_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_15 = 0.034

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15

				if arg_35_1.var_.actorSpriteComps1056 then
					for iter_38_5, iter_38_6 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_38_6 then
							local var_38_17 = Mathf.Lerp(iter_38_6.color.r, 0.5, var_38_16)

							iter_38_6.color = Color.New(var_38_17, var_38_17, var_38_17)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 then
				local var_38_18 = 0.5

				for iter_38_7, iter_38_8 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_38_8 then
						iter_38_8.color = Color.New(var_38_18, var_38_18, var_38_18)
					end
				end

				arg_35_1.var_.actorSpriteComps1056 = nil
			end

			local var_38_19 = 0
			local var_38_20 = 0.95

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_21 = arg_35_1:FormatText(StoryNameCfg[584].name)

				arg_35_1.leftNameTxt_.text = var_38_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_22 = arg_35_1:GetWordFromCfg(410251009)
				local var_38_23 = arg_35_1:FormatText(var_38_22.content)

				arg_35_1.text_.text = var_38_23

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_24 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251009", "story_v_out_410251.awb") ~= 0 then
					local var_38_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251009", "story_v_out_410251.awb") / 1000

					if var_38_27 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_19
					end

					if var_38_22.prefab_name ~= "" and arg_35_1.actors_[var_38_22.prefab_name] ~= nil then
						local var_38_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_22.prefab_name].transform, "story_v_out_410251", "410251009", "story_v_out_410251.awb")

						arg_35_1:RecordAudio("410251009", var_38_28)
						arg_35_1:RecordAudio("410251009", var_38_28)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410251", "410251009", "story_v_out_410251.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410251", "410251009", "story_v_out_410251.awb")
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
	Play410251010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410251010
		arg_39_1.duration_ = 4.066

		local var_39_0 = {
			ja = 4.066,
			CriLanguages = 2.533,
			zh = 2.533
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
				arg_39_0:Play410251011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1056"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1056 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1056", 2)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_4" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(-390, -350, -180)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1056, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_42_7 = arg_39_1.actors_["1056"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 == nil then
				arg_39_1.var_.actorSpriteComps1056 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps1056 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps1056 = nil
			end

			local var_42_13 = arg_39_1.actors_["1060"]
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 and arg_39_1.var_.actorSpriteComps1060 == nil then
				arg_39_1.var_.actorSpriteComps1060 = var_42_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_15 = 0.034

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_15 then
				local var_42_16 = (arg_39_1.time_ - var_42_14) / var_42_15

				if arg_39_1.var_.actorSpriteComps1060 then
					for iter_42_5, iter_42_6 in pairs(arg_39_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_42_6 then
							local var_42_17 = Mathf.Lerp(iter_42_6.color.r, 0.5, var_42_16)

							iter_42_6.color = Color.New(var_42_17, var_42_17, var_42_17)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_14 + var_42_15 and arg_39_1.time_ < var_42_14 + var_42_15 + arg_42_0 and arg_39_1.var_.actorSpriteComps1060 then
				local var_42_18 = 0.5

				for iter_42_7, iter_42_8 in pairs(arg_39_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_42_8 then
						iter_42_8.color = Color.New(var_42_18, var_42_18, var_42_18)
					end
				end

				arg_39_1.var_.actorSpriteComps1060 = nil
			end

			local var_42_19 = 0
			local var_42_20 = 0.225

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_21 = arg_39_1:FormatText(StoryNameCfg[605].name)

				arg_39_1.leftNameTxt_.text = var_42_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_22 = arg_39_1:GetWordFromCfg(410251010)
				local var_42_23 = arg_39_1:FormatText(var_42_22.content)

				arg_39_1.text_.text = var_42_23

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_24 = 9
				local var_42_25 = utf8.len(var_42_23)
				local var_42_26 = var_42_24 <= 0 and var_42_20 or var_42_20 * (var_42_25 / var_42_24)

				if var_42_26 > 0 and var_42_20 < var_42_26 then
					arg_39_1.talkMaxDuration = var_42_26

					if var_42_26 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_26 + var_42_19
					end
				end

				arg_39_1.text_.text = var_42_23
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251010", "story_v_out_410251.awb") ~= 0 then
					local var_42_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251010", "story_v_out_410251.awb") / 1000

					if var_42_27 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_27 + var_42_19
					end

					if var_42_22.prefab_name ~= "" and arg_39_1.actors_[var_42_22.prefab_name] ~= nil then
						local var_42_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_22.prefab_name].transform, "story_v_out_410251", "410251010", "story_v_out_410251.awb")

						arg_39_1:RecordAudio("410251010", var_42_28)
						arg_39_1:RecordAudio("410251010", var_42_28)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410251", "410251010", "story_v_out_410251.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410251", "410251010", "story_v_out_410251.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_29 = math.max(var_42_20, arg_39_1.talkMaxDuration)

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_29 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_19) / var_42_29

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_19 + var_42_29 and arg_39_1.time_ < var_42_19 + var_42_29 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410251011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410251011
		arg_43_1.duration_ = 4.133

		local var_43_0 = {
			ja = 4.133,
			CriLanguages = 3.7,
			zh = 3.7
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
				arg_43_0:Play410251012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1060"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1060 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1060", 4)

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
				local var_46_6 = Vector3.New(390, -435, -40)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1060, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_46_7 = arg_43_1.actors_["1060"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 == nil then
				arg_43_1.var_.actorSpriteComps1060 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps1060 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps1060 = nil
			end

			local var_46_13 = arg_43_1.actors_["1056"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 == nil then
				arg_43_1.var_.actorSpriteComps1056 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1056 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1056 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1056 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.375

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[584].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410251011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251011", "story_v_out_410251.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251011", "story_v_out_410251.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410251", "410251011", "story_v_out_410251.awb")

						arg_43_1:RecordAudio("410251011", var_46_28)
						arg_43_1:RecordAudio("410251011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410251", "410251011", "story_v_out_410251.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410251", "410251011", "story_v_out_410251.awb")
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
	Play410251012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410251012
		arg_47_1.duration_ = 4.333

		local var_47_0 = {
			ja = 4.333,
			CriLanguages = 4.2,
			zh = 4.2
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
				arg_47_0:Play410251013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1060"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1060 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1060", 4)

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
				local var_50_6 = Vector3.New(390, -435, -40)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1060, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_50_7 = arg_47_1.actors_["1060"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 == nil then
				arg_47_1.var_.actorSpriteComps1060 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps1060 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps1060 = nil
			end

			local var_50_13 = 0
			local var_50_14 = 0.475

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_15 = arg_47_1:FormatText(StoryNameCfg[584].name)

				arg_47_1.leftNameTxt_.text = var_50_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_16 = arg_47_1:GetWordFromCfg(410251012)
				local var_50_17 = arg_47_1:FormatText(var_50_16.content)

				arg_47_1.text_.text = var_50_17

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_18 = 19
				local var_50_19 = utf8.len(var_50_17)
				local var_50_20 = var_50_18 <= 0 and var_50_14 or var_50_14 * (var_50_19 / var_50_18)

				if var_50_20 > 0 and var_50_14 < var_50_20 then
					arg_47_1.talkMaxDuration = var_50_20

					if var_50_20 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_13
					end
				end

				arg_47_1.text_.text = var_50_17
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251012", "story_v_out_410251.awb") ~= 0 then
					local var_50_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251012", "story_v_out_410251.awb") / 1000

					if var_50_21 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_21 + var_50_13
					end

					if var_50_16.prefab_name ~= "" and arg_47_1.actors_[var_50_16.prefab_name] ~= nil then
						local var_50_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_16.prefab_name].transform, "story_v_out_410251", "410251012", "story_v_out_410251.awb")

						arg_47_1:RecordAudio("410251012", var_50_22)
						arg_47_1:RecordAudio("410251012", var_50_22)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410251", "410251012", "story_v_out_410251.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410251", "410251012", "story_v_out_410251.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_23 = math.max(var_50_14, arg_47_1.talkMaxDuration)

			if var_50_13 <= arg_47_1.time_ and arg_47_1.time_ < var_50_13 + var_50_23 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_13) / var_50_23

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_13 + var_50_23 and arg_47_1.time_ < var_50_13 + var_50_23 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410251013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410251013
		arg_51_1.duration_ = 9

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play410251014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "L04h"

			if arg_51_1.bgs_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(arg_51_1.paintGo_)

				var_54_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_54_0)
				var_54_1.name = var_54_0
				var_54_1.transform.parent = arg_51_1.stage_.transform
				var_54_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.bgs_[var_54_0] = var_54_1
			end

			local var_54_2 = 2

			if var_54_2 < arg_51_1.time_ and arg_51_1.time_ <= var_54_2 + arg_54_0 then
				local var_54_3 = manager.ui.mainCamera.transform.localPosition
				local var_54_4 = Vector3.New(0, 0, 10) + Vector3.New(var_54_3.x, var_54_3.y, 0)
				local var_54_5 = arg_51_1.bgs_.L04h

				var_54_5.transform.localPosition = var_54_4
				var_54_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_6 = var_54_5:GetComponent("SpriteRenderer")

				if var_54_6 and var_54_6.sprite then
					local var_54_7 = (var_54_5.transform.localPosition - var_54_3).z
					local var_54_8 = manager.ui.mainCameraCom_
					local var_54_9 = 2 * var_54_7 * Mathf.Tan(var_54_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_10 = var_54_9 * var_54_8.aspect
					local var_54_11 = var_54_6.sprite.bounds.size.x
					local var_54_12 = var_54_6.sprite.bounds.size.y
					local var_54_13 = var_54_10 / var_54_11
					local var_54_14 = var_54_9 / var_54_12
					local var_54_15 = var_54_14 < var_54_13 and var_54_13 or var_54_14

					var_54_5.transform.localScale = Vector3.New(var_54_15, var_54_15, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "L04h" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_17 = 2

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Color.New(0, 0, 0)

				var_54_19.a = Mathf.Lerp(0, 1, var_54_18)
				arg_51_1.mask_.color = var_54_19
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				local var_54_20 = Color.New(0, 0, 0)

				var_54_20.a = 1
				arg_51_1.mask_.color = var_54_20
			end

			local var_54_21 = 2

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_22 = 2

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_22 then
				local var_54_23 = (arg_51_1.time_ - var_54_21) / var_54_22
				local var_54_24 = Color.New(0, 0, 0)

				var_54_24.a = Mathf.Lerp(1, 0, var_54_23)
				arg_51_1.mask_.color = var_54_24
			end

			if arg_51_1.time_ >= var_54_21 + var_54_22 and arg_51_1.time_ < var_54_21 + var_54_22 + arg_54_0 then
				local var_54_25 = Color.New(0, 0, 0)
				local var_54_26 = 0

				arg_51_1.mask_.enabled = false
				var_54_25.a = var_54_26
				arg_51_1.mask_.color = var_54_25
			end

			local var_54_27 = arg_51_1.actors_["1056"].transform
			local var_54_28 = 2

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1.var_.moveOldPos1056 = var_54_27.localPosition
				var_54_27.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1056", 7)

				local var_54_29 = var_54_27.childCount

				for iter_54_2 = 0, var_54_29 - 1 do
					local var_54_30 = var_54_27:GetChild(iter_54_2)

					if var_54_30.name == "" or not string.find(var_54_30.name, "split") then
						var_54_30.gameObject:SetActive(true)
					else
						var_54_30.gameObject:SetActive(false)
					end
				end
			end

			local var_54_31 = 0.001

			if var_54_28 <= arg_51_1.time_ and arg_51_1.time_ < var_54_28 + var_54_31 then
				local var_54_32 = (arg_51_1.time_ - var_54_28) / var_54_31
				local var_54_33 = Vector3.New(0, -2000, -180)

				var_54_27.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1056, var_54_33, var_54_32)
			end

			if arg_51_1.time_ >= var_54_28 + var_54_31 and arg_51_1.time_ < var_54_28 + var_54_31 + arg_54_0 then
				var_54_27.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_54_34 = arg_51_1.actors_["1060"].transform
			local var_54_35 = 2

			if var_54_35 < arg_51_1.time_ and arg_51_1.time_ <= var_54_35 + arg_54_0 then
				arg_51_1.var_.moveOldPos1060 = var_54_34.localPosition
				var_54_34.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1060", 7)

				local var_54_36 = var_54_34.childCount

				for iter_54_3 = 0, var_54_36 - 1 do
					local var_54_37 = var_54_34:GetChild(iter_54_3)

					if var_54_37.name == "" or not string.find(var_54_37.name, "split") then
						var_54_37.gameObject:SetActive(true)
					else
						var_54_37.gameObject:SetActive(false)
					end
				end
			end

			local var_54_38 = 0.001

			if var_54_35 <= arg_51_1.time_ and arg_51_1.time_ < var_54_35 + var_54_38 then
				local var_54_39 = (arg_51_1.time_ - var_54_35) / var_54_38
				local var_54_40 = Vector3.New(0, -2000, -40)

				var_54_34.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1060, var_54_40, var_54_39)
			end

			if arg_51_1.time_ >= var_54_35 + var_54_38 and arg_51_1.time_ < var_54_35 + var_54_38 + arg_54_0 then
				var_54_34.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_54_41 = arg_51_1.actors_["1056"]
			local var_54_42 = 2

			if var_54_42 < arg_51_1.time_ and arg_51_1.time_ <= var_54_42 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 == nil then
				arg_51_1.var_.actorSpriteComps1056 = var_54_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_43 = 0.034

			if var_54_42 <= arg_51_1.time_ and arg_51_1.time_ < var_54_42 + var_54_43 then
				local var_54_44 = (arg_51_1.time_ - var_54_42) / var_54_43

				if arg_51_1.var_.actorSpriteComps1056 then
					for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_54_5 then
							local var_54_45 = Mathf.Lerp(iter_54_5.color.r, 0.5, var_54_44)

							iter_54_5.color = Color.New(var_54_45, var_54_45, var_54_45)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_42 + var_54_43 and arg_51_1.time_ < var_54_42 + var_54_43 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 then
				local var_54_46 = 0.5

				for iter_54_6, iter_54_7 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_54_7 then
						iter_54_7.color = Color.New(var_54_46, var_54_46, var_54_46)
					end
				end

				arg_51_1.var_.actorSpriteComps1056 = nil
			end

			local var_54_47 = arg_51_1.actors_["1060"]
			local var_54_48 = 2

			if var_54_48 < arg_51_1.time_ and arg_51_1.time_ <= var_54_48 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 == nil then
				arg_51_1.var_.actorSpriteComps1060 = var_54_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_49 = 0.034

			if var_54_48 <= arg_51_1.time_ and arg_51_1.time_ < var_54_48 + var_54_49 then
				local var_54_50 = (arg_51_1.time_ - var_54_48) / var_54_49

				if arg_51_1.var_.actorSpriteComps1060 then
					for iter_54_8, iter_54_9 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_54_9 then
							local var_54_51 = Mathf.Lerp(iter_54_9.color.r, 0.5, var_54_50)

							iter_54_9.color = Color.New(var_54_51, var_54_51, var_54_51)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_48 + var_54_49 and arg_51_1.time_ < var_54_48 + var_54_49 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 then
				local var_54_52 = 0.5

				for iter_54_10, iter_54_11 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_54_11 then
						iter_54_11.color = Color.New(var_54_52, var_54_52, var_54_52)
					end
				end

				arg_51_1.var_.actorSpriteComps1060 = nil
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_53 = 4
			local var_54_54 = 0.9

			if var_54_53 < arg_51_1.time_ and arg_51_1.time_ <= var_54_53 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_55 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_55:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_56 = arg_51_1:GetWordFromCfg(410251013)
				local var_54_57 = arg_51_1:FormatText(var_54_56.content)

				arg_51_1.text_.text = var_54_57

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_58 = 36
				local var_54_59 = utf8.len(var_54_57)
				local var_54_60 = var_54_58 <= 0 and var_54_54 or var_54_54 * (var_54_59 / var_54_58)

				if var_54_60 > 0 and var_54_54 < var_54_60 then
					arg_51_1.talkMaxDuration = var_54_60
					var_54_53 = var_54_53 + 0.3

					if var_54_60 + var_54_53 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_60 + var_54_53
					end
				end

				arg_51_1.text_.text = var_54_57
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_61 = var_54_53 + 0.3
			local var_54_62 = math.max(var_54_54, arg_51_1.talkMaxDuration)

			if var_54_61 <= arg_51_1.time_ and arg_51_1.time_ < var_54_61 + var_54_62 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_61) / var_54_62

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_61 + var_54_62 and arg_51_1.time_ < var_54_61 + var_54_62 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410251014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 410251014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play410251015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_2 = arg_57_1:GetWordFromCfg(410251014)
				local var_60_3 = arg_57_1:FormatText(var_60_2.content)

				arg_57_1.text_.text = var_60_3

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_4 = 40
				local var_60_5 = utf8.len(var_60_3)
				local var_60_6 = var_60_4 <= 0 and var_60_1 or var_60_1 * (var_60_5 / var_60_4)

				if var_60_6 > 0 and var_60_1 < var_60_6 then
					arg_57_1.talkMaxDuration = var_60_6

					if var_60_6 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_6 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_3
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_7 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_7 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_7

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_7 and arg_57_1.time_ < var_60_0 + var_60_7 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play410251015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 410251015
		arg_61_1.duration_ = 2.3

		local var_61_0 = {
			ja = 2.3,
			CriLanguages = 1.2,
			zh = 1.2
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
				arg_61_0:Play410251016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1060"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos1060 = var_64_0.localPosition
				var_64_0.localScale = Vector3.New(1, 1, 1)

				arg_61_1:CheckSpriteTmpPos("1060", 3)

				local var_64_2 = var_64_0.childCount

				for iter_64_0 = 0, var_64_2 - 1 do
					local var_64_3 = var_64_0:GetChild(iter_64_0)

					if var_64_3.name == "split_3" or not string.find(var_64_3.name, "split") then
						var_64_3.gameObject:SetActive(true)
					else
						var_64_3.gameObject:SetActive(false)
					end
				end
			end

			local var_64_4 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_4 then
				local var_64_5 = (arg_61_1.time_ - var_64_1) / var_64_4
				local var_64_6 = Vector3.New(0, -435, -40)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1060, var_64_6, var_64_5)
			end

			if arg_61_1.time_ >= var_64_1 + var_64_4 and arg_61_1.time_ < var_64_1 + var_64_4 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_64_7 = arg_61_1.actors_["1060"]
			local var_64_8 = 0

			if var_64_8 < arg_61_1.time_ and arg_61_1.time_ <= var_64_8 + arg_64_0 and arg_61_1.var_.actorSpriteComps1060 == nil then
				arg_61_1.var_.actorSpriteComps1060 = var_64_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_9 = 0.034

			if var_64_8 <= arg_61_1.time_ and arg_61_1.time_ < var_64_8 + var_64_9 then
				local var_64_10 = (arg_61_1.time_ - var_64_8) / var_64_9

				if arg_61_1.var_.actorSpriteComps1060 then
					for iter_64_1, iter_64_2 in pairs(arg_61_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_64_2 then
							local var_64_11 = Mathf.Lerp(iter_64_2.color.r, 1, var_64_10)

							iter_64_2.color = Color.New(var_64_11, var_64_11, var_64_11)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_8 + var_64_9 and arg_61_1.time_ < var_64_8 + var_64_9 + arg_64_0 and arg_61_1.var_.actorSpriteComps1060 then
				local var_64_12 = 1

				for iter_64_3, iter_64_4 in pairs(arg_61_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_64_4 then
						iter_64_4.color = Color.New(var_64_12, var_64_12, var_64_12)
					end
				end

				arg_61_1.var_.actorSpriteComps1060 = nil
			end

			local var_64_13 = 0
			local var_64_14 = 0.075

			if var_64_13 < arg_61_1.time_ and arg_61_1.time_ <= var_64_13 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_15 = arg_61_1:FormatText(StoryNameCfg[584].name)

				arg_61_1.leftNameTxt_.text = var_64_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_16 = arg_61_1:GetWordFromCfg(410251015)
				local var_64_17 = arg_61_1:FormatText(var_64_16.content)

				arg_61_1.text_.text = var_64_17

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_18 = 3
				local var_64_19 = utf8.len(var_64_17)
				local var_64_20 = var_64_18 <= 0 and var_64_14 or var_64_14 * (var_64_19 / var_64_18)

				if var_64_20 > 0 and var_64_14 < var_64_20 then
					arg_61_1.talkMaxDuration = var_64_20

					if var_64_20 + var_64_13 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_20 + var_64_13
					end
				end

				arg_61_1.text_.text = var_64_17
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251015", "story_v_out_410251.awb") ~= 0 then
					local var_64_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251015", "story_v_out_410251.awb") / 1000

					if var_64_21 + var_64_13 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_21 + var_64_13
					end

					if var_64_16.prefab_name ~= "" and arg_61_1.actors_[var_64_16.prefab_name] ~= nil then
						local var_64_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_16.prefab_name].transform, "story_v_out_410251", "410251015", "story_v_out_410251.awb")

						arg_61_1:RecordAudio("410251015", var_64_22)
						arg_61_1:RecordAudio("410251015", var_64_22)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_410251", "410251015", "story_v_out_410251.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_410251", "410251015", "story_v_out_410251.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_23 = math.max(var_64_14, arg_61_1.talkMaxDuration)

			if var_64_13 <= arg_61_1.time_ and arg_61_1.time_ < var_64_13 + var_64_23 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_13) / var_64_23

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_13 + var_64_23 and arg_61_1.time_ < var_64_13 + var_64_23 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play410251016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 410251016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play410251017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1060"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos1060 = var_68_0.localPosition
				var_68_0.localScale = Vector3.New(1, 1, 1)

				arg_65_1:CheckSpriteTmpPos("1060", 7)

				local var_68_2 = var_68_0.childCount

				for iter_68_0 = 0, var_68_2 - 1 do
					local var_68_3 = var_68_0:GetChild(iter_68_0)

					if var_68_3.name == "" or not string.find(var_68_3.name, "split") then
						var_68_3.gameObject:SetActive(true)
					else
						var_68_3.gameObject:SetActive(false)
					end
				end
			end

			local var_68_4 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_4 then
				local var_68_5 = (arg_65_1.time_ - var_68_1) / var_68_4
				local var_68_6 = Vector3.New(0, -2000, -40)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1060, var_68_6, var_68_5)
			end

			if arg_65_1.time_ >= var_68_1 + var_68_4 and arg_65_1.time_ < var_68_1 + var_68_4 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_68_7 = arg_65_1.actors_["1060"]
			local var_68_8 = 0

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 and arg_65_1.var_.actorSpriteComps1060 == nil then
				arg_65_1.var_.actorSpriteComps1060 = var_68_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_9 = 0.034

			if var_68_8 <= arg_65_1.time_ and arg_65_1.time_ < var_68_8 + var_68_9 then
				local var_68_10 = (arg_65_1.time_ - var_68_8) / var_68_9

				if arg_65_1.var_.actorSpriteComps1060 then
					for iter_68_1, iter_68_2 in pairs(arg_65_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_68_2 then
							local var_68_11 = Mathf.Lerp(iter_68_2.color.r, 0.5, var_68_10)

							iter_68_2.color = Color.New(var_68_11, var_68_11, var_68_11)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_8 + var_68_9 and arg_65_1.time_ < var_68_8 + var_68_9 + arg_68_0 and arg_65_1.var_.actorSpriteComps1060 then
				local var_68_12 = 0.5

				for iter_68_3, iter_68_4 in pairs(arg_65_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_68_4 then
						iter_68_4.color = Color.New(var_68_12, var_68_12, var_68_12)
					end
				end

				arg_65_1.var_.actorSpriteComps1060 = nil
			end

			local var_68_13 = 0
			local var_68_14 = 1.525

			if var_68_13 < arg_65_1.time_ and arg_65_1.time_ <= var_68_13 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_15 = arg_65_1:GetWordFromCfg(410251016)
				local var_68_16 = arg_65_1:FormatText(var_68_15.content)

				arg_65_1.text_.text = var_68_16

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_17 = 61
				local var_68_18 = utf8.len(var_68_16)
				local var_68_19 = var_68_17 <= 0 and var_68_14 or var_68_14 * (var_68_18 / var_68_17)

				if var_68_19 > 0 and var_68_14 < var_68_19 then
					arg_65_1.talkMaxDuration = var_68_19

					if var_68_19 + var_68_13 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_19 + var_68_13
					end
				end

				arg_65_1.text_.text = var_68_16
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_20 = math.max(var_68_14, arg_65_1.talkMaxDuration)

			if var_68_13 <= arg_65_1.time_ and arg_65_1.time_ < var_68_13 + var_68_20 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_13) / var_68_20

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_13 + var_68_20 and arg_65_1.time_ < var_68_13 + var_68_20 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play410251017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 410251017
		arg_69_1.duration_ = 1.666

		local var_69_0 = {
			ja = 1.666,
			CriLanguages = 0.999999999999,
			zh = 0.999999999999
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
				arg_69_0:Play410251018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1060"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1060 = var_72_0.localPosition
				var_72_0.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("1060", 3)

				local var_72_2 = var_72_0.childCount

				for iter_72_0 = 0, var_72_2 - 1 do
					local var_72_3 = var_72_0:GetChild(iter_72_0)

					if var_72_3.name == "split_3" or not string.find(var_72_3.name, "split") then
						var_72_3.gameObject:SetActive(true)
					else
						var_72_3.gameObject:SetActive(false)
					end
				end
			end

			local var_72_4 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_4 then
				local var_72_5 = (arg_69_1.time_ - var_72_1) / var_72_4
				local var_72_6 = Vector3.New(0, -435, -40)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1060, var_72_6, var_72_5)
			end

			if arg_69_1.time_ >= var_72_1 + var_72_4 and arg_69_1.time_ < var_72_1 + var_72_4 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_72_7 = arg_69_1.actors_["1060"]
			local var_72_8 = 0

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps1060 == nil then
				arg_69_1.var_.actorSpriteComps1060 = var_72_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_9 = 0.034

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_8) / var_72_9

				if arg_69_1.var_.actorSpriteComps1060 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_72_2 then
							local var_72_11 = Mathf.Lerp(iter_72_2.color.r, 1, var_72_10)

							iter_72_2.color = Color.New(var_72_11, var_72_11, var_72_11)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_8 + var_72_9 and arg_69_1.time_ < var_72_8 + var_72_9 + arg_72_0 and arg_69_1.var_.actorSpriteComps1060 then
				local var_72_12 = 1

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_12, var_72_12, var_72_12)
					end
				end

				arg_69_1.var_.actorSpriteComps1060 = nil
			end

			local var_72_13 = 0
			local var_72_14 = 0.075

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_15 = arg_69_1:FormatText(StoryNameCfg[584].name)

				arg_69_1.leftNameTxt_.text = var_72_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_16 = arg_69_1:GetWordFromCfg(410251017)
				local var_72_17 = arg_69_1:FormatText(var_72_16.content)

				arg_69_1.text_.text = var_72_17

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_18 = 3
				local var_72_19 = utf8.len(var_72_17)
				local var_72_20 = var_72_18 <= 0 and var_72_14 or var_72_14 * (var_72_19 / var_72_18)

				if var_72_20 > 0 and var_72_14 < var_72_20 then
					arg_69_1.talkMaxDuration = var_72_20

					if var_72_20 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_13
					end
				end

				arg_69_1.text_.text = var_72_17
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251017", "story_v_out_410251.awb") ~= 0 then
					local var_72_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251017", "story_v_out_410251.awb") / 1000

					if var_72_21 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_13
					end

					if var_72_16.prefab_name ~= "" and arg_69_1.actors_[var_72_16.prefab_name] ~= nil then
						local var_72_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_16.prefab_name].transform, "story_v_out_410251", "410251017", "story_v_out_410251.awb")

						arg_69_1:RecordAudio("410251017", var_72_22)
						arg_69_1:RecordAudio("410251017", var_72_22)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_410251", "410251017", "story_v_out_410251.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_410251", "410251017", "story_v_out_410251.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_23 = math.max(var_72_14, arg_69_1.talkMaxDuration)

			if var_72_13 <= arg_69_1.time_ and arg_69_1.time_ < var_72_13 + var_72_23 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_13) / var_72_23

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_13 + var_72_23 and arg_69_1.time_ < var_72_13 + var_72_23 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play410251018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 410251018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play410251019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1060"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1060 = var_76_0.localPosition
				var_76_0.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("1060", 7)

				local var_76_2 = var_76_0.childCount

				for iter_76_0 = 0, var_76_2 - 1 do
					local var_76_3 = var_76_0:GetChild(iter_76_0)

					if var_76_3.name == "" or not string.find(var_76_3.name, "split") then
						var_76_3.gameObject:SetActive(true)
					else
						var_76_3.gameObject:SetActive(false)
					end
				end
			end

			local var_76_4 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_4 then
				local var_76_5 = (arg_73_1.time_ - var_76_1) / var_76_4
				local var_76_6 = Vector3.New(0, -2000, -40)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1060, var_76_6, var_76_5)
			end

			if arg_73_1.time_ >= var_76_1 + var_76_4 and arg_73_1.time_ < var_76_1 + var_76_4 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_76_7 = arg_73_1.actors_["1060"]
			local var_76_8 = 0

			if var_76_8 < arg_73_1.time_ and arg_73_1.time_ <= var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps1060 == nil then
				arg_73_1.var_.actorSpriteComps1060 = var_76_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_9 = 0.034

			if var_76_8 <= arg_73_1.time_ and arg_73_1.time_ < var_76_8 + var_76_9 then
				local var_76_10 = (arg_73_1.time_ - var_76_8) / var_76_9

				if arg_73_1.var_.actorSpriteComps1060 then
					for iter_76_1, iter_76_2 in pairs(arg_73_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_76_2 then
							local var_76_11 = Mathf.Lerp(iter_76_2.color.r, 0.5, var_76_10)

							iter_76_2.color = Color.New(var_76_11, var_76_11, var_76_11)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_8 + var_76_9 and arg_73_1.time_ < var_76_8 + var_76_9 + arg_76_0 and arg_73_1.var_.actorSpriteComps1060 then
				local var_76_12 = 0.5

				for iter_76_3, iter_76_4 in pairs(arg_73_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_76_4 then
						iter_76_4.color = Color.New(var_76_12, var_76_12, var_76_12)
					end
				end

				arg_73_1.var_.actorSpriteComps1060 = nil
			end

			local var_76_13 = 0
			local var_76_14 = 1.05

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_15 = arg_73_1:GetWordFromCfg(410251018)
				local var_76_16 = arg_73_1:FormatText(var_76_15.content)

				arg_73_1.text_.text = var_76_16

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_17 = 42
				local var_76_18 = utf8.len(var_76_16)
				local var_76_19 = var_76_17 <= 0 and var_76_14 or var_76_14 * (var_76_18 / var_76_17)

				if var_76_19 > 0 and var_76_14 < var_76_19 then
					arg_73_1.talkMaxDuration = var_76_19

					if var_76_19 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_13
					end
				end

				arg_73_1.text_.text = var_76_16
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_20 = math.max(var_76_14, arg_73_1.talkMaxDuration)

			if var_76_13 <= arg_73_1.time_ and arg_73_1.time_ < var_76_13 + var_76_20 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_13) / var_76_20

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_13 + var_76_20 and arg_73_1.time_ < var_76_13 + var_76_20 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play410251019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 410251019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play410251020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.975

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_2 = arg_77_1:GetWordFromCfg(410251019)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 39
				local var_80_5 = utf8.len(var_80_3)
				local var_80_6 = var_80_4 <= 0 and var_80_1 or var_80_1 * (var_80_5 / var_80_4)

				if var_80_6 > 0 and var_80_1 < var_80_6 then
					arg_77_1.talkMaxDuration = var_80_6

					if var_80_6 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_6 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_3
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_7 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_7 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_7

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_7 and arg_77_1.time_ < var_80_0 + var_80_7 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play410251020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 410251020
		arg_81_1.duration_ = 8.1

		local var_81_0 = {
			ja = 8.1,
			CriLanguages = 6.166,
			zh = 6.166
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play410251021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 2

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				local var_84_1 = manager.ui.mainCamera.transform.localPosition
				local var_84_2 = Vector3.New(0, 0, 10) + Vector3.New(var_84_1.x, var_84_1.y, 0)
				local var_84_3 = arg_81_1.bgs_.L04h

				var_84_3.transform.localPosition = var_84_2
				var_84_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_84_4 = var_84_3:GetComponent("SpriteRenderer")

				if var_84_4 and var_84_4.sprite then
					local var_84_5 = (var_84_3.transform.localPosition - var_84_1).z
					local var_84_6 = manager.ui.mainCameraCom_
					local var_84_7 = 2 * var_84_5 * Mathf.Tan(var_84_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_84_8 = var_84_7 * var_84_6.aspect
					local var_84_9 = var_84_4.sprite.bounds.size.x
					local var_84_10 = var_84_4.sprite.bounds.size.y
					local var_84_11 = var_84_8 / var_84_9
					local var_84_12 = var_84_7 / var_84_10
					local var_84_13 = var_84_12 < var_84_11 and var_84_11 or var_84_12

					var_84_3.transform.localScale = Vector3.New(var_84_13, var_84_13, 0)
				end

				for iter_84_0, iter_84_1 in pairs(arg_81_1.bgs_) do
					if iter_84_0 ~= "L04h" then
						iter_84_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_84_14 = 0

			if var_84_14 < arg_81_1.time_ and arg_81_1.time_ <= var_84_14 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_15 = 2

			if var_84_14 <= arg_81_1.time_ and arg_81_1.time_ < var_84_14 + var_84_15 then
				local var_84_16 = (arg_81_1.time_ - var_84_14) / var_84_15
				local var_84_17 = Color.New(0, 0, 0)

				var_84_17.a = Mathf.Lerp(0, 1, var_84_16)
				arg_81_1.mask_.color = var_84_17
			end

			if arg_81_1.time_ >= var_84_14 + var_84_15 and arg_81_1.time_ < var_84_14 + var_84_15 + arg_84_0 then
				local var_84_18 = Color.New(0, 0, 0)

				var_84_18.a = 1
				arg_81_1.mask_.color = var_84_18
			end

			local var_84_19 = 2

			if var_84_19 < arg_81_1.time_ and arg_81_1.time_ <= var_84_19 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_20 = 2

			if var_84_19 <= arg_81_1.time_ and arg_81_1.time_ < var_84_19 + var_84_20 then
				local var_84_21 = (arg_81_1.time_ - var_84_19) / var_84_20
				local var_84_22 = Color.New(0, 0, 0)

				var_84_22.a = Mathf.Lerp(1, 0, var_84_21)
				arg_81_1.mask_.color = var_84_22
			end

			if arg_81_1.time_ >= var_84_19 + var_84_20 and arg_81_1.time_ < var_84_19 + var_84_20 + arg_84_0 then
				local var_84_23 = Color.New(0, 0, 0)
				local var_84_24 = 0

				arg_81_1.mask_.enabled = false
				var_84_23.a = var_84_24
				arg_81_1.mask_.color = var_84_23
			end

			local var_84_25 = "10062"

			if arg_81_1.actors_[var_84_25] == nil then
				local var_84_26 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_84_25), arg_81_1.canvasGo_.transform)

				var_84_26.transform:SetSiblingIndex(1)

				var_84_26.name = var_84_25
				var_84_26.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_81_1.actors_[var_84_25] = var_84_26
			end

			local var_84_27 = arg_81_1.actors_["10062"].transform
			local var_84_28 = 4

			if var_84_28 < arg_81_1.time_ and arg_81_1.time_ <= var_84_28 + arg_84_0 then
				arg_81_1.var_.moveOldPos10062 = var_84_27.localPosition
				var_84_27.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("10062", 3)

				local var_84_29 = var_84_27.childCount

				for iter_84_2 = 0, var_84_29 - 1 do
					local var_84_30 = var_84_27:GetChild(iter_84_2)

					if var_84_30.name == "" or not string.find(var_84_30.name, "split") then
						var_84_30.gameObject:SetActive(true)
					else
						var_84_30.gameObject:SetActive(false)
					end
				end
			end

			local var_84_31 = 0.001

			if var_84_28 <= arg_81_1.time_ and arg_81_1.time_ < var_84_28 + var_84_31 then
				local var_84_32 = (arg_81_1.time_ - var_84_28) / var_84_31
				local var_84_33 = Vector3.New(0, -390, -290)

				var_84_27.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10062, var_84_33, var_84_32)
			end

			if arg_81_1.time_ >= var_84_28 + var_84_31 and arg_81_1.time_ < var_84_28 + var_84_31 + arg_84_0 then
				var_84_27.localPosition = Vector3.New(0, -390, -290)
			end

			local var_84_34 = arg_81_1.actors_["10062"]
			local var_84_35 = 4

			if var_84_35 < arg_81_1.time_ and arg_81_1.time_ <= var_84_35 + arg_84_0 and arg_81_1.var_.actorSpriteComps10062 == nil then
				arg_81_1.var_.actorSpriteComps10062 = var_84_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_36 = 0.034

			if var_84_35 <= arg_81_1.time_ and arg_81_1.time_ < var_84_35 + var_84_36 then
				local var_84_37 = (arg_81_1.time_ - var_84_35) / var_84_36

				if arg_81_1.var_.actorSpriteComps10062 then
					for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_84_4 then
							local var_84_38 = Mathf.Lerp(iter_84_4.color.r, 1, var_84_37)

							iter_84_4.color = Color.New(var_84_38, var_84_38, var_84_38)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_35 + var_84_36 and arg_81_1.time_ < var_84_35 + var_84_36 + arg_84_0 and arg_81_1.var_.actorSpriteComps10062 then
				local var_84_39 = 1

				for iter_84_5, iter_84_6 in pairs(arg_81_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_84_6 then
						iter_84_6.color = Color.New(var_84_39, var_84_39, var_84_39)
					end
				end

				arg_81_1.var_.actorSpriteComps10062 = nil
			end

			if arg_81_1.frameCnt_ <= 1 then
				arg_81_1.dialog_:SetActive(false)
			end

			local var_84_40 = 4
			local var_84_41 = 0.125

			if var_84_40 < arg_81_1.time_ and arg_81_1.time_ <= var_84_40 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				arg_81_1.dialog_:SetActive(true)

				local var_84_42 = LeanTween.value(arg_81_1.dialog_, 0, 1, 0.3)

				var_84_42:setOnUpdate(LuaHelper.FloatAction(function(arg_85_0)
					arg_81_1.dialogCg_.alpha = arg_85_0
				end))
				var_84_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_81_1.dialog_)
					var_84_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_81_1.duration_ = arg_81_1.duration_ + 0.3

				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_43 = arg_81_1:FormatText(StoryNameCfg[600].name)

				arg_81_1.leftNameTxt_.text = var_84_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_44 = arg_81_1:GetWordFromCfg(410251020)
				local var_84_45 = arg_81_1:FormatText(var_84_44.content)

				arg_81_1.text_.text = var_84_45

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_46 = 5
				local var_84_47 = utf8.len(var_84_45)
				local var_84_48 = var_84_46 <= 0 and var_84_41 or var_84_41 * (var_84_47 / var_84_46)

				if var_84_48 > 0 and var_84_41 < var_84_48 then
					arg_81_1.talkMaxDuration = var_84_48
					var_84_40 = var_84_40 + 0.3

					if var_84_48 + var_84_40 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_48 + var_84_40
					end
				end

				arg_81_1.text_.text = var_84_45
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251020", "story_v_out_410251.awb") ~= 0 then
					local var_84_49 = manager.audio:GetVoiceLength("story_v_out_410251", "410251020", "story_v_out_410251.awb") / 1000

					if var_84_49 + var_84_40 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_49 + var_84_40
					end

					if var_84_44.prefab_name ~= "" and arg_81_1.actors_[var_84_44.prefab_name] ~= nil then
						local var_84_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_44.prefab_name].transform, "story_v_out_410251", "410251020", "story_v_out_410251.awb")

						arg_81_1:RecordAudio("410251020", var_84_50)
						arg_81_1:RecordAudio("410251020", var_84_50)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_410251", "410251020", "story_v_out_410251.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_410251", "410251020", "story_v_out_410251.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_51 = var_84_40 + 0.3
			local var_84_52 = math.max(var_84_41, arg_81_1.talkMaxDuration)

			if var_84_51 <= arg_81_1.time_ and arg_81_1.time_ < var_84_51 + var_84_52 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_51) / var_84_52

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_51 + var_84_52 and arg_81_1.time_ < var_84_51 + var_84_52 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play410251021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410251021
		arg_87_1.duration_ = 3.066

		local var_87_0 = {
			ja = 2.1,
			CriLanguages = 3.066,
			zh = 3.066
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
				arg_87_0:Play410251022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10062"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10062 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("10062", 7)

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
				local var_90_6 = Vector3.New(0, -2000, -290)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10062, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_90_7 = "1061"

			if arg_87_1.actors_[var_90_7] == nil then
				local var_90_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_90_7), arg_87_1.canvasGo_.transform)

				var_90_8.transform:SetSiblingIndex(1)

				var_90_8.name = var_90_7
				var_90_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_87_1.actors_[var_90_7] = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1061"].transform
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.var_.moveOldPos1061 = var_90_9.localPosition
				var_90_9.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1061", 3)

				local var_90_11 = var_90_9.childCount

				for iter_90_1 = 0, var_90_11 - 1 do
					local var_90_12 = var_90_9:GetChild(iter_90_1)

					if var_90_12.name == "split_7" or not string.find(var_90_12.name, "split") then
						var_90_12.gameObject:SetActive(true)
					else
						var_90_12.gameObject:SetActive(false)
					end
				end
			end

			local var_90_13 = 0.001

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_13 then
				local var_90_14 = (arg_87_1.time_ - var_90_10) / var_90_13
				local var_90_15 = Vector3.New(0, -490, 18)

				var_90_9.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1061, var_90_15, var_90_14)
			end

			if arg_87_1.time_ >= var_90_10 + var_90_13 and arg_87_1.time_ < var_90_10 + var_90_13 + arg_90_0 then
				var_90_9.localPosition = Vector3.New(0, -490, 18)
			end

			local var_90_16 = arg_87_1.actors_["10062"]
			local var_90_17 = 0

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 and arg_87_1.var_.actorSpriteComps10062 == nil then
				arg_87_1.var_.actorSpriteComps10062 = var_90_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_18 = 0.034

			if var_90_17 <= arg_87_1.time_ and arg_87_1.time_ < var_90_17 + var_90_18 then
				local var_90_19 = (arg_87_1.time_ - var_90_17) / var_90_18

				if arg_87_1.var_.actorSpriteComps10062 then
					for iter_90_2, iter_90_3 in pairs(arg_87_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_90_3 then
							local var_90_20 = Mathf.Lerp(iter_90_3.color.r, 0.5, var_90_19)

							iter_90_3.color = Color.New(var_90_20, var_90_20, var_90_20)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_17 + var_90_18 and arg_87_1.time_ < var_90_17 + var_90_18 + arg_90_0 and arg_87_1.var_.actorSpriteComps10062 then
				local var_90_21 = 0.5

				for iter_90_4, iter_90_5 in pairs(arg_87_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_90_5 then
						iter_90_5.color = Color.New(var_90_21, var_90_21, var_90_21)
					end
				end

				arg_87_1.var_.actorSpriteComps10062 = nil
			end

			local var_90_22 = arg_87_1.actors_["1061"]
			local var_90_23 = 0

			if var_90_23 < arg_87_1.time_ and arg_87_1.time_ <= var_90_23 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 == nil then
				arg_87_1.var_.actorSpriteComps1061 = var_90_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_24 = 0.034

			if var_90_23 <= arg_87_1.time_ and arg_87_1.time_ < var_90_23 + var_90_24 then
				local var_90_25 = (arg_87_1.time_ - var_90_23) / var_90_24

				if arg_87_1.var_.actorSpriteComps1061 then
					for iter_90_6, iter_90_7 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_90_7 then
							local var_90_26 = Mathf.Lerp(iter_90_7.color.r, 1, var_90_25)

							iter_90_7.color = Color.New(var_90_26, var_90_26, var_90_26)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_23 + var_90_24 and arg_87_1.time_ < var_90_23 + var_90_24 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 then
				local var_90_27 = 1

				for iter_90_8, iter_90_9 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_90_9 then
						iter_90_9.color = Color.New(var_90_27, var_90_27, var_90_27)
					end
				end

				arg_87_1.var_.actorSpriteComps1061 = nil
			end

			local var_90_28 = 0
			local var_90_29 = 0.175

			if var_90_28 < arg_87_1.time_ and arg_87_1.time_ <= var_90_28 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_30 = arg_87_1:FormatText(StoryNameCfg[612].name)

				arg_87_1.leftNameTxt_.text = var_90_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_31 = arg_87_1:GetWordFromCfg(410251021)
				local var_90_32 = arg_87_1:FormatText(var_90_31.content)

				arg_87_1.text_.text = var_90_32

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_33 = 7
				local var_90_34 = utf8.len(var_90_32)
				local var_90_35 = var_90_33 <= 0 and var_90_29 or var_90_29 * (var_90_34 / var_90_33)

				if var_90_35 > 0 and var_90_29 < var_90_35 then
					arg_87_1.talkMaxDuration = var_90_35

					if var_90_35 + var_90_28 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_35 + var_90_28
					end
				end

				arg_87_1.text_.text = var_90_32
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251021", "story_v_out_410251.awb") ~= 0 then
					local var_90_36 = manager.audio:GetVoiceLength("story_v_out_410251", "410251021", "story_v_out_410251.awb") / 1000

					if var_90_36 + var_90_28 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_36 + var_90_28
					end

					if var_90_31.prefab_name ~= "" and arg_87_1.actors_[var_90_31.prefab_name] ~= nil then
						local var_90_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_31.prefab_name].transform, "story_v_out_410251", "410251021", "story_v_out_410251.awb")

						arg_87_1:RecordAudio("410251021", var_90_37)
						arg_87_1:RecordAudio("410251021", var_90_37)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410251", "410251021", "story_v_out_410251.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410251", "410251021", "story_v_out_410251.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_38 = math.max(var_90_29, arg_87_1.talkMaxDuration)

			if var_90_28 <= arg_87_1.time_ and arg_87_1.time_ < var_90_28 + var_90_38 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_28) / var_90_38

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_28 + var_90_38 and arg_87_1.time_ < var_90_28 + var_90_38 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410251022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410251022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play410251023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1061"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps1061 == nil then
				arg_91_1.var_.actorSpriteComps1061 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.034

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps1061 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps1061 then
				local var_94_5 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps1061 = nil
			end

			local var_94_6 = 0
			local var_94_7 = 1.525

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(410251022)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 61
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_7 or var_94_7 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_7 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_13 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_13 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_13

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_13 and arg_91_1.time_ < var_94_6 + var_94_13 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410251023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410251023
		arg_95_1.duration_ = 10.033

		local var_95_0 = {
			ja = 10.033,
			CriLanguages = 5.533,
			zh = 5.533
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
				arg_95_0:Play410251024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1061"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1061 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1061", 3)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_5" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(0, -490, 18)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1061, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_98_7 = arg_95_1.actors_["1061"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 == nil then
				arg_95_1.var_.actorSpriteComps1061 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps1061 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps1061 = nil
			end

			local var_98_13 = 0
			local var_98_14 = 0.5

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_15 = arg_95_1:FormatText(StoryNameCfg[612].name)

				arg_95_1.leftNameTxt_.text = var_98_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_16 = arg_95_1:GetWordFromCfg(410251023)
				local var_98_17 = arg_95_1:FormatText(var_98_16.content)

				arg_95_1.text_.text = var_98_17

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_18 = 20
				local var_98_19 = utf8.len(var_98_17)
				local var_98_20 = var_98_18 <= 0 and var_98_14 or var_98_14 * (var_98_19 / var_98_18)

				if var_98_20 > 0 and var_98_14 < var_98_20 then
					arg_95_1.talkMaxDuration = var_98_20

					if var_98_20 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_13
					end
				end

				arg_95_1.text_.text = var_98_17
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251023", "story_v_out_410251.awb") ~= 0 then
					local var_98_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251023", "story_v_out_410251.awb") / 1000

					if var_98_21 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_13
					end

					if var_98_16.prefab_name ~= "" and arg_95_1.actors_[var_98_16.prefab_name] ~= nil then
						local var_98_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_16.prefab_name].transform, "story_v_out_410251", "410251023", "story_v_out_410251.awb")

						arg_95_1:RecordAudio("410251023", var_98_22)
						arg_95_1:RecordAudio("410251023", var_98_22)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410251", "410251023", "story_v_out_410251.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410251", "410251023", "story_v_out_410251.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_23 = math.max(var_98_14, arg_95_1.talkMaxDuration)

			if var_98_13 <= arg_95_1.time_ and arg_95_1.time_ < var_98_13 + var_98_23 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_13) / var_98_23

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_13 + var_98_23 and arg_95_1.time_ < var_98_13 + var_98_23 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410251024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410251024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play410251025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1061"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1061 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1061", 7)

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
				local var_102_6 = Vector3.New(0, -2000, 18)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1061, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_102_7 = arg_99_1.actors_["1061"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps1061 == nil then
				arg_99_1.var_.actorSpriteComps1061 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.034

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps1061 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 0.5, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps1061 then
				local var_102_12 = 0.5

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps1061 = nil
			end

			local var_102_13 = 0
			local var_102_14 = 1.05

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(410251024)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 42
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_14 or var_102_14 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_14 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_13
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_20 = math.max(var_102_14, arg_99_1.talkMaxDuration)

			if var_102_13 <= arg_99_1.time_ and arg_99_1.time_ < var_102_13 + var_102_20 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_13) / var_102_20

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_13 + var_102_20 and arg_99_1.time_ < var_102_13 + var_102_20 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410251025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410251025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play410251026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.925

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_2 = arg_103_1:GetWordFromCfg(410251025)
				local var_106_3 = arg_103_1:FormatText(var_106_2.content)

				arg_103_1.text_.text = var_106_3

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_4 = 37
				local var_106_5 = utf8.len(var_106_3)
				local var_106_6 = var_106_4 <= 0 and var_106_1 or var_106_1 * (var_106_5 / var_106_4)

				if var_106_6 > 0 and var_106_1 < var_106_6 then
					arg_103_1.talkMaxDuration = var_106_6

					if var_106_6 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_6 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_3
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_7 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_7 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_7

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_7 and arg_103_1.time_ < var_106_0 + var_106_7 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410251026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410251026
		arg_107_1.duration_ = 3.7

		local var_107_0 = {
			ja = 3.7,
			CriLanguages = 2.766,
			zh = 2.766
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
				arg_107_0:Play410251027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1060"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1060 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1060", 2)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_3" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(-390, -435, -40)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1060, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_110_7 = arg_107_1.actors_["1061"].transform
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 then
				arg_107_1.var_.moveOldPos1061 = var_110_7.localPosition
				var_110_7.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1061", 4)

				local var_110_9 = var_110_7.childCount

				for iter_110_1 = 0, var_110_9 - 1 do
					local var_110_10 = var_110_7:GetChild(iter_110_1)

					if var_110_10.name == "" or not string.find(var_110_10.name, "split") then
						var_110_10.gameObject:SetActive(true)
					else
						var_110_10.gameObject:SetActive(false)
					end
				end
			end

			local var_110_11 = 0.001

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_8) / var_110_11
				local var_110_13 = Vector3.New(390, -490, 18)

				var_110_7.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1061, var_110_13, var_110_12)
			end

			if arg_107_1.time_ >= var_110_8 + var_110_11 and arg_107_1.time_ < var_110_8 + var_110_11 + arg_110_0 then
				var_110_7.localPosition = Vector3.New(390, -490, 18)
			end

			local var_110_14 = arg_107_1.actors_["1060"]
			local var_110_15 = 0

			if var_110_15 < arg_107_1.time_ and arg_107_1.time_ <= var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 == nil then
				arg_107_1.var_.actorSpriteComps1060 = var_110_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_16 = 0.034

			if var_110_15 <= arg_107_1.time_ and arg_107_1.time_ < var_110_15 + var_110_16 then
				local var_110_17 = (arg_107_1.time_ - var_110_15) / var_110_16

				if arg_107_1.var_.actorSpriteComps1060 then
					for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_110_3 then
							local var_110_18 = Mathf.Lerp(iter_110_3.color.r, 1, var_110_17)

							iter_110_3.color = Color.New(var_110_18, var_110_18, var_110_18)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_15 + var_110_16 and arg_107_1.time_ < var_110_15 + var_110_16 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 then
				local var_110_19 = 1

				for iter_110_4, iter_110_5 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_110_5 then
						iter_110_5.color = Color.New(var_110_19, var_110_19, var_110_19)
					end
				end

				arg_107_1.var_.actorSpriteComps1060 = nil
			end

			local var_110_20 = arg_107_1.actors_["1061"]
			local var_110_21 = 0

			if var_110_21 < arg_107_1.time_ and arg_107_1.time_ <= var_110_21 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 == nil then
				arg_107_1.var_.actorSpriteComps1061 = var_110_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_22 = 0.034

			if var_110_21 <= arg_107_1.time_ and arg_107_1.time_ < var_110_21 + var_110_22 then
				local var_110_23 = (arg_107_1.time_ - var_110_21) / var_110_22

				if arg_107_1.var_.actorSpriteComps1061 then
					for iter_110_6, iter_110_7 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_110_7 then
							local var_110_24 = Mathf.Lerp(iter_110_7.color.r, 0.5, var_110_23)

							iter_110_7.color = Color.New(var_110_24, var_110_24, var_110_24)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_21 + var_110_22 and arg_107_1.time_ < var_110_21 + var_110_22 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 then
				local var_110_25 = 0.5

				for iter_110_8, iter_110_9 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_110_9 then
						iter_110_9.color = Color.New(var_110_25, var_110_25, var_110_25)
					end
				end

				arg_107_1.var_.actorSpriteComps1061 = nil
			end

			local var_110_26 = 0
			local var_110_27 = 0.35

			if var_110_26 < arg_107_1.time_ and arg_107_1.time_ <= var_110_26 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_28 = arg_107_1:FormatText(StoryNameCfg[584].name)

				arg_107_1.leftNameTxt_.text = var_110_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_29 = arg_107_1:GetWordFromCfg(410251026)
				local var_110_30 = arg_107_1:FormatText(var_110_29.content)

				arg_107_1.text_.text = var_110_30

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_31 = 14
				local var_110_32 = utf8.len(var_110_30)
				local var_110_33 = var_110_31 <= 0 and var_110_27 or var_110_27 * (var_110_32 / var_110_31)

				if var_110_33 > 0 and var_110_27 < var_110_33 then
					arg_107_1.talkMaxDuration = var_110_33

					if var_110_33 + var_110_26 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_33 + var_110_26
					end
				end

				arg_107_1.text_.text = var_110_30
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251026", "story_v_out_410251.awb") ~= 0 then
					local var_110_34 = manager.audio:GetVoiceLength("story_v_out_410251", "410251026", "story_v_out_410251.awb") / 1000

					if var_110_34 + var_110_26 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_34 + var_110_26
					end

					if var_110_29.prefab_name ~= "" and arg_107_1.actors_[var_110_29.prefab_name] ~= nil then
						local var_110_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_29.prefab_name].transform, "story_v_out_410251", "410251026", "story_v_out_410251.awb")

						arg_107_1:RecordAudio("410251026", var_110_35)
						arg_107_1:RecordAudio("410251026", var_110_35)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410251", "410251026", "story_v_out_410251.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410251", "410251026", "story_v_out_410251.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_36 = math.max(var_110_27, arg_107_1.talkMaxDuration)

			if var_110_26 <= arg_107_1.time_ and arg_107_1.time_ < var_110_26 + var_110_36 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_26) / var_110_36

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_26 + var_110_36 and arg_107_1.time_ < var_110_26 + var_110_36 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410251027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410251027
		arg_111_1.duration_ = 4

		local var_111_0 = {
			ja = 1.866,
			CriLanguages = 4,
			zh = 4
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
				arg_111_0:Play410251028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1061"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1061 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1061", 4)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_5" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(390, -490, 18)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1061, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(390, -490, 18)
			end

			local var_114_7 = arg_111_1.actors_["1061"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1061 == nil then
				arg_111_1.var_.actorSpriteComps1061 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps1061 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps1061 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps1061 = nil
			end

			local var_114_13 = arg_111_1.actors_["1060"]
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 == nil then
				arg_111_1.var_.actorSpriteComps1060 = var_114_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_15 = 0.034

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15

				if arg_111_1.var_.actorSpriteComps1060 then
					for iter_114_5, iter_114_6 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_114_6 then
							local var_114_17 = Mathf.Lerp(iter_114_6.color.r, 0.5, var_114_16)

							iter_114_6.color = Color.New(var_114_17, var_114_17, var_114_17)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 then
				local var_114_18 = 0.5

				for iter_114_7, iter_114_8 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_114_8 then
						iter_114_8.color = Color.New(var_114_18, var_114_18, var_114_18)
					end
				end

				arg_111_1.var_.actorSpriteComps1060 = nil
			end

			local var_114_19 = 0
			local var_114_20 = 0.2

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[612].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(410251027)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251027", "story_v_out_410251.awb") ~= 0 then
					local var_114_27 = manager.audio:GetVoiceLength("story_v_out_410251", "410251027", "story_v_out_410251.awb") / 1000

					if var_114_27 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_27 + var_114_19
					end

					if var_114_22.prefab_name ~= "" and arg_111_1.actors_[var_114_22.prefab_name] ~= nil then
						local var_114_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_22.prefab_name].transform, "story_v_out_410251", "410251027", "story_v_out_410251.awb")

						arg_111_1:RecordAudio("410251027", var_114_28)
						arg_111_1:RecordAudio("410251027", var_114_28)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410251", "410251027", "story_v_out_410251.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410251", "410251027", "story_v_out_410251.awb")
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
	Play410251028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410251028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play410251029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1060"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1060 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1060", 7)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(0, -2000, -40)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1060, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_118_7 = arg_115_1.actors_["1061"].transform
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 then
				arg_115_1.var_.moveOldPos1061 = var_118_7.localPosition
				var_118_7.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1061", 7)

				local var_118_9 = var_118_7.childCount

				for iter_118_1 = 0, var_118_9 - 1 do
					local var_118_10 = var_118_7:GetChild(iter_118_1)

					if var_118_10.name == "" or not string.find(var_118_10.name, "split") then
						var_118_10.gameObject:SetActive(true)
					else
						var_118_10.gameObject:SetActive(false)
					end
				end
			end

			local var_118_11 = 0.001

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_8) / var_118_11
				local var_118_13 = Vector3.New(0, -2000, 18)

				var_118_7.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1061, var_118_13, var_118_12)
			end

			if arg_115_1.time_ >= var_118_8 + var_118_11 and arg_115_1.time_ < var_118_8 + var_118_11 + arg_118_0 then
				var_118_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_118_14 = arg_115_1.actors_["1060"]
			local var_118_15 = 0

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 == nil then
				arg_115_1.var_.actorSpriteComps1060 = var_118_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_16 = 0.034

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_16 then
				local var_118_17 = (arg_115_1.time_ - var_118_15) / var_118_16

				if arg_115_1.var_.actorSpriteComps1060 then
					for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_118_3 then
							local var_118_18 = Mathf.Lerp(iter_118_3.color.r, 0.5, var_118_17)

							iter_118_3.color = Color.New(var_118_18, var_118_18, var_118_18)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_15 + var_118_16 and arg_115_1.time_ < var_118_15 + var_118_16 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 then
				local var_118_19 = 0.5

				for iter_118_4, iter_118_5 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_118_5 then
						iter_118_5.color = Color.New(var_118_19, var_118_19, var_118_19)
					end
				end

				arg_115_1.var_.actorSpriteComps1060 = nil
			end

			local var_118_20 = arg_115_1.actors_["1061"]
			local var_118_21 = 0

			if var_118_21 < arg_115_1.time_ and arg_115_1.time_ <= var_118_21 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 == nil then
				arg_115_1.var_.actorSpriteComps1061 = var_118_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_22 = 0.034

			if var_118_21 <= arg_115_1.time_ and arg_115_1.time_ < var_118_21 + var_118_22 then
				local var_118_23 = (arg_115_1.time_ - var_118_21) / var_118_22

				if arg_115_1.var_.actorSpriteComps1061 then
					for iter_118_6, iter_118_7 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_118_7 then
							local var_118_24 = Mathf.Lerp(iter_118_7.color.r, 0.5, var_118_23)

							iter_118_7.color = Color.New(var_118_24, var_118_24, var_118_24)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_21 + var_118_22 and arg_115_1.time_ < var_118_21 + var_118_22 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 then
				local var_118_25 = 0.5

				for iter_118_8, iter_118_9 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_118_9 then
						iter_118_9.color = Color.New(var_118_25, var_118_25, var_118_25)
					end
				end

				arg_115_1.var_.actorSpriteComps1061 = nil
			end

			local var_118_26 = 0
			local var_118_27 = 1.325

			if var_118_26 < arg_115_1.time_ and arg_115_1.time_ <= var_118_26 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_28 = arg_115_1:GetWordFromCfg(410251028)
				local var_118_29 = arg_115_1:FormatText(var_118_28.content)

				arg_115_1.text_.text = var_118_29

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_30 = 53
				local var_118_31 = utf8.len(var_118_29)
				local var_118_32 = var_118_30 <= 0 and var_118_27 or var_118_27 * (var_118_31 / var_118_30)

				if var_118_32 > 0 and var_118_27 < var_118_32 then
					arg_115_1.talkMaxDuration = var_118_32

					if var_118_32 + var_118_26 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_32 + var_118_26
					end
				end

				arg_115_1.text_.text = var_118_29
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_33 = math.max(var_118_27, arg_115_1.talkMaxDuration)

			if var_118_26 <= arg_115_1.time_ and arg_115_1.time_ < var_118_26 + var_118_33 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_26) / var_118_33

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_26 + var_118_33 and arg_115_1.time_ < var_118_26 + var_118_33 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410251029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410251029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play410251030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1.525

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_2 = arg_119_1:GetWordFromCfg(410251029)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 61
				local var_122_5 = utf8.len(var_122_3)
				local var_122_6 = var_122_4 <= 0 and var_122_1 or var_122_1 * (var_122_5 / var_122_4)

				if var_122_6 > 0 and var_122_1 < var_122_6 then
					arg_119_1.talkMaxDuration = var_122_6

					if var_122_6 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_6 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_3
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_7 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_7 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_7

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_7 and arg_119_1.time_ < var_122_0 + var_122_7 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410251030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410251030
		arg_123_1.duration_ = 3.4

		local var_123_0 = {
			ja = 3.4,
			CriLanguages = 3.333,
			zh = 3.333
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
				arg_123_0:Play410251031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1061"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1061 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1061", 3)

				local var_126_2 = var_126_0.childCount

				for iter_126_0 = 0, var_126_2 - 1 do
					local var_126_3 = var_126_0:GetChild(iter_126_0)

					if var_126_3.name == "split_5" or not string.find(var_126_3.name, "split") then
						var_126_3.gameObject:SetActive(true)
					else
						var_126_3.gameObject:SetActive(false)
					end
				end
			end

			local var_126_4 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_4 then
				local var_126_5 = (arg_123_1.time_ - var_126_1) / var_126_4
				local var_126_6 = Vector3.New(0, -490, 18)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1061, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -490, 18)
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

			local var_126_13 = 0
			local var_126_14 = 0.225

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_15 = arg_123_1:FormatText(StoryNameCfg[612].name)

				arg_123_1.leftNameTxt_.text = var_126_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_16 = arg_123_1:GetWordFromCfg(410251030)
				local var_126_17 = arg_123_1:FormatText(var_126_16.content)

				arg_123_1.text_.text = var_126_17

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_18 = 9
				local var_126_19 = utf8.len(var_126_17)
				local var_126_20 = var_126_18 <= 0 and var_126_14 or var_126_14 * (var_126_19 / var_126_18)

				if var_126_20 > 0 and var_126_14 < var_126_20 then
					arg_123_1.talkMaxDuration = var_126_20

					if var_126_20 + var_126_13 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_20 + var_126_13
					end
				end

				arg_123_1.text_.text = var_126_17
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251030", "story_v_out_410251.awb") ~= 0 then
					local var_126_21 = manager.audio:GetVoiceLength("story_v_out_410251", "410251030", "story_v_out_410251.awb") / 1000

					if var_126_21 + var_126_13 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_21 + var_126_13
					end

					if var_126_16.prefab_name ~= "" and arg_123_1.actors_[var_126_16.prefab_name] ~= nil then
						local var_126_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_16.prefab_name].transform, "story_v_out_410251", "410251030", "story_v_out_410251.awb")

						arg_123_1:RecordAudio("410251030", var_126_22)
						arg_123_1:RecordAudio("410251030", var_126_22)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_410251", "410251030", "story_v_out_410251.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_410251", "410251030", "story_v_out_410251.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_23 = math.max(var_126_14, arg_123_1.talkMaxDuration)

			if var_126_13 <= arg_123_1.time_ and arg_123_1.time_ < var_126_13 + var_126_23 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_13) / var_126_23

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_13 + var_126_23 and arg_123_1.time_ < var_126_13 + var_126_23 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410251031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410251031
		arg_127_1.duration_ = 5.63333333333333

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play410251032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = "STwhite"

			if arg_127_1.bgs_[var_130_0] == nil then
				local var_130_1 = Object.Instantiate(arg_127_1.paintGo_)

				var_130_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_130_0)
				var_130_1.name = var_130_0
				var_130_1.transform.parent = arg_127_1.stage_.transform
				var_130_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_127_1.bgs_[var_130_0] = var_130_1
			end

			local var_130_2 = 0.633333333333333

			if var_130_2 < arg_127_1.time_ and arg_127_1.time_ <= var_130_2 + arg_130_0 then
				local var_130_3 = manager.ui.mainCamera.transform.localPosition
				local var_130_4 = Vector3.New(0, 0, 10) + Vector3.New(var_130_3.x, var_130_3.y, 0)
				local var_130_5 = arg_127_1.bgs_.STwhite

				var_130_5.transform.localPosition = var_130_4
				var_130_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_130_6 = var_130_5:GetComponent("SpriteRenderer")

				if var_130_6 and var_130_6.sprite then
					local var_130_7 = (var_130_5.transform.localPosition - var_130_3).z
					local var_130_8 = manager.ui.mainCameraCom_
					local var_130_9 = 2 * var_130_7 * Mathf.Tan(var_130_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_130_10 = var_130_9 * var_130_8.aspect
					local var_130_11 = var_130_6.sprite.bounds.size.x
					local var_130_12 = var_130_6.sprite.bounds.size.y
					local var_130_13 = var_130_10 / var_130_11
					local var_130_14 = var_130_9 / var_130_12
					local var_130_15 = var_130_14 < var_130_13 and var_130_13 or var_130_14

					var_130_5.transform.localScale = Vector3.New(var_130_15, var_130_15, 0)
				end

				for iter_130_0, iter_130_1 in pairs(arg_127_1.bgs_) do
					if iter_130_0 ~= "STwhite" then
						iter_130_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_130_16 = 0

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 then
				arg_127_1.mask_.enabled = true
				arg_127_1.mask_.raycastTarget = true

				arg_127_1:SetGaussion(false)
			end

			local var_130_17 = 0.633333333333333

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_17 then
				local var_130_18 = (arg_127_1.time_ - var_130_16) / var_130_17
				local var_130_19 = Color.New(1, 1, 1)

				var_130_19.a = Mathf.Lerp(1, 0, var_130_18)
				arg_127_1.mask_.color = var_130_19
			end

			if arg_127_1.time_ >= var_130_16 + var_130_17 and arg_127_1.time_ < var_130_16 + var_130_17 + arg_130_0 then
				local var_130_20 = Color.New(1, 1, 1)
				local var_130_21 = 0

				arg_127_1.mask_.enabled = false
				var_130_20.a = var_130_21
				arg_127_1.mask_.color = var_130_20
			end

			local var_130_22 = arg_127_1.actors_["1061"].transform
			local var_130_23 = 0

			if var_130_23 < arg_127_1.time_ and arg_127_1.time_ <= var_130_23 + arg_130_0 then
				arg_127_1.var_.moveOldPos1061 = var_130_22.localPosition
				var_130_22.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("1061", 7)

				local var_130_24 = var_130_22.childCount

				for iter_130_2 = 0, var_130_24 - 1 do
					local var_130_25 = var_130_22:GetChild(iter_130_2)

					if var_130_25.name == "" or not string.find(var_130_25.name, "split") then
						var_130_25.gameObject:SetActive(true)
					else
						var_130_25.gameObject:SetActive(false)
					end
				end
			end

			local var_130_26 = 0.001

			if var_130_23 <= arg_127_1.time_ and arg_127_1.time_ < var_130_23 + var_130_26 then
				local var_130_27 = (arg_127_1.time_ - var_130_23) / var_130_26
				local var_130_28 = Vector3.New(0, -2000, 18)

				var_130_22.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1061, var_130_28, var_130_27)
			end

			if arg_127_1.time_ >= var_130_23 + var_130_26 and arg_127_1.time_ < var_130_23 + var_130_26 + arg_130_0 then
				var_130_22.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_130_29 = arg_127_1.actors_["1061"]
			local var_130_30 = 0

			if var_130_30 < arg_127_1.time_ and arg_127_1.time_ <= var_130_30 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 == nil then
				arg_127_1.var_.actorSpriteComps1061 = var_130_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_31 = 0.034

			if var_130_30 <= arg_127_1.time_ and arg_127_1.time_ < var_130_30 + var_130_31 then
				local var_130_32 = (arg_127_1.time_ - var_130_30) / var_130_31

				if arg_127_1.var_.actorSpriteComps1061 then
					for iter_130_3, iter_130_4 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_130_4 then
							local var_130_33 = Mathf.Lerp(iter_130_4.color.r, 0.5, var_130_32)

							iter_130_4.color = Color.New(var_130_33, var_130_33, var_130_33)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_30 + var_130_31 and arg_127_1.time_ < var_130_30 + var_130_31 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 then
				local var_130_34 = 0.5

				for iter_130_5, iter_130_6 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_130_6 then
						iter_130_6.color = Color.New(var_130_34, var_130_34, var_130_34)
					end
				end

				arg_127_1.var_.actorSpriteComps1061 = nil
			end

			if arg_127_1.frameCnt_ <= 1 then
				arg_127_1.dialog_:SetActive(false)
			end

			local var_130_35 = 0.633333333333333
			local var_130_36 = 0.925

			if var_130_35 < arg_127_1.time_ and arg_127_1.time_ <= var_130_35 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0

				arg_127_1.dialog_:SetActive(true)

				local var_130_37 = LeanTween.value(arg_127_1.dialog_, 0, 1, 0.3)

				var_130_37:setOnUpdate(LuaHelper.FloatAction(function(arg_131_0)
					arg_127_1.dialogCg_.alpha = arg_131_0
				end))
				var_130_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_127_1.dialog_)
					var_130_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_127_1.duration_ = arg_127_1.duration_ + 0.3

				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_38 = arg_127_1:GetWordFromCfg(410251031)
				local var_130_39 = arg_127_1:FormatText(var_130_38.content)

				arg_127_1.text_.text = var_130_39

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_40 = 37
				local var_130_41 = utf8.len(var_130_39)
				local var_130_42 = var_130_40 <= 0 and var_130_36 or var_130_36 * (var_130_41 / var_130_40)

				if var_130_42 > 0 and var_130_36 < var_130_42 then
					arg_127_1.talkMaxDuration = var_130_42
					var_130_35 = var_130_35 + 0.3

					if var_130_42 + var_130_35 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_42 + var_130_35
					end
				end

				arg_127_1.text_.text = var_130_39
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_43 = var_130_35 + 0.3
			local var_130_44 = math.max(var_130_36, arg_127_1.talkMaxDuration)

			if var_130_43 <= arg_127_1.time_ and arg_127_1.time_ < var_130_43 + var_130_44 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_43) / var_130_44

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_43 + var_130_44 and arg_127_1.time_ < var_130_43 + var_130_44 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410251032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410251032
		arg_133_1.duration_ = 7

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play410251033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = "LZ0208"

			if arg_133_1.bgs_[var_136_0] == nil then
				local var_136_1 = Object.Instantiate(arg_133_1.paintGo_)

				var_136_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_136_0)
				var_136_1.name = var_136_0
				var_136_1.transform.parent = arg_133_1.stage_.transform
				var_136_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_133_1.bgs_[var_136_0] = var_136_1
			end

			local var_136_2 = 0

			if var_136_2 < arg_133_1.time_ and arg_133_1.time_ <= var_136_2 + arg_136_0 then
				local var_136_3 = manager.ui.mainCamera.transform.localPosition
				local var_136_4 = Vector3.New(0, 0, 10) + Vector3.New(var_136_3.x, var_136_3.y, 0)
				local var_136_5 = arg_133_1.bgs_.LZ0208

				var_136_5.transform.localPosition = var_136_4
				var_136_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_136_6 = var_136_5:GetComponent("SpriteRenderer")

				if var_136_6 and var_136_6.sprite then
					local var_136_7 = (var_136_5.transform.localPosition - var_136_3).z
					local var_136_8 = manager.ui.mainCameraCom_
					local var_136_9 = 2 * var_136_7 * Mathf.Tan(var_136_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_136_10 = var_136_9 * var_136_8.aspect
					local var_136_11 = var_136_6.sprite.bounds.size.x
					local var_136_12 = var_136_6.sprite.bounds.size.y
					local var_136_13 = var_136_10 / var_136_11
					local var_136_14 = var_136_9 / var_136_12
					local var_136_15 = var_136_14 < var_136_13 and var_136_13 or var_136_14

					var_136_5.transform.localScale = Vector3.New(var_136_15, var_136_15, 0)
				end

				for iter_136_0, iter_136_1 in pairs(arg_133_1.bgs_) do
					if iter_136_0 ~= "LZ0208" then
						iter_136_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_136_16 = 0

			if var_136_16 < arg_133_1.time_ and arg_133_1.time_ <= var_136_16 + arg_136_0 then
				arg_133_1.mask_.enabled = true
				arg_133_1.mask_.raycastTarget = true

				arg_133_1:SetGaussion(false)
			end

			local var_136_17 = 2

			if var_136_16 <= arg_133_1.time_ and arg_133_1.time_ < var_136_16 + var_136_17 then
				local var_136_18 = (arg_133_1.time_ - var_136_16) / var_136_17
				local var_136_19 = Color.New(1, 1, 1)

				var_136_19.a = Mathf.Lerp(1, 0, var_136_18)
				arg_133_1.mask_.color = var_136_19
			end

			if arg_133_1.time_ >= var_136_16 + var_136_17 and arg_133_1.time_ < var_136_16 + var_136_17 + arg_136_0 then
				local var_136_20 = Color.New(1, 1, 1)
				local var_136_21 = 0

				arg_133_1.mask_.enabled = false
				var_136_20.a = var_136_21
				arg_133_1.mask_.color = var_136_20
			end

			local var_136_22 = arg_133_1.bgs_.LZ0208.transform
			local var_136_23 = 0

			if var_136_23 < arg_133_1.time_ and arg_133_1.time_ <= var_136_23 + arg_136_0 then
				arg_133_1.var_.moveOldPosLZ0208 = var_136_22.localPosition
			end

			local var_136_24 = 0.001

			if var_136_23 <= arg_133_1.time_ and arg_133_1.time_ < var_136_23 + var_136_24 then
				local var_136_25 = (arg_133_1.time_ - var_136_23) / var_136_24
				local var_136_26 = Vector3.New(0, 1, 5)

				var_136_22.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPosLZ0208, var_136_26, var_136_25)
			end

			if arg_133_1.time_ >= var_136_23 + var_136_24 and arg_133_1.time_ < var_136_23 + var_136_24 + arg_136_0 then
				var_136_22.localPosition = Vector3.New(0, 1, 5)
			end

			local var_136_27 = arg_133_1.bgs_.LZ0208.transform
			local var_136_28 = 0.0166666666666667

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 then
				arg_133_1.var_.moveOldPosLZ0208 = var_136_27.localPosition
			end

			local var_136_29 = 4

			if var_136_28 <= arg_133_1.time_ and arg_133_1.time_ < var_136_28 + var_136_29 then
				local var_136_30 = (arg_133_1.time_ - var_136_28) / var_136_29
				local var_136_31 = Vector3.New(0, 0.8, 9)

				var_136_27.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPosLZ0208, var_136_31, var_136_30)
			end

			if arg_133_1.time_ >= var_136_28 + var_136_29 and arg_133_1.time_ < var_136_28 + var_136_29 + arg_136_0 then
				var_136_27.localPosition = Vector3.New(0, 0.8, 9)
			end

			local var_136_32 = 2

			if var_136_32 < arg_133_1.time_ and arg_133_1.time_ <= var_136_32 + arg_136_0 then
				arg_133_1.allBtn_.enabled = false
			end

			local var_136_33 = 2.01666666666667

			if arg_133_1.time_ >= var_136_32 + var_136_33 and arg_133_1.time_ < var_136_32 + var_136_33 + arg_136_0 then
				arg_133_1.allBtn_.enabled = true
			end

			local var_136_34 = manager.ui.mainCamera.transform
			local var_136_35 = 0

			if var_136_35 < arg_133_1.time_ and arg_133_1.time_ <= var_136_35 + arg_136_0 then
				arg_133_1.var_.shakeOldPos = var_136_34.localPosition
			end

			local var_136_36 = 1

			if var_136_35 <= arg_133_1.time_ and arg_133_1.time_ < var_136_35 + var_136_36 then
				local var_136_37 = (arg_133_1.time_ - var_136_35) / 0.066
				local var_136_38, var_136_39 = math.modf(var_136_37)

				var_136_34.localPosition = Vector3.New(var_136_39 * 0.13, var_136_39 * 0.13, var_136_39 * 0.13) + arg_133_1.var_.shakeOldPos
			end

			if arg_133_1.time_ >= var_136_35 + var_136_36 and arg_133_1.time_ < var_136_35 + var_136_36 + arg_136_0 then
				var_136_34.localPosition = arg_133_1.var_.shakeOldPos
			end

			if arg_133_1.frameCnt_ <= 1 then
				arg_133_1.dialog_:SetActive(false)
			end

			local var_136_40 = 2
			local var_136_41 = 0.975

			if var_136_40 < arg_133_1.time_ and arg_133_1.time_ <= var_136_40 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0

				arg_133_1.dialog_:SetActive(true)

				local var_136_42 = LeanTween.value(arg_133_1.dialog_, 0, 1, 0.3)

				var_136_42:setOnUpdate(LuaHelper.FloatAction(function(arg_137_0)
					arg_133_1.dialogCg_.alpha = arg_137_0
				end))
				var_136_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_133_1.dialog_)
					var_136_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_133_1.duration_ = arg_133_1.duration_ + 0.3

				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_43 = arg_133_1:GetWordFromCfg(410251032)
				local var_136_44 = arg_133_1:FormatText(var_136_43.content)

				arg_133_1.text_.text = var_136_44

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_45 = 39
				local var_136_46 = utf8.len(var_136_44)
				local var_136_47 = var_136_45 <= 0 and var_136_41 or var_136_41 * (var_136_46 / var_136_45)

				if var_136_47 > 0 and var_136_41 < var_136_47 then
					arg_133_1.talkMaxDuration = var_136_47
					var_136_40 = var_136_40 + 0.3

					if var_136_47 + var_136_40 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_47 + var_136_40
					end
				end

				arg_133_1.text_.text = var_136_44
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_48 = var_136_40 + 0.3
			local var_136_49 = math.max(var_136_41, arg_133_1.talkMaxDuration)

			if var_136_48 <= arg_133_1.time_ and arg_133_1.time_ < var_136_48 + var_136_49 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_48) / var_136_49

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_48 + var_136_49 and arg_133_1.time_ < var_136_48 + var_136_49 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410251033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410251033
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play410251034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.65

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_2 = arg_139_1:GetWordFromCfg(410251033)
				local var_142_3 = arg_139_1:FormatText(var_142_2.content)

				arg_139_1.text_.text = var_142_3

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_4 = 26
				local var_142_5 = utf8.len(var_142_3)
				local var_142_6 = var_142_4 <= 0 and var_142_1 or var_142_1 * (var_142_5 / var_142_4)

				if var_142_6 > 0 and var_142_1 < var_142_6 then
					arg_139_1.talkMaxDuration = var_142_6

					if var_142_6 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_6 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_3
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_7 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_7 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_7

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_7 and arg_139_1.time_ < var_142_0 + var_142_7 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410251034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410251034
		arg_143_1.duration_ = 4.433

		local var_143_0 = {
			ja = 4.433,
			CriLanguages = 3.5,
			zh = 3.5
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
				arg_143_0:Play410251035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.45

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[605].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, true)
				arg_143_1.iconController_:SetSelectedState("hero")

				arg_143_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1056_split_4")

				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(410251034)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251034", "story_v_out_410251.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251034", "story_v_out_410251.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_410251", "410251034", "story_v_out_410251.awb")

						arg_143_1:RecordAudio("410251034", var_146_9)
						arg_143_1:RecordAudio("410251034", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_410251", "410251034", "story_v_out_410251.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_410251", "410251034", "story_v_out_410251.awb")
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
	Play410251035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410251035
		arg_147_1.duration_ = 3.7

		local var_147_0 = {
			ja = 3.7,
			CriLanguages = 2.033,
			zh = 2.033
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
				arg_147_0:Play410251036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.225

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[612].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(410251035)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 9
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251035", "story_v_out_410251.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251035", "story_v_out_410251.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_410251", "410251035", "story_v_out_410251.awb")

						arg_147_1:RecordAudio("410251035", var_150_9)
						arg_147_1:RecordAudio("410251035", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410251", "410251035", "story_v_out_410251.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410251", "410251035", "story_v_out_410251.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410251036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410251036
		arg_151_1.duration_ = 8.266

		local var_151_0 = {
			ja = 6.5,
			CriLanguages = 8.266,
			zh = 8.266
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
				arg_151_0:Play410251037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.9

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[605].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, true)
				arg_151_1.iconController_:SetSelectedState("hero")

				arg_151_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1056_split_3")

				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(410251036)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251036", "story_v_out_410251.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251036", "story_v_out_410251.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_410251", "410251036", "story_v_out_410251.awb")

						arg_151_1:RecordAudio("410251036", var_154_9)
						arg_151_1:RecordAudio("410251036", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410251", "410251036", "story_v_out_410251.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410251", "410251036", "story_v_out_410251.awb")
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
	Play410251037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410251037
		arg_155_1.duration_ = 10.033

		local var_155_0 = {
			ja = 10.033,
			CriLanguages = 3.3,
			zh = 3.3
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
				arg_155_0:Play410251038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.375

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[612].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(410251037)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 15
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251037", "story_v_out_410251.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251037", "story_v_out_410251.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_410251", "410251037", "story_v_out_410251.awb")

						arg_155_1:RecordAudio("410251037", var_158_9)
						arg_155_1:RecordAudio("410251037", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410251", "410251037", "story_v_out_410251.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410251", "410251037", "story_v_out_410251.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410251038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410251038
		arg_159_1.duration_ = 6.9

		local var_159_0 = {
			ja = 6.9,
			CriLanguages = 3.6,
			zh = 3.6
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
				arg_159_0:Play410251039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.425

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[584].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, true)
				arg_159_1.iconController_:SetSelectedState("hero")

				arg_159_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_3")

				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(410251038)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 17
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251038", "story_v_out_410251.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251038", "story_v_out_410251.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_410251", "410251038", "story_v_out_410251.awb")

						arg_159_1:RecordAudio("410251038", var_162_9)
						arg_159_1:RecordAudio("410251038", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410251", "410251038", "story_v_out_410251.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410251", "410251038", "story_v_out_410251.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play410251039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410251039
		arg_163_1.duration_ = 0.999999999999

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play410251040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.05

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[612].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(410251039)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251039", "story_v_out_410251.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251039", "story_v_out_410251.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_410251", "410251039", "story_v_out_410251.awb")

						arg_163_1:RecordAudio("410251039", var_166_9)
						arg_163_1:RecordAudio("410251039", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410251", "410251039", "story_v_out_410251.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410251", "410251039", "story_v_out_410251.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play410251040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410251040
		arg_167_1.duration_ = 2.2

		local var_167_0 = {
			ja = 1.933,
			CriLanguages = 2.2,
			zh = 2.2
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
				arg_167_0:Play410251041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.15

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[584].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, true)
				arg_167_1.iconController_:SetSelectedState("hero")

				arg_167_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_3")

				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(410251040)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 6
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251040", "story_v_out_410251.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251040", "story_v_out_410251.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_410251", "410251040", "story_v_out_410251.awb")

						arg_167_1:RecordAudio("410251040", var_170_9)
						arg_167_1:RecordAudio("410251040", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410251", "410251040", "story_v_out_410251.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410251", "410251040", "story_v_out_410251.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_10 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_10 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_10

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_10 and arg_167_1.time_ < var_170_0 + var_170_10 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play410251041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410251041
		arg_171_1.duration_ = 9

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play410251042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 2

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				local var_174_1 = manager.ui.mainCamera.transform.localPosition
				local var_174_2 = Vector3.New(0, 0, 10) + Vector3.New(var_174_1.x, var_174_1.y, 0)
				local var_174_3 = arg_171_1.bgs_.L04h

				var_174_3.transform.localPosition = var_174_2
				var_174_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_174_4 = var_174_3:GetComponent("SpriteRenderer")

				if var_174_4 and var_174_4.sprite then
					local var_174_5 = (var_174_3.transform.localPosition - var_174_1).z
					local var_174_6 = manager.ui.mainCameraCom_
					local var_174_7 = 2 * var_174_5 * Mathf.Tan(var_174_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_174_8 = var_174_7 * var_174_6.aspect
					local var_174_9 = var_174_4.sprite.bounds.size.x
					local var_174_10 = var_174_4.sprite.bounds.size.y
					local var_174_11 = var_174_8 / var_174_9
					local var_174_12 = var_174_7 / var_174_10
					local var_174_13 = var_174_12 < var_174_11 and var_174_11 or var_174_12

					var_174_3.transform.localScale = Vector3.New(var_174_13, var_174_13, 0)
				end

				for iter_174_0, iter_174_1 in pairs(arg_171_1.bgs_) do
					if iter_174_0 ~= "L04h" then
						iter_174_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_15 = 2

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15
				local var_174_17 = Color.New(0, 0, 0)

				var_174_17.a = Mathf.Lerp(0, 1, var_174_16)
				arg_171_1.mask_.color = var_174_17
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 then
				local var_174_18 = Color.New(0, 0, 0)

				var_174_18.a = 1
				arg_171_1.mask_.color = var_174_18
			end

			local var_174_19 = 2

			if var_174_19 < arg_171_1.time_ and arg_171_1.time_ <= var_174_19 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_20 = 2

			if var_174_19 <= arg_171_1.time_ and arg_171_1.time_ < var_174_19 + var_174_20 then
				local var_174_21 = (arg_171_1.time_ - var_174_19) / var_174_20
				local var_174_22 = Color.New(0, 0, 0)

				var_174_22.a = Mathf.Lerp(1, 0, var_174_21)
				arg_171_1.mask_.color = var_174_22
			end

			if arg_171_1.time_ >= var_174_19 + var_174_20 and arg_171_1.time_ < var_174_19 + var_174_20 + arg_174_0 then
				local var_174_23 = Color.New(0, 0, 0)
				local var_174_24 = 0

				arg_171_1.mask_.enabled = false
				var_174_23.a = var_174_24
				arg_171_1.mask_.color = var_174_23
			end

			if arg_171_1.frameCnt_ <= 1 then
				arg_171_1.dialog_:SetActive(false)
			end

			local var_174_25 = 4
			local var_174_26 = 1

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0

				arg_171_1.dialog_:SetActive(true)

				local var_174_27 = LeanTween.value(arg_171_1.dialog_, 0, 1, 0.3)

				var_174_27:setOnUpdate(LuaHelper.FloatAction(function(arg_175_0)
					arg_171_1.dialogCg_.alpha = arg_175_0
				end))
				var_174_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_171_1.dialog_)
					var_174_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_171_1.duration_ = arg_171_1.duration_ + 0.3

				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_28 = arg_171_1:GetWordFromCfg(410251041)
				local var_174_29 = arg_171_1:FormatText(var_174_28.content)

				arg_171_1.text_.text = var_174_29

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_30 = 40
				local var_174_31 = utf8.len(var_174_29)
				local var_174_32 = var_174_30 <= 0 and var_174_26 or var_174_26 * (var_174_31 / var_174_30)

				if var_174_32 > 0 and var_174_26 < var_174_32 then
					arg_171_1.talkMaxDuration = var_174_32
					var_174_25 = var_174_25 + 0.3

					if var_174_32 + var_174_25 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_32 + var_174_25
					end
				end

				arg_171_1.text_.text = var_174_29
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_33 = var_174_25 + 0.3
			local var_174_34 = math.max(var_174_26, arg_171_1.talkMaxDuration)

			if var_174_33 <= arg_171_1.time_ and arg_171_1.time_ < var_174_33 + var_174_34 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_33) / var_174_34

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_33 + var_174_34 and arg_171_1.time_ < var_174_33 + var_174_34 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410251042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 410251042
		arg_177_1.duration_ = 11.033

		local var_177_0 = {
			ja = 11.033,
			CriLanguages = 7.4,
			zh = 7.4
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play410251043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.675

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[600].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4032")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(410251042)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 27
				local var_180_6 = utf8.len(var_180_4)
				local var_180_7 = var_180_5 <= 0 and var_180_1 or var_180_1 * (var_180_6 / var_180_5)

				if var_180_7 > 0 and var_180_1 < var_180_7 then
					arg_177_1.talkMaxDuration = var_180_7

					if var_180_7 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_7 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_4
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251042", "story_v_out_410251.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251042", "story_v_out_410251.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_410251", "410251042", "story_v_out_410251.awb")

						arg_177_1:RecordAudio("410251042", var_180_9)
						arg_177_1:RecordAudio("410251042", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_410251", "410251042", "story_v_out_410251.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_410251", "410251042", "story_v_out_410251.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_10 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_10 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_10

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_10 and arg_177_1.time_ < var_180_0 + var_180_10 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play410251043 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 410251043
		arg_181_1.duration_ = 6.733

		local var_181_0 = {
			ja = 6.733,
			CriLanguages = 4.5,
			zh = 4.5
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play410251044(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.4

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[600].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, true)
				arg_181_1.iconController_:SetSelectedState("hero")

				arg_181_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4032")

				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(410251043)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 16
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251043", "story_v_out_410251.awb") ~= 0 then
					local var_184_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251043", "story_v_out_410251.awb") / 1000

					if var_184_8 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_0
					end

					if var_184_3.prefab_name ~= "" and arg_181_1.actors_[var_184_3.prefab_name] ~= nil then
						local var_184_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_3.prefab_name].transform, "story_v_out_410251", "410251043", "story_v_out_410251.awb")

						arg_181_1:RecordAudio("410251043", var_184_9)
						arg_181_1:RecordAudio("410251043", var_184_9)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_410251", "410251043", "story_v_out_410251.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_410251", "410251043", "story_v_out_410251.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_10 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_10 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_10

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_10 and arg_181_1.time_ < var_184_0 + var_184_10 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play410251044 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 410251044
		arg_185_1.duration_ = 7.1

		local var_185_0 = {
			ja = 7.1,
			CriLanguages = 4.633,
			zh = 4.633
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play410251045(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.35

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[600].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, true)
				arg_185_1.iconController_:SetSelectedState("hero")

				arg_185_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4032")

				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(410251044)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 14
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410251", "410251044", "story_v_out_410251.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_410251", "410251044", "story_v_out_410251.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_410251", "410251044", "story_v_out_410251.awb")

						arg_185_1:RecordAudio("410251044", var_188_9)
						arg_185_1:RecordAudio("410251044", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_410251", "410251044", "story_v_out_410251.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_410251", "410251044", "story_v_out_410251.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_10 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_10 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_10

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_10 and arg_185_1.time_ < var_188_0 + var_188_10 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play410251045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 410251045
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play410251046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 1

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_2 = arg_189_1:GetWordFromCfg(410251045)
				local var_192_3 = arg_189_1:FormatText(var_192_2.content)

				arg_189_1.text_.text = var_192_3

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_4 = 40
				local var_192_5 = utf8.len(var_192_3)
				local var_192_6 = var_192_4 <= 0 and var_192_1 or var_192_1 * (var_192_5 / var_192_4)

				if var_192_6 > 0 and var_192_1 < var_192_6 then
					arg_189_1.talkMaxDuration = var_192_6

					if var_192_6 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_6 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_3
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_7 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_7 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_7

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_7 and arg_189_1.time_ < var_192_0 + var_192_7 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play410251046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 410251046
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
			arg_193_1.auto_ = false
		end

		function arg_193_1.playNext_(arg_195_0)
			arg_193_1.onStoryFinished_()
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.85

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_2 = arg_193_1:GetWordFromCfg(410251046)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 34
				local var_196_5 = utf8.len(var_196_3)
				local var_196_6 = var_196_4 <= 0 and var_196_1 or var_196_1 * (var_196_5 / var_196_4)

				if var_196_6 > 0 and var_196_1 < var_196_6 then
					arg_193_1.talkMaxDuration = var_196_6

					if var_196_6 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_6 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_3
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_7 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_7 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_7

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_7 and arg_193_1.time_ < var_196_0 + var_196_7 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST62",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/LZ0208"
	},
	voices = {
		"story_v_out_410251.awb"
	}
}
